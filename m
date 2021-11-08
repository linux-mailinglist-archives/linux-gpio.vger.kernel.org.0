Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E55447E58
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 11:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238871AbhKHK7f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 05:59:35 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:58333 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238859AbhKHK7U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 05:59:20 -0500
Received: (Authenticated sender: gregory.clement@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4605D24000B;
        Mon,  8 Nov 2021 10:56:34 +0000 (UTC)
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
Subject: Re: [PATCH v1 10/19] pinctrl: armada-37xx: Make use of the
 devm_platform_ioremap_resource()
In-Reply-To: <20211105124242.27288-10-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
 <20211105124242.27288-10-andriy.shevchenko@linux.intel.com>
Date:   Mon, 08 Nov 2021 11:56:33 +0100
Message-ID: <87zgqesyou.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy,

> Use the devm_platform_ioremap_resource() helper instead of
> calling of_address_to_resource() and devm_ioremap_resource()
> separately.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index 37f92dc54d7a..282b3fac3bec 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -727,7 +727,6 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
>  	struct gpio_irq_chip *girq = &gc->irq;
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np;
> -	struct resource res;
>  	int ret = -ENODEV, i, nr_irq_parent;
>  
>  	/* Check if we have at least one gpio-controller child node */
> @@ -750,12 +749,7 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
>  		return 0;
>  	}
>  
> -	if (of_address_to_resource(dev->of_node, 1, &res)) {
> -		dev_err(dev, "cannot find IO resource\n");
> -		return -ENOENT;
> -	}
> -
> -	info->base = devm_ioremap_resource(dev, &res);
> +	info->base = devm_platform_ioremap_resource(pdev, 1);
>  	if (IS_ERR(info->base))
>  		return PTR_ERR(info->base);
>  
> -- 
> 2.33.0
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
