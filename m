Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93F4925ED91
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Sep 2020 12:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725803AbgIFKUl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Sep 2020 06:20:41 -0400
Received: from gloria.sntech.de ([185.11.138.130]:35688 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725788AbgIFKUj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 6 Sep 2020 06:20:39 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kErmi-0004EO-0Z; Sun, 06 Sep 2020 12:20:32 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linus.walleij@linaro.org, Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH 6/6] pinctrl: rockchip: populate platform device for rockchip gpio
Date:   Sun, 06 Sep 2020 12:20:31 +0200
Message-ID: <76163126.riIkUvEO9g@diego>
In-Reply-To: <20200831085021.7288-1-jay.xu@rock-chips.com>
References: <20200831084753.7115-1-jay.xu@rock-chips.com> <20200831085021.7288-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jianqun,

Am Montag, 31. August 2020, 10:50:21 CEST schrieb Jianqun Xu:
> Register both gpio driver and device as part of driver model, so that
> the '-gpio'/'-gpios' dependency in dts can be correctly handled by
> of_devlink/of_fwlink.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

[...]

> -static int rockchip_gpiolib_unregister(struct platform_device *pdev,
> -						struct rockchip_pinctrl *info)
> -{
> -	struct rockchip_pin_ctrl *ctrl = info->ctrl;
> -	struct rockchip_pin_bank *bank = ctrl->pin_banks;
> -	int i;
> +		pctldev = info->pctl_dev;
> +		if (!pctldev)
> +			return -ENODEV;
>  
> -	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
> -		if (!bank->valid)
> -			continue;
> -		gpiochip_remove(&bank->gpio_chip);
> +		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0, gc->base, gc->ngpio);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to add pin range\n");
> +			gpiochip_remove(&bank->gpio_chip);
> +			return ret;
> +		}
>  	}
>  
>  	return 0;
> @@ -3752,6 +3734,46 @@ static int __maybe_unused rockchip_pinctrl_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(rockchip_pinctrl_dev_pm_ops, rockchip_pinctrl_suspend,
>  			 rockchip_pinctrl_resume);
>  
> +static int rockchip_gpio_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device *parent = pdev->dev.parent;
> +	struct rockchip_pinctrl *info = dev_get_drvdata(parent);
> +	struct rockchip_pin_ctrl *ctrl = info ? (info->ctrl) : NULL;
> +	struct rockchip_pin_bank *bank;
> +	int ret, i;
> +
> +	if (!info || !ctrl)
> +		return -EINVAL;
> +
> +	if (!of_find_property(np, "gpio-controller", NULL))
> +		return -ENODEV;
> +
> +	bank = ctrl->pin_banks;
> +	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
> +		if (!strcmp(bank->name, np->name)) {
> +			bank->of_node = np;
> +
> +			if (!rockchip_get_bank_data(bank, info))
> +				bank->valid = true;
> +
> +			break;
> +		}
> +	}
> +
> +	bank->of_node = pdev->dev.of_node;
> +
> +	ret = rockchip_gpiolib_register(pdev, bank);
> +	if (ret)
> +		return ret;
> +
> +	ret = rockchip_interrupts_register(pdev, bank);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static int rockchip_pinctrl_probe(struct platform_device *pdev)
>  {
>  	struct rockchip_pinctrl *info;
> @@ -3823,18 +3845,20 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
>  			return PTR_ERR(info->regmap_pmu);
>  	}
>  
> -	ret = rockchip_gpiolib_register(pdev, info);
> -	if (ret)
> -		return ret;
> -
>  	ret = rockchip_pinctrl_register(pdev, info);
>  	if (ret) {
> -		rockchip_gpiolib_unregister(pdev, info);
> +		dev_err(&pdev->dev, "failed to register pinctrl device\n");
>  		return ret;
>  	}
>  
>  	platform_set_drvdata(pdev, info);
>  
> +	ret = of_platform_populate(np, rockchip_bank_match, NULL, dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register gpio device\n");
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -4254,6 +4278,14 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
>  	{},
>  };
>  
> +static struct platform_driver rockchip_gpio_driver = {
> +	.probe		= rockchip_gpio_probe,
> +	.driver = {
> +		.name	= "rockchip-gpio",
> +		.of_match_table = rockchip_bank_match,
> +	},
> +};
> +
>  static struct platform_driver rockchip_pinctrl_driver = {
>  	.probe		= rockchip_pinctrl_probe,
>  	.driver = {
> @@ -4265,7 +4297,9 @@ static struct platform_driver rockchip_pinctrl_driver = {
>  
>  static int __init rockchip_pinctrl_drv_register(void)
>  {
> -	return platform_driver_register(&rockchip_pinctrl_driver);
> +	platform_driver_register(&rockchip_pinctrl_driver);
> +
> +	return platform_driver_register(&rockchip_gpio_driver);
>  }
>  postcore_initcall(rockchip_pinctrl_drv_register);

This also seems to miss the whole unloading of module paths?
I'd expect a gpiochip_remove etc in some _remove function and
of course a platform_driver_unregister.


Heiko


