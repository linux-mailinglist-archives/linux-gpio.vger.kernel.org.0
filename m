Return-Path: <linux-gpio+bounces-17729-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA2CA671ED
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 11:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 777AB3ACF03
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 10:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A739920899C;
	Tue, 18 Mar 2025 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FaVsVSxz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0B6208986;
	Tue, 18 Mar 2025 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742295581; cv=none; b=Lm3OuSn42n0RQPpJopdt4K5hW8gL+J4jzNPRkwYheqTWU31EGTB1iHbS6Z6vwve7OMBsee7qZQqfBMWTlMS7YufVZbkZqj4FSoJp6ttje+aD6TGKtq0Dl1HNM4g7D0wPm/p3Mnw+U+5YW8pnugxuWKoJFlF7ItxmJFOUCal85bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742295581; c=relaxed/simple;
	bh=aXsahCvO2KYQIW3IfJ3vGR9arA9mwP0c7xLGGryhCno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ulrjDuckaY8c+GwW4CUGXRsbmHkQrGVCWhiUJ7YTWKv7HE+IaeHlTcYbZzE/Cv821cX8YrQVP8jjgLpNNMYcYOQJl+4s4CIr+wnZ9MAiQc/MfclUx8nV7fIIbbrOk/P7A/d3MWhGJtRj0kuQ25Zaa+i+SlWQC/PkmkNqpP8v6aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FaVsVSxz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295580; x=1773831580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aXsahCvO2KYQIW3IfJ3vGR9arA9mwP0c7xLGGryhCno=;
  b=FaVsVSxzYd6GErET74EajAHOs7hydnVi802Q+cx9o2GTtkOXUV3VdhbS
   1bPVCqrOPrzpK+PvbLOo+zlRfQIDmF98eA7dLpF7K78MP3VfWFSwH5Mbs
   XOAzR0gVB3/T/2LSYEvsRfq7vfaYyqHU1wi/tKub72onlGrJcGok6DmYq
   dVe7T73mNAq47nFyEuTU4Ca1CogTUm6fMlkx9/DZ3qjhCzicMFVVEyV6g
   cHad9BRGa3FyqaJPP7rLwsNZWp5gYHk7Zyt8/jolfT3sJK3uy+eKNTVld
   JnUDSpE260wEWU4tqu7chsLCMx3sA5HGP+walfBa65Wl4Pu+vgDrLUGub
   A==;
X-CSE-ConnectionGUID: BV4eAbRxSIuFFqzuwdkRAw==
X-CSE-MsgGUID: MPbzJVfFSombRZ9Z7IRVUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="60959396"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="60959396"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:59:39 -0700
X-CSE-ConnectionGUID: 7sgIk1i0SGCfXDhHYH+nLg==
X-CSE-MsgGUID: ATtY5SUDR1+3aksE20WR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="127322155"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 18 Mar 2025 03:59:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 03AB32FC; Tue, 18 Mar 2025 12:59:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 3/5] pinctrl: nuvoton: Make use of struct pinfunction and PINCTRL_PINFUNCTION()
Date: Tue, 18 Mar 2025 12:57:16 +0200
Message-ID: <20250318105932.2090926-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since pin control provides a generic data type and a macro for
the pin function definition, use them in the driver.

Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 19 ++++++++-----------
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 11 +++--------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 11 +++--------
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 11 +++--------
 4 files changed, 17 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index 59c4e7c6cdde..ad4f9ca414c8 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -98,12 +98,6 @@ static const u32 ds_3300mv_tbl[] = {
 	17100, 25600, 34100, 42800, 48000, 56000, 77000, 82000,
 };
 
