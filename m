Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA92613586F
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 12:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729532AbgAILuh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 06:50:37 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46462 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729126AbgAILuW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 06:50:22 -0500
Received: by mail-wr1-f65.google.com with SMTP id z7so6998424wrl.13
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jan 2020 03:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dN7BC78Et1/WtU9AfhINNji0d8Qok1cjKZZH7ozfCDA=;
        b=YHQt+wdHTG0y1FPju1Gv7ptkbxnh36OU2vCoCpI13WJlQPB2c66f2nDiRE+FJSpKcF
         6y7LIkueS0HWwWkrqSA63UekPgR4Cg3NhcT67G5kaeh8J32hbp7JOyEYWX6ciuMSdA3L
         rjgo3fgzt2kd/lOMLnUpZMODg3JGZ4C8Lzb5YwRaovy+XA0cz/KCKvExqAkTw0mMt4g7
         I5OUnabVoKuPRzJyLDMf2GrY8q8gZryohq1WZNiV8Comtq8pfpfBxz1WbK1Qd0ewZNVp
         y4LEHWwUtMEdsJoPIKpzI1qmGFrqSo+6PW4p8xAIccSX3l10krj7xQ3m4jb8U0KNGuS8
         UxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dN7BC78Et1/WtU9AfhINNji0d8Qok1cjKZZH7ozfCDA=;
        b=c2WI6drarhXZVxp4mXU1hS7s0a5yfdwS8ftv46YDlsZoYIGskS6SMDuIZBDudTMk2r
         erpDlvEdCNM90ppnbs3WSJJcsuGjDz5MkhPuayNU1x5mIB9tscAIKkU6nqL88onbwaWK
         IWomDgkdhiPIM6XUYARZ/qiIZqZb2UUfchuRtkZrtTDoDg6bHsZwnfjFHXNBLA4/bTO7
         moUGEYpqytFmhuVaxaLaY3rilsPWAoBEe2jS45Jq2+4ppaEFTIyHfeiofgov8qBBxEIP
         szSUWmNKwziWgjC3Nvj+nbpf1R3e71U/7U/H7jTo8BuF7dwOV+bkw1sNAWyW/Bspdzj0
         TxWA==
X-Gm-Message-State: APjAAAXDvh1ZLcyG5E3G78fECxz2ZsNxLfMrCkYQzHjwXD1pdiZNtAOv
        vg3UzW0k4BEqBm1Xud3rBnKmuA==
X-Google-Smtp-Source: APXvYqy0MEzvjy+aJtLYcic9hQ7b4x+4i7ptWYsKLoGRfulhrckZLCzfo9bcfPQR1jlyBISWcUkMvQ==
X-Received: by 2002:a5d:44cd:: with SMTP id z13mr10639703wrr.104.1578570620777;
        Thu, 09 Jan 2020 03:50:20 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u16sm2574979wmj.41.2020.01.09.03.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 03:50:20 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 5/7] gpiolib: provide a dedicated function for setting lineinfo
Date:   Thu,  9 Jan 2020 12:50:08 +0100
Message-Id: <20200109115010.27814-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200109115010.27814-1-brgl@bgdev.pl>
References: <20200109115010.27814-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We'll soon be filling out the gpioline_info structure in multiple
places. Add a separate function that given a gpio_desc sets all relevant
fields.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 98 ++++++++++++++++++++++++------------------
 1 file changed, 55 insertions(+), 43 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6b5d102dfb13..00c1fce3c651 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1156,6 +1156,60 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	return ret;
 }
 
