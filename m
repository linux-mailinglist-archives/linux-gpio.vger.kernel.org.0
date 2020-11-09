Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE232AC661
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 21:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729452AbgKIUxx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 15:53:53 -0500
Received: from mga02.intel.com ([134.134.136.20]:60885 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730187AbgKIUxw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 15:53:52 -0500
IronPort-SDR: hYXhzB0RIahRgvvujHBg/PUhUWPxXuDMDVE14g8YIm0CDYJyNGymfMJVvpFaRWx6HqlFni7RmS
 lGYk8u8U1K3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="156876106"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="156876106"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 12:53:50 -0800
IronPort-SDR: L+OwcSiqsWXKktssdOiP9pVg7jmqBD40ox4rUZykmYg+/MKEWFYS+sliBN5rZXiGEYW/5v4BnQ
 SV0n8zWzrqVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="365215797"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2020 12:53:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1CD1A44A; Mon,  9 Nov 2020 22:53:48 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 05/17] gpiolib: Extract gpio_set_config_with_argument() for future use
Date:   Mon,  9 Nov 2020 22:53:20 +0200
Message-Id: <20201109205332.19592-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In the future we will need to have a separate function
that takes an arbitrary argument value.

Extract gpio_set_config_with_argument() for that purpose.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 134f11a84b91..1e545546fb09 100644
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

