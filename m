Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98F2F4A5DB
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 17:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729247AbfFRPuz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 11:50:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:36910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729246AbfFRPuz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Jun 2019 11:50:55 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84C4420673;
        Tue, 18 Jun 2019 15:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560873054;
        bh=jutWYyVVNd+zZuZVt/bF6vKFNeedNY8JMdZcOUf6FW8=;
        h=From:To:Cc:Subject:Date:From;
        b=HQ/ENC5zco3CLkDrLMfQbicDdWgzbakkGgjz3tR/5orBbEX5Y69Y1ZVwq31v9GGBG
         V+VxRtIUbVxxG97A84MPx4Xqyiwv6+rRIC4QfntDSL34Mp7o2WLQ+SXoB0PMuG49PK
         4CYop1GZZ979M5FNlEbshsh2p7CwaTH5DqAvLrbc=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     bamv2005@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 1/3] gpiolib: no need to cast away return value of debugfs_create_file()
Date:   Tue, 18 Jun 2019 17:50:45 +0200
Message-Id: <20190618155047.16894-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It is fine to ignore the return value (and encouraged), so need to cast
away the return value, you will not get a build warning at all.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e013d417a936..d378774d3456 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4805,8 +4805,8 @@ static const struct file_operations gpiolib_operations = {
 static int __init gpiolib_debugfs_init(void)
 {
 	/* /sys/kernel/debug/gpio */
-	(void) debugfs_create_file("gpio", S_IFREG | S_IRUGO,
-				NULL, NULL, &gpiolib_operations);
+	debugfs_create_file("gpio", S_IFREG | S_IRUGO, NULL, NULL,
+			    &gpiolib_operations);
 	return 0;
 }
 subsys_initcall(gpiolib_debugfs_init);
-- 
2.22.0

