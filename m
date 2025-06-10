Return-Path: <linux-gpio+bounces-21153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09768AD3258
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 11:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F91D1895F20
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 09:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEB628B7D4;
	Tue, 10 Jun 2025 09:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9LrnvGO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03F728B40E;
	Tue, 10 Jun 2025 09:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548434; cv=none; b=eZc3ssbW3R97jsR+xsksB2bKvv5PN6mfkVYmYIBZagrFFM4eAjqiTsmfz6IkxobtoFgk++ylsbYKgOHSFO6Heii7kuDM3CGSkydpy52LNfVOFwveK8ykST9yrcI7fGhMTEpRxjO9OEfNdELPyqEyFa+gGzq9U5mGC2W5ngXm9K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548434; c=relaxed/simple;
	bh=bc3ArTVUw4P5VtScDalALhWhOUuTjLnFF0E/aUNzDbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiMyvZogy+kV6BZmqg6iz4+CfRDnmJ+X7X7pSHBrG4K7/2UXN8QspikJtKAH/dj6hSEW2YWUZrIUQwFL91X1CgtOWUKhKiLtxpU0MwC4Yop7QZUm+LnR4GAeemKnM4TzH/vXpMrSZwyxwMKIIuSwq7G1gbe+BtvPthgGPOFPAto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9LrnvGO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-453066fad06so17512245e9.2;
        Tue, 10 Jun 2025 02:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548431; x=1750153231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j3V5HrYJtU5hIgsrllrDB6dJf8rX+Q/4NXndWlhVdio=;
        b=W9LrnvGO8u+taNjV+sgvQbfL4fsfw+8qG2ommwvv6E6VHxvlA7tHciSFBdvY3OgH4b
         JjPtrqzLKq//twtv7A4eTKeJeKL0VdgN3adFR9U2059pDDTZmkBee6JkZrkbt9/+T5yI
         T2vKLVTIU7zbOT529M3C5iKrBXCbEGeOLCHzwpsYx4kixAPbLstA06VKkPIPDnITaTs8
         eVXpbv8tiKWggsFSVBych6kWyhbC/y3A+vZgiJLOgaN8NnjkfvA0bkODSFr865y/F9vu
         506p1OzafOxEZx6kuOBmSE6BeYbgHKMCRYx9flm4TLwI6RIUJOtdz/uZe6K9wnAPDJkE
         7vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548431; x=1750153231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3V5HrYJtU5hIgsrllrDB6dJf8rX+Q/4NXndWlhVdio=;
        b=rgxtJDwJHZFBd90CH+GTGPW6qxB1drxqRgz9hZUVEZG61GsLIqdtCIFcIjdmlemyu2
         4WDSVpS0gSN/dB4iEaMxFyVxqWy/ZuKVvk1SKaKr6KNqTIkpxwA7OCtN+AXo45B/2hqO
         GrG4BVWTXR1Hb4J1UlpzeZLdrk+LAjfSzJAZazppFhdtmN9V4xe9icX6GRLLaC5OLWIl
         cR5tQ+7+Pvmdaza8vsy+OAOxsAnCa3NCyUyOcETXQanY/yG6tEOob9bfs4jWlOIdwI+4
         bNbkxCoYOY826Lt2+otY4Sjh9QhlZQ7BP9IVAJEtXVm5rvxd7ljLUiKYRIxNcXuXC73t
         HDGg==
X-Forwarded-Encrypted: i=1; AJvYcCVFeAJxW48GcJ4ADC+1LIjYUAz4qzljQGyfhZbeZNXqCS0IaHA9AgwSX7ui8Qyrl6Fw8r/X7/3Z68XLa+4=@vger.kernel.org, AJvYcCWbnLSmeTgeBhM6s0OiqeeBvwPaN125u2J2/kwEbpejnfE9YD1EBl4W7eOZbiODPiqMFw41yzLr6Yc/5QJS@vger.kernel.org, AJvYcCWdtoddQDzc79qbG5WvU7y4P6nNDTpDjlIwbT0WDc6Aop6rIsd0stIRIzfFcWP8AN/Qi1LymtFMEP56YQ==@vger.kernel.org, AJvYcCXr4gvBLERCoqqyWAdRJr1lOZUtvTxxayOwUMzf0jONn7ZwOobvzIo5VCOJCxXPQcrqNGnNfEO46lZ+@vger.kernel.org
X-Gm-Message-State: AOJu0YyAlhC1QjRds6AtyZv4201SwDsxdfNH08a/c8cyz4sZBhBg2R5H
	Ro7ZbX5I8NelAzBjmb1VUH4h5u1fwFdlsQsBAorq1pNurEOMbRwpCpXj
