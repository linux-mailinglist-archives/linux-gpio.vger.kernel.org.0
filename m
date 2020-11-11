Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 759A22AFB04
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgKKWGX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:06:23 -0500
Received: from mga12.intel.com ([192.55.52.136]:8979 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbgKKWGW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:06:22 -0500
IronPort-SDR: xsHP4hFQKRcnrtGyTo2e2mOFeeWZxxpj9u8IcCL4W8UN7J3qsHKv54iYDFemDohT/WfmFypLFM
 fZ8GX2bmR5Ng==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="149498443"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="149498443"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:06:22 -0800
IronPort-SDR: Pg+DbF9TLZJu7SvfCAXg70Jp0wmCtVgadwlZmiPozw6lSDT9n/oj67lu+JtlgIDz2wToREfB+i
 r84K47a2biMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="366390829"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Nov 2020 14:06:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8AAB4497; Thu, 12 Nov 2020 00:06:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jamie McClymont <jamie@kwiius.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v6 06/18] gpiolib: acpi: Respect bias settings for GpioInt() resource
Date:   Thu, 12 Nov 2020 00:05:47 +0200
Message-Id: <20201111220559.39680-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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

