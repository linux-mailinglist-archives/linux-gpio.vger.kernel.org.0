Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76AA7552290
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jun 2022 19:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbiFTRDL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jun 2022 13:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240403AbiFTRDK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jun 2022 13:03:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907941AD88
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jun 2022 10:03:08 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3Knq-0004AZ-Sh; Mon, 20 Jun 2022 19:03:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3Kno-001fz2-6p; Mon, 20 Jun 2022 19:03:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3Kno-00028Q-P8; Mon, 20 Jun 2022 19:03:04 +0200
Date:   Mon, 20 Jun 2022 19:03:03 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sascha Hauer <kernel@pengutronix.de>
Subject: Re: [PATCH] gpio: grgpio: Fix device removing
Message-ID: <20220620170303.gbk45yvxtsthxcv6@pengutronix.de>
References: <20220620122933.106035-1-u.kleine-koenig@pengutronix.de>
 <CAHp75VcjBny6oXpcceoC=w6z0O=zAFA18HgAWV=ZWqV=93r3xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2mlipq3c74txwonr"
Content-Disposition: inline
In-Reply-To: <CAHp75VcjBny6oXpcceoC=w6z0O=zAFA18HgAWV=ZWqV=93r3xQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--2mlipq3c74txwonr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andy,

On Mon, Jun 20, 2022 at 06:13:21PM +0200, Andy Shevchenko wrote:
> On Mon, Jun 20, 2022 at 2:33 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > If a platform device's remove callback returns non-zero, the device core
> > emits a warning and still removes the device and calls the devm cleanup
> > callbacks.
> >
> > So it's not save to not unregister the gpiochip because on the next req=
uest
>=20
> safe
>=20
> > to a gpio the driver accesses kfree()'d memory. Also if an irq triggers,
>=20
> GPIO
> IRQ
>=20
> > the freed memory is accessed.
> >
> > Instead rely on the gpio framework to ensure that after gpiochip_remove=
()
>=20
> GPIO
>=20
> > all gpios are freed and so the corresponding irqs unmapped. (I'm think =
the
>=20
> GPIOs
> IRQs
> are unmapped
>=20
> I think
>=20
> > gpio framework doesn't guarantee that, but that's a bug there and out of
>=20
> GPIO
>=20
> > scope for this gpio driver to fix that.)
>=20
> GPIO
>=20
> > This is a preparation for making platform remove callbacks return void.
>=20
>=20
> ...
>=20
> What a bug are you seeing in the GPIO library? IIRC for IRQ over GPIO
> the GPIO holds the module reference count as well as GPIO device
> reference count. Am I wrong?

I don't see a bug, I just looked into gpiochip_remove() to check if it
ensures that all gpios go away and at one point is issues

	dev_crit(&gdev->dev,
		 "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");

and so I assumed that there is an issue, but maybe this isn't reachable
in practise?!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2mlipq3c74txwonr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKwqEUACgkQwfwUeK3K
7AngIQf9EtjKUw3dymcLd0/oDmivEsyblas5nevdRu8pW4APcmRiOfmYa309WbAK
p3OAit4Kb1HWCym3MGyAWpAI66N0DlfOwGlEfkxZrf+ECWP6U3qy2KaQyh7Sz2do
4zNSEYdh0W6LactO5FAu6XAAD1VSnsBQP63+UDVD9CJ0c3974s8yiyiq74se2w+6
QD9reJCk09QXaykxpI2TxkVEllfokyMAm8zYcfLBLyxCfEOJZRs1RlC9HWAohY8U
0VRB5J3epfkbnSZhQH2c3ZSj7B/bc1SixUQTPRoeSyiOZSc7mwUAQazLoBmyqQi2
M8pd573fpG/uc05t0wEsDJckD4AQFw==
=TqWZ
-----END PGP SIGNATURE-----

--2mlipq3c74txwonr--
