Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2B02F58EE
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 21:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729683AbfKHUyK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 15:54:10 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:60538 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfKHUyJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 15:54:09 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 01DCA1C0BEF; Fri,  8 Nov 2019 21:54:08 +0100 (CET)
Date:   Fri, 8 Nov 2019 21:54:07 +0100
From:   Pavel Machek <pavel@denx.de>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pavel Machek <pavel@denx.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: max77620: Fixup debounce delays
Message-ID: <20191108205407.GE23750@amd>
References: <20191108160747.3274377-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="r7U+bLA8boMOj+mD"
Content-Disposition: inline
In-Reply-To: <20191108160747.3274377-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--r7U+bLA8boMOj+mD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-11-08 17:07:46, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> When converting milliseconds to microseconds in commit fffa6af94894
> ("gpio: max77620: Use correct unit for debounce times") some ~1 ms gaps
> were introduced between the various ranges supported by the controller.
> Fix this by changing the start of each range to the value immediately
> following the end of the previous range. This way a debounce time of,
> say 8250 us will translate into 16 ms instead of returning an -EINVAL
> error.
>=20
> Typically the debounce delay is only ever set through device tree and
> specified in milliseconds, so we can never really hit this issue because
> debounce times are always a multiple of 1000 us.
>=20
> The only notable exception for this is drivers/mmc/host/mmc-spi.c where
> the CD GPIO is requested, which passes a 1 us debounce time. According
> to a comment preceeding that code this should actually be 1 ms (i.e.
> 1000 us).
>=20
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Thanks for doing this!

Acked-by: Pavel Machek <pavel@denx.de>

And I guess this should be cc: stable, as the commit this fixes was
making its way there.

Best regards,
								Pavel


> @@ -198,13 +198,13 @@ static int max77620_gpio_set_debounce(struct max776=
20_gpio *mgpio,
>  	case 0:
>  		val =3D MAX77620_CNFG_GPIO_DBNC_None;
>  		break;
> -	case 1000 ... 8000:
> +	case 1 ... 8000:
>  		val =3D MAX77620_CNFG_GPIO_DBNC_8ms;
>  		break;
> -	case 9000 ... 16000:
> +	case 8001 ... 16000:
>  		val =3D MAX77620_CNFG_GPIO_DBNC_16ms;
>  		break;
> -	case 17000 ... 32000:
> +	case 16001 ... 32000:
>  		val =3D MAX77620_CNFG_GPIO_DBNC_32ms;
>  		break;
>  	default:

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--r7U+bLA8boMOj+mD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXcXV7wAKCRAw5/Bqldv6
8vKwAJ988CosS0NDhsmk4/DwPnSu7GBBUQCeMtBW4yQCEaMMEEoJ6kuTTz3MaVk=
=JYJa
-----END PGP SIGNATURE-----

--r7U+bLA8boMOj+mD--
