Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE2F5C8BA5
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 16:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbfJBOpK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 10:45:10 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53236 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfJBOpJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 10:45:09 -0400
Received: by mail-wm1-f68.google.com with SMTP id r19so7530136wmh.2;
        Wed, 02 Oct 2019 07:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=33+LNued2O1kb6c8Fio+3tVQ9P1T0jN1Kwbi3apCkkM=;
        b=DvA2xbyQQOPj7gKLPCyWb0KkqNqUYwjoMSoYfR6rrzrPwFwVbqy69kEnS+dbKNfYP4
         E0sUPgCRafbcIXlERDRF5Nn1OcoyKPFZ7dE4mDrVFk4/xF4320WMl2dxEF3nZc341bg9
         VnmlNxxlSoIzMB9OULODpqCt3TAOcc+CweiDqegII7PUHup8ZWARiEwZhB1CEBlhDJqg
         FsuTSu1mNQCRQAbuds0qjOt425szUgpDTt7XDmNKSF1NT68474ndY30UMQVHOq34iSKz
         p+tgPX7FWfoy69FHD78TvYXKYPxky/caSWUBLRZ+1GMD4ML0k+mz+RBI8e6HoBzmdeHy
         hupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=33+LNued2O1kb6c8Fio+3tVQ9P1T0jN1Kwbi3apCkkM=;
        b=ISvmplMyikT/yRCEQva0cBf6r9sHCdj8ZjU8ll8EtaaLSeEoux+aDaDK+hb6QsNMDl
         sBMGfiOyrg95TEnWSqKN+rtNpKriStHXpC3hQk5p7no3dLiBJudUZAUC41h8bcc3mVhx
         JqZKdR0Gfnb0a2RZjFVn8yNWwD1HtPb+V9j0snRubRc/sUvjKpiAoxiHUIhYndbl99Vd
         kVlSJWW7ji+LC7XacOm4+ux1nHChsDv+VXpGQosIRtoEbjb++HPHUr4/THKiXnR2sULX
         s1A3AJ0gHMKNUQPrnnVf8ctVqZaYNrmfSXgfhd35bYfF4bZ8tbjUlF1j4gK7p3gIebdL
         pApA==
X-Gm-Message-State: APjAAAXNWfEeeVhvdbV0vK5rk0EbCZqKeHqb+pWMscguPZ7iJ438l9wT
        zqTwvv7AbsYRysWVBIgf+EOZZbs0
X-Google-Smtp-Source: APXvYqyZcQFGl0EpoAvXwx3anDUBcjjDjyZkSUj2bQ6Ll6TIHNIPM6eK0g2P22HxE959CNgs2JQA3g==
X-Received: by 2002:a1c:c5c3:: with SMTP id v186mr3136572wmf.125.1570027506875;
        Wed, 02 Oct 2019 07:45:06 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id w18sm7736051wmc.9.2019.10.02.07.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:45:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 2/2] gpio: tegra186: Implement wake event support
Date:   Wed,  2 Oct 2019 16:45:02 +0200
Message-Id: <20191002144502.156393-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002144502.156393-1-thierry.reding@gmail.com>
References: <20191002144502.156393-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The GPIO controller doesn't have any controls to enable the system to
wake up from low power states based on activity on GPIO pins. An extra
hardware block that is part of the power management controller (PMC)
contains these controls. In order for the GPIO controller to be able
to cooperate with the PMC, obtain a reference to the PMC's IRQ domain
and make it a parent to the GPIO controller's IRQ domain. This way the
PMC gets an opportunity to program the additional registers required
to enable wakeup sources on suspend.

Based on additional work by Bitan Biswas <bbiswas@nvidia.com>.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v5:
- rebase on top of new hierarchical IRQ domain support

Changes in v4:
- implement gpio_irq_chip.to_fwspec() instead of gpio_chip.to_irq()
- initialize missing irq_domain_ops.free()

Changes in v3:
- use irq_create_fwspec_mapping() instead of irq_domain_alloc_irqs()
- initialize tegra_gpio_soc.instance field on Tegra186

