Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC45DE35A0
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 16:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391794AbfJXOdr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 10:33:47 -0400
Received: from mga06.intel.com ([134.134.136.31]:60767 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732293AbfJXOdq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Oct 2019 10:33:46 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Oct 2019 07:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; 
   d="scan'208";a="192204707"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 24 Oct 2019 07:33:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 22CF1125; Thu, 24 Oct 2019 17:33:44 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] pinctrl: baytrail: Allocate IRQ chip dynamic
Date:   Thu, 24 Oct 2019 17:33:42 +0300
Message-Id: <20191024143343.17638-1-andriy.shevchenko@linux.intel.com>
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

Fixes: 9f573b98ca50 ("pinctrl: baytrail: Update irq chip operations")
Depends-on: aee0f04d5f3b ("pinctrl: intel: baytrail: Pass irqchip when adding gpiochip")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 450cb5bf6a9f..9d0e32dbf970 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -107,6 +107,7 @@ struct byt_gpio_pin_context {
 
 struct byt_gpio {
 	struct gpio_chip chip;
+	struct irq_chip irqchip;
 	struct platform_device *pdev;
 	struct pinctrl_dev *pctl_dev;
 	struct pinctrl_desc pctl_desc;
@@ -1394,15 +1395,6 @@ static int byt_irq_type(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
-static struct irq_chip byt_irqchip = {
-	.name		= "BYT-GPIO",
-	.irq_ack	= byt_irq_ack,
-	.irq_mask	= byt_irq_mask,
-	.irq_unmask	= byt_irq_unmask,
-	.irq_set_type	= byt_irq_type,
-	.flags		= IRQCHIP_SKIP_SET_WAKE,
-};
-
 static void byt_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct irq_data *data = irq_desc_get_irq_data(desc);
@@ -1535,8 +1527,15 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	if (irq_rc && irq_rc->start) {
 		struct gpio_irq_chip *girq;
 
+		vg->irqchip.name = "BYT-GPIO",
+		vg->irqchip.irq_ack = byt_irq_ack,
+		vg->irqchip.irq_mask = byt_irq_mask,
+		vg->irqchip.irq_unmask = byt_irq_unmask,
+		vg->irqchip.irq_set_type = byt_irq_type,
+		vg->irqchip.flags = IRQCHIP_SKIP_SET_WAKE,
+
 		girq = &gc->irq;
-		girq->chip = &byt_irqchip;
+		girq->chip = &vg->irqchip;
 		girq->init_hw = byt_gpio_irq_init_hw;
 		girq->parent_handler = byt_gpio_irq_handler;
 		girq->num_parents = 1;
-- 
2.23.0

