Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8132AFB00
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbgKKWGV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:06:21 -0500
Received: from mga12.intel.com ([192.55.52.136]:8979 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbgKKWGU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:06:20 -0500
IronPort-SDR: AG6khnMltrNPl2FQIUjikBn35UIxMrVrh/g0mHfZ05AuA2/IkuHPpcRCBMby7X2ztrsGm6nDuZ
 99qIjFL3nu8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="149498438"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="149498438"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:06:19 -0800
IronPort-SDR: lZNuABw3NuOBq2EUUIAS7K9L/5v7JP5dtZAhUpaQfbkQRa6xo+m/tVVrtE7EsJyYufoYV840pF
 PmC41EQGa18w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="530385547"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 11 Nov 2020 14:06:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 697B11CC; Thu, 12 Nov 2020 00:06:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v6 03/18] gpiolib: move bias related code from gpio_set_config() to gpio_set_bias()
Date:   Thu, 12 Nov 2020 00:05:44 +0200
Message-Id: <20201111220559.39680-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
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

