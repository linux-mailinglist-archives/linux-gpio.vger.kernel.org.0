Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5288225EB4C
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Sep 2020 00:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728726AbgIEWJa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 18:09:30 -0400
Received: from gloria.sntech.de ([185.11.138.130]:33806 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728680AbgIEWJ2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 5 Sep 2020 18:09:28 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kEgNC-0005mD-Pd; Sun, 06 Sep 2020 00:09:26 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linus.walleij@linaro.org, Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH 4/6] pinctrl: rockchip: do not set gpio if bank invalid
Date:   Sun, 06 Sep 2020 00:09:26 +0200
Message-ID: <1687104.4lZP0y4C37@diego>
In-Reply-To: <20200831084753.7115-5-jay.xu@rock-chips.com>
References: <20200831084753.7115-1-jay.xu@rock-chips.com> <20200831084753.7115-5-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Montag, 31. August 2020, 10:47:51 CEST schrieb Jianqun Xu:
> Add valid check for gpio bank.

As this obviously fixes a problem you encountered please elaborate a bit more.
Just so that people reading the log later understand when this issue surfaced.

Also - maybe even more important - why is this limited to PIN_CONFIG_OUTPUT?
Like when the whole bank is not valid, you should be able to return the -ENOTSUPP
even before entering the "for" loop in these functions.


> Change-Id: Ib03e2910a7316bd61df18236151e371c4d04077a

Please remove the changeId.

Thanks
Heiko

> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 265d64b8c4f5..6080573155f6 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -2687,6 +2687,9 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>  				return rc;
>  			break;
>  		case PIN_CONFIG_OUTPUT:
> +			if (!bank->valid)
> +				return -ENOTSUPP;
> +
>  			rockchip_gpio_set(&bank->gpio_chip,
>  					  pin - bank->pin_base, arg);
>  			rc = _rockchip_pmx_gpio_set_direction(&bank->gpio_chip,
> @@ -2752,6 +2755,9 @@ static int rockchip_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
>  		arg = 1;
>  		break;
>  	case PIN_CONFIG_OUTPUT:
> +		if (!bank->valid)
> +			return -ENOTSUPP;
> +
>  		rc = rockchip_get_mux(bank, pin - bank->pin_base);
>  		if (rc != RK_FUNC_GPIO)
>  			return -EINVAL;
> 




