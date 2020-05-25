Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9B81E14A1
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 21:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389848AbgEYTIu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 15:08:50 -0400
Received: from mga06.intel.com ([134.134.136.31]:64360 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389437AbgEYTIt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 May 2020 15:08:49 -0400
IronPort-SDR: du9BIhupabjV5aO04q+QczxJ+QoT1OxxnYB0rtOLVfxkrUbwLyDB6ylOJ1B0WF0y2AkpjUmWcq
 BqKud67k9LGQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2020 12:08:49 -0700
IronPort-SDR: euvNBJAKGBoU5UWsk0S/fPQcxxoNhSN0IdeHluLBAA93Mf/J8kXZ80t7+RP3wxeMfsl/XQV8eF
 8ouei371R1LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,434,1583222400"; 
   d="scan'208";a="255176656"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 25 May 2020 12:08:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6F254101; Mon, 25 May 2020 22:08:46 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2] gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2
Date:   Mon, 25 May 2020 22:08:45 +0300
Message-Id: <20200525190845.60959-1-andriy.shevchenko@linux.intel.com>
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
v2: did everything in the driver (Mika)
 drivers/gpio/gpio-pca953x.c | 65 +++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 1fca8dd7824f..0d30f19782a2 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -10,6 +10,7 @@
 
 #include <linux/acpi.h>
 #include <linux/bitmap.h>
+#include <linux/dmi.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -107,6 +108,62 @@ static const struct i2c_device_id pca953x_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, pca953x_id);
 
+#ifdef CONFIG_GPIO_PCA953X_IRQ
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
+static acpi_status pca953x_acpi_get_pin(struct acpi_resource *ares, void *data)
+{
+	struct acpi_resource_gpio *agpio;
+	int *pin = data;
+
+	if (!acpi_gpio_get_irq_resource(ares, &agpio))
+		return AE_OK;
+
+	*pin = agpio->pin_table[0];
+	return AE_CTRL_TERMINATE;
+}
+
+static int pca953x_acpi_find_pin(acpi_handle handle)
+{
+	int p = -ENOENT;
+
+	acpi_walk_resources(handle, METHOD_NAME__CRS, pca953x_acpi_get_pin, &p);
+	return p;
+}
+#else
+static inline int pca953x_acpi_find_pin(acpi_handle handle) { return -ENXIO; }
+#endif
+
+static int pca953x_acpi_get_irq(struct device *dev)
+{
+	int pin;
+
+	pin = pca953x_acpi_find_pin(ACPI_HANDLE(dev));
+	if (pin < 0)
+		return pin;
+
+	dev_info(dev, "Applying ACPI interrupt quirk (GPIO %d)\n", pin);
+	return gpiod_to_irq(gpio_to_desc(pin));
+}
+#endif
+
 static const struct acpi_device_id pca953x_acpi_ids[] = {
 	{ "INT3491", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ }
@@ -750,8 +807,16 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
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

