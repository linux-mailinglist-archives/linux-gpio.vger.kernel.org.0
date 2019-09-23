Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3725EBB55B
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2019 15:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437179AbfIWNd3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Sep 2019 09:33:29 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:45475 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437178AbfIWNd3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2019 09:33:29 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id AC52C1C000F;
        Mon, 23 Sep 2019 13:33:25 +0000 (UTC)
Date:   Mon, 23 Sep 2019 15:33:25 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 3/3] gpio: syscon: Add support for the Xylon LogiCVC GPIOs
Message-ID: <20190923133325.GA57525@aptenodytes>
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
 <20190910152855.111588-3-paul.kocialkowski@bootlin.com>
 <CACRpkdY40PZc9R-yFwooR4-WMgn3LH7K+yTx00ZNxyq6OOnw6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
In-Reply-To: <CACRpkdY40PZc9R-yFwooR4-WMgn3LH7K+yTx00ZNxyq6OOnw6A@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 12 Sep 19, 10:17, Linus Walleij wrote:
> On Tue, Sep 10, 2019 at 4:29 PM Paul Kocialkowski
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
>=20
> I'm fine with this for now, but the gpio-syscon driver is now growing
> big and when you use it you are getting support for a whole bunch
> of systems you're not running on included in your binary.
>=20
> We need to think about possibly creating drivers/gpio/syscon
> and split subdrivers into separate files and config options
> so that people can slim down to what they actually need.

Thanks for the review!

I understand your concern about more devices getting pulled-in and built
unconditionally. Though I do like the idea of having a single driver for on=
ly
exposing the GPIO part of bigger components instead of specific drivers with
< 100 lines of useful code.

Maybe a first step would be to introduce Kconfig options for each device and
ifdef around in the code, as to solve the "built unconditionally" aspect?

Either way, I'll send v2 still adding my driver to gpio-syscon but feel fre=
e to
have me in the loop when that driver needs to be changed.

> > +       *bit =3D 1 << offset;
>=20
> Please do this:
>=20
> #include <linux/bits.h>
>=20
> *bit =3D BIT(offset);

Sure thing and sorry I missed that, thanks!

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2IyaUACgkQ3cLmz3+f
v9F0nQgAjJ5BXBlS8EuvhntG+VA0UwBa5KB56iTBqjHtJqvSOjtuz/EgGyaGm/fB
pETn2ZUp76AQXEDI7VOdNX5uHmaNepAX0kwtVuwx6vE2hvLoz3WiPq9bgCSIs/iY
fAvRY4tl6ECT2SHJP/jeL1K0C7PKzN+6YIQOsIbz8i5KKSjNJyFAkzZjJ671TA1u
4Nfe6fNGxxU+eUJpCijcLa+t9mNaoS0hY8v5/adLNJxD72RBIbYQAku6Y8o3o7HX
y0fBWFrBnvVJzd24Y3COxoojpc3hjpRJgu0mYgcL2KU05uSt9r7phLIBW+ARJaua
qSpN0ZfQjVfWFhW8qbi6xc29nKA94w==
=Bf8P
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
