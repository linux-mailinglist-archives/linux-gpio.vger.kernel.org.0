Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 730B6BB5F5
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2019 15:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439767AbfIWN7M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Sep 2019 09:59:12 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:33265 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437571AbfIWN7M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2019 09:59:12 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4E620E0012;
        Mon, 23 Sep 2019 13:59:09 +0000 (UTC)
Date:   Mon, 23 Sep 2019 15:59:08 +0200
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
Subject: Re: [PATCH 2/3] dt-bindings: gpio: Add binding document for xylon
 logicvc-gpio
Message-ID: <20190923135908.GC57525@aptenodytes>
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
 <20190910152855.111588-2-paul.kocialkowski@bootlin.com>
 <CACRpkdYrTCnrW6-28+RhdMZ4cB5VcqG6T-5aABvvEgiZ3iri2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline
In-Reply-To: <CACRpkdYrTCnrW6-28+RhdMZ4cB5VcqG6T-5aABvvEgiZ3iri2Q@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 12 Sep 19, 10:19, Linus Walleij wrote:
> On Tue, Sep 10, 2019 at 4:29 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
>=20
> > The Xylon LogiCVC display controller exports some GPIOs, which are
> > exposed as a dedicated driver.
> >
> > This introduces the associated device-tree bindings documentation.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> (...)
> > +The controller exposes GPIOs from the display and power control regist=
ers,
> > +which are mapped by the driver as follows:
> > +- GPIO[4:0] (display control) mapped to index 0-4
> > +- EN_BLIGHT (power control) mapped to index 5
> > +- EN_VDD (power control) mapped to index 6
> > +- EN_VEE (power control) mapped to index 7
> > +- V_EN (power control) mapped to index 8
>=20
> This should be reflected in the gpio-line-names in the example
> and in your device trees.

Thanks, I didn't know about it until now!

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2Iz6wACgkQ3cLmz3+f
v9Ge/Qf/V4OjLLSvFC8UlTYdc4Kdoazi93MSGndrpRjnjx6zjgxVIN1iSUOtPUWk
t9JqNHAsIKfhKfVZ3gOosU/q7hSNlAY/3U9F73VxErLqKhyrQRqJO9obel/eITE5
/7ATIkhm+2Ejjn24oHZn9RaqJQhi0JT7IaYmwBGssq0ZYyF2IF+rxUFpDioj4iia
j2Iog14fAHWjP9a4eeNz6rjf7M+RuTgfAQ4c/4r7xkp2t39s5puSYFU3EZ4mOuA+
8OcqcqqF0fGY8mj3dBDe/U7IzpoT2Nk9e1Qj/Zy+PsIgZbUG06kJ5AgNjXGuADi0
qzuNWl1mhPC3VNLXdPqTwLLP+MgE1Q==
=h+JT
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
