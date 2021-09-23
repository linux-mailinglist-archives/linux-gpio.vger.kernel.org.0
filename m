Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD2A241682A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 00:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243492AbhIWWsL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 18:48:11 -0400
Received: from mga06.intel.com ([134.134.136.31]:36227 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236363AbhIWWsL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Sep 2021 18:48:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="284970989"
X-IronPort-AV: E=Sophos;i="5.85,318,1624345200"; 
   d="scan'208";a="284970989"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2021 15:46:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,318,1624345200"; 
   d="scan'208";a="534719632"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2021 15:46:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4C024E7; Fri, 24 Sep 2021 01:46:42 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v1 1/1] gpio: pca953x: Improve bias setting
Date:   Fri, 24 Sep 2021 01:46:40 +0300
Message-Id: <20210923224640.62258-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The commit 15add06841a3 ("gpio: pca953x: add ->set_config implementation")
introduced support for bias setting. However this, due to being half-baked,
brought potential issues:
 - the turning bias via disabling makes the pin floating for a while;
 - once enabled, bias can't be disabled.

Fix all these by adding support for bias disabling and move the disabling
part under the corresponding conditional.

While at it, add support for default setting, since it's cheap to add.

Fixes: 15add06841a3 ("gpio: pca953x: add ->set_config implementation")
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index f5cfc0698799..dac4d772a4d1 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -566,21 +566,21 @@ static int pca953x_gpio_set_pull_up_down(struct pca953x_chip *chip,
 
 	mutex_lock(&chip->i2c_lock);
 
-	/* Disable pull-up/pull-down */
-	ret = regmap_write_bits(chip->regmap, pull_en_reg, bit, 0);
-	if (ret)
-		goto exit;
-
 	/* Configure pull-up/pull-down */
 	if (config == PIN_CONFIG_BIAS_PULL_UP)
 		ret = regmap_write_bits(chip->regmap, pull_sel_reg, bit, bit);
 	else if (config == PIN_CONFIG_BIAS_PULL_DOWN)
 		ret = regmap_write_bits(chip->regmap, pull_sel_reg, bit, 0);
+	else
+		ret = 0;
 	if (ret)
 		goto exit;
 
-	/* Enable pull-up/pull-down */
-	ret = regmap_write_bits(chip->regmap, pull_en_reg, bit, bit);
+	/* Disable/Enable pull-up/pull-down */
+	if (config == PIN_CONFIG_BIAS_DISABLE)
+		ret = regmap_write_bits(chip->regmap, pull_en_reg, bit, 0);
+	else
+		ret = regmap_write_bits(chip->regmap, pull_en_reg, bit, bit);
 
 exit:
 	mutex_unlock(&chip->i2c_lock);
@@ -594,7 +594,9 @@ static int pca953x_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 
 	switch (pinconf_to_config_param(config)) {
 	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
 	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_DISABLE:
 		return pca953x_gpio_set_pull_up_down(chip, offset, config);
 	default:
 		return -ENOTSUPP;
-- 
2.33.0