X-Gm-Gg: ASbGnct8wy39N3tgpy4LmQL/+O17Jc3FtQMIHukTrfvSR6XwBDCTY4PRhyBej0m6N+Y
	nj9GlNUQiF5ULiict+mMjEUacqoK7A79ySDJLUohbHnEbjd6vHTFB6i1F4cOQRISTM5g+KFaiGN
	QIXcbPRxymstVJ6MMXiKvtTIP8vnMcbX7eqp3g/Qr08quRBspetV0ycf9cINfRQtXWrj8mRAMgl
	fHt4skI2F2vHKnJu507eHHF737o7u4u4HRwQc+YfHlUk2vBkqFNgDRTxie3ZYXukV9r7BlCT4lt
	f3XkW0ysYKO/L1yLwNHakG1YEhLUCkhQRSa+1J2HyALpxDEJdWySx+4PaMgO8fBaHqw5l659b/L
	8g684sIRWsR/QTwRr1iFrzt17YzzYw5lM1Ia2FEdmLKbsgPfZ
X-Google-Smtp-Source: AGHT+IHhEUfYh/4N1lGaiXcMB3u3JRzvlrUtVSKhzNzblyDKGclQtPc9Ir85S4ccQrzyJpoLCLb4Nw==
X-Received: by 2002:a05:600c:4751:b0:453:c39:d0d0 with SMTP id 5b1f17b1804b1-4530c39d65fmr77488045e9.13.1749548430901;
        Tue, 10 Jun 2025 02:40:30 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532063ebf6sm4571485e9.3.2025.06.10.02.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:40:29 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:40:27 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
Message-ID: <yw2uglyxxx22d3lwyezy34wdniouu32zppfgwqs5omny3ge5zd@iuqo4qmi55a2>
References: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
 <20250608-tegra186-pinctrl-v2-2-502d41f3eedd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="koz7pqhubwkgry26"
Content-Disposition: inline
In-Reply-To: <20250608-tegra186-pinctrl-v2-2-502d41f3eedd@gmail.com>


--koz7pqhubwkgry26
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
MIME-Version: 1.0

On Sun, Jun 08, 2025 at 09:13:14PM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> This is based on Nvidia's downstream 5.10 driver, rewritten to match the
> mainline Tegra194 pinmux driver.

A few words upfront, to justify why I'm being pedantic. Originally the
pinmux drivers were generated using the tegra-pinmux-scripts[0]. This
project was later archived because Tegra210 was deemed to be the last
chip to need a pin controller. It then turned out that Tegra194 needed
pinmuxing for certain pins, and then more, so we ended up with a full
pinmux driver for it. However, we also deemed Tegra194 to be an
exception, so that's why that pinctrl driver was a one-off job.

I now regret these decisions because the same formatting mistakes are
now proliferating, which is exactly what the scripts were meant to
avoid.

One thing that's not clear from this patch set is whether we actually
need the Tegra186 pinmux driver, or you're only adding it because it
happens to be present in a 5.10 downstream driver. Do you actually have
a requirement for setting pins dynamically at runtime? Do you need to be
able to set a static configuration at boot that can't be set using some
earlier bootloader/firmware mechanism?

If we really need this pinctrl driver it may be worth resurrecting the
tegra-pinmux-scripts so that we can add these drivers based on the
generated files as originally intended.

As announced, there's a few pedantic nitpicks down below.

[0]: https://github.com/NVIDIA/tegra-pinmux-scripts

[...]
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra186.c b/drivers/pinctrl/t=
egra/pinctrl-tegra186.c
[...]
> +static const unsigned int pex_l0_rst_n_pa0_pins[] =3D {
> +	TEGRA_PIN_PEX_L0_RST_N_PA0,
> +};
> +static const unsigned int pex_l0_clkreq_n_pa1_pins[] =3D {
> +	TEGRA_PIN_PEX_L0_CLKREQ_N_PA1,
> +};

