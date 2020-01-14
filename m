Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7A713A317
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 09:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbgANIkO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 03:40:14 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:40243 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgANIkO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jan 2020 03:40:14 -0500
Received: by mail-pj1-f65.google.com with SMTP id bg7so5538813pjb.5
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2020 00:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d88RijQwAj4cV7alegR9skygE3HHGfexf/vhPhy3XvA=;
        b=oo06eeV7Y3kT0c0QKn1DoVFrD+y5tWdVf3G9Jh43CFR0LGkfmi+fKOqiQfK44137UG
         mqxUVHt4LJTbhmLLo7rfwnl/BQYfN8Y7wd4huShXZleGj59FHcIXn3KKUE7XQZqX5nRz
         09bHKWmS/fX2Sd7uN3rrH+UNf49WX5jVSj5pC/F8XQv10Erode21JnDmeHEfo2Gpd09A
         /Ausz0DnbtKo3GTh48BnoSeB2uHNC5x+Cgh51irBolNIUNrplbIZyOb8dKy8UiPL+LvO
         2Qgf5UfLfAFMLOJ4NX/lShc37+jl8YI+6u6jG+n5YmrUIkiFxyzX0bOYxu21x51r9teW
         /lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d88RijQwAj4cV7alegR9skygE3HHGfexf/vhPhy3XvA=;
        b=ugrInYo9EeO1345wsooZPgO4pRwXU8k8RStbQxqpyEBHdGb6dn0XwKoIyWxwCmymV4
         d+FvHgV2LsURjwCpPxwtVu3efrj+kN5nv8W16fSCOkNhC9nJiXNOR269pKn+WS7ReHkW
         4zUJGqFp5oM5hSkhshNsMWx3vdZ9XJ/0UoxInPpPVXtgA37Qtfm6jP3OtJzxlqclsnwS
         B0a8dLXIkDHc1+bqpbsjeusvPhPUvkhd9LlvCbhq2il0vwa17wt+B4t3cTg+Ui8F2LMM
         xsim2eNSo3EHPAfDyPQ8S2FGPCrUkyt7QmfmaEDrMU0norYwe1Dfw2EHMFSEYj+QTVt8
         Ei8A==
X-Gm-Message-State: APjAAAXHmtE68WjNVkwDLdNESSYlNJ08x32S8SZK7oWBQ1+fRsKBqrgj
        DbaLb4VWsDoChztHdAQG0f50HmJqLmI=
X-Google-Smtp-Source: APXvYqw7KMvmtm8HoeXSTl0dwE0rcxf37G1C41rq3dQ4aCTLup0Ap2e/DCttMB6g7QjETC5qTrw4vQ==
X-Received: by 2002:a17:902:7c95:: with SMTP id y21mr24809942pll.150.1578991213239;
        Tue, 14 Jan 2020 00:40:13 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-123.windriver.com. [147.11.105.123])
        by smtp.gmail.com with ESMTPSA id o16sm16284910pgl.58.2020.01.14.00.40.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 00:40:12 -0800 (PST)
From:   Kevin Hao <haokexin@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hao <haokexin@gmail.com>
Subject: [PATCH 2/4] gpiolib: Add support for the irqdomain which doesn't use irq_fwspec as arg
Date:   Tue, 14 Jan 2020 16:28:19 +0800
Message-Id: <20200114082821.14015-3-haokexin@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20200114082821.14015-1-haokexin@gmail.com>
References: <20200114082821.14015-1-haokexin@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some gpio's parent irqdomain may not use the struct irq_fwspec as
argument, such as msi irqdomain. So rename the callback
populate_parent_fwspec() to populate_parent_alloc_arg() and make it
allocate and populate the specific struct which is needed by the
parent irqdomain.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/gpio/gpio-tegra186.c             | 13 ++++++---
 drivers/gpio/gpiolib.c                   | 45 ++++++++++++++++++++------------
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c |  2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c |  2 +-
 include/linux/gpio/driver.h              | 21 ++++++---------
 5 files changed, 49 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 55b43b7ce88d..de241263d4be 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -448,17 +448,24 @@ static int tegra186_gpio_irq_domain_translate(struct irq_domain *domain,
 	return 0;
 }
 
