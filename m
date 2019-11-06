Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8843EF0E7A
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 06:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbfKFFlA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 00:41:00 -0500
Received: from vm1.sequanux.org ([188.165.36.56]:43489 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbfKFFk7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 00:40:59 -0500
X-Greylist: delayed 370 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Nov 2019 00:40:59 EST
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id 29B321085FB;
        Wed,  6 Nov 2019 06:34:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8LSr8mww9hPp; Wed,  6 Nov 2019 06:34:46 +0100 (CET)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id 219CB108084;
        Wed,  6 Nov 2019 06:34:46 +0100 (CET)
Date:   Wed, 6 Nov 2019 06:34:46 +0100
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/62] gpio: gpio-f7188x: Use new GPIO_LINE_DIRECTION
Message-ID: <20191106053446.GD5290@kw.sim.vm.gnt>
References: <cover.1572945757.git.matti.vaittinen@fi.rohmeurope.com>
 <0a1fe4365ef599adde42396f0bb735c8623f679c.1572945757.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Content-Disposition: inline
In-Reply-To: <0a1fe4365ef599adde42396f0bb735c8623f679c.1572945757.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--d01dLTUuW90fS44H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2019 at 12:16:03PM +0200, Matti Vaittinen wrote:
> It's hard for occasional GPIO code reader/writer to know if values 0/1
> equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT to help them out.
>=20
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/gpio/gpio-f7188x.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
> index fdc639f856f1..cadd02993539 100644
> --- a/drivers/gpio/gpio-f7188x.c
> +++ b/drivers/gpio/gpio-f7188x.c
> @@ -250,7 +250,10 @@ static int f7188x_gpio_get_direction(struct gpio_chi=
p *chip, unsigned offset)
> =20
>  	superio_exit(sio->addr);
> =20
> -	return !(dir & 1 << offset);
> +	if (dir & 1 << offset)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN

Hi Matti,

I am probably missing something but I can't find GPIO_LINE_DIRECTION_IN
and GPIO_LINE_DIRECTION_OUT defined anywhere.

Besides I am an occasional code reader/writer and I find the original
code easy to understand.

Simon

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl3CW3UACgkQzyg/RDPm
szoNOA//bBFFObRst51hWETEA6zUf1ZURgI4sqYsn9hBwSFGIvvsEDQs2VWa/6Vu
zU60fN3VUhBeOW8RewOxFvzj3gtBzINUU5FADZZ6jAK+JT4gj3AChB/qlc+L3QZk
bE1huTQHsMbivNE/7bAkHowfQfKL5t5ztWYCNTs4YMr7/Jq8n6JNLYgta2Yx6J2H
6WBb2rd1EyMbnfqfohc3GjaIGsF9ptnomtX5yTsq41UfanaECNik8rU5boDvLNB4
m6EPG0MAqUiGVKo8RcelnxoEn+67HNIVxl50hpgPoX0Cp3wsCM4ve4l7Tk2YyF+/
O7ZEw8ho54ShvlXbbs0oAFpo5OlRMiLxxK3ekLDwpOUIJ0vamubwXhvtlPRem96l
eTnWAzMi8WgXoHQTqtwh+WipDKoyEuKzPpIqGt2wbD9s4eWjovtczP/gtEMnMECH
LVwO4N+pSd1QSjx65Goa9MrbeAtpEZNe/YknasoGHQm/Y4Rxzlcl5gBKFKUHtt3Y
K/cPOQNpJoFyRK9oxZd6C+cmjCbjCGzohft/deq1DemNeTrRJPzmGHQpkCh8iRYf
Cb7HuKyWc5aCtNuodWRE55xoCN1SlA1L8X7r4MdNKgcG/WY6d2ZHLfNaRD6klJVT
asP8NhSxb9PlogAfx8FfxdVdU1rfMtGD+/6lKozXrvyH2RMB4n8=
=uYre
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--
