Return-Path: <linux-gpio+bounces-14228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE19FC384
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 05:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D95B5164E73
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 04:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A50145FE8;
	Wed, 25 Dec 2024 03:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZcTzEqe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCF754673;
	Wed, 25 Dec 2024 03:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735099178; cv=none; b=KFAh4hNdoS0J06dCCbkXakJNvxaPjSCfCc+xhcWlEfSqv32RSWJni/3TWM1JHYewHwfKSNkgJPDuqZ9LyVBbxtOREBCkdVf0bcMGmS/tnp7auGtRwTdaSf8MtpS/SNRtdamfKK5oeOhgPBUx83ta4QKoWI/q2ieZ6Uoq2aa94OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735099178; c=relaxed/simple;
	bh=zbbwOPlb37BGyfS9OGO2S7mjVj+XoeXCTCCQlWvl5dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aP9yt3Y+tsq9PeQODMq76pAV6oqUYJrMWvCnZ7HDyc32gQppRbHcOnD0DCVf96PKUGUXdkL7EvH7dlzdxPBJSaebltzGPENiFD69D8wbhJxwSpW1/DOOuFqZ/ErOOFxF2yo9QQHdbBk+nJAzyrjDs2jDDqggROLSQTIefBn4jO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZcTzEqe; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21683192bf9so64885775ad.3;
        Tue, 24 Dec 2024 19:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735099176; x=1735703976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNa7GOVBN/qlGQ/A5Jy7mW2Loseznek27MKpExY2eWI=;
        b=CZcTzEqe89XMUmv65/i6A3IR/ZBvMA0XqeNtlBOj+WnMJ5cWafYnEdrBzijgcc/dpd
         Rl0PdXqjq6oa6KcRngAscLnYG1OKLxZVrE32N7OtU0w4jUYoHVZo0TcKcLmmHW7X/l8w
         SZNfbt6Eqf3U8O+OJU1ByIpQaq2O6MKjffgpuQwUhvJcmm7B0FotPI/1rKKlDCB3gdqA
         htsuNcMv0LUUo8yD3MeKC3jak6KAoBIScKUrf2/zOhfV1nRLYdcSF976XnUd4UdzHdOU
         tIMZgxI3u8vWFMl1jAnTgCM5qfTg694sQu/BnOLNSGMGmEVv2Uipl+jZocuBS90OaOLt
         vo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735099176; x=1735703976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNa7GOVBN/qlGQ/A5Jy7mW2Loseznek27MKpExY2eWI=;
        b=pp+2hMEJgUxPSUgOi1axWz3lRAeWM5nICCS2UueRYZrRn13OudP8rOtJ3+rzPiiy4b
         2PMe7/wPhDLATLfjeUpdAH7ZkbtcEXXIWjHwY5uurk5rABNOQRqPxpyrJlrCJvfSwfiB
         CieVZ+Boy8mLKC2pSPwHVBc8e3Gyx8kSqaCeZzpqgealu8tmS1nr/p6OhtqbxHE1l/Jt
         wqCWO39mK47vxcASXt7ogduRjKbsU9gt1MzsLwFQ7nkEh2QlGZRMdSzmhgI1HfsGyi7X
         A71WDc8V55X2GchO4QXtqL3E7ZiU4EljJUFngTZ9C5FhnQljw29UFkSoF3Q+CedbM4T+
         lkzA==
X-Forwarded-Encrypted: i=1; AJvYcCVuhypfL2pMJ+DRD8SlpOxODOnr7ywl2NzMk8VtCS52QVqpfGvpeUZyMEvcLVzDa/q918R0Mbe+02z0p/2Y@vger.kernel.org, AJvYcCW2oVovTJmKr8U9a0YqZpfaWqUrWNPQUj6DcDOXPdjtdgm072QeM2nVJ9GBqzDAb8jc4UjEC8XEDVzd@vger.kernel.org
X-Gm-Message-State: AOJu0YztezstxNvsqF1zodAH5kKRsBr7Stg4llZmv75pUdhxzYGwLUdZ
	k3s1Ru2D34k+Qnjlxe3gcw1liP/I7kFkThYZty5GDYfDl32cmnw8nkjOU8G/1hs=
