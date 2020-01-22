Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6031B145C98
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2020 20:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgAVTmS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jan 2020 14:42:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:39248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725827AbgAVTmS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Jan 2020 14:42:18 -0500
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9CB2324656;
        Wed, 22 Jan 2020 19:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579722136;
        bh=vSh/LzY7wnIEE4bBX0Rl1f0hkSHm9NzERbFFttaLlF0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=m/LEOYSMZJG6XnTa1OkWt0zaAl8D3V/InYAb4UZX61M2xpNZdX+vd3up9gQi793G1
         SJ2RIRK70mrh27gxHDJcagrodo0yn/pLkvGWjh7hfSJYrb37U2hu90NjJ0ZvAMzbqO
         A9/BRIhB3n0mnsi3T5nTlNsIWXdtyCpLqLLrTHaU=
Received: by mail-il1-f172.google.com with SMTP id c4so326993ilo.7;
        Wed, 22 Jan 2020 11:42:16 -0800 (PST)
X-Gm-Message-State: APjAAAWjGGcZRQJWwtr7+kTQQLgBDZF4tsmwzIDWbxwIeDmpmoeepfnF
        twb/H//raQOFpLyjQYOkRm/xRMH67XbxeWP0AsA=
X-Google-Smtp-Source: APXvYqxhuzafvvtzgJNqXMkCLYnRnNF77njy55bed5yYyNwQhldrW3dn8yjZaH7/VwoYxM6ACSzpvKs4J1MS7KiBu7Q=
X-Received: by 2002:a92:5e46:: with SMTP id s67mr7138225ilb.162.1579722135945;
 Wed, 22 Jan 2020 11:42:15 -0800 (PST)
