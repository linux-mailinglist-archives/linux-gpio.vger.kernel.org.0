Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 621E72A9DEC
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 20:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbgKFTXQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 14:23:16 -0500
Received: from mga17.intel.com ([192.55.52.151]:29384 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728112AbgKFTXN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Nov 2020 14:23:13 -0500
IronPort-SDR: j6sF+MNnWlPt1hjn6jSRjRcvlw7t2i6nLObkAcFH/7fkfxuxN+PhGFnG0TBeqGET/UcvKB/4jw
 1by3dizuhdEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="149441529"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="149441529"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 11:23:12 -0800
IronPort-SDR: GNWs8XQVUcfmsllywNeIlwMwIJOrIqjMdih42UtcN50SA54dP0EeGRISS7oWyz9AjaCkJBn7Br
 oXqrJ7LsH5Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="364789017"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 06 Nov 2020 11:23:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CA7BC4C7; Fri,  6 Nov 2020 21:23:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 7/9] gpiolib: acpi: Convert pin_index to be u16
Date:   Fri,  6 Nov 2020 21:23:02 +0200
Message-Id: <20201106192304.49179-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
References: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
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
index 65fa38d467db..bcb76b4e82aa 100644
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

