Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCC54B3C6
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2019 10:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731065AbfFSIPs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jun 2019 04:15:48 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38855 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731143AbfFSIPs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jun 2019 04:15:48 -0400
Received: by mail-wm1-f67.google.com with SMTP id s15so732994wmj.3;
        Wed, 19 Jun 2019 01:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ed+Vt6/WmkspgVX9Zm8df5w8dbSgvZ0uQmuzt2cB8Hc=;
        b=jX/dONXROXY7vDF0QBrC172jwPTV/xYyVIgj7bux7d/TDg7jawmlypF+6M+FGSxt4L
         ODv0IjbiERq1euIZvVBYYeeQGyFGO4ZPYCl94HPPsypRUUxVi3fNiXfoSWLokkdHyGfo
         LNPv6UTVslWpAYoFMpiE5v7GSOoNNkkmaMNEJbPEemujd0uxElFEcRSyPIm6YF9zVHGT
         GvdbT/4+xBwSefA1A+pNh90kZRgZntnLeR4gmAr9jJ4I3UyxxlfhLoA7uRWMbJE5HuBI
         /iGGCq5regLKGwwXnW3iKoYWtr+SYH7jRmCQcci/ewk8Qardib6ruo+rs5LY8qWlLs0A
         EnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ed+Vt6/WmkspgVX9Zm8df5w8dbSgvZ0uQmuzt2cB8Hc=;
        b=LHBqkHFONSbaDunSl1PSq/a4hZPB5sULJORvyWHT5FvRCCVpvNIil3lNtnDbI6Yw05
         0RUxKUX3N/A3DxcQprF+GHNfBzh6RGzIU0TIhGDU53IulcxwmVqUsHEelW1rEeNIgbFU
         ybcn3bQBGaGhN4zZykFZcp2IAL6+EO4gut6Sq1r9Sk6rcHKLrBRr2Lf2Jt85GpBQPxkb
         Be17bPkEWDrk0f/qTgulXMVj9N39KyJ7SymfAte3spm8tNIqajhPOISoG3zA9wInfkrK
         0TbniLDcQNpCPz40HFZ/CWmYf7eL/MS05qMvCOWjgzal+4/AU4igLo+cazuW6rn4dAqu
         BMkA==
X-Gm-Message-State: APjAAAUmWFAU4hYloY96rEK+r7Ba8rB6jd0SM1baD4eE+gS99mX6AU94
        GKd6PtN4FeVNJozkv7Jqnm6MxKbIZ48=
X-Google-Smtp-Source: APXvYqzv+OMtKLeNVmr21mIQM6BLBXL4ULa9B3eHI8ETbfjXJ0PBcSYB0bSti23HD29FK/A0mLws+A==
X-Received: by 2002:a1c:f515:: with SMTP id t21mr7475327wmh.39.1560932143750;
        Wed, 19 Jun 2019 01:15:43 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id i25sm5198463wrc.91.2019.06.19.01.15.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 01:15:42 -0700 (PDT)
Date:   Wed, 19 Jun 2019 10:15:41 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net,
        marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch,
        mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com,
        talho@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V3 11/17] clk: tegra210: support for Tegra210 clocks
 suspend and resume
Message-ID: <20190619081541.GA3187@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-12-git-send-email-skomatineni@nvidia.com>
 <20190618121607.GN28892@ulmo>
 <491e0b18-11e7-837c-4591-06ed30950e1d@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <491e0b18-11e7-837c-4591-06ed30950e1d@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 10:58:40AM -0700, Sowjanya Komatineni wrote:
