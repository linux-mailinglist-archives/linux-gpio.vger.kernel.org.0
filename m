Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48091392A04
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 10:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235740AbhE0Iut (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 04:50:49 -0400
Received: from gloria.sntech.de ([185.11.138.130]:35092 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235741AbhE0Iu1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 May 2021 04:50:27 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lmBhB-0006sN-AU; Thu, 27 May 2021 10:48:49 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linus.walleij@linaro.org, robh+dt@kernel.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH v5 5/7] gpio/rockchip: support next version gpio controller
Date:   Thu, 27 May 2021 10:48:48 +0200
Message-ID: <4162826.Y6S9NjorxK@diego>
In-Reply-To: <20210527071345.1424493-1-jay.xu@rock-chips.com>
References: <20210527071239.1424430-1-jay.xu@rock-chips.com> <20210527071345.1424493-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Donnerstag, 27. Mai 2021, 09:13:45 CEST schrieb Jianqun Xu:
> The next version gpio controller on SoCs like rk3568 have more write
> mask bits for registers.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

> @@ -549,15 +677,33 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>  		return PTR_ERR(bank->reg_base);
>  
>  	bank->irq = irq_of_parse_and_map(bank->of_node, 0);
> -
> -	bank->gpio_regs = &gpio_regs_v1;
> -	bank->gpio_type = GPIO_TYPE_V1;
> +	if (!bank->irq)
> +		return -EINVAL;
>  
>  	bank->clk = of_clk_get(bank->of_node, 0);
> -	if (!IS_ERR(bank->clk))
> -		return clk_prepare(bank->clk);
> +	if (IS_ERR(bank->clk))
> +		return PTR_ERR(bank->clk);
> +
> +	clk_prepare_enable(bank->clk);
> +	id = readl(bank->reg_base + gpio_regs_v2.version_id);
> +
> +	/* If not gpio v2, that is default to v1. */
> +	if (id == GPIO_TYPE_V2) {
> +		bank->gpio_regs = &gpio_regs_v2;
> +		bank->gpio_type = GPIO_TYPE_V2;
> +		bank->db_clk = of_clk_get(bank->of_node, 1);
> +		if (IS_ERR(bank->db_clk)) {
> +			dev_err(bank->dev, "cannot find debounce clk\n");
> +			bank->db_clk = NULL;
> +			clk_disable(bank->clk);
> +			return -EINVAL;
> +		}
> +	} else {
> +		bank->gpio_regs = &gpio_regs_v1;
> +		bank->gpio_type = GPIO_TYPE_V1;
> +	}
>  
> -	bank->clk = NULL;
> +	clk_disable(bank->clk);

NIT: you could move the "always enable clock for gpio controller" patch
before adding the v2 support. That way you save on not needing to add
the clock handling here.

Otherwise looks nice to me.

Acked-by: Heiko Stuebner <heiko@sntech.de>


Heiko


>  	return 0;
>  }
>  
> diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
> index 1b774b6bbc3e..589d4d2a98c9 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.h
> +++ b/drivers/pinctrl/pinctrl-rockchip.h
> @@ -121,6 +121,7 @@ struct rockchip_drv {
>   * @reg_base: register base of the gpio bank
>   * @regmap_pull: optional separate register for additional pull settings
>   * @clk: clock of the gpio bank
> + * @db_clk: clock of the gpio debounce
>   * @irq: interrupt of the gpio bank
>   * @saved_masks: Saved content of GPIO_INTEN at suspend time.
>   * @pin_base: first pin number
> @@ -146,6 +147,7 @@ struct rockchip_pin_bank {
>  	void __iomem			*reg_base;
>  	struct regmap			*regmap_pull;
>  	struct clk			*clk;
> +	struct clk			*db_clk;
>  	int				irq;
>  	u32				saved_masks;
>  	u32				pin_base;
> 




