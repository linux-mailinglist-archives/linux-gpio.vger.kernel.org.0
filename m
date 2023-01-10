Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB070664E87
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jan 2023 23:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjAJWJL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Jan 2023 17:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbjAJWJJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jan 2023 17:09:09 -0500
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72E15587F
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jan 2023 14:09:06 -0800 (PST)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1pFMnm-000831-L3; Tue, 10 Jan 2023 23:09:02 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH] pinctrl: rockchip: fix reading pull type on rk3568
Date:   Tue, 10 Jan 2023 23:09:01 +0100
Message-ID: <3074976.Y6S9NjorxK@diego>
In-Reply-To: <20230110172955.1258840-1-jonas@kwiboo.se>
References: <20230110172955.1258840-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_PASS,
        T_SPF_HELO_TEMPERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Dienstag, 10. Januar 2023, 18:29:58 CET schrieb Jonas Karlman:
> When reading pinconf-pins from debugfs it fails to get the configured pull
> type on RK3568, "unsupported pinctrl type" error messages is also reported.
> 
> Fix this by adding support for RK3568 in rockchip_get_pull, including a
> reverse of the pull-up value swap applied in rockchip_set_pull so that
> pull-up is correctly reported in pinconf-pins.
> Also update the workaround comment to reflect affected pins, GPIO0_D3-D6.
> 
> Fixes: c0dadc0e47a8 ("pinctrl: rockchip: add support for rk3568")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 849d5fa2a362..5eeac92f610a 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -2436,10 +2436,19 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
>  	case RK3308:
>  	case RK3368:
>  	case RK3399:
> +	case RK3568:
>  	case RK3588:
>  		pull_type = bank->pull_type[pin_num / 8];
>  		data >>= bit;
>  		data &= (1 << RK3188_PULL_BITS_PER_PIN) - 1;
> +		/*
> +		 * In the TRM, pull-up being 1 for everything except the GPIO0_D3-D6,
> +		 * where that pull up value becomes 3.
> +		 */
> +		if (ctrl->type == RK3568 && bank->bank_num == 0 && pin_num >= 27 && pin_num <= 30) {
> +			if (data == 3)
> +				data = 1;
> +		}
>  
>  		return rockchip_pull_list[pull_type][data];
>  	default:
> @@ -2497,7 +2506,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
>  			}
>  		}
>  		/*
> -		 * In the TRM, pull-up being 1 for everything except the GPIO0_D0-D6,
> +		 * In the TRM, pull-up being 1 for everything except the GPIO0_D3-D6,
>  		 * where that pull up value becomes 3.
>  		 */
>  		if (ctrl->type == RK3568 && bank->bank_num == 0 && pin_num >= 27 && pin_num <= 30) {
> 




