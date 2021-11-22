Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F7D458DA6
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 12:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239167AbhKVLqN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 06:46:13 -0500
Received: from www.zeus03.de ([194.117.254.33]:52174 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233502AbhKVLqN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Nov 2021 06:46:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=PnCEnaUq3vutr+dPiGSuA0WqLJ48
        BXfWQsyovlkEAsc=; b=iDmohpgz9tJYZIe8T/HCQjycGKzsSE5TFhnU88yoB2Eh
        A7b3Ue6FShneOO8mnAkQ32en8OYd92zxskknXm5L5pgY6ayZLrE9ZPowJjLb20Gr
        dO/XWPe5FXF7RDXf9S+NILjdSU8An2RzeSAvwMnl6X5X77vvEVnqECnpdTkw3nE=
Received: (qmail 782451 invoked from network); 22 Nov 2021 12:43:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Nov 2021 12:43:04 +0100
X-UD-Smtp-Session: l3s3148p1@Xy64IF/ROt0gAwDPXwnCAFkDAkP2hjT7
Date:   Mon, 22 Nov 2021 12:43:04 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <YZuCSNeT3xeKlCv7@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210918083307.3195-1-wsa+renesas@sang-engineering.com>
 <20210918083307.3195-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdXYpK861-=Esa3GqjkNMAqzLBiGN5NQKpHNo5d0w=FWmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="II7g/Il5Yng/Np5H"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXYpK861-=Esa3GqjkNMAqzLBiGN5NQKpHNo5d0w=FWmQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--II7g/Il5Yng/Np5H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

thanks for the review!

> Note that this is the second posting using v2, and the previous version
> was simultaneously v1 and v3 (branch renesas/gpio-logic-analyzer-v3).
> Resetting version numbers may confuse people and tools (e.g. b4).

Well, there was an "RFC v2" once but to avoid confusion, I'll go with v5
for the next iteration. Only one thing I did not pick up for v5 yet.

> > +Samples 50us at 2MHz waiting for a falling edge on channel 2. CPU and =
instance as above:
>=20
> =C2=B5s

I'd like to stay ASCII here because the script may run on limited
systems without UTF8 support. Too anxious?

All the best,

   Wolfram


--II7g/Il5Yng/Np5H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGbgkQACgkQFA3kzBSg
KbZfiA/+KYdF+8E2WvXfTcfXxNcy9a33+/K2ttZSzx9q69G3HfL5XJr0xhJsAyib
F+YDUNM99igIvxGMOMLDnMauVyDQwtHcG9p1M9Ua1uKREPV8qy1uTt1sBAVjTTDN
MVaps/K/qlUYHMYYLlfWyuy4p4iCsu6GE7UAGFVxKN9Mhsw98F0a1+my2P0SC+5T
7JYLR+QYc6pfRch7bSX+y1ossRzvufpbDRhS8gF6Xljr0aLqwOyoBW06whK7UseM
H7NveZnj8WfQwWIH0/XdelzSDFEN+PwjyYGeUhs0AByam9ptAEbMnwiW2y01Qx7N
3KqaO9EWJZq52wv7VwqzPZf77oLoOGzkfTcNle530UyEvhJkJEOIzMpt3tR5U0a8
Anu3ETkdDnLSCiYpeEVRc8KD6bJcflHMQdEHmCODE4EjLbUzKQlQeOlxs5u1CIZ5
22oipOZBnQIe/Xw+L1rIHJkbEgAf0IDnhzVKDwQDadDunlgrRvqSfo2AAwdphsVM
1NkFY9JR4yI9ZyURTntkV1N7NilOx6zR8kPc3jzopVBYX1bPbszW9TTx3NCAe35w
feIP2dTSU6n7gX1tx0LsexWD3jxJRvPIDxG3IlsSx23Jv+2c9MHut4yuO3GIkeoE
A+ksDvEP1yGt6hRxYGX8G1LEhP3bczm/Qjbn1lf+NSenAiGco8M=
=OdU3
-----END PGP SIGNATURE-----

--II7g/Il5Yng/Np5H--
