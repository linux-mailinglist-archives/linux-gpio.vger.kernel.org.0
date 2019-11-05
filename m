Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 457C7F070F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 21:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729735AbfKEUgG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 15:36:06 -0500
Received: from mga18.intel.com ([134.134.136.126]:65484 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729758AbfKEUgF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Nov 2019 15:36:05 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Nov 2019 12:36:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; 
   d="scan'208";a="227244341"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 05 Nov 2019 12:36:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D8ADA33B; Tue,  5 Nov 2019 22:35:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Cohen <david.a.cohen@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v2 5/7] gpio: merrifield: Pass irqchip when adding gpiochip
Date:   Tue,  5 Nov 2019 22:35:55 +0200
Message-Id: <20191105203557.78562-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

For chained irqchips this is a pretty straight-forward conversion.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: David Cohen <david.a.cohen@linux.intel.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-merrifield.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index e96d8e517e26..60d6ad012881 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -362,8 +362,9 @@ static void mrfld_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(irqchip, desc);
 }
 
-static void mrfld_irq_init_hw(struct mrfld_gpio *priv)
+static int mrfld_irq_init_hw(struct gpio_chip *chip)
 {
+	struct mrfld_gpio *priv = gpiochip_get_data(chip);
 	void __iomem *reg;
 	unsigned int base;
 
@@ -375,6 +376,8 @@ static void mrfld_irq_init_hw(struct mrfld_gpio *priv)
 		reg = gpio_reg(&priv->chip, base, GFER);
 		writel(0, reg);
 	}
+
+	return 0;
 }
 
 static const char *mrfld_gpio_get_pinctrl_dev_name(struct mrfld_gpio *priv)
@@ -420,6 +423,7 @@ static int mrfld_gpio_add_pin_ranges(struct gpio_chip *chip)
 
 static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
+	struct gpio_irq_chip *girq;
 	struct mrfld_gpio *priv;
 	u32 gpio_base, irq_base;
 	void __iomem *base;
@@ -467,24 +471,27 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 
 	raw_spin_lock_init(&priv->lock);
 
+	girq = &priv->chip.irq;
+	girq->chip = &mrfld_irqchip;
+	girq->init_hw = mrfld_irq_init_hw;
+	girq->parent_handler = mrfld_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = pdev->irq;
+	girq->first = irq_base;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+
 	retval = devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
 	if (retval) {
 		dev_err(&pdev->dev, "gpiochip_add error %d\n", retval);
 		return retval;
 	}
 
-	retval = gpiochip_irqchip_add(&priv->chip, &mrfld_irqchip, irq_base,
-				      handle_bad_irq, IRQ_TYPE_NONE);
-	if (retval) {
-		dev_err(&pdev->dev, "could not connect irqchip to gpiochip\n");
-		return retval;
-	}
-
-	mrfld_irq_init_hw(priv);
-
-	gpiochip_set_chained_irqchip(&priv->chip, &mrfld_irqchip, pdev->irq,
-				     mrfld_irq_handler);
-
 	pci_set_drvdata(pdev, priv);
 	return 0;
 }
-- 
2.24.0.rc1

