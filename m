Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FA11F4657
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 20:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732171AbgFISbB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 14:31:01 -0400
Received: from mga01.intel.com ([192.55.52.88]:13462 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389155AbgFISa6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jun 2020 14:30:58 -0400
IronPort-SDR: SmfwtzQDeFWtF9I/hoCytJGr4GGADqSuIlRiI0Pax3yBqhef96oG+fCGcjJcZFq/BV1hHE1jBb
 noUbyMaSq1Pw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2020 11:24:55 -0700
IronPort-SDR: zggL8o+c5C6pYCWXq5VTBjmg7IzttYcaEzYvBMj/Xh1rVmM/KKGAZTLLzwLEcH5CvAnFCrIxnK
 7ClhMI+BxkvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,493,1583222400"; 
   d="scan'208";a="295921281"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 09 Jun 2020 11:24:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 02BED4C5; Tue,  9 Jun 2020 21:24:49 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 6/6] pinctrl: cherryview: Re-use data structures from pinctrl-intel.h (part 3)
Date:   Tue,  9 Jun 2020 21:24:49 +0300
Message-Id: <20200609182449.45813-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200609182449.45813-1-andriy.shevchenko@linux.intel.com>
References: <20200609182449.45813-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We have some data structures duplicated across the drivers.
Let's deduplicate them by using struct intel_pinctrl_soc_data,
struct intel_community and struct intel_pinctrl_context that
are being provided by pinctrl-intel.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 266 +++++++++++----------
 1 file changed, 137 insertions(+), 129 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 1fc46dfb880e..9ef246145bde 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -2,7 +2,7 @@
 /*
  * Cherryview/Braswell pinctrl driver
  *
- * Copyright (C) 2014, Intel Corporation
+ * Copyright (C) 2014, 2020 Intel Corporation
  * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
  *
  * This driver is based on the original Cherryview GPIO driver by
@@ -67,35 +67,7 @@
 #define CHV_PADCTRL1_INTWAKECFG_BOTH	3
 #define CHV_PADCTRL1_INTWAKECFG_LEVEL	4
 
-/**
- * struct chv_community - A community specific configuration
- * @uid: ACPI _UID used to match the community
- * @pins: All pins in this community
- * @npins: Number of pins
- * @groups: All groups in this community
- * @ngroups: Number of groups
- * @functions: All functions in this community
- * @nfunctions: Number of functions
- * @gpps: Pad groups
- * @ngpps: Number of pad groups in this community
- * @nirqs: Total number of IRQs this community can generate
- * @acpi_space_id: An address space ID for ACPI OpRegion handler
- */
-struct chv_community {
-	const char *uid;
-	const struct pinctrl_pin_desc *pins;
-	size_t npins;
-	const struct intel_pingroup *groups;
-	size_t ngroups;
-	const struct intel_function *functions;
-	size_t nfunctions;
-	const struct intel_padgroup *gpps;
-	size_t ngpps;
-	size_t nirqs;
-	acpi_adr_space_type acpi_space_id;
-};
-
-struct chv_pin_context {
+struct intel_pad_context {
 	u32 padctrl0;
 	u32 padctrl1;
 };
@@ -107,13 +79,13 @@ struct chv_pin_context {
  * @pctldev: Pointer to the pin controller device
  * @chip: GPIO chip in this pin controller
  * @irqchip: IRQ chip in this pin controller
- * @regs: MMIO registers
+ * @soc: Community specific pin configuration data
+ * @communities: All communities in this pin controller
+ * @ncommunities: Number of communities in this pin controller
+ * @context: Configuration saved over system sleep
  * @irq: Our parent irq
- * @intr_lines: Stores mapping between 16 HW interrupt wires and GPIO
- *		offset (in GPIO number space)
- * @community: Community this pinctrl instance represents
+ * @intr_lines: Mapping between 16 HW interrupt wires and GPIO offset (in GPIO number space)
  * @saved_intmask: Interrupt mask saved for system sleep
- * @saved_pin_context: Pointer to a context of the pins saved for system sleep
  *
  * The first group in @groups is expected to contain all pins that can be
  * used as GPIOs.
@@ -124,24 +96,34 @@ struct chv_pinctrl {
 	struct pinctrl_dev *pctldev;
 	struct gpio_chip chip;
 	struct irq_chip irqchip;
-	void __iomem *regs;
-	unsigned int irq;
+	const struct intel_pinctrl_soc_data *soc;
+	struct intel_community *communities;
+	size_t ncommunities;
+	struct intel_pinctrl_context context;
+	int irq;
+
 	unsigned int intr_lines[16];
-	const struct chv_community *community;
 	u32 saved_intmask;
-	struct chv_pin_context *saved_pin_context;
 };
 
 #define	PINMODE_INVERT_OE	BIT(15)
 
 #define PINMODE(m, i)		((m) | ((i) * PINMODE_INVERT_OE))
 
-#define CHV_GPP(start, end)		\
+#define CHV_GPP(start, end)			\
 	{					\
 		.base = (start),		\
 		.size = (end) - (start) + 1,	\
 	}
 
+#define CHV_COMMUNITY(g, i, a)			\
+	{					\
+		.gpps = (g),			\
+		.ngpps = ARRAY_SIZE(g),		\
+		.nirqs = (i),			\
+		.acpi_space_id = (a),		\
+	}
+
 static const struct pinctrl_pin_desc southwest_pins[] = {
 	PINCTRL_PIN(0, "FST_SPI_D2"),
 	PINCTRL_PIN(1, "FST_SPI_D0"),
@@ -303,7 +285,15 @@ static const struct intel_padgroup southwest_gpps[] = {
 	CHV_GPP(90, 97),
 };
 
-static const struct chv_community southwest_community = {
+/*
+ * Southwest community can generate GPIO interrupts only for the first 8
+ * interrupts. The upper half (8-15) can only be used to trigger GPEs.
+ */
+static const struct intel_community southwest_communities[] = {
+	CHV_COMMUNITY(southwest_gpps, 8, 0x91),
+};
+
+static const struct intel_pinctrl_soc_data southwest_soc_data = {
 	.uid = "1",
 	.pins = southwest_pins,
 	.npins = ARRAY_SIZE(southwest_pins),
@@ -311,15 +301,8 @@ static const struct chv_community southwest_community = {
 	.ngroups = ARRAY_SIZE(southwest_groups),
 	.functions = southwest_functions,
 	.nfunctions = ARRAY_SIZE(southwest_functions),
-	.gpps = southwest_gpps,
-	.ngpps = ARRAY_SIZE(southwest_gpps),
-	/*
-	 * Southwest community can generate GPIO interrupts only for the
-	 * first 8 interrupts. The upper half (8-15) can only be used to
-	 * trigger GPEs.
-	 */
-	.nirqs = 8,
-	.acpi_space_id = 0x91,
+	.communities = southwest_communities,
+	.ncommunities = ARRAY_SIZE(southwest_communities),
 };
 
 static const struct pinctrl_pin_desc north_pins[] = {
@@ -396,19 +379,20 @@ static const struct intel_padgroup north_gpps[] = {
 	CHV_GPP(60, 72),
 };
 
-static const struct chv_community north_community = {
+/*
+ * North community can generate GPIO interrupts only for the first 8
+ * interrupts. The upper half (8-15) can only be used to trigger GPEs.
+ */
+static const struct intel_community north_communities[] = {
+	CHV_COMMUNITY(north_gpps, 8, 0x92),
+};
+
+static const struct intel_pinctrl_soc_data north_soc_data = {
 	.uid = "2",
 	.pins = north_pins,
 	.npins = ARRAY_SIZE(north_pins),
-	.gpps = north_gpps,
-	.ngpps = ARRAY_SIZE(north_gpps),
-	/*
-	 * North community can generate GPIO interrupts only for the first
-	 * 8 interrupts. The upper half (8-15) can only be used to trigger
-	 * GPEs.
-	 */
-	.nirqs = 8,
-	.acpi_space_id = 0x92,
+	.communities = north_communities,
+	.ncommunities = ARRAY_SIZE(north_communities),
 };
 
 static const struct pinctrl_pin_desc east_pins[] = {
@@ -444,14 +428,16 @@ static const struct intel_padgroup east_gpps[] = {
 	CHV_GPP(15, 26),
 };
 
-static const struct chv_community east_community = {
+static const struct intel_community east_communities[] = {
+	CHV_COMMUNITY(east_gpps, 16, 0x93),
+};
+
+static const struct intel_pinctrl_soc_data east_soc_data = {
 	.uid = "3",
 	.pins = east_pins,
 	.npins = ARRAY_SIZE(east_pins),
-	.gpps = east_gpps,
-	.ngpps = ARRAY_SIZE(east_gpps),
-	.nirqs = 16,
-	.acpi_space_id = 0x93,
+	.communities = east_communities,
+	.ncommunities = ARRAY_SIZE(east_communities),
 };
 
 static const struct pinctrl_pin_desc southeast_pins[] = {
@@ -566,7 +552,11 @@ static const struct intel_padgroup southeast_gpps[] = {
 	CHV_GPP(75, 85),
 };
 
-static const struct chv_community southeast_community = {
+static const struct intel_community southeast_communities[] = {
+	CHV_COMMUNITY(southeast_gpps, 16, 0x94),
+};
+
+static const struct intel_pinctrl_soc_data southeast_soc_data = {
 	.uid = "4",
 	.pins = southeast_pins,
 	.npins = ARRAY_SIZE(southeast_pins),
@@ -574,17 +564,16 @@ static const struct chv_community southeast_community = {
 	.ngroups = ARRAY_SIZE(southeast_groups),
 	.functions = southeast_functions,
 	.nfunctions = ARRAY_SIZE(southeast_functions),
-	.gpps = southeast_gpps,
-	.ngpps = ARRAY_SIZE(southeast_gpps),
-	.nirqs = 16,
-	.acpi_space_id = 0x94,
+	.communities = southeast_communities,
+	.ncommunities = ARRAY_SIZE(southeast_communities),
 };
 
-static const struct chv_community *chv_communities[] = {
-	&southwest_community,
-	&north_community,
-	&east_community,
-	&southeast_community,
+static const struct intel_pinctrl_soc_data *chv_soc_data[] = {
+	&southwest_soc_data,
+	&north_soc_data,
+	&east_soc_data,
+	&southeast_soc_data,
+	NULL
 };
 
 /*
@@ -600,12 +589,15 @@ static DEFINE_RAW_SPINLOCK(chv_lock);
 
 static u32 chv_pctrl_readl(struct chv_pinctrl *pctrl, unsigned int offset)
 {
-	return readl(pctrl->regs + offset);
+	const struct intel_community *community = &pctrl->communities[0];
+
+	return readl(community->regs + offset);
 }
 
 static void chv_pctrl_writel(struct chv_pinctrl *pctrl, unsigned int offset, u32 value)
 {
-	void __iomem *reg = pctrl->regs + offset;
+	const struct intel_community *community = &pctrl->communities[0];
+	void __iomem *reg = community->regs + offset;
 
 	/* Write and simple read back to confirm the bus transferring done */
 	writel(value, reg);
@@ -615,13 +607,13 @@ static void chv_pctrl_writel(struct chv_pinctrl *pctrl, unsigned int offset, u32
 static void __iomem *chv_padreg(struct chv_pinctrl *pctrl, unsigned int offset,
 				unsigned int reg)
 {
+	const struct intel_community *community = &pctrl->communities[0];
 	unsigned int family_no = offset / MAX_FAMILY_PAD_GPIO_NO;
 	unsigned int pad_no = offset % MAX_FAMILY_PAD_GPIO_NO;
 
-	offset = FAMILY_PAD_REGS_OFF + FAMILY_PAD_REGS_SIZE * family_no +
-		 GPIO_REGS_SIZE * pad_no;
+	offset = FAMILY_PAD_REGS_SIZE * family_no + GPIO_REGS_SIZE * pad_no;
 
-	return pctrl->regs + offset + reg;
+	return community->pad_regs + offset + reg;
 }
 
 static u32 chv_readl(struct chv_pinctrl *pctrl, unsigned int pin, unsigned int offset)
@@ -648,7 +640,7 @@ static int chv_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
-	return pctrl->community->ngroups;
+	return pctrl->soc->ngroups;
 }
 
 static const char *chv_get_group_name(struct pinctrl_dev *pctldev,
@@ -656,7 +648,7 @@ static const char *chv_get_group_name(struct pinctrl_dev *pctldev,
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
-	return pctrl->community->groups[group].name;
+	return pctrl->soc->groups[group].name;
 }
 
 static int chv_get_group_pins(struct pinctrl_dev *pctldev, unsigned int group,
@@ -664,8 +656,8 @@ static int chv_get_group_pins(struct pinctrl_dev *pctldev, unsigned int group,
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
-	*pins = pctrl->community->groups[group].pins;
-	*npins = pctrl->community->groups[group].npins;
+	*pins = pctrl->soc->groups[group].pins;
+	*npins = pctrl->soc->groups[group].npins;
 	return 0;
 }
 
@@ -713,7 +705,7 @@ static int chv_get_functions_count(struct pinctrl_dev *pctldev)
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
-	return pctrl->community->nfunctions;
+	return pctrl->soc->nfunctions;
 }
 
 static const char *chv_get_function_name(struct pinctrl_dev *pctldev,
@@ -721,7 +713,7 @@ static const char *chv_get_function_name(struct pinctrl_dev *pctldev,
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
-	return pctrl->community->functions[function].name;
+	return pctrl->soc->functions[function].name;
 }
 
 static int chv_get_function_groups(struct pinctrl_dev *pctldev,
@@ -731,8 +723,8 @@ static int chv_get_function_groups(struct pinctrl_dev *pctldev,
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
-	*groups = pctrl->community->functions[function].groups;
-	*ngroups = pctrl->community->functions[function].ngroups;
+	*groups = pctrl->soc->functions[function].groups;
+	*ngroups = pctrl->soc->functions[function].ngroups;
 	return 0;
 }
 
@@ -744,7 +736,7 @@ static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	unsigned long flags;
 	int i;
 
-	grp = &pctrl->community->groups[group];
+	grp = &pctrl->soc->groups[group];
 
 	raw_spin_lock_irqsave(&chv_lock, flags);
 
@@ -1412,6 +1404,7 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
+	const struct intel_community *community = &pctrl->communities[0];
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long pending;
 	unsigned long flags;
@@ -1423,7 +1416,7 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
 	pending = chv_pctrl_readl(pctrl, CHV_INTSTAT);
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
 
-	for_each_set_bit(intr_line, &pending, pctrl->community->nirqs) {
+	for_each_set_bit(intr_line, &pending, community->nirqs) {
 		unsigned int irq, offset;
 
 		offset = pctrl->intr_lines[intr_line];
@@ -1480,15 +1473,15 @@ static void chv_init_irq_valid_mask(struct gpio_chip *chip,
 				    unsigned int ngpios)
 {
 	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
-	const struct chv_community *community = pctrl->community;
+	const struct intel_community *community = &pctrl->communities[0];
 	int i;
 
 	/* Do not add GPIOs that can only generate GPEs to the IRQ domain */
-	for (i = 0; i < community->npins; i++) {
+	for (i = 0; i < pctrl->soc->npins; i++) {
 		const struct pinctrl_pin_desc *desc;
 		u32 intsel;
 
-		desc = &community->pins[i];
+		desc = &pctrl->soc->pins[i];
 
 		intsel = chv_readl(pctrl, desc->number, CHV_PADCTRL0);
 		intsel &= CHV_PADCTRL0_INTSEL_MASK;
@@ -1502,6 +1495,7 @@ static void chv_init_irq_valid_mask(struct gpio_chip *chip,
 static int chv_gpio_irq_init_hw(struct gpio_chip *chip)
 {
 	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
+	const struct intel_community *community = &pctrl->communities[0];
 
 	/*
 	 * The same set of machines in chv_no_valid_mask[] have incorrectly
@@ -1515,7 +1509,7 @@ static int chv_gpio_irq_init_hw(struct gpio_chip *chip)
 		 * Mask all interrupts the community is able to generate
 		 * but leave the ones that can only generate GPEs unmasked.
 		 */
-		chv_pctrl_writel(pctrl, CHV_INTMASK, GENMASK(31, pctrl->community->nirqs));
+		chv_pctrl_writel(pctrl, CHV_INTMASK, GENMASK(31, community->nirqs));
 	}
 
 	/* Clear all interrupts */
@@ -1527,7 +1521,7 @@ static int chv_gpio_irq_init_hw(struct gpio_chip *chip)
 static int chv_gpio_add_pin_ranges(struct gpio_chip *chip)
 {
 	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
-	const struct chv_community *community = pctrl->community;
+	const struct intel_community *community = &pctrl->communities[0];
 	const struct intel_padgroup *gpp;
 	int ret, i;
 
@@ -1547,15 +1541,15 @@ static int chv_gpio_add_pin_ranges(struct gpio_chip *chip)
 
 static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 {
+	const struct intel_community *community = &pctrl->communities[0];
 	const struct intel_padgroup *gpp;
 	struct gpio_chip *chip = &pctrl->chip;
 	bool need_valid_mask = !dmi_check_system(chv_no_valid_mask);
-	const struct chv_community *community = pctrl->community;
 	int ret, i, irq_base;
 
 	*chip = chv_gpio_chip;
 
-	chip->ngpio = community->pins[community->npins - 1].number + 1;
+	chip->ngpio = pctrl->soc->pins[pctrl->soc->npins - 1].number + 1;
 	chip->label = dev_name(pctrl->dev);
 	chip->add_pin_ranges = chv_gpio_add_pin_ranges;
 	chip->parent = pctrl->dev;
@@ -1581,7 +1575,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 		chip->irq.init_valid_mask = chv_init_irq_valid_mask;
 	} else {
 		irq_base = devm_irq_alloc_descs(pctrl->dev, -1, 0,
-						community->npins, NUMA_NO_NODE);
+						pctrl->soc->npins, NUMA_NO_NODE);
 		if (irq_base < 0) {
 			dev_err(pctrl->dev, "Failed to allocate IRQ numbers\n");
 			return irq_base;
@@ -1631,6 +1625,10 @@ static acpi_status chv_pinctrl_mmio_access_handler(u32 function,
 
 static int chv_pinctrl_probe(struct platform_device *pdev)
 {
+	const struct intel_pinctrl_soc_data *soc_data = NULL;
+	const struct intel_pinctrl_soc_data **soc_table;
+	struct intel_community *community;
+	struct device *dev = &pdev->dev;
 	struct chv_pinctrl *pctrl;
 	struct acpi_device *adev;
 	acpi_status status;
@@ -1640,40 +1638,53 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 	if (!adev)
 		return -ENODEV;
 
-	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
-	if (!pctrl)
-		return -ENOMEM;
-
-	for (i = 0; i < ARRAY_SIZE(chv_communities); i++)
-		if (!strcmp(adev->pnp.unique_id, chv_communities[i]->uid)) {
-			pctrl->community = chv_communities[i];
+	soc_table = (const struct intel_pinctrl_soc_data **)device_get_match_data(dev);
+	for (i = 0; soc_table[i]; i++) {
+		if (!strcmp(adev->pnp.unique_id, soc_table[i]->uid)) {
+			soc_data = soc_table[i];
 			break;
 		}
-	if (i == ARRAY_SIZE(chv_communities))
+	}
+	if (!soc_data)
 		return -ENODEV;
 
+	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
 	pctrl->dev = &pdev->dev;
+	pctrl->soc = soc_data;
+
+	pctrl->ncommunities = pctrl->soc->ncommunities;
+	pctrl->communities = devm_kmemdup(dev, pctrl->soc->communities,
+					  pctrl->ncommunities * sizeof(*pctrl->communities),
+					  GFP_KERNEL);
+	if (!pctrl->communities)
+		return -ENOMEM;
+
+	community = &pctrl->communities[0];
+	community->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(community->regs))
+		return PTR_ERR(community->regs);
+
+	community->pad_regs = community->regs + FAMILY_PAD_REGS_OFF;
 
 #ifdef CONFIG_PM_SLEEP
-	pctrl->saved_pin_context = devm_kcalloc(pctrl->dev,
-		pctrl->community->npins, sizeof(*pctrl->saved_pin_context),
-		GFP_KERNEL);
-	if (!pctrl->saved_pin_context)
+	pctrl->context.pads = devm_kcalloc(dev, pctrl->soc->npins,
+					   sizeof(*pctrl->context.pads),
+					   GFP_KERNEL);
+	if (!pctrl->context.pads)
 		return -ENOMEM;
 #endif
 
-	pctrl->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(pctrl->regs))
-		return PTR_ERR(pctrl->regs);
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
 	pctrl->pctldesc = chv_pinctrl_desc;
 	pctrl->pctldesc.name = dev_name(&pdev->dev);
-	pctrl->pctldesc.pins = pctrl->community->pins;
-	pctrl->pctldesc.npins = pctrl->community->npins;
+	pctrl->pctldesc.pins = pctrl->soc->pins;
+	pctrl->pctldesc.npins = pctrl->soc->npins;
 
 	pctrl->pctldev = devm_pinctrl_register(&pdev->dev, &pctrl->pctldesc,
 					       pctrl);
@@ -1687,7 +1698,7 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 		return ret;
 
 	status = acpi_install_address_space_handler(adev->handle,
-					pctrl->community->acpi_space_id,
+					community->acpi_space_id,
 					chv_pinctrl_mmio_access_handler,
 					NULL, pctrl);
 	if (ACPI_FAILURE(status))
@@ -1701,9 +1712,10 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 static int chv_pinctrl_remove(struct platform_device *pdev)
 {
 	struct chv_pinctrl *pctrl = platform_get_drvdata(pdev);
+	const struct intel_community *community = &pctrl->communities[0];
 
 	acpi_remove_address_space_handler(ACPI_COMPANION(&pdev->dev),
-					  pctrl->community->acpi_space_id,
+					  community->acpi_space_id,
 					  chv_pinctrl_mmio_access_handler);
 
 	return 0;
@@ -1720,16 +1732,14 @@ static int chv_pinctrl_suspend_noirq(struct device *dev)
 
 	pctrl->saved_intmask = chv_pctrl_readl(pctrl, CHV_INTMASK);
 
-	for (i = 0; i < pctrl->community->npins; i++) {
+	for (i = 0; i < pctrl->soc->npins; i++) {
 		const struct pinctrl_pin_desc *desc;
-		struct chv_pin_context *ctx;
+		struct intel_pad_context *ctx = &pctrl->context.pads[i];
 
-		desc = &pctrl->community->pins[i];
+		desc = &pctrl->soc->pins[i];
 		if (chv_pad_locked(pctrl, desc->number))
 			continue;
 
-		ctx = &pctrl->saved_pin_context[i];
-
 		ctx->padctrl0 = chv_readl(pctrl, desc->number, CHV_PADCTRL0);
 		ctx->padctrl0 &= ~CHV_PADCTRL0_GPIORXSTATE;
 
@@ -1756,17 +1766,15 @@ static int chv_pinctrl_resume_noirq(struct device *dev)
 	 */
 	chv_pctrl_writel(pctrl, CHV_INTMASK, 0x0000);
 
-	for (i = 0; i < pctrl->community->npins; i++) {
+	for (i = 0; i < pctrl->soc->npins; i++) {
 		const struct pinctrl_pin_desc *desc;
-		const struct chv_pin_context *ctx;
+		struct intel_pad_context *ctx = &pctrl->context.pads[i];
 		u32 val;
 
-		desc = &pctrl->community->pins[i];
+		desc = &pctrl->soc->pins[i];
 		if (chv_pad_locked(pctrl, desc->number))
 			continue;
 
-		ctx = &pctrl->saved_pin_context[i];
-
 		/* Only restore if our saved state differs from the current */
 		val = chv_readl(pctrl, desc->number, CHV_PADCTRL0);
 		val &= ~CHV_PADCTRL0_GPIORXSTATE;
@@ -1803,7 +1811,7 @@ static const struct dev_pm_ops chv_pinctrl_pm_ops = {
 };
 
 static const struct acpi_device_id chv_pinctrl_acpi_match[] = {
-	{ "INT33FF" },
+	{ "INT33FF", (kernel_ulong_t)chv_soc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, chv_pinctrl_acpi_match);
-- 
2.27.0.rc2

