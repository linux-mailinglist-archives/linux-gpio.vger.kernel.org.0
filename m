Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655FA2AC663
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 21:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730187AbgKIUxy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 15:53:54 -0500
Received: from mga02.intel.com ([134.134.136.20]:60885 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbgKIUxy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 15:53:54 -0500
IronPort-SDR: HqeJNDUD3Lyn7d3q5RaiP/DPwuzUaTfYzVWjRhpt15T2z81OnOW9r2qFD6bz/33U+sK+3vikRQ
 Ybw05xGcfFVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="156876114"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="156876114"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 12:53:53 -0800
IronPort-SDR: FNh5ftwBu3WcDr/mMGMWZQZcWumdZnrplrnUfIUXPxzwF2hYW4fIbXvDJJNFC16wEbdWJVCvLY
 +eeEfyG+UgYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="308142937"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 09 Nov 2020 12:53:52 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 69B0F62F; Mon,  9 Nov 2020 22:53:48 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 14/17] gpiolib: acpi: Extract acpi_request_own_gpiod() helper
Date:   Mon,  9 Nov 2020 22:53:29 +0200
Message-Id: <20201109205332.19592-15-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
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
index ada6371f6c2d..f8f1db0e3ccb 100644
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
+	ret = gpio_set_debounce_timeout(desc, agpio->debounce_timeout);
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
 
-	ret = gpio_set_debounce_timeout(desc, agpio->debounce_timeout);
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
 
-			ret = gpio_set_debounce_timeout(desc, agpio->debounce_timeout);
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

