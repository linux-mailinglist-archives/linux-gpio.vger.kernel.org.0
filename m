Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3820E33F4B8
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 16:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbhCQPzJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 11:55:09 -0400
Received: from mga17.intel.com ([192.55.52.151]:55905 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231961AbhCQPzE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Mar 2021 11:55:04 -0400
IronPort-SDR: aSo9lqesUJdDRtfJR241JwXhuzSFxxULWr6uV3/Ta4Pgm7d2SFQYsHuCJWQEUPkowBL9ky3z/H
 /6wJC+2kRBLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="169399688"
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; 
   d="scan'208";a="169399688"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2021 08:19:39 -0700
IronPort-SDR: Pbekg6sELx4Dy01OalG5iTq5LAhILCOexCcQvG0S9v4UAhMWHWqwR1j+7oUm3lo3/857WhPfd9
 m0KFUCAG6JAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; 
   d="scan'208";a="591100697"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 17 Mar 2021 08:19:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B017318E; Wed, 17 Mar 2021 17:19:50 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 2/2] gpio: sch: Hook into ACPI GPE handler to catch GPIO edge events
Date:   Wed, 17 Mar 2021 17:19:28 +0200
Message-Id: <20210317151928.41544-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317151928.41544-1-andriy.shevchenko@linux.intel.com>
References: <20210317151928.41544-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Neither the ACPI description on Intel Minnowboard (v1) platform provides
the required information to establish a generic handling nor the hardware
capable of doing it. According to the data sheet the hardware can generate
SCI events. Therefore, we need to hook from the driver into GPE handler of
the ACPI subsystem in order to catch and report GPIO-related events.

Validated on the Inlel Minnowboard (v1) platform.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-sch.c | 82 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index 5e08e26d0b86..f043ae9982bd 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
@@ -29,12 +30,22 @@
 #define CORE_BANK_OFFSET	0x00
 #define RESUME_BANK_OFFSET	0x20
 
+/*
+ * iLB datasheet describes GPE0BLK registers, in particular GPE0E.GPIO bit.
+ * Document Number: 328195-001
+ */
+#define GPE0E_GPIO	14
+
 struct sch_gpio {
 	struct gpio_chip chip;
 	struct irq_chip irqchip;
 	spinlock_t lock;
 	unsigned short iobase;
 	unsigned short resume_base;
+
+	/* GPE handling */
+	u32 gpe;
+	acpi_gpe_handler gpe_handler;
 };
 
 static unsigned int sch_gpio_offset(struct sch_gpio *sch, unsigned int gpio,
@@ -229,10 +240,73 @@ static void sch_irq_unmask(struct irq_data *d)
 	sch_irq_mask_unmask(d, 1);
 }
 
+static u32 sch_gpio_gpe_handler(acpi_handle gpe_device, u32 gpe, void *context)
+{
+	struct sch_gpio *sch = context;
+	struct gpio_chip *gc = &sch->chip;
+	unsigned long core_status, resume_status;
+	unsigned long pending;
+	unsigned long flags;
+	int offset;
+	u32 ret;
+
+	spin_lock_irqsave(&sch->lock, flags);
+
+	core_status = inl(sch->iobase + CORE_BANK_OFFSET + GTS);
+	resume_status = inl(sch->iobase + RESUME_BANK_OFFSET + GTS);
+
+	spin_unlock_irqrestore(&sch->lock, flags);
+
+	pending = (resume_status << sch->resume_base) | core_status;
+	for_each_set_bit(offset, &pending, sch->chip.ngpio)
+		generic_handle_irq(irq_find_mapping(gc->irq.domain, offset));
+
+	/* Set returning value depending on whether we handled an interrupt */
+	ret = pending ? ACPI_INTERRUPT_HANDLED : ACPI_INTERRUPT_NOT_HANDLED;
+
+	/* Acknowledge GPE to ACPICA */
+	ret |= ACPI_REENABLE_GPE;
+
+	return ret;
+}
+
+static void sch_gpio_remove_gpe_handler(void *data)
+{
+	struct sch_gpio *sch = data;
+
+	acpi_disable_gpe(NULL, sch->gpe);
+	acpi_remove_gpe_handler(NULL, sch->gpe, sch->gpe_handler);
+}
+
+static int sch_gpio_install_gpe_handler(struct sch_gpio *sch)
+{
+	struct device *dev = sch->chip.parent;
+	acpi_status status;
+
+	status = acpi_install_gpe_handler(NULL, sch->gpe, ACPI_GPE_EDGE_TRIGGERED,
+					  sch->gpe_handler, sch);
+	if (ACPI_FAILURE(status)) {
+		dev_err(dev, "Failed to install GPE handler for %u: %s\n",
+			sch->gpe, acpi_format_exception(status));
+		return -ENODEV;
+	}
+
+	status = acpi_enable_gpe(NULL, sch->gpe);
+	if (ACPI_FAILURE(status)) {
+		dev_err(dev, "Failed to enable GPE handler for %u: %s\n",
+			sch->gpe, acpi_format_exception(status));
+		acpi_remove_gpe_handler(NULL, sch->gpe, sch->gpe_handler);
+		return -ENODEV;
+	}
+
+	return devm_add_action_or_reset(dev, sch_gpio_remove_gpe_handler, sch);
+}
+
 static int sch_gpio_probe(struct platform_device *pdev)
 {
 	struct sch_gpio *sch;
 	struct resource *res;
+	int ret;
 
 	sch = devm_kzalloc(&pdev->dev, sizeof(*sch), GFP_KERNEL);
 	if (!sch)
@@ -305,6 +379,14 @@ static int sch_gpio_probe(struct platform_device *pdev)
 	sch->chip.irq.default_type = IRQ_TYPE_NONE;
 	sch->chip.irq.handler = handle_bad_irq;
 
+	/* GPE setup is optional */
+	sch->gpe = GPE0E_GPIO;
+	sch->gpe_handler = sch_gpio_gpe_handler;
+
+	ret = sch_gpio_install_gpe_handler(sch);
+	if (ret)
+		dev_warn(&pdev->dev, "Can't setup GPE, no IRQ support\n");
+
 	return devm_gpiochip_add_data(&pdev->dev, &sch->chip, sch);
 }
 
-- 
2.30.2

