Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB4F34CBC85
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Mar 2022 12:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbiCCL3E convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 3 Mar 2022 06:29:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbiCCL3E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Mar 2022 06:29:04 -0500
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035F2434B4
        for <linux-gpio@vger.kernel.org>; Thu,  3 Mar 2022 03:28:15 -0800 (PST)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1nPjcx-0007jj-Gf; Thu, 03 Mar 2022 12:28:11 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linus.walleij@linaro.org, linux-rockchip@lists.infradead.org,
        linux-gpio@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH 1/2] gpio: rockchip: make gpio work without cru module
Date:   Thu, 03 Mar 2022 12:28:10 +0100
Message-ID: <8576445.5iEe77X0Xf@diego>
In-Reply-To: <20220303062211.1378883-2-jay.xu@rock-chips.com>
References: <20220303062211.1378883-1-jay.xu@rock-chips.com> <20220303062211.1378883-2-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jianqun,

Am Donnerstag, 3. März 2022, 07:22:10 CET schrieb Jianqun Xu:
> In some case the system may has no builtin cru module, the gpio driver
> will fail to get periph clock and debounce clock.

can you elaborate a bit on what these cases are?

> On rockchip SoCs, the pclk and dbg clk are default to be enabled and
> ungated, the gpio possible to work without cru module.
> 
> This patch makes gpio work fine without cru module.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>  drivers/gpio/gpio-rockchip.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index a4c4e4584f5b..1da0324445cc 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -195,6 +195,9 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
>  	unsigned int cur_div_reg;
>  	u64 div;
>  
> +	if (!bank->db_clk)
> +		return -ENOENT;
> +
>  	if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {
>  		div_debounce_support = true;
>  		freq = clk_get_rate(bank->db_clk);
> @@ -654,8 +657,10 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>  		return -EINVAL;
>  
>  	bank->clk = of_clk_get(bank->of_node, 0);
> -	if (IS_ERR(bank->clk))
> -		return PTR_ERR(bank->clk);
> +	if (IS_ERR(bank->clk)) {
> +		bank->clk = NULL;
> +		dev_warn(bank->dev, "works without clk pm\n");

I'd definitly expect a more sensitive handling here (and below).

I.e. the change right now, simply disables all error handling.
But I do expect a handling difference between:
- clock described in DT, but not available - should fail
- clock not described in DT - can be allowed to go to NULL


Heiko


> +	}
>  
>  	clk_prepare_enable(bank->clk);
>  	id = readl(bank->reg_base + gpio_regs_v2.version_id);
> @@ -666,9 +671,8 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>  		bank->gpio_type = GPIO_TYPE_V2;
>  		bank->db_clk = of_clk_get(bank->of_node, 1);
>  		if (IS_ERR(bank->db_clk)) {
> -			dev_err(bank->dev, "cannot find debounce clk\n");
> -			clk_disable_unprepare(bank->clk);
> -			return -EINVAL;
> +			bank->db_clk = NULL;
> +			dev_warn(bank->dev, "works without debounce clk pm\n");
>  		}
>  	} else {
>  		bank->gpio_regs = &gpio_regs_v1;
> 




