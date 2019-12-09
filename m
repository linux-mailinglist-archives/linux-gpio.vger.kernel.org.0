Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 502FB116DAB
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727638AbfLINJg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:36 -0500
Received: from mga18.intel.com ([134.134.136.126]:29136 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727639AbfLINJg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:36 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="206887943"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 09 Dec 2019 05:09:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 06DAC993; Mon,  9 Dec 2019 15:09:28 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 19/24] pinctrl: lynxpoint: Reuse struct intel_pinctrl in the driver
Date:   Mon,  9 Dec 2019 15:09:21 +0200
Message-Id: <20191209130926.86483-20-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 84 ++++++++++++++++-------
 1 file changed, 60 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index ea46bd64226d..5a8c77c8306b 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -168,13 +168,6 @@ static const struct intel_pinctrl_soc_data lptlp_soc_data = {
 #define GPINDIS_BIT	BIT(2) /* disable input sensing */
 #define GPIWP_BIT	(BIT(0) | BIT(1)) /* weak pull options */
 
-struct lp_gpio {
-	struct gpio_chip	chip;
-	struct device		*dev;
-	raw_spinlock_t		lock;
-	void __iomem		*regs;
-};
-
 /*
  * Lynxpoint gpios are controlled through both bitmapped registers and
  * per gpio specific registers. The bitmapped registers are in chunks of
@@ -204,12 +197,34 @@ struct lp_gpio {
  * LP94_CONFIG2 (gpio 94) ...
  */
 
+static struct intel_community *lp_get_community(struct intel_pinctrl *lg,
+						unsigned int pin)
+{
+	struct intel_community *comm;
+	int i;
+
+	for (i = 0; i < lg->ncommunities; i++) {
+		comm = &lg->communities[i];
+		if (pin < comm->pin_base + comm->npins && pin >= comm->pin_base)
+			return comm;
+	}
+
+	return NULL;
+}
+
 static void __iomem *lp_gpio_reg(struct gpio_chip *chip, unsigned int offset,
 				 int reg)
 {
-	struct lp_gpio *lg = gpiochip_get_data(chip);
+	struct intel_pinctrl *lg = gpiochip_get_data(chip);
+	struct intel_community *comm;
 	int reg_offset;
 
+	comm = lp_get_community(lg, offset);
+	if (!comm)
+		return NULL;
+
+	offset -= comm->pin_base;
+
 	if (reg == LP_CONFIG1 || reg == LP_CONFIG2)
 		/* per gpio specific config registers */
 		reg_offset = offset * 8;
@@ -217,10 +232,10 @@ static void __iomem *lp_gpio_reg(struct gpio_chip *chip, unsigned int offset,
 		/* bitmapped registers */
 		reg_offset = (offset / 32) * 4;
 
-	return lg->regs + reg + reg_offset;
+	return comm->regs + reg_offset + reg;
 }
 
-static bool lp_gpio_acpi_use(struct lp_gpio *lg, unsigned int pin)
+static bool lp_gpio_acpi_use(struct intel_pinctrl *lg, unsigned int pin)
 {
 	void __iomem *acpi_use;
 
@@ -233,7 +248,7 @@ static bool lp_gpio_acpi_use(struct lp_gpio *lg, unsigned int pin)
 
 static int lp_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
-	struct lp_gpio *lg = gpiochip_get_data(chip);
+	struct intel_pinctrl *lg = gpiochip_get_data(chip);
 	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	void __iomem *conf2 = lp_gpio_reg(chip, offset, LP_CONFIG2);
 	u32 value;
@@ -259,7 +274,7 @@ static int lp_gpio_request(struct gpio_chip *chip, unsigned int offset)
 
 static void lp_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
-	struct lp_gpio *lg = gpiochip_get_data(chip);
+	struct intel_pinctrl *lg = gpiochip_get_data(chip);
 	void __iomem *conf2 = lp_gpio_reg(chip, offset, LP_CONFIG2);
 
 	/* disable input sensing */
@@ -276,7 +291,7 @@ static int lp_gpio_get(struct gpio_chip *chip, unsigned int offset)
 
 static void lp_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
-	struct lp_gpio *lg = gpiochip_get_data(chip);
+	struct intel_pinctrl *lg = gpiochip_get_data(chip);
 	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	unsigned long flags;
 
@@ -292,7 +307,7 @@ static void lp_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 
 static int lp_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
-	struct lp_gpio *lg = gpiochip_get_data(chip);
+	struct intel_pinctrl *lg = gpiochip_get_data(chip);
 	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	unsigned long flags;
 
@@ -306,7 +321,7 @@ static int lp_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 static int lp_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 				    int value)
 {
-	struct lp_gpio *lg = gpiochip_get_data(chip);
+	struct intel_pinctrl *lg = gpiochip_get_data(chip);
 	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	unsigned long flags;
 
@@ -333,7 +348,7 @@ static void lp_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct irq_data *data = irq_desc_get_irq_data(desc);
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct lp_gpio *lg = gpiochip_get_data(gc);
+	struct intel_pinctrl *lg = gpiochip_get_data(gc);
 	struct irq_chip *chip = irq_data_get_irq_chip(data);
 	void __iomem *reg, *ena;
 	unsigned long pending;
@@ -360,7 +375,7 @@ static void lp_gpio_irq_handler(struct irq_desc *desc)
 static void lp_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct lp_gpio *lg = gpiochip_get_data(gc);
+	struct intel_pinctrl *lg = gpiochip_get_data(gc);
 	u32 hwirq = irqd_to_hwirq(d);
 	void __iomem *reg = lp_gpio_reg(&lg->chip, hwirq, LP_INT_STAT);
 	unsigned long flags;
@@ -381,7 +396,7 @@ static void lp_irq_mask(struct irq_data *d)
 static void lp_irq_enable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct lp_gpio *lg = gpiochip_get_data(gc);
+	struct intel_pinctrl *lg = gpiochip_get_data(gc);
 	u32 hwirq = irqd_to_hwirq(d);
 	void __iomem *reg = lp_gpio_reg(&lg->chip, hwirq, LP_INT_ENABLE);
 	unsigned long flags;
@@ -394,7 +409,7 @@ static void lp_irq_enable(struct irq_data *d)
 static void lp_irq_disable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct lp_gpio *lg = gpiochip_get_data(gc);
+	struct intel_pinctrl *lg = gpiochip_get_data(gc);
 	u32 hwirq = irqd_to_hwirq(d);
 	void __iomem *reg = lp_gpio_reg(&lg->chip, hwirq, LP_INT_ENABLE);
 	unsigned long flags;
@@ -407,7 +422,7 @@ static void lp_irq_disable(struct irq_data *d)
 static int lp_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct lp_gpio *lg = gpiochip_get_data(gc);
+	struct intel_pinctrl *lg = gpiochip_get_data(gc);
 	u32 hwirq = irqd_to_hwirq(d);
 	void __iomem *reg = lp_gpio_reg(&lg->chip, hwirq, LP_CONFIG1);
 	unsigned long flags;
@@ -466,7 +481,7 @@ static struct irq_chip lp_irqchip = {
 
 static int lp_gpio_irq_init_hw(struct gpio_chip *chip)
 {
-	struct lp_gpio *lg = gpiochip_get_data(chip);
+	struct intel_pinctrl *lg = gpiochip_get_data(chip);
 	void __iomem *reg;
 	unsigned int base;
 
@@ -484,18 +499,32 @@ static int lp_gpio_irq_init_hw(struct gpio_chip *chip)
 
 static int lp_gpio_probe(struct platform_device *pdev)
 {
-	struct lp_gpio *lg;
+	const struct intel_pinctrl_soc_data *soc;
+	struct intel_pinctrl *lg;
 	struct gpio_chip *gc;
 	struct resource *io_rc, *irq_rc;
 	struct device *dev = &pdev->dev;
 	void __iomem *regs;
+	unsigned int i;
 	int ret;
 
+	soc = (const struct intel_pinctrl_soc_data *)device_get_match_data(dev);
+	if (!soc)
+		return -ENODEV;
+
 	lg = devm_kzalloc(dev, sizeof(*lg), GFP_KERNEL);
 	if (!lg)
 		return -ENOMEM;
 
 	lg->dev = dev;
+	lg->soc = soc;
+
+	lg->ncommunities = lg->soc->ncommunities;
+	lg->communities = devm_kcalloc(dev, lg->ncommunities,
+				       sizeof(*lg->communities), GFP_KERNEL);
+	if (!lg->communities)
+		return -ENOMEM;
+
 	platform_set_drvdata(pdev, lg);
 
 	io_rc = platform_get_resource(pdev, IORESOURCE_IO, 0);
@@ -510,7 +539,14 @@ static int lp_gpio_probe(struct platform_device *pdev)
 		return -EBUSY;
 	}
 
-	lg->regs = regs;
+	for (i = 0; i < lg->soc->ncommunities; i++) {
+		struct intel_community *comm = &lg->communities[i];
+
+		*comm = lg->soc->communities[i];
+
+		comm->regs = regs;
+		comm->pad_regs = regs + 0x100;
+	}
 
 	raw_spin_lock_init(&lg->lock);
 
@@ -578,7 +614,7 @@ static int lp_gpio_runtime_resume(struct device *dev)
 
 static int lp_gpio_resume(struct device *dev)
 {
-	struct lp_gpio *lg = dev_get_drvdata(dev);
+	struct intel_pinctrl *lg = dev_get_drvdata(dev);
 	void __iomem *reg;
 	int i;
 
-- 
2.24.0