Typically there'd be a blank line to separate each of these structures.
Or maybe we can come up with some notation to make these single lines?

> +static const unsigned int sdmmc4_clk_pins[] =3D {};
> +
> +static const unsigned int sdmmc4_cmd_pins[] =3D {};
> +
> +static const unsigned int sdmmc4_dqs_pins[] =3D {};
> +
> +static const unsigned int sdmmc4_dat7_pins[] =3D {};
> +
> +static const unsigned int sdmmc4_dat6_pins[] =3D {};
> +
> +static const unsigned int sdmmc4_dat5_pins[] =3D {};
> +
> +static const unsigned int sdmmc4_dat4_pins[] =3D {};
> +
> +static const unsigned int sdmmc4_dat3_pins[] =3D {};
> +
> +static const unsigned int sdmmc4_dat2_pins[] =3D {};
> +
> +static const unsigned int sdmmc4_dat1_pins[] =3D {};
> +
> +static const unsigned int sdmmc4_dat0_pins[] =3D {};

These look out of place. Ideally these would simply be NULL and 0 in the
respective PINGROUP definitions, but not sure if that's something that
can be done with the preprocessor. Are these guaranteed not to take up
any space in the generated binary?

[...]
> +#define PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_io_hv, e_lpbk, e_input,	\
> +			     e_lpdr, e_pbias_buf, gpio_sfio_sel, \
> +			     e_od, schmitt_b, drvtype, epreemp,	\
> +			     io_reset, rfu_in)			\

It looks like there's an alignment issue in this macro.

> +#define PINGROUP(pg_name, f0, f1, f2, f3, r, bank, pupd, e_io_hv, e_lpbk=
, e_input, e_lpdr, e_pbias_buf, \
> +			gpio_sfio_sel, e_od, schmitt_b, drvtype, epreemp, io_reset, rfu_in)		\
> +	{							\
> +		.name =3D #pg_name,				\
> +		.pins =3D pg_name##_pins,				\
> +		.npins =3D ARRAY_SIZE(pg_name##_pins),		\
> +			.funcs =3D {				\
> +				TEGRA_MUX_##f0,			\
> +				TEGRA_MUX_##f1,			\
> +				TEGRA_MUX_##f2,			\
> +				TEGRA_MUX_##f3,			\
> +			},					\

This .funcs substructure seems to be indented wrongly. I see that that's
also the case for Tegra194, but it's correct on Tegra210, so it looks
like you copied from the wrong source. =3D)

Thierry

--koz7pqhubwkgry26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH/YgACgkQ3SOs138+
s6E3vQ/7BbhIeEooFiDj0/uIixGcizRegwHcKrtrqsFTfHYcdG1Eeoo3b1lDjtXG
yon6OYCL0C3HodxYmACCb0Pbpif3QV34wDDIe6N2380WIJmTYIWNLF6DFsioY06A
aA1kvwU9gH24w7SoviwfWcNp5SzcYUegUF6n6G6bjGoVNbgmig9P0ZxsmaQNRUT9
SN/rlqUmgE8djmIZPZzzVYWFJbbXkZd8bHf5F8SBSTf/C0L+iqar02z4cI+auW9A
6KDR/qdpKvKywQs30fTNcYnD7eRpIiSxvxR4yt6Mi9v2Ax1z4XuUpvbTPT5urO52
PB2LcrxhXd6IyC3fJ/ltjiRoQ21nUsiwUBBkT7a28Gn1LHrmy3naNwLFIrcAlwlL
g0Bo/NXYag2VqjJ44mXYZUCHE4DoQXhSWJdAX8iKyc2IgWP1GghCkMNDrPqJy54E
p2dgUEIVfq8nhci3m0VmL3Fq0g+4h0NLmbxTb5syQwwo1DMTPSZEhSM8WC2MpCH1
yuJb6uPGv+f0Ic+dvt6D49XQI7Oscy89rVwTOlLckwO53VgODdn4mW18uVNNB50Q
CEiYXvV2YPTgyX5k93E4v+6mrFMmN14uqW3NnQiirOSrnoD5tLVy7u2Q27gClq6b
W89SGKPYxvUCnhRj+QXmOnzvW202qnSQshoTlrNsnRspZrS3uaU=
=k3CP
-----END PGP SIGNATURE-----

--koz7pqhubwkgry26--

