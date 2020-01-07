Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA67513271F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 14:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbgAGNJP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 08:09:15 -0500
Received: from foss.arm.com ([217.140.110.172]:57516 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728109AbgAGNJO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Jan 2020 08:09:14 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F226631B;
        Tue,  7 Jan 2020 05:09:13 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 571BF3F703;
        Tue,  7 Jan 2020 05:09:13 -0800 (PST)
Date:   Tue, 7 Jan 2020 13:09:11 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Message-ID: <20200107130911.GD4877@sirena.org.uk>
References: <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
 <20191212165124.GJ4310@sirena.org.uk>
 <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
 <20191216114454.GB4161@sirena.org.uk>
 <20191217073533.GC31182@pengutronix.de>
 <20191217125832.GF4755@sirena.org.uk>
 <20200107083654.atgbjhrnhyax2gqq@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mSxgbZZZvrAyzONB"
Content-Disposition: inline
In-Reply-To: <20200107083654.atgbjhrnhyax2gqq@pengutronix.de>
X-Cookie: Will Rogers never met you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--mSxgbZZZvrAyzONB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 07, 2020 at 09:36:54AM +0100, Marco Felsch wrote:
> On 19-12-17 12:58, Mark Brown wrote:

> > This doesn't say anything about how the GPIO input is expected to be
> > controlled, for voltage setting any runtime control would need to be
> > done by the driver and it sounds like that's all that can be controlled.
> > The way this reads I'd expect one use of this to be for fast voltage
> > setting for example (you could even combine that with suspend sequencing
> > using the internal sequencer if you mux back to the sequencer during
> > suspend).

> The input signal is routed trough the da9062 gpio block to the
> regualtors. You can't set any voltage value using a gpio instead you
> decide which voltage setting is applied. The voltage values for
> runtime/suspend comes from the dt-data. No it's not just a fast
> switching option imagine the system suspend case where the cpu and soc
> voltage can be reduced to a very low value. Older soc's like the imx6
> signaling this state by a hard wired gpio line because the soc and
> cpu cores don't work properly on such low voltage values. This is
> my use case and I can't use the sequencer.

My point is that I can't tell any of this from the description.

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4UgvYACgkQJNaLcl1U
h9AmOwf/dQI3hnspOymA8BdYOaCtzXhoiVJeMde8RKleUyfpqEoLvele7bnhJvxP
66E8RM0aDJk6N+Jc5KzXO1mb1JWFhiGQM92q3NXPczpOyvgl/zl0UwKMnqHnj4nd
/vDVfa60zDKTbUCS12us1kwgJNtHVRiFb8DX+9W3zSONqE5QIeNjmMMoL4EaPwJb
clCtLm7jBckZinNOefKS6M2eElpRFFhtRON7EsaDqObH2xTP9aSNb9PEYCBy3nHq
Cr6gYbC0cwgXL29ayf/aRtx3o9/DTC4LIAfAPZvGjDMN5vgYm3bznZKWmVzgR2Pd
1fQ0J3Dh032Q/8ZTkaceklgsT1uGJg==
=uLVS
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--
