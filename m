Return-Path: <linux-gpio+bounces-16245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E975A3CAF5
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 22:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B76F3B2BFA
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 21:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E91254AF1;
	Wed, 19 Feb 2025 21:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L8sCHW0t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853AA22D7B0
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 21:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999081; cv=none; b=SHxxaNJvB9PLfXps/n5r3sm3goyB3MM/xWQKtZld5IiWNISed/aOxypTQ/fEihJAW37r+gypzBCt4069AMjnZ+Czcz/bh0XibcAMHGCZZax8FJATIHymGVknMkqzHfb0KXL725uWn45JtWZRu3Fso7HMEApKANjEw6p4RG//rao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999081; c=relaxed/simple;
	bh=A8x9FoulB0qO7ZVapx6YGb2PHWmE1NctNUq1P6ElhqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eFT4v8W0imEn92pzI7sFF2Hjem8mJpAsgahQZ9jhZXDRwX+kG3OvASzQqDZWqfZHw/yNOb1Vyw8vmU8yRzGJux9IkhrMM8TEunGN1OU+2OAUidkZtJaObcgJ9qMXImWj1n+cJTkV+f9q7PEManJrpCjl8wDKEMFg57g1giQPlxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L8sCHW0t; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3092643f4aaso2218201fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 13:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999077; x=1740603877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WQUsfVoD6/Fdkp9DOW01eLqUyLmcJrGZ/ECjWE6h4A=;
        b=L8sCHW0t6SH+NF0bystxR5TLeUN2T0/q/pm34t4SDjNCpstESJ4o8Kvdp3xED3GsU3
         0khoWmJ4JFdHTQocu6vZRZKtwRuYbv2+NUPpeEUE05Ex0Fb8jaICURDQeNHgs5CidiF5
         hPUQWOryW83uo+KHH0YyO4qV8eGMYg3RlayW6gGMD7vLxgfbEcc4K8XtQ+zX27AvxSmH
         NnQ0xX0mFGUHNGydXHwLWllV1060f7CUyC8XZKQJiwbNUVWOmZq2FHjg7OIJC25XXvRz
         VGhP0Co6YPidMHUYDhbYmq+bNkCL2/+rPK/s+OXWsiInowCjLXWJB08M0NIJrCIOuKsw
         HNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999077; x=1740603877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WQUsfVoD6/Fdkp9DOW01eLqUyLmcJrGZ/ECjWE6h4A=;
        b=l+fgmBiZPHlp35SRBfrGuAF2WXM4vt6sQ4lTaCZq1S7BJZUj/pJhCgvNsW5+sKmAA8
         No+/JuZypcNmp41Gu/vhVCo6qLn+l/JBdQMdbpn6G7VoSGaV23fm8puzp2ufOvt5mXhA
         L/B/rRQVXM/yYFiR2hdnB0Wn5yfB2SaaFhnu1Nmhj9kp0BK2sK/FSwu4w5i1R9ZSAujs
         xNjLBFctde/3Zt421QWDTm2LktsJPPijhovL4F5b6VZ6AAipWF0GGtQ3SlEVxZtX34IN
         TA1jU3Bcu/V3WV1K/dYRrxcvs8GWZGX7750sOl32EaNHnBgQUJtyhl36/oLcQDYawBMP
         th/g==
X-Gm-Message-State: AOJu0YyIC394HoAbr5CTQh8KeOkgqs7X7zF8rZVMRd+3DguE3EveMFgL
	XZZOc77M49RcaomOQsCc9tI8q1tw/CrEf68jAqAkJ0/c398ZSXcSr/EsxhRkcZFp3LQ1ys7vXHS
	g
X-Gm-Gg: ASbGnctem1h5+2c6VB+5o9eZeAiLfW6TlMbPMnGV2xpnoDwP3Vcw2ofa8SAnN32675w
	ptMFkZ3yH4f+gVyqt+lvtaLre+/ArmGIVIhmn6k3KW5ibL+EJ9h+UxpOBBDpFLQJiA532Y+H+Zi
	cE6p0A4OZ9MCyBaiK9LVR5M0XPOtt4cmu0LsPN8KbxNJCP7vTdmN+Se5AxNZ6NoRx/EywEm3LND
	YVm7L5JoTrkCgeEOqRyBQu6Z/kTF2AzWqTapRfRLkVV2bMs7by0OVMZdIcuOVX9j/9Qww08AdtW
	3aNJL0nD1kSmTN7/5+2q9EyoMA==
