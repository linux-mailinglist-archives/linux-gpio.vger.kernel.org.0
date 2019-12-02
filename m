Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 212AC10EA25
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 13:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbfLBMgv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 2 Dec 2019 07:36:51 -0500
Received: from mail.windriver.com ([147.11.1.11]:38455 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbfLBMgv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2019 07:36:51 -0500
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
        by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xB2CamwQ012197
        (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
        Mon, 2 Dec 2019 04:36:48 -0800 (PST)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.163]) by
 ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0468.000; Mon, 2
 Dec 2019 04:36:48 -0800
From:   "Stanimir, Vasile-Laurentiu" 
        <Vasile-Laurentiu.Stanimir@windriver.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] gpiolib-acpi: Set gpiod flags for ACPI GPIO resources based
  on pullup and polarity
Thread-Topic: [PATCH] gpiolib-acpi: Set gpiod flags for ACPI GPIO resources
 based  on pullup and polarity
Thread-Index: AdWpDKp/jl9o3PE5T9CQmAYBAG8ymw==
Date:   Mon, 2 Dec 2019 12:36:47 +0000
Message-ID: <D4218E93E3D74741B4028993B2A8DBE0534BF84B@ALA-MBD.corp.ad.wrs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.14.212]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From f8093f2c73c636b75fcf4dee4178af0e24c2f878 Mon Sep 17 00:00:00 2001
From: Vasile-Laurentiu Stanimir <vasile-laurentiu.stanimir@windriver.com>
Date: Mon, 2 Dec 2019 14:20:11 +0200
Subject: [PATCH] gpiolib-acpi: Set gpiod flags for ACPI GPIO resources based
 on pullup and polarity

ACPI GPIO resources don't contain an initial value for the
GPIO. Therefore instead of deducting its value based on pullup field
we should deduce that value from the polarity and the pull field.
Typical scenario is when ACPI is defined in acpi-table and its polarity
is defined as ACTIVE-LOW in the following call:

acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
  acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)

it will return GPIOD_OUT_HIGH if pull_up is set no matter if
polarity is GPIO_ACTIVE_LOW, so it will return the current level instead
of the logical level.

Signed-off-by: Vasile-Laurentiu Stanimir <vasile-laurentiu.stanimir@windriver.com>
---
 drivers/gpio/gpiolib-acpi.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index a3e43cacd78e..a3e327d05e26 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -420,7 +420,7 @@ static bool acpi_get_driver_gpio_data(struct acpi_device *adev,
 }
 
 static enum gpiod_flags
-acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
+acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio, int polarity)
 {
 	bool pull_up = agpio->pin_config == ACPI_PIN_CONFIG_PULLUP;
 
@@ -431,9 +431,16 @@ acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
 		/*
 		 * ACPI GPIO resources don't contain an initial value for the
 		 * GPIO. Therefore we deduce that value from the pull field
-		 * instead. If the pin is pulled up we assume default to be
-		 * high, otherwise low.
+		 * and the polarity instead.
+		 * By default if the pin is pulled up we assume default to be
+		 * high, otherwise low. For ACTIVE LOW polarity values will be
+		 * switched.
 		 */
+		if (agpio->connection_type == ACPI_RESOURCE_GPIO_TYPE_IO &&
+		    polarity == GPIO_ACTIVE_LOW) {
+			return pull_up ? GPIOD_OUT_LOW : GPIOD_OUT_HIGH;
+		}
+
 		return pull_up ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
 	default:
 		/*
@@ -532,8 +539,9 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 			lookup->info.polarity = agpio->polarity;
 			lookup->info.triggering = agpio->triggering;
 		} else {
-			lookup->info.flags = acpi_gpio_to_gpiod_flags(agpio);
 			lookup->info.polarity = lookup->active_low;
+			lookup->info.flags = acpi_gpio_to_gpiod_flags(agpio,
+							lookup->info.polarity);
 		}
 	}
 
@@ -881,7 +889,8 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		}
 
 		if (!found) {
-			enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio);
+			enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio,
+							agpio->polarity);
 			const char *label = "ACPI:OpRegion";
 			int err;
 
-- 
2.17.1
