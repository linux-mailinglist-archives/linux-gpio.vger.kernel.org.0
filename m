Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E841446373
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 13:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233003AbhKEMpy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 08:45:54 -0400
Received: from mga07.intel.com ([134.134.136.100]:41489 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232608AbhKEMpp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 08:45:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="295333835"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="295333835"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 05:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="450560674"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 05 Nov 2021 05:43:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3EA0843A; Fri,  5 Nov 2021 14:43:01 +0200 (EET)
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
Subject: [PATCH v1 04/19] pinctrl/rockchip: Use temporary variable for struct device
Date:   Fri,  5 Nov 2021 14:42:27 +0200
Message-Id: <20211105124242.27288-4-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/pinctrl-rockchip.c | 116 +++++++++++++----------------
 1 file changed, 53 insertions(+), 63 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 6031d98d9849..ae80c95bae87 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -285,6 +285,7 @@ static int rockchip_dt_node_to_map(struct pinctrl_dev *pctldev,
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	const struct rockchip_pin_group *grp;
+	struct device *dev = info->dev;
 	struct pinctrl_map *new_map;
 	struct device_node *parent;
 	int map_num = 1;
@@ -296,8 +297,7 @@ static int rockchip_dt_node_to_map(struct pinctrl_dev *pctldev,
 	 */
 	grp = pinctrl_name_to_group(info, np->name);
 	if (!grp) {
-		dev_err(info->dev, "unable to find group for node %pOFn\n",
-			np);
+		dev_err(dev, "unable to find group for node %pOFn\n", np);
 		return -EINVAL;
 	}
 
@@ -331,7 +331,7 @@ static int rockchip_dt_node_to_map(struct pinctrl_dev *pctldev,
 		new_map[i].data.configs.num_configs = grp->data[i].nconfigs;
 	}
 
-	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
+	dev_dbg(dev, "maps: function %s group %s num %d\n",
 		(*map)->data.mux.function, (*map)->data.mux.group, map_num);
 
 	return 0;
@@ -872,20 +872,20 @@ static int rockchip_verify_mux(struct rockchip_pin_bank *bank,
 			       int pin, int mux)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
+	struct device *dev = info->dev;
 	int iomux_num = (pin / 8);
 
 	if (iomux_num > 3)
 		return -EINVAL;
 
 	if (bank->iomux[iomux_num].type & IOMUX_UNROUTED) {
-		dev_err(info->dev, "pin %d is unrouted\n", pin);
+		dev_err(dev, "pin %d is unrouted\n", pin);
 		return -EINVAL;
 	}
 
 	if (bank->iomux[iomux_num].type & IOMUX_GPIO_ONLY) {
 		if (mux != RK_FUNC_GPIO) {
-			dev_err(info->dev,
-				"pin %d only supports a gpio mux\n", pin);
+			dev_err(dev, "pin %d only supports a gpio mux\n", pin);
 			return -ENOTSUPP;
 		}
 	}
@@ -909,6 +909,7 @@ static int rockchip_verify_mux(struct rockchip_pin_bank *bank,
 static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
+	struct device *dev = info->dev;
 	int iomux_num = (pin / 8);
 	struct regmap *regmap;
 	int reg, ret, mask, mux_type;
@@ -922,8 +923,7 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	if (bank->iomux[iomux_num].type & IOMUX_GPIO_ONLY)
 		return 0;
 
-	dev_dbg(info->dev, "setting mux of GPIO%d-%d to %d\n",
-						bank->bank_num, pin, mux);
+	dev_dbg(dev, "setting mux of GPIO%d-%d to %d\n", bank->bank_num, pin, mux);
 
 	regmap = (bank->iomux[iomux_num].type & IOMUX_SOURCE_PMU)
 				? info->regmap_pmu : info->regmap_base;
@@ -1575,6 +1575,7 @@ static int rockchip_get_drive_perpin(struct rockchip_pin_bank *bank,
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	struct device *dev = info->dev;
 	struct regmap *regmap;
 	int reg, ret;
 	u32 data, temp, rmask_bits;
@@ -1620,7 +1621,7 @@ static int rockchip_get_drive_perpin(struct rockchip_pin_bank *bank,
 			bit -= 16;
 			break;
 		default:
-			dev_err(info->dev, "unsupported bit: %d for pinctrl drive type: %d\n",
+			dev_err(dev, "unsupported bit: %d for pinctrl drive type: %d\n",
 				bit, drv_type);
 			return -EINVAL;
 		}
@@ -1632,8 +1633,7 @@ static int rockchip_get_drive_perpin(struct rockchip_pin_bank *bank,
 		rmask_bits = RK3288_DRV_BITS_PER_PIN;
 		break;
 	default:
-		dev_err(info->dev, "unsupported pinctrl drive type: %d\n",
-			drv_type);
+		dev_err(dev, "unsupported pinctrl drive type: %d\n", drv_type);
 		return -EINVAL;
 	}
 
@@ -1652,13 +1652,14 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	struct device *dev = info->dev;
 	struct regmap *regmap;
 	int reg, ret, i;
 	u32 data, rmask, rmask_bits, temp;
 	u8 bit;
 	int drv_type = bank->drv[pin_num / 8].drv_type;
 
-	dev_dbg(info->dev, "setting drive of GPIO%d-%d to %d\n",
+	dev_dbg(dev, "setting drive of GPIO%d-%d to %d\n",
 		bank->bank_num, pin_num, strength);
 
 	ctrl->drv_calc_reg(bank, pin_num, &regmap, &reg, &bit);
@@ -1680,8 +1681,7 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 	}
 
 	if (ret < 0) {
-		dev_err(info->dev, "unsupported driver strength %d\n",
-			strength);
+		dev_err(dev, "unsupported driver strength %d\n", strength);
 		return ret;
 	}
 
@@ -1720,7 +1720,7 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 			bit -= 16;
 			break;
 		default:
-			dev_err(info->dev, "unsupported bit: %d for pinctrl drive type: %d\n",
+			dev_err(dev, "unsupported bit: %d for pinctrl drive type: %d\n",
 				bit, drv_type);
 			return -EINVAL;
 		}
@@ -1731,8 +1731,7 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		rmask_bits = RK3288_DRV_BITS_PER_PIN;
 		break;
 	default:
-		dev_err(info->dev, "unsupported pinctrl drive type: %d\n",
-			drv_type);
+		dev_err(dev, "unsupported pinctrl drive type: %d\n", drv_type);
 		return -EINVAL;
 	}
 
@@ -1766,6 +1765,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	struct device *dev = info->dev;
 	struct regmap *regmap;
 	int reg, ret, pull_type;
 	u8 bit;
@@ -1800,7 +1800,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 
 		return rockchip_pull_list[pull_type][data];
 	default:
-		dev_err(info->dev, "unsupported pinctrl type\n");
+		dev_err(dev, "unsupported pinctrl type\n");
 		return -EINVAL;
 	};
 }
@@ -1810,13 +1810,13 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	struct device *dev = info->dev;
 	struct regmap *regmap;
 	int reg, ret, i, pull_type;
 	u8 bit;
 	u32 data, rmask;
 
-	dev_dbg(info->dev, "setting pull of GPIO%d-%d to %d\n",
-		 bank->bank_num, pin_num, pull);
+	dev_dbg(dev, "setting pull of GPIO%d-%d to %d\n", bank->bank_num, pin_num, pull);
 
 	/* rk3066b does support any pulls */
 	if (ctrl->type == RK3066B)
@@ -1859,8 +1859,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 		}
 
 		if (ret < 0) {
-			dev_err(info->dev, "unsupported pull setting %d\n",
-				pull);
+			dev_err(dev, "unsupported pull setting %d\n", pull);
 			return ret;
 		}
 
@@ -1872,7 +1871,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 		ret = regmap_update_bits(regmap, reg, rmask, data);
 		break;
 	default:
-		dev_err(info->dev, "unsupported pinctrl type\n");
+		dev_err(dev, "unsupported pinctrl type\n");
 		return -EINVAL;
 	}
 
@@ -1963,12 +1962,13 @@ static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	struct device *dev = info->dev;
 	struct regmap *regmap;
 	int reg, ret;
 	u8 bit;
 	u32 data, rmask;
 
-	dev_dbg(info->dev, "setting input schmitt of GPIO%d-%d to %d\n",
+	dev_dbg(dev, "setting input schmitt of GPIO%d-%d to %d\n",
 		bank->bank_num, pin_num, enable);
 
 	ret = ctrl->schmitt_calc_reg(bank, pin_num, &regmap, &reg, &bit);
@@ -2028,10 +2028,11 @@ static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	const unsigned int *pins = info->groups[group].pins;
 	const struct rockchip_pin_config *data = info->groups[group].data;
+	struct device *dev = info->dev;
 	struct rockchip_pin_bank *bank;
 	int cnt, ret = 0;
 
-	dev_dbg(info->dev, "enable function %s group %s\n",
+	dev_dbg(dev, "enable function %s group %s\n",
 		info->functions[selector].name, info->groups[group].name);
 
 	/*
@@ -2310,6 +2311,7 @@ static int rockchip_pinctrl_parse_groups(struct device_node *np,
 					      struct rockchip_pinctrl *info,
 					      u32 index)
 {
+	struct device *dev = info->dev;
 	struct rockchip_pin_bank *bank;
 	int size;
 	const __be32 *list;
@@ -2317,7 +2319,7 @@ static int rockchip_pinctrl_parse_groups(struct device_node *np,
 	int i, j;
 	int ret;
 
-	dev_dbg(info->dev, "group(%d): %pOFn\n", index, np);
+	dev_dbg(dev, "group(%d): %pOFn\n", index, np);
 
 	/* Initialise group */
 	grp->name = np->name;
@@ -2330,18 +2332,14 @@ static int rockchip_pinctrl_parse_groups(struct device_node *np,
 	/* we do not check return since it's safe node passed down */
 	size /= sizeof(*list);
 	if (!size || size % 4) {
-		dev_err(info->dev, "wrong pins number or pins and configs should be by 4\n");
+		dev_err(dev, "wrong pins number or pins and configs should be by 4\n");
 		return -EINVAL;
 	}
 
 	grp->npins = size / 4;
 
-	grp->pins = devm_kcalloc(info->dev, grp->npins, sizeof(unsigned int),
-						GFP_KERNEL);
-	grp->data = devm_kcalloc(info->dev,
-					grp->npins,
-					sizeof(struct rockchip_pin_config),
-					GFP_KERNEL);
+	grp->pins = devm_kcalloc(dev, grp->npins, sizeof(*grp->pins), GFP_KERNEL);
+	grp->data = devm_kcalloc(dev, grp->npins, sizeof(*grp->data), GFP_KERNEL);
 	if (!grp->pins || !grp->data)
 		return -ENOMEM;
 
@@ -2375,6 +2373,7 @@ static int rockchip_pinctrl_parse_functions(struct device_node *np,
 						struct rockchip_pinctrl *info,
 						u32 index)
 {
+	struct device *dev = info->dev;
 	struct device_node *child;
 	struct rockchip_pmx_func *func;
 	struct rockchip_pin_group *grp;
@@ -2382,7 +2381,7 @@ static int rockchip_pinctrl_parse_functions(struct device_node *np,
 	static u32 grp_index;
 	u32 i = 0;
 
-	dev_dbg(info->dev, "parse function(%d): %pOFn\n", index, np);
+	dev_dbg(dev, "parse function(%d): %pOFn\n", index, np);
 
 	func = &info->functions[index];
 
@@ -2392,8 +2391,7 @@ static int rockchip_pinctrl_parse_functions(struct device_node *np,
 	if (func->ngroups <= 0)
 		return 0;
 
-	func->groups = devm_kcalloc(info->dev,
-			func->ngroups, sizeof(char *), GFP_KERNEL);
+	func->groups = devm_kcalloc(dev, func->ngroups, sizeof(*func->groups), GFP_KERNEL);
 	if (!func->groups)
 		return -ENOMEM;
 
@@ -2421,20 +2419,14 @@ static int rockchip_pinctrl_parse_dt(struct platform_device *pdev,
 
 	rockchip_pinctrl_child_count(info, np);
 
-	dev_dbg(&pdev->dev, "nfunctions = %d\n", info->nfunctions);
-	dev_dbg(&pdev->dev, "ngroups = %d\n", info->ngroups);
+	dev_dbg(dev, "nfunctions = %d\n", info->nfunctions);
+	dev_dbg(dev, "ngroups = %d\n", info->ngroups);
 
-	info->functions = devm_kcalloc(dev,
-					      info->nfunctions,
-					      sizeof(struct rockchip_pmx_func),
-					      GFP_KERNEL);
+	info->functions = devm_kcalloc(dev, info->nfunctions, sizeof(*info->functions), GFP_KERNEL);
 	if (!info->functions)
 		return -ENOMEM;
 
-	info->groups = devm_kcalloc(dev,
-					    info->ngroups,
-					    sizeof(struct rockchip_pin_group),
-					    GFP_KERNEL);
+	info->groups = devm_kcalloc(dev, info->ngroups, sizeof(*info->groups), GFP_KERNEL);
 	if (!info->groups)
 		return -ENOMEM;
 
@@ -2446,7 +2438,7 @@ static int rockchip_pinctrl_parse_dt(struct platform_device *pdev,
 
 		ret = rockchip_pinctrl_parse_functions(child, info, i++);
 		if (ret) {
-			dev_err(&pdev->dev, "failed to parse function\n");
+			dev_err(dev, "failed to parse function\n");
 			of_node_put(child);
 			return ret;
 		}
@@ -2461,6 +2453,7 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 	struct pinctrl_desc *ctrldesc = &info->pctl;
 	struct pinctrl_pin_desc *pindesc, *pdesc;
 	struct rockchip_pin_bank *pin_bank;
+	struct device *dev = &pdev->dev;
 	int pin, bank, ret;
 	int k;
 
@@ -2470,9 +2463,7 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 	ctrldesc->pmxops = &rockchip_pmx_ops;
 	ctrldesc->confops = &rockchip_pinconf_ops;
 
-	pindesc = devm_kcalloc(&pdev->dev,
-			       info->ctrl->nr_pins, sizeof(*pindesc),
-			       GFP_KERNEL);
+	pindesc = devm_kcalloc(dev, info->ctrl->nr_pins, sizeof(*pindesc), GFP_KERNEL);
 	if (!pindesc)
 		return -ENOMEM;
 
@@ -2497,9 +2488,9 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	info->pctl_dev = devm_pinctrl_register(&pdev->dev, ctrldesc, info);
+	info->pctl_dev = devm_pinctrl_register(dev, ctrldesc, info);
 	if (IS_ERR(info->pctl_dev)) {
-		dev_err(&pdev->dev, "could not register pinctrl driver\n");
+		dev_err(dev, "could not register pinctrl driver\n");
 		return PTR_ERR(info->pctl_dev);
 	}
 
@@ -2513,8 +2504,9 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 						struct rockchip_pinctrl *d,
 						struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
 	const struct of_device_id *match;
-	struct device_node *node = pdev->dev.of_node;
 	struct rockchip_pin_ctrl *ctrl;
 	struct rockchip_pin_bank *bank;
 	int grf_offs, pmu_offs, drv_grf_offs, drv_pmu_offs, i, j;
@@ -2566,7 +2558,7 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 						drv_pmu_offs : drv_grf_offs;
 			}
 
-			dev_dbg(d->dev, "bank %d, iomux %d has iom_offset 0x%x drv_offset 0x%x\n",
+			dev_dbg(dev, "bank %d, iomux %d has iom_offset 0x%x drv_offset 0x%x\n",
 				i, j, iom->offset, drv->offset);
 
 			/*
@@ -2675,8 +2667,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 {
 	struct rockchip_pinctrl *info;
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node, *node;
 	struct rockchip_pin_ctrl *ctrl;
-	struct device_node *np = pdev->dev.of_node, *node;
 	struct resource *res;
 	void __iomem *base;
 	int ret;
@@ -2712,8 +2704,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 
 		rockchip_regmap_config.max_register = resource_size(res) - 4;
 		rockchip_regmap_config.name = "rockchip,pinctrl";
-		info->regmap_base = devm_regmap_init_mmio(&pdev->dev, base,
-						    &rockchip_regmap_config);
+		info->regmap_base =
+			devm_regmap_init_mmio(dev, base, &rockchip_regmap_config);
 
 		/* to check for the old dt-bindings */
 		info->reg_size = resource_size(res);
@@ -2725,12 +2717,10 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 			if (IS_ERR(base))
 				return PTR_ERR(base);
 
-			rockchip_regmap_config.max_register =
-							resource_size(res) - 4;
+			rockchip_regmap_config.max_register = resource_size(res) - 4;
 			rockchip_regmap_config.name = "rockchip,pinctrl-pull";
-			info->regmap_pull = devm_regmap_init_mmio(&pdev->dev,
-						    base,
-						    &rockchip_regmap_config);
+			info->regmap_pull =
+				devm_regmap_init_mmio(dev, base, &rockchip_regmap_config);
 		}
 	}
 
@@ -2750,7 +2740,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 
 	ret = of_platform_populate(np, rockchip_bank_match, NULL, NULL);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register gpio device\n");
+		dev_err(dev, "failed to register gpio device\n");
 		return ret;
 	}
 
-- 
2.33.0

