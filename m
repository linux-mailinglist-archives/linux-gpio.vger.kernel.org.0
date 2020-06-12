Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E18191F7A15
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 16:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgFLOuJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 10:50:09 -0400
Received: from mga11.intel.com ([192.55.52.93]:25095 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgFLOuJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 10:50:09 -0400
IronPort-SDR: spPOxYyRrCeBqKqAWH0EdGgTbDj2P/qtxwmXDkJ5FYp7MSJR2Fxz+XS4QS2jzyWPa7erJ3zfzB
 7aPwvT1iZrEg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 07:50:09 -0700
IronPort-SDR: C5ZUExerQQ8YfCIidL6Rdr0ZfAFNZ0eUCGAgpLqasWqrrUmpO9IcQDJay/mzsiZy9jgncmFAbC
 xZPj15AZ6a/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; 
   d="scan'208";a="315147027"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2020 07:50:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0FB3F4C5; Fri, 12 Jun 2020 17:50:07 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 04/13] pinctrl: intel: Get rid of redundant 'else' in intel_config_set_debounce()
Date:   Fri, 12 Jun 2020 17:49:57 +0300
Message-Id: <20200612145006.9145-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In a code like
	if (...) {
		...
		goto label;
	} else {
		...
	}
the 'else' keyword is redundant. Get rid of it for better readability.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index e05273a00ff2..76b1b899a389 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -719,12 +719,12 @@ static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
 		if (v < 3 || v > 15) {
 			ret = -EINVAL;
 			goto exit_unlock;
-		} else {
-			/* Enable glitch filter and debouncer */
-			value0 |= PADCFG0_PREGFRXSEL;
-			value2 |= v << PADCFG2_DEBOUNCE_SHIFT;
-			value2 |= PADCFG2_DEBEN;
 		}
+
+		/* Enable glitch filter and debouncer */
+		value0 |= PADCFG0_PREGFRXSEL;
+		value2 |= v << PADCFG2_DEBOUNCE_SHIFT;
+		value2 |= PADCFG2_DEBEN;
 	}
 
 	writel(value0, padcfg0);
-- 
2.27.0.rc2

