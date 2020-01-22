Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5D4B145C92
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2020 20:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgAVTkf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jan 2020 14:40:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:36918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726103AbgAVTkf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Jan 2020 14:40:35 -0500
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED1432465A;
        Wed, 22 Jan 2020 19:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579722034;
        bh=I3teCKf41lP38KMQNsBxxI2JMwPoZieKq5xCCRmpZbQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=T/meyFNs0x2NyU4io1GwIRdQYju4lFfJ8kTVgxkNwazAVqQYaGA1dDJigw0c8oVwG
         43K1901Un1lQMDvrVYsg7VP2HI4ZwxrX1uE/7vNPRp24IdsE1ZeO5fTwrmqWWBjEmA
         NLu9gD9wF+GMa54UdLTW3yFX+F4/svJ68CZf3gSw=
Received: by mail-io1-f47.google.com with SMTP id z193so514057iof.1;
        Wed, 22 Jan 2020 11:40:33 -0800 (PST)
X-Gm-Message-State: APjAAAUFvLGUrk2Lsmb3QWTmtJclVl+pls4E/wl8dftAsIATCkXtPAqq
        aDZR3nT6l44eH9q0AwNfI8YbC2S7wLdiiQpZ+r8=
X-Google-Smtp-Source: APXvYqxqe7QNclBhEk+9YkjlIpvsr1YD1RWaWjX9rBV7ifqkcke9QWlPnpq6UBmwlFzuEDWombaYJpCrfBZeTIBQo6A=
X-Received: by 2002:a6b:e711:: with SMTP id b17mr7897849ioh.307.1579722033348;
 Wed, 22 Jan 2020 11:40:33 -0800 (PST)
MIME-Version: 1.0
References: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Wed, 22 Jan 2020 11:40:22 -0800
X-Gmail-Original-Message-ID: <CAGp9LzqT_mncGPD5wh0rtc62vd0ak+tm22TgX1eUGeesY33zDg@mail.gmail.com>
Message-ID: <CAGp9LzqT_mncGPD5wh0rtc62vd0ak+tm22TgX1eUGeesY33zDg@mail.gmail.com>
Subject: Re: [PATCH v8 1/6] pinctrl: mediatek: Check gpio pin number and use
 binary search in mtk_hw_pin_field_lookup()
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

On Tue, Jan 21, 2020 at 10:53 PM <light.hsieh@mediatek.com> wrote:
>
> From: Light Hsieh <light.hsieh@mediatek.com>
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
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

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
