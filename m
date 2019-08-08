Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCC1861F0
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 14:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390080AbfHHMc7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 08:32:59 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34442 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389844AbfHHMc6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 08:32:58 -0400
Received: by mail-lf1-f67.google.com with SMTP id b29so59473196lfq.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Aug 2019 05:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MkHNIJOnmbUgzS/a/Zj0X23D5bcaeezV1tKLBba6NdU=;
        b=tHIAoXryGyT7e0oVcdjcyxWWiIFkHa5mMWInSoGITnHhABeDGteun9GIfBQvJe5Hcj
         +T9QfyPDwqbTn2dtgicqfPMVTi1nWp0M/7OKeB9KBJleGj12zGU/7U2Ef0V/Rabg+Nav
         wR4wzueg/ssGeYgU1oKYbZNRjf7qYFfwYMxokIMOyEHdA5p3Ig0jeoTAP+AB4cOD8SLa
         SWEX65zzUCkw56aCaj7ivhMce37Mjlbsq5YGUThbghpDyxKAn43j2CDY9UzPxR96eBnx
         OtnNFca4sYY3IOhnDhXUtAzZk7ZT67/piX1GJffZP+1JBScpJYj3BTwdkkbvGHAyvv5y
         4p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MkHNIJOnmbUgzS/a/Zj0X23D5bcaeezV1tKLBba6NdU=;
        b=sf5YDfkoF/WhSjyC9wxDr4f4jBuNEMRwbv0D2Ije9A7h6Xy8Fg6BrTqS2BOQSGrrMC
         52KJgN0AziQUbLuuNGhrTEKwMoCAkC9bZiqgV1TsKieRSHoKRDhmg95eAG9VJmzijmPk
         /dFpkWvhLbZRuxFI08+v1zpUxNfp64kLHwK2NK0OrnCAk7ofJBoA/VJrWpqlDIYQP6Ep
         MZko8iNRhBUzTZJJXUCTO22aXRQefPrnWSZftB6MKmMSrwjrm8PkK2Rn9ANb6DNGutbu
         Ea2majA+lyVl/zTklcse7Cde3jIrQf10p2xrQZUZlB907Hk2mjVCmd9zdiMK7ygF/cfQ
         amZA==
X-Gm-Message-State: APjAAAVYsnDpOY9X5pn+qntPMLLHI7d8LeCyVxgc6DnlwK9zAgVYPDFa
        IByyHfzeXqWtrm1+YrmvyWQmGZKmlh8=
X-Google-Smtp-Source: APXvYqwZ7IKooWp2FaUGUcT0SBNh7QkdPruTpR1EAEqk2dIpRGPj5tSJYblRjS3AgfrWSURaIYHkuw==
X-Received: by 2002:a19:c150:: with SMTP id r77mr9803308lff.76.1565267576313;
        Thu, 08 Aug 2019 05:32:56 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id h10sm16976423lfp.33.2019.08.08.05.32.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 05:32:55 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/6 v2] qcom: spmi-gpio: convert to hierarchical IRQ helpers in gpio core
Date:   Thu,  8 Aug 2019 14:32:39 +0200
Message-Id: <20190808123242.5359-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808123242.5359-1-linus.walleij@linaro.org>
References: <20190808123242.5359-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Brian Masney <masneyb@onstation.org>

Now that the GPIO core has support for hierarchical IRQ chips, convert
Qualcomm's spmi-gpio over to use these new helpers to reduce duplicated
code across drivers.

This change was tested on a LG Nexus 5 (hammerhead) phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Change "child_pin_to_irq" into "child_offset_to_irq" so
  we avoid confusion with pin control.
---
 drivers/pinctrl/qcom/Kconfig             |  1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 92 +++++++-----------------
 2 files changed, 26 insertions(+), 67 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 8e14a5f2e970..fa2c87821401 100644
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
index f39da87ea185..442db15e0729 100644
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
+static unsigned int pmic_gpio_child_offset_to_irq(struct gpio_chip *chip,
+						  unsigned int offset)
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
+	return offset + PMIC_GPIO_PHYSICAL_OFFSET;
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
+	girq->child_offset_to_irq = pmic_gpio_child_offset_to_irq;
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
2.21.0

