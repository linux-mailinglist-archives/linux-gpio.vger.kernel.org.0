Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13244BB647
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2019 16:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437035AbfIWONN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Sep 2019 10:13:13 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:37795 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389738AbfIWONN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2019 10:13:13 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 139B920012;
        Mon, 23 Sep 2019 14:13:04 +0000 (UTC)
Date:   Mon, 23 Sep 2019 16:13:04 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/3] dt-bindings: gpio: Add binding document for xylon
 logicvc-gpio
Message-ID: <20190923141304.GD57525@aptenodytes>
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
 <20190910152855.111588-2-paul.kocialkowski@bootlin.com>
 <5d7ba96d.1c69fb81.59623.6c9f@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Content-Disposition: inline
In-Reply-To: <5d7ba96d.1c69fb81.59623.6c9f@mx.google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 13 Sep 19, 15:36, Rob Herring wrote:
> On Tue, Sep 10, 2019 at 05:28:54PM +0200, Paul Kocialkowski wrote:
> > The Xylon LogiCVC display controller exports some GPIOs, which are
> > exposed as a dedicated driver.
> >=20
> > This introduces the associated device-tree bindings documentation.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../bindings/gpio/xylon,logicvc-gpio.txt      | 48 +++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/xylon,logicv=
c-gpio.txt
>=20
> Please consider using the new DT schema format.

Sure, I will give it a try.

> > diff --git a/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.=
txt b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt
> > new file mode 100644
> > index 000000000000..4835659cb90b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt
> > @@ -0,0 +1,48 @@
> > +Xylon LogiCVC GPIO controller
> > +
> > +The Xylon LogiCVC is a display controller that contains a number of GP=
IO pins,
> > +meant to be used for controlling display-related signals.
> > +
> > +In practice, the GPIOs can be used for any purpose they might be neede=
d for.
> > +
> > +The controller exposes GPIOs from the display and power control regist=
ers,
> > +which are mapped by the driver as follows:
> > +- GPIO[4:0] (display control) mapped to index 0-4
> > +- EN_BLIGHT (power control) mapped to index 5
> > +- EN_VDD (power control) mapped to index 6
> > +- EN_VEE (power control) mapped to index 7
> > +- V_EN (power control) mapped to index 8
> > +
> > +The driver was implemented and tested for version 3.02.a of the contro=
ller,
> > +but should be compatible with version 4 as well.
> > +
> > +Required properties:
> > +- compatible: Should contain "xylon,logicvc-3.02.a-gpio".
> > +- gpio-controller: Marks the device node as a gpio controller.
> > +- #gpio-cells: Should be 2. The first cell is the pin number and
> > +  the second cell is used to specify the gpio polarity:
> > +    0 =3D Active high,
> > +    1 =3D Active low.
>=20
> No need to define these standard flags again here.
>=20
> > +- gpio,syscon-dev: Syscon phandle representing the logicvc instance.
>=20
> Don't need this. It's the parent.

Note that this is de-facto already supported by the gpio-syscon driver: the
driver supports either an explicit syscon dev with this property or having =
the
parent as syscon.

I assumed that mentioning both was good for the sake of diversity, but let's
stick to parent node then.

> > +
> > +Example:
> > +
> > +	logicvc: logicvc@43c00000 {
> > +		compatible =3D "syscon", "simple-mfd";
>=20
> This device needs a device specific compatible. These 2 alone are not=20
> desired.

Thanks for the heads-up. I'll introduce a new compatible, describing a mfd
device then.

> Please define everything that's in the chip as much as you can.=20
>=20
> > +		reg =3D <0x43c00000 0x6000>;
> > +
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
> > +
> > +		logicvc_gpio: display-gpio@40 {
>=20
> Use standard node names: gpio@40
>=20
> You may not even need a child node here. It depends on what other child=
=20
> nodes you have and whether they have their own DT resources.
>=20
> > +			compatible =3D "xylon,logicvc-3.02.a-gpio";
> > +			reg =3D <0x40 0x40>;
> > +			gpio-controller;
> > +			#gpio-cells =3D <2>;
> > +			gpio,syscon-dev =3D <&logicvc>;
> > +		};
> > +	};
> > +
> > +Note: the device-tree node should either be declared as a child of the=
 logicvc
> > +syscon node or the syscon node should be precised with the gpio,syscon=
-dev
> > +property. Both are shown in the example above.
>=20
> Why? Just pick one and a child node is the preference.

That was for the sake of diversity, but having both at once could probably =
be
misleading too.

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2I0vAACgkQ3cLmz3+f
v9GGEggAkGDGF0qjUMVm5LCjsWQCdoEM4/ZESNSB/Br2iFJ79Q6ig9da0U8JtFC0
KGskjRdJXwMBG6IZtnYW5R/LPnMwGSGM5kPOMXlUsS773rxo8M+yY7cBrBC243Zv
YRzJrMDOGLa/RiTti7Cfmh5G01vyk7gWzHumIJcjpKvOfC7nFAUM521rgHsNx7Jt
j0/dp/wSQvKXhcAYmaB1a+cN4HNqx50qPo+EF9j7wMSNaJBIxvovZ/3Cv6FA8VtW
myZfpag94NyuFtPy5IB3gzAMBq/WzQhi9tSLt8aCuQm/wUE+6iT4qavRgECPUJxO
X7g8tyYka4VFz0kln6WyPdgmZ36NWg==
=RTko
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--
