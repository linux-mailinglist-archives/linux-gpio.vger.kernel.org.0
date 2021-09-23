Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F5B415929
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 09:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237451AbhIWHhe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 03:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231672AbhIWHhd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 03:37:33 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4171FC061756
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 00:36:02 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g41so22842590lfv.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 00:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+cC8xLRJRWGZD+7uLcE09Frc3fOq9euGoUEJen8E9co=;
        b=j0nw7L4/BMsPxeqXknHfUZiRTM18E3iaQ7Zd/S1kr8QhKn2zhsDclGDJr6Xp1nTleh
         qIeM0YzJ3rR0P9utml9LCoEfM1kmaY9Dy2MUjob0KrF5+4izT203pvcC8JeL1trcdUzn
         zfHYlJCx1t1Y+w4LxFBuuASLkF05zz2uqaxCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+cC8xLRJRWGZD+7uLcE09Frc3fOq9euGoUEJen8E9co=;
        b=O3htRzjP0HYiQfWmsGITOpr69QQsqivPXFzXufs3LKDbdj5xdBr4LHwsW2nypPW74Y
         oLTMb0KfFs1oYF7D0cKsMqTnZXhep3lJ0P1PUM7eeGE8lVC8IbLBITJY5ouNJYO0XyB/
         ztVYjAeFg6ThyaApnAKJvO+WorIpnVMx3ee4gEfCWCIJ0VoTvZkyOvMHT6gmShGRbjwv
         f9k3WwtYlAB+wDDVD3I4NtQ9OSE7Wd0c1pjfeBuOcVs79YxnA3R9WZlVzJ4ecX2eP92m
         K/qImuQ1saP64atEUZuZp/aafIlhcNfED1Q0fVEe6fbMyPIw2pRiBXKMjms4NN+jkqUQ
         Q+3g==
X-Gm-Message-State: AOAM533fuvsZeaLiWigqnwQNmUkxCsAvGmGfCLb1xNcM161xHYWQGwOz
        3LQE/fGi82UAnS99bpfBM1HuyA15WEo2gTaTdmf0bA==
X-Google-Smtp-Source: ABdhPJyeVUu8+Bb/z+yTmjSJR1LlSnBy3H6YcTKdJ9lsnUD6e6FwatPmis30FrQM5bEc9hLx5hfyL7pA6qYaucUFuDg=
X-Received: by 2002:ac2:4e0f:: with SMTP id e15mr2807538lfr.308.1632382560340;
 Thu, 23 Sep 2021 00:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210922025640.11600-1-zhiyong.tao@mediatek.com> <20210922025640.11600-5-zhiyong.tao@mediatek.com>
In-Reply-To: <20210922025640.11600-5-zhiyong.tao@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 23 Sep 2021 15:35:49 +0800
Message-ID: <CAGXv+5Fp0coJn1zVHZU_TWQyqtuc0EEPU4a7uaEsjX6u6EEhzA@mail.gmail.com>
Subject: Re: [PATCH v13 4/5] pinctrl: mediatek: support rsel feature
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Light Hsieh <light.hsieh@mediatek.com>,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Wed, Sep 22, 2021 at 10:59 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This patch supports rsel(resistance selection) feature for I2C pins.
> It provides more resistance selection solution in different ICs.
> It provides rsel define and si unit solution by identifying
> "mediatek,rsel_resistance_in_si_unit" property in pio dtsi node.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 231 +++++++++++++++---
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  45 ++++
>  drivers/pinctrl/mediatek/pinctrl-paris.c      |  60 +++--
>  3 files changed, 288 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 5b3b048725cc..e84001923aaf 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -661,6 +661,181 @@ static int mtk_pinconf_bias_set_pupd_r1_r0(struct mtk_pinctrl *hw,
>         return err;
>  }
>
> +static int mtk_hw_pin_rsel_lookup(struct mtk_pinctrl *hw,
> +                                 const struct mtk_pin_desc *desc,
> +                                 u32 pullup, u32 arg, u32 *rsel_val)
> +{
> +       const struct mtk_pin_rsel *rsel;
> +       int check;
> +       bool found = false;
> +
> +       rsel = hw->soc->pin_rsel;
> +
> +       for (check = 0; check <= hw->soc->npin_rsel - 1; check++) {
> +               if (desc->number >= rsel[check].s_pin &&
> +                   desc->number <= rsel[check].e_pin) {
> +                       if (pullup) {
> +                               if (rsel[check].up_rsel == arg) {
> +                                       found = true;
> +                                       *rsel_val = rsel[check].rsel_index;
> +                                       break;

The code could simply `return 0` after setting *rsel_val, then we don't have
to have the `found` variable.

Unless your goal is to use the last matching value in the case of duplicates,
instead of the first. If that is the case you should add a comment stating
so along with the reason,

And the structure could be written as

    if (pin not in range)
        continue;

    ... check value ...

which would decrease the nesting level. Mostly stylistic though.

> +                               }
> +                       } else {
> +                               if (rsel[check].down_rsel == arg) {
> +                                       found = true;
> +                                       *rsel_val = rsel[check].rsel_index;
> +                                       break;
> +                               }
> +                       }
> +               }
> +       }
> +
> +       if (!found) {
> +               dev_err(hw->dev, "Not support rsel value %d Ohm for pin = %d (%s)\n",
> +                       arg, desc->number, desc->name);
> +               return -ENOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +

[...]

> +static int mtk_pinconf_bias_get_rsel(struct mtk_pinctrl *hw,
> +                                    const struct mtk_pin_desc *desc,
> +                                    u32 *pullup, u32 *enable)
> +{
> +       int pu, pd, rsel, err;
> +
> +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_RSEL, &rsel);
> +       if (err)
> +               goto out;
> +
> +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PU, &pu);
> +       if (err)
> +               goto out;
> +
> +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PD, &pd);