>=20
> On 6/18/19 5:16 AM, Thierry Reding wrote:
> > On Tue, Jun 18, 2019 at 12:46:25AM -0700, Sowjanya Komatineni wrote:
> > > This patch adds system suspend and resume support for Tegra210
> > > clocks.
> > >=20
> > > All the CAR controller settings are lost on suspend when core power
> > > goes off.
> > >=20
> > > This patch has implementation for saving and restoring all the PLLs
> > > and clocks context during system suspend and resume to have the
> > > system back to operating state.
> > >=20
> > > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > > ---
> > >   drivers/clk/tegra/clk-tegra210.c | 218 ++++++++++++++++++++++++++++=
+++++++++--
> > >   1 file changed, 211 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk=
-tegra210.c
> > > index e1ba62d2b1a0..c34d92e871f4 100644
> > > --- a/drivers/clk/tegra/clk-tegra210.c
> > > +++ b/drivers/clk/tegra/clk-tegra210.c
> > > @@ -9,10 +9,12 @@
> > >   #include <linux/clkdev.h>
> > >   #include <linux/of.h>
> > >   #include <linux/of_address.h>
> > > +#include <linux/of_platform.h>
> > >   #include <linux/delay.h>
> > >   #include <linux/export.h>
> > >   #include <linux/mutex.h>
> > >   #include <linux/clk/tegra.h>
> > > +#include <linux/syscore_ops.h>
> > >   #include <dt-bindings/clock/tegra210-car.h>
> > >   #include <dt-bindings/reset/tegra210-car.h>
> > >   #include <linux/iopoll.h>
> > > @@ -20,6 +22,7 @@
> > >   #include <soc/tegra/pmc.h>
> > >   #include "clk.h"
> > > +#include "clk-dfll.h"
> > >   #include "clk-id.h"
> > >   /*
> > > @@ -36,6 +39,8 @@
> > >   #define CLK_SOURCE_LA 0x1f8
> > >   #define CLK_SOURCE_SDMMC2 0x154
> > >   #define CLK_SOURCE_SDMMC4 0x164
> > > +#define CLK_OUT_ENB_Y 0x298
> > > +#define CLK_ENB_PLLP_OUT_CPU BIT(31)
> > >   #define PLLC_BASE 0x80
> > >   #define PLLC_OUT 0x84
> > > @@ -225,6 +230,7 @@
> > >   #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
> > >   #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
> > > +#define CPU_SOFTRST_CTRL 0x380
> > >   #define LVL2_CLK_GATE_OVRA 0xf8
> > >   #define LVL2_CLK_GATE_OVRC 0x3a0
> > > @@ -2820,6 +2826,7 @@ static int tegra210_enable_pllu(void)
> > >   	struct tegra_clk_pll_freq_table *fentry;
> > >   	struct tegra_clk_pll pllu;
> > >   	u32 reg;
> > > +	int ret;
> > >   	for (fentry =3D pll_u_freq_table; fentry->input_rate; fentry++) {
> > >   		if (fentry->input_rate =3D=3D pll_ref_freq)
> > > @@ -2836,7 +2843,7 @@ static int tegra210_enable_pllu(void)
> > >   	reg =3D readl_relaxed(clk_base + pllu.params->ext_misc_reg[0]);
> > >   	reg &=3D ~BIT(pllu.params->iddq_bit_idx);
> > >   	writel_relaxed(reg, clk_base + pllu.params->ext_misc_reg[0]);
> > > -	udelay(5);
> > > +	fence_udelay(5, clk_base);
> > >   	reg =3D readl_relaxed(clk_base + PLLU_BASE);
> > >   	reg &=3D ~GENMASK(20, 0);
> > > @@ -2844,13 +2851,13 @@ static int tegra210_enable_pllu(void)
> > >   	reg |=3D fentry->n << 8;
> > >   	reg |=3D fentry->p << 16;
> > >   	writel(reg, clk_base + PLLU_BASE);
> > > -	udelay(1);
> > > +	fence_udelay(1, clk_base);
> > These udelay() -> fence_udelay() seem like they should be a separate
> > patch.
> >=20
> > >   	reg |=3D PLL_ENABLE;
> > >   	writel(reg, clk_base + PLLU_BASE);
> > > +	fence_udelay(1, clk_base);
> > > -	readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
> > > -					  reg & PLL_BASE_LOCK, 2, 1000);
> > > -	if (!(reg & PLL_BASE_LOCK)) {
> > > +	ret =3D tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
> > > +	if (ret) {
> > >   		pr_err("Timed out waiting for PLL_U to lock\n");
> > >   		return -ETIMEDOUT;
> > >   	}
> > > @@ -2890,12 +2897,12 @@ static int tegra210_init_pllu(void)
> > >   		reg =3D readl_relaxed(clk_base + XUSB_PLL_CFG0);
> > >   		reg &=3D ~XUSB_PLL_CFG0_PLLU_LOCK_DLY_MASK;
> > >   		writel_relaxed(reg, clk_base + XUSB_PLL_CFG0);
> > > -		udelay(1);
> > > +		fence_udelay(1, clk_base);
> > >   		reg =3D readl_relaxed(clk_base + PLLU_HW_PWRDN_CFG0);
> > >   		reg |=3D PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
> > >   		writel_relaxed(reg, clk_base + PLLU_HW_PWRDN_CFG0);
> > > -		udelay(1);
> > > +		fence_udelay(1, clk_base);
> > >   		reg =3D readl_relaxed(clk_base + PLLU_BASE);
> > >   		reg &=3D ~PLLU_BASE_CLKENABLE_USB;
> > > @@ -3282,6 +3289,188 @@ static void tegra210_disable_cpu_clock(u32 cp=
u)
> > >   }
> > >   #ifdef CONFIG_PM_SLEEP
> > > +static u32 cpu_softrst_ctx[3];
> > > +static struct platform_device *dfll_pdev;
> > > +static u32 *periph_clk_src_ctx;
> > > +struct periph_source_bank {
> > Blank line between the above two.
> >=20
> > > +	u32 start;
> > > +	u32 end;
> > > +};
> > > +
> > > +static struct periph_source_bank periph_srcs[] =3D {
> > > +	[0] =3D {
> > > +		.start =3D 0x100,
> > > +		.end =3D 0x198,
> > > +	},
> > > +	[1] =3D {
> > > +		.start =3D 0x1a0,
> > > +		.end =3D 0x1f8,
> > > +	},
> > > +	[2] =3D {
> > > +		.start =3D 0x3b4,
> > > +		.end =3D 0x42c,
> > > +	},
> > > +	[3] =3D {
> > > +		.start =3D 0x49c,
> > > +		.end =3D 0x4b4,
> > > +	},
> > > +	[4] =3D {
> > > +		.start =3D 0x560,
> > > +		.end =3D 0x564,
> > > +	},
> > > +	[5] =3D {
> > > +		.start =3D 0x600,
> > > +		.end =3D 0x678,
> > > +	},
> > > +	[6] =3D {
> > > +		.start =3D 0x694,
> > > +		.end =3D 0x6a0,
> > > +	},
> > > +	[7] =3D {
> > > +		.start =3D 0x6b8,
> > > +		.end =3D 0x718,
> > > +	},
> > > +};
> > > +
> > > +/* This array lists the valid clocks for each periph clk bank */
> > > +static u32 periph_clks_on[] =3D {
> > > +	0xdcd7dff9,
> > > +	0x87d1f3e7,
> > > +	0xf3fed3fa,
> > > +	0xffc18cfb,
> > > +	0x793fb7ff,
> > > +	0x3fe66fff,
> > > +	0xfc1fc7ff,
> > > +};
> > Hm... this is a bunch of magic. Perhaps replace this by a list of the
> > clock IDs? That's perhaps a little more verbose, but if we ever need to
> > tweak the list of IDs in that periph_clks_on array, that'll be quite the
> > challenge.
> >=20
> > Also, is this list a "guess" or are these all guaranteed to be always
> > on? What if some of these ended up getting disabled as part of suspend
> > already (by their users). If we force them on, won't their references
> > become unbalanced if the driver later enables them again on resume?
>=20
> Yes, will replace with list of peripheral clock names..
>=20
> This list is not a guess. Each entry of this list maps to CLK_ENB set
> register.
>=20
> Total 7 registers are available and each bit of these registers is for
> enable/disable clock to corresponding peripheral.
>=20
> Some of the bits are off as those peripheral clocks don't need to be enab=
led
> as we are not changing source or not using them like MIPIBIF, PLLG_REF..
>=20
> This list of peripheral clocks are enabled during resume before changing
> clock sources and after clock source update, they are restored back to the
> state they were before suspend. So their references don't become unbalanc=
ed.

