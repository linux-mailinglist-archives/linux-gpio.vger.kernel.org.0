Return-Path: <linux-gpio+bounces-15972-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69896A35204
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 00:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07C43162EF6
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 23:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821D622D78B;
	Thu, 13 Feb 2025 23:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PUDd3FyU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E17122D782
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 23:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739488143; cv=none; b=YN5PcM8V0gkdfNxI4dRI8ceI8a/dpY+DI+OFq7TP91225Z9lHWatP+jAS9CZRA4iLtcbLmJ7hbk8ZrtWFa1cshnke6gQjfFIFNw/270/P2W5O5N5LyPVonkng9WiqR41EgCBi/tN9vizFwdcjdnN4G4H7IglxsTFSxxT2gxkVyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739488143; c=relaxed/simple;
	bh=Q1uXFqwEISKnWAKULeGHJYfXqeXfC6zdTwnXk7MaFgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0/96N3QcV9ay43DP9qsJJm1SdzEgoOQ2A9tHANklsRqmzxDm+gjigv9Tdpz0AUdIsR6CBV1vM2OxBQjpFUie4lpJMo82vPUqYi2fanKLloUZTIQRXDIZr91YsKygzZqi6Du61/QsAERzzV5SxLzi1KNHvmNgc+WeWjmBJxdkpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PUDd3FyU; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5450f38393aso1359995e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 15:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739488138; x=1740092938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPY8URXOoMgp+HlRI5qV+yVX1cfDqsDtqiiw5rpXmMs=;
        b=PUDd3FyU7P0LFEJ34viuS9iAt6mRjQXubTut1knlKp4ELTAhuqEcUNWxaLHKLApW8d
         bdQgHbDfLws+RlBqNVo8dC7ZNZvVafYZPsk2rC+8OVqMgHwGV1bqmCaTIqpNrt1HBerP
         3lRHyge3V/UDJHh+o89PZlc2rsrDwiojyWIKiIKn+DjedBPG76J0YNFVaD1oz6ygYAfg
         s+hOdTXNHy8BInC7I7BSiCf7BHVyZj8BABun2CgXDiIZB4xRNYFAcoVNzGIUW3k7Esjr
         BirM1xuLSJT/bYBurmyVJW64de20Gt0s9D9QxTodill3kZAx98PbMj3JC4LIAPsUEGKT
         96PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739488138; x=1740092938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPY8URXOoMgp+HlRI5qV+yVX1cfDqsDtqiiw5rpXmMs=;
        b=SVr0CWFeDKE0g47NAj8UzayMdZZqKYXm+zww4kdcyrYAx8bMF6dfHB6OKXS70VDs2f
         I1RYfxIG9BehbplblTOKDV0P530/HA5tGb4rkj0vQEZ2BU77OwLKcidga79ILHoW1QWG
         tOToL2p/aZ8g95Rd4Ts2gQ6znCoWObd5lQZGJCEz0lIQWQ8he2Nzs98cFoKjL54+3H91
         nZG+1op6LTozWEJEE+H0uFzv4rt75OIs8onwkWcUA0A/OM0Fh9OdW3Z+d9PyDAl6BSuw
         qOGG4yL7QjxMeFHOFDFb8I1dDMhuMc6+SpnyGi+WcudhP+awHpGQg+Dmmu1Q60m1pSJ/
         tKmA==
X-Gm-Message-State: AOJu0YwYV2/4yAj5WaY9dV1bpeIvv0Ps+5xz9F/5sesKxCPSv38zgfA0
	Gjun0cjzcxugtieyazr9r10KS0xt7j54g1elemzQJ3O00fDzycAJLCwdY5+DK6F4av1FgWdotdI
	k
X-Gm-Gg: ASbGncuAS+AB3LI5fEsnnc5y06uLmg3jjDqA7T7Pc0tD+/ZgN7CrwzaxzmWxjhl/t61
	lRtjfnVkka3eX39UsdzkqeeDXmidbdnfuIFR8Begf1n6ul6fZ6refL4+wmIa+RQTT1EHY9FA2hd
	huOlbSC/BG7B0LhZiHAQELxuNJQSGphuGP+QJzsyVzOkERJgJ5DyD+Rx5fnOJu7iJwgkQiiBQCT
	nkvf1Uvfmk9uU4KvfvruW6GkTOGZyhP4xaIff5MiHv7bKUcs8gCyEet0La0Y/TvZ+9058EGITw9
	Qadsa89sOGltqLDBLCtzGtA0yA==
X-Google-Smtp-Source: AGHT+IEX4poaSjyJRHx3Al9I4Kyv/xc/E9MbeTXbNw9T//waAAF+zo5lN3G4f5Ph3MhNGSGS6CYPhw==
X-Received: by 2002:a05:6512:4015:b0:545:f70:8a95 with SMTP id 2adb3069b0e04-545184a3a9amr3553849e87.32.1739488138091;
        Thu, 13 Feb 2025 15:08:58 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54523070a9csm155943e87.5.2025.02.13.15.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 15:08:57 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 00:08:43 +0100
