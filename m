Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69205447E79
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 12:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237084AbhKHLLw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 06:11:52 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:44065 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236276AbhKHLLw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 06:11:52 -0500
Received: (Authenticated sender: gregory.clement@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8348424000F;
        Mon,  8 Nov 2021 11:09:05 +0000 (UTC)
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
Subject: Re: [PATCH v1 12/19] pinctrl: armada-37xx: Switch to use
 devm_kasprintf_strarray()
In-Reply-To: <20211105124242.27288-12-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
 <20211105124242.27288-12-andriy.shevchenko@linux.intel.com>
Date:   Mon, 08 Nov 2021 12:09:05 +0100
Message-ID: <87tugmsy3y.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy,

> Since we have a generic helper, switch the module to use it.
>
> As a side effect, add check for the memory allocation failures and
> cleanup it either in error case or when driver is unloading.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index f48745c43419..08cad14042e2 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -23,6 +23,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> +#include <linux/string_helpers.h>
>  
>  #include "../pinctrl-utils.h"
>  
> @@ -951,6 +952,7 @@ static int armada_37xx_pinctrl_register(struct platform_device *pdev,
>  	struct pinctrl_desc *ctrldesc = &info->pctl;
>  	struct pinctrl_pin_desc *pindesc, *pdesc;
>  	struct device *dev = &pdev->dev;
> +	char **pin_names;
>  	int pin, ret;
>  
>  	info->groups = pin_data->groups;
> @@ -969,11 +971,14 @@ static int armada_37xx_pinctrl_register(struct platform_device *pdev,
>  	ctrldesc->pins = pindesc;
>  	ctrldesc->npins = pin_data->nr_pins;
>  
> +	pin_names = devm_kasprintf_strarray(dev, pin_data->name, pin_data->nr_pins);
> +	if (IS_ERR(pin_names))
> +		return PTR_ERR(pin_names);
> +
>  	pdesc = pindesc;
>  	for (pin = 0; pin < pin_data->nr_pins; pin++) {
>  		pdesc->number = pin;
> -		pdesc->name = kasprintf(GFP_KERNEL, "%s-%d",
> -					pin_data->name, pin);
> +		pdesc->name = pin_names[pin];
>  		pdesc++;
>  	}
>  
> -- 
> 2.33.0
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
