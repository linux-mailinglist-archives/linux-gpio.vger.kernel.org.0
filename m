Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9532925EB32
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Sep 2020 00:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgIEWDw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 18:03:52 -0400
Received: from gloria.sntech.de ([185.11.138.130]:33778 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728327AbgIEWDw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 5 Sep 2020 18:03:52 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kEgHm-0005ic-Pe; Sun, 06 Sep 2020 00:03:50 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linus.walleij@linaro.org, Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH 3/6] pinctrl: rockchip: create irq mapping in gpio_to_irq
Date:   Sun, 06 Sep 2020 00:03:50 +0200
Message-ID: <3620235.rk29NJRsjD@diego>
In-Reply-To: <20200831084753.7115-4-jay.xu@rock-chips.com>
References: <20200831084753.7115-1-jay.xu@rock-chips.com> <20200831084753.7115-4-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Montag, 31. August 2020, 10:47:50 CEST schrieb Jianqun Xu:
> Remove totally irq mappings create in probe, the gpio irq mapping will
> be created when do
>     gpio_to_irq ->
>         rockchip_gpio_to_irq ->
>             irq_create_mapping
> 
> This patch can speed up system boot on, also abandon many unused irq
> mappings' create.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 54abda7b7be8..265d64b8c4f5 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3196,7 +3196,7 @@ static void rockchip_irq_demux(struct irq_desc *desc)
>  
>  		irq = __ffs(pend);
>  		pend &= ~BIT(irq);
> -		virq = irq_linear_revmap(bank->domain, irq);
> +		virq = irq_find_mapping(bank->domain, irq);
>  
>  		if (!virq) {
>  			dev_err(bank->drvdata->dev, "unmapped irq %d\n", irq);
> @@ -3375,7 +3375,7 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
>  	unsigned int clr = IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
>  	struct irq_chip_generic *gc;
>  	int ret;
> -	int i, j;
> +	int i;
>  
>  	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
>  		if (!bank->valid) {
> @@ -3402,7 +3402,7 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
>  
>  		ret = irq_alloc_domain_generic_chips(bank->domain, 32, 1,
>  					 "rockchip_gpio_irq", handle_level_irq,
> -					 clr, 0, IRQ_GC_INIT_MASK_CACHE);
> +					 clr, 0, 0);
>  		if (ret) {
>  			dev_err(&pdev->dev, "could not alloc generic chips for bank %s\n",
>  				bank->name);
> @@ -3411,14 +3411,6 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
>  			continue;
>  		}
>  
> -		/*
> -		 * Linux assumes that all interrupts start out disabled/masked.
> -		 * Our driver only uses the concept of masked and always keeps
> -		 * things enabled, so for us that's all masked and all enabled.
> -		 */
> -		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTMASK);
> -		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTEN);
> -
>  		gc = irq_get_domain_generic_chip(bank->domain, 0);
>  		gc->reg_base = bank->reg_base;
>  		gc->private = bank;
> @@ -3435,13 +3427,17 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
>  		gc->chip_types[0].chip.irq_set_type = rockchip_irq_set_type;
>  		gc->wake_enabled = IRQ_MSK(bank->nr_pins);
>  
> +		/*
> +		 * Linux assumes that all interrupts start out disabled/masked.
> +		 * Our driver only uses the concept of masked and always keeps
> +		 * things enabled, so for us that's all masked and all enabled.
> +		 */
> +		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTMASK);
> +		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTEN);
> +		gc->mask_cache = 0xffffffff;
> +
>  		irq_set_chained_handler_and_data(bank->irq,
>  						 rockchip_irq_demux, bank);
> -
> -		/* map the gpio irqs here, when the clock is still running */
> -		for (j = 0 ; j < 32 ; j++)
> -			irq_create_mapping(bank->domain, j);
> -
>  		clk_disable(bank->clk);
>  	}
>  
> 




