Return-Path: <linux-gpio+bounces-22068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E66A9AE668C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 15:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 487131722B1
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 13:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F502D1F44;
	Tue, 24 Jun 2025 13:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="j2q0x3e4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F122C3756
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 13:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771673; cv=none; b=rLC2YyV47MuUmcgR0CuNdo3n8M74HlIwshz37cP4YsDcOll9cnKVODBtJ+JDuAV0aBl40Tf7L7mns/5A3uCr+Hei9DxLfYY6MivSjToOZJ/93shSMyANLeGYS4As8FqJlgKl9lXyMsBDBqUlCzjw6wBYo5kdv7D+cvBPz9b3e9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771673; c=relaxed/simple;
	bh=UFfRQ2EJYA6t2/ihgwQbY8hF0TN3XoMYDsor98fDvRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BiaVT218YPBnkUAwpTxnvkdaxASEqv9hzFU6oBp4hfb9frMvkXNmbOSUiFo+caaK6ARs2zbl6HeocUiyyXQR5rm7LrtPzcavGI8pbUS2WJPNosf9rxJqaktoGWUZ/tDDF449Qb89nxuH01ff29sXtX5fyPKuAoJKttA24H/raEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=j2q0x3e4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453643020bdso4150795e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 06:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771670; x=1751376470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7q+y4cuauV8ZEEI+QC1z+4Pk/VGahhcnIIdZRyJGl5s=;
        b=j2q0x3e4u4wfv7mFt4+MfB5Ey4iA+4TxUVP36g+ELa0kFosIifBgYRzGTZAMFWQs/b
         JRiyOi+4IdWRKA2fj7Z6qyagDni3iKY0T4DsYPhVak/hVnmkVMFK9JD2Of/YhYVzEy+P
         17kuGfMUIqcvVjIeaxm8ChMSZIH996xZfJsOuwJwqCjv8maKpF7HCJDVULGS7OkS6Ez3
         dPXsx37Te9p0FVJkYX5jL+VBpfz2jgMJYtbQONlCvK9OZ/86rPzawOdQO0n0XkCJoUqG
         lAsx1O0Pp/6ZbSUjHnApsHkiBJ1x1X23cud2FnMx7NnLPKgJD5OLc0lwrrY2KHjgZtHM
         ya6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771670; x=1751376470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7q+y4cuauV8ZEEI+QC1z+4Pk/VGahhcnIIdZRyJGl5s=;
        b=SNd3e8xOpzuo4obymWPmYZfUnkz18FgxLzVs9o0JzkW4qScVQBLO75g6wED7d2qX7C
         kH4YcJU48PjWatDTBQuXPvtIZDy0G4ML1lMT/hwgPIi36mEPhifDg2nMTRZtULn0jvYp
         Qfj7VQ9s/iVptBoaCIr0GHya/slx0JwCA6VkcM8evoYhzvM/S6/cAQEUbNJNnj10QAFx
         G7+TsfZ+fVj0PyC2MIjO0hXGtHy6adIx+hx7AGow1nTIZLve9cHRPKy+5OYvhW8xFNcM
         4ZeLVHoaJKja03tioNA9dCRyr/L9DGWjWqeu9OhhcCEDDO5/TGmTqEXfxhsxtXhbxbem
         Cxlw==
X-Forwarded-Encrypted: i=1; AJvYcCWI3PZ/M1286REIUUkwQxqOajC7DpsF63G6JA9VRAtXin6qXBOdhFys4GMMGYItWm3OIdDwX90IAWP5@vger.kernel.org
X-Gm-Message-State: AOJu0YzmGRSnNeM4BdYlT82eswi7JyDwWakWTaoWSQVM1qFMrfmUbj7K
	mpcgguJlKDxzOZfMbEOScyt8LopFmPnfm+cnL/NFOcdwxZnXMTyZDvricL43nDz8MhE=