-static void tegra186_gpio_populate_parent_fwspec(struct gpio_chip *chip,
-						 struct irq_fwspec *fwspec,
+static void *tegra186_gpio_populate_parent_fwspec(struct gpio_chip *chip,
 						 unsigned int parent_hwirq,
 						 unsigned int parent_type)
 {
 	struct tegra_gpio *gpio = gpiochip_get_data(chip);
+	struct irq_fwspec *fwspec;
 
+	fwspec = kmalloc(sizeof(*fwspec), GFP_KERNEL);
+	if (!fwspec)
+		return NULL;
+
+	fwspec->fwnode = chip->irq.parent_domain->fwnode;
 	fwspec->param_count = 3;
 	fwspec->param[0] = gpio->soc->instance;
 	fwspec->param[1] = parent_hwirq;
 	fwspec->param[2] = parent_type;
+
+	return fwspec;
 }
 
 static int tegra186_gpio_child_to_parent_hwirq(struct gpio_chip *chip,
@@ -621,7 +628,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	irq->chip = &gpio->intc;
 	irq->fwnode = of_node_to_fwnode(pdev->dev.of_node);
 	irq->child_to_parent_hwirq = tegra186_gpio_child_to_parent_hwirq;
-	irq->populate_parent_fwspec = tegra186_gpio_populate_parent_fwspec;
+	irq->populate_parent_alloc_arg = tegra186_gpio_populate_parent_fwspec;
 	irq->child_offset_to_irq = tegra186_gpio_child_offset_to_irq;
 	irq->child_irq_domain_ops.translate = tegra186_gpio_irq_domain_translate;
 	irq->handler = handle_simple_irq;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 967371377a9d..bedf611a7c9e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1990,7 +1990,7 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	irq_hw_number_t hwirq;
 	unsigned int type = IRQ_TYPE_NONE;
 	struct irq_fwspec *fwspec = data;
-	struct irq_fwspec parent_fwspec;
+	void *parent_arg;
 	unsigned int parent_hwirq;
 	unsigned int parent_type;
 	struct gpio_irq_chip *girq = &gc->irq;
@@ -2029,23 +2029,20 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 			    NULL, NULL);
 	irq_set_probe(irq);
 
-	/*
-	 * Create a IRQ fwspec to send up to the parent irqdomain:
-	 * specify the hwirq we address on the parent and tie it
-	 * all together up the chain.
-	 */
-	parent_fwspec.fwnode = d->parent->fwnode;
 	/* This parent only handles asserted level IRQs */
-	girq->populate_parent_fwspec(gc, &parent_fwspec, parent_hwirq,
-				     parent_type);
+	parent_arg = girq->populate_parent_alloc_arg(gc, parent_hwirq, parent_type);
+	if (!parent_arg)
+		return -ENOMEM;
+
 	chip_info(gc, "alloc_irqs_parent for %d parent hwirq %d\n",
 		  irq, parent_hwirq);
-	ret = irq_domain_alloc_irqs_parent(d, irq, 1, &parent_fwspec);
+	ret = irq_domain_alloc_irqs_parent(d, irq, 1, parent_arg);
 	if (ret)
 		chip_err(gc,
 			 "failed to allocate parent hwirq %d for hwirq %lu\n",
 			 parent_hwirq, hwirq);
 
+	kfree(parent_arg);
 	return ret;
 }
 
@@ -2082,8 +2079,8 @@ static int gpiochip_hierarchy_add_domain(struct gpio_chip *gc)
 	if (!gc->irq.child_offset_to_irq)
 		gc->irq.child_offset_to_irq = gpiochip_child_offset_to_irq_noop;
 
-	if (!gc->irq.populate_parent_fwspec)
-		gc->irq.populate_parent_fwspec =
+	if (!gc->irq.populate_parent_alloc_arg)
+		gc->irq.populate_parent_alloc_arg =
 			gpiochip_populate_parent_fwspec_twocell;
 
 	gpiochip_hierarchy_setup_domain_ops(&gc->irq.child_irq_domain_ops);
@@ -2109,27 +2106,43 @@ static bool gpiochip_hierarchy_is_hierarchical(struct gpio_chip *gc)
 	return !!gc->irq.parent_domain;
 }
 
