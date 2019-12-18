Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74C3C124F1B
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 18:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbfLRRYP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 12:24:15 -0500
Received: from foss.arm.com ([217.140.110.172]:54788 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727193AbfLRRYP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Dec 2019 12:24:15 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2610231B;
        Wed, 18 Dec 2019 09:24:14 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 984363F67D;
        Wed, 18 Dec 2019 09:24:13 -0800 (PST)
Date:   Wed, 18 Dec 2019 17:24:12 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "noralf@tronnes.org" <noralf@tronnes.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Subject: Re: Applied "regulator: bd71828: Basic support for ROHM bd71828 PMIC
 regulators" to the regulator tree
Message-ID: <20191218172412.GK3219@sirena.org.uk>
References: <applied-5b1c4a22c7945e97ff2a7924abfeb3239043f8eb.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
 <de7424126e285d9bbd21a70945415d78203c2ba7.camel@fi.rohmeurope.com>
 <20191218131700.GB42175@sirena.org.uk>
 <b72cd22df0bbbb159cda08e556037f1ccf490b3d.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vk/v8fjDPiDepTtA"
Content-Disposition: inline
In-Reply-To: <b72cd22df0bbbb159cda08e556037f1ccf490b3d.camel@fi.rohmeurope.com>
X-Cookie: Power is poison.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--vk/v8fjDPiDepTtA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 18, 2019 at 02:01:27PM +0000, Vaittinen, Matti wrote:
> On Wed, 2019-12-18 at 13:17 +0000, Mark Brown wrote:
> > On Wed, Dec 18, 2019 at 08:06:04AM +0000, Vaittinen, Matti wrote:

> > > I think you missed the [PATCH v6 08/15] regulator: bd718x7: Split
> > > driver to common and bd718x7 specific parts

> > I didn't miss it, it was queued but it doesn't apply.

> Right. The rohm-generic.h is changed by
> [PATCH v6 04/15] mfd: rohm PMICs - use platform_device_id to match MFD
> sub-devices

Ugh, right.  I guess that'll have to go in with the MFD changes then.

--vk/v8fjDPiDepTtA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl36YLsACgkQJNaLcl1U
h9BkDAf/XSz4D3T25M0yYqmY2TIMQ+uimSMMMoiwsyS2ivd9XZXc66Y8aQJ68D4k
phnZsmDtIQL/WPGbI85z8igy1eup0r7RABEbUJsRFELudd9udrnrWBLBVKFdb5BF
3WoB7YBfUOaIm22ktVjVLyawXe/hvxqaAvpiWdRM80GBqGufRnf3fcT/Auv15ImJ
+q5BE6k24FErC519kY8ZFw8B4fszmqCCK6UfOTVyFNvOlLMYcUFGs3BDbgWNxpSF
fOhGp47IZj2RPA85Ut6fGeYuL/dpVa6VaPYPxpkwnDflZeIlY1U/hKpqAd4y+MTv
aEKbFYlOE0P6HfjnUDEyZIs0eIORJQ==
=fXt1
-----END PGP SIGNATURE-----

--vk/v8fjDPiDepTtA--
