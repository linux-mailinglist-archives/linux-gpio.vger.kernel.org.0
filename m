Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A36717775
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 09:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234489AbjEaHCJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 03:02:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234308AbjEaHCG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 03:02:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35DA2129
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 00:01:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4Fpv-0003di-7v; Wed, 31 May 2023 09:01:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4Fpu-0042z3-GV; Wed, 31 May 2023 09:01:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4Fpt-009jaV-SE; Wed, 31 May 2023 09:01:33 +0200
Date:   Wed, 31 May 2023 09:01:33 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kent Gibson <warthog618@gmail.com>, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: introduce hog properties with
 less ambiguity
Message-ID: <20230531070133.r3ifkq7prs6evqki@pengutronix.de>
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
 <20230530151946.2317748-2-u.kleine-koenig@pengutronix.de>
 <4491320.LvFx2qVVIh@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dkzwybx5eucm6hyd"
Content-Disposition: inline
In-Reply-To: <4491320.LvFx2qVVIh@steina-w>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--dkzwybx5eucm6hyd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2023 at 08:18:14AM +0200, Alexander Stein wrote:
> Hi,
>=20
> Am Dienstag, 30. Mai 2023, 17:19:45 CEST schrieb Uwe Kleine-K=F6nig:
> > For active low lines the semantic of output-low and output-high is hard
> > to grasp because there is a double negation involved and so output-low
> > is actually a request to drive the line high (aka inactive).
> >=20
> > So introduce output-inactive and output-active with the same semantic as
> > output-low and output-high respectively have today, but with a more
> > sensible name.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/gpio/gpio.txt | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt
> > b/Documentation/devicetree/bindings/gpio/gpio.txt index
> > d82c32217fff..2f037bbd3ffa 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> > +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> > @@ -209,15 +209,21 @@ Required properties:
> >  - gpios:      Store the GPIO information (id, flags, ...) for each GPI=
O to
> >  	      affect. Shall contain an integer multiple of the number of=20
> cells
> >  	      specified in its parent node (GPIO controller node).
> > +
> >  Only one of the following properties scanned in the order shown below.
> >  This means that when multiple properties are present they will be sear=
ched
> >  in the order presented below and the first match is taken as the inten=
ded
> >  configuration.
> > -- input:      A property specifying to set the GPIO direction as input.
> > -- output-low  A property specifying to set the GPIO direction as output
> > with -	      the value low.
> > -- output-high A property specifying to set the GPIO direction as output
> > with -	      the value high.
> > +- input:             A property specifying to set the GPIO direction as
> > input. +- output-inactive:   A property specifying to set the GPIO
> > direction as output +		     with the inactive value=20
> (depending on the
> > line's polarity, +		     which is active-high by default)
> > +- output-active:     A property specifying to set the GPIO direction as
> > output +		     with the active value.
>=20
> I know this is essentially just renaming currently existing properties.
> But these mutual exclusive (boolean) properties make it impossible to cha=
nge=20
> them in DT overlay. Any ideas how to support changing the output level on=
GPIO=20
> hogs in DT overlay?

The universal way to address this would be to make it possible in dtbos
to delete properties (and nodes).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dkzwybx5eucm6hyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR28MwACgkQj4D7WH0S
/k7P3AgApOVqpoMR/VbkK8D8gZyuWGTzNm+lrRd5Muw4b/FbNM0bcWHe/EhykHzL
zwsoZfzcT45ccXO3jO/NBf80rZIW6+STbtvYQLyYH9eYbOtHqcDPojNPJo9ahQ4t
T9fAWY5w+hJFMQbIqdhWXe1TxuxkkzkY3aUWCI/I8ZAOPkLFqmfjJHA6FpcE6jCg
UR+Af4Pxim9XjKDhAa4/OLy85IJxS9/KrpZA2WIPtEsbRGITqEr4RmCHYLAdl6be
jkqCRB0+5ouUbBxk5Qsd6pwBBwHsJeOVQ7bQE8nLSE0VEzGjwNb7yTNYD90f8hNk
lWR72o4BssOswVGo2FCzwwOJrGulzQ==
=A88e
-----END PGP SIGNATURE-----

--dkzwybx5eucm6hyd--
