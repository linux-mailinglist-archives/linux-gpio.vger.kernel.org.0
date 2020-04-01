Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7ADD19B4BB
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 19:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732279AbgDARfG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 13:35:06 -0400
Received: from mga02.intel.com ([134.134.136.20]:34961 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732273AbgDARfG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 1 Apr 2020 13:35:06 -0400
IronPort-SDR: IMhUNrjWwVLoFzisvp5e+LS3AQaf76OVxU7LO9oboq4v9H8o4F76aglCmuiRBOAHa2hG1jZbTX
 Syznu/QLZN9g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2020 10:35:05 -0700
IronPort-SDR: 9nCz6xXJQaMWu1MZFLNBLcTqbeVUpf+GsX6c3kw4cQ2jUwWTI7Azsp4yWmXwPp0TEZGqhOc/s5
 C0PpHFoLdoWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,332,1580803200"; 
   d="scan'208";a="242807652"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 01 Apr 2020 10:35:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B6DA9339; Wed,  1 Apr 2020 20:35:02 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] pinctrl: cherryview: Re-use data structures from pinctrl-intel.h (part 2)
Date:   Wed,  1 Apr 2020 20:35:01 +0300
Message-Id: <20200401173502.27626-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We have some data structures duplicated across the drivers.
Let's deduplicate them by using ones that being provided by
pinctrl-intel.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 262 ++++++++-------------
 1 file changed, 97 insertions(+), 165 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 4c74fdde576d..fa81f3c0bdc5 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -67,47 +67,6 @@
 #define CHV_PADCTRL1_INTWAKECFG_BOTH	3
 #define CHV_PADCTRL1_INTWAKECFG_LEVEL	4
 
-/**
- * struct chv_alternate_function - A per group or per pin alternate function
- * @pin: Pin number (only used in per pin configs)
- * @mode: Mode the pin should be set in
- * @invert_oe: Invert OE for this pin
- */
-struct chv_alternate_function {
-	unsigned int pin;
-	u8 mode;
-	bool invert_oe;
-};
-
-/**
- * struct chv_pincgroup - describes a CHV pin group
- * @name: Name of the group
- * @pins: An array of pins in this group
- * @npins: Number of pins in this group
- * @altfunc: Alternate function applied to all pins in this group
- * @overrides: Alternate function override per pin or %NULL if not used
- * @noverrides: Number of per pin alternate function overrides if
- *              @overrides != NULL.
- */
-struct chv_pingroup {
-	const char *name;
-	const unsigned int *pins;
-	size_t npins;
-	struct chv_alternate_function altfunc;
-	const struct chv_alternate_function *overrides;
-	size_t noverrides;
-};
-
-/**
- * struct chv_gpio_pinrange - A range of pins that can be used as GPIOs
- * @base: Start pin number
- * @npins: Number of pins in this range
- */
-struct chv_gpio_pinrange {
-	unsigned int base;
-	unsigned int npins;
-};
-
 /**
  * struct chv_community - A community specific configuration
  * @uid: ACPI _UID used to match the community
@@ -117,8 +76,8 @@ struct chv_gpio_pinrange {
  * @ngroups: Number of groups
  * @functions: All functions in this community
  * @nfunctions: Number of functions
- * @gpio_ranges: An array of GPIO ranges in this community
- * @ngpio_ranges: Number of GPIO ranges
+ * @gpps: Pad groups
+ * @ngpps: Number of pad groups in this community
  * @nirqs: Total number of IRQs this community can generate
  * @acpi_space_id: An address space ID for ACPI OpRegion handler
  */
@@ -126,12 +85,12 @@ struct chv_community {
 	const char *uid;
 	const struct pinctrl_pin_desc *pins;
 	size_t npins;
-	const struct chv_pingroup *groups;
+	const struct intel_pingroup *groups;
 	size_t ngroups;
 	const struct intel_function *functions;
 	size_t nfunctions;
-	const struct chv_gpio_pinrange *gpio_ranges;
-	size_t ngpio_ranges;
+	const struct intel_padgroup *gpps;
+	size_t ngpps;
 	size_t nirqs;
 	acpi_adr_space_type acpi_space_id;
 };
@@ -173,37 +132,14 @@ struct chv_pinctrl {
 	struct chv_pin_context *saved_pin_context;
 };
 
-#define ALTERNATE_FUNCTION(p, m, i)		\
-	{					\
-		.pin = (p),			\
-		.mode = (m),			\
-		.invert_oe = (i),		\
-	}
+#define	PINMODE_INVERT_OE	BIT(15)
 
