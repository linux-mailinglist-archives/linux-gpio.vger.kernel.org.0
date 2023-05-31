Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19D3C71777E
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 09:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232993AbjEaHD4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 03:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbjEaHDz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 03:03:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED3D8F
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 00:03:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4Fs8-0003ps-Tx; Wed, 31 May 2023 09:03:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4Fs7-0042zE-Sk; Wed, 31 May 2023 09:03:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4Fs7-009jdE-55; Wed, 31 May 2023 09:03:51 +0200
Date:   Wed, 31 May 2023 09:03:51 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Conor Dooley <conor@kernel.org>
Cc:     devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        kernel@pengutronix.de, Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: introduce hog properties with
 less ambiguity
Message-ID: <20230531070351.gjh62dssldwworc2@pengutronix.de>
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
 <20230530151946.2317748-2-u.kleine-koenig@pengutronix.de>
 <20230530-gag-doorway-e13660d45161@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u7fezraaxecn7zsk"
Content-Disposition: inline
In-Reply-To: <20230530-gag-doorway-e13660d45161@spud>
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


--u7fezraaxecn7zsk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Conor,

On Tue, May 30, 2023 at 11:20:38PM +0100, Conor Dooley wrote:
> On Tue, May 30, 2023 at 05:19:45PM +0200, Uwe Kleine-K=F6nig wrote:
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
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Document=
ation/devicetree/bindings/gpio/gpio.txt
> > index d82c32217fff..2f037bbd3ffa 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> > +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> > @@ -209,15 +209,21 @@ Required properties:
> >  - gpios:      Store the GPIO information (id, flags, ...) for each GPI=
O to
> >  	      affect. Shall contain an integer multiple of the number of cells
> >  	      specified in its parent node (GPIO controller node).
> > +
> >  Only one of the following properties scanned in the order shown below.
> >  This means that when multiple properties are present they will be sear=
ched
> >  in the order presented below and the first match is taken as the inten=
ded
> >  configuration.
> > -- input:      A property specifying to set the GPIO direction as input.
> > -- output-low  A property specifying to set the GPIO direction as outpu=
t with
> > -	      the value low.
> > -- output-high A property specifying to set the GPIO direction as outpu=
t with
> > -	      the value high.
> > +- input:             A property specifying to set the GPIO direction a=
s input.
> > +- output-inactive:   A property specifying to set the GPIO direction a=
s output
> > +		     with the inactive value (depending on the line's polarity,
> > +		     which is active-high by default)
> > +- output-active:     A property specifying to set the GPIO direction a=
s output
> > +		     with the active value.
> > +
> > +For backwards compatibility "output-low" and "output-high" are support=
ed as
> > +aliases for "output-inactive" and "output-active" respectively. Their =
usage is
> > +misleading for active-low outputs, so their use is discouraged.
>=20
> Seems like an improvement to me,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

> Rob did note that gpio-hog.yaml in dt-schema would need to be updated,

This is a followup-change in a separate repository once the change
under discussion is in mainline, right?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--u7fezraaxecn7zsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR28VYACgkQj4D7WH0S
/k4flAf+K42mYop8wPcvFMIl/i4l6r7SKEAKZbfSbfdOolsMgbEE+5MjWKwwFhNk
S+pzyZpn4Qy8bxnhnAnmUbXHCjrHOJUCZM1pzqfLKI4spKXPZE+t7SxYbF7KJUKj
RuoSTrYkpwBdxBr7xWtmcbPbBR7mCOyrb6wfAJb7ObuKzMkbb5vD4vrhyRY4jh0P
AtS82UPY5wTtARBvuyCFC7qTNeoy0gmMe4nsC9GRVL75cSMNfTNqAZTIthqj6pWw
JrQ5NnT/YHNmD/ty6qoEVFdYIMkkkm1nMLbCc3IvtCcOIDWBkygCSnXyw2N230rF
j7NlzvgMGhuDtevy1sdBiQzJ7tnIsw==
=5lC0
-----END PGP SIGNATURE-----

--u7fezraaxecn7zsk--
