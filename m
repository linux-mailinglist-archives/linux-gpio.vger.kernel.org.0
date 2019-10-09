Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAFDDD1493
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 18:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731192AbfJIQv0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 12:51:26 -0400
Received: from mga18.intel.com ([134.134.136.126]:2744 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731433AbfJIQvZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Oct 2019 12:51:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 09:51:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,276,1566889200"; 
   d="scan'208";a="206915914"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Oct 2019 09:51:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B29EE442; Wed,  9 Oct 2019 19:51:22 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 3/5] gpio: intel-mid: Move hardware initialization to callback
Date:   Wed,  9 Oct 2019 19:50:54 +0300
Message-Id: <20191009165056.76580-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
References: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver wants to initialize related registers before IRQ chip will be added.
That's why move it to a corresponding callback. It also fixes the NULL pointer
dereference.

Fixes: 8069e69a9792 ("gpio: intel-mid: Pass irqchip when adding gpiochip")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-intel-mid.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index 4d835f9089df..86a10c808ef6 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -293,8 +293,9 @@ static void intel_mid_irq_handler(struct irq_desc *desc)
 	chip->irq_eoi(data);
 }
 
-static void intel_mid_irq_init_hw(struct intel_mid_gpio *priv)
+static int intel_mid_irq_init_hw(struct gpio_chip *chip)
 {
+	struct intel_mid_gpio *priv = gpiochip_get_data(chip);
 	void __iomem *reg;
 	unsigned base;
 
@@ -309,6 +310,8 @@ static void intel_mid_irq_init_hw(struct intel_mid_gpio *priv)
 		reg = gpio_reg(&priv->chip, base, GEDR);
 		writel(~0, reg);
 	}
+
+	return 0;
 }
 
 static int __maybe_unused intel_gpio_runtime_idle(struct device *dev)
@@ -372,6 +375,7 @@ static int intel_gpio_probe(struct pci_dev *pdev,
 
 	girq = &priv->chip.irq;
 	girq->chip = &intel_mid_irqchip;
+	girq->init_hw = intel_mid_irq_init_hw;
 	girq->parent_handler = intel_mid_irq_handler;
 	girq->num_parents = 1;
 	girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
@@ -384,9 +388,8 @@ static int intel_gpio_probe(struct pci_dev *pdev,
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_simple_irq;
 
-	intel_mid_irq_init_hw(priv);
-
 	pci_set_drvdata(pdev, priv);
+
 	retval = devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
 	if (retval) {
 		dev_err(&pdev->dev, "gpiochip_add error %d\n", retval);
-- 
2.23.0

