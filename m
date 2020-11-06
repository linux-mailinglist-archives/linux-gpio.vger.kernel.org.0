Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F45C2A9DEA
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 20:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbgKFTXN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 14:23:13 -0500
Received: from mga11.intel.com ([192.55.52.93]:17139 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728071AbgKFTXM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Nov 2020 14:23:12 -0500
IronPort-SDR: NpeDLx5Zf+Q66Y39JKa1Htn8Fndfv95v1t7h0PgkuEX4m0K8VfPplNYFsY40udb1KjGRhZeedJ
 npgADEa3zq+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="166079995"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="166079995"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 11:23:12 -0800
IronPort-SDR: al5BEd98v0ljiMG8TyFZ3M0hAeq5y6obJ1KFi14jWbUSHDTjBtUIKoempW5Ep0ejnSKG7RRWag
 IPSRaxLRHsbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="307293407"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 06 Nov 2020 11:23:10 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BEF524B0; Fri,  6 Nov 2020 21:23:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 6/9] gpiolib: acpi: Extract acpi_request_own_gpiod() helper
Date:   Fri,  6 Nov 2020 21:23:01 +0200
Message-Id: <20201106192304.49179-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
References: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It appears that we are using similar code excerpts for ACPI OpRegion
and event handling. Deduplicate those excerpts by extracting a new
acpi_request_own_gpiod() helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 44 +++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 20bc6921457f..65fa38d467db 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -242,6 +242,27 @@ acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
 	return GPIOD_ASIS;
 }
 
+static struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
+						struct acpi_resource_gpio *agpio,
+						unsigned int index,
+						const char *label)
+{
+	enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio);
+	unsigned int pin = agpio->pin_table[index];
+	struct gpio_desc *desc;
+	int ret;
+
+	desc = gpiochip_request_own_desc(chip, pin, label, GPIO_ACTIVE_HIGH, flags);
+	if (IS_ERR(desc))
+		return desc;
+
+	ret = gpiod_set_debounce(desc, agpio->debounce_timeout);
+	if (ret)
+		gpiochip_free_own_desc(desc);
+
+	return ret ? ERR_PTR(ret) : desc;
+}
+
 static bool acpi_gpio_in_ignore_list(const char *controller_in, int pin_in)
 {
 	const char *controller, *pin_str;
@@ -327,8 +348,7 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 	if (!handler)
 		return AE_OK;
 
-	desc = gpiochip_request_own_desc(chip, pin, "ACPI:Event",
-					 GPIO_ACTIVE_HIGH, GPIOD_IN);
+	desc = acpi_request_own_gpiod(chip, agpio, 0, "ACPI:Event");
 	if (IS_ERR(desc)) {
 		dev_err(chip->parent,
 			"Failed to request GPIO for pin 0x%04X, err %ld\n",
@@ -336,10 +356,6 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 		return AE_OK;
 	}
 
-	ret = gpiod_set_debounce(desc, agpio->debounce_timeout);
-	if (ret)
-		goto fail_free_desc;
-
 	ret = gpiochip_lock_as_irq(chip, pin);
 	if (ret) {
 		dev_err(chip->parent,
@@ -1058,27 +1074,13 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		}
 
 		if (!found) {
-			enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio);
-			const char *label = "ACPI:OpRegion";
-			int ret;
-
-			desc = gpiochip_request_own_desc(chip, pin, label,
-							 GPIO_ACTIVE_HIGH,
-							 flags);
+			desc = acpi_request_own_gpiod(chip, agpio, i, "ACPI:OpRegion");
 			if (IS_ERR(desc)) {
 				status = AE_ERROR;
 				mutex_unlock(&achip->conn_lock);
 				goto out;
 			}
 
-			ret = gpiod_set_debounce(desc, agpio->debounce_timeout);
-			if (ret) {
-				status = AE_ERROR;
-				gpiochip_free_own_desc(desc);
-				mutex_unlock(&achip->conn_lock);
-				goto out;
-			}
-
 			conn = kzalloc(sizeof(*conn), GFP_KERNEL);
 			if (!conn) {
 				status = AE_NO_MEMORY;
-- 
2.28.0

