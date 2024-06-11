Return-Path: <linux-gpio+bounces-7349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA1A9037DE
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 11:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41D8D1C23519
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 09:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3134917A93C;
	Tue, 11 Jun 2024 09:31:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151B01779AB
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718098299; cv=none; b=NpceOHrXRogRzf8H4A0jcHFj+sFBlV6xnexAU0rttZ5gAnU1fgv3vDahLGRlcTCqqlLHPiUz1NYmYzuLlsNpHXSwXMoJ97a6BgPNvULVsLstpqXtOvDUv50VQjvy16CBtSm8pxg9HaUX88ZemsSTAh1AGsxs3gS8v5VzsoxZPUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718098299; c=relaxed/simple;
	bh=FC2Kl+hbpeiZTZFGRoCBKZ3Bw50AAGllg4iHaBq5Tm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOhYj19SI7cvDx8ExrDp2UsqpRIkb1S2RjszlPbvrnIypjMhkfhpo2LHTfkOqT+f3SuqTi7JUk3eR69SvSdw+G70OH8wOASkiGuCJRR7x31+yZhesTPi0pqlUjZlAhTE9z5ToSb71pj5+PoYCF/WgZzEn/Y0u2s6dInQCUCCIGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 6519693c-27d5-11ef-8d69-005056bd6ce9;
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
Subject: [PATCH v1 3/4] pinctrl: nuvoton: Convert to use struct group_desc
Date: Tue, 11 Jun 2024 12:30:24 +0300
Message-ID: <20240611093127.90210-4-andy.shevchenko@gmail.com>
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

The pin control core header provides struct group_desc.
Utilize it instead of open coded variants in the driver.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 66 ++++++++++++--------------
 1 file changed, 31 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index 62e877b76a25..7c2b0039d1e4 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -106,13 +106,6 @@ struct ma35_pin_setting {
 	unsigned int		nconfigs;
 };
 
