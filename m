Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98C2249F97
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 13:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729678AbfFRLsV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 07:48:21 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39226 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbfFRLsV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 07:48:21 -0400
Received: by mail-wm1-f65.google.com with SMTP id z23so2898821wma.4;
        Tue, 18 Jun 2019 04:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aputY+jrLKzNvsn2gIWdwHDyDuWhnjMSp3SALQclCyg=;
        b=tv1hYFmiPEVC4QTm2Mn1WsE6YDsJraeWi5I/PzvR3xiW/Sg6p7sw4CTfdpSI//ZvvJ
         mKpf5o3KtQS82K1aPCjQ5eL262VllB2DAfWoxeh5zF0jdOnWqWLRCRh4DHmRoqTwpkVR
         0uDjS+lDTZt3obZSc64ev2ne/T4dB7nXftB6DtEtsVmFcoZ9Hi7py+uvdEB98VUnl8Ph
         ARJmn4WAnzCt268B4TL5kDDLXOL/RtFyFhPydbUvwVE8QHCGP9PCrMz0Rkf6cSiQcWBf
         NTuxN4J6CkbSQPXMHMvq2J+IrXIP2gLtwyqwA8VVMuhtOt240u9Ula4POQeo0R0IKOPz
         xKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aputY+jrLKzNvsn2gIWdwHDyDuWhnjMSp3SALQclCyg=;
        b=rHBVY6XWKoKyiEOmpG7nDFEJ7hvuFG1e5QJj3bVcg+aqaoir9x5vqUiYUiFnKLXDca
         tMWIcuKAXjG4ZrRdIWxTKnkQ+vHJBz7wtK05cyIQ9PYGvNyRoxiq0MlMzdQZfSGIpkjz
         7lPFUkhzKiRm3rnJD3XfGmOSzsfJeKS7irrrtlWXcphvMG6i8nIn6U1H0LAltDchIkgv
         az+eckkZHEi/WN79Kg0gTHHb3Cq1vVTHEVnqFI7bLFwBxgfJvyo+8Ts1UOXNQArzu2MT
         fNJGyX8aVbqNBorgQYZmgatxdBOX9qPj55UGG7IzaV89wIB3SIUzMNn7BJBOQNMgbTp3
         N1FQ==
X-Gm-Message-State: APjAAAWHDXkYt0j8Djz42Ngzuf+vwXdrIPys7NH0brJ36LETECn6tyhZ
        zU2awaILbAASh8kNvX/gDy4=
X-Google-Smtp-Source: APXvYqyGM4Z8puL/PdvjJNLsnLMIRlD6Pf3Buukr3nVqDAzH/2VXj+M1dIeyU/ZlvW/KhuKKaoT/WA==
X-Received: by 2002:a1c:b707:: with SMTP id h7mr3193707wmf.45.1560858496862;
        Tue, 18 Jun 2019 04:48:16 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id j32sm3867398wrj.43.2019.06.18.04.48.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 04:48:16 -0700 (PDT)
Date:   Tue, 18 Jun 2019 13:48:15 +0200
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
Subject: Re: [PATCH V3 07/17] clk: tegra: save and restore CPU and System
 clocks context
