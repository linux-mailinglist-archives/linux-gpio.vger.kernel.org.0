Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A1C1F5B43
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 20:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729053AbgFJSft (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 14:35:49 -0400
Received: from mga18.intel.com ([134.134.136.126]:43423 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727078AbgFJSfs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 14:35:48 -0400
IronPort-SDR: vY3fGEUhSEpvHSVW3HpJCy7u98fODIZGaYH1a3G1f4Otiymsooq0vwq8s3300ksxka+W9Ss/V8
 dZi1V9DtCtzA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 11:35:47 -0700
IronPort-SDR: zJXuhu4gkDeurRGUEBUTc5905EwsWjID5TYLSp9xvBmj0suru8+3zwDvKlIFB1F9/CElqEq+Ae
 3S5EOrIOgmiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="296329463"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jun 2020 11:35:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0FB1A4C5; Wed, 10 Jun 2020 21:35:45 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 04/10] pinctrl: intel: Split intel_config_get() to three functions
Date:   Wed, 10 Jun 2020 21:35:37 +0300
Message-Id: <20200610183543.89414-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
References: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Split intel_config_get() to three functions, i.e. intel_config_get() and
two helpers intel_config_get_pull() and intel_config_get_debounce() to be
symmetrical with intel_config_set*().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 89 ++++++++++++++++++---------
 1 file changed, 61 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 208299ede9d8..ddbfb6e75a2f 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -521,20 +521,17 @@ static const struct pinmux_ops intel_pinmux_ops = {
 	.gpio_set_direction = intel_gpio_set_direction,
 };
 
-static int intel_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
-			    unsigned long *config)
+static int intel_config_get_pull(struct intel_pinctrl *pctrl, unsigned int pin,
+				 enum pin_config_param param, u32 *arg)
 {
-	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	enum pin_config_param param = pinconf_to_config_param(*config);
 	const struct intel_community *community;
+	void __iomem *padcfg1;
 	u32 value, term;
-	u32 arg = 0;
-
-	if (!intel_pad_owned_by_host(pctrl, pin))
-		return -ENOTSUPP;
 
 	community = intel_get_community(pctrl, pin);
-	value = readl(intel_get_padcfg(pctrl, pin, PADCFG1));
+	padcfg1 = intel_get_padcfg(pctrl, pin, PADCFG1);
+	value = readl(padcfg1);
+
 	term = (value & PADCFG1_TERM_MASK) >> PADCFG1_TERM_SHIFT;
 
 	switch (param) {
@@ -549,16 +546,16 @@ static int intel_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 
 		switch (term) {
 		case PADCFG1_TERM_1K:
-			arg = 1000;
+			*arg = 1000;
 			break;
 		case PADCFG1_TERM_2K:
-			arg = 2000;
+			*arg = 2000;
 			break;
 		case PADCFG1_TERM_5K:
-			arg = 5000;
+			*arg = 5000;
 			break;
 		case PADCFG1_TERM_20K:
-			arg = 20000;
+			*arg = 20000;
 			break;
 		}
 
@@ -572,35 +569,71 @@ static int intel_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		case PADCFG1_TERM_1K:
 			if (!(community->features & PINCTRL_FEATURE_1K_PD))
 				return -EINVAL;
-			arg = 1000;
+			*arg = 1000;
 			break;
 		case PADCFG1_TERM_5K:
-			arg = 5000;
+			*arg = 5000;
 			break;
 		case PADCFG1_TERM_20K:
-			arg = 20000;
+			*arg = 20000;
 			break;
 		}
 
 		break;
 
-	case PIN_CONFIG_INPUT_DEBOUNCE: {
-		void __iomem *padcfg2;
-		u32 v;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
 
-		padcfg2 = intel_get_padcfg(pctrl, pin, PADCFG2);
-		if (!padcfg2)
-			return -ENOTSUPP;
+static int intel_config_get_debounce(struct intel_pinctrl *pctrl, unsigned int pin,
+				     enum pin_config_param param, u32 *arg)
+{
+	void __iomem *padcfg2;
+	unsigned long v;
+	u32 value2;
 
-		v = readl(padcfg2);
-		if (!(v & PADCFG2_DEBEN))
-			return -EINVAL;
+	padcfg2 = intel_get_padcfg(pctrl, pin, PADCFG2);
+	if (!padcfg2)
+		return -ENOTSUPP;
+
+	value2 = readl(padcfg2);
+	if (!(value2 & PADCFG2_DEBEN))
+		return -EINVAL;
+
+	v = (value2 & PADCFG2_DEBOUNCE_MASK) >> PADCFG2_DEBOUNCE_SHIFT;
+	*arg = BIT(v) * DEBOUNCE_PERIOD_NSEC / NSEC_PER_USEC;
+
+	return 0;
+}
+
+static int intel_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
+			    unsigned long *config)
+{
+	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	u32 arg = 0;
+	int ret;
 
-		v = (v & PADCFG2_DEBOUNCE_MASK) >> PADCFG2_DEBOUNCE_SHIFT;
-		arg = BIT(v) * DEBOUNCE_PERIOD_NSEC / NSEC_PER_USEC;
+	if (!intel_pad_owned_by_host(pctrl, pin))
+		return -ENOTSUPP;
 
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		ret = intel_config_get_pull(pctrl, pin, param, &arg);
+		if (ret)
+			return ret;
+		break;
+
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		ret = intel_config_get_debounce(pctrl, pin, param, &arg);
+		if (ret)
+			return ret;
 		break;
-	}
 
 	default:
 		return -ENOTSUPP;
-- 
2.27.0.rc2