-struct ma35_pin_group {
-	const char		*name;
-	unsigned int		npins;
-	unsigned int		*pins;
-	struct ma35_pin_setting	*settings;
-};
-
 struct ma35_pin_bank {
 	void __iomem		*reg_base;
 	struct clk		*clk;
@@ -141,7 +134,7 @@ struct ma35_pinctrl {
 	struct pinctrl_dev	*pctl;
 	const struct ma35_pinctrl_soc_info *info;
 	struct regmap		*regmap;
-	struct ma35_pin_group	*groups;
+	struct group_desc	*groups;
 	unsigned int		ngroups;
 	struct pinfunction	*functions;
 	unsigned int		nfunctions;
@@ -160,7 +153,7 @@ static const char *ma35_get_group_name(struct pinctrl_dev *pctldev, unsigned int
 {
 	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
 
-	return npctl->groups[selector].name;
+	return npctl->groups[selector].grp.name;
 }
 
 static int ma35_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
@@ -171,19 +164,19 @@ static int ma35_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selecto
 	if (selector >= npctl->ngroups)
 		return -EINVAL;
 
-	*pins = npctl->groups[selector].pins;
-	*npins = npctl->groups[selector].npins;
+	*pins = npctl->groups[selector].grp.pins;
+	*npins = npctl->groups[selector].grp.npins;
 
 	return 0;
 }
 
-static struct ma35_pin_group *ma35_pinctrl_find_group_by_name(
-			      const struct ma35_pinctrl *npctl, const char *name)
+static struct group_desc *
+ma35_pinctrl_find_group_by_name(const struct ma35_pinctrl *npctl, const char *name)
 {
 	int i;
 
 	for (i = 0; i < npctl->ngroups; i++) {
-		if (!strcmp(npctl->groups[i].name, name))
+		if (!strcmp(npctl->groups[i].grp.name, name))
 			return &npctl->groups[i];
 	}
 	return NULL;
@@ -195,9 +188,10 @@ static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
 					    unsigned int *num_maps)
 {
 	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
-	struct ma35_pin_group *grp;
+	struct ma35_pin_setting *setting;
 	struct pinctrl_map *new_map;
 	struct device_node *parent;
+	struct group_desc *grp;
 	int map_num = 1;
 	int i;
 
@@ -211,7 +205,7 @@ static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 
-	map_num += grp->npins;
+	map_num += grp->grp.npins;
 	new_map = devm_kcalloc(pctldev->dev, map_num, sizeof(*new_map), GFP_KERNEL);
 	if (!new_map)
 		return -ENOMEM;
@@ -223,6 +217,8 @@ static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
 	if (!parent)
 		return -EINVAL;
 
+	setting = grp->data;
+
 	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
 	new_map[0].data.mux.function = parent->name;
 	new_map[0].data.mux.group = np->name;
@@ -231,9 +227,9 @@ static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
 	new_map++;
 	for (i = 0; i < grp->npins; i++) {
 		new_map[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
-		new_map[i].data.configs.group_or_pin = pin_get_name(pctldev, grp->pins[i]);
-		new_map[i].data.configs.configs = grp->settings[i].configs;
-		new_map[i].data.configs.num_configs = grp->settings[i].nconfigs;
+		new_map[i].data.configs.group_or_pin = pin_get_name(pctldev, grp->grp.pins[i]);
+		new_map[i].data.configs.configs = setting[i].configs;
+		new_map[i].data.configs.num_configs = setting[i].nconfigs;
 	}
 	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
 		(*map)->data.mux.function, (*map)->data.mux.group, map_num);
@@ -281,12 +277,12 @@ static int ma35_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int selecto
 			       unsigned int group)
 {
 	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
-	struct ma35_pin_group *grp = &npctl->groups[group];
-	struct ma35_pin_setting *setting = grp->settings;
+	struct group_desc *grp = &npctl->groups[group];
+	struct ma35_pin_setting *setting = grp->data;
 	u32 i, regval;
 
 	dev_dbg(npctl->dev, "enable function %s group %s\n",
-		npctl->functions[selector].name, npctl->groups[group].name);
+		npctl->functions[selector].name, grp->grp.name);
 
 	for (i = 0; i < grp->npins; i++) {
 		regmap_read(npctl->regmap, setting->offset, &regval);
@@ -980,17 +976,16 @@ static const struct pinconf_ops ma35_pinconf_ops = {
 	.is_generic = true,
 };
 
-static int ma35_pinctrl_parse_groups(struct device_node *np, struct ma35_pin_group *grp,
+static int ma35_pinctrl_parse_groups(struct device_node *np, struct group_desc *grp,
 				     struct ma35_pinctrl *npctl, u32 index)
 {
 	struct ma35_pin_setting *pin;
 	unsigned long *configs;
 	unsigned int nconfigs;
+	unsigned int *pins;
 	int i, j, count, ret;
 	u32 *elems;
 
-	grp->name = np->name;
-
 	ret = pinconf_generic_parse_dt_config(np, NULL, &configs, &nconfigs);
 	if (ret)
 		return ret;
@@ -1003,21 +998,22 @@ static int ma35_pinctrl_parse_groups(struct device_node *np, struct ma35_pin_gro
 	if (!elems)
 		return -ENOMEM;
 
+	grp->grp.name = np->name;
+
 	ret = of_property_read_u32_array(np, "nuvoton,pins", elems, count);
 	if (ret)
 		return -EINVAL;
+	grp->grp.npins = count / 3;
 
-	grp->npins = count / 3;
-
-	grp->pins = devm_kcalloc(npctl->dev, grp->npins, sizeof(*grp->pins), GFP_KERNEL);
-	if (!grp->pins)
+	pins = devm_kcalloc(npctl->dev, grp->grp.npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
 		return -ENOMEM;
+	grp->grp.pins = pins;
 
-	grp->settings = devm_kcalloc(npctl->dev, grp->npins, sizeof(*grp->settings), GFP_KERNEL);
-	if (!grp->settings)
+	pin = devm_kcalloc(npctl->dev, grp->grp.npins, sizeof(*pin), GFP_KERNEL);
+	if (!pin)
 		return -ENOMEM;
-
-	pin = grp->settings;
+	grp->data = pin;
 
 	for (i = 0, j = 0; i < count; i += 3, j++) {
 		pin->offset = elems[i] * MA35_MFP_REG_SZ_PER_BANK + MA35_MFP_REG_BASE;
@@ -1025,7 +1021,7 @@ static int ma35_pinctrl_parse_groups(struct device_node *np, struct ma35_pin_gro
 		pin->muxval = elems[i + 2];
 		pin->configs = configs;
 		pin->nconfigs = nconfigs;
-		grp->pins[j] = npctl->info->get_pin_num(pin->offset, pin->shift);
+		pins[j] = npctl->info->get_pin_num(pin->offset, pin->shift);
 		pin++;
 	}
 	return 0;
@@ -1036,7 +1032,7 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 {
 	struct device_node *child;
 	struct pinfunction *func;
-	struct ma35_pin_group *grp;
+	struct group_desc *grp;
 	static u32 grp_index;
 	const char **groups;
 	u32 ret, i = 0;
-- 
2.45.2


