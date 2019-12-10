Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 490821188BB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 13:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbfLJMpl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 07:45:41 -0500
Received: from foss.arm.com ([217.140.110.172]:42958 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727116AbfLJMpl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 07:45:41 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01C1B1FB;
        Tue, 10 Dec 2019 04:45:40 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51F903F52E;
        Tue, 10 Dec 2019 04:45:39 -0800 (PST)
Date:   Tue, 10 Dec 2019 12:45:37 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
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
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Message-ID: <20191210124537.GD6110@sirena.org.uk>
References: <20191118162502.GJ9761@sirena.org.uk>
 <fd1e4e652840346bd990c769eabe2f966bda4ed6.camel@fi.rohmeurope.com>
 <20191119181325.GD3634@sirena.org.uk>
 <fa69d01504817e3260d2b023ae2637aa2f1b2862.camel@fi.rohmeurope.com>
 <20191119193636.GH3634@sirena.org.uk>
 <eb685cc78b936bc61ed9f7fbfa18c96398b00909.camel@fi.rohmeurope.com>
 <20191129120925.GA5747@sirena.org.uk>
 <ccc533df4e00bdcbe18ea45a0e0679161ff41354.camel@fi.rohmeurope.com>
 <20191210121129.GA6110@sirena.org.uk>
 <557a4c5993a6fb16710342438f74f92bdfb40ec0.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline
In-Reply-To: <557a4c5993a6fb16710342438f74f92bdfb40ec0.camel@fi.rohmeurope.com>
X-Cookie: We have ears, earther...FOUR OF THEM!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2019 at 12:41:47PM +0000, Vaittinen, Matti wrote:

> The thing is that if we do initial setting of voltages (based on
> binding data) we can set the voltages to registers before we switch to
> that run-level. If we don't do initial setting then we will only do
> setting when voltage change is actually requested - which may be too
> late. (I actually heard somewhere that there is 40 uS time limit - but
> I don't see how this is counted. Starting from what? - and I don't see
> how this is guaranteed even with GPIO if interrupts are to be served).

I suspect that if that limit is a real thing it's from some runtime
performance metrics where people are doing benchmarking to verify that
everything is working fine rather than an absolute thing that is a basic
requirement for operation.

> So, I am again wondering if I should just upstream the basic control
> with I2C for SoCs which do not require fast DVS voltage changes and
> perhaps maintain/provide own set of patches with additional interface
> for run-level control for those customers who require it... Sorry for
> being such a difficult guy. Decision making seems to not be my strong
> point :/

Yes, definitely submit the basic stuff separately - the GPIO changes can
be reviewed as a separate, incremental patch.

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3vk3EACgkQJNaLcl1U
h9Bvzgf+OZFrjIN4TOeKvgJNSsiobO5Bs89BP1ju3K4lv6xdMQ3fvnRTWKKCtbsb
UZpmBdkVI6WQplfTQvAup1x6f9Uvxqngq2TsZKwm1JkfZY6CkoelQayXILnLCNgZ
c4lOSXdIceavGUIzXvcy9DrOLvixaQRFcSTxKblkDQ4k1nCpdCfyZ2zTC0UxFVB4
wtHK9/TuD83EfEXTC0U+jSoTlqXB6SGY8iMNbUiV2wUQJGlZVBAM6kCneaDGMk1S
tAO0+eUBuaT2MCYm/AHdjX4YxZGqstLzZJ7RAbHlVu/kW6xY4XN9oOi8TXkWZaH+
shZxrjt43yVFuIqZGsKNKD++GvSPdg==
=ttCh
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--
