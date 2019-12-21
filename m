Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C53CA128B33
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Dec 2019 20:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfLUTsG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 Dec 2019 14:48:06 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:45404 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfLUTsG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Dec 2019 14:48:06 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A7AD51C24A9; Sat, 21 Dec 2019 20:48:03 +0100 (CET)
Date:   Sat, 21 Dec 2019 20:48:02 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v7 12/12] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
Message-ID: <20191221194802.GK32732@amd>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
 <c95eb856c8e05a196551179c2416455c022eb3ea.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="++alDQ2ROsODg1x+"
Content-Disposition: inline
In-Reply-To: <c95eb856c8e05a196551179c2416455c022eb3ea.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--++alDQ2ROsODg1x+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> ROHM BD71828 power management IC has two LED outputs for charge status
> and button pressing indications. The LED outputs can also be forced
> by SW so add driver allowing to use these LEDs for other indications
> as well.
>=20
> Leds are controlled by SW using 'Force ON' bits. Please note the
> constrains mentioned in data-sheet:
>     1. If one LED is forced ON - then also the other LED is forced.
>             =3D> You can't use SW control to force ON one LED and allow HW
>                to control the other.
>     2. You can't force both LEDs OFF. If the FORCE bit for both LED's is
>        zero, then LEDs are controlled by HW and indicate button/charger
>        states as explained in data-sheet.

That's really quite sad, is it?

All the effort and all we got is ... one working LED. Because hardware
does not allow you to control both LEDs...

=2E..and we don't even have support selecting if the LED should be sw or
hw controlled in the mainline, yet...

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--++alDQ2ROsODg1x+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+dvIACgkQMOfwapXb+vIg1wCfYtYi6MN/BEF+ztr/KeVKSAJq
ufgAoL9RYqOIuswW/TX+njSk7v8JSMf0
=GjUc
-----END PGP SIGNATURE-----

--++alDQ2ROsODg1x+--
