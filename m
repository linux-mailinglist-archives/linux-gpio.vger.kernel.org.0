Return-Path: <linux-gpio+bounces-430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B741F7F6735
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 20:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E80351C21008
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 19:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581694C63F;
	Thu, 23 Nov 2023 19:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcV5Eg1c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0576384;
	Thu, 23 Nov 2023 11:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700768049; x=1732304049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cro7IHIecIo02j6c7iYOhKh81yiulS+fo6g+HwOWxo8=;
  b=lcV5Eg1cMz1aql4O2dKM2TP/vE2OxcOtBL3rN4PhiuEdJ1Hq0v43Eo+y
   +41UaneCNWcS7t95FobM8CDmvxmOC1wpJEdoBpZ0xtonednRZ8Iwq2mcy
   FUQl846K7oJnZiV0qkaPY0GxGznXSGaEwhXtLyJenS5i8lbx6o3L6nty+
   a99NQHbkyq+lxqjLBV0xWCqzy/WpZM94Js4QQGJfB0yWOn6sG1Xn2aQx/
   NSEZmKAlHe76VICL/dGMRwTz+S/GafTi/fqorICSJ9wqYuiIcuuuEwU8L
   wqyjBds5whAt3x1Nw+t0C2J4s6bCIEKeQ0AdskUEG7mbx6l81TAxmFlke
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372482076"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="372482076"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 11:34:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833506147"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="833506147"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 23 Nov 2023 11:33:59 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B843A38C; Thu, 23 Nov 2023 21:33:58 +0200 (EET)
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
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v2 04/21] pinctrl: imx: Use temporary variable to hold pins
Date: Thu, 23 Nov 2023 21:31:32 +0200
Message-ID: <20231123193355.3400852-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
References: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pins are allocated from the heap, but in order to pass
them as constant object, we need to use non-constant pointer.
Achieve this by using a temporary variable.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9bc16943014f..9099a7c81d4a 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -513,6 +513,7 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 	struct imx_pin *pin;
 	int size, pin_size;
 	const __be32 *list;
+	int *pins;
 	int i;
 
 	dev_dbg(ipctl->dev, "group(%d): %pOFn\n", index, np);
@@ -557,20 +558,20 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 	grp->data = devm_kcalloc(ipctl->dev,
 				 grp->num_pins, sizeof(struct imx_pin),
 				 GFP_KERNEL);
-	grp->pins = devm_kcalloc(ipctl->dev,
-				 grp->num_pins, sizeof(unsigned int),
-				 GFP_KERNEL);
-	if (!grp->pins || !grp->data)
+	if (!grp->data)
 		return -ENOMEM;
 
+	pins = devm_kcalloc(ipctl->dev, grp->num_pins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+	grp->pins = pins;
+
 	for (i = 0; i < grp->num_pins; i++) {
 		pin = &((struct imx_pin *)(grp->data))[i];
 		if (info->flags & IMX_USE_SCU)
-			info->imx_pinctrl_parse_pin(ipctl, &grp->pins[i],
-						  pin, &list);
+			info->imx_pinctrl_parse_pin(ipctl, &pins[i], pin, &list);
 		else
-			imx_pinctrl_parse_pin_mmio(ipctl, &grp->pins[i],
-						   pin, &list, np);
+			imx_pinctrl_parse_pin_mmio(ipctl, &pins[i], pin, &list, np);
 	}
 
 	return 0;
-- 
2.43.0.rc1.1.gbec44491f096


