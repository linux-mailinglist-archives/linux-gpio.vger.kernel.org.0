Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6936F2FA3D6
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 15:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392922AbhARO6R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 09:58:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391682AbhARO6F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 09:58:05 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A5CC061574
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 06:57:25 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l1Vy6-00037n-CY; Mon, 18 Jan 2021 15:57:22 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l1Vy6-0007Uf-2l; Mon, 18 Jan 2021 15:57:22 +0100
Date:   Mon, 18 Jan 2021 15:57:21 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/2] dt-bindings: gpio: pca953x: increase allowed length
 for gpio-line-names
Message-ID: <20210118145721.6puoqfd6jx3x76jh@pengutronix.de>
References: <20210113194952.104734-1-u.kleine-koenig@pengutronix.de>
 <20210113194952.104734-2-u.kleine-koenig@pengutronix.de>
 <CACRpkdbVKzE_pe0mPb4H2c0RVJGxEtiFEfMpTCoEO+7qdVBHFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3vlece4lwqrljhc3"
Content-Disposition: inline
In-Reply-To: <CACRpkdbVKzE_pe0mPb4H2c0RVJGxEtiFEfMpTCoEO+7qdVBHFQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--3vlece4lwqrljhc3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 03:36:08PM +0100, Linus Walleij wrote:
> On Wed, Jan 13, 2021 at 8:50 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
>=20
> > Some supported chips (e.g. pca9505) support 40 chips. To be able to give
>=20
> 40 lines I guess? (No big deal. Everyone understand what you mean.)

Yes, I noticed that myself and fixed that in v2
(https://lore.kernel.org/r/20210115164658.187681-1-u.kleine-koenig@pengutro=
nix.de)

> > each line a name the length of the gpio-line-names property must be
> > allowed to contain up to 40 entries.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Who will pick up this series (preferable v2 instead of this (implicit)
v1)? Will they notice this Reviewed-by?

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3vlece4lwqrljhc3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAFoc8ACgkQwfwUeK3K
7Alp+gf+MbTZQlKr9dm/t79pr4utXSUvEU8jo/ZumncN9bspoecUEgzuGGYuEqGJ
N5wpDqnpBz+UPdy+P2rCXNdlAZtPQT2f0w3DmllGUG7NTV0F+vFJG8v6H2I6f9Cv
Pi+iqXKSme1BkQNOrYTQCLKn1nb7fzBYQynRJvPDtuCxkue4LCorAL+L6ZJjaaYr
lts/1V6Lrifvyh2hVQBjHkaEI9Q8KtP2LZQNDKnkB9Bt6oheT+YDZFztRJPA4RXN
fz8zZE5exGK8dSCvQTYdRvg40w80tqb908rFKCQivpEGbPqy533pFiz7YhOjvWvs
G6U+JdYV0/sWPc9XybNDedEf8TLArA==
=YSCe
-----END PGP SIGNATURE-----

--3vlece4lwqrljhc3--
