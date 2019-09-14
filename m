Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8D80B2B0E
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 13:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbfINLKW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 14 Sep 2019 07:10:22 -0400
Received: from onstation.org ([52.200.56.107]:34970 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726313AbfINLKW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 14 Sep 2019 07:10:22 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 503D03E8E0;
        Sat, 14 Sep 2019 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1568459421;
        bh=Ta/dG53gYowg2PevPqyJILIa5gwt4OlLQ3fdBW1T1S4=;
        h=From:To:Cc:Subject:Date:From;
        b=o+6zBu1hhK9EZEE70OVLSMeD3hVBjVgrGmGGxZ9VW9xHZgaI2hCBr5Iz5YtCs1IFw
         fgBJjXR0QqZTWckcexC7pnRkSziRgEoGfwre6KC7V5AhtDpMDc+Ytzi8E7VtDT5WEo
         bMFy5edNN4hvWqIKhAGMVMmrl2ZCSHf8wRRN3AUQ=
From:   Brian Masney <masneyb@onstation.org>
To:     linus.walleij@linaro.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] qcom: ssbi-gpio: convert to hierarchical IRQ helpers in gpio core
Date:   Sat, 14 Sep 2019 07:10:10 -0400
Message-Id: <20190914111010.24384-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now that the GPIO core has support for hierarchical IRQ chips, convert
Qualcomm's ssbi-gpio over to use these new helpers to reduce duplicated
code across drivers.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Linus: I've only compile tested this driver. Hopefully you have time to
test this on your DragonBoard.

 drivers/pinctrl/qcom/Kconfig             |   1 +
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 121 +++++++----------------
 2 files changed, 34 insertions(+), 88 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 32fc2458b8eb..41fab621de1b 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -152,6 +152,7 @@ config PINCTRL_QCOM_SSBI_PMIC
        select PINMUX
        select PINCONF
        select GENERIC_PINCONF
