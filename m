Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C34B327A69
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 10:07:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbhCAJGN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 04:06:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:38038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233698AbhCAJFt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Mar 2021 04:05:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F47164DD0;
        Mon,  1 Mar 2021 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614589508;
        bh=rvD6Og3rqMKfJOFjvdy0rWdmzsvs8Xe8fGn3WwO5QKI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L6WarvySsXUtX/+T8zMSEzobUepKWJuKdjEaFW3yvmFLW/7GEyzT9O3fCKCmLDaHl
         DSk+Y9c+XkbsrDYoCUl5M5MPnLU5edGM8T+OaC5l+CdFd8CIerzAgxDlDI1lX2YuaD
         UxXqynpxMH9lAdjFRt1sIwlogFCztk9O7RK1o50TJbXQOooEli8VWq7ur0CBhX218t
         tCraARMPM2dUxKn9fvRZFHI0GPY27m5JMeAxYtjUFHs4hETO7qhpSOlQ2X/+25gj1T
         Ys41JWchsdvvkRldwU1pzCvx7aNpPFbQ22EqE0yjuAy6eceOvH9HcD/7W2czE7RDBU
         kRbhCThuxy+oA==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lGeUY-0006pJ-5i; Mon, 01 Mar 2021 10:05:26 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        syzbot+d27b4c8adbbff70fbfde@syzkaller.appspotmail.com
Subject: [PATCH v2 1/2] gpio: fix NULL-deref-on-deregistration regression
Date:   Mon,  1 Mar 2021 10:05:18 +0100
Message-Id: <20210301090519.26192-2-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210301090519.26192-1-johan@kernel.org>
References: <20210301090519.26192-1-johan@kernel.org>
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
 drivers/gpio/gpiolib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index adf55db080d8..6e0572515d02 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -474,7 +474,7 @@ EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
 
 static void gpiodevice_release(struct device *dev)
 {
-	struct gpio_device *gdev = dev_get_drvdata(dev);
+	struct gpio_device *gdev = container_of(dev, struct gpio_device, dev);
 
 	list_del(&gdev->list);
 	ida_free(&gpio_ida, gdev->id);
@@ -605,7 +605,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		goto err_free_ida;
 
 	device_initialize(&gdev->dev);
-	dev_set_drvdata(&gdev->dev, gdev);
 	if (gc->parent && gc->parent->driver)
 		gdev->owner = gc->parent->driver->owner;
 	else if (gc->owner)
-- 
2.26.2

