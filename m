Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3542AC66F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 21:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730267AbgKIUx6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 15:53:58 -0500
Received: from mga03.intel.com ([134.134.136.65]:41857 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730459AbgKIUx5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 15:53:57 -0500
IronPort-SDR: 9pRMQX/WYg92cbZ4klefseimhmUf1xiuufRG9BcgxKUgQOZI279OGvqFZ3dzeeq0Rt4WBLZaia
 mKn4tQh0XIjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="169982905"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="169982905"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 12:53:53 -0800
IronPort-SDR: vCSQqeC+dCg8Qhobtv5Ml5zhlJUZyEmt7i2s/rsZqfbYbInpim8YfQS493lQIi0SQClhSTpcOR
 qW8g9y7gMERA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="428133037"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2020 12:53:51 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 61A2A60A; Mon,  9 Nov 2020 22:53:48 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 13/17] gpiolib: acpi: Make acpi_gpio_to_gpiod_flags() usable for GpioInt()
Date:   Mon,  9 Nov 2020 22:53:28 +0200
Message-Id: <20201109205332.19592-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GpioInt() implies input configuration of the pin. Add this to
the acpi_gpio_to_gpiod_flags() and make usable for GpioInt().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 999fd3816298..ada6371f6c2d 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -208,6 +208,10 @@ static void acpi_gpiochip_request_irqs(struct acpi_gpio_chip *acpi_gpio)
 static enum gpiod_flags
 acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
 {
+	/* GpioInt() implies input configuration */
+	if (agpio->connection_type == ACPI_RESOURCE_GPIO_TYPE_INT)
+		return GPIOD_IN;
+
 	switch (agpio->io_restriction) {
 	case ACPI_IO_RESTRICT_INPUT:
 		return GPIOD_IN;
@@ -669,6 +673,7 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 					      agpio->pin_table[pin_index]);
 		lookup->info.pin_config = agpio->pin_config;
 		lookup->info.debounce = agpio->debounce_timeout;
+		lookup->info.flags = acpi_gpio_to_gpiod_flags(agpio);
 		lookup->info.gpioint = gpioint;
 
 		/*
@@ -679,11 +684,9 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 		 * - ACPI_ACTIVE_HIGH == GPIO_ACTIVE_HIGH
 		 */
 		if (lookup->info.gpioint) {
-			lookup->info.flags = GPIOD_IN;
 			lookup->info.polarity = agpio->polarity;
 			lookup->info.triggering = agpio->triggering;
 		} else {
-			lookup->info.flags = acpi_gpio_to_gpiod_flags(agpio);
 			lookup->info.polarity = lookup->active_low;
 		}
 	}
-- 
2.28.0

