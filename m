Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49BE51F7A1B
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 16:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgFLOuN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 10:50:13 -0400
Received: from mga07.intel.com ([134.134.136.100]:5662 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726314AbgFLOuL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 10:50:11 -0400
IronPort-SDR: dlHdYSUZz5EYAedF1/8BiwoBWJlKRCNgPJcG2/h51dZgDZAT5c0e0Cx66ITwnCr9DsPuGXSKOT
 NgXtgPM6nPKA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 07:50:11 -0700
IronPort-SDR: uf/vHmCE+ok1YNVyZSoY6ISrzpXBE8s/S4V+LovoxYSZ7yId4wM+d7uJjcIRfIhh3b12uUSy/b
 KPJHpbhCZj0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; 
   d="scan'208";a="260847916"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 12 Jun 2020 07:50:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3C547707; Fri, 12 Jun 2020 17:50:07 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 10/13] pinctrl: lynxpoint: Make use of for_each_requested_gpio()
Date:   Fri, 12 Jun 2020 17:50:03 +0300
Message-Id: <20200612145006.9145-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make use of for_each_requested_gpio() instead of home grown analogue.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index a45b8f2182fd..36cc45c013fb 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -919,16 +919,16 @@ static int lp_gpio_runtime_resume(struct device *dev)
 static int lp_gpio_resume(struct device *dev)
 {
 	struct intel_pinctrl *lg = dev_get_drvdata(dev);
+	struct gpio_chip *chip = &lg->chip;
 	void __iomem *reg;
 	int i;
 
 	/* on some hardware suspend clears input sensing, re-enable it here */
-	for (i = 0; i < lg->chip.ngpio; i++) {
-		if (gpiochip_is_requested(&lg->chip, i) != NULL) {
-			reg = lp_gpio_reg(&lg->chip, i, LP_CONFIG2);
-			iowrite32(ioread32(reg) & ~GPINDIS_BIT, reg);
-		}
+	for_each_requested_gpio(chip, i, 0, chip->ngpio) {
+		reg = lp_gpio_reg(chip, i, LP_CONFIG2);
+		iowrite32(ioread32(reg) & ~GPINDIS_BIT, reg);
 	}
+
 	return 0;
 }
 
-- 
2.27.0.rc2

