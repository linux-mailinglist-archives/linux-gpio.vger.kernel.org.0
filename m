Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A663429632F
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 18:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898354AbgJVQ6w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 12:58:52 -0400
Received: from mga17.intel.com ([192.55.52.151]:37596 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2898332AbgJVQ6w (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Oct 2020 12:58:52 -0400
IronPort-SDR: 5PbWAhRnY7yPgGn2oFGwRnERnVEKR5tAyujciDuIunREo/vKiavAFGymTptwMcxPzf5MCa8yJa
 863zi4HcRaBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="147419167"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="147419167"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2020 09:58:51 -0700
IronPort-SDR: GRdVEzrArwNe3Ss4Y8d2f3vESqd7eArs0f9yMHb9jJYm/lDiS4moaLcQib9gFaAH0D9PPUAZbw
 GOMiVJjW7bHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="321440180"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 22 Oct 2020 09:58:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EEE14B8; Thu, 22 Oct 2020 19:58:48 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org, Linus@black.fi.intel.com,
        Walleij@black.fi.intel.com, linus.walleij@linaro.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jamie McClymont <jamie@kwiius.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 1/3] gpiolib: acpi: Respect bias settings for GpioInt() resource
Date:   Thu, 22 Oct 2020 19:58:45 +0300
Message-Id: <20201022165847.56153-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
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
v2: preserved ordering of IRQ map (Hans, Mika), added Rb tag (Mika)
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