Okay, good. Can you maybe put a version of that explanation in a comment
on top of the periph_clks_on declaration? And perhaps also describe this
in the commit message.

Or maybe even better, add some comments in the main suspend/resume paths
to sort of "guide" through what's happening.

> > > +
> > > +static struct platform_device *dfll_pdev;
> > I think you already predeclared this one above.
> >=20
> > > +#define car_readl(_base, _off) readl_relaxed(clk_base + (_base) + ((=
_off) * 4))
> > > +#define car_writel(_val, _base, _off) \
> > > +		writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
> > > +
> > > +static u32 * __init tegra210_init_suspend_ctx(void)
> > > +{
> > > +	int i, size =3D 0;
> > Can both be unsigned int.
> >=20
> > > +
> > > +	for (i =3D 0; i < ARRAY_SIZE(periph_srcs); i++)
> > > +		size +=3D periph_srcs[i].end - periph_srcs[i].start + 4;
> > > +
> > > +	periph_clk_src_ctx =3D kmalloc(size, GFP_KERNEL);
> > > +
> > > +	return periph_clk_src_ctx;
> > It's somewhat wasteful to return a global variable since you can access
> > it anyway. Perhaps it'd be more useful to make the function return a
> > boolean?
> >=20
> > > +}
> > > +
> > > +static int tegra210_clk_suspend(void)
> > > +{
> > > +	int i;
> > unsigned int.
> >=20
> > > +	unsigned long off;
> > > +	struct device_node *node;
> > > +	u32 *clk_rst_ctx =3D periph_clk_src_ctx;
> > > +	u32 val;
> > > +
> > > +	tegra_cclkg_burst_policy_save_context();
> > > +
> > > +	if (!dfll_pdev) {
> > > +		node =3D of_find_compatible_node(NULL, NULL,
> > > +					       "nvidia,tegra210-dfll");
> > > +		if (node)
> > > +			dfll_pdev =3D of_find_device_by_node(node);
> > > +		of_node_put(node);
> > > +		if (!dfll_pdev)
> > > +			pr_err("dfll node not found. no suspend for dfll\n");
> > > +	}
> > Wouldn't it make sense to run this only once, perhaps as part of
> > tegra210_init_suspend_ctx()?
> >=20
> > > +
> > > +	if (dfll_pdev)
> > > +		tegra_dfll_suspend(dfll_pdev);
> > > +
> > > +	/* Enable PLLP_OUT_CPU after dfll suspend */
> > > +	val =3D car_readl(CLK_OUT_ENB_Y, 0);
> > > +	val |=3D CLK_ENB_PLLP_OUT_CPU;
> > > +	car_writel(val, CLK_OUT_ENB_Y, 0);
> > > +
> > > +	tegra_clk_periph_suspend(clk_base);
> > > +
> > > +	for (i =3D 0; i < ARRAY_SIZE(periph_srcs); i++)
> > > +		for (off =3D periph_srcs[i].start; off <=3D periph_srcs[i].end;
> > > +		     off +=3D 4)
> > > +			*clk_rst_ctx++ =3D car_readl(off, 0);
> > > +
> > > +	tegra_sclk_cclklp_burst_policy_save_context();
> > > +
> > > +	for (i =3D 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
> > > +		cpu_softrst_ctx[i] =3D car_readl(CPU_SOFTRST_CTRL, i);
> > > +
> > > +	clk_save_context();
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void tegra210_clk_resume(void)
> > > +{
> > > +	int i;
> > > +	unsigned long off;
> > > +	u32 val;
> > > +	u32 *clk_rst_ctx =3D periph_clk_src_ctx;
> > > +	struct clk_hw *parent;
> > > +	struct clk *clk;
> > > +
> > > +	for (i =3D 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
> > > +		car_writel(cpu_softrst_ctx[i], CPU_SOFTRST_CTRL, i);
> > > +
> > > +	tegra_clk_osc_resume(clk_base);
> > > +
> > > +	/*
> > > +	 * restore all the plls before configuring clocks and resetting
> > > +	 * the devices.
> > > +	 */
> > > +	tegra210_init_pllu();
> > > +	tegra_sclk_cpulp_burst_policy_restore_context();
> > > +	clk_restore_context();
> > > +
> > > +	/* enable all clocks before configuring clock sources */
> > > +	tegra_clk_periph_force_on(periph_clks_on, ARRAY_SIZE(periph_clks_on=
),
> > > +				  clk_base);
> > > +	/* wait for all writes to happen to have all the clocks enabled */
> > > +	wmb();
> > > +	fence_udelay(2, clk_base);
> > > +
> > > +	/* restore all the devices clock sources */
> > > +	for (i =3D 0; i < ARRAY_SIZE(periph_srcs); i++)
> > > +		for (off =3D periph_srcs[i].start; off <=3D periph_srcs[i].end;
> > > +		     off +=3D 4)
> > > +			car_writel(*clk_rst_ctx++, off, 0);
> > > +
> > > +	/* propagate and restore resets, restore clock state */
> > > +	fence_udelay(5, clk_base);
> > > +	tegra_clk_periph_resume(clk_base);
> > > +
> > > +	/*
> > > +	 * restore CPUG clocks:
> > > +	 * - enable DFLL in open loop mode
> > > +	 * - switch CPUG to DFLL clock source
> > > +	 * - close DFLL loop
> > > +	 * - sync PLLX state
> > > +	 */
> > > +	if (dfll_pdev)
> > > +		tegra_dfll_resume(dfll_pdev, false);
> > > +
> > > +	tegra_cclkg_burst_policy_restore_context();
> > > +	fence_udelay(2, clk_base);
> > > +
> > > +	if (dfll_pdev)
> > > +		tegra_dfll_resume(dfll_pdev, true);
> > > +
> > > +	parent =3D clk_hw_get_parent(__clk_get_hw(clks[TEGRA210_CLK_CCLK_G]=
));
> > > +	clk =3D clks[TEGRA210_CLK_PLL_X];
> > > +	if (parent !=3D __clk_get_hw(clk))
> > > +		tegra_clk_sync_state_pll(__clk_get_hw(clk));
> > > +
> > > +	/* Disable PLL_OUT_CPU after DFLL resume */
> > > +	val =3D car_readl(CLK_OUT_ENB_Y, 0);
> > > +	val &=3D ~CLK_ENB_PLLP_OUT_CPU;
> > > +	car_writel(val, CLK_OUT_ENB_Y, 0);
> > > +}
> > I'm surprised by the amount of work that we need to do here. I had hoped
> > that the clock framework's save/restore infrastructure would be enough.
> > I suppose you do call clk_restore_context() somewhere in there, so maybe
> > this really is as good as it gets.
> >=20
> > Thierry
>=20
> Reason is there are dependencies b/w the clocks and DFLL resume and clocks
> resume order needed is not same as clock tree list.
>=20
> during resume as per clock tree, CPU clock configs to use DFLL will happen
> first as its first in the clock tree but DFLL resume should be done prior=
 to
> switching CPU to use from DFLL output.
>=20
> To resume DFLL, peripheral clocks should be restored.
>=20
> Considering these dependencies, performing peripheral and DFLL/CPU resume=
 in
> Tegra210 clock driver rather than in corresponding peripheral clk_ops usi=
ng
> save and restore context callback.

Okay makes sense. As mentioned above, I think it'd be great if you could
add more comments throughout the tegra210_clk_{suspend,resume}() code to
guide the reader through what you're doing, given that this is far from
obvious. You already do quite a bit of that, but it's perhaps better to
explain more what's going on and, perhaps more importantly, why. You're
currently mostly repeating the code sequence in the code. It'd be great
to have the general suspend/resume sequence detailed and highlight why
the sequence is the way it is and what the dependencies are, etc.

Thierry

>=20
> > > +
> > >   static void tegra210_cpu_clock_suspend(void)
> > >   {
> > >   	/* switch coresite to clk_m, save off original source */
> > > @@ -3295,8 +3484,20 @@ static void tegra210_cpu_clock_resume(void)
> > >   	writel(tegra210_cpu_clk_sctx.clk_csite_src,
> > >   				clk_base + CLK_SOURCE_CSITE);
> > >   }
> > > +#else
> > > +#define tegra210_clk_suspend	NULL
> > > +#define tegra210_clk_resume	NULL
> > > +static inline u32 *tegra210_init_suspend_ctx(void)
> > > +{
> > > +	return NULL;
> > > +}
> > >   #endif
> > > +static struct syscore_ops tegra_clk_syscore_ops =3D {
> > > +	.suspend =3D tegra210_clk_suspend,
> > > +	.resume =3D tegra210_clk_resume,
> > > +};
> > > +
> > >   static struct tegra_cpu_car_ops tegra210_cpu_car_ops =3D {
> > >   	.wait_for_reset	=3D tegra210_wait_cpu_in_reset,
> > >   	.disable_clock	=3D tegra210_disable_cpu_clock,
> > > @@ -3580,5 +3781,8 @@ static void __init tegra210_clock_init(struct d=
evice_node *np)
> > >   	tegra210_mbist_clk_init();
> > >   	tegra_cpu_car_ops =3D &tegra210_cpu_car_ops;
> > > +
> > > +	if (tegra210_init_suspend_ctx())
> > > +		register_syscore_ops(&tegra_clk_syscore_ops);
> > >   }
> > >   CLK_OF_DECLARE(tegra210, "nvidia,tegra210-car", tegra210_clock_init=
);
> > > --=20
> > > 2.7.4
> > >=20

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0J7ysACgkQ3SOs138+
s6GO3xAAj+ZVjpWp4R8ur1fJZGNQei01bqqoUDzNjLLc9ynEUm0YOH7WHpCAJJTa
l3wLQDs/85omgZdlKr99OHiLNxNIGtLRFRTtOu5FDFBiPdS40aAj/w/RoxNYwdG4
B96Dz7yFi6oe8G5Qy4XzXJXQSauzUm8Viysa4TuEFCze6m5NBxdmkJN9S3wYkkg/
gNfllNU8GzPyq5u0BwpwPfFGKrCzHGixWbNn1filzECaSHUYRXIR16HVvSXEfsyb
DAlySGYjd2ywfs6nmHZz9V2tfJsrCX93wCtwRWYFuduKgA00gIVQozJNBbVzB709
4Lwb5TV2XthTvPRVzZPfENEk4mUVvXkXSqNcDHb8rW7uR/PAlmiWsIqk9lmFFir4
JQ/03YCdtnanZ8IaDq/lW0HBjcZ7a94fZBgbam0OyUptoEnEJCq/wYti7TCU6F+c
hXXKzN4DbxVNYeJkKaERWqwS97QiN98R7DxYEXjpkitHWViMmvSx1286KwE/Avje
1ZUYldZO+UMZYwBBeaWtY62rGys0aP9/dIhtG4KkdG4Int7xvQHGsM2trN3j+142
dvZbaiNSZb7O/hKue6ZbC0rJNe9TEZMPsBO+xiSF64OicZWW049Ud//rld/7ijKm
vAxEY4lPDFYNkyVHuwrRK/ZCkgaJGOhdCZ/Xa/ZXmtHSsDSt+wM=
=XdDd
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
