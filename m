Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCAE2F9BB3
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 10:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388234AbhARJCz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 04:02:55 -0500
Received: from www.zeus03.de ([194.117.254.33]:33814 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388241AbhARJCo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Jan 2021 04:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=sr3wPtySxQZ9UKbwTXISYdT8cfkn
        nni3gqbD6XC81yk=; b=R+0itXAvQSnr82ghkhBVIrcHldOhKEfQ223x5NGBmXxx
        x4rk3Dx62/yzrmZrFhHcq7RKuRomk/gq1nzOsFBGmaNyur74jWNtB7Xp/S8ovB0R
        2ITxznfWGuWu9dnN7mlCp8u4In93G/rWoBlmpGX4JW+GyWFK1k8x5VL+A45cH6A=
Received: (qmail 631839 invoked from network); 18 Jan 2021 10:02:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jan 2021 10:02:02 +0100
X-UD-Smtp-Session: l3s3148p1@s8ez+Si5poYgAwDPXwacAOByz8F9Mgm1
Date:   Mon, 18 Jan 2021 10:02:02 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Documentation: gpio: Fix typo
Message-ID: <20210118090202.GB1018@ninjato>
References: <20201214155440.2950-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline
In-Reply-To: <20201214155440.2950-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 04:54:40PM +0100, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Does this go via doc or gpio?

>  Documentation/driver-api/gpio/consumer.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/d=
river-api/gpio/consumer.rst
> index 423492d125b9..86e7676c5f0d 100644
> --- a/Documentation/driver-api/gpio/consumer.rst
> +++ b/Documentation/driver-api/gpio/consumer.rst
> @@ -110,7 +110,7 @@ For a function using multiple GPIOs all of those can =
be obtained with one call::
> =20
>  This function returns a struct gpio_descs which contains an array of
>  descriptors.  It also contains a pointer to a gpiolib private structure =
which,
> -if passed back to get/set array functions, may speed up I/O proocessing::
> +if passed back to get/set array functions, may speed up I/O processing::
> =20
>  	struct gpio_descs {
>  		struct gpio_array *info;
> --=20
> 2.28.0
>=20

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAFTooACgkQFA3kzBSg
KbZnfxAArATWuEwUGzQauV4T5ndWfdvsLC5DzvhpY20z3gyn81ZtlbZjQajeU3rN
D4Du3xcxIq0tLnmWZ9BgisFshoUhhomFzLfDgsbCdz5iWJ8+dVFj8JSSSNj/mrx0
tFWtRGEb92OhvnHPOqbT8Ypjy0bXE1uLelSiVpvfp1gnhW7GYAsgtDo7hbPUXhRt
wIkhf+L7az6Y7HsiQK4jLFGAFAQdrD6O2AUqzE8FPiS0fdajrZ+QFlfO1OkcWeoa
z9MwkHQ8aHBwJZI2X/gwdpPLvaLCexHqOTHxPPGsNVM+hfhmIw4J1MxEE3krockU
+0jBqsGeKerwbqM0Lc+8ViEfU+o6IunnII1tqeglbt9Ay04DWK/SAVflaONGMuN5
yqgkQuRU0ynMNecx1GkFYVIMY1OBXKZyUuTeBzgBTcIssraH/N9bs7qLP7lbCwUE
jftzArKNqp9WMBOXY0QUyE1M8uU+aFQvYGroKq4eId/DyDjnGBLqiUe3rIXZei5+
XK3z66E+DjcY5OlzddYCHY4ZSslOfad01bfhJqhkZrf5rzre53Ed+6u5NkXLNwGG
3ADsgthJFQ9kiaIfz+BKJUVesrihjj5LLyvzHj64CsmOsd2cxxdKtG0YSPKKkAvc
JFw5qX7mvUdNA5kgn7QPNcEW14iv5obUA0DYmarKYFAcBm6Z3LY=
=REJe
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