Subject: [PATCH 2/2] gpio: vg610: Switch to gpio-mmio
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-vf610-mmio-v1-2-6cccd0292e84@linaro.org>
References: <20250214-vf610-mmio-v1-0-6cccd0292e84@linaro.org>
In-Reply-To: <20250214-vf610-mmio-v1-0-6cccd0292e84@linaro.org>
To: Johan Korsnes <johan.korsnes@remarkable.no>, 
 Haibo Chen <haibo.chen@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

After adding a pinctrl flag to gpio-mmio we can use it
for driving gpio-vf610.

The existing code has the same semantics and the generic
gpio-mmio, including reading from the data out register
when the direction is set to input, and it can also handle
the absence of the direction register better than the
current driver: we get the direction from the shadow
direction registers in gpio-mmio instead.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig      |   1 +
 drivers/gpio/gpio-vf610.c | 100 +++++-----------------------------------------
 2 files changed, 10 insertions(+), 91 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index add5ad29a673c09082a913cb2404073b2034af48..ab104ce85ee6cef1549d31744625bcc625d75179 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -756,6 +756,7 @@ config GPIO_VF610
 	default y if SOC_VF610
 	depends on ARCH_MXC || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
+	select GPIO_GENERIC
 	help
 	  Say yes here to support i.MX or Vybrid vf610 GPIOs.
 
diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 3527487d42c8ac3ef39c3be468dd5177c85f6b44..858ced17ae5e5f2726ccb8522cd3e4b6a5041d99 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -94,82 +94,6 @@ static inline u32 vf610_gpio_readl(void __iomem *reg)
 	return readl_relaxed(reg);
 }
 
-static int vf610_gpio_get(struct gpio_chip *gc, unsigned int gpio)
-{
-	struct vf610_gpio_port *port = gpiochip_get_data(gc);
-	u32 mask = BIT(gpio);
-	unsigned long offset = GPIO_PDIR;
-
-	if (port->sdata->have_paddr) {
-		mask &= vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
-		if (mask)
-			offset = GPIO_PDOR;
-	}
-
-	return !!(vf610_gpio_readl(port->gpio_base + offset) & BIT(gpio));
-}
-
-static void vf610_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
-{
-	struct vf610_gpio_port *port = gpiochip_get_data(gc);
-	u32 mask = BIT(gpio);
-	unsigned long offset = val ? GPIO_PSOR : GPIO_PCOR;
-
-	vf610_gpio_writel(mask, port->gpio_base + offset);
-}
-
-static int vf610_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
-{
-	struct vf610_gpio_port *port = gpiochip_get_data(chip);
-	u32 mask = BIT(gpio);
-	unsigned long flags;
-	u32 val;
-
-	if (port->sdata->have_paddr) {
-		spin_lock_irqsave(&port->lock, flags);
-		val = vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
-		val &= ~mask;
-		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
-		spin_unlock_irqrestore(&port->lock, flags);
-	}
-
-	return pinctrl_gpio_direction_input(chip, gpio);
-}
-
-static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
-				       int value)
-{
-	struct vf610_gpio_port *port = gpiochip_get_data(chip);
-	u32 mask = BIT(gpio);
-	unsigned long flags;
-	u32 val;
-
-	vf610_gpio_set(chip, gpio, value);
-
-	if (port->sdata->have_paddr) {
-		spin_lock_irqsave(&port->lock, flags);
-		val = vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
-		val |= mask;
-		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
-		spin_unlock_irqrestore(&port->lock, flags);
-	}
-
-	return pinctrl_gpio_direction_output(chip, gpio);
-}
-
-static int vf610_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
-{
-	struct vf610_gpio_port *port = gpiochip_get_data(gc);
-	u32 mask = BIT(gpio);
-
-	mask &= vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
-
-	if (mask)
-		return GPIO_LINE_DIRECTION_OUT;
-
-	return GPIO_LINE_DIRECTION_IN;
-}
-
 static void vf610_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct vf610_gpio_port *port =
@@ -371,24 +295,18 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	}
 
 	gc = &port->gc;
-	gc->parent = dev;
+	ret = bgpio_init(gc, dev, 4,
+			 port->base + GPIO_PDOR,
+			 port->base + GPIO_PCOR,
+			 NULL,
+			 port->sdata->have_paddr ? port->base + GPIO_PDDR : NULL,
+			 NULL,
+			 BGPIOF_PINCTRL_BACKEND);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to init generic GPIO\n");
 	gc->label = dev_name(dev);
-	gc->ngpio = VF610_GPIO_PER_PORT;
 	gc->base = -1;
 
-	gc->request = gpiochip_generic_request;
-	gc->free = gpiochip_generic_free;
-	gc->direction_input = vf610_gpio_direction_input;
-	gc->get = vf610_gpio_get;
-	gc->direction_output = vf610_gpio_direction_output;
-	gc->set = vf610_gpio_set;
-	/*
-	 * only IP has Port Data Direction Register(PDDR) can
-	 * support get direction
-	 */
-	if (port->sdata->have_paddr)
-		gc->get_direction = vf610_gpio_get_direction;
-
 	/* Mask all GPIO interrupts */
 	for (i = 0; i < gc->ngpio; i++)
 		vf610_gpio_writel(0, port->base + PORT_PCR(i));

-- 
2.48.1


