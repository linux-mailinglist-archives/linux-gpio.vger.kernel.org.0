Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E391F120447
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 12:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfLPLo5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 06:44:57 -0500
Received: from foss.arm.com ([217.140.110.172]:51524 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727316AbfLPLo5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Dec 2019 06:44:57 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6BFE1FB;
        Mon, 16 Dec 2019 03:44:56 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3535C3F6CF;
        Mon, 16 Dec 2019 03:44:56 -0800 (PST)
Date:   Mon, 16 Dec 2019 11:44:54 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Message-ID: <20191216114454.GB4161@sirena.org.uk>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
 <20191212165124.GJ4310@sirena.org.uk>
 <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Content-Disposition: inline
In-Reply-To: <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
X-Cookie: Backed up the system lately?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2019 at 09:55:25AM +0100, Marco Felsch wrote:
> On 19-12-12 16:51, Mark Brown wrote:

> > Something needs to say what that thing is, especially if it's runtime
> > controllable.  In your case from the point of view of software there is
> > actually no enable control so we shouldn't be providing an enable
> > operation to the framework.

> The enabel control signal is always available, please check [1] table
> 63. There is a mux in front of the enable pin so:

What I'm saying is that I think the binding needs to explicitly talk
about that since at the minute it's really confusing reading it as it
is, it sounds very much like it's trying to override that in a chip
specific fashion as using gpiolib and the GPIO bindings for pinmuxing is
really quite unusual.

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl33bjYACgkQJNaLcl1U
h9CVdAf+Kp9Gt6jI1smdYRC5q9QzC1/I+pAe/kPYZU9nCkKrN7T/h4QamB0ktmgq
8ovpP1GU56emAoDhnLgevc9IiJHlvlzog0LL0RWzMb4zf7CuC3hqDt/mIEwKvVqv
vXueIgBOwgBYjkunL4ECOsMz4I1v5uBCmbJTCQwnZWpzkTdabJmr49W0LX2y/yPI
9AgCDJBU1mvD78xAlwMiBWHILuSWcja4dXyBFE0Q4IWyFF1HkslkgrBQL7YY0LaI
wFmnd/nERtjKaTK3ZqL7cXKjz+PbyswmJXT0E1Y4rDRit//tgtJVoUGVmCP5KYpY
bBjSjH7xodB796EmcMPayWwZ23L96g==
=MSqr
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
