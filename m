Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0C0116DAE
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbfLINJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:37 -0500
Received: from mga17.intel.com ([192.55.52.151]:34154 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727644AbfLINJf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="224773897"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 09 Dec 2019 05:09:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 15AC2A7D; Mon,  9 Dec 2019 15:09:28 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 20/24] pinctrl: lynxpoint: Add pin control operations
Date:   Mon,  9 Dec 2019 15:09:22 +0200
Message-Id: <20191209130926.86483-21-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add implementation for:
    - pin control, group information retrieval: count, name and pins
    - pin muxing:
      - function information (count, name and groups)
      - mux setting
      - GPIO control (enable, disable, set direction)
    - pin configuration:
      - pull disable, up and down
      - any other option is treated as not supported.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 315 +++++++++++++++++++++-
 1 file changed, 314 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 5a8c77c8306b..c209deff9efb 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -146,6 +146,7 @@ static const struct intel_pinctrl_soc_data lptlp_soc_data = {
 
 /* Bitmapped register offsets */
 #define LP_ACPI_OWNED	0x00 /* Bitmap, set by bios, 0: pin reserved for ACPI */
+#define LP_IRQ2IOXAPIC	0x10 /* Bitmap, set by bios, 1: pin routed to IOxAPIC */
 #define LP_GC		0x7C /* set APIC IRQ to IRQ14 or IRQ15 for all pins */
 #define LP_INT_STAT	0x80
 #define LP_INT_ENABLE	0x90
@@ -166,7 +167,10 @@ static const struct intel_pinctrl_soc_data lptlp_soc_data = {
 
 /* LP_CONFIG2 reg bits */
 #define GPINDIS_BIT	BIT(2) /* disable input sensing */
-#define GPIWP_BIT	(BIT(0) | BIT(1)) /* weak pull options */
+#define GPIWP_MASK	GENMASK(1, 0)	/* weak pull options */
+#define GPIWP_NONE	0		/* none */
+#define GPIWP_DOWN	1		/* weak pull down */
+#define GPIWP_UP	2		/* weak pull up */
 
 /*
  * Lynxpoint gpios are controlled through both bitmapped registers and
@@ -195,6 +199,8 @@ static const struct intel_pinctrl_soc_data lptlp_soc_data = {
  * ...
  * LP94_CONFIG1 (gpio 94) ...
  * LP94_CONFIG2 (gpio 94) ...
+ *
+ * IOxAPIC redirection map applies only for gpio 8-10, 13-14, 45-55.
  */
 
 static struct intel_community *lp_get_community(struct intel_pinctrl *lg,
@@ -246,6 +252,308 @@ static bool lp_gpio_acpi_use(struct intel_pinctrl *lg, unsigned int pin)
 	return !(ioread32(acpi_use) & BIT(pin % 32));
 }
 
+static bool lp_gpio_ioxapic_use(struct gpio_chip *chip, unsigned int offset)
+{
+	void __iomem *ioxapic_use = lp_gpio_reg(chip, offset, LP_IRQ2IOXAPIC);
+	u32 value;
+
+	value = ioread32(ioxapic_use);
+
+	if (offset >= 8 && offset <= 10)
+		return !!(value & BIT(offset -  8 + 0));
+	if (offset >= 13 && offset <= 14)
+		return !!(value & BIT(offset - 13 + 3));
+	if (offset >= 45 && offset <= 55)
+		return !!(value & BIT(offset - 45 + 5));
+
+	return false;
+}
+
+static int lp_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct intel_pinctrl *lg = pinctrl_dev_get_drvdata(pctldev);
+
+	return lg->soc->ngroups;
+}
+
+static const char *lp_get_group_name(struct pinctrl_dev *pctldev,
+				     unsigned int selector)
+{
+	struct intel_pinctrl *lg = pinctrl_dev_get_drvdata(pctldev);
+
+	return lg->soc->groups[selector].name;
+}
+
+static int lp_get_group_pins(struct pinctrl_dev *pctldev,
+			     unsigned int selector,
+			     const unsigned int **pins,
+			     unsigned int *num_pins)
+{
+	struct intel_pinctrl *lg = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins		= lg->soc->groups[selector].pins;
+	*num_pins	= lg->soc->groups[selector].npins;
+
+	return 0;
+}
+
+static const struct pinctrl_ops lptlp_pinctrl_ops = {
+	.get_groups_count	= lp_get_groups_count,
+	.get_group_name		= lp_get_group_name,
+	.get_group_pins		= lp_get_group_pins,
+};
+
+static int lp_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	struct intel_pinctrl *lg = pinctrl_dev_get_drvdata(pctldev);
+
+	return lg->soc->nfunctions;
+}
+
+static const char *lp_get_function_name(struct pinctrl_dev *pctldev,
+					unsigned int selector)
+{
+	struct intel_pinctrl *lg = pinctrl_dev_get_drvdata(pctldev);
+
+	return lg->soc->functions[selector].name;
+}
+
+static int lp_get_function_groups(struct pinctrl_dev *pctldev,
+				  unsigned int selector,
+				  const char * const **groups,
+				  unsigned int *num_groups)
+{
+	struct intel_pinctrl *lg = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups		= lg->soc->functions[selector].groups;
+	*num_groups	= lg->soc->functions[selector].ngroups;
+
+	return 0;
+}
+
+static int lp_pinmux_set_mux(struct pinctrl_dev *pctldev,
+			     unsigned int function, unsigned int group)
+{
+	struct intel_pinctrl *lg = pinctrl_dev_get_drvdata(pctldev);
+	const struct intel_pingroup *grp = &lg->soc->groups[group];
+	unsigned long flags;
+	int i;
+
+	raw_spin_lock_irqsave(&lg->lock, flags);
+
+	/* Now enable the mux setting for each pin in the group */
+	for (i = 0; i < grp->npins; i++) {
+		void __iomem *reg = lp_gpio_reg(&lg->chip, grp->pins[i], LP_CONFIG1);
+		u32 value;
+
+		value = ioread32(reg);
+
+		value &= ~USE_SEL_MASK;
+		if (grp->modes)
+			value |= grp->modes[i];
+		else
+			value |= grp->mode;
+
+		iowrite32(value, reg);
+	}
+
+	raw_spin_unlock_irqrestore(&lg->lock, flags);
+
+	return 0;
+}
+
+static int lp_gpio_request_enable(struct pinctrl_dev *pctldev,
+				  struct pinctrl_gpio_range *range,
+				  unsigned int pin)
+{
+	struct intel_pinctrl *lg = pinctrl_dev_get_drvdata(pctldev);
+	void __iomem *reg = lp_gpio_reg(&lg->chip, pin, LP_CONFIG1);
+	void __iomem *conf2 = lp_gpio_reg(&lg->chip, pin, LP_CONFIG2);
+	unsigned long flags;
+	u32 value;
+
+	pm_runtime_get(lg->dev);
+
+	raw_spin_lock_irqsave(&lg->lock, flags);
+
+	/*
+	 * Reconfigure pin to GPIO mode if needed and issue a warning,
+	 * since we expect firmware to configure it properly.
+	 */
+	value = ioread32(reg);
+	if ((value & USE_SEL_MASK) != USE_SEL_GPIO) {
+		iowrite32((value & USE_SEL_MASK) | USE_SEL_GPIO, reg);
+		dev_warn(lg->dev, FW_BUG "pin %u forcibly reconfigured as GPIO\n", pin);
+	}
+
+	/* Enable input sensing */
+	iowrite32(ioread32(conf2) & ~GPINDIS_BIT, conf2);
+
+	raw_spin_unlock_irqrestore(&lg->lock, flags);
+
+	return 0;
+}
+
+static void lp_gpio_disable_free(struct pinctrl_dev *pctldev,
+				 struct pinctrl_gpio_range *range,
+				 unsigned int pin)
+{
+	struct intel_pinctrl *lg = pinctrl_dev_get_drvdata(pctldev);
+	void __iomem *conf2 = lp_gpio_reg(&lg->chip, pin, LP_CONFIG2);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&lg->lock, flags);
+
+	/* Disable input sensing */
+	iowrite32(ioread32(conf2) | GPINDIS_BIT, conf2);
+
+	raw_spin_unlock_irqrestore(&lg->lock, flags);
+
+	pm_runtime_put(lg->dev);
+}
+
+static int lp_gpio_set_direction(struct pinctrl_dev *pctldev,
+				 struct pinctrl_gpio_range *range,
+				 unsigned int pin, bool input)
+{
+	struct intel_pinctrl *lg = pinctrl_dev_get_drvdata(pctldev);
+	void __iomem *reg = lp_gpio_reg(&lg->chip, pin, LP_CONFIG1);
+	unsigned long flags;
+	u32 value;
+
+	raw_spin_lock_irqsave(&lg->lock, flags);
+
+	value = ioread32(reg);
+	value &= ~DIR_BIT;
+	if (input) {
+		value |= DIR_BIT;
+	} else {
+		/*
+		 * Before making any direction modifications, do a check if GPIO
+		 * is set for direct IRQ. On Lynxpoint, setting GPIO to output
+		 * does not make sense, so let's at least warn the caller before
+		 * they shoot themselves in the foot.
+		 */
+		WARN(lp_gpio_ioxapic_use(&lg->chip, pin),
+		     "Potential Error: Setting GPIO to output with IOxAPIC redirection");
+	}
+	iowrite32(value, reg);
+
+	raw_spin_unlock_irqrestore(&lg->lock, flags);
+
+	return 0;
+}
+
+static const struct pinmux_ops lptlp_pinmux_ops = {
+	.get_functions_count	= lp_get_functions_count,
+	.get_function_name	= lp_get_function_name,
+	.get_function_groups	= lp_get_function_groups,
+	.set_mux		= lp_pinmux_set_mux,
+	.gpio_request_enable	= lp_gpio_request_enable,
+	.gpio_disable_free	= lp_gpio_disable_free,
+	.gpio_set_direction	= lp_gpio_set_direction,
+};
+
+static int lp_pin_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
+			     unsigned long *config)
+{
+	struct intel_pinctrl *lg = pinctrl_dev_get_drvdata(pctldev);
+	void __iomem *conf2 = lp_gpio_reg(&lg->chip, pin, LP_CONFIG2);
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	unsigned long flags;
+	u32 value, pull;
+	u16 arg = 0;
+
+	raw_spin_lock_irqsave(&lg->lock, flags);
+	value = ioread32(conf2);
+	raw_spin_unlock_irqrestore(&lg->lock, flags);
+
+	pull = value & GPIWP_MASK;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		if (pull)
+			return -EINVAL;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (pull != GPIWP_DOWN)
+			return -EINVAL;
+
+		arg = 1;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (pull != GPIWP_UP)
+			return -EINVAL;
+
+		arg = 1;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+static int lp_pin_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			     unsigned long *configs, unsigned int num_configs)
+{
+	struct intel_pinctrl *lg = pinctrl_dev_get_drvdata(pctldev);
+	void __iomem *conf2 = lp_gpio_reg(&lg->chip, pin, LP_CONFIG2);
+	enum pin_config_param param;
+	unsigned long flags;
+	int i, ret = 0;
+	u32 value;
+
+	raw_spin_lock_irqsave(&lg->lock, flags);
+
+	value = ioread32(conf2);
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			value &= ~GPIWP_MASK;
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			value &= ~GPIWP_MASK;
+			value |= GPIWP_DOWN;
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			value &= ~GPIWP_MASK;
+			value |= GPIWP_UP;
+			break;
+		default:
+			ret = -ENOTSUPP;
+		}
+
+		if (ret)
+			break;
+	}
+
+	if (!ret)
+		iowrite32(value, conf2);
+
+	raw_spin_unlock_irqrestore(&lg->lock, flags);
+
+	return ret;
+}
+
+static const struct pinconf_ops lptlp_pinconf_ops = {
+	.is_generic	= true,
+	.pin_config_get	= lp_pin_config_get,
+	.pin_config_set	= lp_pin_config_set,
+};
+
+static const struct pinctrl_desc lptlp_pinctrl_desc = {
+	.pctlops	= &lptlp_pinctrl_ops,
+	.pmxops		= &lptlp_pinmux_ops,
+	.confops	= &lptlp_pinconf_ops,
+	.owner		= THIS_MODULE,
+};
+
 static int lp_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct intel_pinctrl *lg = gpiochip_get_data(chip);
@@ -525,6 +833,11 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	if (!lg->communities)
 		return -ENOMEM;
 
+	lg->pctldesc           = lptlp_pinctrl_desc;
+	lg->pctldesc.name      = dev_name(dev);
+	lg->pctldesc.pins      = lg->soc->pins;
+	lg->pctldesc.npins     = lg->soc->npins;
+
 	platform_set_drvdata(pdev, lg);
 
 	io_rc = platform_get_resource(pdev, IORESOURCE_IO, 0);
-- 
2.24.0