X-Gm-Gg: ASbGncsBIUEeNR+gMvxW+abyKFX6ejzW6RezMG69jv252WaFVsdnJC32RutJSi7cFmA
	4jZwbCWjhPdmtkqfdXULMEhdM/Gi3aWp0tq2wZz6rFTAG8BnY8CsFDRA1zOa0TMRdBKNlR0aR89
	HzLuBzVl0HX4eC87juqNAC6OTkmhIO42EPIp1+GjUbsBOjKXehZMJjKHxA2uS+sfejEuxROYFLC
	cBBR1a7gWECuwCJFU/HQ/u/ktX8bFJMwjczLqSEVB5k7xub+3AI4YA/6NKrrjckaVXidZUwJrD8
	IfezOidlLssiQAV3jWD/gSFZQi4PMZZkgiN+viIPtuRpwn8U2TcVB86/laigJRQnLQ==
X-Google-Smtp-Source: AGHT+IGmfcrcXv6qaFxA1auGYNl1GVJJJbUjwBsK+LmrzR1ie3pLAeiZE448ONV4ULqg3P1+gJfQqQ==
X-Received: by 2002:a05:600c:3542:b0:451:e394:8920 with SMTP id 5b1f17b1804b1-453659edd18mr149902315e9.27.1750771670024;
        Tue, 24 Jun 2025 06:27:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:38 +0200
Subject: [PATCH 6/8] gpio: cadence: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-6-aea12209d258@linaro.org>
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4868;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ss3poqXhlzfLiQ3jDcCO7Ok2SGZU2TtFIGp++gjWDXE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfNhmKPg3fhAoCDk3zfW13JMYx7TnigjXcX2
 WYivj+S/buJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzQAKCRARpy6gFHHX
 cukxEADOJBsGcGX2kQ6qOkTQJ1Ttww1F/PBoovmhmVco4RYgvPzBD3oT06ENe65hXmz24vD6Fy3
 yMJPZN1fuYn5UddaygrS5rHO3A+0DljhVkz7PwE1cTBIs8616DckVet8FtrDXIwJyVzu8x55zMv
 UfvHiGfccZqbMHhQxVAxz6nQkjOQd3/JDZEtTY/bsANtSfH3f0rSlcqp4jL+pdsaNeZLMJ5LOhW
 ePIwy8NAzS2tHbIXjK2jMC8jWDX5nZyxQIYwf3pIa7nn4A/JP4tRLXXtiCmN2+Vd3qychphUQTD
 vQOLstSPzVRsXFyoZRr657j/m2g1Kj7Ayc8xLo2zqLgRMskyq68sCoszsK1AS1GqnFHPx9RxjZ7
 ab4Sd9xtfeZ1sdjht1VOK74HY+NGAAoUtX3hJN7Q98rNxmlmkZ/cFySw8ninCz2d28q2Ra03X86
 3iHV2ABaAIN1fDLQbGqc6ISuTL+Zlj/jCwZFyV/iUcLBoc6NRc3sYGDcPWhSHvyKDXF2uXDX34q
 m029iuqJcZTJCalVj2hMMG1gtc8YmijWfxgFH0x4AG7Tr10207uV5yilsU7WJUd5y18geyXNaYX
 jVd2/+nZdV6JvAwWLPEJ0UIwIJmv7pD/TGTPTrNStpuUPVONPnptUrP2YXHv5vJlWmCMUPxzIsC
 OSOIGxyS07RCzWw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-cadence.c | 46 ++++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index e6ec341d55e9047b2fa8718799ba72d54624388e..8243eddcd5bbe537bab1bedc72c80ee88839f5d3 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -12,6 +12,8 @@
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -31,7 +33,7 @@
 #define CDNS_GPIO_IRQ_ANY_EDGE		0x2c
 
 struct cdns_gpio_chip {
-	struct gpio_chip gc;
+	struct gpio_generic_chip gen_gc;
 	void __iomem *regs;
 	u32 bypass_orig;
 };
@@ -40,7 +42,7 @@ static int cdns_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
 
-	guard(raw_spinlock)(&chip->bgpio_lock);
+	guard(gpio_generic_lock)(&cgpio->gen_gc);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) & ~BIT(offset),
 		  cgpio->regs + CDNS_GPIO_BYPASS_MODE);
