Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3646B217E09
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbgGHESv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHESv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:18:51 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3921CC061755;
        Tue,  7 Jul 2020 21:18:51 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 1so1687645pfn.9;
        Tue, 07 Jul 2020 21:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pJ1ZG/ZY1VkKHSFFPRUzKrl5XSJPkHZjLaEi7PJyJ2M=;
        b=NtN9+VRBDAWSCGGwCIwOQywsOsosAMNwpvy8//7p+Jmi4/znX/3fFHA9MiLMxb029f
         E/XOyArjSZzDQyNomp5Q/2RyeuR/+vrDuFIHG4Wji8cLATqsaJ4ej8G3gCKmMYb//C0X
         QMZYMR9nIS7lnIf3Cak7y0qy4AFacxIW4DBI883lsd1tuvqFSpWHtsqgzf5PwIKc68YX
         t8UGhYJLHCfOjMN3Zd7egNb14qPJCD+U3tETuOzzjvUOHlAgNiCoBwbAjz3Wz/dDWuuv
         T9KCn6MX4JAxzw3IsMVU5r7vUikzNE/kyAHbQrxsIEjwV2G0F2+hWWbcwdTUB4wIN0Ez
         U1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pJ1ZG/ZY1VkKHSFFPRUzKrl5XSJPkHZjLaEi7PJyJ2M=;
        b=PICuTya2zWxDgD8Lq/WXhS9vLOf3VabRQ87LOeJvWa/7WdW2/rivQlQx7gqJzAkRmJ
         MKz1jjjVL8n8RULxHiDg4AulTvlQs+YCXIrbM4qce6cQSH63IDZLZoN1xEaHZckuCivu
         G0LzFSNg3khs5SrbHR/3vDBaHktH6KWc2ZrNqxGslL9YS4pdExFyGstLHHbDojndkZjI
         VgANFyqHLZQ+PN6QCQRVzc0xl3huRk1y9jK8iYolZYlUcNumwBVIGJsnRdATBqEwbXIt
         0woD0MdHZLTyd1COrIT3HRp8eRk2eSwfnRfF4Ps/UeLZzzRbreXxUY1knijNr4UazKTq
         IuBA==
X-Gm-Message-State: AOAM532NpNZD8fe+RlFE45whS1ReeY8+GFx0LF5rdvg2CNOajv7bpWt4
        /Ibn8smii9ls8Lk3AHXy9hik7D7j
X-Google-Smtp-Source: ABdhPJwhys9r4MgfR8ld5tIv5XYhhHIb63NdGbObUhqxaDKcSurE+uhj62mrKG9J/F37Ah6Pj5nn6A==
X-Received: by 2002:a05:6a00:2c1:: with SMTP id b1mr40043215pft.159.1594181930270;
        Tue, 07 Jul 2020 21:18:50 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:18:48 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 03/17] gpiolib: cdev: minor indentation fixes
Date:   Wed,  8 Jul 2020 12:15:46 +0800
Message-Id: <20200708041600.768775-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make indentation consistent with other use to improve readability.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 55a9b7b44304..889ed2dc9e58 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -98,7 +98,7 @@ static int linehandle_validate_flags(u32 flags)
 	/* Only one bias flag can be set. */
 	if (((flags & GPIOHANDLE_REQUEST_BIAS_DISABLE) &&
 	     (flags & (GPIOHANDLE_REQUEST_BIAS_PULL_DOWN |
-			GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
+		       GPIOHANDLE_REQUEST_BIAS_PULL_UP))) ||
 	    ((flags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN) &&
 	     (flags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)))
 		return -EINVAL;
@@ -212,11 +212,11 @@ static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 
 		/* Reuse the array setting function */
 		return gpiod_set_array_value_complex(false,
-					      true,
-					      lh->numdescs,
-					      lh->descs,
-					      NULL,
-					      vals);
+						     true,
+						     lh->numdescs,
+						     lh->descs,
+						     NULL,
+						     vals);
 	} else if (cmd == GPIOHANDLE_SET_CONFIG_IOCTL) {
 		return linehandle_set_config(lh, ip);
 	}
@@ -225,7 +225,7 @@ static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 
 #ifdef CONFIG_COMPAT
 static long linehandle_ioctl_compat(struct file *filep, unsigned int cmd,
-			     unsigned long arg)
+				    unsigned long arg)
 {
 	return linehandle_ioctl(filep, cmd, (unsigned long)compat_ptr(arg));
 }
@@ -428,7 +428,7 @@ struct lineevent_state {
 	GPIOEVENT_REQUEST_FALLING_EDGE)
 
 static __poll_t lineevent_poll(struct file *filep,
-				   struct poll_table_struct *wait)
+			       struct poll_table_struct *wait)
 {
 	struct lineevent_state *le = filep->private_data;
 	__poll_t events = 0;
@@ -720,11 +720,11 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	/* Request a thread to read the events */
 	ret = request_threaded_irq(le->irq,
-			lineevent_irq_handler,
-			lineevent_irq_thread,
-			irqflags,
-			le->label,
-			le);
+				   lineevent_irq_handler,
+				   lineevent_irq_thread,
+				   irqflags,
+				   le->label,
+				   le);
 	if (ret)
 		goto out_free_desc;
 
@@ -1052,7 +1052,7 @@ static ssize_t lineinfo_watch_read(struct file *filep, char __user *buf,
 static int gpio_chrdev_open(struct inode *inode, struct file *filp)
 {
 	struct gpio_device *gdev = container_of(inode->i_cdev,
-					      struct gpio_device, chrdev);
+						struct gpio_device, chrdev);
 	struct gpio_chardev_data *priv;
 	int ret = -ENOMEM;
 
-- 
2.27.0

