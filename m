Return-Path: <linux-gpio+bounces-26979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4F5BCD023
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 15:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 279604FD581
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 13:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A3C2F0690;
	Fri, 10 Oct 2025 13:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0XR8HZR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CE128750B
	for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 13:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760101379; cv=none; b=Gti7mBkSELOt99qwKLtvGWPU6n8mgKABqSRB9fEdejJ9iRbXWZjxosjIQ5rB0yd84NEvDAwU2j9n1TbcpoD7/U8pN/eQsxjQckS5zBLIxyikScPkF9YyGYWCLgLLmnVnNP9Kp3uLCqpECZRHzUNwTfbVvGHP6ZHnF6Q69ExE3fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760101379; c=relaxed/simple;
	bh=UMmh0ixuXJTt0s2TKUlOVuK1lCZfhBnZUVnUdxDuRZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UsksNr+94Dmhz+DN0yVcSM/PfIhCYe2jQUBw4foYGmjj3d0ZheDrhwk4Kb1gzAtILnDbeKO0sTwgL88IkR3aRk9VExNfTGUMPmgkBCKVxHUC2hykOXNxEZr7cvj/ANVbfVIejse4+JA+MoOWjZf+uMBCaUnLijUGpUU7Tpn3qTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0XR8HZR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42557c5cedcso1212768f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 06:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760101376; x=1760706176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4fPogEhzUXrTdhTTuabqrK7QngG4oNt13cZY7dhIIwI=;
        b=G0XR8HZRXOBg7yP0zO+62uxho3M2w+/LSTVeITXv0HnxTLMxnbXVb423KnQA7FYMG+
         s3ObLpOi3KfIY8rzSX3Y2dFWKtYc0/7cmaDdqK3H89IGnVW7SHXArDMEs79zmLuQAYHM
         /iCnr66/X6251l5jfTTtocV2qJZrGnmBVXl8qWu/fD739nxXluGjoi82EB8XMC2E4BXh
         syaP/2xs9rsJOncMRyybZ3pIG7Vlk1pLz/PEYgTfKKDAlcnuGq3IdVGA/ardDLYI+Dd9
         5CVCxSeqC3y4VAJWsAAL5//g6NHXV19F2/xqUKqUJWIVBwBZxAZz0UpxqEPdyJmEqjgz
         jWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760101376; x=1760706176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fPogEhzUXrTdhTTuabqrK7QngG4oNt13cZY7dhIIwI=;
        b=aLn4wKdzHqipFPJ06ROFlWE8RZ81nlblVzpfkWk4yPi8yH762BLy+h0q+xBI3X0ygy
         HBT3XuAuLn8roRj1EN8acuzxKxNG4E85DcUVF6JBFQHhvFGMgw/0L91K0s3UXBnkHoRX
         3BhVF9dppodfC8RPaQqrapuuVooYUp/C66ctFq+l59X+vNGQ9AsjUPEnrtsPQw2L2sDx
         VJRkGtGA0Ka7JAlKPl33qGfJAvqFTpnG6IjahMQuiyoC3P6HRNcshHgMCGkCTAnaylkD
         cuwJMZUHr1uWcJNJ7OAxFilYGpdX4dYO2ft6qfkHkHfDQc32w/nJQ6z82qMbCGIbF8/S
         Himg==
X-Forwarded-Encrypted: i=1; AJvYcCXwZaAjV/3Ga4EmFkPwpDMKZYtfWs9WCDWptzEdw7xhIiXegGgl8aGnDRhxLWisQJfPM5MDx5Zb7o+w@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvauk3APRqnMhq+2bk4AG6nqVy0jlt5RKFc6fUNd3w4rrBSFc4
	bX5U1dyaIr5l1NkbOCNTHS3HZ71eLmvT7tbynnoesvDsd9hvMvGQ9EMR
X-Gm-Gg: ASbGncuIRJ98qCSDpjObEJ3wpGO05DrE5nnNbUNYvilm72nUIGzV79Qd6UyM0xFFvBe
	DdrmoN43FUa9mTdRlPXd23PnwuPuxRMMgt5m3z10gsLWB/0OaTSJoiFAQQx++j+LVO7t5aARhIR
	iKVNrptnyZaIL0QXr8D3YYmUG2yiOhuE8yWRzParZLiGpSIob3ykti7AfGOVSweDdtHuth224kz
	7Abw4YHw55LsimLg6py2Pro6tR9ZQLrBAysNj9ih3Mj9JHVDMPC9L7KE8tvB/+aG89KUXHOgsCG
	hro1VCDhBr+Mb4FX2xSesS2beqIhZDyzS7DAKY4y9apH5iMYcXhFhQenvlnlqtMI0xV65E4csEC
	h8z7OMuhetom7m2vMn1i29ptKtExuUV4XSPDQ7ASxWCmewOMbv1TKWgNkcvAYB0BRm7eybKRyz6
	lnIrCnEE0jvv1bJxxg4MGdPQ3hIk4pJ83MGt8cbzM=
