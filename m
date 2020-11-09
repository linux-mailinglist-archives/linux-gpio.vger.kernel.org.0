Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A3D2AC665
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 21:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730337AbgKIUxy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 15:53:54 -0500
Received: from mga07.intel.com ([134.134.136.100]:55716 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729817AbgKIUxy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 15:53:54 -0500
IronPort-SDR: Qn/3/k44ZVgy0ETgP8XH2JBjFiRNNBrq61X1ClZW65h6pDsCzMt7dZrhugiAxlMpocnuzqqUok
 zwGnRaHs5p2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="234037404"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="234037404"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 12:53:52 -0800
IronPort-SDR: 86T1uVhyLVuFQ8xYnLHH8BPBNAeXhaWnDwFsoPCKbEaERY8EYDniAtHU+pyoodDF0nktwzRCnP
 TGS7BOxD3m6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="541019888"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 09 Nov 2020 12:53:51 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 257714B0; Mon,  9 Nov 2020 22:53:48 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 06/17] gpiolib: move bias related code from gpio_set_config() to gpio_set_bias()
Date:   Mon,  9 Nov 2020 22:53:21 +0200
Message-Id: <20201109205332.19592-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move bias related code from gpio_set_config() to gpio_set_bias().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1e545546fb09..0691ecbd9a16 100644
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

