Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7045830A454
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 10:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbhBAJZu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 04:25:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbhBAJZu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 04:25:50 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5DCC061573
        for <linux-gpio@vger.kernel.org>; Mon,  1 Feb 2021 01:25:10 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l6VRq-0002Vs-QX; Mon, 01 Feb 2021 10:24:42 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l6VRo-000717-EJ; Mon, 01 Feb 2021 10:24:40 +0100
Date:   Mon, 1 Feb 2021 10:24:36 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 0/8] gpio: implement the configfs testing module
Message-ID: <20210201092436.srqgfemnchyuubsf@pengutronix.de>
References: <20210129134624.9247-1-brgl@bgdev.pl>
 <20210130212009.2uugdj6vmisegau2@pengutronix.de>
 <CAMRc=MdwoJCw1-BdNRnfRFaXYfZD0+vn_8yq0J+rshHqZMdDXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="65y6muqcwz6jdecn"
Content-Disposition: inline
In-Reply-To: <CAMRc=MdwoJCw1-BdNRnfRFaXYfZD0+vn_8yq0J+rshHqZMdDXQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--65y6muqcwz6jdecn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2021 at 09:37:30AM +0100, Bartosz Golaszewski wrote:
> On Sat, Jan 30, 2021 at 10:20 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Hello,
> >
> > On Fri, Jan 29, 2021 at 02:46:16PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > This series adds a new GPIO testing module based on configfs committa=
ble items
> > > and sysfs. The goal is to provide a testing driver that will be confi=
gurable
> > > at runtime (won't need module reload) and easily extensible. The cont=
rol over
> > > the attributes is also much more fine-grained than in gpio-mockup.
> > >
> > > I am aware that Uwe submitted a virtual driver called gpio-simulator =
some time
> > > ago and I was against merging it as it wasn't much different from gpi=
o-mockup.
> > > I would ideally want to have a single testing driver to maintain so I=
 am
> > > proposing this module as a replacement for gpio-mockup but since self=
tests
> > > and libgpiod depend on it and it also has users in the community, we =
can't
> > > outright remove it until everyone switched to the new interface. As f=
or Uwe's
> > > idea for linking two simulated chips so that one controls the other -=
 while
> > > I prefer to have an independent code path for controlling the lines (=
hence
> > > the sysfs attributes), I'm open to implementing it in this new driver=
=2E It
> > > should be much more feature friendly thanks to configfs than gpio-moc=
kup.
> >
> > Funny you still think about my simulator driver. I recently thought
>=20
> It's because I always feel bad when I refuse to merge someone's hard work.
>=20
> > about reanimating it for my private use. The idea was to implement a
> > rotary-encoder driver (that contrast to
> > drivers/input/misc/rotary_encoder.c really implements an encoder and not
> > a decoder). With the two linked chips I can plug
> > drivers/input/misc/rotary_encoder.c on one side and my encoder on the
> > other to test both drivers completely in software.
> >
> > I didn't look into your driver yet, but getting such a driver into
> > mainline would be very welcome!
> >
>=20
> My idea for linking chips (although that's not implemented yet) is an
> attribute in each configfs group called 'link' or something like that,
> that would take as argument the name of the chip to link to making the
> 'linker' the input and the 'linkee' the output.

I still wonder why you prefer to drive the lines using configfs (or
sysfs before). Using the idea of two interlinked chips and being able to
use gpio functions on one side to modify the other side is (in my eyes)
so simple and beautiful that it's obviously the right choice. But note I
still didn't look into details so there might be stuff you can modify
that wouldn't be possible with my idea. But obviously your mileage
varies here.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--65y6muqcwz6jdecn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAXyNEACgkQwfwUeK3K
7AnlOQf+PJp3sYhc7rZc/co0aN9yGRJUKxFqDOqbbeRv059P0vkaD7iZ9DRIXRkH
HuK7Wn5WFKl42OncXTA7pIMJM5jMc22AgYEG8ttWTmxtI9nKK1MuACTWWMWhzvMv
MWeFM8zo7PMOvC0Exkh1K52TA7zfhAJ6Lc6+GJtl9wfb1P4W/EbER6lGFu/dN7y2
sGNG1+dl3RSkdPDGUTyKDX5c/xRir6pHwRwjkKQo3MxhJIwzWs9rh3WtPwsRKfL9
UJmu09J9y4Y7L+nNk/7odCd0FwI4oxBfs9hL7Ic4V7Kfw94hFNF6J7fKGbHqgPe8
Zb+PhZw6Rr0gY1O7EZmobl4Y0MHeXQ==
=KxeP
-----END PGP SIGNATURE-----

--65y6muqcwz6jdecn--
