Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464F78C482
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 00:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbfHMWyk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Aug 2019 18:54:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:58542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726964AbfHMWyk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Aug 2019 18:54:40 -0400
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C353B206C2;
        Tue, 13 Aug 2019 22:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565736879;
        bh=T7Z6w1xsGWAFfny9O4/iOR2E3uaR8Uz9otlJR/il04s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=toi9x0nUOLJf0v9iPqYkAOh9i512tGkURD7IlhzYTokb2y0w/JW8yc2d7QK+6Xzbh
         gt09MXUKOALFMQ85wAWfcMD0EuE6xLzy6AXuFPTnL3B1mkoWLs4gwPJIBpZFX3WDfq
         tGmUUkb/Nx5/+JMFUkBpncQjpDi66Im5xP/umAwk=
Received: by mail-wr1-f41.google.com with SMTP id q12so18991155wrj.12;
        Tue, 13 Aug 2019 15:54:38 -0700 (PDT)
X-Gm-Message-State: APjAAAWvg9agj4deTiOIGIajiuYcc2dLeHTUwBT40fSCQQ+J0zNadJP/
        rhtOT+TR94t8wM2rJkaYJ/GL9eyjBJ6QcWrGnsE=
X-Google-Smtp-Source: APXvYqxJC2AxU5bz7n9E8cpm+XdQnNO3ckQI8JhBZibLzaTj5Q5LS505othzwIsDKUwZZe5QuheOaD8p6XNhVA5hW9o=
X-Received: by 2002:a5d:51c7:: with SMTP id n7mr21616412wrv.73.1565736877309;
 Tue, 13 Aug 2019 15:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <1565686400-5711-1-git-send-email-light.hsieh@mediatek.com> <1565686400-5711-2-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1565686400-5711-2-git-send-email-light.hsieh@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Tue, 13 Aug 2019 15:54:26 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzq7SnZBO4QEkycszZ29D7FVn_WUvi3uGX5s8Wzqn2a3CQ@mail.gmail.com>
Message-ID: <CAGp9Lzq7SnZBO4QEkycszZ29D7FVn_WUvi3uGX5s8Wzqn2a3CQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] pinctrl: mediatek: Check gpio pin number and use
 binary search in mtk_hw_pin_field_lookup()
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 13, 2019 at 1:53 AM Light Hsieh <light.hsieh@mediatek.com> wrote:
>
> From: Light Hsieh <light.hsieh@mediatek.com>
>
> 1. Check if gpio pin number is in valid range to prevent from get invalid
>    pointer 'desc' in the following code:
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>
> 2. Use binary search in mtk_hw_pin_field_lookup()
>    Modify mtk_hw_pin_field_lookup() to use binary search for accelerating
>    search.
>
> Change-Id: I22b4644ec216b90dd9dd5e223cc41d43761701b0

remove all of Change-Id in all the patches in the series

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
>         const struct mtk_pin_field_calc *c, *e;
>         const struct mtk_pin_reg_calc *rc;
> -       u32 bits;
> +       u32 bits, start = 0, end, found = 0, check;

variable found should be bool type, and the declaration should be
listed in reverse Xmas tree order

>
>         if (hw->soc->reg_cal && hw->soc->reg_cal[field].range) {
>                 rc = &hw->soc->reg_cal[field];
> @@ -79,21 +79,32 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
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
> +                       found = 1;

found = true;

>                         break;
> -               c++;
> +               } else if (start == end)
> +                       break;
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
> @@ -182,6 +193,9 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
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
> index 923264d..28b4951 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -693,6 +693,9 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
>         const struct mtk_pin_desc *desc;
>         int value, err;
>
> +       if (gpio > hw->soc->npins)
> +               return -EINVAL;
> +
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>
>         err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &value);
> @@ -708,6 +711,9 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
>         const struct mtk_pin_desc *desc;
>         int value, err;
>
> +       if (gpio > hw->soc->npins)
> +               return -EINVAL;
> +
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>
>         err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
> @@ -722,6 +728,9 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>         struct mtk_pinctrl *hw = gpiochip_get_data(chip);
>         const struct mtk_pin_desc *desc;
>
> +       if (gpio > hw->soc->npins)
> +               return;
> +
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>
>         mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
> @@ -729,12 +738,22 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
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
>
