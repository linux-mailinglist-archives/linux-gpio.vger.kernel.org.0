Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE63379804
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 21:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhEJTxp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 15:53:45 -0400
Received: from mga17.intel.com ([192.55.52.151]:38055 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230342AbhEJTxo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 May 2021 15:53:44 -0400
IronPort-SDR: xsrPZyvbPGFwtJBMCJuxnOTqMwl0oLduwHSTEFP0CFjUSg7VOhQ3SoUD3Sy0GGeoroJ9CFZKgy
 8KK99Mexttmg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179540360"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="179540360"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 12:52:37 -0700
IronPort-SDR: 2nCGT/oZX8jUkPrf3nHvDT4vufV9bFIPDPhdwsiQBOT7+EmmtGPmNVAdpmnIkktLQsrNKS7eM/
 kHi9zMmT4WUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="430026985"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 10 May 2021 12:52:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 649C2D7; Mon, 10 May 2021 22:52:56 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] gpio: mockup: Switch to use gpiochip_get_desc()
Date:   Mon, 10 May 2021 22:52:52 +0300
Message-Id: <20210510195252.12512-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Switch to use gpiochip_get_desc() helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mockup.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index d7e73876a3b9..0a9d746a0fe0 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -144,12 +144,9 @@ static void gpio_mockup_set_multiple(struct gpio_chip *gc,
 static int gpio_mockup_apply_pull(struct gpio_mockup_chip *chip,
 				  unsigned int offset, int value)
 {
+	struct gpio_chip *gc = &chip->gc;
+	struct gpio_desc *desc = gpiochip_get_desc(gc, offset);
 	int curr, irq, irq_type, ret = 0;
-	struct gpio_desc *desc;
-	struct gpio_chip *gc;
-
-	gc = &chip->gc;
-	desc = &gc->gpiodev->descs[offset];
 
 	mutex_lock(&chip->lock);
 
@@ -369,7 +366,7 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 
 		priv->chip = chip;
 		priv->offset = i;
-		priv->desc = &gc->gpiodev->descs[i];
+		priv->desc = gpiochip_get_desc(gc, i);
 
 		debugfs_create_file(name, 0200, chip->dbg_dir, priv,
 				    &gpio_mockup_debugfs_ops);
-- 
2.30.2

