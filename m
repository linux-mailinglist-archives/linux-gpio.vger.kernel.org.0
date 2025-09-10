Return-Path: <linux-gpio+bounces-25857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF22B50EE5
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 09:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EB4C1C22BCC
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 07:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB30630BB81;
	Wed, 10 Sep 2025 07:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D1JAYGsq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F25E30AD10
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 07:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488378; cv=none; b=gYhhCUM2R9A5Q46P9o9bFc/tq5KRuR/ZC/Y7Weg0j4rohekHRpN01iWfXfz/yi9Jmt8vMaJW7qdqEO08HgMy+JQRecBWsbZ54QwoB0WcDH0AHdJV96jQiFiR9W63lVWY1PxWfO/csuwbSdWHNEysk8caDrnawOdujmhDqjyf2hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488378; c=relaxed/simple;
	bh=6BcJ2wNnn7+9344lve621zPsJLd6dZP2xvZ20NQBs/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dlmCfEIB8Bp5GElBamp365PmV9JMmwJY3D/Lz6fFpgVAsKzvcb69LI4tdlBrh0WDLDNxfbJfSPTwV/kl0sUfzz8sWG4+gez/9eJInS0cUSWv2NMoSA5WHtgE25pw4/a4xlNfQhx8r2pH1VDikfOt0SpYBUHg7Ha4lzQp9z4sm3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D1JAYGsq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3e5190bca95so2499487f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 00:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488375; x=1758093175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoHSBIFEeLBOZNCXJbj9bZOS3XuoUnKsV8A51pLJiDI=;
        b=D1JAYGsq0qDXfwik0w9hfI6cV+cjuIdl3Jg7ScIS/6VKf/EZyEOl7/3KERBC/iXFGj
         Jq9h3+dLD/LqKrRs0/pS8DKD96beFqRbE/pTsthn2Aw58hGFD1JNCxytvyJ9N3DuWGaV
         tq42UrH5pQkg3nv+Xl0MBEjF2W1bB8l3DNmHf9Exv8kALw7KxMCU66YdhgkhFwGLIjEC
         yTFvSw80cI6DC5AzVacaEowfcfVIG416aRtD3qEfSLbRopw1ix5Pw82jX0LMpfvqgKtv
         8pZTeZjaGWor7wNu/sVjKGuJnDc5JGMBTPjVk17JR7NczRqz3Six+LrEydULkkNhc0/p
         sxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488375; x=1758093175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoHSBIFEeLBOZNCXJbj9bZOS3XuoUnKsV8A51pLJiDI=;
        b=NjgTO+3HBNgDPLCBeESzGmNaxQVygZSm7j+14TJVYX3ZeIA+ANHDuVb1J/KSjR1Gn+
         h0jYQXC8hIfIqMb5eUpVLmVSn6keEYcESI8HkuBZe5OQstBUvpOX8dLxSGWyuPGqu0k2
         rgL57qSNCHAL+nw9xCBhpg2JghM1T1KA4HY/waDHJ/s+pEZ+ZpNHAX59FApLdaN1hSTy
         JESgrYTEaR7xopqYw1DLqC5HXA3Qi2v1H/hpNNRJi81z7MOvwk2aS/oO9IJOW7sJuM6m
         HIAxSf6DIIU5oUBG6W0nihQCB4V/m9vbohOFmxrrG/INhIP7J+ZCZSzDI0LWy5d2f6xD
         YHSw==
X-Gm-Message-State: AOJu0Yyefc1RAOZuffFGkME4QgaNIrmvW2Z0HWxsXj7XJ5GnpiAiDlao
	DmSkebDQ+Jn92rn3hRTqNkIjlslRc/xMNMx15WtpCOHqOtAVA36NG66vbP2lby2Mj/I=
X-Gm-Gg: ASbGncs1S5qQfAQNW9nwdL0un5d7Hm9JMFiqTqmZhFahqwekNSRwR6/bamVg0NC0jEy
	avT+Q5Mh7l6y1vUI/aTfYVGM9iQS93H4W7AIcyxeH/d4auZFPthciTdbYKADWnejU1GUqX549gt
	5czAMIi6yPBFxj0qq5Z/qgeyVdvoNqONnOCSFz7xy7HmE7su8oiNVkCLjv1JKeDu1ShKzSpm9Of
	sktXSWxX+ZL2IEXzLJOZwaCLRUGn+sAQIXzPSQ1cYIR5wF6jfEa61GVyu8T0C0qNbLT+6N++sI/
	DK33vo0ujbZ3XbNU52Trln9xiRhQp8Okmi3tV6rK44D+1TfwNVEMgkUfPlWJo+wVTVlm+S4uFUp
	705Yo5IyOVF493HYF
X-Google-Smtp-Source: AGHT+IEUFZYCFWa4Vg9IIf0WX1fkQ0VP1XWAqmtS6KCEEWx+d3fiNITjlopSKB9UCn7bqfo0bZ5sfQ==
X-Received: by 2002:a5d:5f92:0:b0:3d7:2284:b20 with SMTP id ffacd0b85a97d-3e641e3cd77mr9427106f8f.3.1757488374606;
        Wed, 10 Sep 2025 00:12:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:12:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:38 +0200
