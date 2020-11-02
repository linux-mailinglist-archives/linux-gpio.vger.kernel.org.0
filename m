Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2FA2A33E3
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 20:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgKBTR6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 14:17:58 -0500
Received: from mga01.intel.com ([192.55.52.88]:31019 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726088AbgKBTR6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Nov 2020 14:17:58 -0500
IronPort-SDR: NRQUmyBAsSzeE2kOm3d59fw5wv0jxRRN0q0yRlXl/Q5AnxBBtbcrqBce5rkTR+EDcx4QqeYWdH
 4Y+vD3/hpSWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="186776808"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="186776808"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 11:17:57 -0800
IronPort-SDR: qGHFfzCDJqPumeXzWbDOsQTj9yuo9HmDzp9h1bVAhEj53sAu0YIiEp2rMm22MJWLZ7IDLtUKnV
 G5+VASUPA09A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="336268092"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 02 Nov 2020 11:17:55 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 139F2D2; Mon,  2 Nov 2020 21:17:54 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jamie McClymont <jamie@kwiius.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3 1/4] gpiolib: acpi: Respect bias settings for GpioInt() resource
Date:   Mon,  2 Nov 2020 21:17:19 +0200
Message-Id: <20201102191722.81502-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102191722.81502-1-andriy.shevchenko@linux.intel.com>
References: <20201102191722.81502-1-andriy.shevchenko@linux.intel.com>
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

