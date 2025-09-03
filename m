Return-Path: <linux-gpio+bounces-25447-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B06B4178E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88812179974
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CBC2AD2F;
	Wed,  3 Sep 2025 08:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wdSSlCZE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EF22D593A
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 08:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886426; cv=none; b=CXZkllN7B8H4AV6UBwB9+bCOncSefVs4vMMLjsep1YAFmDqxef2fYrQtWs2LMixqqVg3o4VPiK0XYeviaPK/Ypqll8zKGFQxCWcNKbUTNMsS0kvuk7iD5Ydg00vug1pXeAF/WNKG25MiY2vP0/JnQDZHVOxPJ14QjXBGZ8eN3HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886426; c=relaxed/simple;
	bh=Qca/FQn6KRi5QWiI2IG8l7XWCv84IsJ5fPiZ6Rc4DSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/z+jOzQyEEt5qNTuB93Uul6EjX57ueTuDy2v2NOb5mVXB55UltrGfiPdCkp6gKpIMFQxco1DtpidOXG0MdZ4fzMsjIkGP4oD+6mtbzXbCM1ZSLMsgJESjzmWqi/si2Nn+y28N2KPxDwxSJu7Po9RwtgkBfnvTuc16mgxrEUMuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wdSSlCZE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b79ec2fbeso42031255e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 01:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886422; x=1757491222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hy9bOxpl6g6PPjJ5R4Np9HUxwqq9YKw639nLydH6DxY=;
        b=wdSSlCZEJNkTAu8FOtzZtJZ0cr8OFvQaqS9Xil+1cNO1ncme6Bq/ctrQoWxmxjbSlu
         E6Kwd16Oo6OJdLTBhh57D+i412wfZKFvUydy9ksBGM9WAO/+zA9wBsdrimsSn/j6tyzG
         NHxKdr7hYR/Js6h4J9Yo+LqQsB2HLtsf/CbGCGHhfZJcBiGgwZwPFBqHvF77MbxS3cUR
         bRCgj5MVSjlIGW69BN4SK1Zu86f4Ch2QZvQa+MEaZmMZvGSPuIZr3ozvXO9ig7RFKFfv
         Qqx55BDUEU3l79SXiKdzF6pryyj19MBgUvUPugCqXcKMcx8m66dyTD3B/fxJcktkWo+c
         U/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886422; x=1757491222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hy9bOxpl6g6PPjJ5R4Np9HUxwqq9YKw639nLydH6DxY=;
        b=G4lP3dUvFysPWhtLEwX8+M8lS9ZjaSfZ6ObgQdruDmcRo6tLsKDWRzqH7UnoTtEAWa
         e42hnaWflWnObjrbNd/erEjuB3sOq/Pk69mhUsxfHMxQanSmSkweKfff/rLc7xZFuvgf
         m5e2ERnoel/8+pV94PbrzDBLsL6or6E6o9ro1P4X+fqkyPX9oUwtE4WsW3OF0pvpBDL3
         PGWJcRL2kmmEOvxdGlc+E8y2ZyIXHs575tQqcK0Dlc39G321wqqto0+E+3fBZVjuZdkI
         JQpI9EvZ0LAEZGANvQb7dNJX8aBdelK+83HDTof2GmcNQ2YGOZ1nV6y59rRvl0QyWBYF
         Q+5g==
X-Gm-Message-State: AOJu0Yz9t2vwfNPpY7+uQSpgC7gw/YhiSEAwgDDFbM9etri39sH8vjl1
	Yc0PrE92JIpyJ2LzhdLEiO0wleic/rWQK3e8Ryog/F35xHvL29mEQr6NT+/a6Wz0iwai8T3OMkN
	PSU5k
X-Gm-Gg: ASbGncsKUoez07nVRC5v4UQ0wy8melLtkTNsqSv0x+js7sAdLV4sfKRv9hNEk42OhwY
	kOwYcD3G28Vnl4XbbXqDlIQ6A/ZxolL5lJ4C+EeJHf0T3U05CYsbE/rATJ8hJ4vOEQpoWk/Fe9u
	oPkXhe83nS97N0O2leZJL0UOWGvIGINiw30kXH+PUiiQlvITMkpxleEokokn4h6vHISfT5fjM+y
	lfxKUSVYfnkXYUr8BJlKZOpP9vFBOXwfbo/oYWd2moEPgdjSpZsXw54M2lvcfsPK0cFnJAs2KWz
	jRAf11E/plqsIQSPZFcQaO9U3myoHQIagVofhNmtlizaZf9sGmNBCduVCJZBvwCPv7TWQHsQ99m
	sSD33pJ50Jg/brNc7
