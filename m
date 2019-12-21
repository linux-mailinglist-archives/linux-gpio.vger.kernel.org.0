Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC99128B0B
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Dec 2019 20:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfLUT0c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 Dec 2019 14:26:32 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42838 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfLUT0c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Dec 2019 14:26:32 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9022C1C24DF; Sat, 21 Dec 2019 20:26:29 +0100 (CET)
Date:   Sat, 21 Dec 2019 20:26:28 +0100
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
Subject: Re: [PATCH v7 01/12] dt-bindings: leds: ROHM BD71282 PMIC LED driver
Message-ID: <20191221192628.GI32732@amd>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
 <389367d4bb5283420e22f078c60e0805d23183ee.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0NB0lE7sNnW8+0qW"
Content-Disposition: inline
In-Reply-To: <389367d4bb5283420e22f078c60e0805d23183ee.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--0NB0lE7sNnW8+0qW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-12-19 11:44:50, Matti Vaittinen wrote:
> Document ROHM BD71828 PMIC LED driver device tree bindings.
>=20
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--0NB0lE7sNnW8+0qW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+ceQACgkQMOfwapXb+vJJ2wCfYAOe58hN8obn+J7VsS8wSsyl
wScAnA28iJQPpN8gVwmgYEu1HmtWAv/J
=54nq
-----END PGP SIGNATURE-----

--0NB0lE7sNnW8+0qW--
