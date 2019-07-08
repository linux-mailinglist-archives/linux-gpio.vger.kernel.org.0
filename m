Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA54F61D67
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 13:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730284AbfGHLCD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 07:02:03 -0400
Received: from onstation.org ([52.200.56.107]:56190 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730266AbfGHLB6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jul 2019 07:01:58 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 9E60048975;
        Mon,  8 Jul 2019 11:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1562583718;
        bh=DgaHBZzlEyqiB3ritaN8n33SgsqcrBxMo8HWSjWaz0k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R1W8KCUrDNvaDFW0VvoF6RuvHAmiufdyCW1EKHA1QGGOvkJ/g79ehdd3LSyCwkLdH
         WNQMvwLojw/0TLaau0mNyl4XdF/yUA4xvLv7jY+PYSpGEZeLL8Rkgl4Sxlkj25O859
         8v4Tl70fvCWeCsaIYIMhXfUcBmktrz1Yo7vswcao=
From:   Brian Masney <masneyb@onstation.org>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        tglx@linutronix.de, marc.zyngier@arm.com, ilina@codeaurora.org,
        jonathanh@nvidia.com, skomatineni@nvidia.com, bbiswas@nvidia.com,
        linux-tegra@vger.kernel.org, david.daney@cavium.com,
        yamada.masahiro@socionext.com, treding@nvidia.com,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] qcom: spmi-gpio: convert to hierarchical IRQ helpers in gpio core
Date:   Mon,  8 Jul 2019 07:01:38 -0400
Message-Id: <20190708110138.24657-5-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190708110138.24657-1-masneyb@onstation.org>
References: <20190708110138.24657-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now that the GPIO core has support for hierarchical IRQ chips, convert
Qualcomm's spmi-gpio over to use these new helpers to reduce duplicated
code across drivers.

This change was tested on a LG Nexus 5 (hammerhead) phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/pinctrl/qcom/Kconfig             |  1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 92 +++++++-----------------
 2 files changed, 26 insertions(+), 67 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 27ab585a639c..9b36da702925 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -138,6 +138,7 @@ config PINCTRL_QCOM_SPMI_PMIC
        select PINMUX
        select PINCONF
        select GENERIC_PINCONF
+       select GPIOLIB_IRQCHIP
        select IRQ_DOMAIN_HIERARCHY
        help
          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index f39da87ea185..0bef149c2f16 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -170,8 +170,6 @@ struct pmic_gpio_state {
 	struct regmap	*map;
 	struct pinctrl_dev *ctrl;
 	struct gpio_chip chip;
-	struct fwnode_handle *fwnode;
-	struct irq_domain *domain;
 };
 
 static const struct pinconf_generic_params pmic_gpio_bindings[] = {
@@ -751,23 +749,6 @@ static int pmic_gpio_of_xlate(struct gpio_chip *chip,
 	return gpio_desc->args[0] - PMIC_GPIO_PHYSICAL_OFFSET;
 }
 
-static int pmic_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
-{
-	struct pmic_gpio_state *state = gpiochip_get_data(chip);
-	struct irq_fwspec fwspec;
-
-	fwspec.fwnode = state->fwnode;
-	fwspec.param_count = 2;
-	fwspec.param[0] = pin + PMIC_GPIO_PHYSICAL_OFFSET;
-	/*
-	 * Set the type to a safe value temporarily. This will be overwritten
-	 * later with the proper value by irq_set_type.
-	 */
-	fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
-
-	return irq_create_fwspec_mapping(&fwspec);
-}
-
 static void pmic_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
 	struct pmic_gpio_state *state = gpiochip_get_data(chip);
@@ -787,7 +768,6 @@ static const struct gpio_chip pmic_gpio_gpio_template = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.of_xlate		= pmic_gpio_of_xlate,
-	.to_irq			= pmic_gpio_to_irq,
 	.dbg_show		= pmic_gpio_dbg_show,
 };
 
@@ -964,46 +944,24 @@ static int pmic_gpio_domain_translate(struct irq_domain *domain,
 	return 0;
 }
 
