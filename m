Return-Path: <linux-gpio+bounces-29615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 883D3CC28B7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 13:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEE1D307A852
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 11:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E18B350A03;
	Tue, 16 Dec 2025 11:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ENLkM34D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m15597.qiye.163.com (mail-m15597.qiye.163.com [101.71.155.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47043502BF;
	Tue, 16 Dec 2025 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765886194; cv=none; b=KcydxeF1o+pAcP+7rnICUzQ+lGFwbqO8cM4HsfVVJbxy8GCUv0YBk657hiv6VONbUL+0YvvA1AUOZMNpngGqzhSCKmfJGX8lYQ0ZRQgc4fHyA/2lYRZBt4FkTuIaYlB5CAo7H5OaGnZjPTGISM7IKJhQPwbUqnUkM51HzOyt9ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765886194; c=relaxed/simple;
	bh=0yEG9FdE7o9EPp30M3u1vfPwISprP/MKrXWm6roxNm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k953UiSjwi2bdx3QSWDrTiTjIBpMbpr+dPlEbdUqjjva+Os7qyqcYIjHyi33Yg+XJdu55DckhS134ajCSX7Ae3VPbHm7m/4QStHZGt1KdRLJeTAtHIL7WQricEUArEcWQbKtHTozdqwq8PiaLTjKzw5P/G6tqK5wL/+bGmRR1/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ENLkM34D; arc=none smtp.client-ip=101.71.155.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d6ee1fa4;
	Tue, 16 Dec 2025 19:21:03 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v3 7/7] pinctrl: rockchip: add rmio support
Date: Tue, 16 Dec 2025 19:20:53 +0800
Message-Id: <20251216112053.1927852-8-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b26e46e3909d8kunm7ab62e1d2a7b435
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh1JHVZPTB0aGkxMTk1KGkJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ENLkM34DDZZcIrbJI4xBuZHaYatYVX1t4Bl9Zs8Vccg+farMvQQ9hYqpJpj5aWlCotIm9KL+XWyEOyNZzx5zdosmBrBP8/XsmwPtfJsqQChKX5id3clSfnUQbqfHvUSm3p8xg21OFW08H/m0j3lVyD3LZ5wRJh9KtjpdIP2nKTI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=JMsY/6xUIYg72FO9i8/WKAtOJS3xupDI20CcO/zF1Uo=;
	h=date:mime-version:subject:message-id:from;

Support Rockchip Matrix IO(RMIO), which can be configured with registers
to route arbitrary signals from low-speed IP, such as UART/I2C, to the
selected IO PAD.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 401 ++++++++++++++++++++++++++++-
 drivers/pinctrl/pinctrl-rockchip.h |  42 +++
 2 files changed, 442 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index dc7ef12dfcb0..cfd8117ab460 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3961,6 +3961,11 @@ static const struct of_device_id rockchip_bank_match[] = {
 	{},
 };
 
+static const struct of_device_id rockchip_rmio_dt_match[] = {
+	{ .compatible = "rockchip,rmio" },
+	{},
+};
+
 static void rockchip_pinctrl_child_count(struct rockchip_pinctrl *info,
 						struct device_node *np)
 {
@@ -3969,6 +3974,8 @@ static void rockchip_pinctrl_child_count(struct rockchip_pinctrl *info,
 	for_each_child_of_node(np, child) {
 		if (of_match_node(rockchip_bank_match, child))
 			continue;
+		if (of_match_node(rockchip_rmio_dt_match, child))
+			continue;
 
 		info->nfunctions++;
 		info->ngroups += of_get_child_count(child);
@@ -4101,6 +4108,8 @@ static int rockchip_pinctrl_parse_dt(struct platform_device *pdev,
 	for_each_child_of_node_scoped(np, child) {
 		if (of_match_node(rockchip_bank_match, child))
 			continue;
+		if (of_match_node(rockchip_rmio_dt_match, child))
+			continue;
 
 		ret = rockchip_pinctrl_parse_functions(child, info, i++);
 		if (ret) {
@@ -4431,6 +4440,388 @@ static void rockchip_pinctrl_remove(struct platform_device *pdev)
 	}
 }
 
+static int rockchip_rmio_set_mux(struct rockchip_rmio *info, int id, int func)
+{
+	struct device *dev = info->dev;
+
+	if (id >= info->nr_pins)
+		return -EINVAL;
+
+	dev_dbg(dev, "setting function of %s%d to %d\n", dev_name(dev), id, func);
+
+	return regmap_write(info->regmap, info->offset + id * 4,
+			    RK_RMIO_WRITE_ENABLE_MASK | func);
+}
+
+static int rockchip_rmio_parse_groups(struct device_node *np,
+				      struct rockchip_rmio_group *grp,
+				      struct rockchip_rmio *info,
+				      u32 index)
+{
+	struct device *dev = info->dev;
+	int count;
+	u32 *tmp;
+	int i;
+
+	dev_dbg(dev, "group(%d): %pOFn\n", index, np);
+
+	/*
+	 * the binding format is rockchip,rmio = <pin func>,
+	 * do sanity check and calculate pins number
+	 */
+	count = of_property_count_u32_elems(np, "rockchip,rmio");
+	if (count <= 0 || count % 2 != 0)
+		return -EINVAL;
+
+	tmp = kcalloc(count, sizeof(u32), GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	of_property_read_u32_array(np, "rockchip,rmio", tmp, count);
+
+	/* Initialise group */
+	grp->name = np->name;
+	grp->npins = count / 2;
+	grp->pins = devm_kcalloc(dev, grp->npins, sizeof(*grp->pins), GFP_KERNEL);
+	grp->func = devm_kcalloc(dev, grp->npins, sizeof(*grp->func), GFP_KERNEL);
+	if (!grp->pins || !grp->func) {
+		kfree(tmp);
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < grp->npins; i++) {
+		grp->pins[i] = tmp[2 * i];
+		grp->func[i] = tmp[2 * i + 1];
+	}
+	kfree(tmp);
+
+	return 0;
+}
+
+static int rockchip_rmio_parse_functions(struct device_node *np,
+					 struct rockchip_rmio *info,
+					 u32 index)
+{
+	struct device *dev = info->dev;
+	struct device_node *child;
+	struct rockchip_rmio_func *func;
+	struct rockchip_rmio_group *grp;
+	int ret;
+	u32 i, grp_index = 0;
+
+	dev_dbg(dev, "parse function(%d): %pOFn\n", index, np);
+
+	for (i = 0, func = info->functions; i < index; i++, func++)
+		grp_index += func->ngroups;
+
+	func = &info->functions[index];
+
+	/* Initialise function */
+	func->name = np->name;
+	func->ngroups = of_get_child_count(np);
+	if (func->ngroups <= 0)
+		return 0;
+
+	func->groups = devm_kcalloc(dev, func->ngroups, sizeof(*func->groups), GFP_KERNEL);
+	if (!func->groups)
+		return -ENOMEM;
+
+	i = 0;
+	for_each_child_of_node(np, child) {
+		func->groups[i] = child->name;
+		grp = &info->groups[grp_index + i];
+		ret = rockchip_rmio_parse_groups(child, grp, info, i++);
+		if (ret) {
+			of_node_put(child);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int rockchip_rmio_parse_dt(struct platform_device *pdev,
+				  struct rockchip_rmio *info)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *child;
+	int ret;
+	int i = 0;
+
+	for_each_child_of_node(np, child) {
+		info->nfunctions++;
+		info->ngroups += of_get_child_count(child);
+	}
+
+	dev_dbg(dev, "nfunctions = %d\n", info->nfunctions);
+	dev_dbg(dev, "ngroups = %d\n", info->ngroups);
+
+	info->functions = devm_kcalloc(dev, info->nfunctions, sizeof(*info->functions), GFP_KERNEL);
+	if (!info->functions)
+		return -ENOMEM;
+
+	info->groups = devm_kcalloc(dev, info->ngroups, sizeof(*info->groups), GFP_KERNEL);
+	if (!info->groups)
+		return -ENOMEM;
+
+	for_each_child_of_node(np, child) {
+		ret = rockchip_rmio_parse_functions(child, info, i++);
+		if (ret) {
+			dev_err(dev, "failed to parse function, ret = %d\n", ret);
+			of_node_put(child);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int rockchip_rmio_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct rockchip_rmio *info = pinctrl_dev_get_drvdata(pctldev);
+
+	return info->ngroups;
+}
+
+static const char *rockchip_rmio_get_group_name(struct pinctrl_dev *pctldev,
+						unsigned int selector)
+{
+	struct rockchip_rmio *info = pinctrl_dev_get_drvdata(pctldev);
+
+	return info->groups[selector].name;
+}
+
+static int rockchip_rmio_get_group_pins(struct pinctrl_dev *pctldev,
+					unsigned int selector,
+					const unsigned int **pins,
+					unsigned int *npins)
+{
+	struct rockchip_rmio *info = pinctrl_dev_get_drvdata(pctldev);
+
+	if (selector >= info->ngroups)
+		return -EINVAL;
+
+	*pins = info->groups[selector].pins;
+	*npins = info->groups[selector].npins;
+
+	return 0;
+}
+
+static int rockchip_rmio_dt_node_to_map(struct pinctrl_dev *pctldev,
+					struct device_node *np,
+					struct pinctrl_map **map,
+					unsigned int *num_maps)
+{
+	struct rockchip_rmio *info = pinctrl_dev_get_drvdata(pctldev);
+	struct device *dev = info->dev;
+	struct pinctrl_map *new_map;
+	struct device_node *parent;
+
+	parent = of_get_parent(np);
+	if (!parent)
+		return -EINVAL;
+
+	/* the rmio only need to create mux map */
+	new_map = kzalloc(sizeof(*new_map), GFP_KERNEL);
+	if (!new_map) {
+		of_node_put(parent);
+		return -ENOMEM;
+	}
+
+	*map = new_map;
+	*num_maps = 1;
+
+	/* the rmio only need to create mux map */
+	new_map->type = PIN_MAP_TYPE_MUX_GROUP;
+	new_map->data.mux.function = parent->name;
+	new_map->data.mux.group = np->name;
+	of_node_put(parent);
+
+	dev_dbg(dev, "maps: function %s group %s\n",
+		(*map)->data.mux.function, (*map)->data.mux.group);
+
+	return 0;
+}
+
+static void rockchip_rmio_dt_free_map(struct pinctrl_dev *pctldev,
+				      struct pinctrl_map *map,
+				      unsigned int num_maps)
+{
+	kfree(map);
+}
+
+static const struct pinctrl_ops rockchip_rmio_pctrl_ops = {
+	.get_groups_count	= rockchip_rmio_get_groups_count,
+	.get_group_name		= rockchip_rmio_get_group_name,
+	.get_group_pins		= rockchip_rmio_get_group_pins,
+	.dt_node_to_map		= rockchip_rmio_dt_node_to_map,
+	.dt_free_map		= rockchip_rmio_dt_free_map,
+};
+
+static int rockchip_rmio_get_funcs_count(struct pinctrl_dev *pctldev)
+{
+	struct rockchip_rmio *info = pinctrl_dev_get_drvdata(pctldev);
+
+	return info->nfunctions;
+}
+
+static const char *rockchip_rmio_get_func_name(struct pinctrl_dev *pctldev,
+					       unsigned int selector)
+{
+	struct rockchip_rmio *info = pinctrl_dev_get_drvdata(pctldev);
+
+	return info->functions[selector].name;
+}
+
+static int rockchip_rmio_get_groups(struct pinctrl_dev *pctldev,
+				    unsigned int selector,
+				    const char * const **groups,
+				    unsigned int * const num_groups)
+{
+	struct rockchip_rmio *info = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = info->functions[selector].groups;
+	*num_groups = info->functions[selector].ngroups;
+
+	return 0;
+}
+
+static int rockchip_rmio_pmx_set(struct pinctrl_dev *pctldev,
+				 unsigned int selector,
+				 unsigned int group)
+{
+	struct rockchip_rmio *info = pinctrl_dev_get_drvdata(pctldev);
+	const unsigned int *pins = info->groups[group].pins;
+	const unsigned int *func = info->groups[group].func;
+	struct device *dev = info->dev;
+	int cnt, ret = 0;
+
+	dev_dbg(dev, "enable function %s group %s\n",
+		info->functions[selector].name, info->groups[group].name);
+
+	/*
+	 * for each pin in the pin group selected, program the corresponding
+	 * pin function number in the config register.
+	 */
+	for (cnt = 0; cnt < info->groups[group].npins; cnt++) {
+		ret = rockchip_rmio_set_mux(info, pins[cnt], func[cnt]);
+		if (ret)
+			break;
+	}
+
+	if (ret && cnt) {
+		/* revert the already done pin settings */
+		for (cnt--; cnt >= 0; cnt--)
+			rockchip_rmio_set_mux(info, pins[cnt], RK_RMIO_NC);
+
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct pinmux_ops rockchip_rmio_pmx_ops = {
+	.get_functions_count	= rockchip_rmio_get_funcs_count,
+	.get_function_name	= rockchip_rmio_get_func_name,
+	.get_function_groups	= rockchip_rmio_get_groups,
+	.set_mux		= rockchip_rmio_pmx_set,
+};
+
+static int rockchip_rmio_register(struct platform_device *pdev,
+				  struct rockchip_rmio *info)
+{
+	struct pinctrl_desc *ctrldesc = &info->pctl;
+	struct pinctrl_pin_desc *pindesc, *pdesc;
+	struct device *dev = &pdev->dev;
+	char **pin_names;
+	int ret;
+	int i;
+	int nr_pins = info->nr_pins;
+
+	ctrldesc->name = dev_name(dev);
+	ctrldesc->owner = THIS_MODULE;
+	ctrldesc->pctlops = &rockchip_rmio_pctrl_ops;
+	ctrldesc->pmxops = &rockchip_rmio_pmx_ops;
+
+	pindesc = devm_kcalloc(dev, nr_pins, sizeof(*pindesc), GFP_KERNEL);
+	if (!pindesc)
+		return -ENOMEM;
+
+	ctrldesc->pins = pindesc;
+	ctrldesc->npins = nr_pins;
+
+	pdesc = pindesc;
+	pin_names = devm_kasprintf_strarray(dev, dev_name(dev), nr_pins);
+	if (IS_ERR(pin_names))
+		return PTR_ERR(pin_names);
+	for (i = 0; i < nr_pins; i++) {
+		pdesc->number = i;
+		pdesc->name = pin_names[i];
+		pdesc++;
+	}
+
+	ret = rockchip_rmio_parse_dt(pdev, info);
+	if (ret)
+		return ret;
+
+	info->pctl_dev = devm_pinctrl_register(dev, ctrldesc, info);
+	if (IS_ERR(info->pctl_dev))
+		return dev_err_probe(dev, PTR_ERR(info->pctl_dev),
+				     "could not register pinctrl driver\n");
+
+	return 0;
+}
+
+static int rockchip_rmio_probe(struct platform_device *pdev)
+{
+	struct rockchip_rmio *info;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = pdev->dev.of_node;
+	int ret;
+
+	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->dev = dev;
+
+	info->regmap = syscon_regmap_lookup_by_phandle(np, "rockchip,rmio-grf");
+	if (IS_ERR(info->regmap)) {
+		dev_err(&pdev->dev, "missing rockchip,rmio-grf property\n");
+		return PTR_ERR(info->regmap);
+	}
+
+	ret = of_property_read_u32(np, "rockchip,offset", &info->offset);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "missing rockchip,offset property\n");
+		return ret;
+	}
+
+	ret = of_property_read_u32(np, "rockchip,pins-num", &info->nr_pins);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "missing rockchip,pins-num property\n");
+		return ret;
+	}
+
+	ret = rockchip_rmio_register(pdev, info);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, info);
+	dev_info(dev, "probed %pfw\n", dev_fwnode(dev));
+
+	return 0;
+}
+
+static struct platform_driver rockchip_rmio_driver = {
+	.probe = rockchip_rmio_probe,
+	.driver = {
+		.name = "rockchip-rmio",
+		.of_match_table = rockchip_rmio_dt_match,
+	},
+};
+
 static struct rockchip_pin_bank px30_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
 					     IOMUX_SOURCE_PMU,
@@ -5190,12 +5581,19 @@ static struct platform_driver rockchip_pinctrl_driver = {
 
 static int __init rockchip_pinctrl_drv_register(void)
 {
-	return platform_driver_register(&rockchip_pinctrl_driver);
+	int ret;
+
+	ret = platform_driver_register(&rockchip_pinctrl_driver);
+	if (ret)
+		return ret;
+
+	return platform_driver_register(&rockchip_rmio_driver);
 }
 postcore_initcall(rockchip_pinctrl_drv_register);
 
 static void __exit rockchip_pinctrl_drv_unregister(void)
 {
+	platform_driver_unregister(&rockchip_rmio_driver);
 	platform_driver_unregister(&rockchip_pinctrl_driver);
 }
 module_exit(rockchip_pinctrl_drv_unregister);
@@ -5204,3 +5602,4 @@ MODULE_DESCRIPTION("ROCKCHIP Pin Controller Driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:pinctrl-rockchip");
 MODULE_DEVICE_TABLE(of, rockchip_pinctrl_dt_match);
+MODULE_DEVICE_TABLE(of, rockchip_rmio_dt_match);
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index fe18b62ed994..db875f7a3d2f 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -183,6 +183,9 @@
 #define RK_GPIO4_D6	158
 #define RK_GPIO4_D7	159
 
+#define RK_RMIO_NC			0
+#define RK_RMIO_WRITE_ENABLE_MASK	0xFFFF0000
+
 enum rockchip_pinctrl_type {
 	PX30,
 	RV1108,
@@ -473,4 +476,43 @@ struct rockchip_pinctrl {
 	unsigned int			nfunctions;
 };
 
+/**
+ * struct rockchip_rmio_group: represent a group of pins in RMIO controller.
+ * @name: name of the pin group, used to lookup the group.
+ * @pins: array of pins included in this group.
+ * @npins: number of pins included in this group.
+ * @func: local pins function select
+ */
+struct rockchip_rmio_group {
+	const char			*name;
+	unsigned int			npins;
+	unsigned int			*pins;
+	unsigned int			*func;
+};
+
+/**
+ * struct rockchip_rmio_func: represent a RMIO pin function.
+ * @name: name of the RMIO function, used to lookup the function.
+ * @groups: array of group names that can provide this RMIO function.
+ * @ngroups: number of groups included in @groups.
+ */
+struct rockchip_rmio_func {
+	const char		*name;
+	const char		**groups;
+	u8			ngroups;
+};
+
+struct rockchip_rmio {
+	struct regmap			*regmap;
+	u32				offset;
+	struct device			*dev;
+	struct pinctrl_desc		pctl;
+	struct pinctrl_dev		*pctl_dev;
+	unsigned int			nr_pins;
+	struct rockchip_rmio_group	*groups;
+	unsigned int			ngroups;
+	struct rockchip_rmio_func	*functions;
+	unsigned int			nfunctions;
+};
+
 #endif
-- 
2.34.1


