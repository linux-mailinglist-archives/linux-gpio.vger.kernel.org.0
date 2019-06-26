Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32DFA566A9
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 12:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfFZK0V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 06:26:21 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54130 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbfFZK0V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 06:26:21 -0400
Received: by mail-wm1-f66.google.com with SMTP id x15so1512844wmj.3;
        Wed, 26 Jun 2019 03:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jjlDedewbbb4QFgjVMbwEY9DMCkO0DmsnJjGx2ag8uU=;
        b=DZFlEf71ZmXv9fzl+n6jtEVgrr5Sx1gDlU9q35QRILvDEY7awC6wEsv04nol/YwOCi
         QRLVGBi+4qFDtrbo730fvmIjBep5p3mmklh0UQ5v6BhmqjLFupqN516Ma1xfJt01uN+C
         3B0lpDTlxekbXbLl3P5IAeNGlXt2YUFTLs7RhGeY9Z+lXGjgeTP1fh4SFfic7lU0wJHh
         uSvIBA2fJCR8Tb87TbnzuXnoQkkeX0CmZ5r0t06jcrIXQ1AhXfhscqmfSBD0k2vkqvqJ
         OqtMsU7T4BHupRoNE35UPYyIpxjmiWSdtE14GlmmQfOxUTM5MA+8mvDm3eqAdrrxpP5T
         mFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jjlDedewbbb4QFgjVMbwEY9DMCkO0DmsnJjGx2ag8uU=;
        b=OeNxvJMtl98dzqSNLWceZ7YoU8J9yH196qdOhjEJo6WjJs77STH2lgipLPz7iRjHHC
         ynZE3KLZrdvsyxjS/vdNyUZ2a3xL5Y4bHLuP9qsahq2TT2MEYtzQ3Vsjuq8onmyMnX8q
         GyGcdKfCAUjy1Cxfiw2Nuw8EOhSUm82sywXDV5/mQ46I6oiBxdnIqsL+/AmcSBLUnMvP
         ePk+44+kj6/tMKTR5iznbW5HxCUutKp6AtQXpZEWOeH/dxRrVIuZkAt+m12t8GVAEsNR
         PDyA3itrA7JafQOp3KmF5X+J0X+6z0WZNOzd1e1usjLnVS0EPgSX200yZ/b3QiwmGCKn
         413A==
X-Gm-Message-State: APjAAAVXIDn0iG3sFtKXcUoDQf46c5MoXYNSl1dKKm0nsiRdfMtEl0Er
        vY5R+u0zu5+4mvvs6gWqfAA=
X-Google-Smtp-Source: APXvYqxTkHOgbP+cN0MsGzYALeyxOLfpvNdPO+zhNzfGaBbnkqGSoEinHwp47A0RLOvtcSoARgHPsg==
X-Received: by 2002:a1c:2d58:: with SMTP id t85mr2030294wmt.61.1561544777169;
        Wed, 26 Jun 2019 03:26:17 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id 11sm2008240wmb.26.2019.06.26.03.26.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 03:26:16 -0700 (PDT)
Date:   Wed, 26 Jun 2019 12:26:14 +0200
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
Subject: Re: [PATCH V4 14/18] soc/tegra: pmc: add pmc wake support for
 tegra210
Message-ID: <20190626102614.GF6362@ulmo>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-15-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gneEPciiIl/aKvOT"
Content-Disposition: inline
In-Reply-To: <1561345379-2429-15-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--gneEPciiIl/aKvOT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:02:55PM -0700, Sowjanya Komatineni wrote:
> This patch implements PMC wakeup sequence for Tegra210 and defines
> common used RTC alarm wake event.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 111 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 111 insertions(+)

One general note, and it's a really pedantic one, which means that this
patch is plenty good already: sstart the commit subject with a capital
letter after the prefix, and watch the capitalization of the rest of the
line:

	soc/tegra: pmc: Add PMC wake support for Tegra210

I will usually fix up these trivialities when applying, but you can save
me a couple of seconds per patch by doing this right to begin with. =3D)

Thanks again for the great work on this series!

Thierry

>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index e87f29a35fcf..603fc3bd73f5 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -57,6 +57,12 @@
>  #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
>  #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
>  #define  PMC_CNTRL_MAIN_RST		BIT(4)
> +#define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
> +
> +#define PMC_WAKE_MASK			0x0c
> +#define PMC_WAKE_LEVEL			0x10
> +#define PMC_WAKE_STATUS			0x14
> +#define PMC_SW_WAKE_STATUS		0x18
> =20
>  #define DPD_SAMPLE			0x020
>  #define  DPD_SAMPLE_ENABLE		BIT(0)
> @@ -87,6 +93,11 @@
> =20
>  #define PMC_SCRATCH41			0x140
> =20
> +#define PMC_WAKE2_MASK			0x160
> +#define PMC_WAKE2_LEVEL			0x164
> +#define PMC_WAKE2_STATUS		0x168
> +#define PMC_SW_WAKE2_STATUS		0x16c
> +
>  #define PMC_SENSOR_CTRL			0x1b0
>  #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>  #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
> @@ -1921,6 +1932,55 @@ static const struct irq_domain_ops tegra_pmc_irq_d=
omain_ops =3D {
>  	.alloc =3D tegra_pmc_irq_alloc,
>  };
> =20
> +static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int=
 on)