-static int pmic_gpio_domain_alloc(struct irq_domain *domain, unsigned int virq,
-				  unsigned int nr_irqs, void *data)
+static unsigned int pmic_gpio_child_pin_to_irq(struct gpio_chip *chip,
+					       unsigned int pin)
 {
-	struct pmic_gpio_state *state = container_of(domain->host_data,
-						     struct pmic_gpio_state,
-						     chip);
-	struct irq_fwspec *fwspec = data;
-	struct irq_fwspec parent_fwspec;
-	irq_hw_number_t hwirq;
-	unsigned int type;
-	int ret, i;
-
-	ret = pmic_gpio_domain_translate(domain, fwspec, &hwirq, &type);
-	if (ret)
-		return ret;
-
-	for (i = 0; i < nr_irqs; i++)
-		irq_domain_set_info(domain, virq + i, hwirq + i,
-				    &pmic_gpio_irq_chip, state,
-				    handle_level_irq, NULL, NULL);
+	return pin + PMIC_GPIO_PHYSICAL_OFFSET;
+}
 
-	parent_fwspec.fwnode = domain->parent->fwnode;
-	parent_fwspec.param_count = 4;
-	parent_fwspec.param[0] = 0;
-	parent_fwspec.param[1] = hwirq + 0xc0;
-	parent_fwspec.param[2] = 0;
-	parent_fwspec.param[3] = fwspec->param[1];
+static int pmic_gpio_child_to_parent_hwirq(struct gpio_chip *chip,
+					   unsigned int child_hwirq,
+					   unsigned int child_type,
+					   unsigned int *parent_hwirq,
+					   unsigned int *parent_type)
+{
+	*parent_hwirq = child_hwirq + 0xc0;
+	*parent_type = child_type;
 
-	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
-					    &parent_fwspec);
+	return 0;
 }
 
-static const struct irq_domain_ops pmic_gpio_domain_ops = {
-	.activate = gpiochip_irq_domain_activate,
-	.alloc = pmic_gpio_domain_alloc,
-	.deactivate = gpiochip_irq_domain_deactivate,
-	.free = irq_domain_free_irqs_common,
-	.translate = pmic_gpio_domain_translate,
-};
-
 static int pmic_gpio_probe(struct platform_device *pdev)
 {
 	struct irq_domain *parent_domain;
@@ -1013,6 +971,7 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 	struct pinctrl_desc *pctrldesc;
 	struct pmic_gpio_pad *pad, *pads;
 	struct pmic_gpio_state *state;
+	struct gpio_irq_chip *girq;
 	int ret, npins, i;
 	u32 reg;
 
@@ -1092,19 +1051,21 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 	if (!parent_domain)
 		return -ENXIO;
 
-	state->fwnode = of_node_to_fwnode(state->dev->of_node);
-	state->domain = irq_domain_create_hierarchy(parent_domain, 0,
-						    state->chip.ngpio,
-						    state->fwnode,
-						    &pmic_gpio_domain_ops,
-						    &state->chip);
-	if (!state->domain)
-		return -ENODEV;
+	girq = &state->chip.irq;
+	girq->chip = &pmic_gpio_irq_chip;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+	girq->fwnode = of_node_to_fwnode(state->dev->of_node);
+	girq->parent_domain = parent_domain;
+	girq->child_to_parent_hwirq = pmic_gpio_child_to_parent_hwirq;
+	girq->populate_parent_fwspec = gpiochip_populate_parent_fwspec_fourcell;
+	girq->child_pin_to_irq = pmic_gpio_child_pin_to_irq;
+	girq->child_irq_domain_ops.translate = pmic_gpio_domain_translate;
 
 	ret = gpiochip_add_data(&state->chip, state);
 	if (ret) {
 		dev_err(state->dev, "can't add gpio chip\n");
-		goto err_chip_add_data;
+		return ret;
 	}
 
 	/*
@@ -1130,8 +1091,6 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 
 err_range:
 	gpiochip_remove(&state->chip);
-err_chip_add_data:
-	irq_domain_remove(state->domain);
 	return ret;
 }
 
@@ -1140,7 +1099,6 @@ static int pmic_gpio_remove(struct platform_device *pdev)
 	struct pmic_gpio_state *state = platform_get_drvdata(pdev);
 
 	gpiochip_remove(&state->chip);
-	irq_domain_remove(state->domain);
 	return 0;
 }
 
-- 
2.20.1

