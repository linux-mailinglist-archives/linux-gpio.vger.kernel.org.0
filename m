Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B8C1F9BAB
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 17:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730887AbgFOPOY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 11:14:24 -0400
Received: from mga12.intel.com ([192.55.52.136]:22778 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730766AbgFOPOY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 11:14:24 -0400
IronPort-SDR: dQmQA3qipNcfi5/dVgfBZrFjp9MygJAiAdT4dbZBG8laX7MWI5OwY4eBigPYXkd1g8KzYO1QwW
 ERXn8NfVVibw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 08:13:58 -0700
IronPort-SDR: ljMyKzglMfQSmg3cYz4N2grfNdLl6ajTbXtqDqpPfWTMZjrUlbqxmICCWXmaFuo8xz9xSgouxt
 ddUHjVULmriQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,515,1583222400"; 
   d="scan'208";a="276590679"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 15 Jun 2020 08:13:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 09FEC795; Mon, 15 Jun 2020 18:13:56 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 2/3] pinctrl: lynxpoint: Make use of for_each_requested_gpio()
Date:   Mon, 15 Jun 2020 18:13:52 +0300
Message-Id: <20200615151353.88194-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615151353.88194-1-andriy.shevchenko@linux.intel.com>
References: <20200615151353.88194-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make use of for_each_requested_gpio() instead of home grown analogue.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index a45b8f2182fd..2a3af998b91c 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -919,16 +919,17 @@ static int lp_gpio_runtime_resume(struct device *dev)
 static int lp_gpio_resume(struct device *dev)
 {
 	struct intel_pinctrl *lg = dev_get_drvdata(dev);
+	struct gpio_chip *chip = &lg->chip;
+	const char *dummy;
 	void __iomem *reg;
 	int i;
 
 	/* on some hardware suspend clears input sensing, re-enable it here */
-	for (i = 0; i < lg->chip.ngpio; i++) {
-		if (gpiochip_is_requested(&lg->chip, i) != NULL) {
-			reg = lp_gpio_reg(&lg->chip, i, LP_CONFIG2);
-			iowrite32(ioread32(reg) & ~GPINDIS_BIT, reg);
-		}
+	for_each_requested_gpio(chip, i, dummy) {
+		reg = lp_gpio_reg(chip, i, LP_CONFIG2);
+		iowrite32(ioread32(reg) & ~GPINDIS_BIT, reg);
 	}
+
 	return 0;
 }
 
-- 
2.27.0.rc2