Message-ID: <20190618114815.GJ28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-8-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KZLWU/9q3evlN4nQ"
Content-Disposition: inline
In-Reply-To: <1560843991-24123-8-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--KZLWU/9q3evlN4nQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:21AM -0700, Sowjanya Komatineni wrote:
> During system suspend state, core power goes off and looses all the
> CAR controller register settings.
>=20
> This patch creates APIs for saving and restoring the context of Tegra
> CPUG, CPULP and SCLK.
>=20
> CPU and System clock context includes
> - CPUG, CPULP, and SCLK burst policy settings for clock sourcea of all
>   their normal states.
> - SCLK divisor and System clock rate for restoring SCLK, AHB and APB
>   rates on resume.
> - OSC_DIV settings which are used as reference clock input to some PLLs.
> - SPARE_REG and CLK_MASK settings.
>=20
> These APIs are used in Tegra210 clock driver during suspend and resume
> operation.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra-super-gen4.c |  4 --
>  drivers/clk/tegra/clk.c                  | 80 ++++++++++++++++++++++++++=
++++++
>  drivers/clk/tegra/clk.h                  | 14 ++++++
>  3 files changed, 94 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra=
/clk-tegra-super-gen4.c
> index cdfe7c9697e1..ed69ec4d883e 100644
> --- a/drivers/clk/tegra/clk-tegra-super-gen4.c
> +++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
> @@ -19,10 +19,6 @@
>  #define PLLX_MISC2 0x514
>  #define PLLX_MISC3 0x518
> =20
> -#define CCLKG_BURST_POLICY 0x368
> -#define CCLKLP_BURST_POLICY 0x370
> -#define SCLK_BURST_POLICY 0x028
> -#define SYSTEM_CLK_RATE 0x030
>  #define SCLK_DIVIDER 0x2c
> =20
>  static DEFINE_SPINLOCK(sysrate_lock);
> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> index 573e3c967ae1..26690663157a 100644
> --- a/drivers/clk/tegra/clk.c
> +++ b/drivers/clk/tegra/clk.c
> @@ -70,6 +70,12 @@ static struct clk **clks;
>  static int clk_num;
>  static struct clk_onecell_data clk_data;
> =20
> +static u32 cclkg_burst_policy_ctx[2];
> +static u32 cclklp_burst_policy_ctx[2];
> +static u32 sclk_burst_policy_ctx[2];
> +static u32 sys_clk_divisor_ctx, system_rate_ctx;
> +static u32 spare_ctx, misc_clk_enb_ctx, clk_arm_ctx;
> +
>  /* Handlers for SoC-specific reset lines */
>  static int (*special_reset_assert)(unsigned long);
>  static int (*special_reset_deassert)(unsigned long);
> @@ -199,6 +205,80 @@ const struct tegra_clk_periph_regs *get_reg_bank(int=
 clkid)
>  	}
>  }
> =20
> +void tegra_cclkg_burst_policy_save_context(void)
> +{
> +	int i;

This here (and the same goes for the other functions below) can be
unsigned int.

Otherwise:

Acked-by: Thierry Reding <treding@nvidia.com>

--KZLWU/9q3evlN4nQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Iz38ACgkQ3SOs138+
s6HK1Q/7BzzelnHJLENRo5Vc9/8+nrFkSHtCYoUJ58KOVa06A5Czu3EdVKmfleMu
UgogQBYvIctxLTS1GMVWJ8W88p7SdUJYyA0yDNXGIom6guLt6EmhUl6us0HN+K3K
XCw7t9qrk8/3cHrY7Gk8IjWYMsxLKeS0MndZNcyBS0qeFpk0NcHPVkbYuPso67vP
FzKGwqZ4r98oPiP1uF0FteU1xrZ/s8fvOfWniCcHczda7CSEdPc8ZHV20Yc/inya
V4OPm5NLevM+QNUb1iiGfjyOS97eGAF9wUZyDZwdMn1D7pj47CWX2jqNTKcBiDue
OwMBXLR7LpvGhaXXJeKCKmSi8jWEDMaIaWH7EME89bHwa/uXIzz+zlbuGYxxJOkm
IHDjpXMwL3DPKUBiae72er8rue35cZIDTVQFdM8kQi576gtNWTkfiaHBa5xnxnw7
MdVW2xJkaWFxoDrV6Y+Y3v/opMGslB1Q/sdKQpg1PYidRkWYvgOeUnFabNvTOScb
iaGJX6gOgVjPBpfRJ4yQ79g4HwrzEgZfMkwwFX1olP+XOsQ10Grz7zMWPUiOaGer
b24d6OuJADUF0RjOjXL42bQKc1cuk9z0oR5y+hj4LMgixfNt9GbRqmkRHRcQCAdh
C1fm5rTIlLpl3ccOD5Ini98PPlDwQDQ7NCUjGEZvrLdqZJOUZP4=
=vaKL
-----END PGP SIGNATURE-----

--KZLWU/9q3evlN4nQ--
