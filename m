Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A240CA027
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 16:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730479AbfJCOPo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 10:15:44 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:53959 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730454AbfJCOPo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 10:15:44 -0400
X-Originating-IP: 132.205.229.212
Received: from aptenodytes (unknown [132.205.229.212])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9BCCEFF807;
        Thu,  3 Oct 2019 14:15:39 +0000 (UTC)
Date:   Thu, 3 Oct 2019 10:15:37 -0400
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
Message-ID: <20191003141537.GE24151@aptenodytes>
References: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com>
 <20190927100407.1863293-4-paul.kocialkowski@bootlin.com>
 <CAMpxmJUHPuGPPPFSctyhtfj0oAk6oJ+=mvgN4=7jmLxAfHs45Q@mail.gmail.com>
 <20191003112610.GA28856@aptenodytes>
 <CAMpxmJVfgDTNcwk6qmCwfwQkp_tw+8CVbO1mSeHQkBzJgoWLXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Content-Disposition: inline
In-Reply-To: <CAMpxmJVfgDTNcwk6qmCwfwQkp_tw+8CVbO1mSeHQkBzJgoWLXg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--TD8GDToEDw0WLGOL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 03 Oct 19, 16:05, Bartosz Golaszewski wrote:
> czw., 3 pa=C5=BA 2019 o 13:26 Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> napisa=C5=82(a):
> >
> > Hi,
> >
> > On Thu 03 Oct 19, 10:24, Bartosz Golaszewski wrote:
> > > pt., 27 wrz 2019 o 12:04 Paul Kocialkowski
> > > <paul.kocialkowski@bootlin.com> napisa=C5=82(a):
> > > >
> > > > Some drivers might need a custom get operation to match custom
> > > > behavior implemented in the set operation.
> > > >
> > > > Add plumbing for supporting that.
> > > >
> > > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > ---
> > > >  drivers/gpio/gpio-syscon.c | 7 ++++---
> > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
> > > > index 31f332074d7d..05c537ed73f1 100644
> > > > --- a/drivers/gpio/gpio-syscon.c
> > > > +++ b/drivers/gpio/gpio-syscon.c
> > > > @@ -43,8 +43,9 @@ struct syscon_gpio_data {
> > > >         unsigned int    bit_count;
> > > >         unsigned int    dat_bit_offset;
> > > >         unsigned int    dir_bit_offset;
> > > > -       void            (*set)(struct gpio_chip *chip,
> > > > -                              unsigned offset, int value);
> > > > +       int             (*get)(struct gpio_chip *chip, unsigned off=
set);
> > > > +       void            (*set)(struct gpio_chip *chip, unsigned off=
set,
> > > > +                              int value);
> > >
> > > Why did you change this line? Doesn't seem necessary and pollutes the=
 history.
> >
> > This is for consistency since both the "chip" and "offset" arguments ca=
n fit
> > in a single line. Since I want the "get" addition to fit in a single li=
ne,
> > bringing back "offset" on the previous line of "set" makes things consi=
stent.
> > There's probably no particular reason for the split in the first place.
> >
> > Do you think it needs a separate cosmetic commit only for that?
> > I'd rather add a note in the commit message and keep the change as-is.
> >
>=20
> The line is still broken - just in a different place. I'd prefer to
> leave it as it is frankly, there's nothing wrong with it.

The point is rather that this introduces inconsistency between the two line=
s.
It's definitely not a major issue, but I still believe it is a coding style
issue. It surely doesn't hurt to fix it.

Cheers,

Paul

> Bart
>=20
> > Cheers,
> >
> > Paul
> >
> > > Bart
> > >
> > > >  };
> > > >
> > > >  struct syscon_gpio_priv {
> > > > @@ -252,7 +253,7 @@ static int syscon_gpio_probe(struct platform_de=
vice *pdev)
> > > >         priv->chip.label =3D dev_name(dev);
> > > >         priv->chip.base =3D -1;
> > > >         priv->chip.ngpio =3D priv->data->bit_count;
> > > > -       priv->chip.get =3D syscon_gpio_get;
> > > > +       priv->chip.get =3D priv->data->get ? : syscon_gpio_get;
> > > >         if (priv->data->flags & GPIO_SYSCON_FEAT_IN)
> > > >                 priv->chip.direction_input =3D syscon_gpio_dir_in;
> > > >         if (priv->data->flags & GPIO_SYSCON_FEAT_OUT) {
> > > > --
> > > > 2.23.0
> > > >
> >
> > --
> > Paul Kocialkowski, Bootlin
> > Embedded Linux and kernel engineering
> > https://bootlin.com

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2WAokACgkQ3cLmz3+f
v9FNqQgAjU19Rf3TG//SDczLv2Sv0l+hsFLxHpRmO+JvfFeZ72FxUnUAY4VhUfqn
ThnnBkKBtQYBEGZCagM7DCUGWUr3z6wxIF6IPlUMmHC8tbemBRx3aX95Yer2MVVd
m2/BpErSNNfdjbYPcRumpCFbOUXQJ0JxTLP7Aw1kDh8OkLI81q+tL4Klhs+19vaw
wAFbf1CenAEJQlDzlqE2IAN+45h6cuMQSgLRYsZ5ahggs+gE9reX57Dk++xSSK/k
LMG6ZiNY0Xxqxv+TJ8VQnu0OtJeAVgrrWWc1eFg6dc8aFNy5jFbMvLfz90iR4Lc1
OqiWTc0Bfpd2Ef2oa20KCEUCVmmqjw==
=/Q2n
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--
