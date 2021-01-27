Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624433058AE
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236031AbhA0KmW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 05:42:22 -0500
Received: from www.zeus03.de ([194.117.254.33]:36986 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236061AbhA0KkC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Jan 2021 05:40:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=uXQip5yKijIqcMZ3FcQVyHF9S+s5
        HpPijwryumSAIGk=; b=V5MjUonS791+0QOYdiJezdyAaBjAtbtqyVl1r3s1uvZ9
        5woNfO/AItGLTDDnWOhEZlwPakBHT+lu7KyvpOKEzuH60qpGvSseHchJnuH3Ot+q
        +duTjfEy0mckWbxmmlYuQlTvQvqAX8yMT2tHDzIHZ2efNil6EyxTcwjDRKbZE5o=
Received: (qmail 4026905 invoked from network); 27 Jan 2021 11:39:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jan 2021 11:39:19 +0100
X-UD-Smtp-Session: l3s3148p1@RrQvYt+5cr0gAwDPXyX1AEdA8SGgn5QT
Date:   Wed, 27 Jan 2021 11:39:19 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] gpio: gpiolib: remove shadowed variable
Message-ID: <20210127103919.GC928@ninjato>
References: <20210105105914.13172-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUT8CEyJ1ERmLr443SuZgemFF40cDviSGwhYM7ZnN_b_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUT8CEyJ1ERmLr443SuZgemFF40cDviSGwhYM7ZnN_b_g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 05, 2021 at 12:14:34PM +0100, Geert Uytterhoeven wrote:
> On Tue, Jan 5, 2021 at 12:00 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > After refactoring, we had two variables for the same thing. Remove the
> > second declaration, one is enough here. Found by cppcheck.
> >
> > drivers/gpio/gpiolib.c:2551:17: warning: Local variable 'ret' shadows o=
uter variable [shadowVariable]
> >
> > Fixes: d377f56f34f5 ("gpio: gpiolib: Normalize return code variable nam=
e")
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Ccing Linus & Bartosz


--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmARQtMACgkQFA3kzBSg
KbZq0BAApfeePPvTIfSLa7R6TXTKvpLC+31oyXBmwvTH/n9DvGxbMJLzzAWgtRu4
dqW47iHrVyPEIoDtZtYnuSQZJA48IPVGd1mRFFl3vdECQbwNn2NzTAxRQC8H343T
Fcmea1l/qMEOcr3FEX9Y87F5HBdcaOrc/c989O8ZL/sweIqJdN3c4KZgf3DvzOGj
9r39Qo/DbwYqUjaLOsUUt9B0teznxpIoAJnFjykOPZADdYcqgXIaCHc9hQwGm5k5
kXMGeN97ohYFz+YThMOLUm32nUwkGtwdFQSJtYeHAkHRVqIumuYnSAuCgR8BJnvj
tI5BVoHn12AEQufA2A481GW8Uj3n7YNCF99q+kCvAJITxzaf33BNL+0qVWsnMEgd
oWCVir5kVi6LDi0y+OtMoTy0++kEEtrGfQEsDr8sauBvNxBUtACcUaN45uaxEfxY
dKXbnmI5iavCpQxM5Pzqv6PozS8PKKEUnN6ySZqVvylQmtLxRCgPyQjlb1YX7nut
ztUt4fUM6MNF4y9Z4MX+mgkHDC+g9wwd6aJEIhrdewvAZB1Bst/NW4ZTBFenhNZt
Y4qzwMW64btWyKcNdb8XGqpXgS++l49HgQS0g5K03NH18F6ulggUbgvPIvs/5gv/
ywAWdRmNGquI6tP1pTZU5Uom2l8Nnswhps3UhujfBAs/BzKRbnI=
=93W/
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
