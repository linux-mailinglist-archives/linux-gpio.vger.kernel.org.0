Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98E2E140578
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 09:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729196AbgAQIa2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 03:30:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:38480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727002AbgAQIa2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jan 2020 03:30:28 -0500
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2D522083E;
        Fri, 17 Jan 2020 08:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579249826;
        bh=aPx1yz/xieg/my6j8U8i2xBZNDcQbxeXnhR+lekzqkQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vf8ClN+HlNNl7TEKQWZLqb1iyLIMclqSxx7pgEU5UCVwMQJ/11AN4zAynQT18wch9
         zBhmcYe1C/Txk+1Kj+hd7Kj4ajHA6WMRK62RXWBb+LnpIh7s7kYdBzGoD9HoWBBebN
         WWNEqViUIVMrRdEwNHCmNEfsxrmJq98y2LDb8c4c=
Received: by mail-il1-f170.google.com with SMTP id f10so20615299ils.8;
        Fri, 17 Jan 2020 00:30:26 -0800 (PST)
X-Gm-Message-State: APjAAAUzT8YRqxg17xWv097ktArUc8VeZCUN3KrnXiehviLoq7AaY3Qe
        dHUgaMcErdGhoBnBYAiqAZYXRhrchIJE7UqRZcA=
X-Google-Smtp-Source: APXvYqxhxO9G9rZzdTTifCGquFcS6Bt+UM24eh3lMyhzziWBq/MJfGaJV5s4itMVzqfcUrr6HdwNWIBiAPbVWb0s548=
X-Received: by 2002:a92:cb10:: with SMTP id s16mr2228781ilo.176.1579249825938;
 Fri, 17 Jan 2020 00:30:25 -0800 (PST)
MIME-Version: 1.0
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Fri, 17 Jan 2020 00:30:15 -0800
X-Gmail-Original-Message-ID: <CAGp9LzqMU8u1gi5mLMFj4=eUuRKZMJSZ16tbxo1J_07nP72Q1Q@mail.gmail.com>
Message-ID: <CAGp9LzqMU8u1gi5mLMFj4=eUuRKZMJSZ16tbxo1J_07nP72Q1Q@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] Check gpio pin number and use binary search in mtk_hw_pin_field_lookup()
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 31, 2019 at 5:42 AM Light Hsieh <light.hsieh@mediatek.com> wrote:
>
> 1. Check if gpio pin number is in valid range to prevent from get invalid
>    pointer 'desc' in the following code:
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>
> 2. Improve  mtk_hw_pin_field_lookup()
> 2.1 Modify mtk_hw_pin_field_lookup() to use binary search for accelerating
>      search.
> 2.2 Correct message after the following check fail:
>     if (hw->soc->reg_cal && hw->soc->reg_cal[field].range) {
>                 rc = &hw->soc->reg_cal[field];
>     The original message is:
>         "Not support field %d for pin %d (%s)\n"
>     However, the check is on soc chip level, not on pin level yet.
>     So the message is corrected as:
>         "Not support field %d for this soc\n"
>
> Change-Id: I498a18df73e6a693e0e35635d5b92b8dc9c063ac

If removing the change-ids, add a prefix "pinctrl: mediatek:" to the
subject, and proper signed-off-by tags,
and then the overall looks good to me.

> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 27 ++++++++++++++++++------
>  drivers/pinctrl/mediatek/pinctrl-paris.c         | 25 ++++++++++++++++++++++
>  2 files changed, 46 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 20e1c89..d63e05e 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -68,32 +68,44 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
>  {
>         const struct mtk_pin_field_calc *c, *e;
>         const struct mtk_pin_reg_calc *rc;
> +       int start = 0, end, check;
> +       bool found = false;
>         u32 bits;
>
>         if (hw->soc->reg_cal && hw->soc->reg_cal[field].range) {
>                 rc = &hw->soc->reg_cal[field];
>         } else {
>                 dev_dbg(hw->dev,
> -                       "Not support field %d for pin %d (%s)\n",
> -                       field, desc->number, desc->name);
> +                       "Not support field %d for this soc\n", field);
>                 return -ENOTSUPP;
>         }
>
> +       end = rc->nranges - 1;
>         c = rc->range;
>         e = c + rc->nranges;
>
> -       while (c < e) {
> -               if (desc->number >= c->s_pin && desc->number <= c->e_pin)
> +       while (start <= end) {
> +               check = (start + end) >> 1;
> +               if (desc->number >= rc->range[check].s_pin
> +                && desc->number <= rc->range[check].e_pin) {
> +                       found = true;
> +                       break;
> +               } else if (start == end)
>                         break;
> -               c++;
> +               else if (desc->number < rc->range[check].s_pin)
> +                       end = check - 1;
> +               else
> +                       start = check + 1;
>         }
>
> -       if (c >= e) {
> +       if (!found) {
>                 dev_dbg(hw->dev, "Not support field %d for pin = %d (%s)\n",
>                         field, desc->number, desc->name);
>                 return -ENOTSUPP;
>         }
>
> +       c = rc->range + check;
> +
>         if (c->i_base > hw->nbase - 1) {
>                 dev_err(hw->dev,
>                         "Invalid base for field %d for pin = %d (%s)\n",
> @@ -182,6 +194,9 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
>         if (err)
>                 return err;
>
> +       if (value < 0 || value > pf.mask)
> +               return -EINVAL;
> +
>         if (!pf.next)
>                 mtk_rmw(hw, pf.index, pf.offset, pf.mask << pf.bitpos,
>                         (value & pf.mask) << pf.bitpos);
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 923264d..3e13ae7 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -81,6 +81,8 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>         int val, val2, err, reg, ret = 1;
>         const struct mtk_pin_desc *desc;
>
> +       if (pin >= hw->soc->npins)
> +               return -EINVAL;
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>
>         switch (param) {
> @@ -206,6 +208,10 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>         int err = 0;
>         u32 reg;
>
> +       if (pin >= hw->soc->npins) {
> +               err = -EINVAL;
> +               goto err;
> +       }
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>
>         switch ((u32)param) {
> @@ -693,6 +699,9 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
>         const struct mtk_pin_desc *desc;
>         int value, err;
>
> +       if (gpio > hw->soc->npins)
> +               return -EINVAL;
> +
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>
>         err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &value);
> @@ -708,6 +717,9 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
>         const struct mtk_pin_desc *desc;
>         int value, err;
>
> +       if (gpio > hw->soc->npins)
> +               return -EINVAL;
> +
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>
>         err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
> @@ -722,6 +734,9 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>         struct mtk_pinctrl *hw = gpiochip_get_data(chip);
>         const struct mtk_pin_desc *desc;
>
> +       if (gpio > hw->soc->npins)
> +               return;
> +
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>
>         mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
> @@ -729,12 +744,22 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>
>  static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
>  {
> +       struct mtk_pinctrl *hw = gpiochip_get_data(chip);
> +
> +       if (gpio > hw->soc->npins)
> +               return -EINVAL;
> +
>         return pinctrl_gpio_direction_input(chip->base + gpio);
>  }
>
>  static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
>                                      int value)
>  {
> +       struct mtk_pinctrl *hw = gpiochip_get_data(chip);
> +
> +       if (gpio > hw->soc->npins)
> +               return -EINVAL;
> +
>         mtk_gpio_set(chip, gpio, value);
>
>         return pinctrl_gpio_direction_output(chip->base + gpio);
> --
> 1.8.1.1.dirty
