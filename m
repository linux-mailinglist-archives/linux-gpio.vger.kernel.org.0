Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1809F2AEFB6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 12:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgKKLet (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 06:34:49 -0500
Received: from mga02.intel.com ([134.134.136.20]:53386 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725860AbgKKLej (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 06:34:39 -0500
IronPort-SDR: gITF8yDUWsb9eWoFpMNowRHErcOsJ62Dql1C7YFrfLmL3x2N1b3+WdDiIgfNvZrn81lcFjy0jj
 aID98mgIup+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="157141652"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="157141652"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 03:34:36 -0800
IronPort-SDR: GsGg7CCl+WJJHbfwDxq1TwzOu/2aOFAuLQqPPazNHvUm3N8X50zECeBDm92fbax2lY/FbCnz+4
 x/te6x5t/GVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="308796890"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 11 Nov 2020 03:34:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 26420D2; Wed, 11 Nov 2020 13:34:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] pinctrl: lynxpoint: Use defined constant for disabled bias explicitly
Date:   Wed, 11 Nov 2020 13:34:31 +0200
Message-Id: <20201111113432.35641-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We have a specific constant to describe a disabled bias,
i.e. GPIWP_NONE. Use it explicitly instead of making
an assumption about its value.

While at it, move argument assignment to the switch-case
in lp_pin_config_get().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 849979d5d646..2e9670fc479a 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -496,7 +496,7 @@ static int lp_pin_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	unsigned long flags;
 	u32 value, pull;
-	u16 arg = 0;
+	u16 arg;
 
 	raw_spin_lock_irqsave(&lg->lock, flags);
 	value = ioread32(conf2);
@@ -506,8 +506,9 @@ static int lp_pin_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-		if (pull)
+		if (pull != GPIWP_NONE)
 			return -EINVAL;
+		arg = 0;
 		break;
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 		if (pull != GPIWP_DOWN)
@@ -550,6 +551,7 @@ static int lp_pin_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
 			value &= ~GPIWP_MASK;
+			value |= GPIWP_NONE;
 			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
 			value &= ~GPIWP_MASK;
-- 
2.28.0

