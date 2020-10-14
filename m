Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C955B28D888
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 04:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbgJNCgD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 22:36:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:35250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727198AbgJNCgD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Oct 2020 22:36:03 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6C11F21775;
        Wed, 14 Oct 2020 02:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602642962;
        bh=g2j9ux/pAHJnNbc2Nu0mN1BILQ00CFDJo7UyKWD5yZI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=xj6jhPED+WcoTPbVVLgWKjOjJ5wjpUI164pzTQChTUT1qHewE6g6O57Tn9d6KIEUo
         Tt9q4N8A8h2i+mx/ihqtpQIIcDc15d+DF0I3a2nOf14jMZULB4/tG30t/XP9Oocc+Z
         TVn4jcVoUUNEhZ2VPQa7JgALH5CCRQGn/SfFyVIs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1601270140-4306-2-git-send-email-varada@codeaurora.org>
References: <1601270140-4306-1-git-send-email-varada@codeaurora.org> <1601270140-4306-2-git-send-email-varada@codeaurora.org>
Subject: Re: [PATCH 1/7] clk: qcom: clk-alpha-pll: Add support for Stromer PLLs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        catalin.marinas@arm.com, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, nsekar@codeaurora.org,
        p.zabel@pengutronix.de, robh+dt@kernel.org,
        sricharan@codeaurora.org, will@kernel.org, tdas@codeaurora.org
To:     varada@codeaurora.org
Date:   Tue, 13 Oct 2020 19:36:01 -0700
Message-ID: <160264296113.310579.11748798538413456771@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Can you check your get_maintainers script invocation? Not sure why arm64
maintainers are Cced on a clk patch.

Quoting Varadarajan Narayanan (2020-09-27 22:15:34)
> Add programming sequence support for managing the Stromer
> PLLs.
>=20
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 156 +++++++++++++++++++++++++++++++++=
+++++-
>  drivers/clk/qcom/clk-alpha-pll.h |   5 ++
>  2 files changed, 160 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alph=
a-pll.c
> index 26139ef..ce3257f 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -116,6 +116,19 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] =3D {
>                 [PLL_OFF_OPMODE] =3D 0x38,
>                 [PLL_OFF_ALPHA_VAL] =3D 0x40,
>         },
> +

Nitpick: Drop this newline.

> +       [CLK_ALPHA_PLL_TYPE_STROMER] =3D {
> +               [PLL_OFF_L_VAL] =3D 0x08,
> +               [PLL_OFF_ALPHA_VAL] =3D 0x10,
> +               [PLL_OFF_ALPHA_VAL_U] =3D 0x14,
> +               [PLL_OFF_USER_CTL] =3D 0x18,
> +               [PLL_OFF_USER_CTL_U] =3D 0x1c,
> +               [PLL_OFF_CONFIG_CTL] =3D 0x20,
> +               [PLL_OFF_CONFIG_CTL_U] =3D 0xff,
> +               [PLL_OFF_TEST_CTL] =3D 0x30,
> +               [PLL_OFF_TEST_CTL_U] =3D 0x34,
> +               [PLL_OFF_STATUS] =3D 0x28,
> +       },
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
> =20
> @@ -127,6 +140,8 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>  #define ALPHA_BITWIDTH         32U
>  #define ALPHA_SHIFT(w)         min(w, ALPHA_BITWIDTH)
> =20
> +#define        PLL_STATUS_REG_SHIFT    8

This should have an ALPHA_ prefix.

