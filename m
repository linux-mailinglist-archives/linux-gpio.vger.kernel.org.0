Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0F8116DA3
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727640AbfLINJe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:34 -0500
Received: from mga09.intel.com ([134.134.136.24]:48019 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727595AbfLINJe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="210103581"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2019 05:09:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E112E992; Mon,  9 Dec 2019 15:09:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 16/24] pinctrl: lynxpoint: Implement ->irq_ack() callback
Date:   Mon,  9 Dec 2019 15:09:18 +0200
Message-Id: <20191209130926.86483-17-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of playing tricks with registers in the interrupt handler,
utilize the IRQ chip core for ACKing interrupts properly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index ddb201e5d78f..3b0dfe9a51ba 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -218,9 +218,6 @@ static void lp_gpio_irq_handler(struct irq_desc *desc)
 		for_each_set_bit(pin, &pending, 32) {
 			unsigned int irq;
 
-			/* Clear before handling so we don't lose an edge */
-			iowrite32(BIT(pin), reg);
-
 			irq = irq_find_mapping(lg->chip.irq.domain, base + pin);
 			generic_handle_irq(irq);
 		}
@@ -228,6 +225,19 @@ static void lp_gpio_irq_handler(struct irq_desc *desc)
 	chip->irq_eoi(data);
 }
 
+static void lp_irq_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct lp_gpio *lg = gpiochip_get_data(gc);
+	u32 hwirq = irqd_to_hwirq(d);
+	void __iomem *reg = lp_gpio_reg(&lg->chip, hwirq, LP_INT_STAT);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&lg->lock, flags);
+	iowrite32(BIT(hwirq % 32), reg);
+	raw_spin_unlock_irqrestore(&lg->lock, flags);
+}
+
 static void lp_irq_unmask(struct irq_data *d)
 {
 }
@@ -313,6 +323,7 @@ static int lp_irq_set_type(struct irq_data *d, unsigned int type)
 
 static struct irq_chip lp_irqchip = {
 	.name = "LP-GPIO",
+	.irq_ack = lp_irq_ack,
 	.irq_mask = lp_irq_mask,
 	.irq_unmask = lp_irq_unmask,
 	.irq_enable = lp_irq_enable,
-- 
2.24.0