X-Gm-Gg: ASbGncsPNEWuf4qP/gjSn3FYkbYt8Kf/FGuH+Uft7BtjRug5nAya0/T18c2VNSCTBfW
	WhNQ1EvuhmiOLTmgg1FPMMKxVoD0hYJJqUGoLK3d0BpBw5GYutdF50Tgjr44wptGdaKF1Imb+v6
	3BNSBAMzJyvm4kVRN0TEaB+Vm9mSLHaCtx29IfTKHb0OOFT+IHq/ars82vy3rZp32+CoPweaYv/
	z1BQFd+du5Ue+05aDZ4NJMYVFMfXMHWmyuoj/B8s7FyLCy3MHAJx2UFb57P7yjclFw=
X-Google-Smtp-Source: AGHT+IEYyY5kUMG19rqFkuiDT67e/D03tlJhWls2eTVWnRg0787ha5m4RwdOviQNTAL3vQW9Ua6EyA==
X-Received: by 2002:a17:903:244b:b0:216:34e5:6e49 with SMTP id d9443c01a7336-219e70dd211mr249397415ad.57.1735099176111;
        Tue, 24 Dec 2024 19:59:36 -0800 (PST)
Received: from guoguo-thinkbook.lan ([112.65.12.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d447fsm94256125ad.128.2024.12.24.19.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 19:59:35 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Qingfang Deng <qingfang.deng@siflower.com.cn>,
	Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 2/2] gpio: add support for GPIO controller on Siflower SoCs
Date: Wed, 25 Dec 2024 11:58:51 +0800
Message-ID: <20241225035851.420952-3-gch981213@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241225035851.420952-1-gch981213@gmail.com>
References: <20241225035851.420952-1-gch981213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Qingfang Deng <qingfang.deng@siflower.com.cn>

Add a driver for the GPIO controller on Siflower SoCs.
This controller is found on all current Siflower MIPS and RISC-V
chips including SF19A2890, SF21A6826 and SF21H8898.

Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/gpio/Kconfig         |   9 +
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-siflower.c | 353 +++++++++++++++++++++++++++++++++++
 3 files changed, 363 insertions(+)
 create mode 100644 drivers/gpio/gpio-siflower.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index add5ad29a673..fdc9a89ffbf3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -637,6 +637,15 @@ config GPIO_SIFIVE
 	help
 	  Say yes here to support the GPIO device on SiFive SoCs.
 
+config GPIO_SIFLOWER
+	tristate "SiFlower GPIO support"
+	depends on OF_GPIO
+	depends on MIPS || RISCV || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
+	help
+	  GPIO controller driver for SiFlower MIPS and RISC-V SoCs
+	  including SF19A2890, SF21A6826 and SF21H8898.
+
 config GPIO_SIOX
 	tristate "SIOX GPIO support"
 	depends on SIOX
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index af3ba4d81b58..ec400ed6dcd1 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -151,6 +151,7 @@ obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
 obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
 obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
+obj-$(CONFIG_GPIO_SIFLOWER)		+= gpio-siflower.o
 obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
diff --git a/drivers/gpio/gpio-siflower.c b/drivers/gpio/gpio-siflower.c
new file mode 100644
index 000000000000..bd8002ee127d
--- /dev/null
+++ b/drivers/gpio/gpio-siflower.c
@@ -0,0 +1,353 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * GPIO controller driver for Siflower MIPS and RISC-V SoCs including:
+ *  Siflower SF19A2890
+ *  Siflower SF21A6826
+ *  Siflower SF21H8898
+ *
+ */
+#include <linux/pinctrl/consumer.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <asm/div64.h>
+
+#define GPIO_IR(n)	(0x40 * (n) + 0x00)
+#define GPIO_OR(n)	(0x40 * (n) + 0x04)
+#define GPIO_OEN(n)	(0x40 * (n) + 0x08)
+#define GPIO_IMR(n)	(0x40 * (n) + 0x0c)
+#define GPIO_GPIMR(n)	(0x40 * (n) + 0x10)
+#define GPIO_PIR(n)	(0x40 * (n) + 0x14)
+#define GPIO_ITR(n)	(0x40 * (n) + 0x18)
+#define GPIO_IFR(n)	(0x40 * (n) + 0x1c)
+#define GPIO_ICR(n)	(0x40 * (n) + 0x20)
+#define GPIO_GPxIR(n)	(0x4 * (n) + 0x4000)
+
+#define GPIOS_PER_GROUP	16
+
+struct sf_gpio_priv {
+	struct gpio_chip gc;
+	void __iomem *base;
+	struct clk *clk;
+	struct reset_control *rstc;
+	unsigned int irq[];
+};
+
+#define to_sf_gpio(x)	container_of(x, struct sf_gpio_priv, gc)
+
+static u32 sf_gpio_rd(struct sf_gpio_priv *priv, unsigned long reg)
+{
+	return readl_relaxed(priv->base + reg);
+}
+
+static void sf_gpio_wr(struct sf_gpio_priv *priv, unsigned long reg,
+		       u32 val)
+{
+	writel_relaxed(val, priv->base + reg);
+}
+
+static int sf_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
+{
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+
+	return sf_gpio_rd(priv, GPIO_IR(offset));
+}
+
+static void sf_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+			      int value)
+{
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+
+	sf_gpio_wr(priv, GPIO_OR(offset), value);
+}
+
+static int sf_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+
+	if (sf_gpio_rd(priv, GPIO_OEN(offset)))
+		return GPIO_LINE_DIRECTION_IN;
+	else
+		return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int sf_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+
+	sf_gpio_wr(priv, GPIO_OEN(offset), 1);
+	return 0;
+}
+
+static int sf_gpio_direction_output(struct gpio_chip *gc, unsigned int offset,
+				    int value)
+{
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+
+	sf_gpio_wr(priv, GPIO_OR(offset), value);
+	sf_gpio_wr(priv, GPIO_OEN(offset), 0);
+	return 0;
+}
+
+static int sf_gpio_set_debounce(struct gpio_chip *gc, unsigned int offset,
+				u32 debounce)
+{
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+	unsigned long freq = clk_get_rate(priv->clk);
+	u64 mul;
+
+	/* (ICR + 1) * IFR = debounce_us * clkfreq_mhz / 4 */
+	mul = (u64)debounce * freq;
+	do_div(mul, 1000000 * 4);
+	if (mul > 0xff00)
+		return -EINVAL;
+
+	sf_gpio_wr(priv, GPIO_ICR(offset), 0xff);
+	sf_gpio_wr(priv, GPIO_IFR(offset), DIV_ROUND_UP(mul, 0x100));
+
+	return 0;
+}
+
+static int sf_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
+			      unsigned long config)
+{
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		return sf_gpio_set_debounce(gc, offset,
+			pinconf_to_config_argument(config));
+	default:
+		return gpiochip_generic_config(gc, offset, config);
+	}
+}
+
+static void sf_gpio_irq_ack(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+	unsigned long offset = irqd_to_hwirq(data);
+
+	sf_gpio_wr(priv, GPIO_PIR(offset), 0);
+}
+
+static void sf_gpio_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+	unsigned long offset = irqd_to_hwirq(data);
+
+	sf_gpio_wr(priv, GPIO_IMR(offset), 1);
+	sf_gpio_wr(priv, GPIO_GPIMR(offset), 1);
+}
+
+static void sf_gpio_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+	unsigned long offset = irqd_to_hwirq(data);
+
+	sf_gpio_wr(priv, GPIO_IMR(offset), 0);
+	sf_gpio_wr(priv, GPIO_GPIMR(offset), 0);
+}
+
+/* We are actually setting the parents' affinity. */
+static int sf_gpio_irq_set_affinity(struct irq_data *data,
+				    const struct cpumask *dest, bool force)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	unsigned long offset = irqd_to_hwirq(data);
+	const struct cpumask *pdest;
+	struct irq_desc *pdesc;
+	struct irq_data *pdata;
+	unsigned int group;
+	int ret;
+
+	/* Find the parent IRQ and call its irq_set_affinity */
+	group = offset / GPIOS_PER_GROUP;
+	if (group >= gc->irq.num_parents)
+		return -EINVAL;
+
+	pdesc = irq_to_desc(gc->irq.parents[group]);
+	if (!pdesc)
+		return -EINVAL;
+
+	pdata = irq_desc_get_irq_data(pdesc);
+	if (!pdata->chip->irq_set_affinity)
+		return -EINVAL;
+
+	ret = pdata->chip->irq_set_affinity(pdata, dest, force);
+	if (ret < 0)
+		return ret;
+
+	/* Copy its effective_affinity back */
+	pdest = irq_data_get_effective_affinity_mask(pdata);
+	irq_data_update_effective_affinity(data, pdest);
+	return ret;
+}
+
+static int sf_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+	unsigned long offset = irqd_to_hwirq(data);
+	u32 val;
+
+	switch (flow_type) {
+	case IRQ_TYPE_EDGE_RISING:
+		val = 4;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		val = 2;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		val = 6;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		val = 1;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+	sf_gpio_wr(priv, GPIO_ITR(offset), val);
+
+	if (flow_type & IRQ_TYPE_LEVEL_MASK)
+		irq_set_handler_locked(data, handle_level_irq);
+	else
+		irq_set_handler_locked(data, handle_edge_irq);
+
+	return 0;
+}
+
+static const struct irq_chip sf_gpio_irqchip = {
+	.name			= KBUILD_MODNAME,
+	.irq_ack		= sf_gpio_irq_ack,
+	.irq_mask		= sf_gpio_irq_mask,
+	.irq_unmask		= sf_gpio_irq_unmask,
+	.irq_set_affinity	= sf_gpio_irq_set_affinity,
+	.irq_set_type		= sf_gpio_irq_set_type,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static void sf_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct irq_chip *ic = irq_desc_get_chip(desc);
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+	unsigned int irq = irq_desc_get_irq(desc);
+	unsigned int group = irq - priv->irq[0];
+	unsigned long pending;
+	unsigned int n;
+
+	chained_irq_enter(ic, desc);
+
+	pending = sf_gpio_rd(priv, GPIO_GPxIR(group));
+	for_each_set_bit(n, &pending, GPIOS_PER_GROUP) {
+		generic_handle_domain_irq(gc->irq.domain,
+					  n + group * GPIOS_PER_GROUP);
+	}
+
+	chained_irq_exit(ic, desc);
+}
+
+static int sf_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sf_gpio_priv *priv;
+	struct gpio_irq_chip *girq;
+	struct gpio_chip *gc;
+	u32 ngpios, ngroups;
+	int ret, i;
+
+	ret = of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpios);
+	if (ret)
+		return ret;
+
+	ngroups = DIV_ROUND_UP(ngpios, GPIOS_PER_GROUP);
+	priv = devm_kzalloc(dev, struct_size(priv, irq, ngroups), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
+
+	priv->rstc = devm_reset_control_get_optional(&pdev->dev, NULL);
+	if (IS_ERR(priv->rstc))
+		return PTR_ERR(priv->rstc);
+
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ngroups; i++) {
+		ret = platform_get_irq(pdev, i);
+		if (ret < 0)
+			return ret;
+
+		priv->irq[i] = ret;
+	}
+
+	gc = &priv->gc;
+	gc->label = KBUILD_MODNAME;
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+	gc->request = gpiochip_generic_request;
+	gc->free = gpiochip_generic_free;
+	gc->get_direction = sf_gpio_get_direction;
+	gc->direction_input = sf_gpio_direction_input;
+	gc->direction_output = sf_gpio_direction_output;
+	gc->get = sf_gpio_get_value;
+	gc->set = sf_gpio_set_value;
+	gc->set_config = sf_gpio_set_config;
+	gc->base = -1;
+	gc->ngpio = ngpios;
+
+	girq = &gc->irq;
+	gpio_irq_chip_set_chip(girq, &sf_gpio_irqchip);
+	girq->num_parents = ngroups;
+	girq->parents = priv->irq;
+	girq->parent_handler = sf_gpio_irq_handler;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+
+	return devm_gpiochip_add_data(dev, gc, priv);
+}
+
+static void sf_gpio_remove(struct platform_device *pdev)
+{
+	struct sf_gpio_priv *priv = platform_get_drvdata(pdev);
+
+	reset_control_assert(priv->rstc);
+}
+
+static const struct of_device_id sf_gpio_ids[] = {
+	{ .compatible = "siflower,sf19a2890-gpio" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sf_gpio_ids);
+
+static struct platform_driver sf_gpio_driver = {
+	.probe		= sf_gpio_probe,
+	.remove		= sf_gpio_remove,
+	.driver = {
+		.name		= "siflower_gpio",
+		.owner		= THIS_MODULE,
+		.of_match_table	= sf_gpio_ids,
+	},
+};
+module_platform_driver(sf_gpio_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Qingfang Deng <qingfang.deng@siflower.com.cn>");
+MODULE_DESCRIPTION("GPIO driver for SiFlower SoCs");
-- 
2.47.1


