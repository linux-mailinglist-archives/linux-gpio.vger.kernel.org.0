Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DECA510EA8C
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 14:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbfLBNMJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Dec 2019 08:12:09 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:51046 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727381AbfLBNMJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2019 08:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=HcdPKwqbVGtlgcTIZgCIi0isK2Mpc49YUdk5xlaJzq0=; b=eMgFjIw0NhQQ+Z5g2pVLfx0Z/
        HPRbQ8VD6LzILID+Y2PhharPGvlPAq79MtFYP84MsnbUkInBOAEYpol69Cx+VUXES8ea6kBYRFoXI
        9LA46DCwTHRcSsg1xO5EVf3HG00L+yJhLHtjGWdwDSMtyJRAyB4gSNFoWDpW4xEoUk1gs=;
Received: from 188.31.173.115.threembb.co.uk ([188.31.173.115] helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1iblUM-0003mu-7T; Mon, 02 Dec 2019 13:11:42 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id E6920D020A4; Mon,  2 Dec 2019 13:11:40 +0000 (GMT)
Date:   Mon, 2 Dec 2019 13:11:40 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
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
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Message-ID: <20191202131140.GD1998@sirena.org.uk>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
 <d29e0eb587b764f3ea77647392e45fac67bbd757.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
 <20191118162502.GJ9761@sirena.org.uk>
 <fd1e4e652840346bd990c769eabe2f966bda4ed6.camel@fi.rohmeurope.com>
 <20191119181325.GD3634@sirena.org.uk>
 <fa69d01504817e3260d2b023ae2637aa2f1b2862.camel@fi.rohmeurope.com>
 <20191119193636.GH3634@sirena.org.uk>
 <eb685cc78b936bc61ed9f7fbfa18c96398b00909.camel@fi.rohmeurope.com>
 <20191129120925.GA5747@sirena.org.uk>
 <297fa021fb243072dbbb7bca455e57c13e8c6843.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vni90+aGYgRvsTuO"
Content-Disposition: inline
In-Reply-To: <297fa021fb243072dbbb7bca455e57c13e8c6843.camel@fi.rohmeurope.com>
X-Cookie: Cleanliness is next to impossible.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--vni90+aGYgRvsTuO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 02, 2019 at 07:57:13AM +0000, Vaittinen, Matti wrote:
> On Fri, 2019-11-29 at 12:09 +0000, Mark Brown wrote:

> > The regulator driver has a bunch fo set_suspend_ operations.

> Hmm. I saw these. But unless I am mistaken linux only knows one
> 'suspend' state whereas the PMIC has a few separate states I can see as
> 'suspend' states. As far as I understood the set_suspend_voltage does
> not allow setting separate suspend voltages depending on the "type of
> suspend" (as there is only one 'suspend' state).

No, look at the bindings - we support a bunch of different
suspend states matching the different suspend states that the
kernel as a whole supports.  We don't assume that the device will
know this but you can always use the current suspend we're going
for to decide where to update.

> > > (RUN0, ... RUN3) could be mapped to regulator modes
> > > REGULATOR_MODE_FAST, REGULATOR_MODE_NORMAL, REGULATOR_MODE_IDLE
> > > and=20
> > > REGULATOR_MODE_STANDBY. But regulators which are controlled by
> > > these

> > That doesn't make sense at all, the modes affect the quality of
> > regulation not the voltage that is set.

> Thanks. I misunderstood this. I thought these states could be used for
> some adaptive voltages. My understanding is that the RUN0,...RUN3 are
> designed for that - but I didn't know if regulator framework is
> designed for this.

The framework doesn't care how a device is controlled, that's up
to the device.  Like I said I recommend figuring out what
voltages are useful to have quick access to at runtime, for
example it's likely that it's good to have quick access to the
highest voltage that's been set (and/or the top of the
constraints).

> > The cpufreq code is all there in kernel - drivers/cpufreq.  I can't
> > remember if Android still has a custom governor in their trees but it
> > doesn't really make much difference in terms of how it interacts with
> > the regulator drivers.

> Right. I guess your answers mean that there is no "regulator group
> control" for "adaptive voltage changes" supported by regulator

I can't parse the above, sorry.  What is "regulator group
control"?

--vni90+aGYgRvsTuO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3lDYkACgkQJNaLcl1U
h9Amugf/QH6FoZOtAUIIujQELU4pGFVm5XkIvgjpWUWDlNK6CW+CKrdAc/iRcuch
fpYcI7ht3Nd94mcruUECYYI5fTxj0ECj3mflGdL6c2nl7Sw3D3haNabXsa4XN5CT
OUIi4NWGhuKUpFSLxgwdApBxJ5Tlri+TWW6Prv9Bf9IM1TMAHvCnIQD8rgSFrYga
gxL160QzYsJoGI2KqLHFgo8ltWKjQO/jLHNoAL0awmx+Iujh30I8dlU1Laq3atoA
siWbaqGqJKZLbfFOfaLQrga5DOJSd20ZY0R09niVgOr2xap2wxXaqVCLg7pnSBwV
LD5cn4UcLr5v0sUXKwN908qjIvMxrg==
=Fs54
-----END PGP SIGNATURE-----

--vni90+aGYgRvsTuO--
