Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35AC8262D2D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbgIIKbU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbgIIKbP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:31:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8553C061756
        for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2020 03:30:56 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kFxNO-0004Cf-PD; Wed, 09 Sep 2020 12:30:54 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kFxNN-0005Xg-Pc; Wed, 09 Sep 2020 12:30:53 +0200
Date:   Wed, 9 Sep 2020 12:30:53 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2] gpio: siox: explicitly support only threaded irqs
Message-ID: <20200909103053.bhzh3533km7ky3jh@pengutronix.de>
References: <20200907153135.3307-1-a.fatoum@pengutronix.de>
 <CAMpxmJWJo=wZmBdAxS2JWVMmg+g2dZG9Do7z+ROy0s37rWTw+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kpyu2cpc3fs7tqrq"
Content-Disposition: inline
In-Reply-To: <CAMpxmJWJo=wZmBdAxS2JWVMmg+g2dZG9Do7z+ROy0s37rWTw+w@mail.gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--kpyu2cpc3fs7tqrq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 11:43:24AM +0200, Bartosz Golaszewski wrote:
> On Mon, Sep 7, 2020 at 5:32 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wro=
te:
> >
> > The gpio-siox driver uses handle_nested_irq() to implement its
> > interrupt support. This is only capable of handling threaded irq
> > actions. For a hardirq action it triggers a NULL pointer oops.
> > (It calls action->thread_fn which is NULL then.)
> >
> > Prevent registration of a hardirq action by setting
> > gpio_irq_chip::threaded to true.
> >
> > Cc: u.kleine-koenig@pengutronix.de
> > Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > ---
>=20
> Could you add a Fixes tag? This looks like stable material.

Ah, we talked about this in the v1 thread---tglx and I agreed we want
it. That's:

Fixes: be8c8facc707 ("gpio: new driver to work with a 8x12 siox")

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kpyu2cpc3fs7tqrq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl9YrtoACgkQwfwUeK3K
7AkU7wf8CMI7+dWprPIUEOc6fay4MBwSA7GnYskIGYpSdVvYTOZA2lODBej3A6Ms
29y3p8JxfNLZss2nKOIZ2XJZt2o9e7KwTmGQurqq3zisoOueAxc+1qt4VTKFzNwb
xROu6MXSDpoC+j6z8kc8J5BTiy2XT9RAgRkHeDH+jynsfJ4oN67fWh+uz7/xO8Fk
N+ItAeBPYrxELu8+dBfykzIAuryY+ZDoZYdoTHBOrd2X2zKqC0yDkod8/aHKhiW5
yELwH8d2iG46qoxSmnDhjnuGlivtD+1W+cVoVktZguaiUCl3GikCADJzUjeeZkvB
yghYsnfnUYEauBa1WB9Z+M6ujo6DJQ==
=cEXz
-----END PGP SIGNATURE-----

--kpyu2cpc3fs7tqrq--
