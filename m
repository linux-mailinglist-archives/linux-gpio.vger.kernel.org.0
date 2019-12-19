Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C922D1267D5
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 18:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfLSRPt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 12:15:49 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52902 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727137AbfLSRPt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 12:15:49 -0500
Received: by mail-wm1-f68.google.com with SMTP id p9so6238498wmc.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 09:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=izVdkb3B6fuklcEw/hV1XUazbmANjGDXpj//MuY0JEw=;
        b=lhPHcab9tWEUpr5zez2HKjQULIQKo5Si2e1x7Ov5RzMbFYiz2ld3ou8VTSix91i5UX
         IDWTvCrSzIXZMaOzLI52k9Kgl9pk6obwrzpD/1ep0EqDKZK5Xs0ZM3nuE2F407PI/0qb
         QH1NCPnFgNRIRVLwkHZPzSEUyTOPfIZpew1PFSmh3ZLFxuGIk79cOo2PjhUza9Du4b96
         WUcirheee76Zp4T19y53VKSGb1iKmBeuNInZXEqCsNJRVcPabXN0gTSAJDM289TJll6G
         mcgr9KW8H8W8f3bWSkfSpro7M7Bm2RioYzmlI+xB3pii+B86eLxRGxo2V/GPDeKZEN3o
         Q4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=izVdkb3B6fuklcEw/hV1XUazbmANjGDXpj//MuY0JEw=;
        b=otEGnftGSPueyjnCXZ+yvvsEgJwnoMwyIDhBTAHLXFY+UGu9IO5XlK4BZbznHFa5H5
         BVTxtBb2uElwvpWBxvVe+QCljpjMB2iIVvBwGZoV4IKQ1pxz8VmW9oEGRgtuKmysUj+L
         PpS0UZT+vq/7YfYI8CsHytIlgATPf2HBmwsQdX2/YtXDoeD3glodG0Jcc6wRSEp4LnLn
         AXaCOUL2+IQM4cKMyme0ui4rIwsMdQ7Hv54eLmKow9SL/5bI5HBsqDR2YAdu7IgpzqR+
         tr5H/L41mOeTdT+iXxJPjCtRXcnVOtQt3Dwp2m800eQQ8HS5ihrBdBGWO2uNsXBDIdkv
         QKyg==
X-Gm-Message-State: APjAAAVIegECNQ+Jl+ne6gTdc4Jlj9sVtZplRnswRThzInYbSRFfIsvE
        Sg1m7qKmJNtTMhmnXy01Sv4eGJUrDGk=
X-Google-Smtp-Source: APXvYqwwdo1gvGGraneMABLw6o9frhqNZr1r88X2HztSEReoffhx/278goQehYKrJ8cm1UbA7+AIlA==
X-Received: by 2002:a7b:c183:: with SMTP id y3mr11451806wmi.0.1576775747685;
        Thu, 19 Dec 2019 09:15:47 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id q6sm7401428wrx.72.2019.12.19.09.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 09:15:46 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 11/13] gpiolib: provide a dedicated function for setting lineinfo
Date:   Thu, 19 Dec 2019 18:15:26 +0100
Message-Id: <20191219171528.6348-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191219171528.6348-1-brgl@bgdev.pl>
References: <20191219171528.6348-1-brgl@bgdev.pl>
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
---
 drivers/gpio/gpiolib.c | 98 ++++++++++++++++++++++++------------------
 1 file changed, 55 insertions(+), 43 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e27cf2113fed..41abf17640de 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1149,6 +1149,60 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
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
@@ -1189,49 +1243,7 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
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

