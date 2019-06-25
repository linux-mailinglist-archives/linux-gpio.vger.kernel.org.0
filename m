Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 384075594E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 22:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfFYUqm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 16:46:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:43984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbfFYUqm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Jun 2019 16:46:42 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D640E205ED;
        Tue, 25 Jun 2019 20:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561495600;
        bh=4zflnPJOjSzJah74cHqrZgjnWn4XRJGSe8xqS8yMJt4=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=1IBQKZ4QdO9mARvZO4fdimMmjFiTYyPvYCcleQH84/+xvmlxpz2ZLt+7vlYvJO/Rd
         MetUEuXkt6V+Mf82FiEQb7OL3AjJEWviaNLdmYjswYyq7kIa5yAPxZ9jVKnmPmdfBU
         +uvHaijX0g2RMbCAesFySwxy8qll5906VdBCxCO8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1560843991-24123-7-git-send-email-skomatineni@nvidia.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com> <1560843991-24123-7-git-send-email-skomatineni@nvidia.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>, jason@lakedaemon.net,
        jonathanh@nvidia.com, linus.walleij@linaro.org,
        marc.zyngier@arm.com, mark.rutland@arm.com, stefan@agner.ch,
        tglx@linutronix.de, thierry.reding@gmail.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V3 06/17] clk: tegra: pll: save and restore pll context
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        skomatineni@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com,
        devicetree@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 13:46:40 -0700
Message-Id: <20190625204640.D640E205ED@mail.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Sowjanya Komatineni (2019-06-18 00:46:20)
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 1583f5fc992f..4b0ed8fc6268 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -1008,6 +1008,54 @@ static unsigned long clk_plle_recalc_rate(struct c=
lk_hw *hw,
>         return rate;
>  }
> =20
> +void tegra_clk_sync_state_pll(struct clk_hw *hw)
> +{
> +       if (!__clk_get_enable_count(hw->clk))
> +               clk_pll_disable(hw);
> +       else
> +               clk_pll_enable(hw);
> +}
> +
> +static int tegra_clk_pll_save_context(struct clk_hw *hw)
> +{
> +       struct tegra_clk_pll *pll =3D to_clk_pll(hw);
> +
> +       pll->rate =3D clk_hw_get_rate(hw);
> +
> +       if (!strcmp(__clk_get_name(hw->clk), "pll_mb"))
> +               pll->pllbase_ctx =3D pll_readl_base(pll);
> +       else if (!strcmp(__clk_get_name(hw->clk), "pll_re_vco"))
> +               pll->pllbase_ctx =3D pll_readl_base(pll) & (0xf << 16);
> +
> +       return 0;
> +}
> +
> +static void tegra_clk_pll_restore_context(struct clk_hw *hw)
> +{
> +       struct tegra_clk_pll *pll =3D to_clk_pll(hw);
> +       u32 val;
> +
> +       if (clk_pll_is_enabled(hw))
> +               return;
> +
> +       if (!strcmp(__clk_get_name(hw->clk), "pll_mb")) {

Is there any way to avoid doing a string comparison here, and instead do
something like a pointer comparison? Or maybe look at some flag in the
tegra_clk_pll to figure out what to do differently? Using a string
comparison is not too nice. Or even have different clk ops for the
different clks and then do different things in this restore clk_op?

> +               pll_writel_base(pll->pllbase_ctx, pll);
> +       } else if (!strcmp(__clk_get_name(hw->clk), "pll_re_vco")) {
> +               val =3D pll_readl_base(pll);
> +               val &=3D ~(0xf << 16);
> +               pll_writel_base(pll->pllbase_ctx | val, pll);
> +       }
> +
> +       if (pll->params->set_defaults)
> +               pll->params->set_defaults(pll);
> +
> +       clk_set_rate(hw->clk, pll->rate);

Do you need to call clk_set_rate() here to change the frequency of the
clk or just the parents of the clk, or both? I'd think that when we're
restoring the clk the cached rate of the clk would match whatever we're
restoring to, so this is a NOP. So does this do anything?

I'd prefer that the restore ops just restore the clk hardware state of
the clk_hw passed in, and not try to fix up the entire tree around a
certain clk, if that's even possible.

> +
> +       /* do not sync pllx state here. pllx is sync'd after dfll resume =
*/
> +       if (strcmp(__clk_get_name(hw->clk), "pll_x"))
> +               tegra_clk_sync_state_pll(hw);
> +}
> +
>  const struct clk_ops tegra_clk_pll_ops =3D {
>         .is_enabled =3D clk_pll_is_enabled,
>         .enable =3D clk_pll_enable,
> @@ -1015,6 +1063,8 @@ const struct clk_ops tegra_clk_pll_ops =3D {
>         .recalc_rate =3D clk_pll_recalc_rate,
>         .round_rate =3D clk_pll_round_rate,
>         .set_rate =3D clk_pll_set_rate,
> +       .save_context =3D tegra_clk_pll_save_context,
> +       .restore_context =3D tegra_clk_pll_restore_context,
