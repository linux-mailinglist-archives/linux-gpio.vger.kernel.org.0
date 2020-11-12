Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018202B0D67
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 20:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727199AbgKLTDN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 14:03:13 -0500
Received: from mga07.intel.com ([134.134.136.100]:15111 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726758AbgKLTDM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 14:03:12 -0500
IronPort-SDR: ty6gkxt/RwBwa5F1OzXCLT1H1fwvb6WX+zgzcqGrvHcoGCIxB+lMCsbL2Ez62BqAU1MNXvt1UX
 sOnQACMH9TfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="234523508"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; 
   d="scan'208";a="234523508"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 11:03:05 -0800
IronPort-SDR: h0cDfQf03PE1RIuQI4GqsxwDpo20tuTNAxGmS9ptzNgTd8wRON0qYxILAlPwdibPZ3GzmDQFZC
 q3j6MoPygeww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; 
   d="scan'208";a="309327805"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 12 Nov 2020 11:03:04 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9EA9B14B; Thu, 12 Nov 2020 21:03:01 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: baytrail: Avoid clearing debounce value when turning it off
Date:   Thu, 12 Nov 2020 21:03:01 +0200
Message-Id: <20201112190301.44373-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Baytrail pin control has a common register to set up debounce timeout.
When a pin configuration requested debounce to be disabled, the rest
of the pins may still want to have debounce enabled and thus rely on
the common timeout value. Avoid clearing debounce value when turning
it off for one pin while others may still use it.

Fixes: 658b476c742f ("pinctrl: baytrail: Add debounce configuration")
Depends-on: 04ff5a095d66 ("pinctrl: baytrail: Rectify debounce support")
Depends-on: 827e1579e1d5 ("pinctrl: baytrail: Rectify debounce support (part 2)")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index d49aab3cfbaa..394a421a19d5 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1049,7 +1049,6 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 			break;
 		case PIN_CONFIG_INPUT_DEBOUNCE:
 			debounce = readl(db_reg);
-			debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
 
 			if (arg)
 				conf |= BYT_DEBOUNCE_EN;
@@ -1058,24 +1057,31 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 
 			switch (arg) {
 			case 375:
+				debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
 				debounce |= BYT_DEBOUNCE_PULSE_375US;
 				break;
 			case 750:
+				debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
 				debounce |= BYT_DEBOUNCE_PULSE_750US;
 				break;
 			case 1500:
+				debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
 				debounce |= BYT_DEBOUNCE_PULSE_1500US;
 				break;
 			case 3000:
+				debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
 				debounce |= BYT_DEBOUNCE_PULSE_3MS;
 				break;
 			case 6000:
+				debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
 				debounce |= BYT_DEBOUNCE_PULSE_6MS;
 				break;
 			case 12000:
+				debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
 				debounce |= BYT_DEBOUNCE_PULSE_12MS;
 				break;
 			case 24000:
+				debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
 				debounce |= BYT_DEBOUNCE_PULSE_24MS;
 				break;
 			default:
-- 
2.28.0

