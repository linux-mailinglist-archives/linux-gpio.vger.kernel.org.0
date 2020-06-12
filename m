Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18D11F7A1E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 16:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgFLOuY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 10:50:24 -0400
Received: from mga17.intel.com ([192.55.52.151]:33679 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbgFLOuY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 10:50:24 -0400
IronPort-SDR: I85QUxSOIEtLl6xKKMFQtJHJvDnAouuLee6mgfwTORwwV3c3oY5e3EffR+A2QNoEPPrOR9Y2WC
 aO4N2FUxwhPQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 07:50:10 -0700
IronPort-SDR: UhKpb/P19du3e3o4mcB/Y9LKZLOR7Ms38tmT8GCfQJfUwM6VrYpZZpH3Hut1U2MuKGmigTnu8a
 17UH+fUt2Zww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; 
   d="scan'208";a="474228494"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 12 Jun 2020 07:50:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 16B554D9; Fri, 12 Jun 2020 17:50:07 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 05/13] pinctrl: intel: Drop the only label in the code for consistency
Date:   Fri, 12 Jun 2020 17:49:58 +0300
Message-Id: <20200612145006.9145-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Drop the only label in the code, i.e. in intel_config_set_debounce(),
for consistency with the rest. In entire driver we use multipoint
return.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 76b1b899a389..2bcda48ea29a 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -695,7 +695,6 @@ static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
 	void __iomem *padcfg0, *padcfg2;
 	unsigned long flags;
 	u32 value0, value2;
-	int ret = 0;
 
 	padcfg2 = intel_get_padcfg(pctrl, pin, PADCFG2);
 	if (!padcfg2)
@@ -717,8 +716,8 @@ static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
 
 		v = order_base_2(debounce * NSEC_PER_USEC / DEBOUNCE_PERIOD_NSEC);
 		if (v < 3 || v > 15) {
-			ret = -EINVAL;
-			goto exit_unlock;
+			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+			return -EINVAL;
 		}
 
 		/* Enable glitch filter and debouncer */
@@ -730,10 +729,9 @@ static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
 	writel(value0, padcfg0);
 	writel(value2, padcfg2);
 
-exit_unlock:
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
-	return ret;
+	return 0;
 }
 
 static int intel_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
-- 
2.27.0.rc2