X-Google-Smtp-Source: AGHT+IH1QwRIaK8DxoUIf+sciYqhNMbHbxL8RHUrvxFp072qsaD1fklzBdxkAF94XpqtsgJcebhOTQ==
X-Received: by 2002:a2e:b4a3:0:b0:30a:24bf:898d with SMTP id 38308e7fff4ca-30a5065136bmr2500051fa.18.1739999076562;
        Wed, 19 Feb 2025 13:04:36 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30923bc174dsm18977791fa.84.2025.02.19.13.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 13:04:36 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Feb 2025 22:04:34 +0100
Subject: [PATCH v3 2/2] gpio: vf610: Switch to gpio-mmio
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-vf610-mmio-v3-2-588b64f0b689@linaro.org>
References: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
In-Reply-To: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
To: Johan Korsnes <johan.korsnes@remarkable.no>, 
 Bough Chen <haibo.chen@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 imx@lists.linux.dev
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

Since gpio-mmio has an internal spinlock we can drop the
direction-protecting spinlock from the driver.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Use the port->gpio_base for accessing GPIO registers.
- Specify only GPOR for setting/clearing/reading the
  output, hoping a RMW on that register works with MMIO.
ChangeLog v1->v2:
- Use the dual input/output set/clear registers for output.
- Provide the BGPIOF_READ_OUTPUT_REG_SET flag so the driver
  behaves as described in the commit message...
- Drop the now unused spinlock (gpio-mmio has its own).
---
 drivers/gpio/Kconfig      |   1 +
 drivers/gpio/gpio-vf610.c | 105 ++++++++--------------------------------------
 2 files changed, 18 insertions(+), 88 deletions(-)

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
index c36a9dbccd4dd5415ed3b90b87afb47e7634c025..4dad7ce0c4dc6a3f412081c7502c0ce6dd5740da 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -36,7 +36,6 @@ struct vf610_gpio_port {
 	struct clk *clk_port;
 	struct clk *clk_gpio;
 	int irq;
-	spinlock_t lock; /* protect gpio direction registers */
 };
 
 #define GPIO_PDOR		0x00
@@ -94,78 +93,6 @@ static inline u32 vf610_gpio_readl(void __iomem *reg)
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
-	u32 val;
-
-	if (port->sdata->have_paddr) {
-		guard(spinlock_irqsave)(&port->lock);
-		val = vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
-		val &= ~mask;
-		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
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
-	u32 val;
-
-	vf610_gpio_set(chip, gpio, value);
-
-	if (port->sdata->have_paddr) {
-		guard(spinlock_irqsave)(&port->lock);
-		val = vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
-		val |= mask;
-		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
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
@@ -291,6 +218,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	struct vf610_gpio_port *port;
 	struct gpio_chip *gc;
 	struct gpio_irq_chip *girq;
+	unsigned long flags;
 	int i;
 	int ret;
 	bool dual_base;
@@ -300,7 +228,6 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	port->sdata = device_get_match_data(dev);
-	spin_lock_init(&port->lock);
 
 	dual_base = port->sdata->have_dual_base;
 
@@ -367,23 +294,25 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	}
 
 	gc = &port->gc;
-	gc->parent = dev;
-	gc->label = dev_name(dev);
-	gc->ngpio = VF610_GPIO_PER_PORT;
-	gc->base = -1;
-
-	gc->request = gpiochip_generic_request;
-	gc->free = gpiochip_generic_free;
-	gc->direction_input = vf610_gpio_direction_input;
-	gc->get = vf610_gpio_get;
-	gc->direction_output = vf610_gpio_direction_output;
-	gc->set = vf610_gpio_set;
+	flags = BGPIOF_PINCTRL_BACKEND;
 	/*
-	 * only IP has Port Data Direction Register(PDDR) can
-	 * support get direction
+	 * We only read the output register for current value on output
+	 * lines if the direction register is available so we can switch
+	 * direction.
 	 */
 	if (port->sdata->have_paddr)
-		gc->get_direction = vf610_gpio_get_direction;
+		flags |= BGPIOF_READ_OUTPUT_REG_SET;
+	ret = bgpio_init(gc, dev, 4,
+			 port->gpio_base + GPIO_PDIR,
+			 port->gpio_base + GPIO_PDOR,
+			 NULL,
+			 port->sdata->have_paddr ? port->gpio_base + GPIO_PDDR : NULL,
+			 NULL,
+			 flags);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to init generic GPIO\n");
+	gc->label = dev_name(dev);
+	gc->base = -1;
 
 	/* Mask all GPIO interrupts */
 	for (i = 0; i < gc->ngpio; i++)

-- 
2.48.1