-struct ma35_pin_func {
-	const char		*name;
-	const char		**groups;
-	u32			ngroups;
-};
-
 struct ma35_pin_setting {
 	u32			offset;
 	u32			shift;
@@ -149,7 +143,7 @@ struct ma35_pinctrl {
 	struct regmap		*regmap;
 	struct ma35_pin_group	*groups;
 	unsigned int		ngroups;
-	struct ma35_pin_func	*functions;
+	struct pinfunction	*functions;
 	unsigned int		nfunctions;
 };
 
@@ -1041,9 +1035,10 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 					u32 index)
 {
 	struct device_node *child;
-	struct ma35_pin_func *func;
+	struct pinfunction *func;
 	struct ma35_pin_group *grp;
 	static u32 grp_index;
+	const char **groups;
 	u32 ret, i = 0;
 
 	dev_dbg(npctl->dev, "parse function(%d): %s\n", index, np->name);
@@ -1055,12 +1050,12 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 	if (func->ngroups <= 0)
 		return 0;
 
-	func->groups = devm_kcalloc(npctl->dev, func->ngroups, sizeof(char *), GFP_KERNEL);
-	if (!func->groups)
+	groups = devm_kcalloc(npctl->dev, func->ngroups, sizeof(*groups), GFP_KERNEL);
+	if (!groups)
 		return -ENOMEM;
 
 	for_each_child_of_node(np, child) {
-		func->groups[i] = child->name;
+		groups[i] = child->name;
 		grp = &npctl->groups[grp_index++];
 		ret = ma35_pinctrl_parse_groups(child, grp, npctl, i++);
 		if (ret) {
@@ -1068,6 +1063,8 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 			return ret;
 		}
 	}
+
+	func->groups = groups;
 	return 0;
 }
 
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 2601aacfb976..c6b11a198c76 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -639,13 +639,6 @@ static struct pingroup npcm7xx_groups[] = {
 
 #define NPCM7XX_SFUNC(a) NPCM7XX_FUNC(a, #a)
 #define NPCM7XX_FUNC(a, b...) static const char *a ## _grp[] = { b }
-#define NPCM7XX_MKFUNC(nm) { .name = #nm, .ngroups = ARRAY_SIZE(nm ## _grp), \
-			.groups = nm ## _grp }
-struct npcm7xx_func {
-	const char *name;
-	const unsigned int ngroups;
-	const char *const *groups;
-};
 
 NPCM7XX_SFUNC(smb0);
 NPCM7XX_SFUNC(smb0b);
@@ -764,7 +757,8 @@ NPCM7XX_SFUNC(lkgpo2);
 NPCM7XX_SFUNC(nprd_smi);
 
 /* Function names */
-static struct npcm7xx_func npcm7xx_funcs[] = {
+static struct pinfunction npcm7xx_funcs[] = {
+#define NPCM7XX_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_SIZE(nm ## _grp))
 	NPCM7XX_MKFUNC(smb0),
 	NPCM7XX_MKFUNC(smb0b),
 	NPCM7XX_MKFUNC(smb0c),
@@ -880,6 +874,7 @@ static struct npcm7xx_func npcm7xx_funcs[] = {
 	NPCM7XX_MKFUNC(lkgpo1),
 	NPCM7XX_MKFUNC(lkgpo2),
 	NPCM7XX_MKFUNC(nprd_smi),
+#undef NPCM7XX_MKFUNC
 };
 
 #define NPCM7XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k) \
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index eac43315a360..62347a82282d 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -826,13 +826,6 @@ static struct pingroup npcm8xx_pingroups[] = {
 
 #define NPCM8XX_SFUNC(a) NPCM8XX_FUNC(a, #a)
 #define NPCM8XX_FUNC(a, b...) static const char *a ## _grp[] = { b }
-#define NPCM8XX_MKFUNC(nm) { .name = #nm, .ngroups = ARRAY_SIZE(nm ## _grp), \
-			.groups = nm ## _grp }
-struct npcm8xx_func {
-	const char *name;
-	const unsigned int ngroups;
-	const char *const *groups;
-};
 
 NPCM8XX_SFUNC(gpi36);
 NPCM8XX_SFUNC(gpi35);
@@ -1055,7 +1048,8 @@ NPCM8XX_SFUNC(hgpio6);
 NPCM8XX_SFUNC(hgpio7);
 
 /* Function names */
-static struct npcm8xx_func npcm8xx_funcs[] = {
+static struct pinfunction npcm8xx_funcs[] = {
+#define NPCM8XX_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_SIZE(nm ## _grp))
 	NPCM8XX_MKFUNC(gpi36),
 	NPCM8XX_MKFUNC(gpi35),
 	NPCM8XX_MKFUNC(tp_jtag3),
@@ -1275,6 +1269,7 @@ static struct npcm8xx_func npcm8xx_funcs[] = {
 	NPCM8XX_MKFUNC(hgpio5),
 	NPCM8XX_MKFUNC(hgpio6),
 	NPCM8XX_MKFUNC(hgpio7),
+#undef NPCM8XX_MKFUNC
 };
 
 #define NPCM8XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q) \
diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 2f97accef837..4264ca749175 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -482,13 +482,6 @@ static const struct pingroup wpcm450_groups[] = {
 
 #define WPCM450_SFUNC(a) WPCM450_FUNC(a, #a)
 #define WPCM450_FUNC(a, b...) static const char *a ## _grp[] = { b }
-#define WPCM450_MKFUNC(nm) { .name = #nm, .ngroups = ARRAY_SIZE(nm ## _grp), \
-			.groups = nm ## _grp }
-struct wpcm450_func {
-	const char *name;
-	const unsigned int ngroups;
-	const char *const *groups;
-};
 
 WPCM450_SFUNC(smb3);
 WPCM450_SFUNC(smb4);
@@ -555,7 +548,8 @@ WPCM450_FUNC(gpio, WPCM450_GRPS);
 #undef WPCM450_GRP
 
 /* Function names */
-static struct wpcm450_func wpcm450_funcs[] = {
+static struct pinfunction wpcm450_funcs[] = {
+#define WPCM450_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_SIZE(nm ## _grp))
 	WPCM450_MKFUNC(smb3),
 	WPCM450_MKFUNC(smb4),
 	WPCM450_MKFUNC(smb5),
@@ -616,6 +610,7 @@ static struct wpcm450_func wpcm450_funcs[] = {
 	WPCM450_MKFUNC(hg6),
 	WPCM450_MKFUNC(hg7),
 	WPCM450_MKFUNC(gpio),
+#undef WPCM450_MKFUNC
 };
 
 #define WPCM450_PINCFG(a, b, c, d, e, f, g) \
-- 
2.47.2


