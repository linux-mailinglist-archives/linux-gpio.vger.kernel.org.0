Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0A71EF975
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 15:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbgFENkm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jun 2020 09:40:42 -0400
Received: from mga07.intel.com ([134.134.136.100]:63304 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726553AbgFENkm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Jun 2020 09:40:42 -0400
IronPort-SDR: BPFcSMh7jtsemFPg4CJ5I/7fRE/KP9c/ZVLcsaVConI+LLLzybquhDd7saiA+sIfshVH19GYs5
 LVqTNjeHhMSw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2020 06:40:41 -0700
IronPort-SDR: OqtIsrlpr1oxssqjIC8A75H281j8bGJ0CRfiLuU2A5rMHvfrl8IowwT0x0isuH+qbpeRZcanLQ
 o9hxfje3enmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,476,1583222400"; 
   d="scan'208";a="471795242"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 05 Jun 2020 06:40:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 27F3D132; Fri,  5 Jun 2020 16:40:37 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v1 2/4] gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2
Date:   Fri,  5 Jun 2020 16:40:34 +0300
Message-Id: <20200605134036.9013-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200605134036.9013-1-andriy.shevchenko@linux.intel.com>
References: <20200605134036.9013-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

ACPI table on Intel Galileo Gen 2 has wrong pin number for IRQ resource
of one of the I²C GPIO expanders. Since we know what that number is and
luckily have GPIO bases fixed for SoC's controllers, we may use a simple
DMI quirk to match the platform and retrieve GpioInt() pin on it for
the expander in question.

Mika suggested the way to avoid a quirk in the GPIO ACPI library and
here is the second, almost rewritten version of it.

Fixes: f32517bf1ae0 ("gpio: pca953x: support ACPI devices found on Galileo Gen2")
Depends-on: 25e3ef894eef ("gpio: acpi: Split out acpi_gpio_get_irq_resource() helper")
Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 79 +++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index afe78639ec58..4d3157d8b5cd 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -107,6 +107,79 @@ static const struct i2c_device_id pca953x_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, pca953x_id);
 
+#ifdef CONFIG_GPIO_PCA953X_IRQ
+
+#include <linux/dmi.h>
+#include <linux/gpio.h>
+#include <linux/list.h>
+
+static const struct dmi_system_id pca953x_dmi_acpi_irq_info[] = {
+	{
+		/*
+		 * On Intel Galileo Gen 2 board the IRQ pin of one of
+		 * the I²C GPIO expanders, which has GpioInt() resource,
+		 * is provided as an absolute number instead of being
+		 * relative. Since first controller (gpio-sch.c) and
+		 * second (gpio-dwapb.c) are at the fixed bases, we may
+		 * safely refer to the number in the global space to get
+		 * an IRQ out of it.
+		 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GalileoGen2"),
+		},
+	},
+	{}
+};
+
+#ifdef CONFIG_ACPI
+static int pca953x_acpi_get_pin(struct acpi_resource *ares, void *data)
+{
+	struct acpi_resource_gpio *agpio;
+	int *pin = data;
+
+	if (acpi_gpio_get_irq_resource(ares, &agpio))
+		*pin = agpio->pin_table[0];
+	return 1;
+}
+
+static int pca953x_acpi_find_pin(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	int pin = -ENOENT, ret;
+	LIST_HEAD(r);
+
+	ret = acpi_dev_get_resources(adev, &r, pca953x_acpi_get_pin, &pin);
+	acpi_dev_free_resource_list(&r);
+	if (ret < 0)
+		return ret;
+
+	return pin;
+}
+#else
+static inline int pca953x_acpi_find_pin(struct device *dev) { return -ENXIO; }
+#endif
+
+static int pca953x_acpi_get_irq(struct device *dev)
+{
+	int pin, ret;
+
+	pin = pca953x_acpi_find_pin(dev);
+	if (pin < 0)
+		return pin;
+
+	dev_info(dev, "Applying ACPI interrupt quirk (GPIO %d)\n", pin);
+
+	if (!gpio_is_valid(pin))
+		return -EINVAL;
+
+	ret = gpio_request(pin, "pca953x interrupt");
+	if (ret)
+		return ret;
+
+	return gpio_to_irq(pin);
+}
+#endif
+
 static const struct acpi_device_id pca953x_acpi_ids[] = {
 	{ "INT3491", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ }
@@ -754,6 +827,12 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 	DECLARE_BITMAP(irq_stat, MAX_LINE);
 	int ret;
 
+	if (dmi_first_match(pca953x_dmi_acpi_irq_info)) {
+		ret = pca953x_acpi_get_irq(&client->dev);
+		if (ret > 0)
+			client->irq = ret;
+	}
+
 	if (!client->irq)
 		return 0;
 
-- 
2.27.0.rc2

