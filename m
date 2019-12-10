Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A89431185F8
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 12:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfLJLM0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 06:12:26 -0500
Received: from mail-dm6nam10on2051.outbound.protection.outlook.com ([40.107.93.51]:57249
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727333AbfLJLMZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 06:12:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLvOqP8+512qqEleh0/+e7Yys5KTQ1jjR4b/hs2qppfe4yZ4lmE6gYKZ8nZyymSZ8nvvXXPMBWogSLN1eqqEeEQlJE/n9+n0+RtjStG5rx5sfc6ySQaIpB//Xtlw+Vy2+/BPSNAFv00400pjCLSlJA7UtTk2uShsPGoy8J5Tt8qpTOuKG0DkK1tZpFXRQqChE4gtCF0qtO/LDaG/oFEZ0nDe39KNaNZpxLLMkSa/UQHlIq/4FI8roICljd/Qqkcovn1B5fF0yAN9b6YYFKW4NmngiI1dDAsSSN6fTCvAmVGOO/4UCWK64wgoUOxlvEUW69bHwcplmBGoElHgvnj44A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSaK8n7MUy89PWGX7t2FffQsatulGBvU5QlXzOTu/iY=;
 b=aNWCdqa6Yegvc1vaNQXoj9epPZbreSrRut26PZwpzdfjuxxeLkctLNtJ7hhXhpQzFM2+fMeRuLzJm3hc+9PhH4uOpBPHnn6HAcSQ6fYs/a4zL1HfmGIXqB1LYcKvAaR/P1MKJUmR0s91ClBt4yIVZi6OVeM0GIkuNlDlUrmVNeZbnbQNA9g9pj6w/UrYrfQoKE4KNj+KP7cvzt+MEzUfSMK461gZ/gvMhuJnrkMiIaU9dECq17DHcarylXA0GaUkWwYx1XhigBw3DVJ6M1awf/pVnzT2jFVdf7lGryF8Tacluo1+9loc73F2E6CrOmfHzxA55UXeBOkJkBTGbvqEiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSaK8n7MUy89PWGX7t2FffQsatulGBvU5QlXzOTu/iY=;
 b=Dh687ewksWuQKQ6Hw8EjaDeO0z66GePFlMh9n8QdgWdR8zgHPXJrt/mAV5feBrM25ANvFINTNRHlAlLP3nP5YodPRpb2PSF3t1t/JnXA67+7Y1CR3zUM/Cw7Jkqf3jWQdJ3s8djLuvpTX5BLRxBUtGWgekSWsP0tw5T54T0fDTY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3656.namprd13.prod.outlook.com (20.180.4.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.14; Tue, 10 Dec 2019 11:12:10 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5%3]) with mapi id 15.20.2538.012; Tue, 10 Dec 2019
 11:12:10 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, palmer@dabbelt.com,
        paul.walmsley@sifive.com
Cc:     aou@eecs.berkeley.edu, tglx@linutronix.de, jason@lakedaemon.net,
        maz@kernel.org, bmeng.cn@gmail.com, atish.patra@wdc.com,
        sagar.kadam@sifive.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
        Yash Shah <yash.shah@sifive.com>
Subject: [PATCH v4 5/6] gpio: sifive: Add GPIO driver for SiFive SoCs
Date:   Tue, 10 Dec 2019 16:41:13 +0530
Message-Id: <1575976274-13487-6-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
References: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
Content-Type: text/plain
X-ClientProxiedBy: PN1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::14) To CH2PR13MB3368.namprd13.prod.outlook.com
 (2603:10b6:610:2c::26)
