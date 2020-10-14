Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDF9128E157
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 15:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgJNNcI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 09:32:08 -0400
Received: from mga05.intel.com ([192.55.52.43]:22636 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727250AbgJNNcI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Oct 2020 09:32:08 -0400
IronPort-SDR: f49HH/ckupomPUFV5On4nTdlqciZYY7DJxWa86vU/2+DcVHayC74E7omcnjtuEOewO/nyvserx
 ZO/LgbOJB4xQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="250805536"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="250805536"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 06:32:00 -0700
IronPort-SDR: DS+B36umcOceEjGB1XpPjXFFj70hXLoY1Ith21M8h5KXAoxbIe/+1IvdnF/hvwy1C7+2RjeWqx
 UdaHFCbDkNsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="299956023"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2020 06:31:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 036B51A3; Wed, 14 Oct 2020 16:31:55 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jamie McClymont <jamie@kwiius.com>
Subject: [PATCH v1 1/3] gpiolib: acpi: Respect bias settings for GpioInt() resource
Date:   Wed, 14 Oct 2020 16:31:52 +0300
Message-Id: <20201014133154.30610-1-andriy.shevchenko@linux.intel.com>
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

While at it, refactor to configure flags first and, only when succeeded,
map the IRQ descriptor.

Reported-by: Jamie McClymont <jamie@kwiius.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

This one highly depends on Intel pin control driver changes (for now [1], but
might be more), so it's probably not supposed to be backported (at least right
now).

[1]: https://lore.kernel.org/linux-gpio/20201014104638.84043-1-andriy.shevchenko@linux.intel.com/T/

 drivers/gpio/gpiolib-acpi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 834a12f3219e..52b961673f16 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -942,21 +942,25 @@ int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
 
 		if (info.gpioint && idx++ == index) {
 			unsigned long lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
+			enum gpiod_flags dflags = info.flags;
 			char label[32];
 			int irq;
 
 			if (IS_ERR(desc))
 				return PTR_ERR(desc);
 
-			irq = gpiod_to_irq(desc);
-			if (irq < 0)
-				return irq;
+			acpi_gpio_update_gpiod_flags(&dflags, &info);
+			acpi_gpio_update_gpiod_lookup_flags(&lflags, &info);
 
 			snprintf(label, sizeof(label), "GpioInt() %d", index);
-			ret = gpiod_configure_flags(desc, label, lflags, info.flags);
+			ret = gpiod_configure_flags(desc, label, lflags, dflags);
 			if (ret < 0)
 				return ret;
 
+			irq = gpiod_to_irq(desc);
+			if (irq < 0)
+				return irq;
+
 			irq_flags = acpi_dev_get_irq_type(info.triggering,
 							  info.polarity);
 
-- 
2.28.0

