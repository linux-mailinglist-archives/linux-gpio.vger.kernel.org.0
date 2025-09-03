Return-Path: <linux-gpio+bounces-25452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1220B41799
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 97CFF4E4994
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA032EB5A2;
	Wed,  3 Sep 2025 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="arHdQBdE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5951D2E8E11
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886432; cv=none; b=qmUKWk3PalgfFpyVK8q/EUVwBLL14bKQB8W7NfTfeNGTFifkaEFC8UNT93K38vqvBqeY/GQtvrTzEFknWT6xjH37Nh+dQ6gnnEErvf0Y1jgqzpqTMAxdV5hw/LPrpc2A6St5AM4KGyrPH58l80MmBz/qUrcL5PCYzuruCFOcdB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886432; c=relaxed/simple;
	bh=3vDdzVPFT4wpbEOIKni3Q53zP4a27+W6novBAExis5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c1cgBI9MFdFm6BmoCsBWgbZvCp9kkwDm8IqwwgHceTu4cXcGGJhX7UTzr82nD8lZlMNeykla3F5Y/ieR3sOa1wxsmiOBk7Aw6y9UFjsBlb/hJmd/TLLSiiqYm7LvT7nMlZOzAGtJ6T5cx6rxAjuo1v6iWId8pmMkGd1Bcg6bp0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=arHdQBdE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45cb5492350so3371615e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 01:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886429; x=1757491229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnCK+4GcmtUWl9DLQFGW+1eBeOCL1T5Ocq961UWj+Gc=;
        b=arHdQBdEuFoUEGufb60EYa8Ix/AMWYDQZA7c0mMO6RlJVBeHBOk8Lq7SddfwaddfK0
         JHKgk9S/6k4Nc6G8qdUz1QcYx1AH/aBuJptHCTRdAiqH2lBbI5AHeH5MdF3Zwg9hfv5U
         tCwQlsgtxWPJIl1RJM1pkBFkNntr/0qDwi0TIBfSs20xx7a/6iiWkBtC9wxN70OZtEvP
         makPoeHo7iquyjUbluiNtezPBkUWe19WxbdUjQVmCAqEBsRYmVqEKORVnJi0QZN8djIo
         +/+PjZacyrNB5HAIGgQ4CmEXrB8hrCrhd4g4lIyuF0Yt/sOlDwrNHsIeD4V4Rr+B6Ajw
         +cCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886429; x=1757491229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnCK+4GcmtUWl9DLQFGW+1eBeOCL1T5Ocq961UWj+Gc=;
        b=VB54v9hKvAVnehOFkwniahMay43Epb4wz239oovvSXSlLduwkWmUmvO0nCNIQO7Bx2
         oGucQWYKwT+6lQzCaeWaOf/oSQ/lpvHUtHfkmjUZEovb/M+HzOi2kzTF8dRgBgWYVHJu
         eLCZAdCIK7dhZD7Z+r/L6IIuKMYHxX0hs6N90PATOOgT+K8P0lei5uzAtlQUtw4Y7nMW
         h5u3wSuDyh3/KbwVcVleiv1ZQpmslNzuq+UPrlIgFHyUXGH0Cc8b+/uXfM6Z82RLxOBG
         PKt2V+Zpigu8i3ysEUoWVs9B3Jjsy705M1Efjf42fOm1lPLz5JPcoPqXgVIk06TUxtWj
         h4bw==
X-Gm-Message-State: AOJu0Yy9+tIYC+3XSWbVH5kg2tncs3mzMCAWkx/9FUc04FNZVgig7d1+
	/x4m272tBgbUO3noN2HZ30jkSA52nifgMLO9clcSk7lownAd5lKDsau+vl2w7vNgAQ0=
X-Gm-Gg: ASbGnct9tWUVgj2WdfSYtJWUW4oCK4WLvpENWTOYrK+g5CMH3yHQZwWtTHRYe0oAWGi
	PHyGV964UWbNWxICVJXXY3HYzSBFJ3JvKsipu8oWeNVckO9MQ8cXYcpf0IDixjP0vcbW5U7V5wj
	1qfDueDnjHCT0sgj7sREGPiUxgVx6rfUybAUZ1NVHn9RrSnX6vOPlTz5fayvDdKoDdsgRIE5OjS
	643WUDt9Y+hPv6f4dsx37QFMcpF2MZMLl5kHoTegpPZpuwbJB4O+TXi98BCQqwImpZrXOBNLO5K
	nD76v0K2mZf2lRyashdWezbxct0LO6gA68x/e+eUgA2sYgVy0Z6EEkMwoAZ4yKOmLCLBKDA8aHq
	76I938F0nc1TYFPQx/Ze/EZ8AVWw=
