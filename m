Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 584CF49FA3
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 13:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729738AbfFRLvA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 07:51:00 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51782 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729662AbfFRLvA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 07:51:00 -0400
Received: by mail-wm1-f66.google.com with SMTP id 207so2921367wma.1;
        Tue, 18 Jun 2019 04:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hijuCzAY2Pi9akbVtbMbIWMuy5Jj/AsTuvCGyCYSJJI=;
        b=vcUy7JtAouiP/n8/clS6ufdx7IOtAXbV+UUFCN+/e7VZWSigf64wfDbgbJQYCKVXss
         /BavSP0D0Xy5e0nT/vaEBZxEnevYVcAOFP4ntanCMHjO8zjfcxKni7P2tGNDTskeF++J
         koFN4quqbUe09UnITXwqqQ8uZAPOMkd3M+wE0IeSuKngm7oiGh4n/dQayG1nN53IHIz2
         89ymhEf3VKzJBiW665oDu/JmagKjaUZaGFWdz7NAX53PBYVJqHytQab9uk01l54e02KC
         xj0xtNxobpQcsPD6qA+iveRX394soHv777Qg9jHKaWvGjQx2+ZDpGk/qmbwC/3en2GeN
         8K9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hijuCzAY2Pi9akbVtbMbIWMuy5Jj/AsTuvCGyCYSJJI=;
        b=s1nV/GTDecFPYBNIr1XYgbHxHTxScFKn6m3eH9BXdcWSw/HFK3cFd463ZQHJhs+xfd
         b6BTLFMeUEMdG9gSMIa7Ebjty5h1fU8JMPwQYYyxT/5b0AnG9U7FX6GO1zQIs0vIIvfn
         lgiZwQ6B4WDE5ABVmUThtgOWVwLxH02kdJw02uEQVJGaBU63Mgm2/MWjPGsKGTK8LdB+
         58jcS6/Veb1clDoifnVo2/dhiUSQBEkMY7EP52dBTV9eTOho9Dr+gzAheUwHTX3FSsW1
         /SjsvgowZ57j/KMfNHmRRQU/X9LHUELwgg32DJmkE7tbJhEXCUl4wnpGNDOfNWTEYchn
         XO+g==
X-Gm-Message-State: APjAAAVWcew/ByxM2P7IKpQGBImQbR9Id3O8NQpqCFibd1KDVWGgoBBM
        sfEowg7PSd77uSvugaPwKf65s9FQcC8=
X-Google-Smtp-Source: APXvYqzoJL5ciO7+g5+3dBHsq0vNDBvVWd+2THefs9ev0GsNqemmcPFTPn7jcJtzirzfOynjNOIkWA==
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr3166467wmc.33.1560858657282;
        Tue, 18 Jun 2019 04:50:57 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id x83sm2307570wmb.42.2019.06.18.04.50.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 04:50:56 -0700 (PDT)
Date:   Tue, 18 Jun 2019 13:50:55 +0200
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
Subject: Re: [PATCH V3 08/17] clk: tegra: add support for peripheral clock
 suspend and resume
Message-ID: <20190618115055.GK28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-9-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6TC23+W66xmFESAX"
Content-Disposition: inline
In-Reply-To: <1560843991-24123-9-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--6TC23+W66xmFESAX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:22AM -0700, Sowjanya Komatineni wrote:
> This patch creates APIs to save and restore the state of all
> peripheral clocks reset and enables.
>=20
> These APIs are invoked by Tegra210 clock driver during suspend and
> resume to save the peripheral clocks state before suspend and to
> restore them on resume.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk.c | 70 +++++++++++++++++++++++++++++++++++++++++++=
+++++-
>  drivers/clk/tegra/clk.h |  3 +++
>  2 files changed, 72 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> index 26690663157a..bd3b46c5f941 100644
> --- a/drivers/clk/tegra/clk.c
> +++ b/drivers/clk/tegra/clk.c
> @@ -70,6 +70,7 @@ static struct clk **clks;
>  static int clk_num;
>  static struct clk_onecell_data clk_data;
> =20
> +static u32 *periph_ctx;
>  static u32 cclkg_burst_policy_ctx[2];
>  static u32 cclklp_burst_policy_ctx[2];
>  static u32 sclk_burst_policy_ctx[2];
> @@ -279,6 +280,63 @@ void tegra_sclk_cpulp_burst_policy_restore_context(v=
oid)
>  	writel_relaxed(clk_arm_ctx, clk_base + CLK_MASK_ARM);
>  }
> =20
> +void tegra_clk_periph_suspend(void __iomem *clk_base)
> +{
> +	int i, idx;

Can be unsigned int. Same for below.

> +
> +	idx =3D 0;
> +	for (i =3D 0; i < periph_banks; i++, idx++)
> +		periph_ctx[idx] =3D
> +			readl_relaxed(clk_base + periph_regs[i].rst_reg);
> +
> +	for (i =3D 0; i < periph_banks; i++, idx++)
> +		periph_ctx[idx] =3D
> +			readl_relaxed(clk_base + periph_regs[i].enb_reg);
> +}
> +
> +void tegra_clk_periph_force_on(u32 *clks_on, int count, void __iomem *cl=
k_base)