X-Google-Smtp-Source: AGHT+IGSXDsLMnkVmHi32J3FYtafMyOV7z+ZI7nxOCmRVk/mvXulpXNJ6fL60j3cVKcySc0WsxfOuQ==
X-Received: by 2002:a05:600c:4f0a:b0:45b:868e:7f80 with SMTP id 5b1f17b1804b1-45b868e8512mr119518565e9.8.1756886422507;
        Wed, 03 Sep 2025 01:00:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:06 +0200
Subject: [PATCH 02/12] gpio: ixp4xx: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-2-ff346509f408@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5144;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=52EZXtNYov0BPLgttyxaJIp6rvW0YbePoZxCVvveYbw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WQe9Je1QrsE3U9X8Asr57GXatF/xD2gPO3D
 13D3NWIwNuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kAAKCRARpy6gFHHX
 cuxuD/9pktxCxNM7u1Czg04I8wRpvbWv2USp2CvXmd6W6wJ6bWt+JGRLYmYMta05xJnv2s68Ha5
 kgDzRGqsja0QynNa2DPQQh4oLhfoJMrefmnEmj0e/9T6MfJ7o+XgwYmV6nZLcHohdMf9NGgkIv1
 34TFqylt2rt/uSavy2mGDjgKyFDoi1eetiSCKDilF1mFPJ6KPrVrC5zFToU9JbcZu6XKeiuz5fC
 PgpHhwh/ZHA0a+/kk34wNf4h0NebQRFE1sW04hHee8M2XBux8+TLmWnT0jdKjyRT/TULiGRbORv
 Msc7SDUCFWsAxsX1caajyKP5EXEeLjh+NDFOUw8SaCvNgtHQcUZVQrjBZUFf+195OppF1+GPjh+
 YUO2qJZmmDIj5zzppuRJKMqp8xjWi2H5tRIU2aoILn0jU8thEvSMpOWOcg0tilgLW/UQsc6rLjV
 xD7mhj5Eu1yKRsvavLw1KOEekyEqClE9VIl8rNhIa6grKNsP9//6laoJajvOR4ghk+4rs8wwi9f
 1AovvWbfIWFvkUoF8+9bAztsacjXM9HUijDLGpSmbOY8DmHQiQrg1QOJUpoe4WtjWgdgE4klpWl
 Pi+eflQ0Jsmz9B7e7g6w6PFso92KVLVg6CRmixZhPtAXMvLGLeqWClIvA0l5BrotMIx7ehI9snN
 T3yYx0Gxa+8tokw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ixp4xx.c | 70 ++++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 28a8a6a8f05feec4188467693591e36dbf04ccdc..0cf10d0ba16ef7f45ac114c34468bc263442ccca 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
@@ -53,14 +54,14 @@
 
 /**
  * struct ixp4xx_gpio - IXP4 GPIO state container
+ * @chip: generic GPIO chip for this instance
  * @dev: containing device for this instance
- * @gc: gpiochip for this instance
  * @base: remapped I/O-memory base
  * @irq_edge: Each bit represents an IRQ: 1: edge-triggered,
  * 0: level triggered
  */
 struct ixp4xx_gpio {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	struct device *dev;
 	void __iomem *base;
 	unsigned long long irq_edge;
@@ -100,7 +101,6 @@ static int ixp4xx_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct ixp4xx_gpio *g = gpiochip_get_data(gc);
 	int line = d->hwirq;
-	unsigned long flags;
 	u32 int_style;
 	u32 int_reg;
 	u32 val;
@@ -144,26 +144,24 @@ static int ixp4xx_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		int_reg = IXP4XX_REG_GPIT1;
 	}
 
