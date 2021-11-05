Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646D044637E
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 13:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232647AbhKEMqF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 08:46:05 -0400
Received: from mga09.intel.com ([134.134.136.24]:28683 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232711AbhKEMpw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 08:45:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="231734445"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="231734445"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 05:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="579644683"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Nov 2021 05:43:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BD5078A2; Fri,  5 Nov 2021 14:43:01 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v1 14/19] pinctrl: st: Use temporary variable for struct device
Date:   Fri,  5 Nov 2021 14:42:37 +0200
Message-Id: <20211105124242.27288-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use temporary variable for struct device to make code neater.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-st.c | 73 +++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index ae8783b34ed2..f592e9ad93fc 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -814,26 +814,25 @@ static int st_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 {
 	struct st_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	const struct st_pctl_group *grp;
+	struct device *dev = info->dev;
 	struct pinctrl_map *new_map;
 	struct device_node *parent;
 	int map_num, i;
 
 	grp = st_pctl_find_group_by_name(info, np->name);
 	if (!grp) {
-		dev_err(info->dev, "unable to find group for node %pOFn\n",
-			np);
+		dev_err(dev, "unable to find group for node %pOFn\n", np);
 		return -EINVAL;
 	}
 
 	map_num = grp->npins + 1;
-	new_map = devm_kcalloc(pctldev->dev,
-				map_num, sizeof(*new_map), GFP_KERNEL);
+	new_map = devm_kcalloc(dev, map_num, sizeof(*new_map), GFP_KERNEL);
 	if (!new_map)
 		return -ENOMEM;
 
 	parent = of_get_parent(np);
 	if (!parent) {
-		devm_kfree(pctldev->dev, new_map);
+		devm_kfree(dev, new_map);
 		return -EINVAL;
 	}
 
@@ -853,7 +852,7 @@ static int st_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		new_map[i].data.configs.configs = &grp->pin_conf[i].config;
 		new_map[i].data.configs.num_configs = 1;
 	}