Subject: [PATCH v2 02/15] gpio: loongson1: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-2-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3648;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mXA8fucd16pS17njrhUGHkfPQnMcfvAh6XNsIVsSGc8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTsJEThgpWEjpX0O+Hvu/Jn+X8WfnAtkM8ym
 hBLXZzzm0yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7AAKCRARpy6gFHHX
 corBEACss3BKerKFj+T8CMoaXJs6TyHDVfUdhVGM+YwgfV7kTPxeV8QeAOT7ix92YcO0oM/4F0O
 yxukhzUS6glD/mXz3WflqteyWAMmQvZjdBmTh8v5vL8q3T3kuk14kpVt1HVJXeFPvyI0CRqR8pB
 JW1sCfn55p37EH2RUCQWCvSJif1bSLcj37Aj5OzlVGxguVdwUeoJACj9akJQZeBSZChVbOJkcT2
 OWoZAaSpMPk2RWDn562byHhJyjkBMAvNOwVKBhUM/4IybIFd9zO6d42sU+vtdpeIMAmYydpMw4L
 966wVymZBBsYs9PbSBpMknd12tgFofJWr4TPKZ7HkMgd9TfR7pXupS3nJCnrD0gCf2lOjqugAZJ
 oKfXt79UnW+Ug3F2+WUnonzgr7AaOqYaZNkE/GmQNLx5FJka/gZou4DY0rQwZX2wBY0S8nmCA7a
 k5FlFyIpXjD0l2y2cGvs+drE4Y2i4T4TZ+lQK6yOloyilXvRkNXGorO5NxT7i3HJeJhToiO8zTH
 gSL+JbkWVgX2gju3aQewWAKHLYgviIypMX9YfRiIhNJ9nt5hjUYYqpbpT0bqQY0JWZzH3+wU9An
 qOLgV0vAbYXEmd4n64W+SH5DuEogfw/DDROuqPMFNTs98RDyUb1YX71hzgmjFDIoHR8EF0VnTkA
 k8NfF/8e7ov3brw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-loongson1.c | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-loongson1.c b/drivers/gpio/gpio-loongson1.c
index 6ca3b969db4df231517d021a7b4b5e3ddcf626f7..9750a7a175081781624a49a794926b3f1e45b4d2 100644
--- a/drivers/gpio/gpio-loongson1.c
+++ b/drivers/gpio/gpio-loongson1.c
@@ -5,10 +5,11 @@
  * Copyright (C) 2015-2023 Keguang Zhang <keguang.zhang@gmail.com>
  */
 
+#include <linux/bitops.h>
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/platform_device.h>
-#include <linux/bitops.h>
 
 /* Loongson 1 GPIO Register Definitions */
 #define GPIO_CFG		0x0
@@ -17,19 +18,18 @@
 #define GPIO_OUTPUT		0x30
 
 struct ls1x_gpio_chip {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *reg_base;
 };
 
 static int ls1x_gpio_request(struct gpio_chip *gc, unsigned int offset)
 {
 	struct ls1x_gpio_chip *ls1x_gc = gpiochip_get_data(gc);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ls1x_gc->chip);
+
 	__raw_writel(__raw_readl(ls1x_gc->reg_base + GPIO_CFG) | BIT(offset),
 		     ls1x_gc->reg_base + GPIO_CFG);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
 	return 0;
 }
@@ -37,16 +37,16 @@ static int ls1x_gpio_request(struct gpio_chip *gc, unsigned int offset)
 static void ls1x_gpio_free(struct gpio_chip *gc, unsigned int offset)
 {
 	struct ls1x_gpio_chip *ls1x_gc = gpiochip_get_data(gc);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ls1x_gc->chip);
+
 	__raw_writel(__raw_readl(ls1x_gc->reg_base + GPIO_CFG) & ~BIT(offset),
 		     ls1x_gc->reg_base + GPIO_CFG);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
 static int ls1x_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct ls1x_gpio_chip *ls1x_gc;
 	int ret;
@@ -59,29 +59,35 @@ static int ls1x_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(ls1x_gc->reg_base))
 		return PTR_ERR(ls1x_gc->reg_base);
 
-	ret = bgpio_init(&ls1x_gc->gc, dev, 4, ls1x_gc->reg_base + GPIO_DATA,
-			 ls1x_gc->reg_base + GPIO_OUTPUT, NULL,
-			 NULL, ls1x_gc->reg_base + GPIO_DIR, 0);
+	config = (struct gpio_generic_chip_config) {
+		.dev = dev,
+		.sz = 4,
+		.dat = ls1x_gc->reg_base + GPIO_DATA,
+		.set = ls1x_gc->reg_base + GPIO_OUTPUT,
+		.dirin = ls1x_gc->reg_base + GPIO_DIR,
+	};
+
+	ret = gpio_generic_chip_init(&ls1x_gc->chip, &config);
 	if (ret)
 		goto err;
 
-	ls1x_gc->gc.owner = THIS_MODULE;
-	ls1x_gc->gc.request = ls1x_gpio_request;
-	ls1x_gc->gc.free = ls1x_gpio_free;
+	ls1x_gc->chip.gc.owner = THIS_MODULE;
+	ls1x_gc->chip.gc.request = ls1x_gpio_request;
+	ls1x_gc->chip.gc.free = ls1x_gpio_free;
 	/*
 	 * Clear ngpio to let gpiolib get the correct number
 	 * by reading ngpios property
 	 */
-	ls1x_gc->gc.ngpio = 0;
+	ls1x_gc->chip.gc.ngpio = 0;
 
-	ret = devm_gpiochip_add_data(dev, &ls1x_gc->gc, ls1x_gc);
+	ret = devm_gpiochip_add_data(dev, &ls1x_gc->chip.gc, ls1x_gc);
 	if (ret)
 		goto err;
 
 	platform_set_drvdata(pdev, ls1x_gc);
 
 	dev_info(dev, "GPIO controller registered with %d pins\n",
-		 ls1x_gc->gc.ngpio);
+		 ls1x_gc->chip.gc.ngpio);
 
 	return 0;
 err:

-- 
2.48.1


