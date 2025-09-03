Return-Path: <linux-gpio+bounces-25457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CEAB417AB
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27FB17C2A58
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B272EC554;
	Wed,  3 Sep 2025 08:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Su33RSRz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442942EBDCA
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 08:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886438; cv=none; b=QJe/pf5ZcPGUF07q/aT5Bfv0iWuxw1nIV437eVoX9XBUbd2fZbOYxiJ0izX+tNTfxk8Tv59b2HXZhHbmCE25dhPrtTE5o3+FbGjjPRPADgQSM6zmN037li4j6L5iO1uwJrmT25uxfnKWPImkExUXZXBbL4Vr/f+4S8CN974xjLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886438; c=relaxed/simple;
	bh=kYkXrt9NZ9x7zaMDj0k/HUoMZeQalR1VSJF8xWDj0KU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QFHnnDOiy0EocJoJc5dF2PJVxQb2uwIeHRTQ/0ijdHcoSE1RMhxPFev9lCLnr7eBRlr8/p5BRLHnHpCd40/2YEnPtBbJZWM+8XtfM07c1ew4NnQVwa8X6C7c8a/m3Ns9sBXtOAod9EjtgTOZIG1i1w/646HSwt2R73RspoBNMA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Su33RSRz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso38917335e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 01:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886435; x=1757491235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEz91s+U8kIS8wA1frTzmRgwK/FAwzlSF2c6YYRvAI0=;
        b=Su33RSRzJuzd1H0+uomqRga6TImhnz1hTHA4MSkS3HUsfHtM2wIRq9bggL1D0QmfBu
         PyC/lllAStFWYXc9OPrswW7SnAwSidGxYFO88aEYvZzepD/GO6I27iu7txyvrSdXjeBQ
         X38SeKo6ip35jmP2O/4XZBfWlAPtfaDuPk7WrmXLhAuG5celoNHYpV4+S2yTeLGVRKCA
         uuxAoJQQAWJpWnUy+CYGRZlbQwHxgrwcvUK6MGSvz8MGdS5gZ+BoyUAm1eHMQCiqKfCi
         0555foB9+BKfXfvZp81DlV/BYecrZ8WQXmc5Ok8gLmKI4UF26KYtQkyjzK1dqFiLaUtA
         /Miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886435; x=1757491235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEz91s+U8kIS8wA1frTzmRgwK/FAwzlSF2c6YYRvAI0=;
        b=KDXDqZOCRgCiNewOlZLKZEniujohAokcVR3bX9c1YNU2IkSLFtDrZyeVBi6lFSoNR0
         +IT3W01TeAus31cBEg8BFYa837l9OFUYmpU0Uch5qH//4sb8fcze5y+75g3piBiPWIms
         PQDUoXYwcMTzZbVnp+S0bBXRxu8yWe3fkt8YQqapbK87m99fviu5yQX10lJnzWBm83a3
         U6F38PdsbXa6MN0QTK+jx3bkT5Ka0XQHZatwJD8Un52w0rokoLu5zLArShVGYIjf1V01
         Kr/v282Mxw/S3zABmeoynu+wEWFyIxowaZyWIVAGxSJylHf95jQFkTEVuvLHauXIGb4B
         hXTA==
X-Gm-Message-State: AOJu0YwPCbOtSFOo0RDvw+Mly5TrC8vihFzd66covYGJ4dv8j2yoOTxq
	O9lTRZbk9gNoH5DNgr+fHT+N3tajTiPLD+sOXOV413mXEPUFkm55osyVJE64T8m+1GU=
X-Gm-Gg: ASbGncsBtXjzT3ds2JvcaE4eH5BVuFXxHlvvVeryRZQH19DZHRVZ+xFDKfS580K9xOl
	6ySVcoG/chtCr32A7OtfqNEQ4p0Ip9XgAIHU8kgFNC1igOYF3VgLkQg3Atx6bKD9/sZgDnhERHM
	h6+9ju77Wc5VqjFypI8i2nKp3Szj6Y8VthcXqMw+mcgOxECE6hll3R+VKGhU1XwuFoHzmAv9731
	6uybvXNZWcck7BzoYefqjCharmWU5jBl2vLjc8sq54jpL36p8tGwuEz+j4akXiMowwedDGcuUdQ
	ajTsSi0bRTUKy2SzZhcITzlJAGSzmb2mvNu4MZ8BXi4m5FvzFF1mRn3TQ7BK/ItLsRKdLvMRb20
	27H7Gckl4hHQq2H8mt3KxYSOfU7L14AxANc2c0A==
