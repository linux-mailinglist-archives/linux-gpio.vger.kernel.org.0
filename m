Return-Path: <linux-gpio+bounces-13676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A3C9E98AE
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 15:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51EA92858DF
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D291B043F;
	Mon,  9 Dec 2024 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYqXzMjY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5F11B041F;
	Mon,  9 Dec 2024 14:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733754252; cv=none; b=nHOFZ/OTkOUHnZ+czlaEceqcDjOK6vHq5baIWxTS/PzoGCshS/HXs1mmGB6n+BvGS/4DOnrNJx94IR5cRynSmHhjvdBBvvQcZJoniR2K1pXX0AS/N5VKg4dRqkCWVsgm0tXNHUiMWkxg5PPSWTYkMApQS0J0fBf75ZotX6XPi08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733754252; c=relaxed/simple;
	bh=loJGK4qglNnZxmQ/mmjN5eIA+Z/el656TuQvp7Y6ios=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eG98iAYhlih6pFY86Zc7G8d2ldEVMTKNSjRqJnmL25gmdHBFQqqhytT+ajspO1n/baQfPgZWZRYBM57IoyxzpRIj+UXkr36+8f4xTDAdfiHN6TgXgnqPxIVZOthHE6FkmIxHxbs0FzeeLe+4kJooGMLVMPyQhEXmUvsEm48MbL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYqXzMjY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3862df95f92so2260527f8f.2;
        Mon, 09 Dec 2024 06:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733754248; x=1734359048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J4bmO8+d8DdGy7XEHiowe6nmsMnr1jfJx+QmO5T6lzw=;
        b=VYqXzMjY0Lf/NSxxnKHcavZ++QtZJI4jrMjCPs3PUyNf3qoJ2D39miJkkfQjC4CPLO
         buJncS4zrVIimZUOaFCOvaeMnWi5p7LOspCCrElp2+x95hiTnzdINuKwLsDdfUdqRSpY
         SGWG/031xrCkXjpjj3o15Sf6jMd/vmtFArONo/H20jS6aXGKe8Yno/0DUF0OJkl7bnc2
         3axC0tyj1jMgiJTVwDf1nHguxjpfbFDz+oodM/UcSmXhq72l/3o40/3XFldZl2oTTFSL
         W7zi62gi7ZynCtAdO+U0WygjhQXZcjBrwYiYFs2hW6+7bkBVwlEOuxoZ0tTCUGp/kL0W
         lTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754248; x=1734359048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4bmO8+d8DdGy7XEHiowe6nmsMnr1jfJx+QmO5T6lzw=;
        b=OjDne9+FH14Z1nb9PBN9EkzwZ1GXAt4YjwbrOqOSZj04T9PW7mJghz4rrJLc1ks3ec
         wFarHbiJAk7lkloVXl3KSyLkQa23BXWJye/OI6HpjfUEezg1QldwVgiv9aOaoqZPIHTB
         pHL9jHg2TYNe2bkl+UuLPPHf2kfGho4grdRfS8Ps+JYv3bD2fCVsqc08P197J/3JMblH
         Ww939Uggpq0GjAJo0DKumgAJwgkRRqq1Ws2LRurvb9Kejk7ZCNr0nwPdcp30e7YWvXuq
         +W/atv4XuKIeBWrQ3hClizWzvVAaGyORlYPtFfKsiUvRgbqCj6N+O/zvqyc3c0ElNa4B
         wBLA==
X-Forwarded-Encrypted: i=1; AJvYcCUaSyGoPhjGaV87a0AsswHG9aQrhGtEmb1TmpMOwCzMsvEKcmYXCHNRFNaM+PL32ZnAT64AhCDX1do1@vger.kernel.org, AJvYcCWouD9pa8Cr+/qO77MzQ5SsYCKoxWsh5iWUZ3ctPGd7Ur24rEPHcGDnfA8iITpcElK+FgCUeJOsbI9bZP/P@vger.kernel.org, AJvYcCXoIbXabCxbaHydjRDySa5WjGnITVfj/5cnIwAHPIOHhbBGSTwuVkAzoGwQ5HDY73/ydzpRgx2Ih7r8MAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWadoHMRUw4TIMLeVA78HXxKvsZ+MLvW4rXqDSlJxX5nQHQ/bi
	tyQR9/Au3C1ywrSPr9CdS+YBSOT/o6SvZMA8yVN1gsBH/yb4NU3LT57PaQ==
X-Gm-Gg: ASbGncvDxdAly9hpK79mlOu81rMy6XmcQzm8HCBtCW+y4X/CMJZiDXj7JO7UbiEDy5d
	bDdH4Uzuaxnh2xoWeV1A5sp1l90K/oW6tTbBbpntQvZvzsoVe2ja9wYEksyfdXxZOkkjXZnUjY5
	29XzEyfqpQJZLevBGOX2ipF0KUcwh+q01SIhVWxXJMnBn/IHMimjepMXw7g69dAdI50lsLUxTJP
	+0LfZWeYRdP8KAfSZiZuqeBjlObSssJYMyG28/2LYjFy0oQpWl6erl1YTi9N2ZCbJfaSdB90xX8
	Gu9B5wQFOxi3f9DgqmODSfYlWNrAXhpJnZzr