X-Google-Smtp-Source: AGHT+IEMjxLTrJZ/o60+I/Q5hZnJdR8vNmdbTfqELxLC3RPvRkjHax7jfQ7GpFbXCyBlMYsPRvJkVg==
X-Received: by 2002:a05:6000:4006:b0:3cc:8d94:1108 with SMTP id ffacd0b85a97d-4266726c45amr7913933f8f.22.1760101375405;
        Fri, 10 Oct 2025 06:02:55 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce589b3dsm4284391f8f.24.2025.10.10.06.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 06:02:53 -0700 (PDT)
Date: Fri, 10 Oct 2025 15:02:51 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 1/2] gpio: tegra186: Use generic macro for port
 definitions
Message-ID: <owzpsj5mhp6hq2cnujjd4il7pvbxjh2umy3vaoxa6yy5rwohdv@75xoicdb7psj>
References: <20251010101331.712553-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pcqfgr3y5jk7i3mb"
Content-Disposition: inline
In-Reply-To: <20251010101331.712553-1-kkartik@nvidia.com>


--pcqfgr3y5jk7i3mb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/2] gpio: tegra186: Use generic macro for port
 definitions
MIME-Version: 1.0

On Fri, Oct 10, 2025 at 03:43:30PM +0530, Kartik Rajput wrote:
> Introduce a generic macro TEGRA_GPIO_PORT to define SoC specific
> ports macros. This simplifies the code and avoids unnecessary
> duplication.
>=20
> Suggested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra186.c | 87 +++++++++++-------------------------
>  1 file changed, 25 insertions(+), 62 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 4d3db6e06eeb..7ea541d6d537 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -1002,14 +1002,17 @@ static int tegra186_gpio_probe(struct platform_de=
vice *pdev)
>  	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio, gpio);
>  }
> =20
> -#define TEGRA186_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
> -	[TEGRA186_MAIN_GPIO_PORT_##_name] =3D {			\
> -		.name =3D #_name,					\
> -		.bank =3D _bank,					\
> -		.port =3D _port,					\
> -		.pins =3D _pins,					\
> +#define TEGRA_GPIO_PORT(_prefix, _name, _bank, _port, _pins) \
> +	[_prefix##_GPIO_PORT_##_name] =3D { \
> +		.name =3D #_name, \
> +		.bank =3D _bank, \
> +		.port =3D _port, \
> +		.pins =3D _pins, \

If you keep the whitespace you can save another 8 lines of diff since
these last four lines are exactly the same.

Not a big deal, so either way:

Acked-by: Thierry Reding <treding@nvidia.com>

--pcqfgr3y5jk7i3mb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjpA/sACgkQ3SOs138+
s6HdNhAAj3QcePPVQz0R9gcJDzaBbrFuORBYpeu5GIBz9LHCWWUtQ5bbXhLhFR1b
frR83G/XWtu944mOBfTVlGSkTyEEmBHtiJdqATfDh5NOZMBSicdNGQI6+OrtCjvs
8c6kqRz1rTnID5r7LqYHjw23+Rz7cjuKL7mAF8w3bQpbuNtbwoUY5rH58LUHRVRZ
QVhIwM7+KrA/jTspDqN/V6Z0LT3XiYlmmhSanxHrl7EcgbKQHgzJhPWiQ/eBnk++
st8fcLE7u6pz0/5zP5B2zJt70whesgyrgJxe1Fv5jAY2APhqAaCIzpWKtuR80P70
lHStqpQIpbHCeYbFoVloaQgp7Xbln2VlP0hhSDna6hjDo4HhWnClkC2peKP1SDzB
6ulyDz5mKP4AmLJVePsV9r+42sZMe0zaDqIjOgKi7EZo2IY4INuSLRmbX0dYPVON
h4VKGQYmWx3evNiVCpL9QssbTjGdgxPpIeuAilaFa1wJo9aQw/WmxqH/bRNAx9S1
XqXAfd07JjMwwQLrMvlM/nvOUbI3N6F0lNrCUshVQ4k6XhUTbeoFTTsjt6KyK4VB
D733rdDy8PmOnuqELa5za00OYaCzXWsB1cn1cjIhdsYNoTH9KQYsPCATImSbAchU
8vB3rNxM6/YC6xgYdtnAf5eHufE/Dukg+W0f6YM5J96d3Xmuowg=
=nwfK
-----END PGP SIGNATURE-----

--pcqfgr3y5jk7i3mb--