-	raw_spin_lock_irqsave(&g->gc.bgpio_lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &g->chip) {
+		/* Clear the style for the appropriate pin */
+		val = __raw_readl(g->base + int_reg);
+		val &= ~(IXP4XX_GPIO_STYLE_MASK << (line * IXP4XX_GPIO_STYLE_SIZE));
+		__raw_writel(val, g->base + int_reg);
 
-	/* Clear the style for the appropriate pin */
-	val = __raw_readl(g->base + int_reg);
-	val &= ~(IXP4XX_GPIO_STYLE_MASK << (line * IXP4XX_GPIO_STYLE_SIZE));
-	__raw_writel(val, g->base + int_reg);
+		__raw_writel(BIT(line), g->base + IXP4XX_REG_GPIS);
 
-	__raw_writel(BIT(line), g->base + IXP4XX_REG_GPIS);
+		/* Set the new style */
+		val = __raw_readl(g->base + int_reg);
+		val |= (int_style << (line * IXP4XX_GPIO_STYLE_SIZE));
+		__raw_writel(val, g->base + int_reg);
 
-	/* Set the new style */
-	val = __raw_readl(g->base + int_reg);
-	val |= (int_style << (line * IXP4XX_GPIO_STYLE_SIZE));
-	__raw_writel(val, g->base + int_reg);
-
-	/* Force-configure this line as an input */
-	val = __raw_readl(g->base + IXP4XX_REG_GPOE);
-	val |= BIT(d->hwirq);
-	__raw_writel(val, g->base + IXP4XX_REG_GPOE);
-
-	raw_spin_unlock_irqrestore(&g->gc.bgpio_lock, flags);
+		/* Force-configure this line as an input */
+		val = __raw_readl(g->base + IXP4XX_REG_GPOE);
+		val |= BIT(d->hwirq);
+		__raw_writel(val, g->base + IXP4XX_REG_GPOE);
+	}
 
 	/* This parent only accept level high (asserted) */
 	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
@@ -206,6 +204,7 @@ static int ixp4xx_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 
 static int ixp4xx_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	unsigned long flags;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
@@ -295,30 +294,33 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	flags = 0;
 #endif
 
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = g->base + IXP4XX_REG_GPIN,
+		.set = g->base + IXP4XX_REG_GPOUT,
+		.dirin = g->base + IXP4XX_REG_GPOE,
+		.flags = flags,
+	};
+
 	/* Populate and register gpio chip */
-	ret = bgpio_init(&g->gc, dev, 4,
-			 g->base + IXP4XX_REG_GPIN,
-			 g->base + IXP4XX_REG_GPOUT,
-			 NULL,
-			 NULL,
-			 g->base + IXP4XX_REG_GPOE,
-			 flags);
+	ret = gpio_generic_chip_init(&g->chip, &config);
 	if (ret) {
 		dev_err(dev, "unable to init generic GPIO\n");
 		return ret;
 	}
-	g->gc.ngpio = 16;
-	g->gc.label = "IXP4XX_GPIO_CHIP";
+	g->chip.gc.ngpio = 16;
+	g->chip.gc.label = "IXP4XX_GPIO_CHIP";
 	/*
 	 * TODO: when we have migrated to device tree and all GPIOs
 	 * are fetched using phandles, set this to -1 to get rid of
 	 * the fixed gpiochip base.
 	 */
-	g->gc.base = 0;
-	g->gc.parent = &pdev->dev;
-	g->gc.owner = THIS_MODULE;
+	g->chip.gc.base = 0;
+	g->chip.gc.parent = &pdev->dev;
+	g->chip.gc.owner = THIS_MODULE;
 
-	girq = &g->gc.irq;
+	girq = &g->chip.gc.irq;
 	gpio_irq_chip_set_chip(girq, &ixp4xx_gpio_irqchip);
 	girq->fwnode = dev_fwnode(dev);
 	girq->parent_domain = parent;
@@ -326,7 +328,7 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	girq->handler = handle_bad_irq;
 	girq->default_type = IRQ_TYPE_NONE;
 
-	ret = devm_gpiochip_add_data(dev, &g->gc, g);
+	ret = devm_gpiochip_add_data(dev, &g->chip.gc, g);
 	if (ret) {
 		dev_err(dev, "failed to add SoC gpiochip\n");
 		return ret;

-- 
2.48.1