@@ -52,7 +54,7 @@ static void cdns_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
 
-	guard(raw_spinlock)(&chip->bgpio_lock);
+	guard(gpio_generic_lock)(&cgpio->gen_gc);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) |
 		  (BIT(offset) & cgpio->bypass_orig),
@@ -86,7 +88,7 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	u32 mask = BIT(d->hwirq);
 	int ret = 0;
 
-	guard(raw_spinlock)(&chip->bgpio_lock);
+	guard(gpio_generic_lock)(&cgpio->gen_gc);
 
 	int_value = ioread32(cgpio->regs + CDNS_GPIO_IRQ_VALUE) & ~mask;
 	int_type = ioread32(cgpio->regs + CDNS_GPIO_IRQ_TYPE) & ~mask;
@@ -142,6 +144,7 @@ static const struct irq_chip cdns_gpio_irqchip = {
 
 static int cdns_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct cdns_gpio_chip *cgpio;
 	int ret, irq;
 	u32 dir_prev;
@@ -168,32 +171,33 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	 * gpiochip_lock_as_irq:
 	 * tried to flag a GPIO set as output for IRQ
 	 * Generic GPIO driver stores the direction value internally,
-	 * so it needs to be changed before bgpio_init() is called.
+	 * so it needs to be changed before gpio_generic_chip_init() is called.
 	 */
 	dir_prev = ioread32(cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
 	iowrite32(GENMASK(num_gpios - 1, 0),
 		  cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
 
-	ret = bgpio_init(&cgpio->gc, &pdev->dev, 4,
-			 cgpio->regs + CDNS_GPIO_INPUT_VALUE,
-			 cgpio->regs + CDNS_GPIO_OUTPUT_VALUE,
-			 NULL,
-			 NULL,
-			 cgpio->regs + CDNS_GPIO_DIRECTION_MODE,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+	config.dev = &pdev->dev;
+	config.sz = 4;
+	config.dat = cgpio->regs + CDNS_GPIO_INPUT_VALUE;
+	config.set = cgpio->regs + CDNS_GPIO_OUTPUT_VALUE;
+	config.dirin = cgpio->regs + CDNS_GPIO_DIRECTION_MODE;
+	config.flags = BGPIOF_READ_OUTPUT_REG_SET;
+
+	ret = gpio_generic_chip_init(&cgpio->gen_gc, &config);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register generic gpio, %d\n",
 			ret);
 		goto err_revert_dir;
 	}
 
-	cgpio->gc.label = dev_name(&pdev->dev);
-	cgpio->gc.ngpio = num_gpios;
-	cgpio->gc.parent = &pdev->dev;
-	cgpio->gc.base = -1;
-	cgpio->gc.owner = THIS_MODULE;
-	cgpio->gc.request = cdns_gpio_request;
-	cgpio->gc.free = cdns_gpio_free;
+	cgpio->gen_gc.gc.label = dev_name(&pdev->dev);
+	cgpio->gen_gc.gc.ngpio = num_gpios;
+	cgpio->gen_gc.gc.parent = &pdev->dev;
+	cgpio->gen_gc.gc.base = -1;
+	cgpio->gen_gc.gc.owner = THIS_MODULE;
+	cgpio->gen_gc.gc.request = cdns_gpio_request;
+	cgpio->gen_gc.gc.free = cdns_gpio_free;
 
 	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
@@ -210,7 +214,7 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	if (irq >= 0) {
 		struct gpio_irq_chip *girq;
 
-		girq = &cgpio->gc.irq;
+		girq = &cgpio->gen_gc.gc.irq;
 		gpio_irq_chip_set_chip(girq, &cdns_gpio_irqchip);
 		girq->parent_handler = cdns_gpio_irq_handler;
 		girq->num_parents = 1;
@@ -226,7 +230,7 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 		girq->handler = handle_level_irq;
 	}
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &cgpio->gc, cgpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &cgpio->gen_gc.gc, cgpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
 		goto err_revert_dir;

-- 
2.48.1