MIME-Version: 1.0
Received: from dhananjayk-PowerEdge-R620.open-silicon.com (114.143.65.226) by PN1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::14) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Tue, 10 Dec 2019 11:12:05 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [114.143.65.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca5359b3-a188-41f2-1fba-08d77d61ccf7
X-MS-TrafficTypeDiagnostic: CH2PR13MB3656:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR13MB365657DA87943D294ACE55828C5B0@CH2PR13MB3656.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 02475B2A01
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(6029001)(396003)(39850400004)(366004)(136003)(346002)(376002)(199004)(189003)(36756003)(66476007)(1006002)(107886003)(52116002)(6666004)(66946007)(6506007)(26005)(956004)(316002)(2616005)(81166006)(8936002)(81156014)(16526019)(186003)(8676002)(44832011)(6636002)(5660300002)(86362001)(6486002)(7416002)(66556008)(6512007)(4326008)(478600001)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3656;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FSyl6OIUbLpAciuL6ltd9MsSXbDnk++WwRmfLU5p3ad6L+OvgyWpYy2Rs6swSitSsFscxOGTudCmeJ24OLsdacQsLEP916Co7Tk+KS5L+wZH1ZDvmA1+5wuxZei8P7lMt/CJeovyt8fpwYxuWGv08dwWRVSwZXap0I20k82ViJd6Ooo5ZvJgmakrU1DawvYv28GVixCZkvRLVxOq5pdaGzk4uWQ9e5G6iGEUBduB/7BuWeCpztnr1PG20eHauTmz75gjC2yQoL1xMmJjC5fmEghkZDFmeZCaCBprZI3OfaFoZAqIEQzFEMTgCkY61RM12OWrtJLy3F3imL9fNBcpy3soEF5I1OjXp0U9SKbM0igZG5BHU5gp+wzW8bmCF1kD6pXmC0kN7QlA0+FALVd4QnLIg1nHx5Scgg9pCnp0T4/5KCAzuBUp7ZPoEmGQ9rkR
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5359b3-a188-41f2-1fba-08d77d61ccf7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 11:12:10.5149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAU/Y3dGMncqX7QzzbrP1ubSeIcnIAYLzpn0VeK/Rxke2DwYFioyFM0pedPTHJoBIWGx6ifp1XXemgDNDb5y0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3656
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adds the GPIO driver for SiFive RISC-V SoCs.

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
[Atish: Various fixes and code cleanup]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 drivers/gpio/Kconfig       |   9 ++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-sifive.c | 252 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 262 insertions(+)
 create mode 100644 drivers/gpio/gpio-sifive.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 38e096e..05e8a41 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -453,6 +453,15 @@ config GPIO_SAMA5D2_PIOBU
 	  The difference from regular GPIOs is that they
 	  maintain their value during backup/self-refresh.
 
+config GPIO_SIFIVE
+	bool "SiFive GPIO support"
+	depends on OF_GPIO
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	select REGMAP_MMIO
+	help
+	  Say yes here to support the GPIO device on SiFive SoCs.
+
 config GPIO_SIOX
 	tristate "SIOX GPIO support"
 	depends on SIOX
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index d2fd19c..bf7984e 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -121,6 +121,7 @@ obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
 obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
+obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
new file mode 100644
index 0000000..147a1bd
--- /dev/null
+++ b/drivers/gpio/gpio-sifive.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 SiFive
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/of_irq.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/regmap.h>
+
+#define SIFIVE_GPIO_INPUT_VAL	0x00
+#define SIFIVE_GPIO_INPUT_EN	0x04
+#define SIFIVE_GPIO_OUTPUT_EN	0x08
+#define SIFIVE_GPIO_OUTPUT_VAL	0x0C
+#define SIFIVE_GPIO_RISE_IE	0x18
+#define SIFIVE_GPIO_RISE_IP	0x1C
+#define SIFIVE_GPIO_FALL_IE	0x20
+#define SIFIVE_GPIO_FALL_IP	0x24
+#define SIFIVE_GPIO_HIGH_IE	0x28
+#define SIFIVE_GPIO_HIGH_IP	0x2C
+#define SIFIVE_GPIO_LOW_IE	0x30
+#define SIFIVE_GPIO_LOW_IP	0x34
+#define SIFIVE_GPIO_OUTPUT_XOR	0x40
+
+#define SIFIVE_GPIO_MAX		32
+#define SIFIVE_GPIO_IRQ_OFFSET	7
+
+struct sifive_gpio {
+	void __iomem		*base;
+	struct gpio_chip	gc;
+	struct regmap		*regs;
+	u32			irq_state;
+	unsigned int		trigger[SIFIVE_GPIO_MAX];
+	unsigned int		irq_parent[SIFIVE_GPIO_MAX];
+};
+
+static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
+{
+	unsigned long flags;
+	unsigned int trigger;
+
+	spin_lock_irqsave(&chip->gc.bgpio_lock, flags);
+	trigger = (chip->irq_state & BIT(offset)) ? chip->trigger[offset] : 0;
+	regmap_update_bits(chip->regs, SIFIVE_GPIO_RISE_IE, BIT(offset),
+			   (trigger & IRQ_TYPE_EDGE_RISING) ? BIT(offset) : 0);
+	regmap_update_bits(chip->regs, SIFIVE_GPIO_FALL_IE, BIT(offset),
+			   (trigger & IRQ_TYPE_EDGE_FALLING) ? BIT(offset) : 0);
+	regmap_update_bits(chip->regs, SIFIVE_GPIO_HIGH_IE, BIT(offset),
+			   (trigger & IRQ_TYPE_LEVEL_HIGH) ? BIT(offset) : 0);
+	regmap_update_bits(chip->regs, SIFIVE_GPIO_LOW_IE, BIT(offset),
+			   (trigger & IRQ_TYPE_LEVEL_LOW) ? BIT(offset) : 0);
+	spin_unlock_irqrestore(&chip->gc.bgpio_lock, flags);
+}
+
+static int sifive_gpio_irq_set_type(struct irq_data *d, unsigned int trigger)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(d);
+
+	if (offset < 0 || offset >= gc->ngpio)
+		return -EINVAL;
+
+	chip->trigger[offset] = trigger;
+	sifive_gpio_set_ie(chip, offset);
+	return 0;
+}
+
+static void sifive_gpio_irq_enable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
+	u32 bit = BIT(offset);
+	unsigned long flags;
+
+	irq_chip_enable_parent(d);
+
+	/* Switch to input */
+	gc->direction_input(gc, offset);
+
+	spin_lock_irqsave(&gc->bgpio_lock, flags);
+	/* Clear any sticky pending interrupts */
+	regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
+	regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
+	regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
+	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
+	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	/* Enable interrupts */
+	assign_bit(offset, (unsigned long *)&chip->irq_state, 1);
+	sifive_gpio_set_ie(chip, offset);
+}
+
+static void sifive_gpio_irq_disable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
+
+	assign_bit(offset, (unsigned long *)&chip->irq_state, 0);
+	sifive_gpio_set_ie(chip, offset);
+	irq_chip_disable_parent(d);
+}
+
+static void sifive_gpio_irq_eoi(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
+	u32 bit = BIT(offset);
+	unsigned long flags;
+
+	spin_lock_irqsave(&gc->bgpio_lock, flags);
+	/* Clear all pending interrupts */
+	regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
+	regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
+	regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
+	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
+	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	irq_chip_eoi_parent(d);
+}
+
+static struct irq_chip sifive_gpio_irqchip = {
+	.name		= "sifive-gpio",
+	.irq_set_type	= sifive_gpio_irq_set_type,
+	.irq_mask	= irq_chip_mask_parent,
+	.irq_unmask	= irq_chip_unmask_parent,
+	.irq_enable	= sifive_gpio_irq_enable,
+	.irq_disable	= sifive_gpio_irq_disable,
+	.irq_eoi	= sifive_gpio_irq_eoi,
+};
+
+static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
+					     unsigned int child,
+					     unsigned int child_type,
+					     unsigned int *parent,
+					     unsigned int *parent_type)
+{
+	*parent_type = IRQ_TYPE_NONE;
+	*parent = child + SIFIVE_GPIO_IRQ_OFFSET;
+	return 0;
+}
+
+static const struct regmap_config sifive_gpio_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.disable_locking = true,
+};
+
+static int sifive_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = pdev->dev.of_node;
+	struct device_node *irq_parent;
+	struct irq_domain *parent;
+	struct gpio_irq_chip *girq;
+	struct sifive_gpio *chip;
+	int ret, ngpio;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(chip->base)) {
+		dev_err(dev, "failed to allocate device memory\n");
+		return PTR_ERR(chip->base);
+	}
+
+	chip->regs = devm_regmap_init_mmio(dev, chip->base,
+					   &sifive_gpio_regmap_config);
+	if (IS_ERR(chip->regs))
+		return PTR_ERR(chip->regs);
+
+	ngpio = of_irq_count(node);
+	if (ngpio >= SIFIVE_GPIO_MAX) {
+		dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
+			SIFIVE_GPIO_MAX);
+		return -ENXIO;
+	}
+
+	irq_parent = of_irq_find_parent(node);
+	if (!irq_parent) {
+		dev_err(dev, "no IRQ parent node\n");
+		return -ENODEV;
+	}
+	parent = irq_find_host(irq_parent);
+	if (!parent) {
+		dev_err(dev, "no IRQ parent domain\n");
+		return -ENODEV;
+	}
+
+	ret = bgpio_init(&chip->gc, dev, 4,
+			 chip->base + SIFIVE_GPIO_INPUT_VAL,
+			 chip->base + SIFIVE_GPIO_OUTPUT_VAL,
+			 NULL,
+			 chip->base + SIFIVE_GPIO_OUTPUT_EN,
+			 chip->base + SIFIVE_GPIO_INPUT_EN,
+			 0);
+	if (ret) {
+		dev_err(dev, "unable to init generic GPIO\n");
+		return ret;
+	}
+
+	/* Disable all GPIO interrupts before enabling parent interrupts */
+	regmap_write(chip->regs, SIFIVE_GPIO_RISE_IE, 0);
+	regmap_write(chip->regs, SIFIVE_GPIO_FALL_IE, 0);
+	regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IE, 0);
+	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IE, 0);
+	chip->irq_state = 0;
+
+	chip->gc.base = -1;
+	chip->gc.ngpio = ngpio;
+	chip->gc.label = dev_name(dev);
+	chip->gc.parent = dev;
+	chip->gc.owner = THIS_MODULE;
+	girq = &chip->gc.irq;
+	girq->chip = &sifive_gpio_irqchip;
+	girq->fwnode = of_node_to_fwnode(node);
+	girq->parent_domain = parent;
+	girq->child_to_parent_hwirq = sifive_gpio_child_to_parent_hwirq;
+	girq->handler = handle_bad_irq;
+	girq->default_type = IRQ_TYPE_NONE;
+
+	platform_set_drvdata(pdev, chip);
+	return gpiochip_add_data(&chip->gc, chip);
+}
+
+static const struct of_device_id sifive_gpio_match[] = {
+	{ .compatible = "sifive,gpio0" },
+	{ .compatible = "sifive,fu540-c000-gpio" },
+	{ },
+};
+
+static struct platform_driver sifive_gpio_driver = {
+	.probe		= sifive_gpio_probe,
+	.driver = {
+		.name	= "sifive_gpio",
+		.of_match_table = of_match_ptr(sifive_gpio_match),
+	},
+};
+builtin_platform_driver(sifive_gpio_driver)
-- 
2.7.4

