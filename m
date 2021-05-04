Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5FE37293C
	for <lists+linux-gpio@lfdr.de>; Tue,  4 May 2021 12:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbhEDK5v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 May 2021 06:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbhEDK5u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 May 2021 06:57:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358A5C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  4 May 2021 03:56:56 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ldsjW-0003Ey-25; Tue, 04 May 2021 12:56:54 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ldsjV-0004Wn-GB; Tue, 04 May 2021 12:56:53 +0200
Date:   Tue, 4 May 2021 12:56:53 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] dt-bindings: gpio: introduce hog properties with
 less ambiguity
Message-ID: <20210504105653.bfhtqd7ildoipcqu@pengutronix.de>
References: <20210503210526.43455-1-u.kleine-koenig@pengutronix.de>
 <20210504025546.GA13356@sol>
 <20210504091459.clb5nkwgrgg43ixq@pengutronix.de>
 <20210504102454.GA21266@sol>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o22xqn4tcf5ikogd"
Content-Disposition: inline
In-Reply-To: <20210504102454.GA21266@sol>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--o22xqn4tcf5ikogd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, May 04, 2021 at 06:24:54PM +0800, Kent Gibson wrote:
> On Tue, May 04, 2021 at 11:14:59AM +0200, Uwe Kleine-K=F6nig wrote:
> > On Tue, May 04, 2021 at 10:55:46AM +0800, Kent Gibson wrote:
> > > On Mon, May 03, 2021 at 11:05:26PM +0200, Uwe Kleine-K=F6nig wrote:
> > > > For active low lines the semantic of output-low and output-high is =
hard
> > > > to grasp because there is a double negation involved and so output-=
low
> > > > is actually a request to drive the line high (aka inactive).
> > >=20
> > > +1 on clarifying the naming.
> > >=20
> > > > So introduce output-inactive and output-active with the same semant=
ic as
> > > > output-low and output-high respectively have today, but with a more
> > > > sensible name.
> > > >=20
> > >=20
> > > You use active/inactive here, but then asserted/deasserted in the pat=
ch.
> >=20
> > oops, this is an oversight.
> >=20
> > > My preference would be the active/inactive, which has more of a level
> > > feel, over the asserted/deasserted which feels more like an edge.
> > >=20
> > > And you still use active/inactive in the descriptions, so now we have=
 all
> > > three naming schemes in the mix. =20
> > >=20
> > > What made you change?
> >=20
> > I had active/inactive first, but Linux Walleij requested
> > asserted/deasserted:
> >=20
> > https://lore.kernel.org/r/CACRpkdbccHbhYcCyPiSoA7+zGXBtbL_LwLkPB3vQDyOq=
kTA7EQ@mail.gmail.com
>=20
> Thanks - I'd missed that.
>=20
> I don't suppose you happen to have a link to the gpiod_set_value()
> discussion that Linus mentions?

I found https://lore.kernel.org/linux-gpio/CACRpkdZAm5AML6cfrX_VrzyADASj1rs=
VXC3zwtfdo+aRSgX7fQ@mail.gmail.com/
but not that other thread Linus mentions there. I would have expected
https://lore.kernel.org/linux-gpio/?q=3DGPIO_OUT_ASSERTED to find it, but
it doesn't.

> > While I like active/inactive better than asserted/deasserted, the latter
> > is still way better than high/low, so I didn't discuss.
> >=20
>=20
> As a native English speaker, I find deasserted to be awkward - though it
> is the appropriate negative of asserted in this context.
>=20
> And there is no escaping the naming of the active-low, so I'm curious to

Ack, we shouldn't rename that to assert-low :-)

> know if there is a good reason not to go with active/inactive.

Linus: So we're already 3 out of 3 who would like active/inactive better
than asserted/deasserted. I'm curious about your preference, too.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--o22xqn4tcf5ikogd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCRKHIACgkQwfwUeK3K
7AlH9gf8DdMVtiC0OrBbdXaee6k89fVOdJ3UwusEmnNTp1wLZvio4mHFiDF3VZBM
7LHuaUJUO5B4dJ230CLlh+7DWB9fto2iurOuyRv7+sOaxWRFfdI7YW0V18BhQ6sF
SmIfDoEzki4h9fSV7H7j5R2zASlHFJTSv8oxygXXnBl2uCFuls6AebvFcTDMVC6X
8c9G8mbJoZzDCZrR53PZfwnheAA4eUaZF10AdIbDMAM+YdO8uJXtpMWCI7rlMIDR
+ssBiNsef4rOUE43SkU0B+yuaBuMjY11rmsZxGuP5zPJFlS17kYshogeo3gkm4eh
5EfJQpw8AdI/8ThabQstBVZ7ihf5ng==
=kd8L
-----END PGP SIGNATURE-----

--o22xqn4tcf5ikogd--