X-Google-Smtp-Source: AGHT+IE8VpkQ9cPsjhCBKghShX0Bl86iztiD15845yI63ssB39+OiqSQqOV8L5+iSxUO0uLkiZ8Vkw==
X-Received: by 2002:a05:600c:3b1f:b0:458:b7d1:99f9 with SMTP id 5b1f17b1804b1-45b87bf22ecmr114918845e9.11.1756886428337;
        Wed, 03 Sep 2025 01:00:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:11 +0200
Subject: [PATCH 07/12] gpio: tb10x: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-7-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5920;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LEfQoq/BGGaE4EFy3J9Er3X0SX0E/ULNzxMEYdtgsLk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WSJxSeZd8tGawqeqLKQYFSa+dWYjIv4dw6W
 zAqDihhEeeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kgAKCRARpy6gFHHX
 cibjD/91jPhdREz7ITpTc4Bx2jp/TVrMaWDc8rjbdLj7Db9CBR3YfOU1BkXTOMjss1kF+cxJRxY
 /rBQwdz1nHMtjBCIEYK0fpZCSXAe3HEUf4Xgf4WN6eHtD7xlySRfp7FtAEaoAVXEKzYpgvCbPec
 iMVPgcTDQfOGnDTaCEC7qcn/qHUsAw9AjEN9RP9YYVh3iQNoSAzlG3sGyp27iSqXkCnBmQq/ZZA
 +Jh0XUm7PUqunAil9Ychwag0TE03hvSGdgICXuVf+hYqLAtqexOyd8jwdwX1va8w7PeeQFHqR5m
 1UxnycC034tJ1FgNc/rOxazX9X5xDsstiMRaEEFc7psWaxrG5kXknRGZLSkyMGsqPKN3wjjpqOA
 bSUhpEaMmfRdZKi3b+h7rZTxY4OJYJNewoKdw2GU6iWoZBZUBl9xrPTSw6MSxFywyuo6Iel8+iq
 Uofkcg6elIP0YuIbDScyRC8YzH6OCd1iIEDgcf2ev7OcaskvPLlgTEvZ04IPWI0ERmXxS+DayXW
 S6vByR80LiXFoLpXiGHJbH85u6Qe5kFdcxkBVnc63nXNaK55jp0QYFUO+XHl24G6yBolOJxXQHJ
 cSOB+qQf6pdOVXorwlrQUXtyVv9Nf1sfnWntJ4WZYyPHlv+45cJawr2kKMMcPH5tgu/gKmjKOOT
 VZqUiuxejp6XHIQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tb10x.c | 60 +++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 356d0a82e25f29f60c43801cee6c6803ea7a22c2..f20b6654b865555579bb356a336308e23b0e5af6 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -20,7 +21,6 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/spinlock.h>
 
 #define TB10X_GPIO_DIR_IN	(0x00000000)
 #define TB10X_GPIO_DIR_OUT	(0x00000001)
@@ -36,13 +36,13 @@
  * @base: register base address
  * @domain: IRQ domain of GPIO generated interrupts managed by this controller
  * @irq: Interrupt line of parent interrupt controller
- * @gc: gpio_chip structure associated to this GPIO controller
+ * @chip: Generic GPIO chip structure associated with this GPIO controller
  */
 struct tb10x_gpio {
 	void __iomem *base;
 	struct irq_domain *domain;
 	int irq;
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 };
 
 static inline u32 tb10x_reg_read(struct tb10x_gpio *gpio, unsigned int offs)
@@ -60,16 +60,13 @@ static inline void tb10x_set_bits(struct tb10x_gpio *gpio, unsigned int offs,
 				u32 mask, u32 val)
 {
 	u32 r;
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gpio->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&gpio->chip);
 
 	r = tb10x_reg_read(gpio, offs);
 	r = (r & ~mask) | (val & mask);
 
 	tb10x_reg_write(gpio, offs, r);
-
-	raw_spin_unlock_irqrestore(&gpio->gc.bgpio_lock, flags);
 }
 
 static int tb10x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
@@ -107,6 +104,7 @@ static irqreturn_t tb10x_gpio_irq_cascade(int irq, void *data)
 
 static int tb10x_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct tb10x_gpio *tb10x_gpio;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
@@ -127,9 +125,9 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(tb10x_gpio->base))
 		return PTR_ERR(tb10x_gpio->base);
 
-	tb10x_gpio->gc.label =
+	tb10x_gpio->chip.gc.label =
 		devm_kasprintf(dev, GFP_KERNEL, "%pOF", pdev->dev.of_node);
