Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96B97B3CD8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2019 16:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbfIPOr4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Sep 2019 10:47:56 -0400
Received: from mga18.intel.com ([134.134.136.126]:41236 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727329AbfIPOr4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Sep 2019 10:47:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Sep 2019 07:47:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,513,1559545200"; 
   d="scan'208";a="211178526"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 16 Sep 2019 07:47:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0E8091A2; Mon, 16 Sep 2019 17:47:52 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Federico Ricchiuto <fed.ricchiuto@gmail.com>
Subject: [PATCH v1] pinctrl: intel: Allocate IRQ chip dynamic
Date:   Mon, 16 Sep 2019 17:47:51 +0300
Message-Id: <20190916144751.21525-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Keeping the IRQ chip definition static shares it with multiple instances of
the GPIO chip in the system. This is bad and now we get this warning from
GPIO library:

"detected irqchip that is shared with multiple gpiochips: please fix the driver."

Hence, move the IRQ chip definition from being driver static into the struct
intel_pinctrl. So a unique IRQ chip is used for each GPIO chip instance.

Fixes: ee1a6ca43dba ("Add Intel Broxton pin controller support")
Depends-on: 5ff56b015e85 ("Disable GPIO pin interrupts in suspend")
Reported-by: Federico Ricchiuto <fed.ricchiuto@gmail.com>
Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 1f13bcd0e4e1..bc013599a9a3 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -96,6 +96,7 @@ struct intel_pinctrl_context {
  * @pctldesc: Pin controller description
  * @pctldev: Pointer to the pin controller device
  * @chip: GPIO chip in this pin controller
+ * @irqchip: IRQ chip in this pin controller
  * @soc: SoC/PCH specific pin configuration data
  * @communities: All communities in this pin controller
  * @ncommunities: Number of communities in this pin controller
@@ -108,6 +109,7 @@ struct intel_pinctrl {
 	struct pinctrl_desc pctldesc;
 	struct pinctrl_dev *pctldev;
 	struct gpio_chip chip;
+	struct irq_chip irqchip;
 	const struct intel_pinctrl_soc_data *soc;
 	struct intel_community *communities;
 	size_t ncommunities;
@@ -1139,16 +1141,6 @@ static irqreturn_t intel_gpio_irq(int irq, void *data)
 	return ret;
 }
 
-static struct irq_chip intel_gpio_irqchip = {
-	.name = "intel-gpio",
-	.irq_ack = intel_gpio_irq_ack,
-	.irq_mask = intel_gpio_irq_mask,
-	.irq_unmask = intel_gpio_irq_unmask,
-	.irq_set_type = intel_gpio_irq_type,
-	.irq_set_wake = intel_gpio_irq_wake,
-	.flags = IRQCHIP_MASK_ON_SUSPEND,
-};
-
 static int intel_gpio_add_pin_ranges(struct intel_pinctrl *pctrl,
 				     const struct intel_community *community)
 {
@@ -1198,12 +1190,22 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 
 	pctrl->chip = intel_gpio_chip;
 
+	/* Setup GPIO chip */
 	pctrl->chip.ngpio = intel_gpio_ngpio(pctrl);
 	pctrl->chip.label = dev_name(pctrl->dev);
 	pctrl->chip.parent = pctrl->dev;
 	pctrl->chip.base = -1;
 	pctrl->irq = irq;
 
+	/* Setup IRQ chip */
+	pctrl->irqchip.name = dev_name(pctrl->dev);
+	pctrl->irqchip.irq_ack = intel_gpio_irq_ack;
+	pctrl->irqchip.irq_mask = intel_gpio_irq_mask;
+	pctrl->irqchip.irq_unmask = intel_gpio_irq_unmask;
+	pctrl->irqchip.irq_set_type = intel_gpio_irq_type;
+	pctrl->irqchip.irq_set_wake = intel_gpio_irq_wake;
+	pctrl->irqchip.flags = IRQCHIP_MASK_ON_SUSPEND;
+
 	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to register gpiochip\n");
@@ -1233,15 +1235,14 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 		return ret;
 	}
 
-	ret = gpiochip_irqchip_add(&pctrl->chip, &intel_gpio_irqchip, 0,
+	ret = gpiochip_irqchip_add(&pctrl->chip, &pctrl->irqchip, 0,
 				   handle_bad_irq, IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to add irqchip\n");
 		return ret;
 	}
 
-	gpiochip_set_chained_irqchip(&pctrl->chip, &intel_gpio_irqchip, irq,
-				     NULL);
+	gpiochip_set_chained_irqchip(&pctrl->chip, &pctrl->irqchip, irq, NULL);
 	return 0;
 }
 
-- 
2.23.0

