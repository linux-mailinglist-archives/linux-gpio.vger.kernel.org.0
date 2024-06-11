Return-Path: <linux-gpio+bounces-7348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E52D9037DC
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 11:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B011A1F2551E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 09:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F8017967F;
	Tue, 11 Jun 2024 09:31:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A84176AD1
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718098297; cv=none; b=Vk3ppQpUckbANrH9dBbYvQ53mBEHZ0ekqzSXBnYl+q9Y88E3JtCBGx3zbq9xovoD2lh6HlKdkAH6755vv/4qnBw4DVJvEutIk0FWiBRv3KdBZtlV46HRzJ3MqVYCtUDqLZz6PpQG/NLnilzhjSpkbl3IQdnO+h2h7Jvy2hR/bj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718098297; c=relaxed/simple;
	bh=r7doePq86EZ38NE3zkj+NQ9CQBRt4LK5Y61mChfV55o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lrdH9JBCbgZkEjEqbLx6PmcTkJyjYx8SI56YwvYFPiZPkA+Yq3gYCv+upMj1Hn6CUZ3BVDCHnQpL0rsbCZM04NLVrA4NzA7JkiBBhzpQ74pzQYEddVcpnpIBQhln8ZmRWEBaPXQPh55fmLZjdSBOJc2jI7XQyhQdf571NKpR0vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 646b635b-27d5-11ef-ab0f-005056bdd08f;
	Tue, 11 Jun 2024 12:31:34 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/4] pinctrl: nuvoton: Make use of struct pinfunction and PINCTRL_PINFUNCTION()
Date: Tue, 11 Jun 2024 12:30:23 +0300
Message-ID: <20240611093127.90210-3-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611093127.90210-1-andy.shevchenko@gmail.com>
References: <20240611093127.90210-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Since pin control provides a generic data type and a macro for
the pin function definition, use them in the driver.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 19 ++++++++-----------
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 11 +++--------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 11 +++--------
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 11 +++--------
 4 files changed, 17 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index fb933cddde91..62e877b76a25 100644
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
index 9834a13cf5c9..7c37d2cda9f1 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -829,13 +829,6 @@ static struct pingroup npcm8xx_pingroups[] = {
 
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
@@ -1060,7 +1053,8 @@ NPCM8XX_SFUNC(hgpio6);
 NPCM8XX_SFUNC(hgpio7);
 
 /* Function names */
-static struct npcm8xx_func npcm8xx_funcs[] = {
+static struct pinfunction npcm8xx_funcs[] = {
+#define NPCM8XX_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_SIZE(nm ## _grp))
 	NPCM8XX_MKFUNC(gpi36),
 	NPCM8XX_MKFUNC(gpi35),
 	NPCM8XX_MKFUNC(tp_jtag3),
@@ -1282,6 +1276,7 @@ static struct npcm8xx_func npcm8xx_funcs[] = {
 	NPCM8XX_MKFUNC(hgpio5),
 	NPCM8XX_MKFUNC(hgpio6),
 	NPCM8XX_MKFUNC(hgpio7),
+#undef NPCM8XX_MKFUNC
 };
 
 #define NPCM8XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q) \
diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index cdad4ef11a2f..5cf6d555c5a5 100644
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
2.45.2


