Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE361F9BA8
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 17:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730711AbgFOPOA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 11:14:00 -0400
Received: from mga04.intel.com ([192.55.52.120]:25575 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730777AbgFOPN7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 11:13:59 -0400
IronPort-SDR: Vaez4Aow5y9PWAQsVU6190/YINOHKZ/s6cwUhfRXCmbrwuDafQLzHS2pfs+OeWMtoP3hoIMLst
 wq6J9rtvbRgg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 08:13:58 -0700
IronPort-SDR: 0Sp7ykDBAXTXRafkdW0PU/RU8iin7Ji35sRbW25osyFneBds/E9FNqKUvsIDY4fQsDqFMwmrDV
 O6RXvJ+leCGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,515,1583222400"; 
   d="scan'208";a="261814715"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 15 Jun 2020 08:13:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 10CDD8CA; Mon, 15 Jun 2020 18:13:56 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 3/3] pinctrl: lynxpoint: Introduce helpers to enable or disable input
Date:   Mon, 15 Jun 2020 18:13:53 +0300
Message-Id: <20200615151353.88194-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615151353.88194-1-andriy.shevchenko@linux.intel.com>
References: <20200615151353.88194-1-andriy.shevchenko@linux.intel.com>
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
index 2a3af998b91c..003d795528e8 100644
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
 
@@ -921,14 +931,11 @@ static int lp_gpio_resume(struct device *dev)
 	struct intel_pinctrl *lg = dev_get_drvdata(dev);
 	struct gpio_chip *chip = &lg->chip;
 	const char *dummy;
-	void __iomem *reg;
 	int i;
 
 	/* on some hardware suspend clears input sensing, re-enable it here */
-	for_each_requested_gpio(chip, i, dummy) {
-		reg = lp_gpio_reg(chip, i, LP_CONFIG2);
-		iowrite32(ioread32(reg) & ~GPINDIS_BIT, reg);
-	}
+	for_each_requested_gpio(chip, i, dummy)
+		lp_gpio_enable_input(lp_gpio_reg(chip, i, LP_CONFIG2));
 
 	return 0;
 }
-- 
2.27.0.rc2