Changes in v2:
- don't use wakeup-parent property but look up PMC by compatible

 drivers/gpio/Kconfig         |  1 +
 drivers/gpio/gpio-tegra186.c | 97 +++++++++++++++++++++++++++++-------
 2 files changed, 80 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 38e096e6925f..1d1c79795db2 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -531,6 +531,7 @@ config GPIO_TEGRA186
 	depends on ARCH_TEGRA_186_SOC || COMPILE_TEST
 	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
+	select IRQ_DOMAIN_HIERARCHY
 	help
 	  Say yes here to support GPIO pins on NVIDIA Tegra186 SoCs.
 
diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 3ded6ba2f997..bf1968b77a7b 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -53,6 +53,7 @@ struct tegra_gpio_soc {
 	const struct tegra_gpio_port *ports;
 	unsigned int num_ports;
 	const char *name;
+	unsigned int instance;
 };
 
 struct tegra_gpio {
@@ -333,7 +334,7 @@ static int tegra186_irq_set_type(struct irq_data *data, unsigned int type)
 	else
 		irq_set_handler_locked(data, handle_edge_irq);
 
-	return 0;
+	return irq_chip_set_type_parent(data, type);
 }
 
 static void tegra186_gpio_irq(struct irq_desc *desc)
@@ -373,39 +374,80 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static int tegra186_gpio_irq_domain_xlate(struct irq_domain *domain,
-					  struct device_node *np,
-					  const u32 *spec, unsigned int size,
-					  unsigned long *hwirq,
-					  unsigned int *type)
+static int tegra186_gpio_irq_domain_translate(struct irq_domain *domain,
+					      struct irq_fwspec *fwspec,
+					      unsigned long *hwirq,
+					      unsigned int *type)
 {
 	struct tegra_gpio *gpio = gpiochip_get_data(domain->host_data);
 	unsigned int port, pin, i, offset = 0;
 
-	if (size < 2)
+	if (WARN_ON(gpio->gpio.of_gpio_n_cells < 2))
+		return -EINVAL;
+
+	if (WARN_ON(fwspec->param_count < gpio->gpio.of_gpio_n_cells))
 		return -EINVAL;
 
-	port = spec[0] / 8;
-	pin = spec[0] % 8;
+	port = fwspec->param[0] / 8;
+	pin = fwspec->param[0] % 8;
 
-	if (port >= gpio->soc->num_ports) {
-		dev_err(gpio->gpio.parent, "invalid port number: %u\n", port);
+	if (port >= gpio->soc->num_ports)
 		return -EINVAL;
-	}
 
 	for (i = 0; i < port; i++)
 		offset += gpio->soc->ports[i].pins;
 
-	*type = spec[1] & IRQ_TYPE_SENSE_MASK;
+	*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
 	*hwirq = offset + pin;
 
 	return 0;
 }
 
