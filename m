Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4365810D575
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 13:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfK2MJ2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 07:09:28 -0500
Received: from foss.arm.com ([217.140.110.172]:46922 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbfK2MJ2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Nov 2019 07:09:28 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8653C1FB;
        Fri, 29 Nov 2019 04:09:27 -0800 (PST)
Received: from localhost (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B4ED3F52E;
        Fri, 29 Nov 2019 04:09:27 -0800 (PST)
Date:   Fri, 29 Nov 2019 12:09:25 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
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
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Message-ID: <20191129120925.GA5747@sirena.org.uk>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
 <d29e0eb587b764f3ea77647392e45fac67bbd757.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
 <20191118162502.GJ9761@sirena.org.uk>
 <fd1e4e652840346bd990c769eabe2f966bda4ed6.camel@fi.rohmeurope.com>
 <20191119181325.GD3634@sirena.org.uk>
 <fa69d01504817e3260d2b023ae2637aa2f1b2862.camel@fi.rohmeurope.com>
 <20191119193636.GH3634@sirena.org.uk>
 <eb685cc78b936bc61ed9f7fbfa18c96398b00909.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <eb685cc78b936bc61ed9f7fbfa18c96398b00909.camel@fi.rohmeurope.com>
X-Cookie: To love is good, love being difficult.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2019 at 07:48:13AM +0000, Vaittinen, Matti wrote:
> On Tue, 2019-11-19 at 19:36 +0000, Mark Brown wrote:

> > The driver interface was added in "regulator: add PM suspend and
> > resume
> > hooks".

> I looked through the set but didn't spot any new interface towards the
> regulator driver (which accesses the HW). I saw interface towards
> regulator consumer driver which can be used to set the constrains
> though.

The regulator driver has a bunch fo set_suspend_ operations.

> Specifically, I don't see voltage setting callback for different run-
> modes. Nor do I see voltage setting (or differentiation) of more than
> one suspend state.

set_suspend_voltage.

> To explain it further - my assumption is that the BD71828 'run-levels'
> (RUN0, ... RUN3) could be mapped to regulator modes
> REGULATOR_MODE_FAST, REGULATOR_MODE_NORMAL, REGULATOR_MODE_IDLE and=20
> REGULATOR_MODE_STANDBY. But regulators which are controlled by these

That doesn't make sense at all, the modes affect the quality of
regulation not the voltage that is set.

> run-levels, can't be individually controlled. If state for one is
> changed, the state is changed for all of them. The DVS bucks 1,2,6 and

We don't really have anything that'd only work for group configuration
except for the suspend modes.

> > Ah, that's actually better.  It opens up possiblities for making use
> > of
> > the feature without encoding voltages in DT.  For example, you can
> > cache
> > the last however many voltages that were set and jump quickly to them
> > or
> > do something like put the top of the constraints in to help with
> > governors like ondemand.  I'd recommend trying for something like
> > that
> > rather than encoding in DT, it'll probably be more robust with things
> > like cpufreq changing.

> I wish I was working with the full product so that I could see and
> learn a proper example on how the cpufreq actually uses these
> interfaces :) I'd really like to understand this much better. Maybe
> this could be a topic for you to present in some Linux conference ;)
> Just please ping me when you are doing that and I'll be listening there
> for sure ;)

The cpufreq code is all there in kernel - drivers/cpufreq.  I can't
remember if Android still has a custom governor in their trees but it
doesn't really make much difference in terms of how it interacts with
the regulator drivers.

> Anyways, my idea was to set the inital voltage values for these states
> via DT - but allow the voltages to be changed at run-time too (I guess
> this idea is visible in the patch 12).

It'd be much better if you could avoid putting the voltages in the
binding if they're not strictly required.

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3hCnMACgkQJNaLcl1U
h9DYngf+IXV00SV4baSzbbPD499t+tcmC50xm6QHtyWWK8Cp9civk8HKVm+I8Hq4
QD4QuFuR+eqK2qDTm+BAX6fTA64j0WeXKdEzN7PL83q4TlUI+f6n3l7baWyikfS+
jvtHyZGD6QeSMlTBIpR3pDt4u61HM7aFgSH6m86zZX/trPBDfMqk5AynMT4kePZ1
/F2ygmNUUbuZKkS1NLLKsQxr7nvtNvGyR+4HbQbNBuLlMN9BZaFGnQPmVzeksPe4
PnJgOV90Ka3VvoJfRUKKs2z2hvdUP7j+NVjib9COrIhiz987HedXU52OxS/Ae90c
08uWP7tcnqokEsVNIdA6qRO5Jn/lug==
=D2yP
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
