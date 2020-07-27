Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E4422F48B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 18:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731249AbgG0QQX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 12:16:23 -0400
Received: from mga14.intel.com ([192.55.52.115]:53443 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728544AbgG0QQW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Jul 2020 12:16:22 -0400
IronPort-SDR: jRyu3NUM2vv2BQtn7DFWlxDqJMdLzkYBUzFaQRijGXHUOpBD6ktWAlDSzjxX+9rnC00ajGtf/F
 Iaj0yiTNRI3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="150226962"
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="150226962"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2020 09:12:19 -0700
IronPort-SDR: xf+GZFIvO0BUjp5A4TT+qqd/Wcpso410MBJ1FmCeQc4Gx13Nd8vYjwLjsKtwp2HylZ/E7rCXNx
 50tIvF9B56kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="321865223"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2020 09:12:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2CB8B408; Mon, 27 Jul 2020 19:12:17 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] pinctrl: cherryview: Switch to use struct intel_pinctrl
Date:   Mon, 27 Jul 2020 19:12:16 +0300
Message-Id: <20200727161216.67115-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727161216.67115-1-andriy.shevchenko@linux.intel.com>
References: <20200727161216.67115-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now when all preparations are done we may easily switch to use
struct intel_pinctrl instead of custom one.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 104 ++++++++-------------
 1 file changed, 39 insertions(+), 65 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 6b2fbc0ac422..c18abc1a0d04 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -82,32 +82,6 @@ struct intel_community_context {
 	u32 saved_intmask;
 };
 
-/**
- * struct chv_pinctrl - CHV pinctrl private structure
- * @dev: Pointer to the parent device
- * @pctldesc: Pin controller description
- * @pctldev: Pointer to the pin controller device
- * @chip: GPIO chip in this pin controller
- * @irqchip: IRQ chip in this pin controller
- * @soc: Community specific pin configuration data
- * @communities: All communities in this pin controller
- * @ncommunities: Number of communities in this pin controller
- * @context: Configuration saved over system sleep
- * @irq: Our parent irq
- */
-struct chv_pinctrl {
-	struct device *dev;
-	struct pinctrl_desc pctldesc;
-	struct pinctrl_dev *pctldev;
-	struct gpio_chip chip;
-	struct irq_chip irqchip;
-	const struct intel_pinctrl_soc_data *soc;
-	struct intel_community *communities;
-	size_t ncommunities;
-	struct intel_pinctrl_context context;
-	int irq;
-};
-
 #define	PINMODE_INVERT_OE	BIT(15)
 
 #define PINMODE(m, i)		((m) | ((i) * PINMODE_INVERT_OE))
