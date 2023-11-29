Return-Path: <linux-gpio+bounces-720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3EF7FDC9F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 17:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60F2E1C20964
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 16:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9903A285;
	Wed, 29 Nov 2023 16:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdJyb+ZD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378511708;
	Wed, 29 Nov 2023 08:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701274533; x=1732810533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZXNseCzCX59DRyElbG0P8ucEc1mUIlOwlzrkpPXSCdM=;
  b=TdJyb+ZD3MTWJK+4akcQ8FUp4BSG80bhHW/E8IreVq7pGRlw8yH4hBfC
   dzmYgEriI+U9qqE1u0/O8xE22gFwB3fk/TsCqouv4wY8o2Lc9vUM3RPdA
   jJU8ubzGb6tXtlH4ja0uJR7KxQnL12/bX+UPgQaqlOauuh9YNuonwGvS5
   Kd5K4fiurtosGNVjms+n/cIiM/EzOQYAIF9feEawhEl5ssKDdmRajdwOY
   qFGFaGlrxE1UPEVNszmLj8IaF/EOtAH7Ecsjbl0fI8Z+5MxrE+YvRGZUG
   j5extuemQlUe0j2pkBlsUt6IXnFe6jlbZQ3ft2IVmFDXr9dVPYbjgBFTZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373372818"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="373372818"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:15:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892498904"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="892498904"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 29 Nov 2023 08:15:21 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2567FB66; Wed, 29 Nov 2023 18:15:02 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v4 16/23] pinctrl: imx: Convert to use grp member
Date: Wed, 29 Nov 2023 18:06:39 +0200
Message-ID: <20231129161459.1002323-17-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert drivers to use grp member embedded in struct group_desc.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 31 +++++++++++--------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 28164b04b1be..2d3d80921c0d 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -42,7 +42,7 @@ static inline const struct group_desc *imx_pinctrl_find_group_by_name(
 
 	for (i = 0; i < pctldev->num_groups; i++) {
 		grp = pinctrl_generic_get_group(pctldev, i);
-		if (grp && !strcmp(grp->name, name))
+		if (grp && !strcmp(grp->grp.name, name))
 			break;
 	}
 
@@ -79,9 +79,9 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	if (info->flags & IMX_USE_SCU) {
-		map_num += grp->num_pins;
+		map_num += grp->grp.npins;
 	} else {
-		for (i = 0; i < grp->num_pins; i++) {
+		for (i = 0; i < grp->grp.npins; i++) {
 			pin = &((struct imx_pin *)(grp->data))[i];
 			if (!(pin->conf.mmio.config & IMX_NO_PAD_CTL))
 				map_num++;
@@ -109,7 +109,7 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	/* create config map */
 	new_map++;
-	for (i = j = 0; i < grp->num_pins; i++) {
+	for (i = j = 0; i < grp->grp.npins; i++) {
 		pin = &((struct imx_pin *)(grp->data))[i];
 
 		/*
@@ -263,10 +263,10 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	if (!func)
 		return -EINVAL;
 
-	npins = grp->num_pins;
+	npins = grp->grp.npins;
 
 	dev_dbg(ipctl->dev, "enable function %s group %s\n",
-		func->name, grp->name);
+		func->name, grp->grp.name);
 
 	for (i = 0; i < npins; i++) {
 		/*
@@ -423,7 +423,7 @@ static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 	if (!grp)
 		return;
 
-	for (i = 0; i < grp->num_pins; i++) {
+	for (i = 0; i < grp->grp.npins; i++) {
 		struct imx_pin *pin = &((struct imx_pin *)(grp->data))[i];
 
 		name = pin_get_name(pctldev, pin->pin);
@@ -526,7 +526,7 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 		pin_size = FSL_PIN_SIZE;
 
 	/* Initialise group */
-	grp->name = np->name;
+	grp->grp.name = np->name;
 
 	/*
 	 * the binding format is fsl,pins = <PIN_FUNC_ID CONFIG ...>,
@@ -554,19 +554,17 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 		return -EINVAL;
 	}
 
-	grp->num_pins = size / pin_size;
-	grp->data = devm_kcalloc(ipctl->dev,
-				 grp->num_pins, sizeof(struct imx_pin),
-				 GFP_KERNEL);
+	grp->grp.npins = size / pin_size;
+	grp->data = devm_kcalloc(ipctl->dev, grp->grp.npins, sizeof(*pin), GFP_KERNEL);
 	if (!grp->data)
 		return -ENOMEM;
 
-	pins = devm_kcalloc(ipctl->dev, grp->num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(ipctl->dev, grp->grp.npins, sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
-	grp->pins = pins;
+	grp->grp.pins = pins;
 
-	for (i = 0; i < grp->num_pins; i++) {
+	for (i = 0; i < grp->grp.npins; i++) {
 		pin = &((struct imx_pin *)(grp->data))[i];
 		if (info->flags & IMX_USE_SCU)
 			info->imx_pinctrl_parse_pin(ipctl, &pins[i], pin, &list);
@@ -613,8 +611,7 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 
 	i = 0;
 	for_each_child_of_node(np, child) {
-		grp = devm_kzalloc(ipctl->dev, sizeof(struct group_desc),
-				   GFP_KERNEL);
+		grp = devm_kzalloc(ipctl->dev, sizeof(*grp), GFP_KERNEL);
 		if (!grp) {
 			of_node_put(child);
 			return -ENOMEM;
-- 
2.43.0.rc1.1.gbec44491f096


