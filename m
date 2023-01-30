Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7666B6816D7
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 17:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236798AbjA3QtM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 11:49:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237585AbjA3QtH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 11:49:07 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A83593CE36
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 08:48:41 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pMXKg-0002DX-EP; Mon, 30 Jan 2023 17:48:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pMXKf-001VWc-G3; Mon, 30 Jan 2023 17:48:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pMXKd-00H7SI-SN; Mon, 30 Jan 2023 17:48:35 +0100
Date:   Mon, 30 Jan 2023 17:48:35 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Robert Schwebel <r.schwebel@pengutronix.de>,
        bartosz.golaszewski@linaro.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        christophe.leroy@csgroup.eu, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org,
        Sascha Hauer <sha@pengutronix.de>
Subject: Re: GPIO static allocation warning with v6.2-rcX
Message-ID: <20230130164835.eteteji2vy7pbwtz@pengutronix.de>
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
 <20230125093548.GB23347@pengutronix.de>
 <CACRpkdbcrTv+=7Ev750O=UO=V=afp5NnTT4znb0rzWLkom+_cg@mail.gmail.com>
 <20230126104927.GE23347@pengutronix.de>
 <20230129183339.GY24167@pengutronix.de>
 <CACRpkdYRynwJJZR5uCEn9rmE3c8p7R8SQdXC2FkzRUkBYRjErg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jb2jyn3bwadewd6v"
Content-Disposition: inline
In-Reply-To: <CACRpkdYRynwJJZR5uCEn9rmE3c8p7R8SQdXC2FkzRUkBYRjErg@mail.gmail.com>
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


--jb2jyn3bwadewd6v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 11:19:11AM +0100, Linus Walleij wrote:
> On Sun, Jan 29, 2023 at 7:33 PM Robert Schwebel
> <r.schwebel@pengutronix.de> wrote:
>=20
> > While this could also be done with a daemon offering a dbus api, this
> > would be significantly more complex. In a critical environment, one
> > needs to make sure that the daemon process never fails, otherwhise the
> > power of the DuT would maybe be in a random state. Then of course one
> > can add a watchdog, but with the current sysfs interface it's really
> > simple. Of course that would also work if the new interface would offer
> > a "keep this line as it is" feature, but adding a dbus daemon just for
> > keeping the state of a pin sounds overcomplex when the kernel could also
> > provide that functionality.
>=20
> One issue we face as developers is scaleability. Things that
> seem straight forward on a single board computer in a lab get
> really complex in a big system with man GPIO chips.

This is the point where the discussion took a wrong turn.

Yes, there is awareness that the sysfs API has a downside (here: on some
platforms the number allocation is not stable).

But the problem here is that the alternative (i.e. using the newer
devctrl API) also has a downside that makes it unsuitable (or overly
complex) to use for some workflows.

Just an idea: Wouldn't a nice solution be to make it possible to opt-out
of the reset to the safe state after use?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jb2jyn3bwadewd6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPX9OAACgkQwfwUeK3K
7AlKlgf/eTKgSnyl4c2qwHdFVFx2orBxVpYc4czF2ITbpxsZPS1shRVin/twUE2e
KCuvO2cJftOv/y0gY5yQPjzK48ERz/pGHL0PFym7RuS+sRtBS3BLvnL53NbXYQQ0
xmFdEtNCjw4q8tbviU1CodJaoCKOwZNDtLxswBgGNTUSLkMlW7XG1FX7ygnEtIML
Lq7rxI1EK+DNV5+u6D+szxSwso92N1aJ4+n4ZqE4haN0tfc2eEbBA5zcBNGN7+/a
3OHWZJnuyxrj6gbS8u3SwfkaodAL8BvEoBBZ21vnbRwBt9626ottr8ycXiLGMZX1
GjJ0zt0kVhIYFtMQbA3/T8/gwqis6w==
=ZxRE
-----END PGP SIGNATURE-----

--jb2jyn3bwadewd6v--
