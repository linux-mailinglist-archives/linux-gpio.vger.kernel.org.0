Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D95262A9DE3
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 20:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgKFTXK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 14:23:10 -0500
Received: from mga11.intel.com ([192.55.52.93]:17139 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727859AbgKFTXK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Nov 2020 14:23:10 -0500
IronPort-SDR: 5oE4xJl2OGEZes2XqYJFq1+GfQZr+r4XLbqMdpMScW+fsGRPzIDLRH4GbLoDIxRnkNsSmG86oL
 T037k9Ej4UFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="166079985"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="166079985"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 11:23:10 -0800
IronPort-SDR: HXhdQ0y0TYBekCgVPPVtN7ffmvNBZd3UBz3fS0NaS1uSoUoyypUmKGfJGiZBBUHKMficoBDeDl
 UwvA4gusnUXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="307293402"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 06 Nov 2020 11:23:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9B7B82A0; Fri,  6 Nov 2020 21:23:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Coiby Xu <coiby.xu@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 3/9] gpiolib: acpi: Take into account debounce settings
Date:   Fri,  6 Nov 2020 21:22:58 +0200
Message-Id: <20201106192304.49179-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
References: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We didn't take into account the debounce settings supplied by ACPI.
This change is targeting the mentioned gap.

Reported-by: Coiby Xu <coiby.xu@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-acpi.c | 18 ++++++++++++++++++
 drivers/gpio/gpiolib-acpi.h |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index c127b410a7a2..b4a0decfeac2 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -299,6 +299,10 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 		return AE_OK;
 	}
 
+	ret = gpiod_set_debounce(desc, agpio->debounce_timeout);
+	if (ret)
+		goto fail_free_desc;
+
 	ret = gpiochip_lock_as_irq(chip, pin);
 	if (ret) {
 		dev_err(chip->parent,
@@ -664,6 +668,7 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 		lookup->desc = acpi_get_gpiod(agpio->resource_source.string_ptr,
 					      agpio->pin_table[pin_index]);
 		lookup->info.pin_config = agpio->pin_config;
+		lookup->info.debounce = agpio->debounce_timeout;
 		lookup->info.gpioint = gpioint;
 
 		/*
@@ -961,6 +966,10 @@ int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
 			if (ret < 0)
 				return ret;
 
+			ret = gpiod_set_debounce(desc, info.debounce);
+			if (ret)
+				return ret;
+
 			irq_flags = acpi_dev_get_irq_type(info.triggering,
 							  info.polarity);
 
@@ -1048,6 +1057,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		if (!found) {
 			enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio);
 			const char *label = "ACPI:OpRegion";
+			int ret;
 
 			desc = gpiochip_request_own_desc(chip, pin, label,
 							 GPIO_ACTIVE_HIGH,
@@ -1058,6 +1068,14 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 				goto out;
 			}
 
+			ret = gpiod_set_debounce(desc, agpio->debounce_timeout);
+			if (ret) {
+				status = AE_ERROR;
+				gpiochip_free_own_desc(desc);
+				mutex_unlock(&achip->conn_lock);
+				goto out;
+			}
+
 			conn = kzalloc(sizeof(*conn), GFP_KERNEL);
 			if (!conn) {
 				status = AE_NO_MEMORY;
diff --git a/drivers/gpio/gpiolib-acpi.h b/drivers/gpio/gpiolib-acpi.h
index 1c6d65cf0629..e2edb632b2cc 100644
--- a/drivers/gpio/gpiolib-acpi.h
+++ b/drivers/gpio/gpiolib-acpi.h
@@ -18,6 +18,7 @@ struct acpi_device;
  * @pin_config: pin bias as provided by ACPI
  * @polarity: interrupt polarity as provided by ACPI
  * @triggering: triggering type as provided by ACPI
+ * @debounce: debounce timeout as provided by ACPI
  * @quirks: Linux specific quirks as provided by struct acpi_gpio_mapping
  */
 struct acpi_gpio_info {
@@ -27,6 +28,7 @@ struct acpi_gpio_info {
 	int pin_config;
 	int polarity;
 	int triggering;
+	unsigned int debounce;
 	unsigned int quirks;
 };
 
-- 
2.28.0

