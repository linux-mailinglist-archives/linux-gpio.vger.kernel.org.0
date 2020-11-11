Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1686A2AFB0E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbgKKWG0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:06:26 -0500
Received: from mga09.intel.com ([134.134.136.24]:1069 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726746AbgKKWGZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:06:25 -0500
IronPort-SDR: TMxHM+UVoUR/DVkGjDFDOzawCiRfvm7OWXysJWbRLiYEv7fiS7t6GDEaw7aWg1nHFbVziF4vX+
 nkdRxbF5j+xw==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="170391849"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="170391849"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:06:22 -0800
IronPort-SDR: 72c0aqCNALxKP/w7uMGJF+qgjYwtV+Bj8n7jsh6rby37h4PJLlvErh+TxLjnLqHa2fhv4tnMze
 IFMjzoktMoBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="366093082"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Nov 2020 14:06:21 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CF35460A; Thu, 12 Nov 2020 00:06:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v6 12/18] gpiolib: acpi: Make acpi_gpio_to_gpiod_flags() usable for GpioInt()
Date:   Thu, 12 Nov 2020 00:05:53 +0200
Message-Id: <20201111220559.39680-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GpioInt() implies input configuration of the pin. Add this to
the acpi_gpio_to_gpiod_flags() and make usable for GpioInt().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index b47d5e8edaeb..644067cc0f81 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -208,6 +208,10 @@ static void acpi_gpiochip_request_irqs(struct acpi_gpio_chip *acpi_gpio)
 static enum gpiod_flags
 acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio, int polarity)
 {
+	/* GpioInt() implies input configuration */
+	if (agpio->connection_type == ACPI_RESOURCE_GPIO_TYPE_INT)
+		return GPIOD_IN;
+
 	switch (agpio->io_restriction) {
 	case ACPI_IO_RESTRICT_INPUT:
 		return GPIOD_IN;
@@ -681,13 +685,13 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 		 * - ACPI_ACTIVE_HIGH == GPIO_ACTIVE_HIGH
 		 */
 		if (lookup->info.gpioint) {
-			lookup->info.flags = GPIOD_IN;
 			lookup->info.polarity = agpio->polarity;
 			lookup->info.triggering = agpio->triggering;
 		} else {
 			lookup->info.polarity = lookup->active_low;
-			lookup->info.flags = acpi_gpio_to_gpiod_flags(agpio, lookup->info.polarity);
 		}
+
+		lookup->info.flags = acpi_gpio_to_gpiod_flags(agpio, lookup->info.polarity);
 	}
 
 	return 1;
-- 
2.28.0

