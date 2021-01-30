Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E92D30986E
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Jan 2021 22:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbhA3VVN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Jan 2021 16:21:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbhA3VVM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Jan 2021 16:21:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83BB6C061573
        for <linux-gpio@vger.kernel.org>; Sat, 30 Jan 2021 13:20:32 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l5xfB-00088E-R7; Sat, 30 Jan 2021 22:20:13 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l5xf7-0004I4-Nd; Sat, 30 Jan 2021 22:20:09 +0100
Date:   Sat, 30 Jan 2021 22:20:09 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 0/8] gpio: implement the configfs testing module
Message-ID: <20210130212009.2uugdj6vmisegau2@pengutronix.de>
References: <20210129134624.9247-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rkbaj7v6xsniiasc"
Content-Disposition: inline
In-Reply-To: <20210129134624.9247-1-brgl@bgdev.pl>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--rkbaj7v6xsniiasc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jan 29, 2021 at 02:46:16PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> This series adds a new GPIO testing module based on configfs committable =
items
> and sysfs. The goal is to provide a testing driver that will be configura=
ble
> at runtime (won't need module reload) and easily extensible. The control =
over
> the attributes is also much more fine-grained than in gpio-mockup.
>=20
> I am aware that Uwe submitted a virtual driver called gpio-simulator some=
 time
> ago and I was against merging it as it wasn't much different from gpio-mo=
ckup.
> I would ideally want to have a single testing driver to maintain so I am
> proposing this module as a replacement for gpio-mockup but since selftests
> and libgpiod depend on it and it also has users in the community, we can't
> outright remove it until everyone switched to the new interface. As for U=
we's
> idea for linking two simulated chips so that one controls the other - whi=
le
> I prefer to have an independent code path for controlling the lines (hence
> the sysfs attributes), I'm open to implementing it in this new driver. It
> should be much more feature friendly thanks to configfs than gpio-mockup.

Funny you still think about my simulator driver. I recently thought
about reanimating it for my private use. The idea was to implement a
rotary-encoder driver (that contrast to
drivers/input/misc/rotary_encoder.c really implements an encoder and not
a decoder). With the two linked chips I can plug
drivers/input/misc/rotary_encoder.c on one side and my encoder on the
other to test both drivers completely in software.

I didn't look into your driver yet, but getting such a driver into
mainline would be very welcome!

I intend to look into your driver next week, but please don't hold back
on merging for my feedback.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rkbaj7v6xsniiasc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAVzYYACgkQwfwUeK3K
7AnGTwf/esxm8sdTZ0MzfOs9NI5Q2UFGSbdA27kdJ2/CmyU1Sa2DjykILrrptESJ
Autv9EHRhKgNLwhGFlIOHaSHA6mz5xQlD5k8jJ71hRt85fzcufOpgNqbxlGqm2HJ
7jNcSwP9OYHRJLZ7Yd7cDm4T6S053+MAsz4RKexFJVizh1gDU9f3gKb0kLnuWim8
0R518ZSG0FqQKQN2d5JQkAqEibh0E4dT8+Ba9LM3uuHyX/o1ReNGYfi2SGoSkqk5
TCZlK5nFy5lUuqmn4yu2imh0QRoNQdkoEEQu2MlyN3OD+OyV4Ph4JAu4ogwMlzjy
P/pcvJAW77SRp6iRc+1kMO5mJdfKtg==
=l6+t
-----END PGP SIGNATURE-----

--rkbaj7v6xsniiasc--
