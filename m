Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD4C62EB42
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 02:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239893AbiKRBrZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 17 Nov 2022 20:47:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240254AbiKRBrO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 20:47:14 -0500
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC03C7A361;
        Thu, 17 Nov 2022 17:47:12 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id C30CD24E0AC;
        Fri, 18 Nov 2022 09:11:14 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:11:14 +0800
Received: from ubuntu.localdomain (183.27.96.116) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:11:14 +0800
From:   Hal Feng <hal.feng@starfivetech.com>
To:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
CC:     Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Hal Feng <hal.feng@starfivetech.com>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 5/5] pinctrl: starfive: Add StarFive JH7110 aon controller driver
Date:   Fri, 18 Nov 2022 09:11:08 +0800
Message-ID: <20221118011108.70715-6-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118011108.70715-1-hal.feng@starfivetech.com>
References: <20221118011108.70715-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.96.116]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jianlong Huang <jianlong.huang@starfivetech.com>

Add pinctrl driver for StarFive JH7110 SoC aon pinctrl controller.

Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 drivers/pinctrl/starfive/Makefile             |   2 +-
 drivers/pinctrl/starfive/pinctrl-jh7110-aon.c | 192 ++++++++++++++++++
 2 files changed, 193 insertions(+), 1 deletion(-)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-jh7110-aon.c

diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 404929f760e8..17cdd1b0e650 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -5,4 +5,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE) += pinctrl-starfive.o
 
 # SoC Drivers
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7100)	+= pinctrl-starfive-jh7100.o
-obj-$(CONFIG_PINCTRL_STARFIVE_JH7110)	+= pinctrl-jh7110-sys.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JH7110)	+= pinctrl-jh7110-sys.o pinctrl-jh7110-aon.o
diff --git a/drivers/pinctrl/starfive/pinctrl-jh7110-aon.c b/drivers/pinctrl/starfive/pinctrl-jh7110-aon.c
new file mode 100644
index 000000000000..7929ecbc03e6
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-jh7110-aon.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Pinctrl / GPIO driver for StarFive JH7110 SoC aon controller
+ *
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/pinctrl/pinctrl-starfive-jh7110.h>
+
+#include "../core.h"
+#include "../pinconf.h"
+#include "../pinmux.h"
+#include "pinctrl-starfive.h"
+
+#define JH7110_AON_NGPIO		4
+#define JH7110_AON_GC_BASE		64
+
+/* registers */
+#define JH7110_AON_DOEN			0x0
+#define JH7110_AON_DOUT			0x4
+#define JH7110_AON_GPI			0x8
+#define JH7110_AON_GPIOIN		0x2c
+
+#define JH7110_AON_GPIOEN		0xc
+#define JH7110_AON_GPIOIS		0x10
+#define JH7110_AON_GPIOIC		0x14
+#define JH7110_AON_GPIOIBE		0x18
+#define JH7110_AON_GPIOIEV		0x1c
+#define JH7110_AON_GPIOIE		0x20
+#define JH7110_AON_GPIORIS		0x28
+#define JH7110_AON_GPIOMIS		0x28
+
+#define AON_GPO_PDA_0_5_CFG		0x30
+
+static const struct pinctrl_pin_desc jh7110_aon_pins[] = {
+	PINCTRL_PIN(PAD_TESTEN,		"TESTEN"),
+	PINCTRL_PIN(PAD_RGPIO0,		"RGPIO0"),
+	PINCTRL_PIN(PAD_RGPIO1,		"RGPIO1"),
+	PINCTRL_PIN(PAD_RGPIO2,		"RGPIO2"),
+	PINCTRL_PIN(PAD_RGPIO3,		"RGPIO3"),
+	PINCTRL_PIN(PAD_RSTN,		"RSTN"),
+	PINCTRL_PIN(PAD_GMAC0_MDC,	"GMAC0_MDC"),
+	PINCTRL_PIN(PAD_GMAC0_MDIO,	"GMAC0_MDIO"),
+	PINCTRL_PIN(PAD_GMAC0_RXD0,	"GMAC0_RXD0"),
+	PINCTRL_PIN(PAD_GMAC0_RXD1,	"GMAC0_RXD1"),
+	PINCTRL_PIN(PAD_GMAC0_RXD2,	"GMAC0_RXD2"),
+	PINCTRL_PIN(PAD_GMAC0_RXD3,	"GMAC0_RXD3"),
+	PINCTRL_PIN(PAD_GMAC0_RXDV,	"GMAC0_RXDV"),
+	PINCTRL_PIN(PAD_GMAC0_RXC,	"GMAC0_RXC"),
+	PINCTRL_PIN(PAD_GMAC0_TXD0,	"GMAC0_TXD0"),
+	PINCTRL_PIN(PAD_GMAC0_TXD1,	"GMAC0_TXD1"),
+	PINCTRL_PIN(PAD_GMAC0_TXD2,	"GMAC0_TXD2"),
+	PINCTRL_PIN(PAD_GMAC0_TXD3,	"GMAC0_TXD3"),
+	PINCTRL_PIN(PAD_GMAC0_TXEN,	"GMAC0_TXEN"),
+	PINCTRL_PIN(PAD_GMAC0_TXC,	"GMAC0_TXC"),
+};
+
+static int jh7110_aon_set_one_pin_mux(struct starfive_pinctrl *sfp,
+				      unsigned int pin,
+				      unsigned int din, u32 dout,
+				      u32 doen, u32 func)
+{
+	if (pin < sfp->gc.ngpio && func == 0)
+		starfive_set_gpiomux(sfp, pin, din, dout, doen);
+
+	return 0;
+}
+
+static int jh7110_aon_get_padcfg_base(struct starfive_pinctrl *sfp,
+				      unsigned int pin)
+{
+	if (pin < PAD_GMAC0_MDC)
+		return AON_GPO_PDA_0_5_CFG;
+
+	return -1;
+}
+
+static void jh7110_aon_irq_handler(struct irq_desc *desc)
+{
+	struct starfive_pinctrl *sfp = starfive_from_irq_desc(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long mis;
+	unsigned int pin;
+
+	chained_irq_enter(chip, desc);
+
+	mis = readl_relaxed(sfp->base + JH7110_AON_GPIOMIS);
+	for_each_set_bit(pin, &mis, JH7110_AON_NGPIO)
+		generic_handle_domain_irq(sfp->gc.irq.domain, pin);
+
+	chained_irq_exit(chip, desc);
+}
+
+static int jh7110_aon_init_hw(struct gpio_chip *gc)
+{
+	struct starfive_pinctrl *sfp = container_of(gc,
+			struct starfive_pinctrl, gc);
+
+	/* mask all GPIO interrupts */
+	writel_relaxed(0, sfp->base + JH7110_AON_GPIOIE);
+	/* clear edge interrupt flags */
+	writel_relaxed(0, sfp->base + JH7110_AON_GPIOIC);
+	writel_relaxed(0x0f, sfp->base + JH7110_AON_GPIOIC);
+	/* enable GPIO interrupts */
+	writel_relaxed(1, sfp->base + JH7110_AON_GPIOEN);
+	return 0;
+}
+
+static const struct starfive_gpio_irq_reg jh7110_aon_irq_reg = {
+	.is_reg_base	= JH7110_AON_GPIOIS,
+	.ic_reg_base	= JH7110_AON_GPIOIC,
+	.ibe_reg_base	= JH7110_AON_GPIOIBE,
+	.iev_reg_base	= JH7110_AON_GPIOIEV,
+	.ie_reg_base	= JH7110_AON_GPIOIE,
+	.ris_reg_base	= JH7110_AON_GPIORIS,
+	.mis_reg_base	= JH7110_AON_GPIOMIS,
+};
+
+static const struct starfive_pinctrl_soc_info jh7110_aon_pinctrl_info = {
+	.pins		= jh7110_aon_pins,
+	.npins		= ARRAY_SIZE(jh7110_aon_pins),
+	.ngpios		= JH7110_AON_NGPIO,
+	.gc_base	= JH7110_AON_GC_BASE,
+	.flags		= 1,
+	.dout_reg_base	= JH7110_AON_DOUT,
+	.dout_mask	= GENMASK(3, 0),
+	.doen_reg_base	= JH7110_AON_DOEN,
+	.doen_mask	= GENMASK(2, 0),
+	.gpi_reg_base	= JH7110_AON_GPI,
+	.gpi_mask	= GENMASK(3, 0),
+	.gpioin_reg_base	   = JH7110_AON_GPIOIN,
+	.irq_reg		   = &jh7110_aon_irq_reg,
+	.starfive_set_one_pin_mux  = jh7110_aon_set_one_pin_mux,
+	.starfive_get_padcfg_base  = jh7110_aon_get_padcfg_base,
+	.starfive_gpio_irq_handler = jh7110_aon_irq_handler,
+	.starfive_gpio_init_hw	   = jh7110_aon_init_hw,
+};
+
+static const struct of_device_id jh7110_aon_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jh7110-aon-pinctrl",
+		.data = &jh7110_aon_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+
+static int jh7110_aon_pinctrl_probe(struct platform_device *pdev)
+{
+	const struct starfive_pinctrl_soc_info *pinctrl_info;
+
+	pinctrl_info = of_device_get_match_data(&pdev->dev);
+	if (!pinctrl_info)
+		return -ENODEV;
+
+	return starfive_pinctrl_probe(pdev, pinctrl_info);
+}
+
+static struct platform_driver jh7110_aon_pinctrl_driver = {
+	.driver = {
+		.name = "starfive-jh7110-aon-pinctrl",
+		.of_match_table = of_match_ptr(jh7110_aon_pinctrl_of_match),
+	},
+	.probe = jh7110_aon_pinctrl_probe,
+};
+
+static int __init jh7110_aon_pinctrl_init(void)
+{
+	return platform_driver_register(&jh7110_aon_pinctrl_driver);
+}
+arch_initcall(jh7110_aon_pinctrl_init);
+
+MODULE_DESCRIPTION("Pinctrl driver for the StarFive JH7110 SoC aon controller");
+MODULE_AUTHOR("Jianlong Huang <jianlong.huang@starfivetech.com>");
-- 
2.38.1

