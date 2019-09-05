Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 044E6A9A52
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 08:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbfIEGAS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 02:00:18 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:1964 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726175AbfIEGAS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 02:00:18 -0400
X-UUID: af0b181f45a442e1adc4f5a6d77e205e-20190905
X-UUID: af0b181f45a442e1adc4f5a6d77e205e-20190905
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1530193086; Thu, 05 Sep 2019 14:00:12 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Sep 2019 14:00:08 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Sep 2019 14:00:08 +0800
Message-ID: <1567663210.1324.3.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/5] pinctrl: mediatek: Check gpio pin number and use
 binary  search in mtk_hw_pin_field_lookup()
From:   Light Hsieh <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>
Date:   Thu, 5 Sep 2019 14:00:10 +0800
In-Reply-To: <1567662796-25508-1-git-send-email-light.hsieh@mediatek.com>
References: <1567662796-25508-1-git-send-email-light.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-TM-SNTS-SMTP: 01C553FE9CD159425C4B9E487375BD2AB2816699737AD9C83EEC7E12ED10C3E22000:8
X-MTK:  N
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear reviewers, 

v2 is the same as v1 except that commit message is corrected according
to Linus' comment for v1:

1. remove Change-Id lines
2. correct sysfs as debugfs

On Thu, 2019-09-05 at 13:53 +0800, Light Hsieh wrote:
> From: Light Hsieh <light.hsieh@mediatek.com>
> 
> 1. Check if gpio pin number is in valid range to prevent from get invalid
>    pointer 'desc' in the following code:
> 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
> 
> 2. Use binary search in mtk_hw_pin_field_lookup()
>    Modify mtk_hw_pin_field_lookup() to use binary search for accelerating
>    search.
> 
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 24 +++++++++++++++++++-----
>  drivers/pinctrl/mediatek/pinctrl-paris.c         | 19 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 20e1c89..4687f63 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -68,7 +68,7 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
>  {
>  	const struct mtk_pin_field_calc *c, *e;
>  	const struct mtk_pin_reg_calc *rc;
> -	u32 bits;
> +	u32 bits, start = 0, end, found = 0, check;
>  
>  	if (hw->soc->reg_cal && hw->soc->reg_cal[field].range) {
>  		rc = &hw->soc->reg_cal[field];
> @@ -79,21 +79,32 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
>  		return -ENOTSUPP;
>  	}
>  
> +	end = rc->nranges - 1;
>  	c = rc->range;
>  	e = c + rc->nranges;
>  
> -	while (c < e) {
> -		if (desc->number >= c->s_pin && desc->number <= c->e_pin)
> +	while (start <= end) {
> +		check = (start + end) >> 1;
> +		if (desc->number >= rc->range[check].s_pin
> +		 && desc->number <= rc->range[check].e_pin) {
> +			found = 1;
>  			break;
> -		c++;
> +		} else if (start == end)
> +			break;
> +		else if (desc->number < rc->range[check].s_pin)
> +			end = check - 1;
> +		else
> +			start = check + 1;
>  	}
>  
> -	if (c >= e) {
> +	if (!found) {
>  		dev_dbg(hw->dev, "Not support field %d for pin = %d (%s)\n",
>  			field, desc->number, desc->name);
>  		return -ENOTSUPP;
>  	}
>  
> +	c = rc->range + check;
> +
>  	if (c->i_base > hw->nbase - 1) {
>  		dev_err(hw->dev,
>  			"Invalid base for field %d for pin = %d (%s)\n",
> @@ -182,6 +193,9 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
>  	if (err)
>  		return err;
>  
> +	if (value < 0 || value > pf.mask)
> +		return -EINVAL;
> +
>  	if (!pf.next)
>  		mtk_rmw(hw, pf.index, pf.offset, pf.mask << pf.bitpos,
>  			(value & pf.mask) << pf.bitpos);
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 923264d..28b4951 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -693,6 +693,9 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
>  	const struct mtk_pin_desc *desc;
>  	int value, err;
>  
> +	if (gpio > hw->soc->npins)
> +		return -EINVAL;
> +
>  	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>  
>  	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &value);
> @@ -708,6 +711,9 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
>  	const struct mtk_pin_desc *desc;
>  	int value, err;
>  
> +	if (gpio > hw->soc->npins)
> +		return -EINVAL;
> +
>  	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>  
>  	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
> @@ -722,6 +728,9 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>  	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
>  	const struct mtk_pin_desc *desc;
>  
> +	if (gpio > hw->soc->npins)
> +		return;
> +
>  	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>  
>  	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
> @@ -729,12 +738,22 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>  
>  static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
>  {
> +	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
> +
> +	if (gpio > hw->soc->npins)
> +		return -EINVAL;
> +
>  	return pinctrl_gpio_direction_input(chip->base + gpio);
>  }
>  
>  static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
>  				     int value)
>  {
> +	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
> +
> +	if (gpio > hw->soc->npins)
> +		return -EINVAL;
> +
>  	mtk_gpio_set(chip, gpio, value);
>  
>  	return pinctrl_gpio_direction_output(chip->base + gpio);