count can also be unsigned int.

> +{
> +	int i;
> +
> +	WARN_ON(count !=3D periph_banks);
> +
> +	for (i =3D 0; i < count; i++)
> +		writel_relaxed(clks_on[i], clk_base + periph_regs[i].enb_reg);
> +}
> +
> +void tegra_clk_periph_resume(void __iomem *clk_base)
> +{
> +	int i, idx;
> +
> +	idx =3D 0;
> +	for (i =3D 0; i < periph_banks; i++, idx++)
> +		writel_relaxed(periph_ctx[idx],
> +			       clk_base + periph_regs[i].rst_reg);
> +
> +	/* ensure all resets have propagated */
> +	fence_udelay(2, clk_base);
> +	tegra_read_chipid();
> +
> +	for (i =3D 0; i < periph_banks; i++, idx++)
> +		writel_relaxed(periph_ctx[idx],
> +			       clk_base + periph_regs[i].enb_reg);
> +
> +	/* ensure all enables have propagated */
> +	fence_udelay(2, clk_base);
> +	tegra_read_chipid();
> +}
> +
> +static int tegra_clk_suspend_ctx_init(int banks)
> +{
> +	int err =3D 0;
> +
> +	periph_ctx =3D kcalloc(2 * banks, sizeof(*periph_ctx), GFP_KERNEL);
> +	if (!periph_ctx)
> +		err =3D -ENOMEM;
> +
> +	return err;
> +}
> +
>  struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int ban=
ks)
>  {
>  	clk_base =3D regs;
> @@ -295,11 +353,21 @@ struct clk ** __init tegra_clk_init(void __iomem *r=
egs, int num, int banks)
>  	periph_banks =3D banks;
> =20
>  	clks =3D kcalloc(num, sizeof(struct clk *), GFP_KERNEL);
> -	if (!clks)
> +	if (!clks) {
>  		kfree(periph_clk_enb_refcnt);
> +		return NULL;
> +	}
> =20
>  	clk_num =3D num;
> =20
> +	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
> +		if (tegra_clk_suspend_ctx_init(banks)) {
> +			kfree(periph_clk_enb_refcnt);
> +			kfree(clks);
> +			return NULL;
> +		}
> +	}
> +
>  	return clks;
>  }
> =20
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index c8f8a23096e2..a354cacae5a6 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -853,6 +853,9 @@ void tegra_cclkg_burst_policy_save_context(void);
>  void tegra_cclkg_burst_policy_restore_context(void);
>  void tegra_sclk_cclklp_burst_policy_save_context(void);
>  void tegra_sclk_cpulp_burst_policy_restore_context(void);
> +void tegra_clk_periph_suspend(void __iomem *clk_base);
> +void tegra_clk_periph_resume(void __iomem *clk_base);
> +void tegra_clk_periph_force_on(u32 *clks_on, int count, void __iomem *cl=
k_base);
> =20
>  /* Combined read fence with delay */
>  #define fence_udelay(delay, reg)	\

Other than the nitpicks, looks good:

Acked-by: Thierry Reding <treding@nvidia.com>

--6TC23+W66xmFESAX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0I0B8ACgkQ3SOs138+
s6GfZhAAmD6cbOIgUCROHyAhWdbEC6b72a8qyJYEbvoQ8eGoa52c+EGCZVgUFZqL
30PtlxxLfWKdDJesDhVRtHCdpKcMn5Zhm4vEpP1Oj/7oVCySPkHMgCPi9PBlBMdC
Bk75n0Y6j1sNblSrXrQESF2nvK6YjPRRT42YKCr7/ES1iZqL8IbN9adme2OSmTOD
4q1SEfCP7J2r4XpEq8YwJ4Hoq74MOwnsBDYytahE1iFrxW9pazT89a/7RmIcCdL9
FY+y4+xUL80/K1rYB3LQLZZXNjSw/xAptYtCxMIZKggyPapBv7NgazfmO1ofi8cF
Rl3KcKL5ryWhPxXtx3RgPjbVlNfjoOiJSdnj62936v73MSf/p9v+FXKvU2SJSIGw
OuYoo1HhKgV/VYUGIEE3annwC/vhqkoC445rcc/yrrkBAXTo2lM4y2DiGa1QTHeI
tQ+EnYCCBQ+uypKEPiU0PFlolUycP8xK5KnNAXXpu4AKXsYsw/9B20AhpYix26KN
e/f9/nOxgOlubtExDmSCDVQsasiEKm8Fw5Ow3clSn77CvlEhCkRZ6g/OU9Il4Eh0
0PUxLqs/hjUqYOgKWFpQ1WZy5A+rMww+wLrmfXa/3Fw+AqJAMJswTESep+hEFJd/
54GDr/Rey0HQ5c4QV2sUbl2G40RVel/bkNt5COK0cUIgyl6pqiM=
=04ad
-----END PGP SIGNATURE-----

--6TC23+W66xmFESAX--
