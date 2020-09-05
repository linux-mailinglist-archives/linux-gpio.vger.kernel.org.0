Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D103625EB54
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Sep 2020 00:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728505AbgIEWOP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 18:14:15 -0400
Received: from gloria.sntech.de ([185.11.138.130]:33838 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728103AbgIEWOP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 5 Sep 2020 18:14:15 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kEgRp-0005oz-3h; Sun, 06 Sep 2020 00:14:13 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linus.walleij@linaro.org, Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH 5/6] pinctrl: rockchip: fix crash caused by invalid gpio bank
Date:   Sun, 06 Sep 2020 00:14:12 +0200
Message-ID: <6529745.9OfISSL0U5@diego>
In-Reply-To: <20200831085010.7235-1-jay.xu@rock-chips.com>
References: <20200831084753.7115-1-jay.xu@rock-chips.com> <20200831085010.7235-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am Montag, 31. August 2020, 10:50:10 CEST schrieb Jianqun Xu:
> Add valid check for gpio bank.

Please add more description on where this happened.


> Change-Id: Ia4609c3045b5df7879beab3c15d791ff54a1f49b

Please drop the change-id.


> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 6080573155f6..5b16b69e311f 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -2526,9 +2526,9 @@ static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
>  			break;
>  	}
>  
> -	if (ret) {
> +	if (ret && cnt) {
>  		/* revert the already done pin settings */
> -		for (cnt--; cnt >= 0; cnt--)
> +		for (cnt--; cnt >= 0 && !data[cnt].func; cnt--)

This looks unrelated and as it's not a "check for a valid gpio-bank" it
should become a separate patch with a commit message describing it nicely.

>  			rockchip_set_mux(bank, pins[cnt] - bank->pin_base, 0);
>  
>  		return ret;
> @@ -2599,9 +2599,13 @@ static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
>  					      unsigned offset, bool input)
>  {
>  	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
> +	struct rockchip_pin_bank *bank = &info->ctrl->pin_banks[offset / 32];
>  	struct gpio_chip *chip;
>  	int pin;
>  
> +	if (!bank || !bank->valid)
> +		return 0;
> +
>  	chip = range->gc;
>  	pin = offset - chip->base;
>  	dev_dbg(info->dev, "gpio_direction for pin %u as %s-%d to %s\n",
> @@ -3022,6 +3026,8 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
>  
>  	for (bank = 0; bank < info->ctrl->nr_banks; ++bank) {
>  		pin_bank = &info->ctrl->pin_banks[bank];
> +		if (!pin_bank->valid)
> +			continue;

Please add a blank line here

>  		pin_bank->grange.name = pin_bank->name;
>  		pin_bank->grange.id = bank;
>  		pin_bank->grange.pin_base = pin_bank->pin_base;
> 


Thanks
Heiko


