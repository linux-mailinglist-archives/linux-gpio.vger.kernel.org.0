Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D868A1F5B47
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 20:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbgFJSfv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 14:35:51 -0400
Received: from mga02.intel.com ([134.134.136.20]:40865 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729070AbgFJSfu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 14:35:50 -0400
IronPort-SDR: Cu65W85AXnA8CKdKwnV/yQVrN3oQOY309F89G1AqlcOM/deKwxU04RRGUHR/DjzS7sKHefbmb9
 XmADQO5QYnXA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 11:35:49 -0700
IronPort-SDR: d/rA+j1/WIxMPF2Bpjf3O1bBNGedY6sszR7MA0+YVkO/kL3A1oVIcep431hhHBQGUVdeyiKxZ9
 O6uO0R2FqRdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="473439262"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jun 2020 11:35:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 24E8D574; Wed, 10 Jun 2020 21:35:45 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 06/10] pinctrl: intel: Drop the only label in the code for consistency
Date:   Wed, 10 Jun 2020 21:35:39 +0300
Message-Id: <20200610183543.89414-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
References: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
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
index 4ce76fa3363f..bb940dc4e1d2 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -728,7 +728,6 @@ static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
 	void __iomem *padcfg0, *padcfg2;
 	unsigned long flags;
 	u32 value0, value2;
-	int ret = 0;
 
 	padcfg2 = intel_get_padcfg(pctrl, pin, PADCFG2);
 	if (!padcfg2)
@@ -750,8 +749,8 @@ static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
 
 		v = order_base_2(debounce * NSEC_PER_USEC / DEBOUNCE_PERIOD_NSEC);
 		if (v < 3 || v > 15) {
-			ret = -EINVAL;
-			goto exit_unlock;
+			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+			return -EINVAL;
 		}
 
 		/* Enable glitch filter and debouncer */
@@ -763,10 +762,9 @@ static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
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