MIME-Version: 1.0
References: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com> <1579675994-7001-3-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1579675994-7001-3-git-send-email-light.hsieh@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Wed, 22 Jan 2020 11:42:04 -0800
X-Gmail-Original-Message-ID: <CAGp9Lzqnscf+xySPEJ+FsPDEmcjbPNE0GfbMDPexqqfGwhH0WQ@mail.gmail.com>
Message-ID: <CAGp9Lzqnscf+xySPEJ+FsPDEmcjbPNE0GfbMDPexqqfGwhH0WQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/6] pinctrl: mediatek: Refine mtk_pinconf_get() and mtk_pinconf_set()
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
> 1.Refine mtk_pinconf_get():
>   Use only one occurrence of return at end of this function.
>
> 2.Refine mtk_pinconf_set():
> 2.1 Use only one occurrence of return at end of this function.
> 2.2 Modify case of PIN_CONFIG_INPUT_ENABLE -
> 2.2.1
>     Regard all non-zero setting value as enable, instead of always enable.
> 2.2.2
>     Remove check of ies_present flag and always invoke mtk_hw_set_value()
>     since mtk_hw_pin_field_lookup() invoked inside mtk_hw_set_value() has
>     the same effect of checking if ies control is supported.
>     [The rationale is that: available of a control is always checked
>      in mtk_hw_pin_field_lookup() and no need to add ies_present flag
>      specially for ies control.]
> 2.3 Simply code logic for case of PIN_CONFIG_INPUT_SCHMITT.
> 2.4 Add case for PIN_CONFIG_INPUT_SCHMITT_ENABLE and process it with the
>     same code for case of PIN_CONFIG_INPUT_SCHMITT.
>
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-mt6765.c |   1 -
>  drivers/pinctrl/mediatek/pinctrl-mt8183.c |   1 -
>  drivers/pinctrl/mediatek/pinctrl-paris.c  | 171 ++++++++++++------------------
>  3 files changed, 65 insertions(+), 108 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> index 1212264..7fae397 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> @@ -1070,7 +1070,6 @@
>         .ngrps = ARRAY_SIZE(mtk_pins_mt6765),
>         .eint_hw = &mt6765_eint_hw,
>         .gpio_m = 0,
> -       .ies_present = true,
>         .base_names = mt6765_pinctrl_register_base_names,
>         .nbase_names = ARRAY_SIZE(mt6765_pinctrl_register_base_names),
>         .bias_disable_set = mtk_pinconf_bias_disable_set,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8183.c b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> index 9a74d50..4eca818 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> @@ -554,7 +554,6 @@
>         .ngrps = ARRAY_SIZE(mtk_pins_mt8183),
>         .eint_hw = &mt8183_eint_hw,
>         .gpio_m = 0,
> -       .ies_present = true,
>         .base_names = mt8183_pinctrl_register_base_names,
>         .nbase_names = ARRAY_SIZE(mt8183_pinctrl_register_base_names),
>         .bias_disable_set = mtk_pinconf_bias_disable_set_rev1,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 3e13ae7..2f07500 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -81,37 +81,30 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>         int val, val2, err, reg, ret = 1;
>         const struct mtk_pin_desc *desc;
>
> -       if (pin >= hw->soc->npins)
> -               return -EINVAL;
> +       if (pin >= hw->soc->npins) {
> +               err = -EINVAL;
> +               goto out;
> +       }
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>
>         switch (param) {
>         case PIN_CONFIG_BIAS_DISABLE:
> -               if (hw->soc->bias_disable_get) {
> +               if (hw->soc->bias_disable_get)
>                         err = hw->soc->bias_disable_get(hw, desc, &ret);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         case PIN_CONFIG_BIAS_PULL_UP:
> -               if (hw->soc->bias_get) {
> +               if (hw->soc->bias_get)
>                         err = hw->soc->bias_get(hw, desc, 1, &ret);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         case PIN_CONFIG_BIAS_PULL_DOWN:
> -               if (hw->soc->bias_get) {
> +               if (hw->soc->bias_get)
>                         err = hw->soc->bias_get(hw, desc, 0, &ret);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         case PIN_CONFIG_SLEW_RATE:
>                 err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SR, &val);
> @@ -126,12 +119,16 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>         case PIN_CONFIG_OUTPUT_ENABLE:
>                 err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &val);
>                 if (err)
> -                       return err;
> -
> -               /* HW takes input mode as zero; output mode as non-zero */
> -               if ((val && param == PIN_CONFIG_INPUT_ENABLE) ||
> -                   (!val && param == PIN_CONFIG_OUTPUT_ENABLE))
> -                       return -EINVAL;
> +                       goto out;
> +               /*     CONFIG     Current direction return value
> +                * -------------  ----------------- ----------------------
> +                * OUTPUT_ENABLE       output       1 (= HW value)
> +                *                     input        0 (= HW value)
> +                * INPUT_ENABLE        output       0 (= reverse HW value)
> +                *                     input        1 (= reverse HW value)
> +                */
> +               if (param == PIN_CONFIG_INPUT_ENABLE)
> +                       val = !val;
>
>                 break;
>         case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> @@ -148,13 +145,10 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>
>                 break;
>         case PIN_CONFIG_DRIVE_STRENGTH:
> -               if (hw->soc->drive_get) {
> +               if (hw->soc->drive_get)
>                         err = hw->soc->drive_get(hw, desc, &ret);
> -                       if (err)
> -                               return err;
> -               } else {
> +               else
>                         err = -ENOTSUPP;
> -               }
>                 break;
>         case MTK_PIN_CONFIG_TDSEL:
>         case MTK_PIN_CONFIG_RDSEL:
> @@ -175,28 +169,24 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>
>                         pullup = param == MTK_PIN_CONFIG_PU_ADV;
>                         err = hw->soc->adv_pull_get(hw, desc, pullup, &ret);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               } else
> +                       err = -ENOTSUPP;
>                 break;
>         case MTK_PIN_CONFIG_DRV_ADV:
> -               if (hw->soc->adv_drive_get) {
> +               if (hw->soc->adv_drive_get)
>                         err = hw->soc->adv_drive_get(hw, desc, &ret);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         default:
> -               return -ENOTSUPP;
> +               err = -ENOTSUPP;
>         }
>
> -       *config = pinconf_to_config_packed(param, ret);
> +out:
> +       if (!err)
> +               *config = pinconf_to_config_packed(param, ret);
>
> -       return 0;
> +       return err;
>  }
>
>  static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
> @@ -216,60 +206,47 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>
>         switch ((u32)param) {
>         case PIN_CONFIG_BIAS_DISABLE:
> -               if (hw->soc->bias_disable_set) {
> +               if (hw->soc->bias_disable_set)
>                         err = hw->soc->bias_disable_set(hw, desc);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         case PIN_CONFIG_BIAS_PULL_UP:
> -               if (hw->soc->bias_set) {
> +               if (hw->soc->bias_set)
>                         err = hw->soc->bias_set(hw, desc, 1);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         case PIN_CONFIG_BIAS_PULL_DOWN:
> -               if (hw->soc->bias_set) {
> +               if (hw->soc->bias_set)
>                         err = hw->soc->bias_set(hw, desc, 0);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         case PIN_CONFIG_OUTPUT_ENABLE:
>                 err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
>                                        MTK_DISABLE);
> -               if (err)
> +               /* Keep set direction to consider the case that a GPIO pin
> +                *  does not have SMT control
> +                */
> +               if (err != -ENOTSUPP)
>                         goto err;
>
>                 err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
>                                        MTK_OUTPUT);
> -               if (err)
> -                       goto err;
>                 break;
>         case PIN_CONFIG_INPUT_ENABLE:
> -               if (hw->soc->ies_present) {
> -                       mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES,
> -                                        MTK_ENABLE);
> -               }
> +               /* regard all non-zero value as enable */
> +               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES, !!arg);
> +               if (err)
> +                       goto err;
>
>                 err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
>                                        MTK_INPUT);
> -               if (err)
> -                       goto err;
>                 break;
>         case PIN_CONFIG_SLEW_RATE:
> -               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SR,
> -                                      arg);
> -               if (err)
> -                       goto err;
> -
> +               /* regard all non-zero value as enable */
> +               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SR, !!arg);
>                 break;
>         case PIN_CONFIG_OUTPUT:
>                 err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
> @@ -279,41 +256,29 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>
>                 err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO,
>                                        arg);
> -               if (err)
> -                       goto err;
>                 break;
> +       case PIN_CONFIG_INPUT_SCHMITT:
>         case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
>                 /* arg = 1: Input mode & SMT enable ;
>                  * arg = 0: Output mode & SMT disable
>                  */
> -               arg = arg ? 2 : 1;
> -               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
> -                                      arg & 1);
> +               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, !arg);
>                 if (err)
>                         goto err;
>
> -               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
> -                                      !!(arg & 2));
> -               if (err)
> -                       goto err;
> +               err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, !!arg);
>                 break;
>         case PIN_CONFIG_DRIVE_STRENGTH:
> -               if (hw->soc->drive_set) {
> +               if (hw->soc->drive_set)
>                         err = hw->soc->drive_set(hw, desc, arg);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         case MTK_PIN_CONFIG_TDSEL:
>         case MTK_PIN_CONFIG_RDSEL:
>                 reg = (param == MTK_PIN_CONFIG_TDSEL) ?
>                        PINCTRL_PIN_REG_TDSEL : PINCTRL_PIN_REG_RDSEL;
> -
>                 err = mtk_hw_set_value(hw, desc, reg, arg);
> -               if (err)
> -                       goto err;
>                 break;
>         case MTK_PIN_CONFIG_PU_ADV:
>         case MTK_PIN_CONFIG_PD_ADV:
> @@ -323,20 +288,14 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>                         pullup = param == MTK_PIN_CONFIG_PU_ADV;
>                         err = hw->soc->adv_pull_set(hw, desc, pullup,
>                                                     arg);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               } else
> +                       err = -ENOTSUPP;
>                 break;
>         case MTK_PIN_CONFIG_DRV_ADV:
> -               if (hw->soc->adv_drive_set) {
> +               if (hw->soc->adv_drive_set)
>                         err = hw->soc->adv_drive_set(hw, desc, arg);
> -                       if (err)
> -                               return err;
> -               } else {
> -                       return -ENOTSUPP;
> -               }
> +               else
> +                       err = -ENOTSUPP;
>                 break;
>         default:
>                 err = -ENOTSUPP;
> --
> 1.8.1.1.dirty
