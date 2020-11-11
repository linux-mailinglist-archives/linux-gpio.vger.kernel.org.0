Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6957E2AFB11
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgKKWGa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:06:30 -0500
Received: from mga17.intel.com ([192.55.52.151]:62678 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727054AbgKKWG3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:06:29 -0500
IronPort-SDR: wwP+XpQpzr80nr4Q8HlpH4Qj+DFlEW460yY5Nj3ogjVuLOVQERy6eRe63a4xL9IO9jVYwq25dP
 R7hzgrfoGfBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="150076085"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="150076085"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:06:25 -0800
IronPort-SDR: r8nzKSbgJscZMwNW5Q2msXocMC8y5BDnwDnbX8eBTefZeIBcKJEbI8SOdfNAQZ/4AKMUjVtyMI
 WF/lP9aY1tAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="328272992"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 11 Nov 2020 14:06:21 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E5F86709; Thu, 12 Nov 2020 00:06:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v6 14/18] gpiolib: acpi: Convert pin_index to be u16
Date:   Thu, 12 Nov 2020 00:05:55 +0200
Message-Id: <20201111220559.39680-15-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As specified by ACPI the pin index is 16-bit unsigned integer.
Define the variable, which holds it, accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index c46fd51007d0..a556e2ec0a39 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -660,7 +660,7 @@ int acpi_gpio_update_gpiod_lookup_flags(unsigned long *lookupflags,
 struct acpi_gpio_lookup {
 	struct acpi_gpio_info info;
 	int index;
-	int pin_index;
+	u16 pin_index;
 	bool active_low;
 	struct gpio_desc *desc;
 	int n;
@@ -676,7 +676,7 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 	if (!lookup->desc) {
 		const struct acpi_resource_gpio *agpio = &ares->data.gpio;
 		bool gpioint = agpio->connection_type == ACPI_RESOURCE_GPIO_TYPE_INT;
-		int pin_index;
+		u16 pin_index;
 
 		if (lookup->info.quirks & ACPI_GPIO_QUIRK_ONLY_GPIOIO && gpioint)
 			lookup->index++;
@@ -822,7 +822,7 @@ static struct gpio_desc *acpi_get_gpiod_by_index(struct acpi_device *adev,
 		if (ret)
 			return ERR_PTR(ret);
 
-		dev_dbg(&adev->dev, "GPIO: _DSD returned %s %d %d %u\n",
+		dev_dbg(&adev->dev, "GPIO: _DSD returned %s %d %u %u\n",
 			dev_name(&lookup.info.adev->dev), lookup.index,
 			lookup.pin_index, lookup.active_low);
 	} else {
@@ -1018,7 +1018,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 	struct gpio_chip *chip = achip->chip;
 	struct acpi_resource_gpio *agpio;
 	struct acpi_resource *ares;
-	int pin_index = (int)address;
+	u16 pin_index = address;
 	acpi_status status;
 	int length;
 	int i;
@@ -1041,7 +1041,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		return AE_BAD_PARAMETER;
 	}
 
-	length = min(agpio->pin_table_length, (u16)(pin_index + bits));
+	length = min_t(u16, agpio->pin_table_length, pin_index + bits);
 	for (i = pin_index; i < length; ++i) {
 		int pin = agpio->pin_table[i];
 		struct acpi_gpio_connection *conn;
-- 
2.28.0

