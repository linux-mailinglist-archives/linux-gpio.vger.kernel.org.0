Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0019D6603
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 17:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733294AbfJNPSe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 11:18:34 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:52411 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732397AbfJNPSe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 11:18:34 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id CEDBA60012;
        Mon, 14 Oct 2019 15:18:32 +0000 (UTC)
Date:   Mon, 14 Oct 2019 17:18:32 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] pinctrl: ocelot: Pass irqchip when adding gpiochip
Message-ID: <20191014151832.GN3125@piout.net>
References: <20191002114454.9684-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002114454.9684-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02/10/2019 13:44:54+0200, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> For chained irqchips this is a pretty straight-forward
> conversion.
> 
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/pinctrl/pinctrl-ocelot.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
> index fb76fb2e9ea5..eb3dd0d46d6c 100644
> --- a/drivers/pinctrl/pinctrl-ocelot.c
> +++ b/drivers/pinctrl/pinctrl-ocelot.c
> @@ -736,6 +736,7 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
>  				    struct ocelot_pinctrl *info)
>  {
>  	struct gpio_chip *gc;
> +	struct gpio_irq_chip *girq;
>  	int ret, irq;
>  
>  	info->gpio_chip = ocelot_gpiolib_chip;
> @@ -747,22 +748,26 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
>  	gc->of_node = info->dev->of_node;
>  	gc->label = "ocelot-gpio";
>  
> -	ret = devm_gpiochip_add_data(&pdev->dev, gc, info);
> -	if (ret)
> -		return ret;
> -
>  	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
>  	if (irq <= 0)
>  		return irq;
>  
> -	ret = gpiochip_irqchip_add(gc, &ocelot_irqchip, 0, handle_edge_irq,
> -				   IRQ_TYPE_NONE);
> +	girq = &gc->irq;
> +	girq->chip = &ocelot_irqchip;
> +	girq->parent_handler = ocelot_irq_handler;
> +	girq->num_parents = 1;
> +	girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents),
> +				     GFP_KERNEL);
> +	if (!girq->parents)
> +		return -ENOMEM;
> +	girq->parents[0] = irq;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_edge_irq;
> +
> +	ret = devm_gpiochip_add_data(&pdev->dev, gc, info);
>  	if (ret)
>  		return ret;
>  
> -	gpiochip_set_chained_irqchip(gc, &ocelot_irqchip, irq,
> -				     ocelot_irq_handler);
> -
>  	return 0;
>  }
>  
> -- 
> 2.21.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
