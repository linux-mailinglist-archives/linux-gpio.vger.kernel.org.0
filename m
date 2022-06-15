Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE82354C13E
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 07:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242197AbiFOFnM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 01:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345820AbiFOFnK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 01:43:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51BE527CE0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jun 2022 22:43:08 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o1Lo1-0002xc-BZ; Wed, 15 Jun 2022 07:43:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o1Lnx-000cl8-Bh; Wed, 15 Jun 2022 07:43:02 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o1Lnx-00GO9I-Rg; Wed, 15 Jun 2022 07:43:01 +0200
Date:   Wed, 15 Jun 2022 07:43:01 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Lee Jones <lee.jones@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] gpio: ucb1400: Remove platform setup and teardown support
Message-ID: <20220615054301.cnb6fdwciuzt3l67@pengutronix.de>
References: <20220614194802.269738-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="asyd52ppd76oscsq"
Content-Disposition: inline
In-Reply-To: <20220614194802.269738-1-u.kleine-koenig@pengutronix.de>
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


--asyd52ppd76oscsq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[Cc +=3D pxa maintainers and a few people I talked to about this driver in
irc yesterday]

On Tue, Jun 14, 2022 at 09:48:02PM +0200, Uwe Kleine-K=F6nig wrote:
> There is no user of these callbacks. The motivation for this change is
> to stop returning an error code from the remove callback.
>=20
> This is a preparation for making platform remove callbacks return void.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

A side note to this driver:

In the probe routine there is a check at the start:

	struct ucb1400_gpio *ucb =3D dev_get_platdata(&dev->dev);

        if (!(ucb && ucb->gpio_offset)) {
                err =3D -EINVAL;
                goto err;
        }

So the driver doesn't bind unless there is platdata and it has
gpio_offset !=3D 0. (The decade before last called and wants its fixed
gpio numbers back :-)

platdata is assembled in drivers/mfd/ucb1400_core.c:ucb1400_core_probe()
using:

	struct ucb1400_pdata *pdata =3D dev_get_platdata(dev);
	...
	if (pdata)
		ucb_gpio.gpio_offset =3D pdata->gpio_offset;

All machines using this ucb1400 mfd (i.e. arch/arm/mach-pxa/balloon3.c,
arch/arm/mach-pxa/colibri-pxa270.c, arch/arm/mach-pxa/vpac270.c) all
don't set the .gpio_offset member in their ucb1400_pdata.

So the gpio driver is effectively unused and alternatively could just be
removed entirely. Also there seems to be some pending spring cleanup, so
the pxa boards might just be removed soon, which looks like a good
opportunity to drop the driver, too.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--asyd52ppd76oscsq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKpcWIACgkQwfwUeK3K
7Ak7Bgf/VMMHo1bjXsw8AH0KsnCHmXkyjXiIUe6L1fS/kq6TkrJ/n79Xisqd0Bpj
pqzH0165G6uJTF5kRWLZrqtb2LSmseXIGDC+thPeYX3l8jeTGBcmNu77IxmFBnCE
tVrb+eKTiuSGR5Sxl4M/c2EfzDfgvlQ7s98rYhOrg6A9nvk1++KHuBewtZUk0rdk
v6wFv3p5O2++Bj9W5YxV7WaEHKSUdWHF5QxeMO7YoJjMUdmVcgiue4gYpvsqObj7
7SHrEQhHs0rHmPdnTR8rbJJ8hSRRpwMCm4uzxrVRJ1JjqHATuliN1aCoIlO0VD+F
A++rbxcPPIMIqjcoMb2ONXyEY4C05A==
=5q0o
-----END PGP SIGNATURE-----

--asyd52ppd76oscsq--