X-Google-Smtp-Source: AGHT+IGAicRvdxORUansUebrlNsnmPBHg8r2ZlNut5wVP6y9Hg0Cr6n03HvKwPS0g2NuizyNw95FtQ==
X-Received: by 2002:a05:600c:c8f:b0:45b:7ce0:fb98 with SMTP id 5b1f17b1804b1-45b85528677mr124022205e9.5.1756886434508;
        Wed, 03 Sep 2025 01:00:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:16 +0200
Subject: [PATCH 12/12] gpio: mlxbf3: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-12-ff346509f408@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7400;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hreJZv0kQOpgsrXN7wXnSdTeNguQrIV3lN+FwAv5MqE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WT2EPw3eqpxhBtsDB4pgWSrqiehVVLjbIrV
 DhdGgmFt1qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kwAKCRARpy6gFHHX
 ciLxD/9R8A7ngJXfHhBrONYbDrf3Hoj7lOUBXZBkWMAngCDlXZS7YvxLp+xIvuAKlB8fWw3kPnD
 v7Ac2NUlGPjM4xeXp2zaAYCWGwLUC41NEywxjZ2/6rGN0UUnMqrYly/Zrlr8lXCBhTqyVx5lJwA
 GDn8uY42SkEvkurNVhy6kLR2Hf5um0eav1hKPFIwcvYgfVkYwaEMKgyDBlOW6UaWBZoeJ72SUD8
 RUBwroocq6322Hq/E8kosbZ0agHR7+CHcQY9Elx2tbLXUNhij7lRjM2cFj6sDZrFXqU1iw77ehz
 L6xumXUAhAhZa3yBOuyzOTi1o1oqVreoQ4l05EPDLLcIe5+YAvB6nBUMJCo8FKteDOM5SsEjlbF
 D20+uHchK62MPzFb/9ZN1hULtTUn/J8u3vdrXDaF7hYoOyNEMCS8LLXDvDQhR4htup9pF4wY+Aj
 Qu71MwrqHFlQwLM+fQARgQSgJi+INGI+L0Q5isYK6eg7z7tVR9LncptxfTgBWkQUz+W9Pf5IO9W
 dH0DyaSWhZs9msSY19u6M8Yc2N6XvBqERFuixL4dHtMY9DyjaPnD4PIvbiERwDy6fmMXE6C8IVu
 lJy9MaE78FdFcFTbTYfC+sk4TwIsnuwyfDeqgGLOGgcXX/OO4mrxiX/I/RSfASw3HbiTwzg4XvY
 JUVmHWRQS2y6hIg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mlxbf3.c | 101 +++++++++++++++++++++++----------------------
 1 file changed, 52 insertions(+), 49 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index ed29b07d16c19030675994b51a0613b022af131b..c812011bdbe65a9ee793ae1a5bfc656b523ab8ed 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -6,6 +6,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -42,7 +43,7 @@
 #define MLXBF_GPIO_CLR_ALL_INTS           GENMASK(31, 0)
 
 struct mlxbf3_gpio_context {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 
 	/* YU GPIO block address */
 	void __iomem *gpio_set_io;
@@ -58,18 +59,17 @@ static void mlxbf3_gpio_irq_enable(struct irq_data *irqd)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct mlxbf3_gpio_context *gs = gpiochip_get_data(gc);
 	irq_hw_number_t offset = irqd_to_hwirq(irqd);
-	unsigned long flags;
 	u32 val;
 
 	gpiochip_enable_irq(gc, offset);
 
-	raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&gs->chip);
+
 	writel(BIT(offset), gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_CLRCAUSE);
 
 	val = readl(gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
 	val |= BIT(offset);
 	writel(val, gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
-	raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
 }
 
 static void mlxbf3_gpio_irq_disable(struct irq_data *irqd)
@@ -77,16 +77,15 @@ static void mlxbf3_gpio_irq_disable(struct irq_data *irqd)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct mlxbf3_gpio_context *gs = gpiochip_get_data(gc);
 	irq_hw_number_t offset = irqd_to_hwirq(irqd);
-	unsigned long flags;
 	u32 val;
 
-	raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
-	val = readl(gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
-	val &= ~BIT(offset);
-	writel(val, gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
+	scoped_guard(gpio_generic_lock_irqsave, &gs->chip) {
+		val = readl(gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
+		val &= ~BIT(offset);
+		writel(val, gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
 
-	writel(BIT(offset), gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_CLRCAUSE);
-	raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
+		writel(BIT(offset), gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_CLRCAUSE);
+	}
 
 	gpiochip_disable_irq(gc, offset);
 }
@@ -94,7 +93,7 @@ static void mlxbf3_gpio_irq_disable(struct irq_data *irqd)
 static irqreturn_t mlxbf3_gpio_irq_handler(int irq, void *ptr)
 {
 	struct mlxbf3_gpio_context *gs = ptr;
-	struct gpio_chip *gc = &gs->gc;
+	struct gpio_chip *gc = &gs->chip.gc;
 	unsigned long pending;
 	u32 level;
 
@@ -113,37 +112,33 @@ mlxbf3_gpio_irq_set_type(struct irq_data *irqd, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct mlxbf3_gpio_context *gs = gpiochip_get_data(gc);
 	irq_hw_number_t offset = irqd_to_hwirq(irqd);
-	unsigned long flags;
 	u32 val;
 
-	raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
-
-	switch (type & IRQ_TYPE_SENSE_MASK) {
-	case IRQ_TYPE_EDGE_BOTH:
-		val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
-		val |= BIT(offset);
-		writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
-		val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
-		val |= BIT(offset);
-		writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
-		break;
-	case IRQ_TYPE_EDGE_RISING:
-		val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
-		val |= BIT(offset);
-		writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
-		break;
-	case IRQ_TYPE_EDGE_FALLING:
-		val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
-		val |= BIT(offset);
-		writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
-		break;
-	default:
-		raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
-		return -EINVAL;
+	scoped_guard(gpio_generic_lock_irqsave, &gs->chip) {
+		switch (type & IRQ_TYPE_SENSE_MASK) {
+		case IRQ_TYPE_EDGE_BOTH:
+			val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
+			val |= BIT(offset);
+			writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
+			val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
+			val |= BIT(offset);
+			writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
+			break;
+		case IRQ_TYPE_EDGE_RISING:
+			val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
+			val |= BIT(offset);
+			writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_RISE_EN);
+			break;
+		case IRQ_TYPE_EDGE_FALLING:
+			val = readl(gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
+			val |= BIT(offset);
+			writel(val, gs->gpio_io + MLXBF_GPIO_CAUSE_FALL_EN);
+			break;
+		default:
+			return -EINVAL;
+		}
 	}
 
-	raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
-
 	irq_set_handler_locked(irqd, handle_edge_irq);
 
 	return 0;
@@ -186,6 +181,7 @@ static int mlxbf3_gpio_add_pin_ranges(struct gpio_chip *chip)
 
 static int mlxbf3_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct mlxbf3_gpio_context *gs;
 	struct gpio_irq_chip *girq;
@@ -211,16 +207,23 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 	gs->gpio_clr_io = devm_platform_ioremap_resource(pdev, 3);
 	if (IS_ERR(gs->gpio_clr_io))
 		return PTR_ERR(gs->gpio_clr_io);
-	gc = &gs->gc;
+	gc = &gs->chip.gc;
 
-	ret = bgpio_init(gc, dev, 4,
-			gs->gpio_io + MLXBF_GPIO_READ_DATA_IN,
-			gs->gpio_set_io + MLXBF_GPIO_FW_DATA_OUT_SET,
-			gs->gpio_clr_io + MLXBF_GPIO_FW_DATA_OUT_CLEAR,
-			gs->gpio_set_io + MLXBF_GPIO_FW_OUTPUT_ENABLE_SET,
-			gs->gpio_clr_io + MLXBF_GPIO_FW_OUTPUT_ENABLE_CLEAR, 0);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = gs->gpio_io + MLXBF_GPIO_READ_DATA_IN,
+		.set = gs->gpio_set_io + MLXBF_GPIO_FW_DATA_OUT_SET,
+		.clr = gs->gpio_clr_io + MLXBF_GPIO_FW_DATA_OUT_CLEAR,
+		.dirout = gs->gpio_set_io + MLXBF_GPIO_FW_OUTPUT_ENABLE_SET,
+		.dirin = gs->gpio_clr_io + MLXBF_GPIO_FW_OUTPUT_ENABLE_CLEAR,
+	};
+
+	ret = gpio_generic_chip_init(&gs->chip, &config);
 	if (ret)
-		return dev_err_probe(dev, ret, "%s: bgpio_init() failed", __func__);
+		return dev_err_probe(dev, ret,
+				     "%s: failed to initialize the generic GPIO chip",
+				     __func__);
 
 	gc->request = gpiochip_generic_request;
 	gc->free = gpiochip_generic_free;
@@ -229,7 +232,7 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq >= 0) {
-		girq = &gs->gc.irq;
+		girq = &gs->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &gpio_mlxbf3_irqchip);
 		girq->default_type = IRQ_TYPE_NONE;
 		/* This will let us handle the parent IRQ in the driver */
@@ -250,7 +253,7 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gs);
 
-	ret = devm_gpiochip_add_data(dev, &gs->gc, gs);
+	ret = devm_gpiochip_add_data(dev, gc, gs);
 	if (ret)
 		dev_err_probe(dev, ret, "Failed adding memory mapped gpiochip\n");
 

-- 
2.48.1