-void gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
-					     struct irq_fwspec *fwspec,
+void *gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
 					     unsigned int parent_hwirq,
 					     unsigned int parent_type)
 {
+	struct irq_fwspec *fwspec;
+
+	fwspec = kmalloc(sizeof(*fwspec), GFP_KERNEL);
+	if (!fwspec)
+		return NULL;
+
+	fwspec->fwnode = chip->irq.parent_domain->fwnode;
 	fwspec->param_count = 2;
 	fwspec->param[0] = parent_hwirq;
 	fwspec->param[1] = parent_type;
+
+	return fwspec;
 }
 EXPORT_SYMBOL_GPL(gpiochip_populate_parent_fwspec_twocell);
 
-void gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
-					      struct irq_fwspec *fwspec,
+void *gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
 					      unsigned int parent_hwirq,
 					      unsigned int parent_type)
 {
+	struct irq_fwspec *fwspec;
+
+	fwspec = kmalloc(sizeof(*fwspec), GFP_KERNEL);
+	if (!fwspec)
+		return NULL;
+
+	fwspec->fwnode = chip->irq.parent_domain->fwnode;
 	fwspec->param_count = 4;
 	fwspec->param[0] = 0;
 	fwspec->param[1] = parent_hwirq;
 	fwspec->param[2] = 0;
 	fwspec->param[3] = parent_type;
+
+	return fwspec;
 }
 EXPORT_SYMBOL_GPL(gpiochip_populate_parent_fwspec_fourcell);
 
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 653d1095bfea..fe0be8a6ebb7 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1060,7 +1060,7 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 	girq->fwnode = of_node_to_fwnode(state->dev->of_node);
 	girq->parent_domain = parent_domain;
 	girq->child_to_parent_hwirq = pmic_gpio_child_to_parent_hwirq;
-	girq->populate_parent_fwspec = gpiochip_populate_parent_fwspec_fourcell;
+	girq->populate_parent_alloc_arg = gpiochip_populate_parent_fwspec_fourcell;
 	girq->child_offset_to_irq = pmic_gpio_child_offset_to_irq;
 	girq->child_irq_domain_ops.translate = pmic_gpio_domain_translate;
 
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index c7912135bbfb..fba1d41d20ec 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -794,7 +794,7 @@ static int pm8xxx_gpio_probe(struct platform_device *pdev)
 	girq->fwnode = of_node_to_fwnode(pctrl->dev->of_node);
 	girq->parent_domain = parent_domain;
 	girq->child_to_parent_hwirq = pm8xxx_child_to_parent_hwirq;
-	girq->populate_parent_fwspec = gpiochip_populate_parent_fwspec_fourcell;
+	girq->populate_parent_alloc_arg = gpiochip_populate_parent_fwspec_fourcell;
 	girq->child_offset_to_irq = pm8xxx_child_offset_to_irq;
 	girq->child_irq_domain_ops.translate = pm8xxx_domain_translate;
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4f032de10bae..ea6e615ad7fc 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -94,16 +94,15 @@ struct gpio_irq_chip {
 				     unsigned int *parent_type);
 
 	/**
-	 * @populate_parent_fwspec:
+	 * @populate_parent_alloc_arg :
 	 *
-	 * This optional callback populates the &struct irq_fwspec for the
-	 * parent's IRQ domain. If this is not specified, then
+	 * This optional callback allocates and populates the specific struct
+	 * for the parent's IRQ domain. If this is not specified, then
 	 * &gpiochip_populate_parent_fwspec_twocell will be used. A four-cell
 	 * variant named &gpiochip_populate_parent_fwspec_fourcell is also
 	 * available.
 	 */
-	void (*populate_parent_fwspec)(struct gpio_chip *chip,
-				       struct irq_fwspec *fwspec,
+	void *(*populate_parent_alloc_arg)(struct gpio_chip *chip,
 				       unsigned int parent_hwirq,
 				       unsigned int parent_type);
 
@@ -537,26 +536,22 @@ struct bgpio_pdata {
 
 #ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
 
-void gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
-					     struct irq_fwspec *fwspec,
+void *gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
 					     unsigned int parent_hwirq,
 					     unsigned int parent_type);
-void gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
-					      struct irq_fwspec *fwspec,
+void *gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
 					      unsigned int parent_hwirq,
 					      unsigned int parent_type);
 
 #else
 
-static inline void gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
-						    struct irq_fwspec *fwspec,
+static inline void *gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
 						    unsigned int parent_hwirq,
 						    unsigned int parent_type)
 {
 }
 
-static inline void gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
-						     struct irq_fwspec *fwspec,
+static inline void *gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
 						     unsigned int parent_hwirq,
 						     unsigned int parent_type)
 {
-- 
2.14.4