-#define PIN_GROUP_WITH_ALT(n, p, m, i)		\
-	{					\
-		.name = (n),			\
-		.pins = (p),			\
-		.npins = ARRAY_SIZE((p)),	\
-		.altfunc.mode = (m),		\
-		.altfunc.invert_oe = (i),	\
-	}
+#define PINMODE(m, i)		((m) | ((i) * PINMODE_INVERT_OE))
 
-#define PIN_GROUP_WITH_OVERRIDE(n, p, m, i, o)	\
-	{					\
-		.name = (n),			\
-		.pins = (p),			\
-		.npins = ARRAY_SIZE((p)),	\
-		.altfunc.mode = (m),		\
-		.altfunc.invert_oe = (i),	\
-		.overrides = (o),		\
-		.noverrides = ARRAY_SIZE((o)),	\
-	}
-
-#define GPIO_PINRANGE(start, end)		\
+#define CHV_GPP(start, end)		\
 	{					\
 		.base = (start),		\
-		.npins = (end) - (start) + 1,	\
+		.size = (end) - (start) + 1,	\
 	}
 
 static const struct pinctrl_pin_desc southwest_pins[] = {
@@ -288,40 +224,37 @@ static const unsigned southwest_i2c6_pins[] = { 47, 51 };
 static const unsigned southwest_i2c_nfc_pins[] = { 49, 52 };
 static const unsigned southwest_spi3_pins[] = { 76, 79, 80, 81, 82 };
 
-/* LPE I2S TXD pins need to have invert_oe set */
-static const struct chv_alternate_function southwest_lpe_altfuncs[] = {
-	ALTERNATE_FUNCTION(30, 1, true),
-	ALTERNATE_FUNCTION(34, 1, true),
-	ALTERNATE_FUNCTION(97, 1, true),
+/* Some of LPE I2S TXD pins need to have OE inversion set */
+static const unsigned int southwest_lpe_altfuncs[] = {
+	PINMODE(1, 1), PINMODE(1, 0), PINMODE(1, 0), PINMODE(1, 0), /* 30, 31, 32, 33 */
+	PINMODE(1, 1), PINMODE(1, 0), PINMODE(1, 0), PINMODE(1, 0), /* 34, 35, 36, 37 */
+	PINMODE(1, 0), PINMODE(1, 0), PINMODE(1, 0), PINMODE(1, 1), /* 92, 94, 96, 97 */
 };
 
 /*
  * Two spi3 chipselects are available in different mode than the main spi3
- * functionality, which is using mode 1.
+ * functionality, which is using mode 2.
  */
-static const struct chv_alternate_function southwest_spi3_altfuncs[] = {
-	ALTERNATE_FUNCTION(76, 3, false),
-	ALTERNATE_FUNCTION(80, 3, false),
+static const unsigned int southwest_spi3_altfuncs[] = {
+	PINMODE(3, 0), PINMODE(2, 0), PINMODE(3, 0), PINMODE(2, 0), /* 76, 79, 80, 81 */
+	PINMODE(2, 0),						    /* 82 */
 };
 
-static const struct chv_pingroup southwest_groups[] = {
-	PIN_GROUP_WITH_ALT("uart0_grp", southwest_uart0_pins, 2, false),
-	PIN_GROUP_WITH_ALT("uart1_grp", southwest_uart1_pins, 1, false),
-	PIN_GROUP_WITH_ALT("uart2_grp", southwest_uart2_pins, 1, false),
-	PIN_GROUP_WITH_ALT("hda_grp", southwest_hda_pins, 2, false),
-	PIN_GROUP_WITH_ALT("i2c0_grp", southwest_i2c0_pins, 1, true),
-	PIN_GROUP_WITH_ALT("i2c1_grp", southwest_i2c1_pins, 1, true),
-	PIN_GROUP_WITH_ALT("i2c2_grp", southwest_i2c2_pins, 1, true),
-	PIN_GROUP_WITH_ALT("i2c3_grp", southwest_i2c3_pins, 1, true),
-	PIN_GROUP_WITH_ALT("i2c4_grp", southwest_i2c4_pins, 1, true),
-	PIN_GROUP_WITH_ALT("i2c5_grp", southwest_i2c5_pins, 1, true),
-	PIN_GROUP_WITH_ALT("i2c6_grp", southwest_i2c6_pins, 1, true),
-	PIN_GROUP_WITH_ALT("i2c_nfc_grp", southwest_i2c_nfc_pins, 2, true),
-
-	PIN_GROUP_WITH_OVERRIDE("lpe_grp", southwest_lpe_pins, 1, false,
-				southwest_lpe_altfuncs),
-	PIN_GROUP_WITH_OVERRIDE("spi3_grp", southwest_spi3_pins, 2, false,
-				southwest_spi3_altfuncs),
+static const struct intel_pingroup southwest_groups[] = {
+	PIN_GROUP("uart0_grp", southwest_uart0_pins, PINMODE(2, 0)),
+	PIN_GROUP("uart1_grp", southwest_uart1_pins, PINMODE(1, 0)),
+	PIN_GROUP("uart2_grp", southwest_uart2_pins, PINMODE(1, 0)),
+	PIN_GROUP("hda_grp", southwest_hda_pins, PINMODE(2, 0)),
+	PIN_GROUP("i2c0_grp", southwest_i2c0_pins, PINMODE(1, 1)),
+	PIN_GROUP("i2c1_grp", southwest_i2c1_pins, PINMODE(1, 1)),
+	PIN_GROUP("i2c2_grp", southwest_i2c2_pins, PINMODE(1, 1)),
+	PIN_GROUP("i2c3_grp", southwest_i2c3_pins, PINMODE(1, 1)),
+	PIN_GROUP("i2c4_grp", southwest_i2c4_pins, PINMODE(1, 1)),
+	PIN_GROUP("i2c5_grp", southwest_i2c5_pins, PINMODE(1, 1)),
+	PIN_GROUP("i2c6_grp", southwest_i2c6_pins, PINMODE(1, 1)),
+	PIN_GROUP("i2c_nfc_grp", southwest_i2c_nfc_pins, PINMODE(2, 1)),
+	PIN_GROUP("lpe_grp", southwest_lpe_pins, southwest_lpe_altfuncs),
+	PIN_GROUP("spi3_grp", southwest_spi3_pins, southwest_spi3_altfuncs),
 };
 
 static const char * const southwest_uart0_groups[] = { "uart0_grp" };
@@ -360,14 +293,14 @@ static const struct intel_function southwest_functions[] = {
 	FUNCTION("spi3", southwest_spi3_groups),
 };
 
-static const struct chv_gpio_pinrange southwest_gpio_ranges[] = {
-	GPIO_PINRANGE(0, 7),
-	GPIO_PINRANGE(15, 22),
-	GPIO_PINRANGE(30, 37),
-	GPIO_PINRANGE(45, 52),
-	GPIO_PINRANGE(60, 67),
-	GPIO_PINRANGE(75, 82),
-	GPIO_PINRANGE(90, 97),
+static const struct intel_padgroup southwest_gpps[] = {
+	CHV_GPP(0, 7),
+	CHV_GPP(15, 22),
+	CHV_GPP(30, 37),
+	CHV_GPP(45, 52),
+	CHV_GPP(60, 67),
+	CHV_GPP(75, 82),
+	CHV_GPP(90, 97),
 };
 
 static const struct chv_community southwest_community = {
@@ -378,8 +311,8 @@ static const struct chv_community southwest_community = {
 	.ngroups = ARRAY_SIZE(southwest_groups),
 	.functions = southwest_functions,
 	.nfunctions = ARRAY_SIZE(southwest_functions),
-	.gpio_ranges = southwest_gpio_ranges,
-	.ngpio_ranges = ARRAY_SIZE(southwest_gpio_ranges),
+	.gpps = southwest_gpps,
+	.ngpps = ARRAY_SIZE(southwest_gpps),
 	/*
 	 * Southwest community can generate GPIO interrupts only for the
 	 * first 8 interrupts. The upper half (8-15) can only be used to
@@ -455,20 +388,20 @@ static const struct pinctrl_pin_desc north_pins[] = {
 	PINCTRL_PIN(72, "PANEL0_VDDEN"),
 };
 
-static const struct chv_gpio_pinrange north_gpio_ranges[] = {
-	GPIO_PINRANGE(0, 8),
-	GPIO_PINRANGE(15, 27),
-	GPIO_PINRANGE(30, 41),
-	GPIO_PINRANGE(45, 56),
-	GPIO_PINRANGE(60, 72),
+static const struct intel_padgroup north_gpps[] = {
+	CHV_GPP(0, 8),
+	CHV_GPP(15, 27),
+	CHV_GPP(30, 41),
+	CHV_GPP(45, 56),
+	CHV_GPP(60, 72),
 };
 
 static const struct chv_community north_community = {
 	.uid = "2",
 	.pins = north_pins,
 	.npins = ARRAY_SIZE(north_pins),
-	.gpio_ranges = north_gpio_ranges,
-	.ngpio_ranges = ARRAY_SIZE(north_gpio_ranges),
+	.gpps = north_gpps,
+	.ngpps = ARRAY_SIZE(north_gpps),
 	/*
 	 * North community can generate GPIO interrupts only for the first
 	 * 8 interrupts. The upper half (8-15) can only be used to trigger
@@ -506,17 +439,17 @@ static const struct pinctrl_pin_desc east_pins[] = {
 	PINCTRL_PIN(26, "MF_ISH_I2C1_SDA"),
 };
 
-static const struct chv_gpio_pinrange east_gpio_ranges[] = {
-	GPIO_PINRANGE(0, 11),
-	GPIO_PINRANGE(15, 26),
+static const struct intel_padgroup east_gpps[] = {
+	CHV_GPP(0, 11),
+	CHV_GPP(15, 26),
 };
 
 static const struct chv_community east_community = {
 	.uid = "3",
 	.pins = east_pins,
 	.npins = ARRAY_SIZE(east_pins),
-	.gpio_ranges = east_gpio_ranges,
-	.ngpio_ranges = ARRAY_SIZE(east_gpio_ranges),
+	.gpps = east_gpps,
+	.ngpps = ARRAY_SIZE(east_gpps),
 	.nirqs = 16,
 	.acpi_space_id = 0x93,
 };
@@ -596,14 +529,14 @@ static const unsigned southeast_sdmmc3_pins[] = {
 static const unsigned southeast_spi1_pins[] = { 60, 61, 62, 64, 66 };
 static const unsigned southeast_spi2_pins[] = { 2, 3, 4, 6, 7 };
 
-static const struct chv_pingroup southeast_groups[] = {
-	PIN_GROUP_WITH_ALT("pwm0_grp", southeast_pwm0_pins, 1, false),
-	PIN_GROUP_WITH_ALT("pwm1_grp", southeast_pwm1_pins, 1, false),
-	PIN_GROUP_WITH_ALT("sdmmc1_grp", southeast_sdmmc1_pins, 1, false),
-	PIN_GROUP_WITH_ALT("sdmmc2_grp", southeast_sdmmc2_pins, 1, false),
-	PIN_GROUP_WITH_ALT("sdmmc3_grp", southeast_sdmmc3_pins, 1, false),
-	PIN_GROUP_WITH_ALT("spi1_grp", southeast_spi1_pins, 1, false),
-	PIN_GROUP_WITH_ALT("spi2_grp", southeast_spi2_pins, 4, false),
+static const struct intel_pingroup southeast_groups[] = {
+	PIN_GROUP("pwm0_grp", southeast_pwm0_pins, PINMODE(1, 0)),
+	PIN_GROUP("pwm1_grp", southeast_pwm1_pins, PINMODE(1, 0)),
+	PIN_GROUP("sdmmc1_grp", southeast_sdmmc1_pins, PINMODE(1, 0)),
+	PIN_GROUP("sdmmc2_grp", southeast_sdmmc2_pins, PINMODE(1, 0)),
+	PIN_GROUP("sdmmc3_grp", southeast_sdmmc3_pins, PINMODE(1, 0)),
+	PIN_GROUP("spi1_grp", southeast_spi1_pins, PINMODE(1, 0)),
+	PIN_GROUP("spi2_grp", southeast_spi2_pins, PINMODE(4, 0)),
 };
 
 static const char * const southeast_pwm0_groups[] = { "pwm0_grp" };
@@ -624,13 +557,13 @@ static const struct intel_function southeast_functions[] = {
 	FUNCTION("spi2", southeast_spi2_groups),
 };
 
-static const struct chv_gpio_pinrange southeast_gpio_ranges[] = {
-	GPIO_PINRANGE(0, 7),
-	GPIO_PINRANGE(15, 26),
-	GPIO_PINRANGE(30, 35),
-	GPIO_PINRANGE(45, 52),
-	GPIO_PINRANGE(60, 69),
-	GPIO_PINRANGE(75, 85),
+static const struct intel_padgroup southeast_gpps[] = {
+	CHV_GPP(0, 7),
+	CHV_GPP(15, 26),
+	CHV_GPP(30, 35),
+	CHV_GPP(45, 52),
+	CHV_GPP(60, 69),
+	CHV_GPP(75, 85),
 };
 
 static const struct chv_community southeast_community = {
@@ -641,8 +574,8 @@ static const struct chv_community southeast_community = {
 	.ngroups = ARRAY_SIZE(southeast_groups),
 	.functions = southeast_functions,
 	.nfunctions = ARRAY_SIZE(southeast_functions),
-	.gpio_ranges = southeast_gpio_ranges,
-	.ngpio_ranges = ARRAY_SIZE(southeast_gpio_ranges),
+	.gpps = southeast_gpps,
+	.ngpps = ARRAY_SIZE(southeast_gpps),
 	.nirqs = 16,
 	.acpi_space_id = 0x94,
 };
@@ -789,7 +722,7 @@ static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned int function, unsigned int group)
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	const struct chv_pingroup *grp;
+	const struct intel_pingroup *grp;
 	unsigned long flags;
 	int i;
 
@@ -808,22 +741,21 @@ static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	}
 
 	for (i = 0; i < grp->npins; i++) {
-		const struct chv_alternate_function *altfunc = &grp->altfunc;
 		int pin = grp->pins[i];
 		void __iomem *reg;
+		unsigned int mode;
+		bool invert_oe;
 		u32 value;
 
 		/* Check if there is pin-specific config */
-		if (grp->overrides) {
-			int j;
-
-			for (j = 0; j < grp->noverrides; j++) {
-				if (grp->overrides[j].pin == pin) {
-					altfunc = &grp->overrides[j];
-					break;
-				}
-			}
-		}
+		if (grp->modes)
+			mode = grp->modes[i];
+		else
+			mode = grp->mode;
+
+		/* Extract OE inversion */
+		invert_oe = mode & PINMODE_INVERT_OE;
+		mode &= ~PINMODE_INVERT_OE;
 
 		reg = chv_padreg(pctrl, pin, CHV_PADCTRL0);
 		value = readl(reg);
@@ -831,18 +763,18 @@ static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		value &= ~CHV_PADCTRL0_GPIOEN;
 		/* Set to desired mode */
 		value &= ~CHV_PADCTRL0_PMODE_MASK;
-		value |= altfunc->mode << CHV_PADCTRL0_PMODE_SHIFT;
+		value |= mode << CHV_PADCTRL0_PMODE_SHIFT;
 		chv_writel(value, reg);
 
 		/* Update for invert_oe */
 		reg = chv_padreg(pctrl, pin, CHV_PADCTRL1);
 		value = readl(reg) & ~CHV_PADCTRL1_INVRXTX_MASK;
-		if (altfunc->invert_oe)
+		if (invert_oe)
 			value |= CHV_PADCTRL1_INVRXTX_TXENABLE;
 		chv_writel(value, reg);
 
 		dev_dbg(pctrl->dev, "configured pin %u mode %u OE %sinverted\n",
-			pin, altfunc->mode, altfunc->invert_oe ? "" : "not ");
+			pin, mode, invert_oe ? "" : "not ");
 	}
 
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
@@ -1590,14 +1522,14 @@ static int chv_gpio_add_pin_ranges(struct gpio_chip *chip)
 {
 	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
 	const struct chv_community *community = pctrl->community;
-	const struct chv_gpio_pinrange *range;
+	const struct intel_padgroup *gpp;
 	int ret, i;
 
-	for (i = 0; i < community->ngpio_ranges; i++) {
-		range = &community->gpio_ranges[i];
+	for (i = 0; i < community->ngpps; i++) {
+		gpp = &community->gpps[i];
 		ret = gpiochip_add_pin_range(chip, dev_name(pctrl->dev),
-					     range->base, range->base,
-					     range->npins);
+					     gpp->base, gpp->base,
+					     gpp->size);
 		if (ret) {
 			dev_err(pctrl->dev, "failed to add GPIO pin range\n");
 			return ret;
@@ -1609,7 +1541,7 @@ static int chv_gpio_add_pin_ranges(struct gpio_chip *chip)
 
 static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 {
-	const struct chv_gpio_pinrange *range;
+	const struct intel_padgroup *gpp;
 	struct gpio_chip *chip = &pctrl->chip;
 	bool need_valid_mask = !dmi_check_system(chv_no_valid_mask);
 	const struct chv_community *community = pctrl->community;
@@ -1657,12 +1589,12 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 	}
 
 	if (!need_valid_mask) {
-		for (i = 0; i < community->ngpio_ranges; i++) {
-			range = &community->gpio_ranges[i];
+		for (i = 0; i < community->ngpps; i++) {
+			gpp = &community->gpps[i];
 
 			irq_domain_associate_many(chip->irq.domain, irq_base,
-						  range->base, range->npins);
-			irq_base += range->npins;
+						  gpp->base, gpp->size);
+			irq_base += gpp->size;
 		}
 	}
 
-- 
2.25.1

