Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93A8237C05
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2019 20:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729442AbfFFSRN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jun 2019 14:17:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:55988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727559AbfFFSRN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 6 Jun 2019 14:17:13 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 744502083D;
        Thu,  6 Jun 2019 18:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559845031;
        bh=IZaxa10bAX0fTd5ai/JE91vM5GqtEaR8JsnsK21q+rQ=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=mSshB7oTeQVUtdrxOdlaNvgUOi5c69iz71IfpIe+XHfD3rhdmI/tahbtMLQyAGkUW
         6lrYHXxxVjUyDY+KeXXR/+3nkeV7b+jyhBC1yCUKL/MYzo6Jwa2PODUW4wAqVeU0mv
         g/JXG7Q14eObcSshhQcyo+GzXvquHUYZxonW44pk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1559084936-4610-8-git-send-email-skomatineni@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com> <1559084936-4610-8-git-send-email-skomatineni@nvidia.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>, jason@lakedaemon.net,
        jonathanh@nvidia.com, linus.walleij@linaro.org,
        marc.zyngier@arm.com, mark.rutland@arm.com, stefan@agner.ch,
        tglx@linutronix.de, thierry.reding@gmail.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V2 07/12] clk: tegra: support for Tegra210 clocks suspend-resume
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        skomatineni@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Thu, 06 Jun 2019 11:17:10 -0700
Message-Id: <20190606181711.744502083D@mail.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Sowjanya Komatineni (2019-05-28 16:08:51)
> @@ -3381,6 +3398,367 @@ static struct tegra_clk_init_table init_table[] _=
_initdata =3D {
>         { TEGRA210_CLK_CLK_MAX, TEGRA210_CLK_CLK_MAX, 0, 0 },
>  };
> =20
> +#ifdef CONFIG_PM_SLEEP
> +static unsigned long pll_c_rate, pll_c2_rate, pll_c3_rate, pll_x_rate;
> +static unsigned long pll_c4_rate, pll_d2_rate, pll_dp_rate;
> +static unsigned long pll_re_vco_rate, pll_d_rate, pll_a_rate, pll_a1_rat=
e;
> +static unsigned long pll_c_out1_rate;
> +static unsigned long pll_a_out0_rate, pll_c4_out3_rate;
> +static unsigned long pll_p_out_rate[5];
> +static unsigned long pll_u_out1_rate, pll_u_out2_rate;
> +static unsigned long pll_mb_rate;
> +static u32 pll_m_v;
> +static u32 pll_p_outa, pll_p_outb;
> +static u32 pll_re_out_div, pll_re_out_1;
> +static u32 cpu_softrst_ctx[3];
> +static u32 cclkg_burst_policy_ctx[2];
> +static u32 cclklp_burst_policy_ctx[2];
> +static u32 sclk_burst_policy_ctx[3];
> +static u32 sclk_ctx, spare_ctx, misc_clk_enb_ctx, clk_arm_ctx;

This is a lot of state to maintain globally. Can it go into a container
struct so we can get docs and understand what's going on a little
better?

> +
> +static struct platform_device *dfll_pdev;
> +#define car_readl(_base, _off) \
> +       readl_relaxed(clk_base + (_base) + ((_off) * 4))
> +#define car_writel(_val, _base, _off) \
> +       writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
> +
> +static u32 *periph_clk_src_ctx;
> +struct periph_source_bank {
> +       u32 start;
> +       u32 end;

Do these need to be u32 or could they be u16?

> +};
> +
> +static struct periph_source_bank periph_srcs[] =3D {

Can this be const?

> +       [0] =3D {
> +               .start =3D 0x100,
> +               .end =3D 0x198,
> +       },
> +       [1] =3D {
> +               .start =3D 0x1a0,
> +               .end =3D 0x1f8,
> +       },
> +       [2] =3D {
> +               .start =3D 0x3b4,
> +               .end =3D 0x42c,
> +       },
> +       [3] =3D {
> +               .start =3D 0x49c,
> +               .end =3D 0x4b4,
> +       },
> +       [4] =3D {
> +               .start =3D 0x560,
> +               .end =3D 0x564,
> +       },
> +       [5] =3D {
> +               .start =3D 0x600,
> +               .end =3D 0x678,
> +       },
> +       [6] =3D {
> +               .start =3D 0x694,
> +               .end =3D 0x6a0,
> +       },
> +       [7] =3D {
> +               .start =3D 0x6b8,
> +               .end =3D 0x718,
> +       },
> +};
> +
> +/* This array lists the valid clocks for each periph clk bank */
> +static u32 periph_clks_on[] =3D {

const?

> +       0xdcd7dff9,
> +       0x87d1f3e7,
> +       0xf3fed3fa,
> +       0xffc18cfb,
> +       0x793fb7ff,
> +       0x3fe66fff,
> +       0xfc1fc7ff,

What are these magic numbers?

> +};
> +
> +static inline unsigned long clk_get_rate_nolock(struct clk *clk)
> +{
> +       if (IS_ERR_OR_NULL(clk)) {

NULL is a valid clk pointer. Typically usage of IS_ERR_OR_NULL() is
wrong.

> +               WARN_ON(1);
> +               return 0;
> +       }
> +
> +       return clk_hw_get_rate(__clk_get_hw(clk));
> +}
> +
> +static inline struct clk *pll_p_clk(unsigned int x)
> +{
> +       if (x < 4) {

What is magic value 4?

> +               return clks[TEGRA210_CLK_PLL_P_OUT1 + x];
> +       } else if (x !=3D 4) {
> +               WARN_ON(1);
> +               return NULL;
> +       } else {
> +               return clks[TEGRA210_CLK_PLL_P_OUT5];
> +       }
> +}
> +
[..]
> +
> +static void tegra210_clk_resume(void)
> +{
[..]
> +       fence_udelay(2, clk_base);
> +       for (i =3D 0; i < BURST_POLICY_REG_SIZE; i++) {
> +               car_writel(cclklp_burst_policy_ctx[i], CCLKLP_BURST_POLIC=
Y, i);
> +               car_writel(sclk_burst_policy_ctx[i], SCLK_BURST_POLICY, i=
);
> +       }
> +       car_writel(sclk_burst_policy_ctx[i], SYS_CLK_DIV, 0);
> +
> +       car_writel(sclk_ctx, SYSTEM_CLK_RATE, 0);
> +       car_writel(spare_ctx, SPARE_REG0, 0);
> +       car_writel(misc_clk_enb_ctx, MISC_CLK_ENB, 0);
> +       car_writel(clk_arm_ctx, CLK_MASK_ARM, 0);
> +
> +       /* enable all clocks before configuring clock sources */
> +       tegra_clk_periph_force_on(periph_clks_on, ARRAY_SIZE(periph_clks_=
on),
> +                                 clk_base);
> +
> +       wmb();

Please add a comment before barriers so we know what they're for.

> +       fence_udelay(2, clk_base);
> +
