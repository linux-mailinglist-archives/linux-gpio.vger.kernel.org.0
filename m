Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1221F99EF
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 16:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730557AbgFOOSJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 10:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729733AbgFOOSJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 10:18:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE00C061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 07:18:08 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jkpw5-0004iV-Py; Mon, 15 Jun 2020 16:18:05 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jkpw5-0006Jq-1Y; Mon, 15 Jun 2020 16:18:05 +0200
Date:   Mon, 15 Jun 2020 16:18:04 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v1 4/4] gpio: pca953x: disable regmap locking for
 automatic address incrementing
Message-ID: <20200615141804.aocz2tw3czlcyaxy@taurus.defre.kleine-koenig.org>
References: <20200605134036.9013-1-andriy.shevchenko@linux.intel.com>
 <20200605134036.9013-4-andriy.shevchenko@linux.intel.com>
 <20200615122044.j2vdhpmhbpsw6qkb@taurus.defre.kleine-koenig.org>
 <20200615125349.GD2428291@smile.fi.intel.com>
 <20200615132027.flexasjahrn6floq@taurus.defre.kleine-koenig.org>
 <CAHp75VcA8ExfpBXyo=nB0KqP5+s9RWq8YtZ03Z8UTp7RSPvTmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="22e3z4uskfyqfe7i"
Content-Disposition: inline
In-Reply-To: <CAHp75VcA8ExfpBXyo=nB0KqP5+s9RWq8YtZ03Z8UTp7RSPvTmQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--22e3z4uskfyqfe7i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 04:38:23PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 15, 2020 at 4:23 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Hello,
> >
> > [adding Geert to Cc as he was involved with
> > aa58a21ae37894d456a2f91a37e9fd71ad4aa27e]
> >
> > On Mon, Jun 15, 2020 at 03:53:49PM +0300, Andy Shevchenko wrote:
> > > On Mon, Jun 15, 2020 at 02:20:44PM +0200, Uwe Kleine-K=F6nig wrote:
> > > > On Fri, Jun 05, 2020 at 04:40:36PM +0300, Andy Shevchenko wrote:
> > > > > It's a repetition of the commit aa58a21ae378
> > > > >   ("gpio: pca953x: disable regmap locking")
> > > > > which states the following:
> > > > >
> > > > >   This driver uses its own locking but regmap silently uses
> > > > >   a mutex for all operations too. Add the option to disable
> > > > >   locking to the regmap config struct.
> > > > >
> > > > > Fixes: bcf41dc480b1 ("gpio: pca953x: fix handling of automatic ad=
dress incrementing")
> > > > > Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > >
> > > > Ah, good catch. I assume that I didn't have aa58a21ae378 in my tree=
 when
> > > > I created the patch that then became bcf41dc480b1.
> > > >
> > > > Looks right
> > > >
> > > > Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > >
> > > Thanks!
> > >
> > > Linus, Bart, just to clarify that this is material for one of the nex=
t v5.8-rcX
> > > (this cycle!).
> >
> > I didn't test but I wonder if this patch is really urgent.
>=20
> I'm talking about this entire fix-series.

Ah, I didn't notice this is a series as I only got patch 4.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--22e3z4uskfyqfe7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl7ngxkACgkQwfwUeK3K
7AmWfwf+I3vs24kj8zZmi2xLtp3eBse/rsx/QwGFFCBjl1ddyzuqVk/w36jlqcWR
eipqFYnPqoBfImmEvBGs0EEOjk7M2mxLQEom0o9RaOrILZb4lYiezDBzZKtX82CH
eFkHxlAk0RWkDcJerTaXVZQMsIIc3mDCbb7m+fycw0naGc1OrGisSL9aWwKz0XY+
9/25b++BjZjVx5Ptr/fCE9wJ4uL4V4v8nhHB8U5tGJi5xZHt8m4nQsfFlLFnmq/F
VRnBXlo6FH9r/htxD0UXNu1tXy4LX0E++cPFx2YZurrZWzey2TavHzkgx2SHqmxO
K86MQ0cl0dTkTegwS5VBGTueCSo92Q==
=nBOm
-----END PGP SIGNATURE-----

--22e3z4uskfyqfe7i--
