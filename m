Return-Path: <linux-gpio+bounces-16679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE99FA478E8
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 10:18:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECC763A4704
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 09:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAACB22837F;
	Thu, 27 Feb 2025 09:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nj6KTfe0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605E2227E88
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740647896; cv=none; b=naqON/ocxYAqr1m0LktLL0HfK7PzsDusruLoy07op+nRKdmdeE1Jr04vnU+m46fgM0FnX7QUUbylWnkQRtdG4axQP7MLKxvcOzFFiFt1D7lqMjVmYXFWA+Z0SKUVaYkFkRNOFQqj1kEnAaDe/11eHq7fTLso8MksiHAtk5pEKk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740647896; c=relaxed/simple;
	bh=1NcQ1QhKBPCEydaGw74b8j+XDK8e0sZiByr29ArYvXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M0rbh8vpdz34Kpo4x+u1f5eqbou0/n11fUyuXYbS+CO1x8LPZ4LPFqC0fuAwzAXq0dWhMitSqVxrLwTijyVHoYaVXdXdpj9oKvDHvSztgIKTMIjFrCK6vLSRPOWjsWKuFW844Ltaav2hEnI1EPbW2B4nYsVgM/r0CqBmtvCID8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nj6KTfe0; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so763484e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 01:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740647892; x=1741252692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CsfK7y38egBLwtVpZ8JIHIyxolWGhFWUWbPZd2zSB4=;
        b=nj6KTfe0pP6Rig9HhqeGFxFWT0BHmkXyRDaKiw1Kbv6NMLohKbT2DQVExYmexk+FDP
         PiNGSqLAMTrCmXA9EsJzbJw1ULqj1H/kzYWHJnoIG42oL4zF3DuDMddpaGqchTGkFU7X
         AmOmPMw1FjN3Mqj8RVeN4JSooTK96WZAyFKY9kE/0R/4sVIuN2qnAMIETfqFahgRQufT
         TlHp2cZGYHiqU3TMrjOH74WlmUXyM9Q2s2zAXpGGjl2XXoCgpKBDdxf7dE5U1i+LFkIU
         3p59gIHV9f1chHSV3ig9N/34dXFw4++av8rhul1IyAADBIo2EIne9XsEmZgmLL4HVY0l
         0r7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740647892; x=1741252692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CsfK7y38egBLwtVpZ8JIHIyxolWGhFWUWbPZd2zSB4=;
        b=Y1RjPxLhv/Hmko0gPzweQ3ZdOSwm9TYaQG/IwaP64id+8DF8CwJ7WSOz3exzKb+5TU
         CQFNNd9DbASDE45re/ADE0efeKRe1ZX3mNzm1Uz5HChQQ9sp1XNrS7LR8pfx1OV+kP72
         XBbwAkz6S/XFp764qA1air7zuyQ2P/RnmNcEPa8G8XZPIAeu6yNg3Z86p5s4gZ9iIAlf
         SM0pxfRMyFhaz2ISDClH4Fz/wX3+IiwDNw/kpqFLsiHgZ/yavJooBeD17ye0TqNcoN7c
         ttoMPVxkNuJkMnau5Wj6XzCeu+a0gxVfDJdURPVx/EnDJGQVCql9xVKYfIMvAt7J1ZuA
         qUPw==
X-Gm-Message-State: AOJu0YwNOpBnEkMrNgpD0OUqpLcYSYpMzgO3dZOxzzgrphQ2MjC0du8t
	an5HPP6D1dAVKHsdYVCQPS/mrofJ+fwYN63Hjo2+V8TFXTv46IBr1jRHT6sixo8=
X-Gm-Gg: ASbGncuPYdfMWsfLAFIceYvX/nqbL5OwTxxIn0ObWmMAZ/Bb1gxc6LPuXSM1OU9ahMr
	rUjWkD2SUZjihcg744cf8IzwuiBHvHutxT4DEhxqF9QZqVQgUxZJtGAD4MYuVm6qvbdnkfVf4dV
	4bhCi3FubBgXpIo3g6pd2aJEr0CIuhUrMaVsycWP7DcWUDQmr7dmEsZreqW/LVsetjgTGUTKHAw
	sjvC8a6WE14OF0Nv3rFjiI+9Ufh5fjNQqP7epRRh7AGzrTDR12QY6jaLei/3SRSuyXP0FbmMSrr
	xodKw4ahUV+44LCURbSROQQNkD66OGW7+EH6
X-Google-Smtp-Source: AGHT+IGyoKWAfyKp4a1VQf5x5D6OMMHsLv3SLRgml7YczLS4M8+MJp53e9yr2nWsRAYDd80d3avIAQ==
X-Received: by 2002:a05:6512:31ce:b0:545:2f9b:7589 with SMTP id 2adb3069b0e04-5493c5c9012mr3882717e87.50.1740647892380;
        Thu, 27 Feb 2025 01:18:12 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441742d3sm111136e87.34.2025.02.27.01.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:18:11 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Feb 2025 10:18:09 +0100
Subject: [PATCH 3/3] gpio: altera: Use generic MMIO GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-gpio-mmio-more-v1-3-0ea4ad43d304@linaro.org>
References: <20250227-gpio-mmio-more-v1-0-0ea4ad43d304@linaro.org>
In-Reply-To: <20250227-gpio-mmio-more-v1-0-0ea4ad43d304@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Mun Yew Tham <mun.yew.tham@intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

