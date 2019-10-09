Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C18EED1495
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 18:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731433AbfJIQv1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 12:51:27 -0400
Received: from mga05.intel.com ([192.55.52.43]:51324 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731432AbfJIQv1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Oct 2019 12:51:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 09:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,276,1566889200"; 
   d="scan'208";a="184120022"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 09 Oct 2019 09:51:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C12FE570; Wed,  9 Oct 2019 19:51:22 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 5/5] gpio: merrifield: Move hardware initialization to callback
Date:   Wed,  9 Oct 2019 19:50:56 +0300
Message-Id: <20191009165056.76580-6-andriy.shevchenko@linux.intel.com>
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

Fixes: 8f86a5b4ad67 ("gpio: merrifield: Pass irqchip when adding gpiochip")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-merrifield.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 9596024c9161..2f1e9da81c1e 100644
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
@@ -447,6 +450,7 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 
 	girq = &priv->chip.irq;
 	girq->chip = &mrfld_irqchip;
+	girq->init_hw = mrfld_irq_init_hw;
 	girq->parent_handler = mrfld_irq_handler;
 	girq->num_parents = 1;
 	girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
@@ -459,8 +463,6 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
 
-	mrfld_irq_init_hw(priv);
-
 	pci_set_drvdata(pdev, priv);
 	retval = devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
 	if (retval) {
-- 
2.23.0

