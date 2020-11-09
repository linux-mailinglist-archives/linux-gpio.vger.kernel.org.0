Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F29C2AC66E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 21:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730272AbgKIUx6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 15:53:58 -0500
Received: from mga03.intel.com ([134.134.136.65]:41852 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730267AbgKIUx5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 15:53:57 -0500
IronPort-SDR: HYkAP0ohGF3gcZZVkTXG4696oplMAFftQtD7wXwqd4ixkSVSKsgjlJbONdRQX0gzv2Nndcapa7
 I42iCzTxXY5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="169982906"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="169982906"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 12:53:53 -0800
IronPort-SDR: G3MEUaToPXUYTUgAbfMJi3l+9Wfck+x4x76XQlf4fslShUNuPZ9nH5QjYl2KwdhI+VZwmG+G+a
 R2PuOJXKaAtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="428133041"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2020 12:53:52 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7410C654; Mon,  9 Nov 2020 22:53:48 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 15/17] gpiolib: acpi: Convert pin_index to be u16
Date:   Mon,  9 Nov 2020 22:53:30 +0200
Message-Id: <20201109205332.19592-16-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As defined by ACPI the pin index is 16-bit unsigned integer.
Define the variable, which holds it, accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-acpi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index f8f1db0e3ccb..31008b0aef77 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -657,7 +657,7 @@ int acpi_gpio_update_gpiod_lookup_flags(unsigned long *lookupflags,
 struct acpi_gpio_lookup {
 	struct acpi_gpio_info info;
 	int index;
-	int pin_index;
+	u16 pin_index;
 	bool active_low;
 	struct gpio_desc *desc;
 	int n;
@@ -673,7 +673,7 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 	if (!lookup->desc) {
 		const struct acpi_resource_gpio *agpio = &ares->data.gpio;
 		bool gpioint = agpio->connection_type == ACPI_RESOURCE_GPIO_TYPE_INT;
-		int pin_index;
+		u16 pin_index;
 
 		if (lookup->info.quirks & ACPI_GPIO_QUIRK_ONLY_GPIOIO && gpioint)
 			lookup->index++;
@@ -818,7 +818,7 @@ static struct gpio_desc *acpi_get_gpiod_by_index(struct acpi_device *adev,
 		if (ret)
 			return ERR_PTR(ret);
 
-		dev_dbg(&adev->dev, "GPIO: _DSD returned %s %d %d %u\n",
+		dev_dbg(&adev->dev, "GPIO: _DSD returned %s %d %u %u\n",
 			dev_name(&lookup.info.adev->dev), lookup.index,
 			lookup.pin_index, lookup.active_low);
 	} else {
@@ -1014,7 +1014,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 	struct gpio_chip *chip = achip->chip;
 	struct acpi_resource_gpio *agpio;
 	struct acpi_resource *ares;
-	int pin_index = (int)address;
+	u16 pin_index = address;
 	acpi_status status;
 	int length;
 	int i;
@@ -1037,7 +1037,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		return AE_BAD_PARAMETER;
 	}
 
-	length = min(agpio->pin_table_length, (u16)(pin_index + bits));
+	length = min_t(u16, agpio->pin_table_length, pin_index + bits);
 	for (i = pin_index; i < length; ++i) {
 		int pin = agpio->pin_table[i];
 		struct acpi_gpio_connection *conn;
-- 
2.28.0

