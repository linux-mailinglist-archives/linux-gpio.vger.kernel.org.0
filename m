Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDA03521D6
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Apr 2021 23:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235020AbhDAVph (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Apr 2021 17:45:37 -0400
Received: from www.zeus03.de ([194.117.254.33]:54030 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234978AbhDAVpg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Apr 2021 17:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=0re/4MhL/HVSNQlJ26P2awZytOoB
        TZt9SWkXNDLXpXg=; b=UelA4teuQjS5OAMHUdyUHY0u1WQXlz7ul/8OSE9VS99a
        1p0kZlVayGtboNEwx/aiKMa9yeocX2V5VRkRHqkB4RwKFXk971XeVPXjiu2iAMM/
        q7eZZ38+3keT5NMMUH/nofj4WTd3a3wlA+eMiCnXwxBykKVLNaOFha8U21X0am8=
Received: (qmail 1102382 invoked from network); 1 Apr 2021 23:45:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2021 23:45:33 +0200
X-UD-Smtp-Session: l3s3148p1@msp2JvC+HI0gAwDPXw1NAMt9GTaBIvNo
Date:   Thu, 1 Apr 2021 23:45:28 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH RFC/RFT 1/1] misc: add simple logic analyzer using polling
Message-ID: <20210401214528.GA892@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20210330085655.12615-1-wsa+renesas@sang-engineering.com>
 <20210330085655.12615-2-wsa+renesas@sang-engineering.com>
 <CACRpkdbABbvxRLGhzmiQ8kTmwHsRqevvmDpfLKv-dUhEHVpF6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <CACRpkdbABbvxRLGhzmiQ8kTmwHsRqevvmDpfLKv-dUhEHVpF6g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

> I am a great supporter of this idea.

Great, thanks!

> When other debugging tools for GPIO got DT bindings it was concluded that
> it is possible to create bindings like this for debugging without even
> specifying
> any formal bindings. They are just for debugging after all.

So, I remove the yaml file and add the bindings to the documenation,
then? Makes sense to me because it is for debugging and not really
official.

> I would consider housing this tool under drivers/gpio actually.
> We have other funky things like gpio-sim and gpio-aggregator
> so why not.

Heh, my first draft was placed in drivers/gpio. I'd be happy to have it
there.

> I would create a Kconfig menu with "GPIO hardware hacking tools".
>=20
> But Bartosz would need to agree on that idea.

Since he agreed, I'll update this in v2.

> > +config GPIO_LOGIC_ANALYZER
> > +       tristate "Simple GPIO logic analyzer"
> > +       depends on GPIOLIB || COMPILE_TEST
> > +       help
>=20
> depends on EXPERT

Yes, good point!

All the best,

   Wolfram


--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBmPvMACgkQFA3kzBSg
KbYdLA/+IU2QMANxwSFRdg2A9RK83WiwfbmbESqKoyLf/8u/F0JwkANKUW11ECxO
whmec/QfqCFWNQxyJEA50B+M5/hRfl4cRJFfzXR8tXJrRjA06hw9NAibzlHtOLoX
y5dq89MeMwnkJi0oZAE4s+CobDvuHLRU0XHW5IaQDKoai4TK+WTla5dmqbUmGvXK
zo0jLm+EPS8lWBxZBLTd0jYqQMFJKhNUQ+1nQmDVc6t4H9lpHMeDow3wCcXqUgpI
10Lydp0sqX7gaMJ0O/x3W/X0/XzuRwS9kgNLeTx6qJbkJCN9uarfOaUa4ho5jneW
PCWxE0AB9YEyKLlvRS9NptlOpeLo1pz+kqvwnymk9FTciKi7+ei7JKCtN6LH+X6K
TUtfg9/iYQtW4i55CCWsGs+4JYnlrmFkzFKlv2d62kJ+TFh3tPa6iKYOAMoWJISs
oyFKLLfWZ5y98i5qifaVaa8PCwdTzQW7l52VlR/XOCFXVc4lET77UveFrMNe/5ZB
5vzgNhQVzYgIWDQHO2bz445oUp5ZEvOKTaT98FrZnjfSSpW9CX29v2ej6bJEH8aG
WpThl2pNgZaR7PewhLPMETS+q9ixNhkwGqlPDLTP3ftDYdC03nNDM4wChFpQV5d/
b1yFsmOAwIRUd+xhf8EZO39Vgx7pqf0FG3Iq+D0nysRwq/Mrq4c=
=9CKg
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
