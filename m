Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71E541F966C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 14:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729642AbgFOMUu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 08:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728510AbgFOMUu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 08:20:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E843CC061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 05:20:49 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jko6X-0006XX-EG; Mon, 15 Jun 2020 14:20:45 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jko6W-00011d-PY; Mon, 15 Jun 2020 14:20:44 +0200
Date:   Mon, 15 Jun 2020 14:20:44 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 4/4] gpio: pca953x: disable regmap locking for
 automatic address incrementing
Message-ID: <20200615122044.j2vdhpmhbpsw6qkb@taurus.defre.kleine-koenig.org>
References: <20200605134036.9013-1-andriy.shevchenko@linux.intel.com>
 <20200605134036.9013-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="karor7u4vxrgd5fs"
Content-Disposition: inline
In-Reply-To: <20200605134036.9013-4-andriy.shevchenko@linux.intel.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--karor7u4vxrgd5fs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2020 at 04:40:36PM +0300, Andy Shevchenko wrote:
> It's a repetition of the commit aa58a21ae378
>   ("gpio: pca953x: disable regmap locking")
> which states the following:
>=20
>   This driver uses its own locking but regmap silently uses
>   a mutex for all operations too. Add the option to disable
>   locking to the regmap config struct.
>=20
> Fixes: bcf41dc480b1 ("gpio: pca953x: fix handling of automatic address in=
crementing")
> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Ah, good catch. I assume that I didn't have aa58a21ae378 in my tree when
I created the patch that then became bcf41dc480b1.

Looks right

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe


--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--karor7u4vxrgd5fs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl7nZ5cACgkQwfwUeK3K
7AmUnQf+K33BgTGpJdxfmodrLhunXgVb2I8DNj175rg/lrghLFDXVN4ehwYh+LPe
U0CeweAZRsU+pSVYVG/RIGE8jcYDao7Gz8OIuaqzRaxK4VUHZBe8npdvKgm5lFss
nGVRj/n1ujafsaw3lwL1+aliINfIhJGOLOlULxXsIOICbqXjFQC0z5g12cPpwGG4
bfS6Zhy0dM/XlDinDMS59ldCBMQh6sIw+X6gdtbbsuybEtsxOTi4Ce9sZw0fHIlz
1auC8lI3GdP5BON3VccATUMx/QGefd7jdfX4mDmn59t1UG8L0Dwmr5/IqAexTFqA
yF9pM1AAAuS0eP6E9dK0fNmAjLT5sg==
=gIQm
-----END PGP SIGNATURE-----

--karor7u4vxrgd5fs--