+       select GPIOLIB_IRQCHIP
        select IRQ_DOMAIN_HIERARCHY
        help
          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index c1f7d0799ebe..dca86886b1f9 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -56,7 +56,6 @@
 /**
  * struct pm8xxx_pin_data - dynamic configuration for a pin
  * @reg:               address of the control register
- * @irq:               IRQ from the PMIC interrupt controller
  * @power_source:      logical selected voltage source, mapping in static data
  *                     is used translate to register values
  * @mode:              operating mode for the pin (input/output)
@@ -72,7 +71,6 @@
  */
 struct pm8xxx_pin_data {
 	unsigned reg;
-	int irq;
 	u8 power_source;
 	u8 mode;
 	bool open_drain;
@@ -93,9 +91,6 @@ struct pm8xxx_gpio {
 
 	struct pinctrl_desc desc;
 	unsigned npins;
-
-	struct fwnode_handle *fwnode;
-	struct irq_domain *domain;
 };
 
 static const struct pinconf_generic_params pm8xxx_gpio_bindings[] = {
@@ -491,13 +486,16 @@ static int pm8xxx_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct pm8xxx_gpio *pctrl = gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin = pctrl->desc.pins[offset].drv_data;
+	int ret, irq;
 	bool state;
-	int ret;
 
-	if (pin->mode == PM8XXX_GPIO_MODE_OUTPUT) {
-		ret = pin->output_value;
-	} else if (pin->irq >= 0) {
-		ret = irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LEVEL, &state);
+	if (pin->mode == PM8XXX_GPIO_MODE_OUTPUT)
+		return pin->output_value;
+
+	irq = chip->to_irq(chip, offset);
+	if (irq >= 0) {
+		ret = irq_get_irqchip_state(irq, IRQCHIP_STATE_LINE_LEVEL,
+					    &state);
 		if (!ret)
 			ret = !!state;
 	} else
@@ -535,37 +533,6 @@ static int pm8xxx_gpio_of_xlate(struct gpio_chip *chip,
 }
 
 
-static int pm8xxx_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
-{
-	struct pm8xxx_gpio *pctrl = gpiochip_get_data(chip);
-	struct pm8xxx_pin_data *pin = pctrl->desc.pins[offset].drv_data;
-	struct irq_fwspec fwspec;
-	int ret;
-
-	fwspec.fwnode = pctrl->fwnode;
-	fwspec.param_count = 2;
-	fwspec.param[0] = offset + PM8XXX_GPIO_PHYSICAL_OFFSET;
-	fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
-
-	ret = irq_create_fwspec_mapping(&fwspec);
-
-	/*
-	 * Cache the IRQ since pm8xxx_gpio_get() needs this to get determine the
-	 * line level.
-	 */
-	pin->irq = ret;
-
-	return ret;
-}
-
-static void pm8xxx_gpio_free(struct gpio_chip *chip, unsigned int offset)
-{
-	struct pm8xxx_gpio *pctrl = gpiochip_get_data(chip);
-	struct pm8xxx_pin_data *pin = pctrl->desc.pins[offset].drv_data;
-
-	pin->irq = -1;
-}
-
 #ifdef CONFIG_DEBUG_FS
 #include <linux/seq_file.h>
 
@@ -624,13 +591,11 @@ static void pm8xxx_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 #endif
 
 static const struct gpio_chip pm8xxx_gpio_template = {
-	.free = pm8xxx_gpio_free,
 	.direction_input = pm8xxx_gpio_direction_input,
 	.direction_output = pm8xxx_gpio_direction_output,
 	.get = pm8xxx_gpio_get,
 	.set = pm8xxx_gpio_set,
 	.of_xlate = pm8xxx_gpio_of_xlate,
-	.to_irq = pm8xxx_gpio_to_irq,
 	.dbg_show = pm8xxx_gpio_dbg_show,
 	.owner = THIS_MODULE,
 };
@@ -712,43 +677,24 @@ static int pm8xxx_domain_translate(struct irq_domain *domain,
 	return 0;
 }
 
-static int pm8xxx_domain_alloc(struct irq_domain *domain, unsigned int virq,
-			       unsigned int nr_irqs, void *data)
+static unsigned int pm8xxx_child_offset_to_irq(struct gpio_chip *chip,
+					       unsigned int offset)
 {
-	struct pm8xxx_gpio *pctrl = container_of(domain->host_data,
-						 struct pm8xxx_gpio, chip);
-	struct irq_fwspec *fwspec = data;
-	struct irq_fwspec parent_fwspec;
-	irq_hw_number_t hwirq;
-	unsigned int type;
-	int ret, i;
-
-	ret = pm8xxx_domain_translate(domain, fwspec, &hwirq, &type);
-	if (ret)
-		return ret;
-
-	for (i = 0; i < nr_irqs; i++)
-		irq_domain_set_info(domain, virq + i, hwirq + i,
-				    &pm8xxx_irq_chip, pctrl, handle_level_irq,
-				    NULL, NULL);
+	return offset + PM8XXX_GPIO_PHYSICAL_OFFSET;
+}
 
-	parent_fwspec.fwnode = domain->parent->fwnode;
-	parent_fwspec.param_count = 2;
-	parent_fwspec.param[0] = hwirq + 0xc0;
-	parent_fwspec.param[1] = fwspec->param[1];
+static int pm8xxx_child_to_parent_hwirq(struct gpio_chip *chip,
+					unsigned int child_hwirq,
+					unsigned int child_type,
+					unsigned int *parent_hwirq,
+					unsigned int *parent_type)
+{
+	*parent_hwirq = child_hwirq + 0xc0;
+	*parent_type = child_type;
 
-	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
-					    &parent_fwspec);
+	return 0;
 }
 
-static const struct irq_domain_ops pm8xxx_domain_ops = {
-	.activate = gpiochip_irq_domain_activate,
-	.alloc = pm8xxx_domain_alloc,
-	.deactivate = gpiochip_irq_domain_deactivate,
-	.free = irq_domain_free_irqs_common,
-	.translate = pm8xxx_domain_translate,
-};
-
 static const struct of_device_id pm8xxx_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8018-gpio", .data = (void *) 6 },
 	{ .compatible = "qcom,pm8038-gpio", .data = (void *) 12 },
@@ -765,6 +711,7 @@ static int pm8xxx_gpio_probe(struct platform_device *pdev)
 	struct irq_domain *parent_domain;
 	struct device_node *parent_node;
 	struct pinctrl_pin_desc *pins;
+	struct gpio_irq_chip *girq;
 	struct pm8xxx_gpio *pctrl;
 	int ret, i;
 
@@ -800,7 +747,6 @@ static int pm8xxx_gpio_probe(struct platform_device *pdev)
 
 	for (i = 0; i < pctrl->desc.npins; i++) {
 		pin_data[i].reg = SSBI_REG_ADDR_GPIO(i);
-		pin_data[i].irq = -1;
 
 		ret = pm8xxx_pin_populate(pctrl, &pin_data[i]);
 		if (ret)
@@ -841,19 +787,21 @@ static int pm8xxx_gpio_probe(struct platform_device *pdev)
 	if (!parent_domain)
 		return -ENXIO;
 
-	pctrl->fwnode = of_node_to_fwnode(pctrl->dev->of_node);
-	pctrl->domain = irq_domain_create_hierarchy(parent_domain, 0,
-						    pctrl->chip.ngpio,
-						    pctrl->fwnode,
-						    &pm8xxx_domain_ops,
-						    &pctrl->chip);
-	if (!pctrl->domain)
-		return -ENODEV;
+	girq = &pctrl->chip.irq;
+	girq->chip = &pm8xxx_irq_chip;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+	girq->fwnode = of_node_to_fwnode(pctrl->dev->of_node);
+	girq->parent_domain = parent_domain;
+	girq->child_to_parent_hwirq = pm8xxx_child_to_parent_hwirq;
+	girq->populate_parent_fwspec = gpiochip_populate_parent_fwspec_fourcell;
+	girq->child_offset_to_irq = pm8xxx_child_offset_to_irq;
+	girq->child_irq_domain_ops.translate = pm8xxx_domain_translate;
 
 	ret = gpiochip_add_data(&pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(&pdev->dev, "failed register gpiochip\n");
-		goto err_chip_add_data;
+		return ret;
 	}
 
 	/*
@@ -883,8 +831,6 @@ static int pm8xxx_gpio_probe(struct platform_device *pdev)
 
 unregister_gpiochip:
 	gpiochip_remove(&pctrl->chip);
-err_chip_add_data:
-	irq_domain_remove(pctrl->domain);
 
 	return ret;
 }
@@ -894,7 +840,6 @@ static int pm8xxx_gpio_remove(struct platform_device *pdev)
 	struct pm8xxx_gpio *pctrl = platform_get_drvdata(pdev);
 
 	gpiochip_remove(&pctrl->chip);
-	irq_domain_remove(pctrl->domain);
 
 	return 0;
 }
-- 
2.21.0

