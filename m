Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55BA33F4B6
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 16:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbhCQPzI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 11:55:08 -0400
Received: from mga14.intel.com ([192.55.52.115]:25236 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231858AbhCQPy7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Mar 2021 11:54:59 -0400
IronPort-SDR: qaZMb+8GkcWpLT4CQ8Mno0fwYaY5J5K9V1Eoxx9Xoj86OGXbAiC1ZH9GxJhOQcdZE+Qlastow4
 qU8wJvnE2NVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="188847344"
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; 
   d="scan'208";a="188847344"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2021 08:19:37 -0700
IronPort-SDR: Zp1U49YSGrxiC4E0Flx3LytoS+JOEtLOWAv7BjIJf6ra09+f3O+ds2ungi3fDzXcIW66BSZ90H
 BMYo+jXfbN6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; 
   d="scan'208";a="388876391"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 17 Mar 2021 08:19:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B5008147; Wed, 17 Mar 2021 17:19:47 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH v5 1/2] gpio: sch: Add edge event support
Date:   Wed, 17 Mar 2021 17:19:27 +0200
Message-Id: <20210317151928.41544-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317151928.41544-1-andriy.shevchenko@linux.intel.com>
References: <20210317151928.41544-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jan Kiszka <jan.kiszka@siemens.com>

Add the required infrastructure to enable and report edge events
of the pins to the GPIO core. The actual hook-up of the event interrupt
will happen separately.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-sch.c | 114 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 106 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index 3a1b1adb08c6..5e08e26d0b86 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -10,17 +10,28 @@
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
+#include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci_ids.h>
 #include <linux/platform_device.h>
+#include <linux/types.h>
 
 #define GEN	0x00
 #define GIO	0x04
 #define GLV	0x08
+#define GTPE	0x0c
+#define GTNE	0x10
+#define GGPE	0x14
+#define GSMI	0x18
+#define GTS	0x1c
+
+#define CORE_BANK_OFFSET	0x00
+#define RESUME_BANK_OFFSET	0x20
 
 struct sch_gpio {
 	struct gpio_chip chip;
+	struct irq_chip irqchip;
 	spinlock_t lock;
 	unsigned short iobase;
 	unsigned short resume_base;
@@ -29,11 +40,11 @@ struct sch_gpio {
 static unsigned int sch_gpio_offset(struct sch_gpio *sch, unsigned int gpio,
 				unsigned int reg)
 {
-	unsigned int base = 0;
+	unsigned int base = CORE_BANK_OFFSET;
 
 	if (gpio >= sch->resume_base) {
 		gpio -= sch->resume_base;
-		base += 0x20;
+		base = RESUME_BANK_OFFSET;
 	}
 
 	return base + reg + gpio / 8;
@@ -79,10 +90,11 @@ static void sch_gpio_reg_set(struct sch_gpio *sch, unsigned int gpio, unsigned i
 static int sch_gpio_direction_in(struct gpio_chip *gc, unsigned int gpio_num)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
+	unsigned long flags;
 
-	spin_lock(&sch->lock);
+	spin_lock_irqsave(&sch->lock, flags);
 	sch_gpio_reg_set(sch, gpio_num, GIO, 1);
-	spin_unlock(&sch->lock);
+	spin_unlock_irqrestore(&sch->lock, flags);
 	return 0;
 }
 
@@ -96,20 +108,22 @@ static int sch_gpio_get(struct gpio_chip *gc, unsigned int gpio_num)
 static void sch_gpio_set(struct gpio_chip *gc, unsigned int gpio_num, int val)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
+	unsigned long flags;
 
-	spin_lock(&sch->lock);
+	spin_lock_irqsave(&sch->lock, flags);
 	sch_gpio_reg_set(sch, gpio_num, GLV, val);
-	spin_unlock(&sch->lock);
+	spin_unlock_irqrestore(&sch->lock, flags);
 }
 
 static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned int gpio_num,
 				  int val)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
+	unsigned long flags;
 
-	spin_lock(&sch->lock);
+	spin_lock_irqsave(&sch->lock, flags);
 	sch_gpio_reg_set(sch, gpio_num, GIO, 0);
-	spin_unlock(&sch->lock);
+	spin_unlock_irqrestore(&sch->lock, flags);
 
 	/*
 	 * according to the datasheet, writing to the level register has no
@@ -144,6 +158,77 @@ static const struct gpio_chip sch_gpio_chip = {
 	.get_direction		= sch_gpio_get_direction,
 };
 
+static int sch_irq_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sch_gpio *sch = gpiochip_get_data(gc);
+	irq_hw_number_t gpio_num = irqd_to_hwirq(d);
+	unsigned long flags;
+	int rising, falling;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_RISING:
+		rising = 1;
+		falling = 0;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		rising = 0;
+		falling = 1;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		rising = 1;
+		falling = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&sch->lock, flags);
+
+	sch_gpio_reg_set(sch, gpio_num, GTPE, rising);
+	sch_gpio_reg_set(sch, gpio_num, GTNE, falling);
+
+	irq_set_handler_locked(d, handle_edge_irq);
+
+	spin_unlock_irqrestore(&sch->lock, flags);
+
+	return 0;
+}
+
+static void sch_irq_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sch_gpio *sch = gpiochip_get_data(gc);
+	irq_hw_number_t gpio_num = irqd_to_hwirq(d);
+	unsigned long flags;
+
+	spin_lock_irqsave(&sch->lock, flags);
+	sch_gpio_reg_set(sch, gpio_num, GTS, 1);
+	spin_unlock_irqrestore(&sch->lock, flags);
+}
+
+static void sch_irq_mask_unmask(struct irq_data *d, int val)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sch_gpio *sch = gpiochip_get_data(gc);
+	irq_hw_number_t gpio_num = irqd_to_hwirq(d);
+	unsigned long flags;
+
+	spin_lock_irqsave(&sch->lock, flags);
+	sch_gpio_reg_set(sch, gpio_num, GGPE, val);
+	spin_unlock_irqrestore(&sch->lock, flags);
+}
+
+static void sch_irq_mask(struct irq_data *d)
+{
+	sch_irq_mask_unmask(d, 0);
+}
+
+static void sch_irq_unmask(struct irq_data *d)
+{
+	sch_irq_mask_unmask(d, 1);
+}
+
 static int sch_gpio_probe(struct platform_device *pdev)
 {
 	struct sch_gpio *sch;
@@ -207,6 +292,19 @@ static int sch_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sch);
 
+	sch->irqchip.name = "sch_gpio";
+	sch->irqchip.irq_ack = sch_irq_ack;
+	sch->irqchip.irq_mask = sch_irq_mask;
+	sch->irqchip.irq_unmask = sch_irq_unmask;
+	sch->irqchip.irq_set_type = sch_irq_type;
+
+	sch->chip.irq.chip = &sch->irqchip;
+	sch->chip.irq.num_parents = 0;
+	sch->chip.irq.parents = NULL;
+	sch->chip.irq.parent_handler = NULL;
+	sch->chip.irq.default_type = IRQ_TYPE_NONE;
+	sch->chip.irq.handler = handle_bad_irq;
+
 	return devm_gpiochip_add_data(&pdev->dev, &sch->chip, sch);
 }
 
-- 
2.30.2