@@ -589,14 +563,14 @@ static const struct intel_pinctrl_soc_data *chv_soc_data[] = {
  */
 static DEFINE_RAW_SPINLOCK(chv_lock);
 
-static u32 chv_pctrl_readl(struct chv_pinctrl *pctrl, unsigned int offset)
+static u32 chv_pctrl_readl(struct intel_pinctrl *pctrl, unsigned int offset)
 {
 	const struct intel_community *community = &pctrl->communities[0];
 
 	return readl(community->regs + offset);
 }
 
-static void chv_pctrl_writel(struct chv_pinctrl *pctrl, unsigned int offset, u32 value)
+static void chv_pctrl_writel(struct intel_pinctrl *pctrl, unsigned int offset, u32 value)
 {
 	const struct intel_community *community = &pctrl->communities[0];
 	void __iomem *reg = community->regs + offset;
@@ -606,7 +580,7 @@ static void chv_pctrl_writel(struct chv_pinctrl *pctrl, unsigned int offset, u32
 	readl(reg);
 }
 
-static void __iomem *chv_padreg(struct chv_pinctrl *pctrl, unsigned int offset,
+static void __iomem *chv_padreg(struct intel_pinctrl *pctrl, unsigned int offset,
 				unsigned int reg)
 {
 	const struct intel_community *community = &pctrl->communities[0];
@@ -618,12 +592,12 @@ static void __iomem *chv_padreg(struct chv_pinctrl *pctrl, unsigned int offset,
 	return community->pad_regs + offset + reg;
 }
 
-static u32 chv_readl(struct chv_pinctrl *pctrl, unsigned int pin, unsigned int offset)
+static u32 chv_readl(struct intel_pinctrl *pctrl, unsigned int pin, unsigned int offset)
 {
 	return readl(chv_padreg(pctrl, pin, offset));
 }
 
-static void chv_writel(struct chv_pinctrl *pctrl, unsigned int pin, unsigned int offset, u32 value)
+static void chv_writel(struct intel_pinctrl *pctrl, unsigned int pin, unsigned int offset, u32 value)
 {
 	void __iomem *reg = chv_padreg(pctrl, pin, offset);
 
@@ -633,14 +607,14 @@ static void chv_writel(struct chv_pinctrl *pctrl, unsigned int pin, unsigned int
 }
 
 /* When Pad Cfg is locked, driver can only change GPIOTXState or GPIORXState */
-static bool chv_pad_locked(struct chv_pinctrl *pctrl, unsigned int offset)
+static bool chv_pad_locked(struct intel_pinctrl *pctrl, unsigned int offset)
 {
 	return chv_readl(pctrl, offset, CHV_PADCTRL1) & CHV_PADCTRL1_CFGLOCK;
 }
 
 static int chv_get_groups_count(struct pinctrl_dev *pctldev)
 {
-	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	return pctrl->soc->ngroups;
 }
@@ -648,7 +622,7 @@ static int chv_get_groups_count(struct pinctrl_dev *pctldev)
 static const char *chv_get_group_name(struct pinctrl_dev *pctldev,
 				      unsigned int group)
 {
-	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	return pctrl->soc->groups[group].name;
 }
@@ -656,7 +630,7 @@ static const char *chv_get_group_name(struct pinctrl_dev *pctldev,
 static int chv_get_group_pins(struct pinctrl_dev *pctldev, unsigned int group,
 			      const unsigned int **pins, unsigned int *npins)
 {
-	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	*pins = pctrl->soc->groups[group].pins;
 	*npins = pctrl->soc->groups[group].npins;
@@ -666,7 +640,7 @@ static int chv_get_group_pins(struct pinctrl_dev *pctldev, unsigned int group,
 static void chv_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 			     unsigned int offset)
 {
-	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	unsigned long flags;
 	u32 ctrl0, ctrl1;
 	bool locked;
@@ -705,7 +679,7 @@ static const struct pinctrl_ops chv_pinctrl_ops = {
 
 static int chv_get_functions_count(struct pinctrl_dev *pctldev)
 {
-	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	return pctrl->soc->nfunctions;
 }
@@ -713,7 +687,7 @@ static int chv_get_functions_count(struct pinctrl_dev *pctldev)
 static const char *chv_get_function_name(struct pinctrl_dev *pctldev,
 					 unsigned int function)
 {
-	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	return pctrl->soc->functions[function].name;
 }
@@ -723,7 +697,7 @@ static int chv_get_function_groups(struct pinctrl_dev *pctldev,
 				   const char * const **groups,
 				   unsigned int * const ngroups)
 {
-	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	*groups = pctrl->soc->functions[function].groups;
 	*ngroups = pctrl->soc->functions[function].ngroups;
@@ -733,7 +707,7 @@ static int chv_get_function_groups(struct pinctrl_dev *pctldev,
 static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned int function, unsigned int group)
 {
-	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct intel_pingroup *grp;
 	unsigned long flags;
 	int i;
@@ -791,7 +765,7 @@ static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static void chv_gpio_clear_triggering(struct chv_pinctrl *pctrl,
+static void chv_gpio_clear_triggering(struct intel_pinctrl *pctrl,
 				      unsigned int offset)
 {
 	u32 value;
@@ -806,7 +780,7 @@ static int chv_gpio_request_enable(struct pinctrl_dev *pctldev,
 				   struct pinctrl_gpio_range *range,
 				   unsigned int offset)
 {
-	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	unsigned long flags;
 	u32 value;
 
@@ -860,7 +834,7 @@ static void chv_gpio_disable_free(struct pinctrl_dev *pctldev,
 				  struct pinctrl_gpio_range *range,
 				  unsigned int offset)
 {
-	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&chv_lock, flags);
@@ -875,7 +849,7 @@ static int chv_gpio_set_direction(struct pinctrl_dev *pctldev,
 				  struct pinctrl_gpio_range *range,
 				  unsigned int offset, bool input)
 {
-	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	unsigned long flags;
 	u32 ctrl0;
 
@@ -906,7 +880,7 @@ static const struct pinmux_ops chv_pinmux_ops = {
 static int chv_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 			  unsigned long *config)
 {
-	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	unsigned long flags;
 	u32 ctrl0, ctrl1;
@@ -983,7 +957,7 @@ static int chv_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 	return 0;
 }
 
-static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned int pin,
+static int chv_config_set_pull(struct intel_pinctrl *pctrl, unsigned int pin,
 			       enum pin_config_param param, u32 arg)
 {
 	unsigned long flags;
@@ -1048,7 +1022,7 @@ static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned int pin,
 	return 0;
 }
 
-static int chv_config_set_oden(struct chv_pinctrl *pctrl, unsigned int pin,
+static int chv_config_set_oden(struct intel_pinctrl *pctrl, unsigned int pin,
 			       bool enable)
 {
 	unsigned long flags;
@@ -1071,7 +1045,7 @@ static int chv_config_set_oden(struct chv_pinctrl *pctrl, unsigned int pin,
 static int chv_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			  unsigned long *configs, unsigned int nconfigs)
 {
-	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	enum pin_config_param param;
 	int i, ret;
 	u32 arg;
@@ -1172,7 +1146,7 @@ static struct pinctrl_desc chv_pinctrl_desc = {
 
 static int chv_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
-	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
 	unsigned long flags;
 	u32 ctrl0, cfg;
 
@@ -1190,7 +1164,7 @@ static int chv_gpio_get(struct gpio_chip *chip, unsigned int offset)
 
 static void chv_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
-	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
 	unsigned long flags;
 	u32 ctrl0;
 
@@ -1210,7 +1184,7 @@ static void chv_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 
 static int chv_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
-	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
 	u32 ctrl0, direction;
 	unsigned long flags;
 
@@ -1253,7 +1227,7 @@ static const struct gpio_chip chv_gpio_chip = {
 static void chv_gpio_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
 	int pin = irqd_to_hwirq(d);
 	u32 intr_line;
 
@@ -1270,7 +1244,7 @@ static void chv_gpio_irq_ack(struct irq_data *d)
 static void chv_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
 	int pin = irqd_to_hwirq(d);
 	u32 value, intr_line;
 	unsigned long flags;
@@ -1315,7 +1289,7 @@ static unsigned chv_gpio_irq_startup(struct irq_data *d)
 	 */
 	if (irqd_get_trigger_type(d) == IRQ_TYPE_NONE) {
 		struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-		struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
+		struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
 		struct intel_community_context *cctx = &pctrl->context.communities[0];
 		unsigned int pin = irqd_to_hwirq(d);
 		irq_flow_handler_t handler;
@@ -1347,7 +1321,7 @@ static unsigned chv_gpio_irq_startup(struct irq_data *d)
 static int chv_gpio_irq_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
 	struct intel_community_context *cctx = &pctrl->context.communities[0];
 	unsigned int pin = irqd_to_hwirq(d);
 	unsigned long flags;
@@ -1408,7 +1382,7 @@ static int chv_gpio_irq_type(struct irq_data *d, unsigned int type)
 static void chv_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct intel_community *community = &pctrl->communities[0];
 	struct intel_community_context *cctx = &pctrl->context.communities[0];
 	struct irq_chip *chip = irq_desc_get_chip(desc);
@@ -1478,7 +1452,7 @@ static void chv_init_irq_valid_mask(struct gpio_chip *chip,
 				    unsigned long *valid_mask,
 				    unsigned int ngpios)
 {
-	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
 	const struct intel_community *community = &pctrl->communities[0];
 	int i;
 
@@ -1500,7 +1474,7 @@ static void chv_init_irq_valid_mask(struct gpio_chip *chip,
 
 static int chv_gpio_irq_init_hw(struct gpio_chip *chip)
 {
-	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
 	const struct intel_community *community = &pctrl->communities[0];
 
 	/*
@@ -1526,7 +1500,7 @@ static int chv_gpio_irq_init_hw(struct gpio_chip *chip)
 
 static int chv_gpio_add_pin_ranges(struct gpio_chip *chip)
 {
-	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
 	const struct intel_community *community = &pctrl->communities[0];
 	const struct intel_padgroup *gpp;
 	int ret, i;
@@ -1545,7 +1519,7 @@ static int chv_gpio_add_pin_ranges(struct gpio_chip *chip)
 	return 0;
 }
 
-static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
+static int chv_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 {
 	const struct intel_community *community = &pctrl->communities[0];
 	const struct intel_padgroup *gpp;
@@ -1611,7 +1585,7 @@ static acpi_status chv_pinctrl_mmio_access_handler(u32 function,
 	acpi_physical_address address, u32 bits, u64 *value,
 	void *handler_context, void *region_context)
 {
-	struct chv_pinctrl *pctrl = region_context;
+	struct intel_pinctrl *pctrl = region_context;
 	unsigned long flags;
 	acpi_status ret = AE_OK;
 
@@ -1635,7 +1609,7 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 	const struct intel_pinctrl_soc_data **soc_table;
 	struct intel_community *community;
 	struct device *dev = &pdev->dev;
-	struct chv_pinctrl *pctrl;
+	struct intel_pinctrl *pctrl;
 	struct acpi_device *adev;
 	acpi_status status;
 	int ret, irq, i;
@@ -1723,7 +1697,7 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 
 static int chv_pinctrl_remove(struct platform_device *pdev)
 {
-	struct chv_pinctrl *pctrl = platform_get_drvdata(pdev);
+	struct intel_pinctrl *pctrl = platform_get_drvdata(pdev);
 	const struct intel_community *community = &pctrl->communities[0];
 
 	acpi_remove_address_space_handler(ACPI_COMPANION(&pdev->dev),
@@ -1736,7 +1710,7 @@ static int chv_pinctrl_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int chv_pinctrl_suspend_noirq(struct device *dev)
 {
-	struct chv_pinctrl *pctrl = dev_get_drvdata(dev);
+	struct intel_pinctrl *pctrl = dev_get_drvdata(dev);
 	struct intel_community_context *cctx = &pctrl->context.communities[0];
 	unsigned long flags;
 	int i;
@@ -1766,7 +1740,7 @@ static int chv_pinctrl_suspend_noirq(struct device *dev)
 
 static int chv_pinctrl_resume_noirq(struct device *dev)
 {
-	struct chv_pinctrl *pctrl = dev_get_drvdata(dev);
+	struct intel_pinctrl *pctrl = dev_get_drvdata(dev);
 	struct intel_community_context *cctx = &pctrl->context.communities[0];
 	unsigned long flags;
 	int i;
-- 
2.27.0