+static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
+				  struct gpioline_info *info)
+{
+	struct gpio_chip *chip = desc->gdev->chip;
+	unsigned long flags;
+
+	spin_lock_irqsave(&gpio_lock, flags);
+
+	if (desc->name) {
+		strncpy(info->name, desc->name, sizeof(info->name));
+		info->name[sizeof(info->name) - 1] = '\0';
+	} else {
+		info->name[0] = '\0';
+	}
+
+	if (desc->label) {
+		strncpy(info->consumer, desc->label, sizeof(info->consumer));
+		info->consumer[sizeof(info->consumer) - 1] = '\0';
+	} else {
+		info->consumer[0] = '\0';
+	}
+
+	/*
+	 * Userspace only need to know that the kernel is using this GPIO so
+	 * it can't use it.
+	 */
+	info->flags = 0;
+	if (test_bit(FLAG_REQUESTED, &desc->flags) ||
+	    test_bit(FLAG_IS_HOGGED, &desc->flags) ||
+	    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
+	    test_bit(FLAG_EXPORT, &desc->flags) ||
+	    test_bit(FLAG_SYSFS, &desc->flags) ||
+	    !pinctrl_gpio_can_use_line(chip->base + info->line_offset))
+		info->flags |= GPIOLINE_FLAG_KERNEL;
+	if (test_bit(FLAG_IS_OUT, &desc->flags))
+		info->flags |= GPIOLINE_FLAG_IS_OUT;
+	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
+		info->flags |= GPIOLINE_FLAG_ACTIVE_LOW;
+	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
+		info->flags |= (GPIOLINE_FLAG_OPEN_DRAIN |
+				GPIOLINE_FLAG_IS_OUT);
+	if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
+		info->flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
+				GPIOLINE_FLAG_IS_OUT);
+	if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
+		info->flags |= GPIOLINE_FLAG_BIAS_DISABLE;
+	if (test_bit(FLAG_PULL_DOWN, &desc->flags))
+		info->flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
+	if (test_bit(FLAG_PULL_UP, &desc->flags))
+		info->flags |= GPIOLINE_FLAG_BIAS_PULL_UP;
+
+	spin_unlock_irqrestore(&gpio_lock, flags);
+}
+
 /*
  * gpio_ioctl() - ioctl handler for the GPIO chardev
  */
@@ -1196,49 +1250,7 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
-		if (desc->name) {
-			strncpy(lineinfo.name, desc->name,
-				sizeof(lineinfo.name));
-			lineinfo.name[sizeof(lineinfo.name)-1] = '\0';
-		} else {
-			lineinfo.name[0] = '\0';
-		}
-		if (desc->label) {
-			strncpy(lineinfo.consumer, desc->label,
-				sizeof(lineinfo.consumer));
-			lineinfo.consumer[sizeof(lineinfo.consumer)-1] = '\0';
-		} else {
-			lineinfo.consumer[0] = '\0';
-		}
-
-		/*
-		 * Userspace only need to know that the kernel is using
-		 * this GPIO so it can't use it.
-		 */
-		lineinfo.flags = 0;
-		if (test_bit(FLAG_REQUESTED, &desc->flags) ||
-		    test_bit(FLAG_IS_HOGGED, &desc->flags) ||
-		    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
-		    test_bit(FLAG_EXPORT, &desc->flags) ||
-		    test_bit(FLAG_SYSFS, &desc->flags) ||
-		    !pinctrl_gpio_can_use_line(chip->base + lineinfo.line_offset))
-			lineinfo.flags |= GPIOLINE_FLAG_KERNEL;
-		if (test_bit(FLAG_IS_OUT, &desc->flags))
-			lineinfo.flags |= GPIOLINE_FLAG_IS_OUT;
-		if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
-			lineinfo.flags |= GPIOLINE_FLAG_ACTIVE_LOW;
-		if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
-			lineinfo.flags |= (GPIOLINE_FLAG_OPEN_DRAIN |
-					   GPIOLINE_FLAG_IS_OUT);
-		if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
-			lineinfo.flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
-					   GPIOLINE_FLAG_IS_OUT);
-		if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
-			lineinfo.flags |= GPIOLINE_FLAG_BIAS_DISABLE;
-		if (test_bit(FLAG_PULL_DOWN, &desc->flags))
-			lineinfo.flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
-		if (test_bit(FLAG_PULL_UP, &desc->flags))
-			lineinfo.flags |= GPIOLINE_FLAG_BIAS_PULL_UP;
+		gpio_desc_to_lineinfo(desc, &lineinfo);
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
-- 
2.23.0

