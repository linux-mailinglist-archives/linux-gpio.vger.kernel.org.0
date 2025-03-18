Return-Path: <linux-gpio+bounces-17730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEE9A671F6
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 12:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85405422A80
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 11:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DB1208989;
	Tue, 18 Mar 2025 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lb+U290F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9636C208983;
	Tue, 18 Mar 2025 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742295587; cv=none; b=SIkSxN9TrtI0ifXpfQHfYSe4X6V5IhXUgPseyC/D21Vlt9wqy3q+Mf83w+W0U4pLoyzxA7sYdwMO2tNU5PqyYZZltghuKVxdGRlbXMV/n7nuElCCsO7/WWDc81k9480TmqUzKHt0J6MVqZDc3e1K8tpqxBPWCkdC0WJ35o8NuJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742295587; c=relaxed/simple;
	bh=K4Qh71+6FN2E5vhhDAN+lN9a5M2tg0WGTdBTyy5owTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KyG5/ZPz9xNxsxW8hEJeDq1ChmoOVk7YYIb/1enoCtCGxQ7cI1WsAF21KVkGtlTpxKdvgfdI+uzAq2ISKASxGLOhxqYqSlbPb4MAzxLoQqdLa69l1ZlMnRlt3zWimCq1NAPc4NbN4KV0raTbgYlJwDU+m6yhY8sH3f6fHz06U6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lb+U290F; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295581; x=1773831581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K4Qh71+6FN2E5vhhDAN+lN9a5M2tg0WGTdBTyy5owTw=;
  b=lb+U290FNd+YdTi9hAPuKalQnof9OvfyziZRUGuPAj4hxKfRuZuyIxCC
   mHLzZK3C+7aZonkZNMqDUU9G1Tp25quiJtzaTv5jMexF35LogMU94V92I
   6StFdX1DAS/G2h4DHKLlXW8j+pqM0PDTSEI/fNegMAv/moGEZKamzQNlU
   WN+OdkpF+9bV931TTajkJga9Pp2umQ7AuuzVVfEcwrB4JLqSh5xUytZ0o
   ldTPU+ezPpxudGmCiC3xhj2CiidU/R861PkYz/g9ZoXeGe47uau8TcvtX
   DTlIGtkqND5VQOP8AuIB+EWgVIQmMNe2aemah1nDVjjLprLipXZEfATtC
   g==;
X-CSE-ConnectionGUID: sPbHKIstRI6S8LXbw0TGtA==
X-CSE-MsgGUID: heJpxlWvQw+v920yt0sQVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="68781749"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="68781749"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:59:38 -0700
X-CSE-ConnectionGUID: 9KcpTX+ET7aels/yNDL6uw==
X-CSE-MsgGUID: TcQmfDf+TDiUMxf/WRhAPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="153215699"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2025 03:59:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1026A5DC; Tue, 18 Mar 2025 12:59:34 +0200 (EET)
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
Subject: [PATCH v2 4/5] pinctrl: nuvoton: Convert to use struct group_desc
Date: Tue, 18 Mar 2025 12:57:17 +0200
Message-ID: <20250318105932.2090926-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pin control core header provides struct group_desc.
Utilize it instead of open coded variants in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 70 ++++++++++++--------------
 1 file changed, 33 insertions(+), 37 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index ad4f9ca414c8..da3c8d8e3eb3 100644
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
 	new_map = kcalloc(map_num, sizeof(*new_map), GFP_KERNEL);
 	if (!new_map)
 		return -ENOMEM;
@@ -223,17 +217,19 @@ static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
 	if (!parent)
 		return -EINVAL;
 
+	setting = grp->data;
+
 	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
 	new_map[0].data.mux.function = parent->name;
 	new_map[0].data.mux.group = np->name;
 	of_node_put(parent);
 
 	new_map++;
-	for (i = 0; i < grp->npins; i++) {
+	for (i = 0; i < grp->grp.npins; i++) {
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
@@ -281,14 +277,14 @@ static int ma35_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int selecto
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
 
-	for (i = 0; i < grp->npins; i++) {
+	for (i = 0; i < grp->grp.npins; i++) {
 		regmap_read(npctl->regmap, setting->offset, &regval);
 		regval &= ~GENMASK(setting->shift + MA35_MFP_BITS_PER_PORT - 1,
 				   setting->shift);
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
2.47.2


