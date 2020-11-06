Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1962A9DE4
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 20:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgKFTXL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 14:23:11 -0500
Received: from mga17.intel.com ([192.55.52.151]:29384 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727356AbgKFTXK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Nov 2020 14:23:10 -0500
IronPort-SDR: ow5spmf1c/rbt0qS9xE5iU3xFRQ6wn3wz0YB6LFdkEvXKuAadfDAO+0C8I/LQguoss/9SMaK/3
 A8Eqj2rUJMlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="149441524"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="149441524"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 11:23:10 -0800
IronPort-SDR: G13zTV/3OKBoIhXYTY+fYUz350nzkjSIGw2cie0O/aTY3td1hT9qfGsn4ZaCkwpRDiTGTcJ9s+
 7M4bIGp9stSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="364789011"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 06 Nov 2020 11:23:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A2775213; Fri,  6 Nov 2020 21:23:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 4/9] gpiolib: acpi: Move acpi_gpio_to_gpiod_flags() upper in the code
Date:   Fri,  6 Nov 2020 21:22:59 +0200
Message-Id: <20201106192304.49179-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
References: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move acpi_gpio_to_gpiod_flags() upper in the code to allow further refactoring.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 66 ++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index b4a0decfeac2..42c0605e3910 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -205,6 +205,39 @@ static void acpi_gpiochip_request_irqs(struct acpi_gpio_chip *acpi_gpio)
 		acpi_gpiochip_request_irq(acpi_gpio, event);
 }
 
+static enum gpiod_flags
+acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
+{
+	switch (agpio->io_restriction) {
+	case ACPI_IO_RESTRICT_INPUT:
+		return GPIOD_IN;
+	case ACPI_IO_RESTRICT_OUTPUT:
+		/*
+		 * ACPI GPIO resources don't contain an initial value for the
+		 * GPIO. Therefore we deduce that value from the pull field
+		 * instead. If the pin is pulled up we assume default to be
+		 * high, if it is pulled down we assume default to be low,
+		 * otherwise we leave pin untouched.
+		 */
+		switch (agpio->pin_config) {
+		case ACPI_PIN_CONFIG_PULLUP:
+			return GPIOD_OUT_HIGH;
+		case ACPI_PIN_CONFIG_PULLDOWN:
+			return GPIOD_OUT_LOW;
+		default:
+			break;
+		}
+	default:
+		break;
+	}
+
+	/*
+	 * Assume that the BIOS has configured the direction and pull
+	 * accordingly.
+	 */
+	return GPIOD_ASIS;
+}
+
 static bool acpi_gpio_in_ignore_list(const char *controller_in, int pin_in)
 {
 	const char *controller, *pin_str;
@@ -530,39 +563,6 @@ static bool acpi_get_driver_gpio_data(struct acpi_device *adev,
 	return false;
 }
 
-static enum gpiod_flags
-acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
-{
-	switch (agpio->io_restriction) {
-	case ACPI_IO_RESTRICT_INPUT:
-		return GPIOD_IN;
-	case ACPI_IO_RESTRICT_OUTPUT:
-		/*
-		 * ACPI GPIO resources don't contain an initial value for the
-		 * GPIO. Therefore we deduce that value from the pull field
-		 * instead. If the pin is pulled up we assume default to be
-		 * high, if it is pulled down we assume default to be low,
-		 * otherwise we leave pin untouched.
-		 */
-		switch (agpio->pin_config) {
-		case ACPI_PIN_CONFIG_PULLUP:
-			return GPIOD_OUT_HIGH;
-		case ACPI_PIN_CONFIG_PULLDOWN:
-			return GPIOD_OUT_LOW;
-		default:
-			break;
-		}
-	default:
-		break;
-	}
-
-	/*
-	 * Assume that the BIOS has configured the direction and pull
-	 * accordingly.
-	 */
-	return GPIOD_ASIS;
-}
-
 static int
 __acpi_gpio_update_gpiod_flags(enum gpiod_flags *flags, enum gpiod_flags update)
 {
-- 
2.28.0

