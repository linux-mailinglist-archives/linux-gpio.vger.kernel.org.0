Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 177BF19CAEF
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 22:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732263AbgDBUTD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 16:19:03 -0400
Received: from mga12.intel.com ([192.55.52.136]:58905 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726963AbgDBUTD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 2 Apr 2020 16:19:03 -0400
IronPort-SDR: a8qMIZCy9pOAAQmGgbXjj5XPSQaIm/wnF8x4T/wNCLQ5vTpnC7/8MkY4sGfhPORYUHwBy3VIJL
 RFJne/Debd6g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 13:19:02 -0700
IronPort-SDR: owsMBh6FPat01RFGSza5u3nCzwKyV9ozIR27suIuSfixf0qa59OB73CjTpbSdZDhBdXFm5gKN6
 WXj0C4im3TcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,336,1580803200"; 
   d="scan'208";a="396493619"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 02 Apr 2020 13:19:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 419F9149; Thu,  2 Apr 2020 23:18:59 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] gpio: pch: Use BIT() and GENMASK() where it's appropriate
Date:   Thu,  2 Apr 2020 23:18:58 +0300
Message-Id: <20200402201859.35832-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use BIT() and GENMASK() where it's appropriate.
At the same time drop it where it's not appropriate.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pch.c | 43 +++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 3f3d9a94b709..0b5aea0b1e8a 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (C) 2011 LAPIS Semiconductor Co., Ltd.
  */
+#include <linux/bits.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -11,11 +12,11 @@
 #include <linux/slab.h>
 
 #define PCH_EDGE_FALLING	0
-#define PCH_EDGE_RISING		BIT(0)
-#define PCH_LEVEL_L		BIT(1)
-#define PCH_LEVEL_H		(BIT(0) | BIT(1))
+#define PCH_EDGE_RISING		1
+#define PCH_LEVEL_L		2
+#define PCH_LEVEL_H		3
 #define PCH_EDGE_BOTH		BIT(2)
-#define PCH_IM_MASK		(BIT(0) | BIT(1) | BIT(2))
+#define PCH_IM_MASK		GENMASK(2, 0)
 
 #define PCH_IRQ_BASE		24
 
@@ -103,9 +104,9 @@ static void pch_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 	spin_lock_irqsave(&chip->spinlock, flags);
 	reg_val = ioread32(&chip->reg->po);
 	if (val)
-		reg_val |= (1 << nr);
+		reg_val |= BIT(nr);
 	else
-		reg_val &= ~(1 << nr);
+		reg_val &= ~BIT(nr);
 
 	iowrite32(reg_val, &chip->reg->po);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
@@ -115,7 +116,7 @@ static int pch_gpio_get(struct gpio_chip *gpio, unsigned nr)
 {
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
 
-	return (ioread32(&chip->reg->pi) >> nr) & 1;
+	return !!(ioread32(&chip->reg->pi) & BIT(nr));
 }
 
 static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
@@ -130,13 +131,14 @@ static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 
 	reg_val = ioread32(&chip->reg->po);
 	if (val)
-		reg_val |= (1 << nr);
+		reg_val |= BIT(nr);
 	else
-		reg_val &= ~(1 << nr);
+		reg_val &= ~BIT(nr);
 	iowrite32(reg_val, &chip->reg->po);
 
-	pm = ioread32(&chip->reg->pm) & ((1 << gpio_pins[chip->ioh]) - 1);
-	pm |= (1 << nr);
+	pm = ioread32(&chip->reg->pm);
+	pm &= BIT(gpio_pins[chip->ioh]) - 1;
+	pm |= BIT(nr);
 	iowrite32(pm, &chip->reg->pm);
 
 	spin_unlock_irqrestore(&chip->spinlock, flags);
@@ -151,8 +153,9 @@ static int pch_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->spinlock, flags);
-	pm = ioread32(&chip->reg->pm) & ((1 << gpio_pins[chip->ioh]) - 1);
-	pm &= ~(1 << nr);
+	pm = ioread32(&chip->reg->pm);
+	pm &= BIT(gpio_pins[chip->ioh]) - 1;
+	pm &= ~BIT(nr);
 	iowrite32(pm, &chip->reg->pm);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
 
@@ -277,7 +280,7 @@ static void pch_irq_unmask(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct pch_gpio *chip = gc->private;
 
-	iowrite32(1 << (d->irq - chip->irq_base), &chip->reg->imaskclr);
+	iowrite32(BIT(d->irq - chip->irq_base), &chip->reg->imaskclr);
 }
 
 static void pch_irq_mask(struct irq_data *d)
@@ -285,7 +288,7 @@ static void pch_irq_mask(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct pch_gpio *chip = gc->private;
 
-	iowrite32(1 << (d->irq - chip->irq_base), &chip->reg->imask);
+	iowrite32(BIT(d->irq - chip->irq_base), &chip->reg->imask);
 }
 
 static void pch_irq_ack(struct irq_data *d)
@@ -293,7 +296,7 @@ static void pch_irq_ack(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct pch_gpio *chip = gc->private;
 
-	iowrite32(1 << (d->irq - chip->irq_base), &chip->reg->iclr);
+	iowrite32(BIT(d->irq - chip->irq_base), &chip->reg->iclr);
 }
 
 static irqreturn_t pch_gpio_handler(int irq, void *dev_id)
@@ -344,7 +347,6 @@ static int pch_gpio_probe(struct pci_dev *pdev,
 	s32 ret;
 	struct pch_gpio *chip;
 	int irq_base;
-	u32 msk;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
 	if (chip == NULL)
@@ -357,7 +359,7 @@ static int pch_gpio_probe(struct pci_dev *pdev,
 		return ret;
 	}
 
-	ret = pcim_iomap_regions(pdev, 1 << 1, KBUILD_MODNAME);
+	ret = pcim_iomap_regions(pdev, BIT(1), KBUILD_MODNAME);
 	if (ret) {
 		dev_err(&pdev->dev, "pci_request_regions FAILED-%d", ret);
 		return ret;
@@ -393,9 +395,8 @@ static int pch_gpio_probe(struct pci_dev *pdev,
 	chip->irq_base = irq_base;
 
 	/* Mask all interrupts, but enable them */
-	msk = (1 << gpio_pins[chip->ioh]) - 1;
-	iowrite32(msk, &chip->reg->imask);
-	iowrite32(msk, &chip->reg->ien);
+	iowrite32(BIT(gpio_pins[chip->ioh]) - 1, &chip->reg->imask);
+	iowrite32(BIT(gpio_pins[chip->ioh]) - 1, &chip->reg->ien);
 
 	ret = devm_request_irq(&pdev->dev, pdev->irq, pch_gpio_handler,
 			       IRQF_SHARED, KBUILD_MODNAME, chip);
-- 
2.25.1

