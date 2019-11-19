Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E00F4102CDE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 20:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbfKSTgj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 14:36:39 -0500
Received: from foss.arm.com ([217.140.110.172]:57450 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbfKSTgj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 Nov 2019 14:36:39 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B87931B;
        Tue, 19 Nov 2019 11:36:38 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFB683F703;
        Tue, 19 Nov 2019 11:36:37 -0800 (PST)
Date:   Tue, 19 Nov 2019 19:36:36 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "hofrat@osadl.org" <hofrat@osadl.org>
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Message-ID: <20191119193636.GH3634@sirena.org.uk>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
 <d29e0eb587b764f3ea77647392e45fac67bbd757.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
 <20191118162502.GJ9761@sirena.org.uk>
 <fd1e4e652840346bd990c769eabe2f966bda4ed6.camel@fi.rohmeurope.com>
 <20191119181325.GD3634@sirena.org.uk>
 <fa69d01504817e3260d2b023ae2637aa2f1b2862.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZPDwMsyfds7q4mrK"
Content-Disposition: inline
In-Reply-To: <fa69d01504817e3260d2b023ae2637aa2f1b2862.camel@fi.rohmeurope.com>
X-Cookie: Beam me up, Scotty!  It ate my phaser!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ZPDwMsyfds7q4mrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 19, 2019 at 06:51:37PM +0000, Vaittinen, Matti wrote:
> On Tue, 2019-11-19 at 18:13 +0000, Mark Brown wrote:

> > Ah, OK.  I didn't even notice that patch when I scanned the series.
> > I'll look out for this next time around but that sounds like it's
> > generally going in the right direction, especially if it's integrated
> > with the suspend mode regulator bindings that Chunyan did.

> Probably it is not as I am not familiar with Chunyan's work. I'll try
> looking what has been done on that front :) And I am pretty sure you
> might not be happy with that patch - but perhaps you can give me a
> nudge to better direction...

The driver interface was added in "regulator: add PM suspend and resume
hooks".

> > Yes, I think this needs clarification as I completely failed to pick
> > up
> > on this and did indeed read this as referring to the
> > modes.  "Voltages
> > that can be set in RUN mode" or something?  I take it these voltages
> > are
> > fixed and the OS can't change them?

> Unfortunately they are not. Voltages and enable/disable statuses for
> each run-level (and individually for each run-level capable buck) can
> be changed at runtime via I2C. And a customer requested me also to
> support this - hence the in-kernel API - but I am sure you have some
> nice words when you check the patch 12. :]

Ah, that's actually better.  It opens up possiblities for making use of
the feature without encoding voltages in DT.  For example, you can cache
the last however many voltages that were set and jump quickly to them or
do something like put the top of the constraints in to help with
governors like ondemand.  I'd recommend trying for something like that
rather than encoding in DT, it'll probably be more robust with things
like cpufreq changing.

--ZPDwMsyfds7q4mrK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3UREMACgkQJNaLcl1U
h9B3OAf+Kth7jw+jGm3XPY/BVO90YB9fEnA/2D8PBMylpbiqhSemPrFLe0lFyarL
HbdXnMrZ109/8kllbD3a4ACoFLArQquUb466iT4TEJZpmerdtrwnRzhEVPsHvy8W
arYRTcgn9eeuTC7vUFN5kJ/l+5XJFmrIvi6FxsXe8yJYVizpwctdeVvSVP19Bpni
bMDBcbeH2Dz8HNlA08H5m1TgkhVKhLmnpCuYbzr53ExNrTPcztOwSkBAIfdk2DTx
vjMVkwMQdxUZi2Zk5s88qDvySsUFfve0bmJ1719z13eaGq/y1DpX4E6r7VuTy0N0
xgJYHUswDWwBRwTr6qcaTLvEE45XYw==
=b5/M
-----END PGP SIGNATURE-----

--ZPDwMsyfds7q4mrK--
