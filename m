Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2955C2DEE4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 15:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbfE2NwL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 09:52:11 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40331 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfE2NwL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 09:52:11 -0400
Received: by mail-wr1-f66.google.com with SMTP id t4so1854843wrx.7;
        Wed, 29 May 2019 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RzNbr+rvjVdKwJ2zLeewdxXC9e98E6i+o7Np7MkUHgA=;
        b=SJcopnJPjQmBRgDIX9ahvgLuKq3zJFlyoV1QzalXPN0KaNjlCMtWE7SvriX64SiYO5
         dIFBK242KAT/ZXkCQiwxkGHj8aN3y9J8k3X2n54pt3ftu25Gbur8a2JUefNzK885fL13
         GQCc6y+gGIuYQNDK5UPSZRrztEFlNk468foFo8RC7lVUWTX3L6bHtjsU1gdkuBAiCeU9
         1MS3zv7272236m38iRHrZv27CvkPT6iv4WvpXgMq5kyqYsrdBMiPqOWXig14XXwcGPKU
         Je6qszQZgVvpXHo7N8jOEsPnOShCeTLxf005EZ9bhw2kXbs+87wMm76tk7hi9r6LWd1C
         cwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RzNbr+rvjVdKwJ2zLeewdxXC9e98E6i+o7Np7MkUHgA=;
        b=Mf5DaXlPbbxtnRaSKIoepssGFbfyRvw0LtMXAYZApm3vmYZb8HgVtgo0bItj462h3z
         Ck9SrDWAT4pYvK5fYHW0oMyXWIfeJEn/Tt0Z6eKvzVY1d0O9fxP9kV+ANYCGFZrzZyDn
         elf19TpKlGXX7GoMvFpcKpYUWXPd45PRBG+7RzKR7+fTFgwlfzjEjPiVmfAdodW2o7tM
         Jl6QXBrCC7+MRXJv9yS74XY3+4tGa+OupmdT0SQ0BT3ZKJwA5Jdd+uoNgel912vlkRte
         dknzkqLUFDOcfXB/mjD5TrVOokC8tr0inbJpphCxORVbJdrc6An2jvfZOxcUZR7gUsYJ
         qbJA==
X-Gm-Message-State: APjAAAVnTvsK+h6S4HJLoDsX2ngMk/fbKnpuha8bgDUdsMLeIzH1jT9z
        mZCv5R9MQnWFue9F/Kxr8K0=
X-Google-Smtp-Source: APXvYqwz1D070gdCi35Mtsv432bNl6e4KQkE7FUC/QIcUDyIb+aXMysH1+LO780wo33pgpimSphDhw==
X-Received: by 2002:a5d:488a:: with SMTP id g10mr18257400wrq.344.1559137927096;
        Wed, 29 May 2019 06:52:07 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id w23sm4743720wmc.38.2019.05.29.06.52.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 29 May 2019 06:52:06 -0700 (PDT)
Date:   Wed, 29 May 2019 15:52:05 +0200
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
Subject: Re: [PATCH V2 09/12] soc/tegra: pmc: add pmc wake support for
 tegra210
