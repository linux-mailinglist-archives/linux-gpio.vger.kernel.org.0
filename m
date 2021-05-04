Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2B13727EC
	for <lists+linux-gpio@lfdr.de>; Tue,  4 May 2021 11:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhEDJQA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 May 2021 05:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbhEDJP5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 May 2021 05:15:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CE1C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  4 May 2021 02:15:03 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ldr8v-0008Mo-2Q; Tue, 04 May 2021 11:15:01 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ldr8t-00074Q-HS; Tue, 04 May 2021 11:14:59 +0200
Date:   Tue, 4 May 2021 11:14:59 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] dt-bindings: gpio: introduce hog properties with
 less ambiguity
Message-ID: <20210504091459.clb5nkwgrgg43ixq@pengutronix.de>
References: <20210503210526.43455-1-u.kleine-koenig@pengutronix.de>
 <20210504025546.GA13356@sol>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iozk6663kquxk4ye"
Content-Disposition: inline
In-Reply-To: <20210504025546.GA13356@sol>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--iozk6663kquxk4ye
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, May 04, 2021 at 10:55:46AM +0800, Kent Gibson wrote:
> On Mon, May 03, 2021 at 11:05:26PM +0200, Uwe Kleine-K=F6nig wrote:
> > For active low lines the semantic of output-low and output-high is hard
> > to grasp because there is a double negation involved and so output-low
> > is actually a request to drive the line high (aka inactive).
>=20
> +1 on clarifying the naming.
>=20
> > So introduce output-inactive and output-active with the same semantic as
> > output-low and output-high respectively have today, but with a more
> > sensible name.
> >=20
>=20
> You use active/inactive here, but then asserted/deasserted in the patch.

oops, this is an oversight.

> My preference would be the active/inactive, which has more of a level
> feel, over the asserted/deasserted which feels more like an edge.
>=20
> And you still use active/inactive in the descriptions, so now we have all
> three naming schemes in the mix. =20
>=20
> What made you change?

I had active/inactive first, but Linux Walleij requested
asserted/deasserted:

https://lore.kernel.org/r/CACRpkdbccHbhYcCyPiSoA7+zGXBtbL_LwLkPB3vQDyOqkTA7=
EQ@mail.gmail.com

While I like active/inactive better than asserted/deasserted, the latter
is still way better than high/low, so I didn't discuss.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--iozk6663kquxk4ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCREJAACgkQwfwUeK3K
7AkrfwgAkNBsGyYU0q3vyW1bIkQhuFEKOvbVybJFe4mmd0hp8LhRWJQ9ZsyGTjmj
5XAbdwMFerh1LImzb1kevXQI+ohQWGN7gL/ZTY9TRH/2q1MmPB9/G2mORlBFFddY
mDflVdzcB1Hd7vh7tX378HZDeD/2e24rSI9FN4kvrgyseFBvWQpSe8uP3HGEg3w8
2BxSNke1O/t8PY0D2Hg54xLKZEDf/LHqH9TwAjbi2Pe4fW+Kz0u0694qq9aqPNCU
nvahhBYxqk6KsOdyPkcCsfoAUlh2KfBFsonApfgFTExLFmjeSRkfW1BOln0Vjn+P
uqF7drJXkTHqZ5Oz5PD35hmzlPjy+Q==
=yUDN
-----END PGP SIGNATURE-----

--iozk6663kquxk4ye--
