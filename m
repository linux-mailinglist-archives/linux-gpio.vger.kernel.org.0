Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646E91E280E
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2020 19:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729459AbgEZRM1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 13:12:27 -0400
Received: from mga05.intel.com ([192.55.52.43]:22585 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728503AbgEZRM0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 May 2020 13:12:26 -0400
IronPort-SDR: s/pCZ2g1YSkKergGNP4y6KL2OxVPv0nE0fxg/mta/MDWRnF2IUuwlfybJUUV31vQU1rO/LiKZ5
 QZ9l/cB1Mi/w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2020 10:12:25 -0700
IronPort-SDR: UiUO9bn+uRlgAHNE0aYmplnJS3pUEsVpbOSfIuMK7TTQmXEa0zHOC365mN1EDmTb2sphdGnSfD
 VjhX7RmGvD9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; 
   d="scan'208";a="375762200"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 May 2020 10:12:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 89B1BFC; Tue, 26 May 2020 20:12:23 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3] gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2
Date:   Tue, 26 May 2020 20:12:22 +0300
Message-Id: <20200526171222.14835-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
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

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: used legacy API (Mika)
 drivers/gpio/gpio-pca953x.c | 83 +++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 1fca8dd7824f..eeb91b27a52f 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -10,11 +10,13 @@
 
 #include <linux/acpi.h>
 #include <linux/bitmap.h>
+#include <linux/dmi.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_data/pca953x.h>
@@ -107,6 +109,79 @@ static const struct i2c_device_id pca953x_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, pca953x_id);
 
+#ifdef CONFIG_GPIO_PCA953X_IRQ
+
+#include <linux/gpio.h>
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
+	if (!acpi_gpio_get_irq_resource(ares, &agpio))
+		return 1;
+
+	*pin = agpio->pin_table[0];
+	return 1;
+}
+
+static int pca953x_acpi_find_pin(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	LIST_HEAD(r);
+	int pin = -ENOENT, ret;
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
@@ -750,8 +825,16 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 	struct irq_chip *irq_chip = &chip->irq_chip;
 	DECLARE_BITMAP(reg_direction, MAX_LINE);
 	DECLARE_BITMAP(irq_stat, MAX_LINE);
+	const struct dmi_system_id *id;
 	int ret;
 
+	id = dmi_first_match(pca953x_dmi_acpi_irq_info);
+	if (id) {
+		ret = pca953x_acpi_get_irq(&client->dev);
+		if (ret > 0)
+			client->irq = ret;
+	}
+
 	if (!client->irq)
 		return 0;
 
-- 
2.26.2

