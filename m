Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6A6BC9D39
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 13:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729702AbfJCL1C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 07:27:02 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:45589 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729565AbfJCL1C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 07:27:02 -0400
X-Originating-IP: 162.222.80.169
Received: from aptenodytes (unknown [162.222.80.169])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1E3D860008;
        Thu,  3 Oct 2019 11:26:57 +0000 (UTC)
Date:   Thu, 3 Oct 2019 07:26:56 -0400
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
Subject: Re: [PATCH v3 5/5] gpio: syscon: Add support for the Xylon LogiCVC
 GPIOs
Message-ID: <20191003112656.GB28856@aptenodytes>
References: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com>
 <20190927100407.1863293-6-paul.kocialkowski@bootlin.com>
 <CAMpxmJWQ9iuNj8Nfhf0hVzP6piNPrb8_e7ucth0rmg8KwT4HdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline
In-Reply-To: <CAMpxmJWQ9iuNj8Nfhf0hVzP6piNPrb8_e7ucth0rmg8KwT4HdA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi and thanks for the review!

On Thu 03 Oct 19, 10:26, Bartosz Golaszewski wrote:
> Hi Paul,
>=20
> just two nits:
>=20
> pt., 27 wrz 2019 o 12:04 Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> napisa=C5=82(a):
> >
> > The LogiCVC display hardware block comes with GPIO capabilities
> > that must be exposed separately from the main driver (as GPIOs) for
> > use with regulators and panels. A syscon is used to share the same
> > regmap across the two drivers.
> >
> > Since the GPIO capabilities are pretty simple, add them to the syscon
> > GPIO driver.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  drivers/gpio/gpio-syscon.c | 68 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
> > index 05c537ed73f1..cdcb913b8f0c 100644
> > --- a/drivers/gpio/gpio-syscon.c
> > +++ b/drivers/gpio/gpio-syscon.c
> > @@ -190,6 +190,70 @@ static const struct syscon_gpio_data keystone_dsp_=
gpio =3D {
> >         .set            =3D keystone_gpio_set,
> >  };
> >
> > +#define LOGICVC_CTRL_REG               0x40
> > +#define LOGICVC_CTRL_GPIO_SHIFT                11
> > +#define LOGICVC_CTRL_GPIO_BITS         5
> > +
> > +#define LOGICVC_POWER_CTRL_REG         0x78
> > +#define LOGICVC_POWER_CTRL_GPIO_SHIFT  0
> > +#define LOGICVC_POWER_CTRL_GPIO_BITS   4
> > +
> > +static void logicvc_gpio_offset(struct syscon_gpio_priv *priv,
> > +                               unsigned offset, unsigned int *reg,
> > +                               unsigned int *bit)
> > +{
> > +       if (offset >=3D LOGICVC_CTRL_GPIO_BITS) {
> > +               *reg =3D LOGICVC_POWER_CTRL_REG;
> > +
> > +               /* To the (virtual) power ctrl offset. */
> > +               offset -=3D LOGICVC_CTRL_GPIO_BITS;
> > +               /* To the actual bit offset in reg. */
> > +               offset +=3D LOGICVC_POWER_CTRL_GPIO_SHIFT;
> > +       } else {
> > +               *reg =3D LOGICVC_CTRL_REG;
> > +
> > +               /* To the actual bit offset in reg. */
> > +               offset +=3D LOGICVC_CTRL_GPIO_SHIFT;
> > +       }
> > +
> > +       *bit =3D BIT(offset);
> > +}
> > +
> > +static int logicvc_gpio_get(struct gpio_chip *chip, unsigned offset)
> > +{
> > +       struct syscon_gpio_priv *priv =3D gpiochip_get_data(chip);
> > +       unsigned int reg;
> > +       unsigned int bit;
> > +       unsigned int value;
>=20
> Can you put these on a single line?

Sure thing.

> > +       int ret;
> > +
> > +       logicvc_gpio_offset(priv, offset, &reg, &bit);
> > +
> > +       ret =3D regmap_read(priv->syscon, reg, &value);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return !!(value & bit);
> > +}
> > +
> > +static void logicvc_gpio_set(struct gpio_chip *chip, unsigned offset, =
int val)
> > +{
> > +       struct syscon_gpio_priv *priv =3D gpiochip_get_data(chip);
> > +       unsigned int reg;
> > +       unsigned int bit;
>=20
> Same here.

Will do!

Cheers,

Paul

> > +
> > +       logicvc_gpio_offset(priv, offset, &reg, &bit);
> > +
> > +       regmap_update_bits(priv->syscon, reg, bit, val ? bit : 0);
> > +}
> > +
> > +static const struct syscon_gpio_data logicvc_gpio =3D {
> > +       .flags          =3D GPIO_SYSCON_FEAT_OUT,
> > +       .bit_count      =3D LOGICVC_CTRL_GPIO_BITS + LOGICVC_POWER_CTRL=
_GPIO_BITS,
> > +       .get            =3D logicvc_gpio_get,
> > +       .set            =3D logicvc_gpio_set,
> > +};
> > +
> >  static const struct of_device_id syscon_gpio_ids[] =3D {
> >         {
> >                 .compatible     =3D "cirrus,ep7209-mctrl-gpio",
> > @@ -203,6 +267,10 @@ static const struct of_device_id syscon_gpio_ids[]=
 =3D {
> >                 .compatible     =3D "rockchip,rk3328-grf-gpio",
> >                 .data           =3D &rockchip_rk3328_gpio_mute,
> >         },
> > +       {
> > +               .compatible     =3D "xylon,logicvc-3.02.a-gpio",
> > +               .data           =3D &logicvc_gpio,
> > +       },
> >         { }
> >  };
> >  MODULE_DEVICE_TABLE(of, syscon_gpio_ids);
> > --
> > 2.23.0
> >

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2V2wAACgkQ3cLmz3+f
v9EXmgf+M7DOLYFim8MRoBBPHg6VUTypsKrr003RgYerHk+laNEy/4udpTCO21vW
KRvnQw+9uIhLZMAHOjpy7KQCT0gxCIyrVvBbEO5mIk44nqTLlv76nITiirEn04pi
Boau1nRZ1IH8RzhecJroo5JsqcfVJQA7p/nsDM7XX4F2vRCjeX4soqb5iY5xbdnd
P0BqnmUzRb9gx8l6bn2eAyX0YGiCcRgwrdpsG+Vh6Y0hFLjCJBMANJeRBazMA9yD
hac6kPuxPmX1FzXNr53UWQbZUd7znDR2qDGgNraFy4xQCIucajivrJsXwoBOAdTT
OzBqao5sxI1iL7ULfrwRBKXPMs4EDg==
=31VS
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
