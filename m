Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272391F7A1F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 16:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgFLOuZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 10:50:25 -0400
Received: from mga17.intel.com ([192.55.52.151]:33679 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbgFLOuZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 10:50:25 -0400
IronPort-SDR: VXHGHRcqLSmaiWUtytiSX1IZhOI6WQrYTDFWvXUWL+d3Tf2uITsal5NLdgrvtLhgWO4mgMa8QC
 PIedP8xLJFgg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 07:50:11 -0700
IronPort-SDR: IIrnrbIZG+kolOJyQ0T/dHN5UexnnXB6TuRgQTbrjG8yghbbkXSXeTbl612Cgdi0p3SR/f8Xj/
 6vAwv4OERNRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; 
   d="scan'208";a="448318181"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 12 Jun 2020 07:50:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1D8394B9; Fri, 12 Jun 2020 17:50:07 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 06/13] pinctrl: intel: Split intel_config_get() to three functions
Date:   Fri, 12 Jun 2020 17:49:59 +0300
Message-Id: <20200612145006.9145-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
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
index 2bcda48ea29a..d6ef012f2cc4 100644
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

