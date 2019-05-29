Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B357C2DFC6
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 16:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfE2Oav (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 10:30:51 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46326 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfE2Oav (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 10:30:51 -0400
Received: by mail-wr1-f65.google.com with SMTP id r7so1924438wrr.13;
        Wed, 29 May 2019 07:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+mrvH5d9LnblMFOrU+glO76G4SJ6Ih/eDveF6jIta9Q=;
        b=W8JOsQlGyoa8Jr2aFnmr9GTCVgVQPuDWb5dA8jyvf5hljd0EQOPlPcqfwGv+SjUXLy
         porOr0Iv98gZ9Y7mR2bjcnU70c9NHxyTAMIa4Nf8gIv0DrvsK1xLCHWUZMmbHl0oUqr7
         4TccOQzdz5Z8CpYqCEKmCTHP4wXt7tYhdsC3ZUySUSt9cVs1c+P2NSQ+tK7l9/PKDt68
         jckUnUFNGI7iN3Llm0zLMU+ZWDlo3EJkggkKVJX7qjh4Nd6fjXrF4xP+Yy1BwgKaOO8l
         ex/8ul9IQucbV2n6Wl0yLJrm4rvSKfsbAmoh02MoLTVvh9bQC5cTdrYlRW49PsM7OmPJ
         pqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+mrvH5d9LnblMFOrU+glO76G4SJ6Ih/eDveF6jIta9Q=;
        b=If9tRhSAs7yZo2lKRprEg80SWlHlx06hXVeokYwrnrGYr5bb+ExF1rM5TwnwGxyQp1
         gUuBCJf6fiuybWy59jJTYqjXrdV/Oy3pIyEmgiabgyVFxTQ3rGuzgZx8IVezujSpPj+h
         24ZVxw3RtRb3X736ZAshmcDpBdpRkabestyaoeQ7q6jlzuuc9A8pTasxH9fk71Xo2CHF
         xYkWsS5L3k+BhOBIoX0zxX0+pg/JunY8n7tMBXOteL7MqPGjIs8xloRFraYPVT+5hHwZ
         DhntbFDS5rKzmF7tvZLmEd4iU01rM3g9Qm9YQti+buZ8m/x+sAH3SBYXc64e0hrh1IoZ
         hpqw==
X-Gm-Message-State: APjAAAWCF+KfPJRY14uCqeUrOgwuDGiukR86FwwjIWaC9VB3W2cetw7k
        EFAvwzk2XR6WZSYL4NFdt8oXosKh
X-Google-Smtp-Source: APXvYqwkTFr7sjDIT5btyNSIMcJc7h73x4bwa4wtzCODaT/zS9/J1zsFj3/ICGIgfnmRBZ7O4yOHqg==
X-Received: by 2002:a5d:610e:: with SMTP id v14mr402211wrt.343.1559140248146;
        Wed, 29 May 2019 07:30:48 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id n7sm6577025wrw.64.2019.05.29.07.30.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 29 May 2019 07:30:47 -0700 (PDT)
Date:   Wed, 29 May 2019 16:30:46 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net,
        marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch,
        mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com,
        talho@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 08/12] soc/tegra: pmc: allow support for more tegra
 wake models
Message-ID: <20190529143046.GF17679@ulmo>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-9-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qp4W5+cUSnZs0RIF"
Content-Disposition: inline
In-Reply-To: <1559084936-4610-9-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--qp4W5+cUSnZs0RIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 04:08:52PM -0700, Sowjanya Komatineni wrote:
> This patch allows to create separate irq_set_wake and irq_set_type
> implementations for different tegra designs PMC that has different
> wake models which require difference wake registers and different
> programming sequence.
>=20
> AOWAKE model support is available for Tegra186 and Tegra194 only
> and it resides within PMC and supports tiered wake architecture.
>=20
> Tegra210 and prior tegra designs uses PMC directly to receive wake
> events and coordinate the wake sequence.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 5648e5c09ef5..974b4c9f6ada 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -235,6 +235,8 @@ struct tegra_pmc_soc {
>  	void (*setup_irq_polarity)(struct tegra_pmc *pmc,
>  				   struct device_node *np,
>  				   bool invert);
> +	int (*irq_set_wake)(struct irq_data *data, unsigned int on);
> +	int (*irq_set_type)(struct irq_data *data, unsigned int type);
> =20
>  	const char * const *reset_sources;
>  	unsigned int num_reset_sources;
> @@ -1915,12 +1917,15 @@ static const struct irq_domain_ops tegra_pmc_irq_=
domain_ops =3D {
>  	.alloc =3D tegra_pmc_irq_alloc,
>  };
> =20
> -static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
> +static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int=
 on)
>  {
>  	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
>  	unsigned int offset, bit;
>  	u32 value;
> =20
> +	if (data->hwirq =3D=3D ULONG_MAX)
> +		return 0;
> +
>  	offset =3D data->hwirq / 32;
>  	bit =3D data->hwirq % 32;
> =20

I've submitted this hunk as a separate patch because I think we may end
up needing to backport that to v5.0.

No need for you to worry about that, though. I'll take care of it when I
apply this patch.

Thierry

> @@ -1943,7 +1948,7 @@ static int tegra_pmc_irq_set_wake(struct irq_data *=
data, unsigned int on)
>  	return 0;
>  }
> =20
> -static int tegra_pmc_irq_set_type(struct irq_data *data, unsigned int ty=
pe)
> +static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int=
 type)
