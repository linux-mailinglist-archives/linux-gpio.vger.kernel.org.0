Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15FEE1247E1
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 14:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbfLRNRD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 08:17:03 -0500
Received: from foss.arm.com ([217.140.110.172]:45986 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726710AbfLRNRD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Dec 2019 08:17:03 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F51430E;
        Wed, 18 Dec 2019 05:17:02 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7F223F718;
        Wed, 18 Dec 2019 05:17:01 -0800 (PST)
Date:   Wed, 18 Dec 2019 13:17:00 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "noralf@tronnes.org" <noralf@tronnes.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>
Subject: Re: Applied "regulator: bd71828: Basic support for ROHM bd71828 PMIC
 regulators" to the regulator tree
Message-ID: <20191218131700.GB42175@sirena.org.uk>
References: <applied-5b1c4a22c7945e97ff2a7924abfeb3239043f8eb.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
 <de7424126e285d9bbd21a70945415d78203c2ba7.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline
In-Reply-To: <de7424126e285d9bbd21a70945415d78203c2ba7.camel@fi.rohmeurope.com>
X-Cookie: In the next world, you're on your own.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 18, 2019 at 08:06:04AM +0000, Vaittinen, Matti wrote:

> I think you missed the [PATCH v6 08/15] regulator: bd718x7: Split
> driver to common and bd718x7 specific parts

I didn't miss it, it was queued but it doesn't apply.

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl36JssACgkQJNaLcl1U
h9CIwwf/XGxw7qI5+W4mZUmXbHBLRi2mSDCtLaIN9ZXkq0cxNLHz+arkHxlXRnGH
TgXToL545RFyVMoMsNJ9mgx6N/K6dKycIoz6e2R2KMshQXgG1vsR00SqpzOmWSTD
vuLsweAjda+fSnq8LOxaYCjSyCuC7+kg1OyRToeYUanBAEHL0nnNPc0LaodC2mmz
5oIVqN5KtXLuc9yHBuHn9E6DQpyFFdDwGxscWVVuNKXGbh1YezDw44dIZtb/ZMK5
piw8gK+P9piymdh1rSw0W2dgHojmNgaZWGa1qhbf/9JmaWwc1Wu4q0NZ/dED0JJj
6xQL1PTl40C8GA7Hfd20UUQ/YMu5MQ==
=1AaP
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
