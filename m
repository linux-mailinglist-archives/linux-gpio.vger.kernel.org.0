Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8324056673
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 12:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbfFZKQX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 06:16:23 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34796 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbfFZKQX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 06:16:23 -0400
Received: by mail-wm1-f68.google.com with SMTP id w9so4270622wmd.1;
        Wed, 26 Jun 2019 03:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SOWNzVzUf3MTsOwLQEuzLvhwNlAbmPmc1U0N0oJw0qc=;
        b=aGCr29QtNtvgXc2e+3YFU0YfbIFo/HV8Jza8N5gVuhtT1XpGK1MsnRoNBIaqLvdQMr
         2K2yOlIJsGfDjfq1VPU27YpSIwuf2MOCvv9G9w/CcIriLYeibKZL6a8WaqEncNA0JWHC
         A8zPS1qFttDULz7gGHNuXBTrIx/4jJ1wMQaczSdhRZwoa6Txg4GgnSLYJfO9MpbxwHD4
         +7G//vadTEAythFfvhPtLvjl1Xc46uKGnWGLKwrofXaNMweqLPS7+wSLqajz9SVL5a3u
         YRbURaajX8a0qaw+iGgiyoaC29ijpGJBjmRWmcyROiC/BO4hNg7hcevkYpbi3WUGjCdA
         jxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SOWNzVzUf3MTsOwLQEuzLvhwNlAbmPmc1U0N0oJw0qc=;
        b=Rnx5erOol+pcjcwpmP0FRG4kn3s6TIw7QDTxa+eAnArhS5PCqEMXBGKll+MVswJ16j
         BRqEppx8xRkV2SUVrnpaBJnhhHuQ+G3AcHGYYlFbsmW4DLuByBIL93JFXTDVqLbilouB
         IwiycEKwpNcGr7qN2dupp69bOvKIfE9VKThXChv6d9P7ugGwAbRQwlEDqMLNvAKD58hu
         9p/1gN86YFtiHkqYviQGWwHTu2OF3mXDD2UBXC5P87OfQU/xzzGjvwlUk3o19M9s5PcG
         Xzt1fiV813Ruq35fqDaaJ2ES1y8WbPcf5CEu+voAyE+B8loUk+SpIlEczrt9jyCDQTuD
         xUmA==
X-Gm-Message-State: APjAAAVC8DRCl3xh+6ESX5pBVel6KQFhLejCDiYGP/O877EUcctdyEFp
        VgEnLOyqGAsOcyn5nyYN1Jo=
X-Google-Smtp-Source: APXvYqx2x0Vv2AUQmkb8PEHXBPf4ZJ3pwi+zEIaT5FZZhaluWk1xxUQcm6mUeYe30qRjbIztIESC3g==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr2292674wmh.68.1561544178630;
        Wed, 26 Jun 2019 03:16:18 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id v4sm1716353wmg.22.2019.06.26.03.16.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 03:16:17 -0700 (PDT)
Date:   Wed, 26 Jun 2019 12:16:16 +0200
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
Subject: Re: [PATCH V4 12/18] clk: tegra210: support for Tegra210 clocks
 suspend and resume
Message-ID: <20190626101616.GE6362@ulmo>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-13-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8vCeF2GUdMpe9ZbK"
Content-Disposition: inline
In-Reply-To: <1561345379-2429-13-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--8vCeF2GUdMpe9ZbK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:02:53PM -0700, Sowjanya Komatineni wrote:
> This patch adds system suspend and resume support for Tegra210
> clocks.
>=20
> All the CAR controller settings are lost on suspend when core power
> goes off.
>=20
> This patch has implementation for saving and restoring all the PLLs
> and clocks context during system suspend and resume to have the
> clocks back to same state for normal operation.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 115 +++++++++++++++++++++++++++++++++=
+++++-
>  drivers/clk/tegra/clk.c          |  14 +++++
>  drivers/clk/tegra/clk.h          |   1 +
>  3 files changed, 127 insertions(+), 3 deletions(-)

Can you give a brief overview of how you've been testing this? Is this
just about confirming that "things work fine" after resume? Could we be
more methodical and perhaps check the state of the clock tree before
suspend (perhaps by inspecting debugfs) and comparing it to the state
after resume?

One minor nit below...

> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-teg=
ra210.c
> index c414cd72d045..4fb3509fe9f6 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -9,10 +9,12 @@
>  #include <linux/clkdev.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_platform.h>
>  #include <linux/delay.h>
>  #include <linux/export.h>
>  #include <linux/mutex.h>
>  #include <linux/clk/tegra.h>
> +#include <linux/syscore_ops.h>
>  #include <dt-bindings/clock/tegra210-car.h>
>  #include <dt-bindings/reset/tegra210-car.h>
>  #include <linux/iopoll.h>
> @@ -20,6 +22,7 @@
>  #include <soc/tegra/pmc.h>
> =20
>  #include "clk.h"
> +#include "clk-dfll.h"
>  #include "clk-id.h"
> =20
>  /*
> @@ -225,6 +228,7 @@
> =20
>  #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
>  #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
> +#define CPU_SOFTRST_CTRL 0x380
> =20
>  #define LVL2_CLK_GATE_OVRA 0xf8
>  #define LVL2_CLK_GATE_OVRC 0x3a0
> @@ -2820,6 +2824,7 @@ static int tegra210_enable_pllu(void)
>  	struct tegra_clk_pll_freq_table *fentry;
>  	struct tegra_clk_pll pllu;
>  	u32 reg;
> +	int ret;
> =20
>  	for (fentry =3D pll_u_freq_table; fentry->input_rate; fentry++) {
>  		if (fentry->input_rate =3D=3D pll_ref_freq)
> @@ -2847,10 +2852,10 @@ static int tegra210_enable_pllu(void)
>  	fence_udelay(1, clk_base);
>  	reg |=3D PLL_ENABLE;
>  	writel(reg, clk_base + PLLU_BASE);
> +	fence_udelay(1, clk_base);
> =20
> -	readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
> -					  reg & PLL_BASE_LOCK, 2, 1000);
> -	if (!(reg & PLL_BASE_LOCK)) {
> +	ret =3D tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
> +	if (ret) {
>  		pr_err("Timed out waiting for PLL_U to lock\n");
>  		return -ETIMEDOUT;
>  	}
> @@ -3282,6 +3287,103 @@ static void tegra210_disable_cpu_clock(u32 cpu)
>  }
> =20
>  #ifdef CONFIG_PM_SLEEP
> +static u32 cpu_softrst_ctx[3];
> +static struct platform_device *dfll_pdev;
> +#define car_readl(_base, _off) readl_relaxed(clk_base + (_base) + ((_off=
) * 4))
> +#define car_writel(_val, _base, _off) \
> +		writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
> +
> +static int tegra210_clk_suspend(void)
> +{
> +	int i;

This can be unsigned int.

> +	struct device_node *node;
> +
> +	tegra_cclkg_burst_policy_save_context();
> +
> +	if (!dfll_pdev) {
> +		node =3D of_find_compatible_node(NULL, NULL,
> +					       "nvidia,tegra210-dfll");
> +		if (node)
> +			dfll_pdev =3D of_find_device_by_node(node);
> +
> +		of_node_put(node);
> +		if (!dfll_pdev)
> +			pr_err("dfll node not found. no suspend for dfll\n");
> +	}
> +
> +	if (dfll_pdev)
> +		tegra_dfll_suspend(dfll_pdev);
> +
> +	/* Enable PLLP_OUT_CPU after dfll suspend */
> +	tegra_clk_set_pllp_out_cpu(true);
> +
> +	tegra_sclk_cclklp_burst_policy_save_context();
> +
> +	clk_save_context();
> +
> +	for (i =3D 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
> +		cpu_softrst_ctx[i] =3D car_readl(CPU_SOFTRST_CTRL, i);
> +
> +	return 0;
> +}
> +
> +static void tegra210_clk_resume(void)
> +{
> +	int i;

And here too.

With that:

Acked-by: Thierry Reding <treding@nvidia.com>

> +	struct clk_hw *parent;
> +	struct clk *clk;
> +
> +	/*
> +	 * clk_restore_context restores clocks as per the clock tree.
> +	 *
> +	 * dfllCPU_out is first in the clock tree to get restored and it
> +	 * involves programming DFLL controller along with restoring CPUG
> +	 * clock burst policy.
> +	 *
> +	 * DFLL programming needs dfll_ref and dfll_soc peripheral clocks
> +	 * to be restores which are part ofthe peripheral clocks.
> +	 * So, peripheral clocks restore should happen prior to dfll clock
> +	 * restore.
> +	 */
> +
> +	tegra_clk_osc_resume(clk_base);
> +	for (i =3D 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
> +		car_writel(cpu_softrst_ctx[i], CPU_SOFTRST_CTRL, i);
> +
> +	/* restore all plls and peripheral clocks */
> +	tegra210_init_pllu();
> +	clk_restore_context();
> +
> +	fence_udelay(5, clk_base);
> +
> +	/* resume SCLK and CPULP clocks */
> +	tegra_sclk_cpulp_burst_policy_restore_context();
> +
> +	/*
> +	 * restore CPUG clocks:
> +	 * - enable DFLL in open loop mode
> +	 * - switch CPUG to DFLL clock source
> +	 * - close DFLL loop
> +	 * - sync PLLX state
> +	 */
> +	if (dfll_pdev)
> +		tegra_dfll_resume(dfll_pdev, false);
> +
> +	tegra_cclkg_burst_policy_restore_context();
> +	fence_udelay(2, clk_base);
> +
> +	if (dfll_pdev)
> +		tegra_dfll_resume(dfll_pdev, true);
> +
> +	parent =3D clk_hw_get_parent(__clk_get_hw(clks[TEGRA210_CLK_CCLK_G]));
> +	clk =3D clks[TEGRA210_CLK_PLL_X];
> +	if (parent !=3D __clk_get_hw(clk))
> +		tegra_clk_sync_state_pll(__clk_get_hw(clk));
> +
> +	/* Disable PLL_OUT_CPU after DFLL resume */
> +	tegra_clk_set_pllp_out_cpu(false);
> +}
> +
>  static void tegra210_cpu_clock_suspend(void)
>  {
>  	/* switch coresite to clk_m, save off original source */
> @@ -3297,6 +3399,11 @@ static void tegra210_cpu_clock_resume(void)
>  }
>  #endif
> =20
> +static struct syscore_ops tegra_clk_syscore_ops =3D {
> +	.suspend =3D tegra210_clk_suspend,
> +	.resume =3D tegra210_clk_resume,
> +};
> +
>  static struct tegra_cpu_car_ops tegra210_cpu_car_ops =3D {
>  	.wait_for_reset	=3D tegra210_wait_cpu_in_reset,
>  	.disable_clock	=3D tegra210_disable_cpu_clock,
> @@ -3582,5 +3689,7 @@ static void __init tegra210_clock_init(struct devic=
e_node *np)
>  	tegra210_mbist_clk_init();
> =20
>  	tegra_cpu_car_ops =3D &tegra210_cpu_car_ops;
> +
> +	register_syscore_ops(&tegra_clk_syscore_ops);
>  }
>  CLK_OF_DECLARE(tegra210, "nvidia,tegra210-car", tegra210_clock_init);
> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> index 9e863362d2bf..96cc9937ea37 100644
> --- a/drivers/clk/tegra/clk.c
> +++ b/drivers/clk/tegra/clk.c
> @@ -23,6 +23,7 @@
>  #define CLK_OUT_ENB_W			0x364
>  #define CLK_OUT_ENB_X			0x280
>  #define CLK_OUT_ENB_Y			0x298
> +#define CLK_ENB_PLLP_OUT_CPU		BIT(31)
>  #define CLK_OUT_ENB_SET_L		0x320
>  #define CLK_OUT_ENB_CLR_L		0x324
>  #define CLK_OUT_ENB_SET_H		0x328
> @@ -205,6 +206,19 @@ const struct tegra_clk_periph_regs *get_reg_bank(int=
 clkid)
>  	}
>  }
> =20
> +void tegra_clk_set_pllp_out_cpu(bool enable)
> +{
> +	u32 val;
> +
> +	val =3D readl_relaxed(clk_base + CLK_OUT_ENB_Y);
> +	if (enable)
> +		val |=3D CLK_ENB_PLLP_OUT_CPU;
> +	else
> +		val &=3D ~CLK_ENB_PLLP_OUT_CPU;
> +
> +	writel_relaxed(val, clk_base + CLK_OUT_ENB_Y);
> +}
> +
>  void tegra_cclkg_burst_policy_save_context(void)
>  {
>  	unsigned int i;
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 7b99496fefb9..b994dfaa9602 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -862,6 +862,7 @@ void tegra_cclkg_burst_policy_restore_context(void);
>  void tegra_sclk_cclklp_burst_policy_save_context(void);
>  void tegra_sclk_cpulp_burst_policy_restore_context(void);
>  void tegra_clk_osc_resume(void __iomem *clk_base);
> +void tegra_clk_set_pllp_out_cpu(bool enable);
> =20
>  /* Combined read fence with delay */
>  #define fence_udelay(delay, reg)	\
> --=20
> 2.7.4
>=20

--8vCeF2GUdMpe9ZbK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0TRfAACgkQ3SOs138+
s6FmOg//a1bbT2plirX79cX1g30/ja4jCcrpavPPUS43CED3bt/lE8YikYAtoN3X
gbiid1FJKkVmB3yvOo5ePxPK+h6Sx7Qja5e53Byh4Fgf4MAHlI3mqB2kKY+peqtC
q1vfRAFeLL5d44U6hBY+0VH/DTc8evNc+BpaMb6mDoY1Gh4G2+ozFW7pxhFM6/S7
25kKs4Ns95lXICsyAdsS/rggCljxT4cuA1X5pCp/0q5kdOTOL25c0PGImNfQQIEy
mVeX5c4fpz/hOFiCXh6XPbOSYwoBUifETK4rBqMbTgGNe/xlso0PnacBWoMZ/+A8
lp+W00Nvoy6EDGkXjbBacz5eyvQD6UixMbn9/TZGkr5FzBJc4vJb6pSebI0zX4PN
ReaZ40Pcb9AdqiliTgDBLiOKVmqPGdnC0+np8MKebG9kSNBw1bZhtKw2dqBCH3X/
mSbVfR4s0NfNPocKY6atnxDZSULmpA4vImoNNt3ipj9e2Bau2pbHaUQezdI8gPXD
kIWSnMpv2aT1lDFsZI7ahduy9DcMf8VNruedRARC3kx4FUN4PBZVsT/7KMUdp+L0
g4UuxkCXxLeIUTKyu2C8e5kgeB5giAbD9EQpLQv/aBnX2S8ZY91PCScwa2OA0ATH
u2PsQPMHP9nglTu+L5jefVmwLpv1F5Mp7FxQHls6C7PLl9nSuJE=
=zZC2
-----END PGP SIGNATURE-----

--8vCeF2GUdMpe9ZbK--
