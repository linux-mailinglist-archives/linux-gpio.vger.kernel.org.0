Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99811F5B40
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 20:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729058AbgFJSfs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 14:35:48 -0400
Received: from mga17.intel.com ([192.55.52.151]:48393 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727078AbgFJSfr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 14:35:47 -0400
IronPort-SDR: QYSBDTTYuOFFEb8xCW8qDS7F1BwoPj6SCkZT22sJXGLDh/+pE3TBrteKWL/5IIJWKcYzmO1/tD
 GkhXnp/usagA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 11:35:48 -0700
IronPort-SDR: 3UHqALNOT85lbd64XcBZC5L1Xvnf2YDPzparPSgIEvYOZicgIyBzVF7X+szEv/CWDkQzftg8Ot
 JWS5dqWpWVWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="306698736"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2020 11:35:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 155954B9; Wed, 10 Jun 2020 21:35:45 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 05/10] pinctrl: intel: Get rid of redundant 'else' in intel_config_set_debounce()
Date:   Wed, 10 Jun 2020 21:35:38 +0300
Message-Id: <20200610183543.89414-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
References: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
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
index ddbfb6e75a2f..4ce76fa3363f 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -752,12 +752,12 @@ static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
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

