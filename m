Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C70F447E45
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 11:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238713AbhKHKv6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 05:51:58 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:49119 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238707AbhKHKvw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 05:51:52 -0500
Received: (Authenticated sender: gregory.clement@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B7DF720002;
        Mon,  8 Nov 2021 10:49:03 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v1 09/19] pinctrl: armada-37xx: Use temporary variable
 for struct device
In-Reply-To: <20211105124242.27288-9-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
 <20211105124242.27288-9-andriy.shevchenko@linux.intel.com>
Date:   Mon, 08 Nov 2021 11:49:03 +0100
Message-ID: <8735o6udls.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy,

> Use temporary variable for struct device to make code neater.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory


> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 56 +++++++++------------
>  1 file changed, 23 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index 5615cb7a1209..37f92dc54d7a 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -341,12 +341,12 @@ static int armada_37xx_pmx_set_by_name(struct pinctrl_dev *pctldev,
>  				       struct armada_37xx_pin_group *grp)
>  {
>  	struct armada_37xx_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
> +	struct device *dev = info->dev;
>  	unsigned int reg = SELECTION;
>  	unsigned int mask = grp->reg_mask;
>  	int func, val;
>  
> -	dev_dbg(info->dev, "enable function %s group %s\n",
> -		name, grp->name);
> +	dev_dbg(dev, "enable function %s group %s\n", name, grp->name);
>  
>  	func = match_string(grp->funcs, NB_FUNCS, name);
>  	if (func < 0)
> @@ -722,16 +722,16 @@ static unsigned int armada_37xx_irq_startup(struct irq_data *d)
>  static int armada_37xx_irqchip_register(struct platform_device *pdev,
>  					struct armada_37xx_pinctrl *info)
>  {
> -	struct device_node *np = info->dev->of_node;
>  	struct gpio_chip *gc = &info->gpio_chip;
>  	struct irq_chip *irqchip = &info->irq_chip;
>  	struct gpio_irq_chip *girq = &gc->irq;
>  	struct device *dev = &pdev->dev;
> +	struct device_node *np;
>  	struct resource res;
>  	int ret = -ENODEV, i, nr_irq_parent;
>  
>  	/* Check if we have at least one gpio-controller child node */
> -	for_each_child_of_node(info->dev->of_node, np) {
> +	for_each_child_of_node(dev->of_node, np) {
>  		if (of_property_read_bool(np, "gpio-controller")) {
>  			ret = 0;
>  			break;
> @@ -750,12 +750,12 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
>  		return 0;
>  	}
>  
> -	if (of_address_to_resource(info->dev->of_node, 1, &res)) {
> +	if (of_address_to_resource(dev->of_node, 1, &res)) {
>  		dev_err(dev, "cannot find IO resource\n");
>  		return -ENOENT;
>  	}
>  
> -	info->base = devm_ioremap_resource(info->dev, &res);
> +	info->base = devm_ioremap_resource(dev, &res);
>  	if (IS_ERR(info->base))
>  		return PTR_ERR(info->base);
>  
> @@ -774,8 +774,7 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
>  	 * the chained irq with all of them.
>  	 */
>  	girq->num_parents = nr_irq_parent;
> -	girq->parents = devm_kcalloc(&pdev->dev, nr_irq_parent,
> -				     sizeof(*girq->parents), GFP_KERNEL);
> +	girq->parents = devm_kcalloc(dev, nr_irq_parent, sizeof(*girq->parents), GFP_KERNEL);
>  	if (!girq->parents)
>  		return -ENOMEM;
>  	for (i = 0; i < nr_irq_parent; i++) {
> @@ -794,11 +793,12 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
>  static int armada_37xx_gpiochip_register(struct platform_device *pdev,
>  					struct armada_37xx_pinctrl *info)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct device_node *np;
>  	struct gpio_chip *gc;
>  	int ret = -ENODEV;
>  
> -	for_each_child_of_node(info->dev->of_node, np) {
> +	for_each_child_of_node(dev->of_node, np) {
>  		if (of_find_property(np, "gpio-controller", NULL)) {
>  			ret = 0;
>  			break;
> @@ -811,19 +811,16 @@ static int armada_37xx_gpiochip_register(struct platform_device *pdev,
>  
>  	gc = &info->gpio_chip;
>  	gc->ngpio = info->data->nr_pins;
> -	gc->parent = &pdev->dev;
> +	gc->parent = dev;
>  	gc->base = -1;
>  	gc->of_node = np;
>  	gc->label = info->data->name;
>  
>  	ret = armada_37xx_irqchip_register(pdev, info);
> -	if (ret)
> -		return ret;
> -	ret = devm_gpiochip_add_data(&pdev->dev, gc, info);
>  	if (ret)
>  		return ret;
>  
> -	return 0;
> +	return devm_gpiochip_add_data(dev, gc, info);
>  }
>  
>  /**
> @@ -874,13 +871,13 @@ static int armada_37xx_add_function(struct armada_37xx_pmx_func *funcs,
>  static int armada_37xx_fill_group(struct armada_37xx_pinctrl *info)
>  {
>  	int n, num = 0, funcsize = info->data->nr_pins;
> +	struct device *dev = info->dev;
>  
>  	for (n = 0; n < info->ngroups; n++) {
>  		struct armada_37xx_pin_group *grp = &info->groups[n];
>  		int i, j, f;
>  
> -		grp->pins = devm_kcalloc(info->dev,
> -					 grp->npins + grp->extra_npins,
> +		grp->pins = devm_kcalloc(dev, grp->npins + grp->extra_npins,
>  					 sizeof(*grp->pins),
>  					 GFP_KERNEL);
>  		if (!grp->pins)
> @@ -898,8 +895,7 @@ static int armada_37xx_fill_group(struct armada_37xx_pinctrl *info)
>  			ret = armada_37xx_add_function(info->funcs, &funcsize,
>  					    grp->funcs[f]);
>  			if (ret == -EOVERFLOW)
> -				dev_err(info->dev,
> -					"More functions than pins(%d)\n",
> +				dev_err(dev, "More functions than pins(%d)\n",
>  					info->data->nr_pins);
>  			if (ret < 0)
>  				continue;
> @@ -925,6 +921,7 @@ static int armada_37xx_fill_group(struct armada_37xx_pinctrl *info)
>  static int armada_37xx_fill_func(struct armada_37xx_pinctrl *info)
>  {
>  	struct armada_37xx_pmx_func *funcs = info->funcs;
> +	struct device *dev = info->dev;
>  	int n;
>  
>  	for (n = 0; n < info->nfuncs; n++) {
> @@ -932,8 +929,7 @@ static int armada_37xx_fill_func(struct armada_37xx_pinctrl *info)
>  		const char **groups;
>  		int g;
>  
> -		funcs[n].groups = devm_kcalloc(info->dev,
> -					       funcs[n].ngroups,
> +		funcs[n].groups = devm_kcalloc(dev, funcs[n].ngroups,
>  					       sizeof(*(funcs[n].groups)),
>  					       GFP_KERNEL);
>  		if (!funcs[n].groups)
> @@ -962,6 +958,7 @@ static int armada_37xx_pinctrl_register(struct platform_device *pdev,
>  	const struct armada_37xx_pin_data *pin_data = info->data;
>  	struct pinctrl_desc *ctrldesc = &info->pctl;
>  	struct pinctrl_pin_desc *pindesc, *pdesc;
> +	struct device *dev = &pdev->dev;
>  	int pin, ret;
>  
>  	info->groups = pin_data->groups;
> @@ -973,9 +970,7 @@ static int armada_37xx_pinctrl_register(struct platform_device *pdev,
>  	ctrldesc->pmxops = &armada_37xx_pmx_ops;
>  	ctrldesc->confops = &armada_37xx_pinconf_ops;
>  
> -	pindesc = devm_kcalloc(&pdev->dev,
> -			       pin_data->nr_pins, sizeof(*pindesc),
> -			       GFP_KERNEL);
> +	pindesc = devm_kcalloc(dev, pin_data->nr_pins, sizeof(*pindesc), GFP_KERNEL);
>  	if (!pindesc)
>  		return -ENOMEM;
>  
> @@ -994,14 +989,10 @@ static int armada_37xx_pinctrl_register(struct platform_device *pdev,
>  	 * we allocate functions for number of pins and hope there are
>  	 * fewer unique functions than pins available
>  	 */
> -	info->funcs = devm_kcalloc(&pdev->dev,
> -				   pin_data->nr_pins,
> -				   sizeof(struct armada_37xx_pmx_func),
> -				   GFP_KERNEL);
> +	info->funcs = devm_kcalloc(dev, pin_data->nr_pins, sizeof(*info->funcs), GFP_KERNEL);
>  	if (!info->funcs)
>  		return -ENOMEM;
>  
> -
>  	ret = armada_37xx_fill_group(info);
>  	if (ret)
>  		return ret;
> @@ -1010,9 +1001,9 @@ static int armada_37xx_pinctrl_register(struct platform_device *pdev,
>  	if (ret)
>  		return ret;
>  
> -	info->pctl_dev = devm_pinctrl_register(&pdev->dev, ctrldesc, info);
> +	info->pctl_dev = devm_pinctrl_register(dev, ctrldesc, info);
>  	if (IS_ERR(info->pctl_dev)) {
> -		dev_err(&pdev->dev, "could not register pinctrl driver\n");
> +		dev_err(dev, "could not register pinctrl driver\n");
>  		return PTR_ERR(info->pctl_dev);
>  	}
>  
> @@ -1143,8 +1134,7 @@ static int __init armada_37xx_pinctrl_probe(struct platform_device *pdev)
>  	struct regmap *regmap;
>  	int ret;
>  
> -	info = devm_kzalloc(dev, sizeof(struct armada_37xx_pinctrl),
> -			    GFP_KERNEL);
> +	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
>  	if (!info)
>  		return -ENOMEM;
>  
> @@ -1152,7 +1142,7 @@ static int __init armada_37xx_pinctrl_probe(struct platform_device *pdev)
>  
>  	regmap = syscon_node_to_regmap(np);
>  	if (IS_ERR(regmap)) {
> -		dev_err(&pdev->dev, "cannot get regmap\n");
> +		dev_err(dev, "cannot get regmap\n");
>  		return PTR_ERR(regmap);
>  	}
>  	info->regmap = regmap;
> -- 
> 2.33.0
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
