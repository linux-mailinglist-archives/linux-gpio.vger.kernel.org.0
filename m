Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609FA1F5B48
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 20:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbgFJSfw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 14:35:52 -0400
Received: from mga02.intel.com ([134.134.136.20]:40865 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729082AbgFJSfv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 14:35:51 -0400
IronPort-SDR: 2PXuflt/AgvSiMzhV7qDPIp0PCf1HSPCUQBCikqiOCeH8QTjc60IcN3/PK2I4RScPs7V0X9Rs+
 34Knj7q7ZTCQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 11:35:49 -0700
IronPort-SDR: Q/slk/Yd77ehyza/Kdi4M4HnZYd6gvmeNCnUEB0EtoBq/KCmi/vP4wjAJ/Quml5ML42KwSkeoy
 fuIxc4GQZYVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="473439266"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jun 2020 11:35:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 48208707; Wed, 10 Jun 2020 21:35:45 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 10/10] pinctrl: lynxpoint: Make use of for_each_requested_gpio()
Date:   Wed, 10 Jun 2020 21:35:43 +0300
Message-Id: <20200610183543.89414-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
References: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
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

