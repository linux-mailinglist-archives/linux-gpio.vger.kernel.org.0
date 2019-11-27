Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64C4D10B24A
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 16:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfK0PTc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 10:19:32 -0500
Received: from foss.arm.com ([217.140.110.172]:49030 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726603AbfK0PTc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Nov 2019 10:19:32 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93EC71045;
        Wed, 27 Nov 2019 07:19:31 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1299D3F68E;
        Wed, 27 Nov 2019 07:19:30 -0800 (PST)
Date:   Wed, 27 Nov 2019 15:19:29 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] mfd: da9062: add support for the DA9062 GPIOs in
 the core
Message-ID: <20191127151929.GC4879@sirena.org.uk>
References: <20191127115619.20278-1-m.felsch@pengutronix.de>
 <20191127115619.20278-3-m.felsch@pengutronix.de>
 <CACRpkdYLeSjsXaG6Bg4Y2-8PW41ALn4PN7QUvp3tA7XReWrKGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Content-Disposition: inline
In-Reply-To: <CACRpkdYLeSjsXaG6Bg4Y2-8PW41ALn4PN7QUvp3tA7XReWrKGg@mail.gmail.com>
X-Cookie: In the war of wits, he's unarmed.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 27, 2019 at 02:35:33PM +0100, Linus Walleij wrote:

> I can clearly see that regmap's irqchip does not support
> hierarchical interrupt domains, so we should just make a
> mental note somewhere that "oh yeah and then one day
> we should make regmap irqchips play well with hierarchical
> interrupts".

Why, what do we need to do?  We're just doing all the default stuff,
it's not something we've opted out of, and the whole point with using
the frameworks should be that we should get software features like this
for free :(

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3elAAACgkQJNaLcl1U
h9D/mQf/SHkiJNyz5FkWqFCul6Rt1OwIG+cxhJcAMYt3DG6Z4hZtfJYwO7vyc/6w
tJOi4We6kadTsMTJubGZKeGW8dfc1/FlIRRKNAVyirE0CVgPK4QxD9siE/6WIAVp
vid8GzArd5VS0Lnjq9oZT8bSdQQnoFnH24w+AWV1vU9G3K0uNx8GQBN5q0/1kLpj
USGiLl6Bc7DaA2cbcxVtKrjT4Z4Zrg36t61kT4fxbe8IK65Mb4V7sNMPdMqr5LaO
PRHl4b4JZoleFOwkrwa5b5qMxx+f4fPZkOQ84wwCGm9eilLujuZAypo3Xyd20xzQ
q4FpiOjwFOv3eEPp008ZB9lxsD5jSg==
=PTcB
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--
