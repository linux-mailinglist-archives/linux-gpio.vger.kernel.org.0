Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4CE5E3457
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 15:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502562AbfJXNep (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 09:34:45 -0400
Received: from mga07.intel.com ([134.134.136.100]:34753 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502516AbfJXNep (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Oct 2019 09:34:45 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Oct 2019 06:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; 
   d="scan'208";a="223559645"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 24 Oct 2019 06:34:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 344731CB; Thu, 24 Oct 2019 16:34:42 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: cherryview: Allocate IRQ chip dynamic
Date:   Thu, 24 Oct 2019 16:34:41 +0300
Message-Id: <20191024133441.76222-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Keeping the IRQ chip definition static shares it with multiple instances
of the GPIO chip in the system. This is bad and now we get this warning
from GPIO library:

"detected irqchip that is shared with multiple gpiochips: please fix the driver."

Hence, move the IRQ chip definition from being driver static into the struct
intel_pinctrl. So a unique IRQ chip is used for each GPIO chip instance.

This patch is heavily based on the attachment to the bug by Christoph Marz.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=202543
Fixes: 6e08d6bbebeb ("pinctrl: Add Intel Cherryview/Braswell pin controller support")
Depends-on: 83b9dc11312f ("pinctrl: cherryview: Associate IRQ descriptors to irqdomain")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 5af6b20f7334..dff2a81250b6 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -147,6 +147,7 @@ struct chv_pin_context {
  * @pctldesc: Pin controller description
  * @pctldev: Pointer to the pin controller device
  * @chip: GPIO chip in this pin controller
+ * @irqchip: IRQ chip in this pin controller
  * @regs: MMIO registers
  * @intr_lines: Stores mapping between 16 HW interrupt wires and GPIO
  *		offset (in GPIO number space)
@@ -162,6 +163,7 @@ struct chv_pinctrl {
 	struct pinctrl_desc pctldesc;
 	struct pinctrl_dev *pctldev;
 	struct gpio_chip chip;
+	struct irq_chip irqchip;
 	void __iomem *regs;
 	unsigned intr_lines[16];
 	const struct chv_community *community;
@@ -1466,16 +1468,6 @@ static int chv_gpio_irq_type(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
-static struct irq_chip chv_gpio_irqchip = {
-	.name = "chv-gpio",
-	.irq_startup = chv_gpio_irq_startup,
-	.irq_ack = chv_gpio_irq_ack,
-	.irq_mask = chv_gpio_irq_mask,
-	.irq_unmask = chv_gpio_irq_unmask,
-	.irq_set_type = chv_gpio_irq_type,
-	.flags = IRQCHIP_SKIP_SET_WAKE,
-};
-
 static void chv_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
@@ -1625,7 +1617,15 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 		}
 	}
 
-	ret = gpiochip_irqchip_add(chip, &chv_gpio_irqchip, 0,
+	pctrl->irqchip.name = "chv-gpio";
+	pctrl->irqchip.irq_startup = chv_gpio_irq_startup;
+	pctrl->irqchip.irq_ack = chv_gpio_irq_ack;
+	pctrl->irqchip.irq_mask = chv_gpio_irq_mask;
+	pctrl->irqchip.irq_unmask = chv_gpio_irq_unmask;
+	pctrl->irqchip.irq_set_type = chv_gpio_irq_type;
+	pctrl->irqchip.flags = IRQCHIP_SKIP_SET_WAKE;
+
+	ret = gpiochip_irqchip_add(chip, &pctrl->irqchip, 0,
 				   handle_bad_irq, IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to add IRQ chip\n");
@@ -1642,7 +1642,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 		}
 	}
 
-	gpiochip_set_chained_irqchip(chip, &chv_gpio_irqchip, irq,
+	gpiochip_set_chained_irqchip(chip, &pctrl->irqchip, irq,
 				     chv_gpio_irq_handler);
 	return 0;
 }
-- 
2.23.0

