Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 522322A33E7
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 20:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgKBTSL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 14:18:11 -0500
Received: from mga09.intel.com ([134.134.136.24]:5744 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726014AbgKBTSL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Nov 2020 14:18:11 -0500
IronPort-SDR: k7eo8yZeE+m+eBU5j2qK9K1HD9klcQQfaigDB8/3PcQjzFS3mILmVXYrs7gd3lZMBly760KsCD
 a8G+lC0u8SKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="169070127"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="169070127"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 11:18:10 -0800
IronPort-SDR: QnfMFKpJotsWM/HXMu+SBHfEEsJcH68pEvwNUUUTW5gke6KlMbTb8H6sjH3vI79tKiO76ttrPs
 ZQj9IwvqIGcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="363345311"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 02 Nov 2020 11:18:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 38C06D2; Mon,  2 Nov 2020 21:18:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 4/4] gpiolib: acpi: Convert pin_index to be u16
Date:   Mon,  2 Nov 2020 21:17:22 +0200
Message-Id: <20201102191722.81502-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102191722.81502-1-andriy.shevchenko@linux.intel.com>
References: <20201102191722.81502-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As defined by ACPI the pin index is 16-bit unsigned integer.
Define the variable, which holds it, accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index ad245b2a536e..a571dbf2093b 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -633,7 +633,7 @@ int acpi_gpio_update_gpiod_lookup_flags(unsigned long *lookupflags,
 struct acpi_gpio_lookup {
 	struct acpi_gpio_info info;
 	int index;
-	int pin_index;
+	u16 pin_index;
 	bool active_low;
 	struct gpio_desc *desc;
 	int n;
@@ -649,7 +649,7 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 	if (!lookup->desc) {
 		const struct acpi_resource_gpio *agpio = &ares->data.gpio;
 		bool gpioint = agpio->connection_type == ACPI_RESOURCE_GPIO_TYPE_INT;
-		int pin_index;
+		u16 pin_index;
 
 		if (lookup->info.quirks & ACPI_GPIO_QUIRK_ONLY_GPIOIO && gpioint)
 			lookup->index++;
@@ -795,7 +795,7 @@ static struct gpio_desc *acpi_get_gpiod_by_index(struct acpi_device *adev,
 		if (ret)
 			return ERR_PTR(ret);
 
-		dev_dbg(&adev->dev, "GPIO: _DSD returned %s %d %d %u\n",
+		dev_dbg(&adev->dev, "GPIO: _DSD returned %s %d %u %u\n",
 			dev_name(&lookup.info.adev->dev), lookup.index,
 			lookup.pin_index, lookup.active_low);
 	} else {
@@ -991,7 +991,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 	struct gpio_chip *chip = achip->chip;
 	struct acpi_resource_gpio *agpio;
 	struct acpi_resource *ares;
-	int pin_index = (int)address;
+	u16 pin_index = address;
 	acpi_status status;
 	int length;
 	int i;
@@ -1014,7 +1014,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		return AE_BAD_PARAMETER;
 	}
 
-	length = min(agpio->pin_table_length, (u16)(pin_index + bits));
+	length = min_t(u16, agpio->pin_table_length, pin_index + bits);
 	for (i = pin_index; i < length; ++i) {
 		int pin = agpio->pin_table[i];
 		struct acpi_gpio_connection *conn;
-- 
2.28.0

