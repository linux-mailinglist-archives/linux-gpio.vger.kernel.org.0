Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88AB2AFB3F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgKKWUa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:20:30 -0500
Received: from mga09.intel.com ([134.134.136.24]:2201 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726746AbgKKWUa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:20:30 -0500
IronPort-SDR: HhMj1rGdc5n1znaHZZPjxrneWmyySA9w6YUT1dKeILIQVRZj3br04rWVYLfqtwM5UxGqZyL9U7
 4D8lSC4u4/cw==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="170393187"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="170393187"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:20:30 -0800
IronPort-SDR: Gsq8Frgdk5zWQD82rAZEsnKSoWlP3CqpqVQOx4x2x10GHqkz5w0aUdv42M84v2wc09ZV8P8wsV
 RqzvmPAP4ykw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="541980392"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 11 Nov 2020 14:20:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9705B3D3; Thu, 12 Nov 2020 00:20:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v7 05/18] gpiolib: move bias related code from gpio_set_config() to gpio_set_bias()
Date:   Thu, 12 Nov 2020 00:19:55 +0200
Message-Id: <20201111222008.39993-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move bias related code from gpio_set_config() to gpio_set_bias().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5210f396f0cd..2bfc44ca4425 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2107,25 +2107,13 @@ static int gpio_set_config_with_argument(struct gpio_desc *desc,
 
 static int gpio_set_config(struct gpio_desc *desc, enum pin_config_param mode)
 {
-	unsigned int arg;
-
-	switch (mode) {
-	case PIN_CONFIG_BIAS_PULL_DOWN:
-	case PIN_CONFIG_BIAS_PULL_UP:
-		arg = 1;
-		break;
-
-	default:
-		arg = 0;
-		break;
-	}
-
-	return gpio_set_config_with_argument(desc, mode, arg);
+	return gpio_set_config_with_argument(desc, mode, 0);
 }
 
 static int gpio_set_bias(struct gpio_desc *desc)
 {
 	enum pin_config_param bias;
+	unsigned int arg;
 	int ret;
 
 	if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
@@ -2137,7 +2125,18 @@ static int gpio_set_bias(struct gpio_desc *desc)
 	else
 		return 0;
 
-	ret = gpio_set_config(desc, bias);
+	switch (bias) {
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_UP:
+		arg = 1;
+		break;
+
+	default:
+		arg = 0;
+		break;
+	}
+
+	ret = gpio_set_config_with_argument(desc, bias, arg);
 	if (ret != -ENOTSUPP)
 		return ret;
 
-- 
2.28.0

