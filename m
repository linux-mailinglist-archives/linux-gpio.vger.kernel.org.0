Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 167962AFB4A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbgKKWUg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:20:36 -0500
Received: from mga02.intel.com ([134.134.136.20]:2004 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727035AbgKKWUf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:20:35 -0500
IronPort-SDR: K9/k36KrcTuj+vVNESh4O+DJIRsrlNj19rj6qNJR4QBFOcul12W921mu+EimpYjFR6payf9bRE
 Y5UW0yfzUKKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="157242716"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="157242716"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:20:33 -0800
IronPort-SDR: KfR8V45zf2bpjSyrTvhwLZk0P5jCexHUYrPdruQCw0c/LcdJfn3dodbIxDTETHn2ARQX/7ihCi
 uwB9PZHq9Lrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="428948319"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Nov 2020 14:20:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A856E497; Thu, 12 Nov 2020 00:20:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v7 07/18] gpiolib: Introduce gpio_set_debounce_timeout() for internal use
Date:   Thu, 12 Nov 2020 00:19:57 +0200
Message-Id: <20201111222008.39993-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In some cases we would like to have debounce setter which doesn't fail
when a feature is not supported by a controller.

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpio/gpiolib.c | 7 +++++++
 drivers/gpio/gpiolib.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c4f73597a54d..0d691ec512a4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2161,6 +2161,13 @@ static int gpio_set_bias(struct gpio_desc *desc)
 	return gpio_set_config_with_argument_optional(desc, bias, arg);
 }
 
+int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
+{
+	return gpio_set_config_with_argument_optional(desc,
+						      PIN_CONFIG_INPUT_DEBOUNCE,
+						      debounce);
+}
+
 /**
  * gpiod_direction_input - set the GPIO direction to input
  * @desc:	GPIO to set to input
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 16bc5731673c..9b1a1c782704 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -136,6 +136,7 @@ int gpiod_request(struct gpio_desc *desc, const char *label);
 void gpiod_free(struct gpio_desc *desc);
 int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 		unsigned long lflags, enum gpiod_flags dflags);
+int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce);
 int gpiod_hog(struct gpio_desc *desc, const char *name,
 		unsigned long lflags, enum gpiod_flags dflags);
 
-- 
2.28.0

