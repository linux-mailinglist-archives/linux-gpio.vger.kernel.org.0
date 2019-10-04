Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D086DCC259
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 20:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729932AbfJDSM3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 14:12:29 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:38207 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728095AbfJDSM2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 14:12:28 -0400
X-Originating-IP: 132.205.229.217
Received: from aptenodytes (unknown [132.205.229.217])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A878A1BF203;
        Fri,  4 Oct 2019 18:12:24 +0000 (UTC)
Date:   Fri, 4 Oct 2019 14:12:22 -0400
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: Document the Xylon LogiCVC
 multi-function device
Message-ID: <20191004181222.GA16927@aptenodytes>
References: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com>
 <20190927100407.1863293-3-paul.kocialkowski@bootlin.com>
 <20190927221550.GA28831@bogus>
 <20191004144551.GR18429@dell>
 <CAL_Jsq+J9z3zzENZxXwjjsVMbFr8uYpXX6jYbCqdQEKBQXOu9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+J9z3zzENZxXwjjsVMbFr8uYpXX6jYbCqdQEKBQXOu9A@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 04 Oct 19, 11:09, Rob Herring wrote:
> On Fri, Oct 4, 2019 at 9:45 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Fri, 27 Sep 2019, Rob Herring wrote:
> >
> > > On Fri, Sep 27, 2019 at 12:04:04PM +0200, Paul Kocialkowski wrote:
> > > > The LogiCVC is a display engine which also exposes GPIO functionali=
ty.
> > > > For this reason, it is described as a multi-function device that is=
 expected
> > > > to provide register access to its children nodes for gpio and displ=
ay.
> > > >
> > > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > ---
> > > >  .../bindings/mfd/xylon,logicvc.yaml           | 50 +++++++++++++++=
++++
> > > >  1 file changed, 50 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mfd/xylon,log=
icvc.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/mfd/xylon,logicvc.ya=
ml b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
> > > > new file mode 100644
> > > > index 000000000000..abc9937506e0
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
> > > > @@ -0,0 +1,50 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +# Copyright 2019 Bootlin
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: "http://devicetree.org/schemas/mfd/xylon,logicvc.yaml#"
> > > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > > +
> > > > +title: Xylon LogiCVC multi-function device
> > > > +
> > > > +maintainers:
> > > > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > +
> > > > +description: |
> > > > +  The LogiCVC is a display controller that also contains a GPIO co=
ntroller.
> > > > +  As a result, a multi-function device is exposed as parent of the=
 display
> > > > +  and GPIO blocks.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - enum:
> > > > +          - xylon,logicvc-3.02.a
> > > > +      - const: syscon
> > > > +      - const: simple-mfd
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +select:
> > > > +  properties:
> > > > +    compatible:
> > > > +      contains:
> > > > +        enum:
> > > > +          - xylon,logicvc-3.02.a
> > >
> > > I've seen a couple of these with 'syscon' today, so I fixed the schema
> > > tool to just exclude 'syscon' and 'simple-mfd' from the generated
> > > 'select'. So you can drop select now.
> >
> > Does this need to happen before this patch can be applied?
>=20
> Drop the 'select'? Yes that should happen first.

I'll definitely respin the series for a v3 soon so no worries, I'll get rid
of it.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2Xi4YACgkQ3cLmz3+f
v9HpAgf/a8qK5j4yyiRTtn9wRE0GwK+Ammm9c6YApasFhMqQ4fMGrYZThmMNepOB
/VwPfRJx6qFbQ33IAZ/J3zK2T61jYlybouAEm7h+UO2W/9RazqGyx2NBPSq1t5Q7
wbTHABnhrs06T8bDZTiKKeFV28gnCRPE3EkNLdeydpTZ7lbtW85VEP56Ua5xkVv1
RzvJOIvd8BzqECyd95iZOe1G+TXC89AMQ5W8pMnpLNBnM3mwb0RvWSVHJ46u/Tkm
NMxyUqe5jnj6fWeTFe0613OwraqgqBtU7smGdfKf09m8AsOyawxgBVfgrSvvDObT
R5OlwonQzTy2wCjL5uK4Q75gpOd7qw==
=eX7p
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
