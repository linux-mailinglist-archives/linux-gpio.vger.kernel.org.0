Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73A5317004F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2020 14:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgBZNmG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Feb 2020 08:42:06 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:38720 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgBZNmG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Feb 2020 08:42:06 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BBC4B1C0411; Wed, 26 Feb 2020 14:42:03 +0100 (CET)
Date:   Wed, 26 Feb 2020 14:42:03 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v10 00/13] Support ROHM BD71828 PMIC
Message-ID: <20200226134203.GD4080@duo.ucw.cz>
References: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
 <20200117103000.GG15507@dell>
 <9785531484b32da487a6016f5c32bf2e9bc45985.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Content-Disposition: inline
In-Reply-To: <9785531484b32da487a6016f5c32bf2e9bc45985.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Changelog v10:
> > >   - Split RTC patch to a BD70528 fix (which hopefully goes to 5.4)
> > > and to
> > >     BD71828 support
> >=20
> > Still missing LED Acks.
> >=20
>=20
> Yep. I know. I haven't heard from Pavel recently and the patch 12
> definitely requires his ack. Can you take the other patches in and
> leave 12 and 13 out for now? I can continue work on LEDs with Pavel but
> I would really like to have the regulators working and BD70528 RTC
> fixed in next release...

Going through my backlogs now. You taking patches up-to 11 so
that we have two left sounds good :-).

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXlZ1qwAKCRAw5/Bqldv6
8gMmAJ4nQGRvqIIofy6kdcys+H/DvgwB6QCgnqsTHp2iWDANQfm15weQRR1P0SY=
=boMf
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--
