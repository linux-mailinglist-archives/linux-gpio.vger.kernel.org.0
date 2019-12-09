Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4D3D116DAA
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbfLINJg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:36 -0500
Received: from mga18.intel.com ([134.134.136.126]:29135 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727638AbfLINJf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="206887937"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 09 Dec 2019 05:09:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A24A07FA; Mon,  9 Dec 2019 15:09:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 11/24] pinctrl: lynxpoint: Convert unsigned to unsigned int
Date:   Mon,  9 Dec 2019 15:09:13 +0200
Message-Id: <20191209130926.86483-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simple type conversion with no functional change implied.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 4ed2d4daea19..3c8241ed8bc2 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -82,7 +82,7 @@ struct lp_gpio {
  * LP94_CONFIG2 (gpio 94) ...
  */
 
-static void __iomem *lp_gpio_reg(struct gpio_chip *chip, unsigned offset,
+static void __iomem *lp_gpio_reg(struct gpio_chip *chip, unsigned int offset,
 				 int reg)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
@@ -98,7 +98,7 @@ static void __iomem *lp_gpio_reg(struct gpio_chip *chip, unsigned offset,
 	return lg->regs + reg + reg_offset;
 }
 
-static int lp_gpio_request(struct gpio_chip *chip, unsigned offset)
+static int lp_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
 	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
@@ -131,7 +131,7 @@ static int lp_gpio_request(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static void lp_gpio_free(struct gpio_chip *chip, unsigned offset)
+static void lp_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
 	void __iomem *conf2 = lp_gpio_reg(chip, offset, LP_CONFIG2);
@@ -142,7 +142,7 @@ static void lp_gpio_free(struct gpio_chip *chip, unsigned offset)
 	pm_runtime_put(lg->dev);
 }
 
-static int lp_irq_type(struct irq_data *d, unsigned type)
+static int lp_irq_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct lp_gpio *lg = gpiochip_get_data(gc);
@@ -185,13 +185,13 @@ static int lp_irq_type(struct irq_data *d, unsigned type)
 	return 0;
 }
 
-static int lp_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int lp_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	return !!(ioread32(reg) & IN_LVL_BIT);
 }
 
-static void lp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void lp_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
 	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
@@ -207,7 +207,7 @@ static void lp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	raw_spin_unlock_irqrestore(&lg->lock, flags);
 }
 
-static int lp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int lp_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
 	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
@@ -220,8 +220,8 @@ static int lp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int lp_gpio_direction_output(struct gpio_chip *chip,
-				      unsigned offset, int value)
+static int lp_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
+				    int value)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
 	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
@@ -255,7 +255,7 @@ static void lp_gpio_irq_handler(struct irq_desc *desc)
 		pending = ioread32(reg) & ioread32(ena);
 
 		for_each_set_bit(pin, &pending, 32) {
-			unsigned irq;
+			unsigned int irq;
 
 			/* Clear before handling so we don't lose an edge */
 			iowrite32(BIT(pin), reg);
@@ -315,7 +315,7 @@ static int lp_gpio_irq_init_hw(struct gpio_chip *chip)
 {
 	struct lp_gpio *lg = gpiochip_get_data(chip);
 	void __iomem *reg;
-	unsigned base;
+	unsigned int base;
 
 	for (base = 0; base < lg->chip.ngpio; base += 32) {
 		/* disable gpio pin interrupts */
@@ -390,7 +390,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 					     GFP_KERNEL);
 		if (!girq->parents)
 			return -ENOMEM;
-		girq->parents[0] = (unsigned)irq_rc->start;
+		girq->parents[0] = (unsigned int)irq_rc->start;
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_bad_irq;
 	}
-- 
2.24.0

