Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172572AFB42
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgKKWUb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:20:31 -0500
Received: from mga04.intel.com ([192.55.52.120]:54740 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726746AbgKKWUb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:20:31 -0500
IronPort-SDR: Pi16kaCQyuMCbX3RHTT3a9thyR/yzk9kb8u5fZIxCyc1LwTSmbyjG3a743R92BI1Nf0vSYWnOk
 2VZ15AmPcqiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="167643238"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="167643238"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:20:30 -0800
IronPort-SDR: eGM7lNhU47CeSeKh3a0fba1zRpXHdBnkcrHc/VUGnNwvT7Rb3Ik/VjXWzjGPwE9/4MqNyb06DD
 VNM1WIloJazQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="366394648"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Nov 2020 14:20:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8E3FF1CC; Thu, 12 Nov 2020 00:20:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v7 04/18] gpiolib: Extract gpio_set_config_with_argument() for future use
Date:   Thu, 12 Nov 2020 00:19:54 +0200
Message-Id: <20201111222008.39993-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
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

