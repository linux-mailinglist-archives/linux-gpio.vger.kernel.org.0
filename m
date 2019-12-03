Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 705FD10FA46
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 09:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfLCI6C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 03:58:02 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:41593 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfLCI6B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 03:58:01 -0500
X-Originating-IP: 90.76.211.102
Received: from aptenodytes (lfbn-1-2154-102.w90-76.abo.wanadoo.fr [90.76.211.102])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 504A31BF20D;
        Tue,  3 Dec 2019 08:57:58 +0000 (UTC)
Date:   Tue, 3 Dec 2019 09:57:57 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 5/5] gpio: syscon: Add support for the Xylon LogiCVC
 GPIOs
Message-ID: <20191203085757.GA121276@aptenodytes>
References: <20191128155438.325738-1-paul.kocialkowski@bootlin.com>
 <20191128155438.325738-6-paul.kocialkowski@bootlin.com>
 <CACRpkdaSLsq-oA7t8OL6_6L+ivZE+a83M4JbTZ2HW5E1E7c6yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <CACRpkdaSLsq-oA7t8OL6_6L+ivZE+a83M4JbTZ2HW5E1E7c6yw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri 29 Nov 19, 10:24, Linus Walleij wrote:
> Hi Paul,
>=20
> thanks for your patch!
>=20
> On Thu, Nov 28, 2019 at 4:54 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
>=20
> > The LogiCVC display hardware block comes with GPIO capabilities
> > that must be exposed separately from the main driver (as GPIOs) for
> > use with regulators and panels. A syscon is used to share the same
> > regmap across the two drivers.
> >
> > Since the GPIO capabilities are pretty simple, add them to the syscon
> > GPIO driver.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> (...)
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
>=20
> The gpio-syscon.c is for simple syscons where the lines
> you want to affect are nicely ordered in the registers.
> It is intended to be generic.
>=20
> This is kind of shoehorning a special case into the generic
> code.
>=20
> Isn't it more appropriate to create a specific driver for this
> hardware?

Yes I'm fine with that too. Indeed the driver has custom set/get operations
that don't really fit well into generic code.

> Special get/set quirks for any possible quirky offset is
> certainly not the way to go, if this should be supported
> we need generic properties in struct syscon_gpio_data
> to indicate the valid bits and offsets.

I guess the rationale would be to define multiple possible bit offsets for
different ranges of GPIO offsets, but I don't think it would be very useful
outside of this case.

I'll probably craft a new version with a dedicated driver then.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl3mI5UACgkQ3cLmz3+f
v9Ejqwf9EqpCp5uGFwKQd9B+GtDJr4lmeFgNU3q869poGgN71iZlIVqLbkTlNRi5
Zzcv3O/kk3DUpDx9c+zaz6wiiSMeh/G1u1DIvg3ewOmQSJIFI4oGw+2fClcfDhPR
gzSBq9Oshh6gJVFQD5aD5FUswj6PBnUBNfi03dKMvFqFGxXNpagYRu0b9A+rNHrR
QJDxjkGggG1EacHTetFQ8LVf6NNNNGtqFt43Y5vmYWfS/xJ9K7wE3byhZm9gnjcw
/AHKKNTMv77/3UcjpY0OPlKQ0ZNN7XOQRDb4Cbp0inKkyAh1A34Wjy/PaCSbtIYJ
0dikoJ59H99/czfZUldnSLdkeDsmCw==
=B18y
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
