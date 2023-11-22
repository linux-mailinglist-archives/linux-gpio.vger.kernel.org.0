Return-Path: <linux-gpio+bounces-376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5617F4EB8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 18:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D556B20C6D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 17:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876F0584FC;
	Wed, 22 Nov 2023 17:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dt1nCoaK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8BF1B5;
	Wed, 22 Nov 2023 09:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700675463; x=1732211463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KXXlj/feskp9/q4ZNOgI6jch8e71Hk8LNA1Dtwk+8Og=;
  b=dt1nCoaKabQohQU4TdbjY9vaQ3JaNO7s/FglXN6MlHlbvHzPaHRZr3jY
   1VayefjeGG2y2pUBpQYmJWeeRADx0b202INF5xkcNkI60ApiZmvO3rcOg
   G5aSEpomIimPUyGT9oO6xS/Tju7pSpSDm/ivKpJSU7T4zWvrgbLon/b/L
   Bs9paSv2qzszJZ4RmQCTZRJN7p1GziS71UzZJcBEC+t8LbDkEIOOIrkmO
   IGOkDpKmuJRTom3R++L9dA+Dv6pKuKSxmoc3hFk2EapN6MWW54ZoV51Hu
   2z4Kfn1d1rqfgt88D7IO8ZdH3erp7U2fS7vnAeLeet+U26qyOZBUbF88Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458606562"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="458606562"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 09:51:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="910912309"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="910912309"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2023 09:50:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EF72F291; Wed, 22 Nov 2023 19:50:54 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 2/4] pinctrl: baytrail: Factor out byt_gpio_force_input_mode()
Date: Wed, 22 Nov 2023 19:50:37 +0200
Message-ID: <20231122175039.2289945-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231122175039.2289945-1-andriy.shevchenko@linux.intel.com>
References: <20231122175039.2289945-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a piece of code that it being used at least twice.
Factor it out.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 42 ++++++++++++------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index f1af21dbd5fb..291f0454257b 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -829,6 +829,24 @@ static int byt_set_pull_strength(u32 *reg, u16 strength)
 	return 0;
 }
 
+static void byt_gpio_force_input_mode(struct intel_pinctrl *vg, unsigned int offset)
+{
+	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
+	u32 value;
+
+	value = readl(reg);
+	if (!(value & BYT_INPUT_EN))
+		return;
+
+	/*
+	 * Pull assignment is only applicable in input mode. If
+	 * chip is not in input mode, set it and warn about it.
+	 */
+	value &= ~BYT_INPUT_EN;
+	writel(value, reg);
+	dev_warn(vg->dev, "Pin %i: forcibly set to input mode\n", offset);
+}
+
 static int byt_pin_config_get(struct pinctrl_dev *pctl_dev, unsigned int offset,
 			      unsigned long *config)
 {
@@ -919,9 +937,8 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 {
 	struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctl_dev);
 	void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
-	void __iomem *val_reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
 	void __iomem *db_reg = byt_gpio_reg(vg, offset, BYT_DEBOUNCE_REG);
-	u32 conf, val, db_pulse, debounce;
+	u32 conf, db_pulse, debounce;
 	enum pin_config_param param;
 	unsigned long flags;
 	int i, ret = 0;
@@ -930,7 +947,6 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 	raw_spin_lock_irqsave(&byt_lock, flags);
 
 	conf = readl(conf_reg);
-	val = readl(val_reg);
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
@@ -945,15 +961,7 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 			if (arg == 1)
 				arg = 2000;
 
-			/*
-			 * Pull assignment is only applicable in input mode. If
-			 * chip is not in input mode, set it and warn about it.
-			 */
-			if (val & BYT_INPUT_EN) {
-				val &= ~BYT_INPUT_EN;
-				writel(val, val_reg);
-				dev_warn(vg->dev, "Pin %i: forcibly set to input mode\n", offset);
-			}
+			byt_gpio_force_input_mode(vg, offset);
 
 			conf &= ~BYT_PULL_ASSIGN_MASK;
 			conf |= BYT_PULL_ASSIGN_DOWN;
@@ -965,15 +973,7 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 			if (arg == 1)
 				arg = 2000;
 
-			/*
-			 * Pull assignment is only applicable in input mode. If
-			 * chip is not in input mode, set it and warn about it.
-			 */
-			if (val & BYT_INPUT_EN) {
-				val &= ~BYT_INPUT_EN;
-				writel(val, val_reg);
-				dev_warn(vg->dev, "Pin %i: forcibly set to input mode\n", offset);
-			}
+			byt_gpio_force_input_mode(vg, offset);
 
 			conf &= ~BYT_PULL_ASSIGN_MASK;
 			conf |= BYT_PULL_ASSIGN_UP;
-- 
2.43.0.rc1.1.gbec44491f096


