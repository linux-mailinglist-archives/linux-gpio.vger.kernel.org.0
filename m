Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B57BC102B85
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 19:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfKSSNa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 13:13:30 -0500
Received: from foss.arm.com ([217.140.110.172]:56452 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726510AbfKSSN3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 Nov 2019 13:13:29 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42F481FB;
        Tue, 19 Nov 2019 10:13:28 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B16B3F703;
        Tue, 19 Nov 2019 10:13:27 -0800 (PST)
Date:   Tue, 19 Nov 2019 18:13:25 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Message-ID: <20191119181325.GD3634@sirena.org.uk>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
 <d29e0eb587b764f3ea77647392e45fac67bbd757.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
 <20191118162502.GJ9761@sirena.org.uk>
 <fd1e4e652840346bd990c769eabe2f966bda4ed6.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="llIrKcgUOe3dCx0c"
Content-Disposition: inline
In-Reply-To: <fd1e4e652840346bd990c769eabe2f966bda4ed6.camel@fi.rohmeurope.com>
X-Cookie: Beam me up, Scotty!  It ate my phaser!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--llIrKcgUOe3dCx0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 06:03:42PM +0000, Vaittinen, Matti wrote:

> It's nice to hear from you again :) I hope you're enjoying all the new
> things :)

:)

> On Mon, 2019-11-18 at 16:25 +0000, Mark Brown wrote:
> > On Mon, Nov 18, 2019 at 08:53:57AM +0200, Matti Vaittinen wrote:

> > I don't think I saw this having the effect on set_voltage() that I'd
> > have expected in the driver? =20

> The support for this is added in patch 12. I should've ordered the
> patch series so that all regulator patches were one after another.
> Sorry for that.
> The patch 12 adds the run-level support. Please see the functions
> get_runcontrolled_bucks_dt(),
> mark_regulator_runlvl_controlled() (sets the g->runlvl)
> and set_buck_runlvl_controlled() (called based on g->runlvl)
> which changes the ops to disallow setters and to get voltage based on
> current runlevel - and different ops depending on if runlevels are
> controlled by GPIO or I2C. Additionally set_buck_runlvl_controlled()
> adds DT parsing call-back for setting the initial voltages.

Ah, OK.  I didn't even notice that patch when I scanned the series.
I'll look out for this next time around but that sounds like it's
generally going in the right direction, especially if it's integrated
with the suspend mode regulator bindings that Chunyan did.

> > > +        minimum: 0
> > > +        maximum: 2000000
> > > +        maxItems: 4
> > > +        description:
> > > +          Array of voltages for run-levels. First value is for
> > > run-level 0,
> > > +          second for run-level 1 etc. Microvolts.

> > What's the mapping from array indexes to the names used elsewhere to
> > support runlevels?

> Hmm. Sorry Mark, I don't think I follow your question. Do you mean
> names like LPSR, SUSPEND, IDLE, RUN? If so, then I might need to
> rephrase this. The runlevels referred here are different from LPSR,
> SUSPEND, IDLE etc. They are actually 'sub-levels' for PMIC's RUN state.
> Eg, kind of a 'fast way' to change voltages for multiple power rails
> when SoC is at RUN state. The names I have seen are RUN0, RUN1, RUN2
> and RUN3. That mapping is described in description above.

Yes, I think this needs clarification as I completely failed to pick up
on this and did indeed read this as referring to the modes.  "Voltages
that can be set in RUN mode" or something?  I take it these voltages are
fixed and the OS can't change them?

--llIrKcgUOe3dCx0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3UMMUACgkQJNaLcl1U
h9DsnQf9H7LkN3pf6vXdSLnZFaW2fiJIGf+Sk/WnqSyYD4zxVm0xlQ1OPVmWaRv+
KQ4LEN9/ZqHA3KmCWJrtPLm9R5lXwu2VefYDJVkwb+Rlczpg7nusSr8qSFqi3C48
UhWSGJy/myipQixFnlucne58SDANqnA/R+WxvPW8Q+PLsFgWmm/MjBF2YCVmrFv+
R3K8G+POKe4GWkC6E8ISlWHG1YAcFYljMwXCwhex20OxEyuQhzWQ4HFfvbd9OVhe
lxawOmHk0Oh/pNkB9LX42CnI3oBv6hRc2O0No9kOWWxfTOJuJyRz3N/YlI5EVDzS
oJ8uCa7FF9f8mnmVxN27sGy7pKAFZQ==
=lX/d
-----END PGP SIGNATURE-----

--llIrKcgUOe3dCx0c--
