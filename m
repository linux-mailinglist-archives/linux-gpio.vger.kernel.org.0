Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9313811CAA8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 11:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbfLLK0L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 05:26:11 -0500
Received: from mga04.intel.com ([192.55.52.120]:37532 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728410AbfLLK0L (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 05:26:11 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Dec 2019 02:26:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,305,1571727600"; 
   d="scan'208";a="388258197"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 12 Dec 2019 02:26:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7126A2E6; Thu, 12 Dec 2019 12:26:05 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        hdegoede@redhat.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/5] pinctrl: baytrail: Reuse struct intel_pinctrl in the driver
Date:   Thu, 12 Dec 2019 12:25:57 +0200
Message-Id: <20191212102557.87754-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
References: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We may use now available struct intel_pinctrl in the driver.
No functional change implied.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 186 +++++++++++------------
 1 file changed, 87 insertions(+), 99 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index ca5e394fca4e..c6f53ed626c9 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -93,7 +93,7 @@
 #define BYT_DEFAULT_GPIO_MUX	0
 #define BYT_ALTER_GPIO_MUX	1
 
-struct byt_gpio_pin_context {
+struct intel_pad_context {
 	u32 conf0;
 	u32 val;
 };
@@ -105,17 +105,6 @@ struct byt_gpio_pin_context {
 		.pad_map	= (map),\
 	}
 
-struct byt_gpio {
-	struct device *dev;
-	struct gpio_chip chip;
-	struct irq_chip irqchip;
-	struct pinctrl_dev *pctl_dev;
-	struct pinctrl_desc pctl_desc;
-	const struct intel_pinctrl_soc_data *soc_data;
-	struct intel_community *communities_copy;
-	struct byt_gpio_pin_context *saved_context;
-};
-
 /* SCORE pins, aka GPIOC_<pin_no> or GPIO_S0_SC[<pin_no>] */
 static const struct pinctrl_pin_desc byt_score_pins[] = {
 	PINCTRL_PIN(0, "SATA_GP0"),
@@ -551,14 +540,14 @@ static const struct intel_pinctrl_soc_data *byt_soc_data[] = {
 
 static DEFINE_RAW_SPINLOCK(byt_lock);
 
-static struct intel_community *byt_get_community(struct byt_gpio *vg,
+static struct intel_community *byt_get_community(struct intel_pinctrl *vg,
 						 unsigned int pin)
 {
 	struct intel_community *comm;
 	int i;
 
-	for (i = 0; i < vg->soc_data->ncommunities; i++) {
-		comm = vg->communities_copy + i;
+	for (i = 0; i < vg->ncommunities; i++) {
+		comm = vg->communities + i;
 		if (pin < comm->pin_base + comm->npins && pin >= comm->pin_base)
 			return comm;
 	}
@@ -566,7 +555,7 @@ static struct intel_community *byt_get_community(struct byt_gpio *vg,
 	return NULL;
 }
 
-static void __iomem *byt_gpio_reg(struct byt_gpio *vg, unsigned int offset,
+static void __iomem *byt_gpio_reg(struct intel_pinctrl *vg, unsigned int offset,
 				  int reg)
 {
 	struct intel_community *comm = byt_get_community(vg, offset);
@@ -593,17 +582,17 @@ static void __iomem *byt_gpio_reg(struct byt_gpio *vg, unsigned int offset,
 
 static int byt_get_groups_count(struct pinctrl_dev *pctldev)
 {
-	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctldev);
 
-	return vg->soc_data->ngroups;
+	return vg->soc->ngroups;
 }
 
 static const char *byt_get_group_name(struct pinctrl_dev *pctldev,
 				      unsigned int selector)
 {
-	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctldev);
 
-	return vg->soc_data->groups[selector].name;
+	return vg->soc->groups[selector].name;
 }
 
 static int byt_get_group_pins(struct pinctrl_dev *pctldev,
@@ -611,10 +600,10 @@ static int byt_get_group_pins(struct pinctrl_dev *pctldev,
 			      const unsigned int **pins,
 			      unsigned int *num_pins)
 {
-	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctldev);
 
-	*pins		= vg->soc_data->groups[selector].pins;
-	*num_pins	= vg->soc_data->groups[selector].npins;
+	*pins		= vg->soc->groups[selector].pins;
+	*num_pins	= vg->soc->groups[selector].npins;
 
 	return 0;
 }
@@ -627,17 +616,17 @@ static const struct pinctrl_ops byt_pinctrl_ops = {
 
 static int byt_get_functions_count(struct pinctrl_dev *pctldev)
 {
-	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctldev);
 
-	return vg->soc_data->nfunctions;
+	return vg->soc->nfunctions;
 }
 
 static const char *byt_get_function_name(struct pinctrl_dev *pctldev,
 					 unsigned int selector)
 {
-	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctldev);
 
-	return vg->soc_data->functions[selector].name;
+	return vg->soc->functions[selector].name;
 }
 
 static int byt_get_function_groups(struct pinctrl_dev *pctldev,
@@ -645,15 +634,15 @@ static int byt_get_function_groups(struct pinctrl_dev *pctldev,
 				   const char * const **groups,
 				   unsigned int *num_groups)
 {
-	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctldev);
+	struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctldev);
 
-	*groups		= vg->soc_data->functions[selector].groups;
-	*num_groups	= vg->soc_data->functions[selector].ngroups;
+	*groups		= vg->soc->functions[selector].groups;
+	*num_groups	= vg->soc->functions[selector].ngroups;
 
 	return 0;
 }
 
-static void byt_set_group_simple_mux(struct byt_gpio *vg,
+static void byt_set_group_simple_mux(struct intel_pinctrl *vg,
 				     const struct intel_pingroup group,
 				     unsigned int func)
 {
@@ -683,7 +672,7 @@ static void byt_set_group_simple_mux(struct byt_gpio *vg,
 	raw_spin_unlock_irqrestore(&byt_lock, flags);
 }
 
-static void byt_set_group_mixed_mux(struct byt_gpio *vg,
+static void byt_set_group_mixed_mux(struct intel_pinctrl *vg,
 				    const struct intel_pingroup group,
 				    const unsigned int *func)
 {
@@ -716,9 +705,9 @@ static void byt_set_group_mixed_mux(struct byt_gpio *vg,
 static int byt_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
 		       unsigned int group_selector)
 {
-	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctldev);
-	const struct intel_function func = vg->soc_data->functions[func_selector];
-	const struct intel_pingroup group = vg->soc_data->groups[group_selector];
+	struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctldev);
+	const struct intel_function func = vg->soc->functions[func_selector];
+	const struct intel_pingroup group = vg->soc->groups[group_selector];
 
 	if (group.modes)
 		byt_set_group_mixed_mux(vg, group, group.modes);
@@ -730,22 +719,22 @@ static int byt_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
 	return 0;
 }
 
-static u32 byt_get_gpio_mux(struct byt_gpio *vg, unsigned int offset)
+static u32 byt_get_gpio_mux(struct intel_pinctrl *vg, unsigned int offset)
 {
 	/* SCORE pin 92-93 */
-	if (!strcmp(vg->soc_data->uid, BYT_SCORE_ACPI_UID) &&
+	if (!strcmp(vg->soc->uid, BYT_SCORE_ACPI_UID) &&
 	    offset >= 92 && offset <= 93)
 		return BYT_ALTER_GPIO_MUX;
 
 	/* SUS pin 11-21 */
-	if (!strcmp(vg->soc_data->uid, BYT_SUS_ACPI_UID) &&
+	if (!strcmp(vg->soc->uid, BYT_SUS_ACPI_UID) &&
 	    offset >= 11 && offset <= 21)
 		return BYT_ALTER_GPIO_MUX;
 
 	return BYT_DEFAULT_GPIO_MUX;
 }
 
-static void byt_gpio_clear_triggering(struct byt_gpio *vg, unsigned int offset)
+static void byt_gpio_clear_triggering(struct intel_pinctrl *vg, unsigned int offset)
 {
 	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
 	unsigned long flags;
@@ -762,7 +751,7 @@ static int byt_gpio_request_enable(struct pinctrl_dev *pctl_dev,
 				   struct pinctrl_gpio_range *range,
 				   unsigned int offset)
 {
-	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctl_dev);
+	struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctl_dev);
 	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
 	u32 value, gpio_mux;
 	unsigned long flags;
@@ -799,7 +788,7 @@ static void byt_gpio_disable_free(struct pinctrl_dev *pctl_dev,
 				  struct pinctrl_gpio_range *range,
 				  unsigned int offset)
 {
-	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctl_dev);
+	struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctl_dev);
 
 	byt_gpio_clear_triggering(vg, offset);
 	pm_runtime_put(vg->dev);
@@ -810,7 +799,7 @@ static int byt_gpio_set_direction(struct pinctrl_dev *pctl_dev,
 				  unsigned int offset,
 				  bool input)
 {
-	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctl_dev);
+	struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctl_dev);
 	void __iomem *val_reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
 	void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
 	unsigned long flags;
@@ -893,7 +882,7 @@ static int byt_set_pull_strength(u32 *reg, u16 strength)
 static int byt_pin_config_get(struct pinctrl_dev *pctl_dev, unsigned int offset,
 			      unsigned long *config)
 {
-	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctl_dev);
+	struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctl_dev);
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
 	void __iomem *val_reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
@@ -978,7 +967,7 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 			      unsigned long *configs,
 			      unsigned int num_configs)
 {
-	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctl_dev);
+	struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctl_dev);
 	unsigned int param, arg;
 	void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
 	void __iomem *val_reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
@@ -1115,7 +1104,7 @@ static const struct pinctrl_desc byt_pinctrl_desc = {
 
 static int byt_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
-	struct byt_gpio *vg = gpiochip_get_data(chip);
+	struct intel_pinctrl *vg = gpiochip_get_data(chip);
 	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
 	unsigned long flags;
 	u32 val;
@@ -1129,7 +1118,7 @@ static int byt_gpio_get(struct gpio_chip *chip, unsigned int offset)
 
 static void byt_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
-	struct byt_gpio *vg = gpiochip_get_data(chip);
+	struct intel_pinctrl *vg = gpiochip_get_data(chip);
 	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
 	unsigned long flags;
 	u32 old_val;
@@ -1148,7 +1137,7 @@ static void byt_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 
 static int byt_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
-	struct byt_gpio *vg = gpiochip_get_data(chip);
+	struct intel_pinctrl *vg = gpiochip_get_data(chip);
 	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
 	unsigned long flags;
 	u32 value;
@@ -1188,11 +1177,11 @@ static int byt_gpio_direction_output(struct gpio_chip *chip,
 
 static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
-	struct byt_gpio *vg = gpiochip_get_data(chip);
+	struct intel_pinctrl *vg = gpiochip_get_data(chip);
 	int i;
 	u32 conf0, val;
 
-	for (i = 0; i < vg->soc_data->npins; i++) {
+	for (i = 0; i < vg->soc->npins; i++) {
 		const struct intel_community *comm;
 		const char *pull_str = NULL;
 		const char *pull = NULL;
@@ -1202,7 +1191,7 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		unsigned int pin;
 
 		raw_spin_lock_irqsave(&byt_lock, flags);
-		pin = vg->soc_data->pins[i].number;
+		pin = vg->soc->pins[i].number;
 		reg = byt_gpio_reg(vg, pin, BYT_CONF0_REG);
 		if (!reg) {
 			seq_printf(s,
@@ -1297,7 +1286,7 @@ static const struct gpio_chip byt_gpio_chip = {
 static void byt_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct byt_gpio *vg = gpiochip_get_data(gc);
+	struct intel_pinctrl *vg = gpiochip_get_data(gc);
 	unsigned int offset = irqd_to_hwirq(d);
 	void __iomem *reg;
 
@@ -1313,7 +1302,7 @@ static void byt_irq_ack(struct irq_data *d)
 static void byt_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct byt_gpio *vg = gpiochip_get_data(gc);
+	struct intel_pinctrl *vg = gpiochip_get_data(gc);
 
 	byt_gpio_clear_triggering(vg, irqd_to_hwirq(d));
 }
@@ -1321,7 +1310,7 @@ static void byt_irq_mask(struct irq_data *d)
 static void byt_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct byt_gpio *vg = gpiochip_get_data(gc);
+	struct intel_pinctrl *vg = gpiochip_get_data(gc);
 	unsigned int offset = irqd_to_hwirq(d);
 	unsigned long flags;
 	void __iomem *reg;
@@ -1359,7 +1348,7 @@ static void byt_irq_unmask(struct irq_data *d)
 
 static int byt_irq_type(struct irq_data *d, unsigned int type)
 {
-	struct byt_gpio *vg = gpiochip_get_data(irq_data_get_irq_chip_data(d));
+	struct intel_pinctrl *vg = gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	u32 offset = irqd_to_hwirq(d);
 	u32 value;
 	unsigned long flags;
@@ -1398,8 +1387,7 @@ static int byt_irq_type(struct irq_data *d, unsigned int type)
 static void byt_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct irq_data *data = irq_desc_get_irq_data(desc);
-	struct byt_gpio *vg = gpiochip_get_data(
-				irq_desc_get_handler_data(desc));
+	struct intel_pinctrl *vg = gpiochip_get_data(irq_desc_get_handler_data(desc));
 	struct irq_chip *chip = irq_data_get_irq_chip(data);
 	u32 base, pin;
 	void __iomem *reg;
@@ -1432,7 +1420,7 @@ static void byt_init_irq_valid_mask(struct gpio_chip *chip,
 				    unsigned long *valid_mask,
 				    unsigned int ngpios)
 {
-	struct byt_gpio *vg = gpiochip_get_data(chip);
+	struct intel_pinctrl *vg = gpiochip_get_data(chip);
 	void __iomem *reg;
 	u32 value;
 	int i;
@@ -1442,8 +1430,8 @@ static void byt_init_irq_valid_mask(struct gpio_chip *chip,
 	 * do not use direct IRQ mode. This will prevent spurious
 	 * interrupts from misconfigured pins.
 	 */
-	for (i = 0; i < vg->soc_data->npins; i++) {
-		unsigned int pin = vg->soc_data->pins[i].number;
+	for (i = 0; i < vg->soc->npins; i++) {
+		unsigned int pin = vg->soc->pins[i].number;
 
 		reg = byt_gpio_reg(vg, pin, BYT_CONF0_REG);
 		if (!reg) {
@@ -1466,12 +1454,12 @@ static void byt_init_irq_valid_mask(struct gpio_chip *chip,
 
 static int byt_gpio_irq_init_hw(struct gpio_chip *chip)
 {
-	struct byt_gpio *vg = gpiochip_get_data(chip);
+	struct intel_pinctrl *vg = gpiochip_get_data(chip);
 	void __iomem *reg;
 	u32 base, value;
 
 	/* clear interrupt status trigger registers */
-	for (base = 0; base < vg->soc_data->npins; base += 32) {
+	for (base = 0; base < vg->soc->npins; base += 32) {
 		reg = byt_gpio_reg(vg, base, BYT_INT_STAT_REG);
 
 		if (!reg) {
@@ -1496,18 +1484,18 @@ static int byt_gpio_irq_init_hw(struct gpio_chip *chip)
 
 static int byt_gpio_add_pin_ranges(struct gpio_chip *chip)
 {
-	struct byt_gpio *vg = gpiochip_get_data(chip);
+	struct intel_pinctrl *vg = gpiochip_get_data(chip);
 	struct device *dev = vg->dev;
 	int ret;
 
-	ret = gpiochip_add_pin_range(chip, dev_name(dev), 0, 0, vg->soc_data->npins);
+	ret = gpiochip_add_pin_range(chip, dev_name(dev), 0, 0, vg->soc->npins);
 	if (ret)
 		dev_err(dev, "failed to add GPIO pin range\n");
 
 	return ret;
 }
 
-static int byt_gpio_probe(struct byt_gpio *vg)
+static int byt_gpio_probe(struct intel_pinctrl *vg)
 {
 	struct platform_device *pdev = to_platform_device(vg->dev);
 	struct gpio_chip *gc;
@@ -1522,12 +1510,12 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	gc->can_sleep	= false;
 	gc->add_pin_ranges = byt_gpio_add_pin_ranges;
 	gc->parent	= vg->dev;
-	gc->ngpio	= vg->soc_data->npins;
+	gc->ngpio	= vg->soc->npins;
 
 #ifdef CONFIG_PM_SLEEP
-	vg->saved_context = devm_kcalloc(vg->dev, gc->ngpio,
-				       sizeof(*vg->saved_context), GFP_KERNEL);
-	if (!vg->saved_context)
+	vg->context.pads = devm_kcalloc(vg->dev, gc->ngpio, sizeof(*vg->context.pads),
+					GFP_KERNEL);
+	if (!vg->context.pads)
 		return -ENOMEM;
 #endif
 
@@ -1567,24 +1555,24 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	return ret;
 }
 
-static int byt_set_soc_data(struct byt_gpio *vg,
-			    const struct intel_pinctrl_soc_data *soc_data)
+static int byt_set_soc_data(struct intel_pinctrl *vg,
+			    const struct intel_pinctrl_soc_data *soc)
 {
 	struct platform_device *pdev = to_platform_device(vg->dev);
 	int i;
 
-	vg->soc_data = soc_data;
-	vg->communities_copy = devm_kcalloc(vg->dev,
-					    soc_data->ncommunities,
-					    sizeof(*vg->communities_copy),
-					    GFP_KERNEL);
-	if (!vg->communities_copy)
+	vg->soc = soc;
+
+	vg->ncommunities = vg->soc->ncommunities;
+	vg->communities = devm_kcalloc(vg->dev, vg->ncommunities,
+				       sizeof(*vg->communities), GFP_KERNEL);
+	if (!vg->communities)
 		return -ENOMEM;
 
-	for (i = 0; i < soc_data->ncommunities; i++) {
-		struct intel_community *comm = vg->communities_copy + i;
+	for (i = 0; i < vg->soc->ncommunities; i++) {
+		struct intel_community *comm = vg->communities + i;
 
-		*comm = vg->soc_data->communities[i];
+		*comm = vg->soc->communities[i];
 
 		comm->pad_regs = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(comm->pad_regs))
@@ -1606,7 +1594,7 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 	const struct intel_pinctrl_soc_data **soc_table;
 	struct device *dev = &pdev->dev;
 	struct acpi_device *acpi_dev;
-	struct byt_gpio *vg;
+	struct intel_pinctrl *vg;
 	int i, ret;
 
 	acpi_dev = ACPI_COMPANION(dev);
@@ -1636,15 +1624,15 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	vg->pctl_desc		= byt_pinctrl_desc;
-	vg->pctl_desc.name	= dev_name(dev);
-	vg->pctl_desc.pins	= vg->soc_data->pins;
-	vg->pctl_desc.npins	= vg->soc_data->npins;
+	vg->pctldesc		= byt_pinctrl_desc;
+	vg->pctldesc.name	= dev_name(dev);
+	vg->pctldesc.pins	= vg->soc->pins;
+	vg->pctldesc.npins	= vg->soc->npins;
 
-	vg->pctl_dev = devm_pinctrl_register(dev, &vg->pctl_desc, vg);
-	if (IS_ERR(vg->pctl_dev)) {
+	vg->pctldev = devm_pinctrl_register(dev, &vg->pctldesc, vg);
+	if (IS_ERR(vg->pctldev)) {
 		dev_err(dev, "failed to register pinctrl driver\n");
-		return PTR_ERR(vg->pctl_dev);
+		return PTR_ERR(vg->pctldev);
 	}
 
 	ret = byt_gpio_probe(vg);
@@ -1660,16 +1648,16 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int byt_gpio_suspend(struct device *dev)
 {
-	struct byt_gpio *vg = dev_get_drvdata(dev);
+	struct intel_pinctrl *vg = dev_get_drvdata(dev);
 	unsigned long flags;
 	int i;
 
 	raw_spin_lock_irqsave(&byt_lock, flags);
 
-	for (i = 0; i < vg->soc_data->npins; i++) {
+	for (i = 0; i < vg->soc->npins; i++) {
 		void __iomem *reg;
 		u32 value;
-		unsigned int pin = vg->soc_data->pins[i].number;
+		unsigned int pin = vg->soc->pins[i].number;
 
 		reg = byt_gpio_reg(vg, pin, BYT_CONF0_REG);
 		if (!reg) {
@@ -1679,11 +1667,11 @@ static int byt_gpio_suspend(struct device *dev)
 			continue;
 		}
 		value = readl(reg) & BYT_CONF0_RESTORE_MASK;
-		vg->saved_context[i].conf0 = value;
+		vg->context.pads[i].conf0 = value;
 
 		reg = byt_gpio_reg(vg, pin, BYT_VAL_REG);
 		value = readl(reg) & BYT_VAL_RESTORE_MASK;
-		vg->saved_context[i].val = value;
+		vg->context.pads[i].val = value;
 	}
 
 	raw_spin_unlock_irqrestore(&byt_lock, flags);
@@ -1692,16 +1680,16 @@ static int byt_gpio_suspend(struct device *dev)
 
 static int byt_gpio_resume(struct device *dev)
 {
-	struct byt_gpio *vg = dev_get_drvdata(dev);
+	struct intel_pinctrl *vg = dev_get_drvdata(dev);
 	unsigned long flags;
 	int i;
 
 	raw_spin_lock_irqsave(&byt_lock, flags);
 
-	for (i = 0; i < vg->soc_data->npins; i++) {
+	for (i = 0; i < vg->soc->npins; i++) {
 		void __iomem *reg;
 		u32 value;
-		unsigned int pin = vg->soc_data->pins[i].number;
+		unsigned int pin = vg->soc->pins[i].number;
 
 		reg = byt_gpio_reg(vg, pin, BYT_CONF0_REG);
 		if (!reg) {
@@ -1712,9 +1700,9 @@ static int byt_gpio_resume(struct device *dev)
 		}
 		value = readl(reg);
 		if ((value & BYT_CONF0_RESTORE_MASK) !=
-		     vg->saved_context[i].conf0) {
+		     vg->context.pads[i].conf0) {
 			value &= ~BYT_CONF0_RESTORE_MASK;
-			value |= vg->saved_context[i].conf0;
+			value |= vg->context.pads[i].conf0;
 			writel(value, reg);
 			dev_info(dev, "restored pin %d conf0 %#08x", i, value);
 		}
@@ -1722,11 +1710,11 @@ static int byt_gpio_resume(struct device *dev)
 		reg = byt_gpio_reg(vg, pin, BYT_VAL_REG);
 		value = readl(reg);
 		if ((value & BYT_VAL_RESTORE_MASK) !=
-		     vg->saved_context[i].val) {
+		     vg->context.pads[i].val) {
 			u32 v;
 
 			v = value & ~BYT_VAL_RESTORE_MASK;
-			v |= vg->saved_context[i].val;
+			v |= vg->context.pads[i].val;
 			if (v != value) {
 				writel(v, reg);
 				dev_dbg(dev, "restored pin %d val %#08x\n",
-- 
2.24.0