-	if (!tb10x_gpio->gc.label)
+	if (!tb10x_gpio->chip.gc.label)
 		return -ENOMEM;
 
 	/*
@@ -137,29 +135,30 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 	 * the lines, no special set or clear registers and a data direction register
 	 * wher 1 means "output".
 	 */
-	ret = bgpio_init(&tb10x_gpio->gc, dev, 4,
-			 tb10x_gpio->base + OFFSET_TO_REG_DATA,
-			 NULL,
-			 NULL,
-			 tb10x_gpio->base + OFFSET_TO_REG_DDR,
-			 NULL,
-			 0);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = tb10x_gpio->base + OFFSET_TO_REG_DATA,
+		.dirout = tb10x_gpio->base + OFFSET_TO_REG_DDR,
+	};
+
+	ret = gpio_generic_chip_init(&tb10x_gpio->chip, &config);
 	if (ret) {
 		dev_err(dev, "unable to init generic GPIO\n");
 		return ret;
 	}
-	tb10x_gpio->gc.base = -1;
-	tb10x_gpio->gc.parent = dev;
-	tb10x_gpio->gc.owner = THIS_MODULE;
+	tb10x_gpio->chip.gc.base = -1;
+	tb10x_gpio->chip.gc.parent = dev;
+	tb10x_gpio->chip.gc.owner = THIS_MODULE;
 	/*
-	 * ngpio is set by bgpio_init() but we override it, this .request()
-	 * callback also overrides the one set up by generic GPIO.
+	 * ngpio is set by gpio_generic_chip_init() but we override it, this
+	 * .request() callback also overrides the one set up by generic GPIO.
 	 */
-	tb10x_gpio->gc.ngpio = ngpio;
-	tb10x_gpio->gc.request = gpiochip_generic_request;
-	tb10x_gpio->gc.free = gpiochip_generic_free;
+	tb10x_gpio->chip.gc.ngpio = ngpio;
+	tb10x_gpio->chip.gc.request = gpiochip_generic_request;
+	tb10x_gpio->chip.gc.free = gpiochip_generic_free;
 
-	ret = devm_gpiochip_add_data(dev, &tb10x_gpio->gc, tb10x_gpio);
+	ret = devm_gpiochip_add_data(dev, &tb10x_gpio->chip.gc, tb10x_gpio);
 	if (ret < 0) {
 		dev_err(dev, "Could not add gpiochip.\n");
 		return ret;
@@ -174,7 +173,7 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 		if (ret < 0)
 			return ret;
 
-		tb10x_gpio->gc.to_irq	= tb10x_gpio_to_irq;
+		tb10x_gpio->chip.gc.to_irq = tb10x_gpio_to_irq;
 		tb10x_gpio->irq		= ret;
 
 		ret = devm_request_irq(dev, ret, tb10x_gpio_irq_cascade,
@@ -183,14 +182,15 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 		if (ret != 0)
 			return ret;
 
-		tb10x_gpio->domain = irq_domain_create_linear(dev_fwnode(dev), tb10x_gpio->gc.ngpio,
+		tb10x_gpio->domain = irq_domain_create_linear(dev_fwnode(dev),
+							      tb10x_gpio->chip.gc.ngpio,
 							      &irq_generic_chip_ops, NULL);
 		if (!tb10x_gpio->domain) {
 			return -ENOMEM;
 		}
 
 		ret = irq_alloc_domain_generic_chips(tb10x_gpio->domain,
-				tb10x_gpio->gc.ngpio, 1, tb10x_gpio->gc.label,
+				tb10x_gpio->chip.gc.ngpio, 1, tb10x_gpio->chip.gc.label,
 				handle_edge_irq, IRQ_NOREQUEST, IRQ_NOPROBE,
 				IRQ_GC_INIT_MASK_CACHE);
 		if (ret)
@@ -218,9 +218,9 @@ static void tb10x_gpio_remove(struct platform_device *pdev)
 {
 	struct tb10x_gpio *tb10x_gpio = platform_get_drvdata(pdev);
 
-	if (tb10x_gpio->gc.to_irq) {
+	if (tb10x_gpio->chip.gc.to_irq) {
 		irq_remove_generic_chip(tb10x_gpio->domain->gc->gc[0],
-					BIT(tb10x_gpio->gc.ngpio) - 1, 0, 0);
+					BIT(tb10x_gpio->chip.gc.ngpio) - 1, 0, 0);
 		kfree(tb10x_gpio->domain->gc);
 		irq_domain_remove(tb10x_gpio->domain);
 	}

-- 
2.48.1