mtk_pinconf_bias_get_pu_pd() couldn't be reused?

> +
> +       if (pu == 0 && pd == 0) {
> +               *pullup = 0;
> +               *enable = MTK_DISABLE;
> +       } else if (pu == 1 && pd == 0) {
> +               *pullup = 1;
> +               if (hw->rsel_si_unit)
> +                       mtk_rsel_get_si_unit(hw, desc, *pullup, rsel, enable);
> +               else
> +                       *enable = rsel + MTK_PULL_SET_RSEL_000;
> +       } else if (pu == 0 && pd == 1) {
> +               *pullup = 0;
> +               if (hw->rsel_si_unit)
> +                       mtk_rsel_get_si_unit(hw, desc, *pullup, rsel, enable);
> +               else
> +                       *enable = rsel + MTK_PULL_SET_RSEL_000;
> +       } else {
> +               err = -EINVAL;
> +               goto out;
> +       }
> +
> +out:
> +       return err;
> +}
> +
>  static int mtk_pinconf_bias_get_pu_pd(struct mtk_pinctrl *hw,
>                                 const struct mtk_pin_desc *desc,
>                                 u32 *pullup, u32 *enable)
> @@ -742,44 +917,40 @@ static int mtk_pinconf_bias_get_pupd_r1_r0(struct mtk_pinctrl *hw,
>         return err;
>  }
>
> -int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
> -                               const struct mtk_pin_desc *desc,
> -                               u32 pullup, u32 arg)
> -{
> -       int err;
> -
> -       err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
> -       if (!err)
> -               goto out;
> -
> -       err = mtk_pinconf_bias_set_pullsel_pullen(hw, desc, pullup, arg);
> -       if (!err)
> -               goto out;
> -
> -       err = mtk_pinconf_bias_set_pupd_r1_r0(hw, desc, pullup, arg);
> -
> -out:
> -       return err;
> -}
> -EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
> -
>  int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
>                               const struct mtk_pin_desc *desc,
>                               u32 *pullup, u32 *enable)
>  {
> -       int err;
> +       int err = -ENOTSUPP;
> +       u32 try_all_type;
>
> -       err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
> -       if (!err)
> -               goto out;
> +       if (hw->soc->pull_type)
> +               try_all_type = hw->soc->pull_type[desc->number];
> +       else
> +               try_all_type = MTK_PULL_TYPE_MASK;
>
> -       err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc, pullup, enable);
> -       if (!err)
> -               goto out;
> +       if (try_all_type & MTK_PULL_RSEL_TYPE) {
> +               err = mtk_pinconf_bias_get_rsel(hw, desc, pullup, enable);
> +               if (!err)
> +                       return err;
> +       }
>
> -       err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup, enable);
> +       if (try_all_type & MTK_PULL_PU_PD_TYPE) {
> +               err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
> +               if (!err)
> +                       return err;
> +       }
> +
> +       if (try_all_type & MTK_PULL_PULLSEL_TYPE) {
> +               err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc,
> +                                                         pullup, enable);
> +               if (!err)
> +                       return err;
> +       }
> +
> +       if (try_all_type & MTK_PULL_PUPD_R1R0_TYPE)
> +               err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup, enable);
>
> -out:
>         return err;
>  }
>  EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_combo);
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index a6f1bdb2083b..4908c7aedbe0 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -17,6 +17,22 @@
>  #define MTK_ENABLE     1
>  #define MTK_PULLDOWN   0
>  #define MTK_PULLUP     1
> +#define MTK_PULL_PU_PD_TYPE            BIT(0)
> +#define MTK_PULL_PULLSEL_TYPE          BIT(1)
> +#define MTK_PULL_PUPD_R1R0_TYPE                BIT(2)
> +/* MTK_PULL_RSEL_TYPE can select resistance and can be
> + * turned on/off itself. But it can't be selected pull up/down
> + */
> +#define MTK_PULL_RSEL_TYPE             BIT(3)
> +/* MTK_PULL_PU_PD_RSEL_TYPE is a type which is controlled by
> + * MTK_PULL_PU_PD_TYPE and MTK_PULL_RSEL_TYPE.
> + */
> +#define MTK_PULL_PU_PD_RSEL_TYPE       (MTK_PULL_PU_PD_TYPE \
> +                                       | MTK_PULL_RSEL_TYPE)
> +#define MTK_PULL_TYPE_MASK     (MTK_PULL_PU_PD_TYPE |\
> +                                MTK_PULL_PULLSEL_TYPE |\
> +                                MTK_PULL_PUPD_R1R0_TYPE |\
> +                                MTK_PULL_RSEL_TYPE)
>
>  #define EINT_NA        U16_MAX
>  #define NO_EINT_SUPPORT        EINT_NA
> @@ -42,6 +58,14 @@
>         PIN_FIELD_CALC(_s_pin, _e_pin, 0, _s_addr, _x_addrs, _s_bit,    \
>                        _x_bits, 32, 1)
>
> +#define PIN_RSEL(_s_pin, _e_pin, _rsel_index, _up_resl, _down_rsel) {  \
> +               .s_pin = _s_pin,                                        \
> +               .e_pin = _e_pin,                                        \
> +               .rsel_index = _rsel_index,                              \
> +               .up_rsel = _up_resl,                                    \
> +               .down_rsel = _down_rsel,                                \
> +       }
> +
>  /* List these attributes which could be modified for the pin */
>  enum {
>         PINCTRL_PIN_REG_MODE,
> @@ -67,6 +91,7 @@ enum {
>         PINCTRL_PIN_REG_DRV_E0,
>         PINCTRL_PIN_REG_DRV_E1,
>         PINCTRL_PIN_REG_DRV_ADV,
> +       PINCTRL_PIN_REG_RSEL,
>         PINCTRL_PIN_REG_MAX,
>  };
>
> @@ -129,6 +154,21 @@ struct mtk_pin_field_calc {
>         u8  fixed;
>  };
>
> +/* struct mtk_pin_rsel - the structure that provides bias resistance selection.

Since you went through the trouble of documenting all the fields, would
you consider changing this to a kernel-doc style comment? It is similar
to Java-doc, and would be like:

/**
 * struct mtk_pin_rsel ......
 * @s_pin: ....
 * ...
 */

Only the start of the comment block needs to be changed.
See Documentation/doc-guide/kernel-doc.rst if you are unsure.

> + * @s_pin:             the start pin within the rsel range
> + * @e_pin:             the end pin within the rsel range
> + * @rsel_index:        the rsel bias resistance index
> + * @up_rsel:   the pullup rsel bias resistance value
> + * @down_rsel: the pulldown rsel bias resistance value
> + */
> +struct mtk_pin_rsel {
> +       u16 s_pin;
> +       u16 e_pin;
> +       u16 rsel_index;
> +       u32 up_rsel;
> +       u32 down_rsel;
> +};
> +
>  /* struct mtk_pin_reg_calc - the structure that holds all ranges used to
>   *                          determine which register the pin would make use of
>   *                          for certain pin attribute.
> @@ -206,6 +246,9 @@ struct mtk_pin_soc {
>         bool                            ies_present;
>         const char * const              *base_names;
>         unsigned int                    nbase_names;
> +       const unsigned int              *pull_type;
> +       const struct mtk_pin_rsel       *pin_rsel;
> +       unsigned int                    npin_rsel;
>
>         /* Specific pinconfig operations */
>         int (*bias_disable_set)(struct mtk_pinctrl *hw,
> @@ -254,6 +297,8 @@ struct mtk_pinctrl {
>         const char          **grp_names;
>         /* lock pin's register resource to avoid multiple threads issue*/
>         spinlock_t lock;
> +       /* identify rsel setting by si unit or rsel define in dts node */
> +       bool rsel_si_unit;
>  };
>
>  void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set);
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 38aec0177d15..d4e02c5d74a8 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -579,8 +579,9 @@ static int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int
>  ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
>         unsigned int gpio, char *buf, unsigned int buf_len)
>  {
> -       int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
> +       int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1, rsel = -1;
>         const struct mtk_pin_desc *desc;
> +       u32 try_all_type;
>
>         if (gpio >= hw->soc->npins)
>                 return -EINVAL;
> @@ -591,24 +592,39 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
>                 pinmux -= hw->soc->nfuncs;
>
>         mtk_pinconf_bias_get_combo(hw, desc, &pullup, &pullen);
> -       if (pullen == MTK_PUPD_SET_R1R0_00) {
> -               pullen = 0;
> -               r1 = 0;
> -               r0 = 0;
> -       } else if (pullen == MTK_PUPD_SET_R1R0_01) {
> -               pullen = 1;
> -               r1 = 0;
> -               r0 = 1;
> -       } else if (pullen == MTK_PUPD_SET_R1R0_10) {
> -               pullen = 1;
> -               r1 = 1;
> -               r0 = 0;
> -       } else if (pullen == MTK_PUPD_SET_R1R0_11) {
> +
> +       if (hw->soc->pull_type)
> +               try_all_type = hw->soc->pull_type[desc->number];
> +
> +       if (hw->rsel_si_unit && (try_all_type & MTK_PULL_RSEL_TYPE)) {
> +               rsel = pullen;
>                 pullen = 1;
> -               r1 = 1;
> -               r0 = 1;
> -       } else if (pullen != MTK_DISABLE && pullen != MTK_ENABLE) {
> -               pullen = 0;
> +       } else {
> +               /* Case for: R1R0 */
> +               if (pullen == MTK_PUPD_SET_R1R0_00) {
> +                       pullen = 0;
> +                       r1 = 0;
> +                       r0 = 0;
> +               } else if (pullen == MTK_PUPD_SET_R1R0_01) {
> +                       pullen = 1;
> +                       r1 = 0;
> +                       r0 = 1;
> +               } else if (pullen == MTK_PUPD_SET_R1R0_10) {
> +                       pullen = 1;
> +                       r1 = 1;
> +                       r0 = 0;
> +               } else if (pullen == MTK_PUPD_SET_R1R0_11) {
> +                       pullen = 1;
> +                       r1 = 1;
> +                       r0 = 1;
> +               }
> +
> +               /* Case for: RSEL */
> +               if (pullen >= MTK_PULL_SET_RSEL_000 &&
> +                   pullen <= MTK_PULL_SET_RSEL_111) {
> +                       rsel = pullen - MTK_PULL_SET_RSEL_000;
> +                       pullen = 1;
> +               }
>         }
>         len += scnprintf(buf + len, buf_len - len,
>                         "%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
> @@ -626,6 +642,8 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
>         if (r1 != -1) {
>                 len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
>                         r1, r0);
> +       } else if (rsel != -1) {
> +               len += scnprintf(buf + len, buf_len - len, " (%1d)\n", rsel);
>         } else {
>                 len += scnprintf(buf + len, buf_len - len, "\n");
>         }
> @@ -970,6 +988,12 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>
>         hw->nbase = hw->soc->nbase_names;
>
> +       if (of_find_property(hw->dev->of_node,
> +                            "mediatek,rsel_resistance_in_si_unit", NULL))

This new property should be documented in the bindings.


Regards
ChenYu




> +               hw->rsel_si_unit = true;
> +       else
> +               hw->rsel_si_unit = false;
> +
>         spin_lock_init(&hw->lock);
>
>         err = mtk_pctrl_build_state(pdev);
> --
> 2.25.1
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
