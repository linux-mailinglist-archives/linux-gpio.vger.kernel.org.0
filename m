Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE87447E5E
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 11:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236232AbhKHLCf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 06:02:35 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:49993 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbhKHLCe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 06:02:34 -0500
Received: (Authenticated sender: gregory.clement@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 259DD2000D;
        Mon,  8 Nov 2021 10:59:48 +0000 (UTC)
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
Subject: Re: [PATCH v1 11/19] pinctrl: armada-37xx: Convert to use
 dev_err_probe()
In-Reply-To: <20211105124242.27288-11-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
 <20211105124242.27288-11-andriy.shevchenko@linux.intel.com>
Date:   Mon, 08 Nov 2021 11:59:47 +0100
Message-ID: <87wnlisyjg.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy,

> It's fine to call dev_err_probe() in ->probe() when error code is known.
> Convert the driver to use dev_err_probe().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index 282b3fac3bec..f48745c43419 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -736,10 +736,8 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
>  			break;
>  		}
>  	}
> -	if (ret) {
> -		dev_err(dev, "no gpio-controller child node\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "no gpio-controller child node\n");
>  
>  	nr_irq_parent = of_irq_count(np);
>  	spin_lock_init(&info->irq_lock);
> @@ -996,10 +994,8 @@ static int armada_37xx_pinctrl_register(struct platform_device *pdev,
>  		return ret;
>  
>  	info->pctl_dev = devm_pinctrl_register(dev, ctrldesc, info);
> -	if (IS_ERR(info->pctl_dev)) {
> -		dev_err(dev, "could not register pinctrl driver\n");
> -		return PTR_ERR(info->pctl_dev);
> -	}
> +	if (IS_ERR(info->pctl_dev))
> +		return dev_err_probe(dev, PTR_ERR(info->pctl_dev), "could not register pinctrl driver\n");
>  
>  	return 0;
>  }
> @@ -1135,10 +1131,8 @@ static int __init armada_37xx_pinctrl_probe(struct platform_device *pdev)
>  	info->dev = dev;
>  
>  	regmap = syscon_node_to_regmap(np);
> -	if (IS_ERR(regmap)) {
> -		dev_err(dev, "cannot get regmap\n");
> -		return PTR_ERR(regmap);
> -	}
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "cannot get regmap\n");
>  	info->regmap = regmap;
>  
>  	info->data = of_device_get_match_data(dev);
> -- 
> 2.33.0
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