>  {
>  	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
>  	u32 value;
> @@ -1996,8 +2001,10 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pm=
c)
>  	pmc->irq.irq_unmask =3D irq_chip_unmask_parent;
>  	pmc->irq.irq_eoi =3D irq_chip_eoi_parent;
>  	pmc->irq.irq_set_affinity =3D irq_chip_set_affinity_parent;
> -	pmc->irq.irq_set_type =3D tegra_pmc_irq_set_type;
> -	pmc->irq.irq_set_wake =3D tegra_pmc_irq_set_wake;
> +	if (pmc->soc->irq_set_type)
> +		pmc->irq.irq_set_type =3D pmc->soc->irq_set_type;
> +	if (pmc->soc->irq_set_wake)
> +		pmc->irq.irq_set_wake =3D pmc->soc->irq_set_wake;
> =20
>  	pmc->domain =3D irq_domain_add_hierarchy(parent, 0, 96, pmc->dev->of_no=
de,
>  					       &tegra_pmc_irq_domain_ops, pmc);
> @@ -2670,6 +2677,8 @@ static const struct tegra_pmc_soc tegra186_pmc_soc =
=3D {
>  	.regs =3D &tegra186_pmc_regs,
>  	.init =3D NULL,
>  	.setup_irq_polarity =3D tegra186_pmc_setup_irq_polarity,
> +	.irq_set_wake =3D tegra186_pmc_irq_set_wake,
> +	.irq_set_type =3D tegra186_pmc_irq_set_type,
>  	.reset_sources =3D tegra186_reset_sources,
>  	.num_reset_sources =3D ARRAY_SIZE(tegra186_reset_sources),
>  	.reset_levels =3D tegra186_reset_levels,
> @@ -2748,6 +2757,8 @@ static const struct tegra_pmc_soc tegra194_pmc_soc =
=3D {
>  	.regs =3D &tegra186_pmc_regs,
>  	.init =3D NULL,
>  	.setup_irq_polarity =3D tegra186_pmc_setup_irq_polarity,
> +	.irq_set_wake =3D tegra186_pmc_irq_set_wake,
> +	.irq_set_type =3D tegra186_pmc_irq_set_type,
>  	.num_wake_events =3D ARRAY_SIZE(tegra194_wake_events),
>  	.wake_events =3D tegra194_wake_events,
>  };
> --=20
> 2.7.4
>=20

--qp4W5+cUSnZs0RIF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzul5YACgkQ3SOs138+
s6EvRg//SiL8/cj7vXeGPNhShOjMQH5iYJIHqsX0WbMVVHn86pA6gpNyEYzZKaMU
Sx9GsAU6QQSaitW2WJ+9Dd2+uNaHiOIFSqZwGEHUxDcYCyEsvNhq99mPVw+KOQXs
u+hCCzhEN/4emURsfohOTDBRORr30tbLqzl3WinPLrseqLlY5oHXz5RmzXPY8wRV
ZmBo6X5xXAr3IctQpZUlTDr/TiY60JLEN3zVqPHlNEShtlMVVVzMzR6ByP20NSh0
fVL/P3iTC3nKHtwlqhaaMpu27wMNz+HHa6xaMRRkM+BLQyuDlN5cZEN3HsiFijB3
lYn5sMz9bonxyaHX5ROFOeqCfGqPAhBde6d92X+/uq3xLAzt7VzHL9NCNlAjDzMi
CK6H+9+Uv669KZqw1PG+DhPFNCyCJYx9rPTaR1xZ8T1M2pakLXl15CwSJMIvNWd3
4hdhDYtCIcrlu23UkjwKZFOIxyMzijobk9FLRBRQoxkL8MXtqqPGlWlAF2Gw4nwi
k1rcuUPgm/RCtnLa03zGehmKgiJpsGOSevI+ahEPeHSeSaPGbaxgLOXKO0D2PWA3
80QpD6NO6NiU5VuM/BYomu29sZYWVEQxR1F2LIR4JB3nm2a77nh/eNo7TMlk1WSn
NNL00bUomOFZXHk+D39puub7N443xeLpEg9PqWtia/nxhyFLrbM=
=mmOw
-----END PGP SIGNATURE-----

--qp4W5+cUSnZs0RIF--
