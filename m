Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3942AFB03
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgKKWGX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:06:23 -0500
Received: from mga11.intel.com ([192.55.52.93]:61332 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726566AbgKKWGX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:06:23 -0500
IronPort-SDR: dtrIFj3EiS20rcwbUp++llusc/zYBdNJEbtC+DFLxdDeriXtclvHO7I0t8gkeDxefWot31xsRd
 CH7rmGmH143A==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="166717639"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="166717639"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:06:22 -0800
IronPort-SDR: U7iB+3DKO/ZMCZ6/t5mloAzRVDxa9EzfvIHZxUyWDQqsm1qK3usQe4EfpfEgIAvtXWxqYlPEEx
 Fh9YJirNdBTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="308626187"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 11 Nov 2020 14:06:21 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DAC50654; Thu, 12 Nov 2020 00:06:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v6 13/18] gpiolib: acpi: Extract acpi_request_own_gpiod() helper
Date:   Thu, 12 Nov 2020 00:05:54 +0200
Message-Id: <20201111220559.39680-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It appears that we are using similar code excerpts for ACPI OpRegion
and event handling. Deduplicate those excerpts by extracting a new
acpi_request_own_gpiod() helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 46 +++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 644067cc0f81..c46fd51007d0 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -244,6 +244,28 @@ acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio, int polarity)
 	return GPIOD_ASIS;
 }
 
+static struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
+						struct acpi_resource_gpio *agpio,
+						unsigned int index,
+						const char *label)
+{
+	int polarity = GPIO_ACTIVE_HIGH;
+	enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio, polarity);
+	unsigned int pin = agpio->pin_table[index];
+	struct gpio_desc *desc;
+	int ret;
+
+	desc = gpiochip_request_own_desc(chip, pin, label, polarity, flags);
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
@@ -329,8 +351,7 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 	if (!handler)
 		return AE_OK;
 
-	desc = gpiochip_request_own_desc(chip, pin, "ACPI:Event",
-					 GPIO_ACTIVE_HIGH, GPIOD_IN);
+	desc = acpi_request_own_gpiod(chip, agpio, 0, "ACPI:Event");
 	if (IS_ERR(desc)) {
 		dev_err(chip->parent,
 			"Failed to request GPIO for pin 0x%04X, err %ld\n",
@@ -338,10 +359,6 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 		return AE_OK;
 	}
 
-	ret = gpio_set_debounce_timeout(desc, agpio->debounce_timeout);
-	if (ret)
-		goto fail_free_desc;
-
 	ret = gpiochip_lock_as_irq(chip, pin);
 	if (ret) {
 		dev_err(chip->parent,
@@ -1061,28 +1078,13 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		}
 
 		if (!found) {
-			int polarity = GPIO_ACTIVE_HIGH;
-			enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio, polarity);
-			const char *label = "ACPI:OpRegion";
-			int ret;
-
-			desc = gpiochip_request_own_desc(chip, pin, label,
-							 polarity,
-							 flags);
+			desc = acpi_request_own_gpiod(chip, agpio, i, "ACPI:OpRegion");
 			if (IS_ERR(desc)) {
 				mutex_unlock(&achip->conn_lock);
 				status = AE_ERROR;
 				goto out;
 			}
 
-			ret = gpio_set_debounce_timeout(desc, agpio->debounce_timeout);
-			if (ret) {
-				gpiochip_free_own_desc(desc);
-				mutex_unlock(&achip->conn_lock);
-				status = AE_ERROR;
-				goto out;
-			}
-
 			conn = kzalloc(sizeof(*conn), GFP_KERNEL);
 			if (!conn) {
 				gpiochip_free_own_desc(desc);
-- 
2.28.0

