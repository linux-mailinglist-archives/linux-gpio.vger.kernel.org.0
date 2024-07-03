Return-Path: <linux-gpio+bounces-8024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC93D926A27
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 23:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A3211F22B6A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 21:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25BE191F90;
	Wed,  3 Jul 2024 21:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nXfomUYn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABF3191F6C
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 21:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720041808; cv=none; b=DfAWLQtlmB1volgzDkHDw+sr2ptdpnqrGFJt7rogP9pIepohWl8HcYejQUYJLJ3uJgV4T17LBRzp/wvrFl3jH/zOcbpCnEeqysCg0b0hraQ2Xf3VOMoMaFAXAxi8z+i8ripyxd2pMztmfy8JjNkwOA6zhsjCKfo31//kF9u0O8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720041808; c=relaxed/simple;
	bh=1yCUJShNVEleKhhq5ttC7d+C2KlI7KvONMEvrwhI5X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Siq8mOAljeb2pVCBevrvw36FmvU9mAJpz8qHdzURwS4Pp/exUBLOt3k20+ina5nSOOn64tf5zVwNMnwyqOY4bf87vk87QajWhPImthjrv4N0tKkUzgkAyUUUe1BO1DKMu67X3EkKc/OoXuvWU7haUlZB7SBiWD6fieG5NTPqwEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nXfomUYn; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-58b3fee65d8so3453065a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2024 14:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720041805; x=1720646605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rmKjZalCS3qgqBNUJ2X1ny0z1S/+Ouz6++2zspqi0Zc=;
        b=nXfomUYnbzj9LIVMPNRYyGPrGSgzQo3TYNnoG9X6sbtMdvka2gkBTWeWFH82v3YY6y
         FpKutlnlUYALdpJAw5zXMSlyPvSu9EOBXKZO6nM48K2lmmuMVaihjB2V4N8NIAeLICoA
         8Uu26Fln/UY28RYLPeehl3Nqzi8hopZLB4IgW8EaEqF9COvqp8YTsl4SWDtCjS2PFUzL
         tygWBTwykzO88IpSKXeemkGeoic+DrezgiZcsHKtkACDRstfeu+ctDVlME2MjqdFZz+x
         j8jWMtVy55HHvUxAKVW7SN1SWTLn/M5rn5xatBJuTs1sdL2Mq/8rTtvNj3n3KPEq2RrC
         6LzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720041805; x=1720646605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmKjZalCS3qgqBNUJ2X1ny0z1S/+Ouz6++2zspqi0Zc=;
        b=WL5T0dlhdmJ4UEpgrQA1sjDwCbjqiBstDgJ6WPCvtzjo1BjaRygBRtb90QyjCsoLzc
         VdGQAUdfgXvOjD/uRi1DNvfJN6+Lq+pMiFo2yEw4fe2duYX+Do818LCbKFbOrdfWjWVY
         RlMgPNfhsXur1Zek4bcMJKQgElXx98X0U/SMc0s6nSH0+kACyvIMCEKa+IFOW9gw0sbe
         Pe8eAOPyKCnidretgt0OG53H5iV4fGlHqo2DzTwx0eleMFM9wqvlvgIP0FzbbDdMdKs6
         FjHVR6Wa3pdHkIcnOKeT9PqwaW/028X8lu1Sv7Tkv/UfIfivUi8K23oCTULM5C/Mw3K3
         TH7A==
X-Forwarded-Encrypted: i=1; AJvYcCWs4ABbgRAgPCkpN6YgsHWdElL06xyoJwKSYLlmNppJWTMJ1ZNKx54ObFPf4ancV9TdFG4nqLNoiEfmgro9YuYPtBFHDrV7B+VLNg==
X-Gm-Message-State: AOJu0YxQGtIuV1vYu2PobCvVehmnciqvazMesSGy81r/HCLbl6iKfAYK
	UmoTW75qvUZh1c5iIpuPlOs1UNgh9IkhVVPJMRMF+tdv2Oa2BQsDP7H+03/skG4=
