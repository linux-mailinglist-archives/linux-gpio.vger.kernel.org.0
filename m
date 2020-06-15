Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9351F9830
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 15:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730097AbgFONUa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 09:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729916AbgFONUa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 09:20:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACF2C061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 06:20:30 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jkp2K-0005bh-4k; Mon, 15 Jun 2020 15:20:28 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jkp2J-00037H-6k; Mon, 15 Jun 2020 15:20:27 +0200
Date:   Mon, 15 Jun 2020 15:20:27 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v1 4/4] gpio: pca953x: disable regmap locking for
 automatic address incrementing
Message-ID: <20200615132027.flexasjahrn6floq@taurus.defre.kleine-koenig.org>
References: <20200605134036.9013-1-andriy.shevchenko@linux.intel.com>
 <20200605134036.9013-4-andriy.shevchenko@linux.intel.com>
 <20200615122044.j2vdhpmhbpsw6qkb@taurus.defre.kleine-koenig.org>
 <20200615125349.GD2428291@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="726b5o63hpcaepwc"
Content-Disposition: inline
In-Reply-To: <20200615125349.GD2428291@smile.fi.intel.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--726b5o63hpcaepwc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[adding Geert to Cc as he was involved with
aa58a21ae37894d456a2f91a37e9fd71ad4aa27e]

On Mon, Jun 15, 2020 at 03:53:49PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 15, 2020 at 02:20:44PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Fri, Jun 05, 2020 at 04:40:36PM +0300, Andy Shevchenko wrote:
> > > It's a repetition of the commit aa58a21ae378
> > >   ("gpio: pca953x: disable regmap locking")
> > > which states the following:
> > >=20
> > >   This driver uses its own locking but regmap silently uses
> > >   a mutex for all operations too. Add the option to disable
> > >   locking to the regmap config struct.
> > >=20
> > > Fixes: bcf41dc480b1 ("gpio: pca953x: fix handling of automatic addres=
s incrementing")
> > > Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >=20
> > Ah, good catch. I assume that I didn't have aa58a21ae378 in my tree when
> > I created the patch that then became bcf41dc480b1.
> >=20
> > Looks right
> >=20
> > Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Thanks!
>=20
> Linus, Bart, just to clarify that this is material for one of the next v5=
=2E8-rcX
> (this cycle!).

I didn't test but I wonder if this patch is really urgent. Just from
looking I'd say two locks are not nice but also don't hurt much. If it
is more urgent the commit log should maybe mention how the driver is
broken without this change? (Also applies to
aa58a21ae37894d456a2f91a37e9fd71ad4aa27e of course (but too late).)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--726b5o63hpcaepwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl7ndZgACgkQwfwUeK3K
7AmxaQf/babpS23tfkfwz7LPcdrM2GJMU0Duovd9aicOhKmbdGJpKTjgHKuRW7tY
7aCD9ikDMLciGK0XIhUgCQF2DLSk0InqA3kkI6w5UAVEdVAWN+C/yNzf0T+mWVLS
cL9FlU1EygnMo6VDmsiFvKaIiE4m0QY5TiupkdmAYgylXpMbHwLp2Raa/kN0mzHZ
Z0N5kKZDgSss/YxH3OE/qqXw4bMCQM6Kw8bsHOhmgPoLtigX8UMvxLS6pcmatXe1
sDcu1RwKKs3urQGv6iemyB6p16paNu2paM3i82XVkkFMqtYXJ4V+QV2/J168l/GK
emotyJ/3UD/gTg0NPU3wBFVoT/Xilw==
=ZO1y
-----END PGP SIGNATURE-----

--726b5o63hpcaepwc--