> +{
> +	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
> +	unsigned int offset, bit;
> +	u32 value;
> +
> +	if (data->hwirq =3D=3D ULONG_MAX)
> +		return 0;
> +
> +	offset =3D data->hwirq / 32;
> +	bit =3D data->hwirq % 32;
> +
> +	/*
> +	 * latch wakeups to SW_WAKE_STATUS register to capture events
> +	 * that would not make it into wakeup event register during LP0 exit.
> +	 */
> +	value =3D tegra_pmc_readl(pmc, PMC_CNTRL);
> +	value |=3D PMC_CNTRL_LATCH_WAKEUPS;
> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
> +	udelay(120);
> +
> +	value &=3D ~PMC_CNTRL_LATCH_WAKEUPS;
> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
> +	udelay(120);
> +
> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
> +
> +	tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
> +	tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
> +
> +	/* enable PMC wake */
> +	if (data->hwirq >=3D 32)
> +		offset =3D PMC_WAKE2_MASK;
> +	else
> +		offset =3D PMC_WAKE_MASK;
> +
> +	value =3D tegra_pmc_readl(pmc, offset);
> +
> +	if (on)
> +		value |=3D 1 << bit;
> +	else
> +		value &=3D ~(1 << bit);
> +
> +	tegra_pmc_writel(pmc, value, offset);
> +
> +	return 0;
> +}
> +
>  static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int=
 on)
>  {
>  	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
> @@ -1953,6 +2013,49 @@ static int tegra186_pmc_irq_set_wake(struct irq_da=
ta *data, unsigned int on)
>  	return 0;
>  }
> =20
> +static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigned int=
 type)
> +{
> +	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
> +	unsigned int offset, bit;
> +	u32 value;
> +
> +	if (data->hwirq =3D=3D ULONG_MAX)
> +		return 0;
> +
> +	offset =3D data->hwirq / 32;
> +	bit =3D data->hwirq % 32;
> +
> +	if (data->hwirq >=3D 32)
> +		offset =3D PMC_WAKE2_LEVEL;
> +	else
> +		offset =3D PMC_WAKE_LEVEL;
> +
> +	value =3D tegra_pmc_readl(pmc, offset);
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		value |=3D 1 << bit;
> +		break;
> +
> +	case IRQ_TYPE_EDGE_FALLING:
> +	case IRQ_TYPE_LEVEL_LOW:
> +		value &=3D ~(1 << bit);
> +		break;
> +
> +	case IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING:
> +		value ^=3D 1 << bit;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	tegra_pmc_writel(pmc, value, offset);
> +
> +	return 0;
> +}
> +
>  static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int=
 type)
>  {
>  	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
> @@ -2541,6 +2644,10 @@ static const struct pinctrl_pin_desc tegra210_pin_=
descs[] =3D {
>  	TEGRA210_IO_PAD_TABLE(TEGRA_IO_PIN_DESC)
>  };
> =20
> +static const struct tegra_wake_event tegra210_wake_events[] =3D {
> +	TEGRA_WAKE_IRQ("rtc", 16, 2),
> +};
> +
>  static const struct tegra_pmc_soc tegra210_pmc_soc =3D {
>  	.num_powergates =3D ARRAY_SIZE(tegra210_powergates),
>  	.powergates =3D tegra210_powergates,
> @@ -2558,10 +2665,14 @@ static const struct tegra_pmc_soc tegra210_pmc_so=
c =3D {
>  	.regs =3D &tegra20_pmc_regs,
>  	.init =3D tegra20_pmc_init,
>  	.setup_irq_polarity =3D tegra20_pmc_setup_irq_polarity,
> +	.irq_set_wake =3D tegra210_pmc_irq_set_wake,
> +	.irq_set_type =3D tegra210_pmc_irq_set_type,
>  	.reset_sources =3D tegra210_reset_sources,
>  	.num_reset_sources =3D ARRAY_SIZE(tegra210_reset_sources),
>  	.reset_levels =3D NULL,
>  	.num_reset_levels =3D 0,
> +	.num_wake_events =3D ARRAY_SIZE(tegra210_wake_events),
> +	.wake_events =3D tegra210_wake_events,
>  };
> =20
>  #define TEGRA186_IO_PAD_TABLE(_pad)					     \
> --=20
> 2.7.4
>=20

--gneEPciiIl/aKvOT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0TSEYACgkQ3SOs138+
s6HZ4xAAgC7mXBPI59pCugC75153eT3nzSK1EjF5CInw2Nijp9WVX4z38W5P0RRj
onDVhA2scyEHRXzHXxbs2tgCF9toVyGdfpNkx3k7D5jQKSZXg/1c10C7N7fBE0MY
8reUxbr0g30YMfHQQXgtuQiUxM5fGT7OxExqqjYctspqN7nJes7yT+FKS6nqF98O
WvqanqoFz4rDOOgA5aVW6MuM7qEM51AQzt6Tl3I+vt08SfxnMV0qvVRekGgXbdNh
WipV7ToWOlPWQcdQuWBD7FY4sQz2hE+6skz2HZn4W6LPa9xtJQyB7T8dCPRFRyKC
98NoHA2JJA2VCq29FRQizwvh9uCkP75TNbrOOv0xEFtnzXG7qsRaBNBLlTAVQ3Q0
HZtaB454+NydctHpNA7eN4lUpu4L37es88rG7Tbgr+Yy0PSLNDBG3/HsJl+3lEuh
FNZ3UM4tZLVfGTTC5yWLHXPF7If1F6Y0AVPEzIa/48Q6w6R6PwcNbtrF5XBCMz+F
tWXCqZWkbbZPGWjoUh5KbE868LKqujt8USs/DYdg1NQ4WgSN62FbrjLvKbKZPrhl
jRScCjXv2Cx9o7OwNuAbX/I4gs+DLlcCVWnf7EMVuEofPSt5h4JXR03kPHM/yqwA
F33+pr4xoll8YuutSRgaY0wnwGAvCxzEfSvnyxcO6nCfD1sQUbk=
=0NaF
-----END PGP SIGNATURE-----

--gneEPciiIl/aKvOT--
