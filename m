Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7117530DA3
	for <lists+linux-gpio@lfdr.de>; Mon, 23 May 2022 12:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232713AbiEWJJu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 May 2022 05:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbiEWJJt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 May 2022 05:09:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52BA4614B
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 02:09:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nt44O-0003Lo-5I; Mon, 23 May 2022 11:09:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nt44O-0043KM-4f; Mon, 23 May 2022 11:09:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nt44L-00BZaj-Lz; Mon, 23 May 2022 11:09:41 +0200
Date:   Mon, 23 May 2022 11:09:41 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        kernel@pengutronix.de,
        Michael Hennerich <michael.hennerich@analog.com>
Subject: Re: [PATCH] gpio: adp5588: Remove support for platform setup and
 teardown callbacks
Message-ID: <20220523090941.fvtjo4lykqgmaqvj@pengutronix.de>
References: <20220523083947.840708-1-u.kleine-koenig@pengutronix.de>
 <CACRpkdb10ZdARL1cmAkYVeVzJz4HQs8djrNHs50k7hWfCZxrjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="znhwerwx7y2qsmeo"
Content-Disposition: inline
In-Reply-To: <CACRpkdb10ZdARL1cmAkYVeVzJz4HQs8djrNHs50k7hWfCZxrjg@mail.gmail.com>
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


--znhwerwx7y2qsmeo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2022 at 10:43:20AM +0200, Linus Walleij wrote:
> On Mon, May 23, 2022 at 10:40 AM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
>=20
> > If the teardown callback failed in the gpio driver, it fails to free the
> > irq (if there is one). The device is removed anyhow. If later on the irq
> > triggers, all sorts of unpleasant things might happen (e.g. accessing
> > the struct adp5588_gpio which is already freed in the meantime or start=
ing
> > i2c bus transfers for an unregistered device). Even before irq support =
was
> > added to this driver, exiting early was wrong; back then it failed to
> > unregister the gpiochip.
> >
> > Fortunately these callbacks aren't used any more since at least blackfin
> > was removed in 2018. So just drop them.
> >
> > Note that they are not removed from struct adp5588_gpio_platform_data
> > because the keyboard driver adp5588-keys.c also makes use of them.
> > (I didn't check if the callbacks might have been called twice, maybe th=
ere
> > is another reason hidden to better not call these functions.)
> >
> > This patch is a preparation for making i2c remove callbacks return void.
> >
> > Fixes: 80884094e344 ("gpio: adp5588-gpio: new driver for ADP5588 GPIO e=
xpanders")
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Good riddance!
> But also remove the setup and teardown prototypes in
> include/linux/platform_data/adp5588.h

Please reread the commit log. They were not remove on purpose. If you
missed that part, you also missed half of the "fun". :-P

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--znhwerwx7y2qsmeo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKLT1IACgkQwfwUeK3K
7Am+qAgAiUeeb8OlpLKkvHYfPyjiahqmxFJO0h3drmr/Nn6Bf4yugXiq5vrP237M
cfJvvxT9gFknn7+knPCS+yvAlAf+m/EDb5xnbN9QGduWO+aQdp3DPXnGGSZ32mN+
sPxjMoxL8bssqokAmI17sYdcqHa5NuKVnR7SJrT3i0SW1I0oY72ybgzd4pIx4P1K
Wh5I6VrRYqFzB8g2B7a7pKZSmt5xOsb7LmaGnuIIS+uyDQ584qFN+YYCurNJCUSw
UQBAoBQ94ZJraLyJeGlfixxydz9vdCuCB8Mx5aO+BpIi+kS3ZBfs3FGrxUQqXPxI
JAvgyy6AOa4lcIgiPjjyqcG+R/H+qQ==
=1WWx
-----END PGP SIGNATURE-----

--znhwerwx7y2qsmeo--