> +
>  #define PLL_HUAYRA_M_WIDTH             8
>  #define PLL_HUAYRA_M_SHIFT             8
>  #define PLL_HUAYRA_M_MASK              0xff
> @@ -240,14 +255,143 @@ void clk_alpha_pll_configure(struct clk_alpha_pll =
*pll, struct regmap *regmap,
>         mask |=3D config->pre_div_mask;
>         mask |=3D config->post_div_mask;
>         mask |=3D config->vco_mask;
> +       mask |=3D config->alpha_en_mask;
> +       mask |=3D config->alpha_mode_mask;
> =20
>         regmap_update_bits(regmap, PLL_USER_CTL(pll), mask, val);
> =20
> +       /* Stromer APSS PLL does not enable LOCK_DET by default, so enabl=
e it */
> +       val_u =3D config->status_reg_val << PLL_STATUS_REG_SHIFT;
> +       val_u |=3D config->lock_det;
> +
> +       mask_u =3D config->status_reg_mask;
> +       mask_u |=3D config->lock_det;
> +
> +       if (val_u !=3D 0)

if (val_u) is more canonical.

> +               regmap_update_bits(regmap, PLL_USER_CTL_U(pll), mask_u, v=
al_u);
> +
> +       if (config->test_ctl_val !=3D 0)

Same comment

> +               regmap_write(regmap, PLL_TEST_CTL(pll), config->test_ctl_=
val);
> +
> +       if (config->test_ctl_hi_val !=3D 0)

Same comment

> +               regmap_write(regmap, PLL_TEST_CTL_U(pll), config->test_ct=
l_hi_val);
> +
>         if (pll->flags & SUPPORTS_FSM_MODE)
>                 qcom_pll_set_fsm_mode(regmap, PLL_MODE(pll), 6, 0);
>  }
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_configure);
> =20
> +static unsigned long
> +alpha_pll_stromer_calc_rate(u64 prate, u32 l, u64 a)
> +{
> +       return (prate * l) + ((prate * a) >> ALPHA_REG_BITWIDTH);

Is this not already in this file? Why can't we use
alpha_pll_calc_rate()?

> +}
> +
> +static unsigned long
> +alpha_pll_stromer_round_rate(unsigned long rate, unsigned long prate, u3=
2 *l, u64 *a)
> +{
> +       u64 remainder;
> +       u64 quotient;
> +
> +       quotient =3D rate;
> +       remainder =3D do_div(quotient, prate);
> +       *l =3D quotient;
> +
> +       if (!remainder) {
> +               *a =3D 0;
> +               return rate;
> +       }
> +
> +       quotient =3D remainder << ALPHA_REG_BITWIDTH;
> +
> +       remainder =3D do_div(quotient, prate);
> +
> +       if (remainder)
> +               quotient++;
> +
> +       *a =3D quotient;
> +       return alpha_pll_stromer_calc_rate(prate, *l, *a);
> +}
> +
> +static unsigned long
> +clk_alpha_pll_stromer_recalc_rate(struct clk_hw *hw, unsigned long paren=
t_rate)
> +{
> +       u32 l, low, high, ctl;
> +       u64 a =3D 0, prate =3D parent_rate;
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +
> +       regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
> +
> +       regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl);
> +       if (ctl & PLL_ALPHA_EN) {
> +               regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &low);
> +               regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll),
> +                           &high);
> +               a =3D (u64)high << ALPHA_BITWIDTH | low;
> +       }
> +
> +       return alpha_pll_stromer_calc_rate(prate, l, a);
> +}
> +
> +static int clk_alpha_pll_stromer_determine_rate(struct clk_hw *hw,
> +                                        struct clk_rate_request *req)
> +{
> +       unsigned long rate =3D req->rate;
> +       u32 l;
> +       u64 a;
> +
> +       rate =3D alpha_pll_stromer_round_rate(rate, req->best_parent_rate=
, &l, &a);

Why assign to rate if nobody is going to look at it? Should probably be
set to req->rate instead?

> +
> +       return 0;
> +}
> +
> +static int clk_alpha_pll_stromer_set_rate(struct clk_hw *hw, unsigned lo=
ng rate,
> +                                        unsigned long prate)
> +{
> +       struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> +       u32 l;
> +       int ret;
> +       u64 a;
> +
> +       rate =3D alpha_pll_stromer_round_rate(rate, prate, &l, &a);
> +
> +       /* Write desired values to registers */

Please drop this useless comment.

> +       regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +       regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
> +       regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll),
> +                                       a >> ALPHA_BITWIDTH);
> +
> +       regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
> +                          PLL_ALPHA_EN, PLL_ALPHA_EN);
> +
> +       if (!clk_hw_is_enabled(hw))
> +               return 0;
> +
> +       /* Stromer PLL supports Dynamic programming.

The /* goes on a line by itself.

> +        * It allows the PLL frequency to be changed on-the-fly without f=
irst
> +        * execution of a shutdown procedure followed by a bring up proce=
dure.
> +        */

Cool feature. Maybe that can go into the header file though?

> +
> +       regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_UPDATE,
> +                          PLL_UPDATE);
> +       /* Make sure PLL_UPDATE request goes through */
> +       mb();

regmap APIs already have memory barriers so this isn't needed?

> +
> +       /* Wait for PLL_UPDATE to be cleared */

I think the code already says this so we can just drop this comment.

> +       ret =3D wait_for_pll_update(pll);
> +       if (ret)
> +               return ret;
> +
> +       /* Wait 11or more PLL clk_ref ticks[to be explored more on wait] =
*/
> +

Is this a TODO?

> +       /* Poll LOCK_DET for one */

I think the code already says this so we can just drop this comment.

> +       ret =3D wait_for_pll_enable_lock(pll);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
>  static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
>  {
>         int ret;