-static const struct irq_domain_ops tegra186_gpio_irq_domain_ops = {
-	.map = gpiochip_irq_map,
-	.unmap = gpiochip_irq_unmap,
-	.xlate = tegra186_gpio_irq_domain_xlate,
+static void tegra186_gpio_populate_parent_fwspec(struct gpio_chip *chip,
+						 struct irq_fwspec *fwspec,
+						 unsigned int parent_hwirq,
+						 unsigned int parent_type)
+{
+	struct tegra_gpio *gpio = gpiochip_get_data(chip);
+
+	fwspec->param_count = 3;
+	fwspec->param[0] = gpio->soc->instance;
+	fwspec->param[1] = parent_hwirq;
+	fwspec->param[2] = parent_type;
+}
+
+static int tegra186_gpio_child_to_parent_hwirq(struct gpio_chip *chip,
+					       unsigned int hwirq,
+					       unsigned int type,
+					       unsigned int *parent_hwirq,
+					       unsigned int *parent_type)
+{
+	*parent_hwirq = chip->irq.child_offset_to_irq(chip, hwirq);
+	*parent_type = type;
+
+	return 0;
+}
+
+static unsigned int tegra186_gpio_child_offset_to_irq(struct gpio_chip *chip,
+						      unsigned int offset)
+{
+	struct tegra_gpio *gpio = gpiochip_get_data(chip);
+	unsigned int i;
+
+	for (i = 0; i < gpio->soc->num_ports; i++) {
+		if (offset < gpio->soc->ports[i].pins)
+			break;
+
+		offset -= gpio->soc->ports[i].pins;
+	}
+
+	return offset + i * 8;
+}
+
+static const struct of_device_id tegra186_pmc_of_match[] = {
+	{ .compatible = "nvidia,tegra186-pmc" },
+	{ .compatible = "nvidia,tegra194-pmc" },
+	{ /* sentinel */ }
 };
 
 static int tegra186_gpio_probe(struct platform_device *pdev)
@@ -413,6 +455,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	unsigned int i, j, offset;
 	struct gpio_irq_chip *irq;
 	struct tegra_gpio *gpio;
+	struct device_node *np;
 	struct resource *res;
 	char **names;
 	int err;
@@ -498,10 +541,15 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	gpio->intc.irq_mask = tegra186_irq_mask;
 	gpio->intc.irq_unmask = tegra186_irq_unmask;
 	gpio->intc.irq_set_type = tegra186_irq_set_type;
+	gpio->intc.irq_set_wake = irq_chip_set_wake_parent;
 
 	irq = &gpio->gpio.irq;
 	irq->chip = &gpio->intc;
-	irq->domain_ops = &tegra186_gpio_irq_domain_ops;
+	irq->fwnode = of_node_to_fwnode(pdev->dev.of_node);
+	irq->child_to_parent_hwirq = tegra186_gpio_child_to_parent_hwirq;
+	irq->populate_parent_fwspec = tegra186_gpio_populate_parent_fwspec;
+	irq->child_offset_to_irq = tegra186_gpio_child_offset_to_irq;
+	irq->child_irq_domain_ops.translate = tegra186_gpio_irq_domain_translate;
 	irq->handler = handle_simple_irq;
 	irq->default_type = IRQ_TYPE_NONE;
 	irq->parent_handler = tegra186_gpio_irq;
@@ -509,6 +557,15 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	irq->num_parents = gpio->num_irq;
 	irq->parents = gpio->irq;
 
+	np = of_find_matching_node(NULL, tegra186_pmc_of_match);
+	if (np) {
+		irq->parent_domain = irq_find_host(np);
+		of_node_put(np);
+
+		if (!irq->parent_domain)
+			return -EPROBE_DEFER;
+	}
+
 	irq->map = devm_kcalloc(&pdev->dev, gpio->gpio.ngpio,
 				sizeof(*irq->map), GFP_KERNEL);
 	if (!irq->map)
@@ -614,6 +671,7 @@ static const struct tegra_gpio_soc tegra186_main_soc = {
 	.num_ports = ARRAY_SIZE(tegra186_main_ports),
 	.ports = tegra186_main_ports,
 	.name = "tegra186-gpio",
+	.instance = 0,
 };
 
 #define TEGRA186_AON_GPIO_PORT(port, base, count, controller)	\
@@ -639,6 +697,7 @@ static const struct tegra_gpio_soc tegra186_aon_soc = {
 	.num_ports = ARRAY_SIZE(tegra186_aon_ports),
 	.ports = tegra186_aon_ports,
 	.name = "tegra186-gpio-aon",
+	.instance = 1,
 };
 
 #define TEGRA194_MAIN_GPIO_PORT(port, base, count, controller)	\
@@ -684,6 +743,7 @@ static const struct tegra_gpio_soc tegra194_main_soc = {
 	.num_ports = ARRAY_SIZE(tegra194_main_ports),
 	.ports = tegra194_main_ports,
 	.name = "tegra194-gpio",
+	.instance = 0,
 };
 
 #define TEGRA194_AON_GPIO_PORT(port, base, count, controller)	\
@@ -706,6 +766,7 @@ static const struct tegra_gpio_soc tegra194_aon_soc = {
 	.num_ports = ARRAY_SIZE(tegra194_aon_ports),
 	.ports = tegra194_aon_ports,
 	.name = "tegra194-gpio-aon",
+	.instance = 1,
 };
 
 static const struct of_device_id tegra186_gpio_of_match[] = {
-- 
2.23.0

