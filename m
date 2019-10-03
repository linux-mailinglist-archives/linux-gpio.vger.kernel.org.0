Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20AB1C9D35
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 13:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729985AbfJCL0Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 07:26:16 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:38653 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfJCL0Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 07:26:16 -0400
X-Originating-IP: 162.222.80.169
Received: from aptenodytes (unknown [162.222.80.169])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 855C860008;
        Thu,  3 Oct 2019 11:26:11 +0000 (UTC)
Date:   Thu, 3 Oct 2019 07:26:10 -0400
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 3/5] gpio: syscon: Add support for a custom get
 operation
Message-ID: <20191003112610.GA28856@aptenodytes>
References: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com>
 <20190927100407.1863293-4-paul.kocialkowski@bootlin.com>
 <CAMpxmJUHPuGPPPFSctyhtfj0oAk6oJ+=mvgN4=7jmLxAfHs45Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <CAMpxmJUHPuGPPPFSctyhtfj0oAk6oJ+=mvgN4=7jmLxAfHs45Q@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 03 Oct 19, 10:24, Bartosz Golaszewski wrote:
> pt., 27 wrz 2019 o 12:04 Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> napisa=C5=82(a):
> >
> > Some drivers might need a custom get operation to match custom
> > behavior implemented in the set operation.
> >
> > Add plumbing for supporting that.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  drivers/gpio/gpio-syscon.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
> > index 31f332074d7d..05c537ed73f1 100644
> > --- a/drivers/gpio/gpio-syscon.c
> > +++ b/drivers/gpio/gpio-syscon.c
> > @@ -43,8 +43,9 @@ struct syscon_gpio_data {
> >         unsigned int    bit_count;
> >         unsigned int    dat_bit_offset;
> >         unsigned int    dir_bit_offset;
> > -       void            (*set)(struct gpio_chip *chip,
> > -                              unsigned offset, int value);
> > +       int             (*get)(struct gpio_chip *chip, unsigned offset);
> > +       void            (*set)(struct gpio_chip *chip, unsigned offset,
> > +                              int value);
>=20
> Why did you change this line? Doesn't seem necessary and pollutes the his=
tory.

This is for consistency since both the "chip" and "offset" arguments can fit
in a single line. Since I want the "get" addition to fit in a single line,
bringing back "offset" on the previous line of "set" makes things consisten=
t.
There's probably no particular reason for the split in the first place.

Do you think it needs a separate cosmetic commit only for that?
I'd rather add a note in the commit message and keep the change as-is.

Cheers,

Paul

> Bart
>=20
> >  };
> >
> >  struct syscon_gpio_priv {
> > @@ -252,7 +253,7 @@ static int syscon_gpio_probe(struct platform_device=
 *pdev)
> >         priv->chip.label =3D dev_name(dev);
> >         priv->chip.base =3D -1;
> >         priv->chip.ngpio =3D priv->data->bit_count;
> > -       priv->chip.get =3D syscon_gpio_get;
> > +       priv->chip.get =3D priv->data->get ? : syscon_gpio_get;
> >         if (priv->data->flags & GPIO_SYSCON_FEAT_IN)
> >                 priv->chip.direction_input =3D syscon_gpio_dir_in;
> >         if (priv->data->flags & GPIO_SYSCON_FEAT_OUT) {
> > --
> > 2.23.0
> >

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2V2tIACgkQ3cLmz3+f
v9GFGwf+IxprRkzBRr6IH3r+Ju8Sd+z8fEo/prPvemGLA9fboSrQhRno5RP3V6dX
h6NYZY+XEegXl+DrVqbJkNz0fpudKjY2XdJLhNR/9tKHQddj0UD2/ZgfavO30sZi
DL7f2PCUYC1kVr8j8bgJz4Vr/4EnEHs4Vkjfm9jKV8giap/DUYOX3QL1OwhBFEJW
53Cr+bJOuNC/+3G6oMeJ8GPzcikdYu+dRHV6Ka1mjxEeB3REj2g5jSEjZ+dwfczT
WLp3usydgx1AC+ag8EObLYXTb3ysu7Ugz0k+3HACQ1OTXijo5YMDzTtCYwlVrn4A
J+G/dstigrIs86FBd4MmZaOtafb+Xw==
=vWKK
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