X-Google-Smtp-Source: AGHT+IEiDeirJZbiRR9WOgvKVRp5lPoOHJBTmQD67pQvhrzI/8nB0fQNgTn38F10sD2qUfAawYddVg==
X-Received: by 2002:a17:907:1c15:b0:a72:883f:f3dd with SMTP id a640c23a62f3a-a75144a8a02mr1042146966b.56.1720041804879;
        Wed, 03 Jul 2024 14:23:24 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:5696:f293:6e5e:98bf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab0651c0sm541105666b.123.2024.07.03.14.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:23:24 -0700 (PDT)
Date: Wed, 3 Jul 2024 23:23:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Bjorn Andersson <andersson@kernel.org>, 
	Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Richard Leitner <richard.leitner@linux.dev>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Damien Le Moal <dlemoal@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	llvm@lists.linux.dev, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 13/20] pwm: samsung: convert to
 of_property_for_each_u32_new()
Message-ID: <l2xret6kx4qwee3c3abmmhz5uop7zuobxath2eou2utklztkgl@c7lskt3xk3wj>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
 <20240703-of_property_for_each_u32-v1-13-42c1fc0b82aa@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3uu6b6ybcnfri4lk"
Content-Disposition: inline
In-Reply-To: <20240703-of_property_for_each_u32-v1-13-42c1fc0b82aa@bootlin.com>


--3uu6b6ybcnfri4lk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jul 03, 2024 at 12:36:57PM +0200, Luca Ceresoli wrote:
> Simplify code using of_property_for_each_u32_new() as the two additional
> parameters in of_property_for_each_u32() are not used here.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/pwm/pwm-samsung.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
> index efb60c9f0cb3..fef02a0b023e 100644
> --- a/drivers/pwm/pwm-samsung.c
> +++ b/drivers/pwm/pwm-samsung.c
> @@ -510,8 +510,6 @@ static int pwm_samsung_parse_dt(struct pwm_chip *chip)
>  	struct samsung_pwm_chip *our_chip =3D to_samsung_pwm_chip(chip);
>  	struct device_node *np =3D pwmchip_parent(chip)->of_node;
>  	const struct of_device_id *match;
> -	struct property *prop;
> -	const __be32 *cur;
>  	u32 val;
> =20
>  	match =3D of_match_node(samsung_pwm_matches, np);
> @@ -520,7 +518,7 @@ static int pwm_samsung_parse_dt(struct pwm_chip *chip)
> =20
>  	memcpy(&our_chip->variant, match->data, sizeof(our_chip->variant));
> =20
> -	of_property_for_each_u32(np, "samsung,pwm-outputs", prop, cur, val) {
> +	of_property_for_each_u32_new(np, "samsung,pwm-outputs", val) {
>  		if (val >=3D SAMSUNG_PWM_NUM) {
>  			dev_err(pwmchip_parent(chip),
>  				"%s: invalid channel index in samsung,pwm-outputs property\n",
>=20

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Feel free to merge this together with the change from the first patch.

Best regards
Uwe

--3uu6b6ybcnfri4lk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaFwUcACgkQj4D7WH0S
/k6PuggAu8WCVFGH6QIMKU3X2rf+i2w61Hm9yGoz/E1JXjYYwhvN07D9QQrg3lFk
uuvOlwgkdfuIHAsZupm4B503z6Cr+9e1c0yd2UsXZkR+Y5e5uAcWpFrqQPpsUjg6
K4y5iO46KFiNdoyIw5vaEqa9r+2MGaV/6utEBzK71uNVzWWnYAxGJSrp9BXXUlRN
ZUz4u7b3Yp+kmsIoFWF2SYjPB08bXS+XlNegSLFuhFLAklD1WtMgdfiyFyqVm20f
wxAtUX4pOe9E7HV+9qcyWKkbxhOVOOD6iG1CnatgtZoAeRfvmcNx+o2M4x8H0qXK
hetCnR7IsLL80SX5lvKiYYw2At4OEA==
=UQNH
-----END PGP SIGNATURE-----

--3uu6b6ybcnfri4lk--

