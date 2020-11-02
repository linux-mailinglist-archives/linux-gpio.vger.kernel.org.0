Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25B52A33E6
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 20:18:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgKBTSI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 14:18:08 -0500
Received: from mga05.intel.com ([192.55.52.43]:1502 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726014AbgKBTSI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Nov 2020 14:18:08 -0500
IronPort-SDR: 2mRbSwGeVBuyyZB25GmPmwybYJqVefS07SwwZJOab6HhtdTdUOc6L2fdjxWmIOYu7RR4JzH/8/
 t0E8k/KfiV9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="253646730"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="253646730"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 11:18:07 -0800
IronPort-SDR: aoV65kocGXKaIEGCG/MP+fcPKuHLlzPoTTgdXbv32mgoOmcaLAQN471aji+R23r+uMgiM5NNhz
 FFx8GkmsCnYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="320163610"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 02 Nov 2020 11:18:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A7436D2; Mon,  2 Nov 2020 21:18:04 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Coiby Xu <coiby.xu@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 3/4] gpiolib: acpi: Take into account debounce settings
Date:   Mon,  2 Nov 2020 21:17:21 +0200
Message-Id: <20201102191722.81502-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102191722.81502-1-andriy.shevchenko@linux.intel.com>
References: <20201102191722.81502-1-andriy.shevchenko@linux.intel.com>
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
---
 drivers/gpio/gpiolib-acpi.c | 5 +++++
 drivers/gpio/gpiolib-acpi.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index c127b410a7a2..ad245b2a536e 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -664,6 +664,7 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 		lookup->desc = acpi_get_gpiod(agpio->resource_source.string_ptr,
 					      agpio->pin_table[pin_index]);
 		lookup->info.pin_config = agpio->pin_config;
+		lookup->info.debounce = agpio->debounce_timeout;
 		lookup->info.gpioint = gpioint;
 
 		/*
@@ -961,6 +962,10 @@ int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
 			if (ret < 0)
 				return ret;
 
+			ret = gpiod_set_debounce(desc, info.debounce);
+			if (ret)
+				return ret;
+
 			irq_flags = acpi_dev_get_irq_type(info.triggering,
 							  info.polarity);
 
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

