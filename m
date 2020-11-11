Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA342AFB0C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:06:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgKKWG0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:06:26 -0500
Received: from mga09.intel.com ([134.134.136.24]:1069 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726723AbgKKWGY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:06:24 -0500
IronPort-SDR: sAMHp8pII9bcA1MutOhQr+rql82iPqWyW3cg3Nk0mdskBt/opa+ETAdwoqHcSHYsgZMR4Lz+KB
 4552cxgCHv7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="170391852"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="170391852"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:06:23 -0800
IronPort-SDR: lnmuvhVHc3dwD0m/NIcr71aueE/q2wQWoS0UydJNRPwm2VwwBMnoe3SnI4wlPAobk7DZiIsV62
 w5nxkArVPtow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="323414186"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 11 Nov 2020 14:06:21 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C39D45F5; Thu, 12 Nov 2020 00:06:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Vasile-Laurentiu Stanimir 
        <vasile-laurentiu.stanimir@windriver.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v6 11/18] gpiolib: acpi: Set initial value for output pin based on bias and polarity
Date:   Thu, 12 Nov 2020 00:05:52 +0200
Message-Id: <20201111220559.39680-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Vasile-Laurentiu Stanimir <vasile-laurentiu.stanimir@windriver.com>

GpioIo() resources don't contain an initial value for the output pin.
Therefore instead of deducting its value solely based on bias field
we should deduce that value from the polarity and the bias fields.
Typical scenario is, when pin is defined in the table and its polarity,
specified in _DSD or via platform code, is defined as active low,
in the following call chain:

  -> acpi_populate_gpio_lookup()
     -> acpi_gpio_to_gpiod_flags()

it will return GPIOD_OUT_HIGH if bias is set no matter if polarity
is GPIO_ACTIVE_LOW, so it will return the current level instead of
the logical level.

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Vasile-Laurentiu Stanimir <vasile-laurentiu.stanimir@windriver.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index ac1bde0720f2..b47d5e8edaeb 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -206,7 +206,7 @@ static void acpi_gpiochip_request_irqs(struct acpi_gpio_chip *acpi_gpio)
 }
 
 static enum gpiod_flags
-acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
+acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio, int polarity)
 {
 	switch (agpio->io_restriction) {
 	case ACPI_IO_RESTRICT_INPUT:
@@ -215,15 +215,17 @@ acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
 		/*
 		 * ACPI GPIO resources don't contain an initial value for the
 		 * GPIO. Therefore we deduce that value from the pull field
-		 * instead. If the pin is pulled up we assume default to be
-		 * high, if it is pulled down we assume default to be low,
-		 * otherwise we leave pin untouched.
+		 * and the polarity instead. If the pin is pulled up we assume
+		 * default to be high, if it is pulled down we assume default
+		 * to be low, otherwise we leave pin untouched. For active low
+		 * polarity values will be switched. See also
+		 * Documentation/firmware-guide/acpi/gpio-properties.rst.
 		 */
 		switch (agpio->pin_config) {
 		case ACPI_PIN_CONFIG_PULLUP:
-			return GPIOD_OUT_HIGH;
+			return polarity == GPIO_ACTIVE_LOW ? GPIOD_OUT_LOW : GPIOD_OUT_HIGH;
 		case ACPI_PIN_CONFIG_PULLDOWN:
-			return GPIOD_OUT_LOW;
+			return polarity == GPIO_ACTIVE_LOW ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
 		default:
 			break;
 		}
@@ -683,8 +685,8 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 			lookup->info.polarity = agpio->polarity;
 			lookup->info.triggering = agpio->triggering;
 		} else {
-			lookup->info.flags = acpi_gpio_to_gpiod_flags(agpio);
 			lookup->info.polarity = lookup->active_low;
+			lookup->info.flags = acpi_gpio_to_gpiod_flags(agpio, lookup->info.polarity);
 		}
 	}
 
@@ -1055,12 +1057,13 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		}
 
 		if (!found) {
-			enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio);
+			int polarity = GPIO_ACTIVE_HIGH;
+			enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio, polarity);
 			const char *label = "ACPI:OpRegion";
 			int ret;
 
 			desc = gpiochip_request_own_desc(chip, pin, label,
-							 GPIO_ACTIVE_HIGH,
+							 polarity,
 							 flags);
 			if (IS_ERR(desc)) {
 				mutex_unlock(&achip->conn_lock);
-- 
2.28.0

