Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98EAC1E7EC0
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 15:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgE2NbA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 09:31:00 -0400
Received: from mga06.intel.com ([134.134.136.31]:34291 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726936AbgE2Na7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 May 2020 09:30:59 -0400
IronPort-SDR: G+T4Ikq2qOSu6o/loLHCEOn9gbt9H6lZ5IFvqhWIeYQoF79kgGiheHdlqmQcmFcZ8jrSbyoCbb
 cVEOY+3yBdfw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2020 06:30:58 -0700
IronPort-SDR: 0D01yCu/SIf1gW2VMoKoiDmkVsaSyrNTg27kcgM1hS4UZx7RuASiD+9NQF+BxSaDsCpeJGQSGE
 QmOcV0ycjp8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; 
   d="scan'208";a="469507476"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 29 May 2020 06:30:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E8FEBFC; Fri, 29 May 2020 16:30:54 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v4 2/2] gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2
Date:   Fri, 29 May 2020 16:30:54 +0300
Message-Id: <20200529133054.20136-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529133054.20136-1-andriy.shevchenko@linux.intel.com>
References: <20200529133054.20136-1-andriy.shevchenko@linux.intel.com>
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
v4: addressed some concerns, made code compact (Mika)
 drivers/gpio/gpio-pca953x.c | 79 +++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 1fca8dd7824f..e2f637dbc61a 100644
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
@@ -752,6 +825,12 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
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
2.26.2

