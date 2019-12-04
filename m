Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE1B6112BEF
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 13:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbfLDMrk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 07:47:40 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:49656 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfLDMrk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 07:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=wvspINbC0rd5pzrtB6IdbMhDRhq0Gg7sBdygu5GhV/g=; b=xXhDP38bEFkCILphtkcyG2GaF
        jidMnvmM6z0sQcofRm5Aly/bnCMFa4fyoRZ3t1zviZvzBW8vHhdofmGYIIvsI0HWA7sUyoO7fpHO1
        dmDDWh8zmi2YVI2jdiU9VV335soA8GuPDJYV1Epa55tPSvam/KNjhcpvcvPkwY3bhqWtY=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51] helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1icU3p-0000LL-Hi; Wed, 04 Dec 2019 12:47:17 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 10DC4D003B4; Wed,  4 Dec 2019 12:47:17 +0000 (GMT)
Date:   Wed, 4 Dec 2019 12:47:17 +0000
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
Message-ID: <20191204124717.GR1998@sirena.org.uk>
References: <20191118162502.GJ9761@sirena.org.uk>
 <fd1e4e652840346bd990c769eabe2f966bda4ed6.camel@fi.rohmeurope.com>
 <20191119181325.GD3634@sirena.org.uk>
 <fa69d01504817e3260d2b023ae2637aa2f1b2862.camel@fi.rohmeurope.com>
 <20191119193636.GH3634@sirena.org.uk>
 <eb685cc78b936bc61ed9f7fbfa18c96398b00909.camel@fi.rohmeurope.com>
 <20191129120925.GA5747@sirena.org.uk>
 <297fa021fb243072dbbb7bca455e57c13e8c6843.camel@fi.rohmeurope.com>
 <20191202131140.GD1998@sirena.org.uk>
 <72a1f4c5768b8c08c2669ea01e60d1b614095a43.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r7tUYVWcdYzDJoZW"
Content-Disposition: inline
In-Reply-To: <72a1f4c5768b8c08c2669ea01e60d1b614095a43.camel@fi.rohmeurope.com>
X-Cookie: Cleanliness is next to impossible.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--r7tUYVWcdYzDJoZW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 02, 2019 at 02:02:41PM +0000, Vaittinen, Matti wrote:
> On Mon, 2019-12-02 at 13:11 +0000, Mark Brown wrote:

> > No, look at the bindings - we support a bunch of different
> > suspend states matching the different suspend states that the
> > kernel as a whole supports.  We don't assume that the device will
> > know this but you can always use the current suspend we're going
> > for to decide where to update.

> Hm. So if I understand this correctly, you mean user should set the
> suspend 'target' - and then call the set_suspend_voltage for this
> state. To set voltages for all states one should do loop

The general idea is that we set the suspend state during the
process of suspending rather than in advance - that way when the
hardware doesn't understand different types of suspsend things
work fine.

> get_current_mode()

> for_all_modes() {
> 	set_mode()
> 	set_voltage()
> }

> restore_original_mode()

> am I on a right track? I'll try to see if I can find some examples of
> this - thanks.

I don't understand the save and restore of mode?  If setting the
suspend configuration affects the runtime state then the hardware
doesn't support suspend configuration.

> > The framework doesn't care how a device is controlled, that's up
> > to the device.  Like I said I recommend figuring out what
> > voltages are useful to have quick access to at runtime, for
> > example it's likely that it's good to have quick access to the
> > highest voltage that's been set (and/or the top of the
> > constraints).

> Problem is that the run-level controlled regulator can't be
> individually controlled (unless it is only regulator in the group). I

Regulators that have to be controlled en masse aren't really
supported by the API, it only understands regulators that are
individually controllable.

> But just to confirm, I meant for example assigning bucks 1,2,6 and 7
> into a group which 'state' is changed via GPIO line. Say 'states' are
> RUN0, RUN1. For each of these bucks we can define a voltage and
> enable/disable status which is to be used on RUN0, and another
> voltage/state tuple for RUN1.

So you could also just create a group consisting of a single
regulator?  That would be fine for the API.

--r7tUYVWcdYzDJoZW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3nqtQACgkQJNaLcl1U
h9DtkQf/ZOvqt/xvJrkjQ2zSreCV2pRVglwsGchtoOcrs1gS/5iuRXJb8Fic/clC
BMt7wBK5Zqeu6q2A3oqQ85hPjYMipgmMfwDQzNCGMTHN+EpVvmYX0R8PXWM5yEiP
SJJ3ZVZHk2TqOIhiGwFbBpYnm3u/J5AbHeHXPXKVMuyMap2OVfXFx2DNexM1vC4X
Kj70z8B9MA7Hv+VBbmOK/+nsQiRVkr8FyZjoefUdmIF1vPHqMWXA9S8+jziZoyZS
6QZ5EJFXS99omTKYYeOL4R6RlrMW/Ln5HWRWWuXVNV8uvt3xqQNln9QMSNYzHGAn
3fl1ynbYU1UiEsY07AKvLnboLE0iDA==
=9lBU
-----END PGP SIGNATURE-----

--r7tUYVWcdYzDJoZW--
