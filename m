Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7566532646B
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Feb 2021 15:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhBZOzn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Feb 2021 09:55:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:52630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229769AbhBZOzn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 26 Feb 2021 09:55:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D360464E20;
        Fri, 26 Feb 2021 14:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614351303;
        bh=PhR9gkTNFpRiPjJK44jCN9ors5BE/Ib0psiXx2bqJ/4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WB8CwCq8x5mC1s6JOqAuDy8bLQeaYfuztxMoZI8I6uWoN5zzI5fMvbBsiOfMjeorL
         GSby4P4S3SNzU36de3iQE+2oUqU3XMSTK1j0qXd/xPaAl9EVSD6YYAMct9OKbioFe1
         iQD41d6ORw9EtuCee44k6Q6TM/jspZWXwo3kkYkj/6pZLpBKJxW8yPiDy4XEdPcj6p
         iDylENLoylWRbwEBVYRoy+4mKgG5BNOIYEGI4rB711a97WtGseTgKe1FkJBDFhOGRT
         CROIL2CgYzH5BTz9ebF06cbU53c9Voea9GtfBnKRfjk3zajdjopC2OIma3fXVPQ78s
         w1BLl8Pb4E0jg==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lFeWZ-0000K1-Cl; Fri, 26 Feb 2021 15:55:23 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        syzbot+d27b4c8adbbff70fbfde@syzkaller.appspotmail.com
Subject: [PATCH 1/2] gpio: fix NULL-deref-on-deregistration regression
Date:   Fri, 26 Feb 2021 15:52:45 +0100
Message-Id: <20210226145246.1171-2-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226145246.1171-1-johan@kernel.org>
References: <20210226145246.1171-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix a NULL-pointer deference when deregistering the gpio character
device that was introduced by the recent stub-driver hack. When the new
"driver" is unbound as part of deregistration, driver core clears the
driver-data pointer which is used to retrieve the struct gpio_device in
its release callback.

Fix this by using container_of() in the release callback as should have
been done all along.

Fixes: 4731210c09f5 ("gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default")
Cc: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reported-by: syzbot+d27b4c8adbbff70fbfde@syzkaller.appspotmail.com
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index adf55db080d8..e1016bc8cf14 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -474,7 +474,7 @@ EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
 
 static void gpiodevice_release(struct device *dev)
 {
-	struct gpio_device *gdev = dev_get_drvdata(dev);
+	struct gpio_device *gdev = container_of(dev, struct gpio_device, dev);
 
 	list_del(&gdev->list);
 	ida_free(&gpio_ida, gdev->id);
-- 
2.26.2