Message-ID: <20190529135205.GA17679@ulmo>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-10-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <1559084936-4610-10-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 04:08:53PM -0700, Sowjanya Komatineni wrote:
> This patch implements PMC wakeup sequence for Tegra210 and defines
> common used wake events of RTC alarm and power key.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 113 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 113 insertions(+)
>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 974b4c9f6ada..54dc8409e353 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -57,6 +57,7 @@
>  #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
>  #include <dt-bindings/gpio/tegra186-gpio.h>
>  #include <dt-bindings/gpio/tegra194-gpio.h>
> +#include <dt-bindings/gpio/tegra-gpio.h>
> =20
>  #define PMC_CNTRL			0x0
>  #define  PMC_CNTRL_INTR_POLARITY	BIT(17) /* inverts INTR polarity */
> @@ -66,6 +67,12 @@
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
> @@ -96,6 +103,11 @@
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
> @@ -245,6 +257,7 @@ struct tegra_pmc_soc {
> =20
>  	const struct tegra_wake_event *wake_events;
>  	unsigned int num_wake_events;
> +	unsigned int max_supported_wake_events;

Do we really need this? It's only used in Tegra210 specific code and
it's always 64 on Tegra210. Can't we always hard-code it?

>  };
> =20
>  static const char * const tegra186_reset_sources[] =3D {
> @@ -1917,6 +1930,54 @@ static const struct irq_domain_ops tegra_pmc_irq_d=
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
> +	usleep_range(110, 120);
> +
> +	value &=3D ~PMC_CNTRL_LATCH_WAKEUPS;
> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
> +	usleep_range(110, 120);
> +
> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
> +	if (pmc->soc->max_supported_wake_events > 32)
> +		tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
> +
> +	tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
> +	if (pmc->soc->max_supported_wake_events > 32)
> +		tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
> +
> +	/* enable PMC wake */
> +	if (data->hwirq >=3D 32)
> +		offset =3D PMC_WAKE2_MASK;
> +	else
> +		offset =3D PMC_WAKE_MASK;
> +	value =3D tegra_pmc_readl(pmc, offset);

Blank line before and after the "value =3D ..." line, for readability.

> +	if (on)
> +		value |=3D 1 << bit;
> +	else
> +		value &=3D ~(1 << bit);
> +	tegra_pmc_writel(pmc, value, offset);

Same here, leave a blank line before the tegra_pmc_writel(...) call to
improve readability.

> +
> +	return 0;
> +}
> +
>  static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int=
 on)
>  {
>  	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
> @@ -1948,6 +2009,48 @@ static int tegra186_pmc_irq_set_wake(struct irq_da=
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
> +	value =3D tegra_pmc_readl(pmc, offset);

Same comment as above.

Otherwise, looking good, thanks.

Thierry

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
> @@ -2535,6 +2638,11 @@ static const struct pinctrl_pin_desc tegra210_pin_=
descs[] =3D {
>  	TEGRA210_IO_PAD_TABLE(TEGRA_IO_PIN_DESC)
>  };
> =20
> +static const struct tegra_wake_event tegra210_wake_events[] =3D {
> +	TEGRA_WAKE_GPIO("power", 24, 0, 189),
> +	TEGRA_WAKE_IRQ("rtc", 16, 2),
> +};
> +
>  static const struct tegra_pmc_soc tegra210_pmc_soc =3D {
>  	.num_powergates =3D ARRAY_SIZE(tegra210_powergates),
>  	.powergates =3D tegra210_powergates,
> @@ -2552,10 +2660,15 @@ static const struct tegra_pmc_soc tegra210_pmc_so=
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
> +	.max_supported_wake_events =3D 64,
>  };
> =20
>  #define TEGRA186_IO_PAD_TABLE(_pad)					     \
> --=20
> 2.7.4
>=20

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzujoUACgkQ3SOs138+
s6ERYA/9EmA5sQpVE+KkUtS+6+gtw5ZdfjrcZU88794wu43vFH3L4qpVQ+ee1ycZ
silqzFRA/+s7LinbU8nkKYBkSQT/Fi3kfsxh7XcsEIN97Hp/sG6FJ6fPJ1XGvUMP
xzsbpHWADAKYpfVBMQqG41BX20AeP8QGuBPNfQBvEfjvda7kUck+p9hqei8r7Hbl
9kiVsMTOQMFODuD0zFg6vTyzXJAmDrsg4Xm+v962nN1wTRvhiJXR7dXAOwjnFTJG
UP9BXACICrtLUqhG98s8hFe0M99GEA84+mVg2XIO35jFIUwKsUBBef/SNet16NKL
6XOD9XYJd+iLFI8uZiG/6XXl5f8orfDOSuZ5uovrMPpQOBQW2CSloFysV6U0BnNu
CD3uupaayuvrp0dLhtqBJHZCm0so3aBJMNyGCwpJsaL3v40nPAXonBvIAofk7Svj
Hidwwj81VmcXHj/1peKEJWEgLLNVReGvtVm7P28g6ffBI3B279wP64M2i0bUYUoh
XCMaKRDFVk2bjrNoUkpbjQYPpG9aFwwmuOA/jIjXz5wPX8Qr9HDeW5qOxZUNcwMC
yxZgDDF0i4K1I49WzAGb+z+rrET1OuwIZSeXVtLbNYqFKJ8vMBAbUEO7N1y0f+xQ
c1t2CQHoxPdQ7GPVMJjqTIg43rqkIh6whGJ8SnKWxVKEUleA/Ig=
=Gn7+
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