X-Google-Smtp-Source: AGHT+IHkB/NdOZh2fTJYGimoI8wlEFEwKE28euDZnByrZuT3OE1yaSiZeEhbLmlQ3rcOd9X7N1yCUQ==
X-Received: by 2002:a05:6000:2d12:b0:385:faec:d94d with SMTP id ffacd0b85a97d-3862b3e2f99mr6963305f8f.51.1733754248241;
        Mon, 09 Dec 2024 06:24:08 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38621fbbea8sm13170972f8f.97.2024.12.09.06.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 06:24:07 -0800 (PST)
Date: Mon, 9 Dec 2024 15:24:06 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linus.walleij@linaro.org, peng.fan@nxp.com, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl-tegra: Add config property GPIO mode
Message-ID: <mrhi42z4bnswba4vls3shkrvls3wfqn5wwgb5tm5gvzspysz5h@k65xzhumzhuv>
References: <20241209101314.22834-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="inqf4xrtqtxwf6rm"
Content-Disposition: inline
In-Reply-To: <20241209101314.22834-1-pshete@nvidia.com>


--inqf4xrtqtxwf6rm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl-tegra: Add config property GPIO mode
MIME-Version: 1.0

On Mon, Dec 09, 2024 at 03:43:14PM +0530, Prathamesh Shete wrote:
> The SFIO/GPIO select bit is a crucial part of Tegra's pin multiplexing
> system:
> - When set to 1, the pin operates in SFIO mode, controlled by the
>   pin's assigned special function.
> - When set to 0, the pin operates as a general-purpose GPIO.
>=20
> This SFIO/GPIO select bit that is set for a given pin is not displayed,
> adding the support to retrieve this information from the
> pinmux set for each pin.
>=20
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c | 11 +++++++++++
>  drivers/pinctrl/tegra/pinctrl-tegra.h |  2 ++
>  2 files changed, 13 insertions(+)
>=20
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegr=
a/pinctrl-tegra.c
> index 9523b93008d0..b3501c78b5b6 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -96,6 +96,7 @@ static const struct cfg_param {
>  	{"nvidia,slew-rate-falling",	TEGRA_PINCONF_PARAM_SLEW_RATE_FALLING},
>  	{"nvidia,slew-rate-rising",	TEGRA_PINCONF_PARAM_SLEW_RATE_RISING},
>  	{"nvidia,drive-type",		TEGRA_PINCONF_PARAM_DRIVE_TYPE},
> +	{"nvidia,gpio-mode",		TEGRA_PINCONF_PARAM_GPIO_MODE},
>  };
> =20
>  static int tegra_pinctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
> @@ -476,6 +477,16 @@ static int tegra_pinconf_reg(struct tegra_pmx *pmx,
>  		*bit =3D g->drvtype_bit;
>  		*width =3D 2;
>  		break;
> +	case TEGRA_PINCONF_PARAM_GPIO_MODE:
> +		if (pmx->soc->sfsel_in_mux) {
> +			*bank =3D g->mux_bank;
> +			*reg =3D g->mux_reg;
> +			*bit =3D g->sfsel_bit;
> +			*width =3D 1;
> +		} else {
> +			*reg =3D -ENODEV;

I think this should be either -EINVAL or -ENOTSUPP. If you look at
pinconf_generic_dump_one() where this function is ultimately called, it
will ignore those errors as "legal" but print out an error for all other
error codes. Since this code will potentially execute on chips that
don't support SFSEL in the mux register, leaving -ENODEV here might spam
the output with error messages.

Thierry

--inqf4xrtqtxwf6rm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdW/YUACgkQ3SOs138+
s6ETMA//Q6XxBSaXe92FVUzxunURDD2n+OM5z14ULDVTpv2T73f9IAKhYYDTutLN
9hiVi0hUeUBuDUjtHQw1sRJlic5kI79iHAPtb6/RCgnWFcmZUey35lX2LknCGTTr
fMe58ccsHB1Qehly+ibiB70QPj12J9v7iamCpmWcMBPt+pE28o5iUmlFb9Lms4oe
yWMCrvtXBvmoGPXtXcsNWttOqV1cYdkD37iJqk2G/jMVg0NdRQ8z3boW+8iTUcKI
d0g4pzMK/fwwgh8nnnxWWAl3fg6SMKCozveAw8dbsvfdgV2MBMr9vatXSYarVt+5
TiUBmwqk/ewtF57hYeU0Qmo7k2MVQR/eXCoolraqLiZU2JFI4hei94ioMyNmpmt5
nwa2MnUuwYHwq+HKToIV6GNr+4PLvDPZNo9IIK0kHqVT0XvoiWK65LC9Ck1ZNIgM
AkN2UnFAVqVGyiumf8c4qT5gxfvm7DMIs6ZCOVOt4lHkJj1TEqTP7TePPvSlIDUb
UKfIaF5XUbIvK3ilLjpx6AOxdcEZgkrMGI9Mv/NYPl9Ak6wvGhzvhq5IDNXM9D5T
dKByNSzGUtYUKaHKRxEOgDAcGqSkfo2ep5dsXlPxGu9PgpktNnUjRIdlUW/N4++y
HiE3z0A+ulbQd5mWngVHj6WY4M0HzpfpwJ5Y77l9/Ofp8knK66Y=
=dPg4
-----END PGP SIGNATURE-----

--inqf4xrtqtxwf6rm--

