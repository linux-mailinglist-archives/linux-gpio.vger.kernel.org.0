Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3702C33D95D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 17:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbhCPQ0q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 12:26:46 -0400
Received: from mga07.intel.com ([134.134.136.100]:18811 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238713AbhCPQ0X (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Mar 2021 12:26:23 -0400
IronPort-SDR: FLBT7HQeJNcKTxorb+T9jVmDbRwuCQoy6NBUpSVQV/a7M42eerKbkOfvcrWP3EmTR/KdEmxn5a
 oUygo8Dx6rLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="253306442"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="253306442"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 09:26:17 -0700
IronPort-SDR: EN3y72Au1SWwcoIoLLDo1BxoAMB7/WTpoaM4xIpcIe0pE5TUAyk6FcmOHf/CRTKKkfMJ66Srrn
 AZJ0G0zQk1XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="378920696"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 16 Mar 2021 09:26:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4E23B432; Tue, 16 Mar 2021 18:26:28 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 2/2] gpio: sch: Hook into ACPI SCI handler to catch GPIO edge events
Date:   Tue, 16 Mar 2021 18:26:13 +0200
Message-Id: <20210316162613.87710-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210316162613.87710-1-andriy.shevchenko@linux.intel.com>
References: <20210316162613.87710-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jan Kiszka <jan.kiszka@siemens.com>

Neither the ACPI description on the Quark platform provides the required
information is to do establish generic handling nor hardware capable of
doing it. According to the datasheet the hardware can generate SCI events.
Therefore, we need to hook from the driver directly into SCI handler of
the ACPI subsystem in order to catch and report GPIO-related events.

Validated on the Quark-based IOT2000 platform.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-sch.c | 55 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index bbf8ee0b54de..022677d36a7c 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -26,6 +26,7 @@
 struct sch_gpio {
 	struct gpio_chip chip;
 	struct irq_chip irqchip;
+	acpi_sci_handler sci_handler;
 	spinlock_t lock;
 	unsigned short iobase;
 	unsigned short resume_base;
@@ -152,6 +153,28 @@ static const struct gpio_chip sch_gpio_chip = {
 	.get_direction		= sch_gpio_get_direction,
 };
 
+static u32 sch_gpio_sci_handler(void *context)
+{
+	struct sch_gpio *sch = context;
+	struct gpio_chip *gc = &sch->chip;
+	unsigned long core_status, resume_status;
+	unsigned long pending;
+	int offset;
+
+	core_status = inl(sch->iobase + GTS + 0x00);
+	resume_status = inl(sch->iobase + GTS + 0x20);
+
+	pending = (resume_status << sch->resume_base) | core_status;
+
+	for_each_set_bit(offset, &pending, sch->chip.ngpio)
+		generic_handle_irq(irq_find_mapping(gc->irq.domain, offset));
+
+	outl(core_status, sch->iobase + GTS + 0x00);
+	outl(resume_status, sch->iobase + GTS + 0x20);
+
+	return pending ? ACPI_INTERRUPT_HANDLED : ACPI_INTERRUPT_NOT_HANDLED;
+}
+
 static int sch_irq_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -211,10 +234,36 @@ static void sch_irq_unmask(struct irq_data *d)
 	sch_irq_set_enable(d, 1);
 }
 
+static void sch_gpio_remove_sci_handler(void *data)
+{
+	struct sch_gpio *sch = data;
+	struct device *dev = sch->chip.parent;
+	acpi_status status;
+
+	status = acpi_remove_sci_handler(sch->sci_handler);
+	if (ACPI_FAILURE(status))
+		dev_err(dev, "Can't remove SCI handler\n");
+}
+
+static int sch_gpio_install_sci_handler(struct sch_gpio *sch)
+{
+	struct device *dev = sch->chip.parent;
+	acpi_status status;
+
+	status = acpi_install_sci_handler(sch->sci_handler, sch);
+	if (ACPI_SUCCESS(status))
+		return devm_add_action_or_reset(dev, sch_gpio_remove_sci_handler, sch);
+
+	/* SCI handler is optional */
+	dev_warn(dev, "Can't install SCI handler, no IRQ support\n");
+	return 0;
+}
+
 static int sch_gpio_probe(struct platform_device *pdev)
 {
 	struct sch_gpio *sch;
 	struct resource *res;
+	int ret;
 
 	sch = devm_kzalloc(&pdev->dev, sizeof(*sch), GFP_KERNEL);
 	if (!sch)
@@ -286,6 +335,12 @@ static int sch_gpio_probe(struct platform_device *pdev)
 	sch->chip.irq.default_type = IRQ_TYPE_NONE;
 	sch->chip.irq.handler = handle_bad_irq;
 
+	sch->sci_handler = sch_gpio_sci_handler;
+
+	ret = sch_gpio_install_sci_handler(sch);
+	if (ret)
+		return ret;
+
 	return devm_gpiochip_add_data(&pdev->dev, &sch->chip, sch);
 }
 
-- 
2.30.2

