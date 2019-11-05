Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 478C4F0709
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 21:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfKEUgD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 15:36:03 -0500
Received: from mga07.intel.com ([134.134.136.100]:56505 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725806AbfKEUgC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Nov 2019 15:36:02 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Nov 2019 12:36:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; 
   d="scan'208";a="402111876"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 05 Nov 2019 12:36:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C525514E; Tue,  5 Nov 2019 22:35:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 4/7] gpio: merrifield: Add GPIO <-> pin mapping ranges via callback
Date:   Tue,  5 Nov 2019 22:35:54 +0200
Message-Id: <20191105203557.78562-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When IRQ chip is instantiated via GPIO library flow, the few functions,
in particular the ACPI event registration mechanism, on some of ACPI based
platforms expect that the pin ranges are initialized to that point.

Add GPIO <-> pin mapping ranges via callback in the GPIO library flow.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-merrifield.c | 43 ++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 3302125e5265..e96d8e517e26 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -393,14 +393,36 @@ static const char *mrfld_gpio_get_pinctrl_dev_name(struct mrfld_gpio *priv)
 	return name;
 }
 
-static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+static int mrfld_gpio_add_pin_ranges(struct gpio_chip *chip)
 {
+	struct mrfld_gpio *priv = gpiochip_get_data(chip);
 	const struct mrfld_gpio_pinrange *range;
 	const char *pinctrl_dev_name;
+	unsigned int i;
+	int retval;
+
+	pinctrl_dev_name = mrfld_gpio_get_pinctrl_dev_name(priv);
+	for (i = 0; i < ARRAY_SIZE(mrfld_gpio_ranges); i++) {
+		range = &mrfld_gpio_ranges[i];
+		retval = gpiochip_add_pin_range(&priv->chip,
+						pinctrl_dev_name,
+						range->gpio_base,
+						range->pin_base,
+						range->npins);
+		if (retval) {
+			dev_err(priv->dev, "failed to add GPIO pin range\n");
+			return retval;
+		}
+	}
+
+	return 0;
+}
+
+static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
 	struct mrfld_gpio *priv;
 	u32 gpio_base, irq_base;
 	void __iomem *base;
-	unsigned int i;
 	int retval;
 
 	retval = pcim_enable_device(pdev);
@@ -441,30 +463,16 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 	priv->chip.base = gpio_base;
 	priv->chip.ngpio = MRFLD_NGPIO;
 	priv->chip.can_sleep = false;
+	priv->chip.add_pin_ranges = mrfld_gpio_add_pin_ranges;
 
 	raw_spin_lock_init(&priv->lock);
 
-	pci_set_drvdata(pdev, priv);
 	retval = devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
 	if (retval) {
 		dev_err(&pdev->dev, "gpiochip_add error %d\n", retval);
 		return retval;
 	}
 
-	pinctrl_dev_name = mrfld_gpio_get_pinctrl_dev_name(priv);
-	for (i = 0; i < ARRAY_SIZE(mrfld_gpio_ranges); i++) {
-		range = &mrfld_gpio_ranges[i];
-		retval = gpiochip_add_pin_range(&priv->chip,
-						pinctrl_dev_name,
-						range->gpio_base,
-						range->pin_base,
-						range->npins);
-		if (retval) {
-			dev_err(&pdev->dev, "failed to add GPIO pin range\n");
-			return retval;
-		}
-	}
-
 	retval = gpiochip_irqchip_add(&priv->chip, &mrfld_irqchip, irq_base,
 				      handle_bad_irq, IRQ_TYPE_NONE);
 	if (retval) {
@@ -477,6 +485,7 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 	gpiochip_set_chained_irqchip(&priv->chip, &mrfld_irqchip, pdev->irq,
 				     mrfld_irq_handler);
 
+	pci_set_drvdata(pdev, priv);
 	return 0;
 }
 
-- 
2.24.0.rc1

