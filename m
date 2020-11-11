Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC6D02AFB07
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgKKWGZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:06:25 -0500
Received: from mga06.intel.com ([134.134.136.31]:46583 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726566AbgKKWGY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:06:24 -0500
IronPort-SDR: z9qP4pH6GK/bRfaDYak9vrxNslgfBDPoZKHEtD7hkt6vDJ6epWJyMwqEaUbtxpxgM9WLw2PIql
 I9VINEy5lV5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="231846505"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="231846505"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:06:23 -0800
IronPort-SDR: /tP3RCF5T3Z9pskdREtkxJc1chg1P2WvPH17YOEyDUkMt7fL/SKlTS+ZsWee3tLLp86bvGw3h/
 BbPsKLOo29/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="531880822"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 11 Nov 2020 14:06:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5B8A1142; Thu, 12 Nov 2020 00:06:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v6 02/18] gpiolib: Extract gpio_set_config_with_argument() for future use
Date:   Thu, 12 Nov 2020 00:05:43 +0200
Message-Id: <20201111220559.39680-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In the future we will need to have a separate function
that takes an arbitrary argument value.

Extract gpio_set_config_with_argument() for that purpose.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 87bb73991337..5210f396f0cd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2094,10 +2094,19 @@ static int gpio_do_set_config(struct gpio_chip *gc, unsigned int offset,
 	return gc->set_config(gc, offset, config);
 }
 
-static int gpio_set_config(struct gpio_desc *desc, enum pin_config_param mode)
+static int gpio_set_config_with_argument(struct gpio_desc *desc,
+					 enum pin_config_param mode,
+					 u32 argument)
 {
 	struct gpio_chip *gc = desc->gdev->chip;
 	unsigned long config;
+
+	config = pinconf_to_config_packed(mode, argument);
+	return gpio_do_set_config(gc, gpio_chip_hwgpio(desc), config);
+}
+
+static int gpio_set_config(struct gpio_desc *desc, enum pin_config_param mode)
+{
 	unsigned int arg;
 
 	switch (mode) {
@@ -2111,8 +2120,7 @@ static int gpio_set_config(struct gpio_desc *desc, enum pin_config_param mode)
 		break;
 	}
 
-	config = pinconf_to_config_packed(mode, arg);
-	return gpio_do_set_config(gc, gpio_chip_hwgpio(desc), config);
+	return gpio_set_config_with_argument(desc, mode, arg);
 }
 
 static int gpio_set_bias(struct gpio_desc *desc)
-- 
2.28.0

