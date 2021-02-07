Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC75C3122F7
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Feb 2021 10:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhBGJBi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Feb 2021 04:01:38 -0500
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:35393 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229548AbhBGJBi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Feb 2021 04:01:38 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R791e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UO3vykQ_1612688440;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UO3vykQ_1612688440)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sun, 07 Feb 2021 17:00:41 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     linus.walleij@linaro.org
Cc:     bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] gpiolib: cdev: convert stream-like files from
Date:   Sun,  7 Feb 2021 17:00:30 +0800
Message-Id: <1612688430-54282-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Eliminate the following coccicheck warning:
./drivers/gpio/gpiolib-cdev.c:2307:7-23: WARNING: gpio_fileops: .read()
has stream semantic; safe to change nonseekable_open -> stream_open.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpio/gpiolib-cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 1631727..bad68ef 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2304,7 +2304,7 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	get_device(&gdev->dev);
 	file->private_data = cdev;
 
-	ret = nonseekable_open(inode, file);
+	ret = stream_open(inode, file);
 	if (ret)
 		goto out_unregister_notifier;
 
-- 
1.8.3.1