If we use the generic GPIO lib for MMIO in the Altera driver
we do not only cut down on the code, we also get get/set_multiple
for free.

Keep the local raw spinlock instead of reusing the bgpio spinlock
because it makes the gpiochip and irqchip nicely orthogonal.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig       |  1 +
 drivers/gpio/gpio-altera.c | 92 ++++++++--------------------------------------
 2 files changed, 17 insertions(+), 76 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index add5ad29a673c09082a913cb2404073b2034af48..4a1630cbe0a28a03bbd2c77f707dc750713c577d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -148,6 +148,7 @@ config GPIO_74XX_MMIO
 
 config GPIO_ALTERA
 	tristate "Altera GPIO"
+	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
 	  Say Y or M here to build support for the Altera PIO device.
diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 290fd168cab24ae0361b43303f8092fc8190c519..8de556dd709035c1f8bbd57558520453e8f06818 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -106,70 +106,6 @@ static unsigned int altera_gpio_irq_startup(struct irq_data *d)
 	return 0;
 }
 
-static int altera_gpio_get(struct gpio_chip *gc, unsigned offset)
-{
-	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
-
-	return !!(readl(altera_gc->regs + ALTERA_GPIO_DATA) & BIT(offset));
-}
-
-static void altera_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
-{
-	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
-	unsigned long flags;
-	unsigned int data_reg;
-
-	raw_spin_lock_irqsave(&altera_gc->gpio_lock, flags);
-	data_reg = readl(altera_gc->regs + ALTERA_GPIO_DATA);
-	if (value)
-		data_reg |= BIT(offset);
-	else
-		data_reg &= ~BIT(offset);
-	writel(data_reg, altera_gc->regs + ALTERA_GPIO_DATA);
-	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
-}
-
-static int altera_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
-{
-	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
-	unsigned long flags;
-	unsigned int gpio_ddr;
-
-	raw_spin_lock_irqsave(&altera_gc->gpio_lock, flags);
-	/* Set pin as input, assumes software controlled IP */
-	gpio_ddr = readl(altera_gc->regs + ALTERA_GPIO_DIR);
-	gpio_ddr &= ~BIT(offset);
-	writel(gpio_ddr, altera_gc->regs + ALTERA_GPIO_DIR);
-	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
-
-	return 0;
-}
-
-static int altera_gpio_direction_output(struct gpio_chip *gc,
-		unsigned offset, int value)
-{
-	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
-	unsigned long flags;
-	unsigned int data_reg, gpio_ddr;
-
-	raw_spin_lock_irqsave(&altera_gc->gpio_lock, flags);
-	/* Sets the GPIO value */
-	data_reg = readl(altera_gc->regs + ALTERA_GPIO_DATA);
-	if (value)
-		data_reg |= BIT(offset);
-	else
-		data_reg &= ~BIT(offset);
-	writel(data_reg, altera_gc->regs + ALTERA_GPIO_DATA);
-
-	/* Set pin as output, assumes software controlled IP */
-	gpio_ddr = readl(altera_gc->regs + ALTERA_GPIO_DIR);
-	gpio_ddr |= BIT(offset);
-	writel(gpio_ddr, altera_gc->regs + ALTERA_GPIO_DIR);
-	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
-
-	return 0;
-}
-
 static void altera_gpio_irq_edge_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
@@ -242,8 +178,23 @@ static int altera_gpio_probe(struct platform_device *pdev)
 
 	raw_spin_lock_init(&altera_gc->gpio_lock);
 
+	altera_gc->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(altera_gc->regs))
+		return dev_err_probe(dev, PTR_ERR(altera_gc->regs),
+				     "failed to ioremap memory resource\n");
+
 	gc = &altera_gc->gc;
 
+	ret = bgpio_init(gc, dev, 4,
+			 altera_gc->regs + ALTERA_GPIO_DATA,
+			 altera_gc->regs + ALTERA_GPIO_DATA,
+			 NULL,
+			 altera_gc->regs + ALTERA_GPIO_DIR,
+			 NULL,
+			 0);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to init generic GPIO\n");
+
 	if (device_property_read_u32(dev, "altr,ngpio", &reg))
 		/* By default assume maximum ngpio */
 		gc->ngpio = ALTERA_GPIO_MAX_NGPIO;
@@ -257,22 +208,11 @@ static int altera_gpio_probe(struct platform_device *pdev)
 		gc->ngpio = ALTERA_GPIO_MAX_NGPIO;
 	}
 
-	gc->direction_input	= altera_gpio_direction_input;
-	gc->direction_output	= altera_gpio_direction_output;
-	gc->get		= altera_gpio_get;
-	gc->set		= altera_gpio_set;
-	gc->owner		= THIS_MODULE;
-	gc->parent		= &pdev->dev;
-	gc->base		= -1;
-
+	gc->base = -1;
 	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", dev_fwnode(dev));
 	if (!gc->label)
 		return -ENOMEM;
 
-	altera_gc->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(altera_gc->regs))
-		return dev_err_probe(dev, PTR_ERR(altera_gc->regs), "failed to ioremap memory resource\n");
-
 	mapped_irq = platform_get_irq_optional(pdev, 0);
 	if (mapped_irq < 0)
 		goto skip_irq;

-- 
2.48.1


