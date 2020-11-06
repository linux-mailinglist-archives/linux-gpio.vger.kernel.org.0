Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1932E2A9DE1
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 20:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbgKFTXK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 14:23:10 -0500
Received: from mga11.intel.com ([192.55.52.93]:17139 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727356AbgKFTXK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Nov 2020 14:23:10 -0500
IronPort-SDR: noEMlcZP09yPtDhA2ibgDYuerJI+jickWhHWd3lLuxQNu8E+I+v7yC8RAYybRBhg/iXYzbu9yr
 YoqGFxwlfsyQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="166079984"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="166079984"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 11:23:09 -0800
IronPort-SDR: KJoEMz3wweMYUD+dOfyyJ0jzdwht6CfdRoTCWHbH8yagoZ4nVCij/YIATcvS/UgRPgTd+LHfm2
 Y/G6tYYCnLqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="307293401"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 06 Nov 2020 11:23:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 845D676; Fri,  6 Nov 2020 21:23:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jamie McClymont <jamie@kwiius.com>
Subject: [PATCH v4 1/9] gpiolib: acpi: Respect bias settings for GpioInt() resource
Date:   Fri,  6 Nov 2020 21:22:56 +0200
Message-Id: <20201106192304.49179-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
References: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In some cases the GpioInt() resource is coming with bias settings
which may affect system functioning. Respect bias settings for
GpioInt() resource by calling acpi_gpio_update_gpiod_*flags() API
in acpi_dev_gpio_irq_get().

Reported-by: Jamie McClymont <jamie@kwiius.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 834a12f3219e..3a39e8a93226 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -942,6 +942,7 @@ int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
 
 		if (info.gpioint && idx++ == index) {
 			unsigned long lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
+			enum gpiod_flags dflags = GPIOD_ASIS;
 			char label[32];
 			int irq;
 
@@ -952,8 +953,11 @@ int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
 			if (irq < 0)
 				return irq;
 
+			acpi_gpio_update_gpiod_flags(&dflags, &info);
+			acpi_gpio_update_gpiod_lookup_flags(&lflags, &info);
+
 			snprintf(label, sizeof(label), "GpioInt() %d", index);
-			ret = gpiod_configure_flags(desc, label, lflags, info.flags);
+			ret = gpiod_configure_flags(desc, label, lflags, dflags);
 			if (ret < 0)
 				return ret;
 
-- 
2.28.0

