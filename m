Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB8A289156
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 20:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733078AbgJISoF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 14:44:05 -0400
Received: from mga01.intel.com ([192.55.52.88]:62744 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733069AbgJISoF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Oct 2020 14:44:05 -0400
IronPort-SDR: xQVcRrZHNc+ZEiBdo7NK+C1AGhrbIFPN8dSlKktfUEIWdy9Ly9LIfmi44kxvtFhNk2q8x2pk6H
 iz4sHGuqtVRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="182969499"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="182969499"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 11:44:04 -0700
IronPort-SDR: +m19bJ4ixpYYSvUiHZl7SzIRNePsbI1neULNJ/Tlna6kaiQ7Qb4QdZtBDbZt40tU6ftdECshrA
 xEnfvubFE7tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="298517870"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 09 Oct 2020 11:44:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 25A4915C; Fri,  9 Oct 2020 21:44:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpiolib: Use proper type for bias enumerator in gpio_set_bias()
Date:   Fri,  9 Oct 2020 21:43:59 +0300
Message-Id: <20201009184359.16427-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

First of all, bias has a special type as being a part of enum pin_config_param.
Second, 0 is also defined bias which is equivalent to BUS_HOLD.

Taking into account above, change type of bias variable and refactor
gpio_set_bias() in a way that it doesn't use BUS_HOLD as a place holder.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 33871ad6fed8..4df1f1a23a8b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2256,8 +2256,8 @@ static int gpio_set_config(struct gpio_desc *desc, enum pin_config_param mode)
 
 static int gpio_set_bias(struct gpio_desc *desc)
 {
-	int bias = 0;
-	int ret = 0;
+	enum pin_config_param bias;
+	int ret;
 
 	if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
 		bias = PIN_CONFIG_BIAS_DISABLE;
@@ -2265,12 +2265,13 @@ static int gpio_set_bias(struct gpio_desc *desc)
 		bias = PIN_CONFIG_BIAS_PULL_UP;
 	else if (test_bit(FLAG_PULL_DOWN, &desc->flags))
 		bias = PIN_CONFIG_BIAS_PULL_DOWN;
+	else
+		return 0;
+
+	ret = gpio_set_config(desc, bias);
+	if (ret != -ENOTSUPP)
+		return ret;
 
-	if (bias) {
-		ret = gpio_set_config(desc, bias);
-		if (ret != -ENOTSUPP)
-			return ret;
-	}
 	return 0;
 }
 
-- 
2.28.0