-	dev_info(pctldev->dev, "maps: function %s group %s num %d\n",
+	dev_info(dev, "maps: function %s group %s num %d\n",
 		(*map)->data.mux.function, grp->name, map_num);
 
 	return 0;
@@ -1173,6 +1172,7 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 	/* bank pad direction val altfunction */
 	const __be32 *list;
 	struct property *pp;
+	struct device *dev = info->dev;
 	struct st_pinconf *conf;
 	struct device_node *pins;
 	int i = 0, npins = 0, nr_props, ret = 0;
@@ -1197,9 +1197,8 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 
 	grp->npins = npins;
 	grp->name = np->name;
-	grp->pins = devm_kcalloc(info->dev, npins, sizeof(u32), GFP_KERNEL);
-	grp->pin_conf = devm_kcalloc(info->dev,
-					npins, sizeof(*conf), GFP_KERNEL);
+	grp->pins = devm_kcalloc(dev, npins, sizeof(*grp->pins), GFP_KERNEL);
+	grp->pin_conf = devm_kcalloc(dev, npins, sizeof(*grp->pin_conf), GFP_KERNEL);
 
 	if (!grp->pins || !grp->pin_conf) {
 		ret = -ENOMEM;
@@ -1247,6 +1246,7 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 static int st_pctl_parse_functions(struct device_node *np,
 			struct st_pinctrl *info, u32 index, int *grp_index)
 {
+	struct device *dev = info->dev;
 	struct device_node *child;
 	struct st_pmx_func *func;
 	struct st_pctl_group *grp;
@@ -1256,11 +1256,10 @@ static int st_pctl_parse_functions(struct device_node *np,
 	func->name = np->name;
 	func->ngroups = of_get_child_count(np);
 	if (func->ngroups == 0) {
-		dev_err(info->dev, "No groups defined\n");
+		dev_err(dev, "No groups defined\n");
 		return -EINVAL;
 	}
-	func->groups = devm_kcalloc(info->dev,
-			func->ngroups, sizeof(char *), GFP_KERNEL);
+	func->groups = devm_kcalloc(dev, func->ngroups, sizeof(*func->groups), GFP_KERNEL);
 	if (!func->groups)
 		return -ENOMEM;
 
@@ -1275,8 +1274,7 @@ static int st_pctl_parse_functions(struct device_node *np,
 			return ret;
 		}
 	}
-	dev_info(info->dev, "Function[%d\t name:%s,\tgroups:%d]\n",
-				index, func->name, func->ngroups);
+	dev_info(dev, "Function[%d\t name:%s,\tgroups:%d]\n", index, func->name, func->ngroups);
 
 	return 0;
 }
@@ -1577,10 +1575,11 @@ static const struct of_device_id st_pctl_of_match[] = {
 static int st_pctl_probe_dt(struct platform_device *pdev,
 	struct pinctrl_desc *pctl_desc, struct st_pinctrl *info)
 {
+	struct device *dev = &pdev->dev;
 	int ret = 0;
 	int i = 0, j = 0, k = 0, bank;
 	struct pinctrl_pin_desc *pdesc;
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = dev->of_node;
 	struct device_node *child;
 	int grp_index = 0;
 	int irq = 0;
@@ -1588,30 +1587,26 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 
 	st_pctl_dt_child_count(info, np);
 	if (!info->nbanks) {
-		dev_err(&pdev->dev, "you need at least one gpio bank\n");
+		dev_err(dev, "you need at least one gpio bank\n");
 		return -EINVAL;
 	}
 
-	dev_info(&pdev->dev, "nbanks = %d\n", info->nbanks);
-	dev_info(&pdev->dev, "nfunctions = %d\n", info->nfunctions);
-	dev_info(&pdev->dev, "ngroups = %d\n", info->ngroups);
+	dev_info(dev, "nbanks = %d\n", info->nbanks);
+	dev_info(dev, "nfunctions = %d\n", info->nfunctions);
+	dev_info(dev, "ngroups = %d\n", info->ngroups);
 
-	info->functions = devm_kcalloc(&pdev->dev,
-		info->nfunctions, sizeof(*info->functions), GFP_KERNEL);
+	info->functions = devm_kcalloc(dev, info->nfunctions, sizeof(*info->functions), GFP_KERNEL);
 
-	info->groups = devm_kcalloc(&pdev->dev,
-			info->ngroups, sizeof(*info->groups),
-			GFP_KERNEL);
+	info->groups = devm_kcalloc(dev, info->ngroups, sizeof(*info->groups), GFP_KERNEL);
 
-	info->banks = devm_kcalloc(&pdev->dev,
-			info->nbanks, sizeof(*info->banks), GFP_KERNEL);
+	info->banks = devm_kcalloc(dev, info->nbanks, sizeof(*info->banks), GFP_KERNEL);
 
 	if (!info->functions || !info->groups || !info->banks)
 		return -ENOMEM;
 
 	info->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
 	if (IS_ERR(info->regmap)) {
-		dev_err(info->dev, "No syscfg phandle specified\n");
+		dev_err(dev, "No syscfg phandle specified\n");
 		return PTR_ERR(info->regmap);
 	}
 	info->data = of_match_node(st_pctl_of_match, np)->data;
@@ -1621,7 +1616,7 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 	if (irq > 0) {
 		res = platform_get_resource_byname(pdev,
 					IORESOURCE_MEM, "irqmux");
-		info->irqmux_base = devm_ioremap_resource(&pdev->dev, res);
+		info->irqmux_base = devm_ioremap_resource(dev, res);
 
 		if (IS_ERR(info->irqmux_base))
 			return PTR_ERR(info->irqmux_base);
@@ -1632,8 +1627,7 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 	}
 
 	pctl_desc->npins = info->nbanks * ST_GPIO_PINS_PER_BANK;
-	pdesc =	devm_kcalloc(&pdev->dev,
-			pctl_desc->npins, sizeof(*pdesc), GFP_KERNEL);
+	pdesc =	devm_kcalloc(dev, pctl_desc->npins, sizeof(*pdesc), GFP_KERNEL);
 	if (!pdesc)
 		return -ENOMEM;
 
@@ -1663,7 +1657,7 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 			ret = st_pctl_parse_functions(child, info,
 							i++, &grp_index);
 			if (ret) {
-				dev_err(&pdev->dev, "No functions found.\n");
+				dev_err(dev, "No functions found.\n");
 				of_node_put(child);
 				return ret;
 			}
@@ -1675,24 +1669,25 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 
 static int st_pctl_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct st_pinctrl *info;
 	struct pinctrl_desc *pctl_desc;
 	int ret, i;
 
-	if (!pdev->dev.of_node) {
-		dev_err(&pdev->dev, "device node not found.\n");
+	if (!dev->of_node) {
+		dev_err(dev, "device node not found.\n");
 		return -EINVAL;
 	}
 
-	pctl_desc = devm_kzalloc(&pdev->dev, sizeof(*pctl_desc), GFP_KERNEL);
+	pctl_desc = devm_kzalloc(dev, sizeof(*pctl_desc), GFP_KERNEL);
 	if (!pctl_desc)
 		return -ENOMEM;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
-	info->dev = &pdev->dev;
+	info->dev = dev;
 	platform_set_drvdata(pdev, info);
 	ret = st_pctl_probe_dt(pdev, pctl_desc, info);
 	if (ret)
@@ -1702,11 +1697,11 @@ static int st_pctl_probe(struct platform_device *pdev)
 	pctl_desc->pctlops	= &st_pctlops;
 	pctl_desc->pmxops	= &st_pmxops;
 	pctl_desc->confops	= &st_confops;
-	pctl_desc->name		= dev_name(&pdev->dev);
+	pctl_desc->name		= dev_name(dev);
 
-	info->pctl = devm_pinctrl_register(&pdev->dev, pctl_desc, info);
+	info->pctl = devm_pinctrl_register(dev, pctl_desc, info);
 	if (IS_ERR(info->pctl)) {
-		dev_err(&pdev->dev, "Failed pinctrl registration\n");
+		dev_err(dev, "Failed pinctrl registration\n");
 		return PTR_ERR(info->pctl);
 	}
 
-- 
2.33.0

