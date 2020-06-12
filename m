Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D175A1F7A19
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 16:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgFLOuM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 10:50:12 -0400
Received: from mga02.intel.com ([134.134.136.20]:34514 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbgFLOuL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 10:50:11 -0400
IronPort-SDR: GKENu66X51azRWqxWNF2wHsFaU/ITe30x+VQj+dWoteVc1huJOPtF1ORxpcuNmsRwJyNN68jiP
 MrPipAxfn0/Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 07:50:11 -0700
IronPort-SDR: qnYl8jfapr6TV9NvUPGvx3bNRDLqDX+FqtT0R83jq6UbE7u0QIsuZP/TurJ6FjnerrHDV3uTGH
 cAGvpNZ/OKpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; 
   d="scan'208";a="259896457"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jun 2020 07:50:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4398487F; Fri, 12 Jun 2020 17:50:07 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 11/13] pinctrl: lynxpoint: Introduce helpers to enable or disable input
Date:   Fri, 12 Jun 2020 17:50:04 +0300
Message-Id: <20200612145006.9145-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduce couple of helpers to enable or disable input. i.e.
lp_gpio_enable_input() and lp_gpio_disable_input().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 36cc45c013fb..6f1641833665 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -386,6 +386,16 @@ static int lp_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static void lp_gpio_enable_input(void __iomem *reg)
+{
+	iowrite32(ioread32(reg) & ~GPINDIS_BIT, reg);
+}
+
+static void lp_gpio_disable_input(void __iomem *reg)
+{
+	iowrite32(ioread32(reg) | GPINDIS_BIT, reg);
+}
+
 static int lp_gpio_request_enable(struct pinctrl_dev *pctldev,
 				  struct pinctrl_gpio_range *range,
 				  unsigned int pin)
@@ -411,7 +421,7 @@ static int lp_gpio_request_enable(struct pinctrl_dev *pctldev,
 	}
 
 	/* Enable input sensing */
-	iowrite32(ioread32(conf2) & ~GPINDIS_BIT, conf2);
+	lp_gpio_enable_input(conf2);
 
 	raw_spin_unlock_irqrestore(&lg->lock, flags);
 
@@ -429,7 +439,7 @@ static void lp_gpio_disable_free(struct pinctrl_dev *pctldev,
 	raw_spin_lock_irqsave(&lg->lock, flags);
 
 	/* Disable input sensing */
-	iowrite32(ioread32(conf2) | GPINDIS_BIT, conf2);
+	lp_gpio_disable_input(conf2);
 
 	raw_spin_unlock_irqrestore(&lg->lock, flags);
 
@@ -920,14 +930,11 @@ static int lp_gpio_resume(struct device *dev)
 {
 	struct intel_pinctrl *lg = dev_get_drvdata(dev);
 	struct gpio_chip *chip = &lg->chip;
-	void __iomem *reg;
 	int i;
 
 	/* on some hardware suspend clears input sensing, re-enable it here */
-	for_each_requested_gpio(chip, i, 0, chip->ngpio) {
-		reg = lp_gpio_reg(chip, i, LP_CONFIG2);
-		iowrite32(ioread32(reg) & ~GPINDIS_BIT, reg);
-	}
+	for_each_requested_gpio(chip, i, 0, chip->ngpio)
+		lp_gpio_enable_input(lp_gpio_reg(&lg->chip, i, LP_CONFIG2));
 
 	return 0;
 }
-- 
2.27.0.rc2

