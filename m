Return-Path: <linux-gpio+bounces-449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 185FE7F678D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 20:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C91E3281E2D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 19:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131434C626;
	Thu, 23 Nov 2023 19:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQXoEmCB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A871711;
	Thu, 23 Nov 2023 11:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700768072; x=1732304072;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7v2CAg5DroP23VK/yC7/YkMVF79slYQ+EVkLEfbZi+o=;
  b=BQXoEmCBmncSLgJRkglMoQsPviq86QkhoO3F3Jsqr5E3OgYobX3vx2mg
   eqn3176poSSVu12hucYqDTaKbyrcCaZxLxKS0wQJVY3e1xVnlicHgI0yE
   zfj1kJq1JUrwy29JrsiGlU6LovOhXna6p30Rp9Eg1CuqDyFxdyZoRMty8
   Ej1HlY2aA85YNg+k5NyyZ8tWpJQitcZcwq5ir+pRp4RJ1W0dgdI8BoklK
   /2uiEualYsB1AfAIhdUoXEX8QOkIIAYwp5dIvDtEqn0UEakWGp4i/LlCF
   P7y3LSH2vRwCYiLKy7n9+syUmZGeU25vZeL1/wc0JId/aI5QJwhVko0gU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="371671554"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="371671554"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 11:34:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="771062272"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="771062272"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 23 Nov 2023 11:34:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A1209A7A; Thu, 23 Nov 2023 21:33:59 +0200 (EET)
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
Subject: [PATCH v2 20/21] pinctrl: starfive: Convert to use grp member
Date: Thu, 23 Nov 2023 21:31:48 +0200
Message-ID: <20231123193355.3400852-21-andriy.shevchenko@linux.intel.com>
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

Convert drivers to use grp member embedded in struct group_desc.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 8 ++++----
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index ea70b8c61679..21bfbbaede72 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -654,7 +654,7 @@ static int starfive_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	pinmux = group->data;
-	for (i = 0; i < group->num_pins; i++) {
+	for (i = 0; i < group->grp.npins; i++) {
 		u32 v = pinmux[i];
 		unsigned int gpio = starfive_pinmux_to_gpio(v);
 		u32 dout = starfive_pinmux_to_dout(v);
@@ -797,7 +797,7 @@ static int starfive_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (!group)
 		return -EINVAL;
 
-	return starfive_pinconf_get(pctldev, group->pins[0], config);
+	return starfive_pinconf_get(pctldev, group->grp.pins[0], config);
 }
 
 static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
@@ -876,8 +876,8 @@ static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
 		}
 	}
 
-	for (i = 0; i < group->num_pins; i++)
-		starfive_padctl_rmw(sfp, group->pins[i], mask, value);
+	for (i = 0; i < group->grp.npins; i++)
+		starfive_padctl_rmw(sfp, group->grp.pins[i], mask, value);
 
 	return 0;
 }
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 9d71e8c13310..60160965cd29 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -307,7 +307,7 @@ static int jh7110_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	pinmux = group->data;
-	for (i = 0; i < group->num_pins; i++) {
+	for (i = 0; i < group->grp.npins; i++) {
 		u32 v = pinmux[i];
 
 		if (info->jh7110_set_one_pin_mux)
@@ -437,7 +437,7 @@ static int jh7110_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (!group)
 		return -EINVAL;
 
-	return jh7110_pinconf_get(pctldev, group->pins[0], config);
+	return jh7110_pinconf_get(pctldev, group->grp.pins[0], config);
 }
 
 static int jh7110_pinconf_group_set(struct pinctrl_dev *pctldev,
@@ -508,8 +508,8 @@ static int jh7110_pinconf_group_set(struct pinctrl_dev *pctldev,
 		}
 	}
 
-	for (i = 0; i < group->num_pins; i++)
-		jh7110_padcfg_rmw(sfp, group->pins[i], mask, value);
+	for (i = 0; i < group->grp.npins; i++)
+		jh7110_padcfg_rmw(sfp, group->grp.pins[i], mask, value);
 
 	return 0;
 }
-- 
2.43.0.rc1.1.gbec44491f096


