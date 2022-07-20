Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18FD357B04D
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jul 2022 07:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbiGTFZd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jul 2022 01:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiGTFZc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jul 2022 01:25:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B372065564
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 22:25:30 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oE2DA-0005ci-V2; Wed, 20 Jul 2022 07:25:29 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oE2D9-0023Qr-IN; Wed, 20 Jul 2022 07:25:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oE2D8-006JoD-PP; Wed, 20 Jul 2022 07:25:26 +0200
Date:   Wed, 20 Jul 2022 07:25:24 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sascha Hauer <kernel@pengutronix.de>
Subject: Re: Is a multiplexer using latches a gpio controller?
Message-ID: <20220720052524.fnpukrakvbdq7ns4@pengutronix.de>
References: <20220718202205.ssf3k2dqkuvc6bgm@pengutronix.de>
 <CACRpkdaBO=JzokGUF6uXZc7ASVD7LjqBxTLGwX-FShM=A9gw9A@mail.gmail.com>
 <20220719074919.uawwqoefcgi4rjvt@pengutronix.de>
 <CAHp75Vc=0qxzdD4Q3xG-1Ztf9tX+4Xb-KSpPE0MjCBfAPPSG+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ultsglwvexxi6xjv"
Content-Disposition: inline
In-Reply-To: <CAHp75Vc=0qxzdD4Q3xG-1Ztf9tX+4Xb-KSpPE0MjCBfAPPSG+Q@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ultsglwvexxi6xjv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jul 19, 2022 at 11:13:11AM +0200, Andy Shevchenko wrote:
> On Tue, Jul 19, 2022 at 9:50 AM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Tue, Jul 19, 2022 at 12:54:18AM +0200, Linus Walleij wrote:
>=20
> ...
>=20
> > (And if you have a "native" spi bus, even better.) This way the
> > nxp,74hc4094 driver becomes way easier.
>=20
> Just to say (point out again?) that
> 1) The SPI can be bitbanging in this case, so GPIO lines can be used;

Yeah, in my example GPIO lines were used.

> 2) We have a driver already, which is called gpio-74x164.

I'm also aware. My reply was on Linus's binding example which *only*
supports bit-banging and which is different to what the 74x164 driver
consumes.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ultsglwvexxi6xjv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLXkcEACgkQwfwUeK3K
7AlEYggAgBZotOIPdw0cbkqdP8oQeBTG3plQD7EVYQkOsg58lJmn1p9g5vTHxfuo
rBoK6JomYmvfL1DSqf7bhGazXhh4KOSBce8yAlZZUPesx9+HVI5FR9Z+AoptyqYL
7ike6jPsEdS/E1Ns+TCXR3BbvskFa5m6EiXQfb9u5dJLpi4qJUH6LiiUp100Q9kR
atVXCGu3O2i7wSq33cOvwx40XvvOUdy0WzOtIzI2tB7p1Fief3GFs/6mzdKt8Rh+
9CE4wwsTf2EquHM6tMnmLk2tJu3fNOPP++0pUzSd8e50VCQv713KLATk+cUgeww9
2l3hucqzJr3TW2qo9JJ1RHQBvhLcSg==
=LxDD
-----END PGP SIGNATURE-----

--ultsglwvexxi6xjv--
