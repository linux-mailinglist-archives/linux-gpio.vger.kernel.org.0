Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60456100929
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 17:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfKRQZG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 11:25:06 -0500
Received: from foss.arm.com ([217.140.110.172]:36762 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbfKRQZG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Nov 2019 11:25:06 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D16DEDA7;
        Mon, 18 Nov 2019 08:25:04 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12FD93F703;
        Mon, 18 Nov 2019 08:25:04 -0800 (PST)
Date:   Mon, 18 Nov 2019 16:25:02 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Message-ID: <20191118162502.GJ9761@sirena.org.uk>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
 <d29e0eb587b764f3ea77647392e45fac67bbd757.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8tZVdKiiYitVG083"
Content-Disposition: inline
In-Reply-To: <d29e0eb587b764f3ea77647392e45fac67bbd757.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
X-Cookie: no maintenance:
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--8tZVdKiiYitVG083
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 08:53:57AM +0200, Matti Vaittinen wrote:

> +#Supported default DVS states:
> +#buck		| run		| idle		| suspend	| lpsr
> +#-----------------------------------------------------------------------=
-----
> +#1, 2, 6, and 7	| supported	| supported	| 	supported (*)
> +#-----------------------------------------------------------------------=
-----
> +#3, 4, and 5	| 			supported (**)
> +#-----------------------------------------------------------------------=
-----
> +#(*)  LPSR and SUSPEND states use same voltage but both states have own =
enable /
> +#     disable settings. Voltage 0 can be specified for a state to make r=
egulator
> +#     disabled on that state.
> +#(**) All states use same voltage but have own enable / disable settings.
> +#     Voltage 0 can be specified for a state to make regulator disabled =
on that
> +#     state.
> +
> +      rohm,dvs-runlvl-ctrl:
> +        description: |
> +          buck control is done based on run-level. Regulator is not
> +          individually controllable. See ../mfd/rohm,bd71828-pmic.yaml f=
or
> +          how to specify run-level control mechanism. Only bucks 1, 2, 6
> +          and 7 support this.
> +        type: boolean

I don't think I saw this having the effect on set_voltage() that I'd
have expected in the driver? =20

> +      rohm,dvs-runlevel-microvolts:
> +        minimum: 0
> +        maximum: 2000000
> +        maxItems: 4
> +        description:
> +          Array of voltages for run-levels. First value is for run-level=
 0,
> +          second for run-level 1 etc. Microvolts.

What's the mapping from array indexes to the names used elsewhere to
support runlevels?

--8tZVdKiiYitVG083
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3Sxd0ACgkQJNaLcl1U
h9CCTwf/XyyhpE5QABB0yoyT4n2JEfyYggDTfnGhWaILUDJBNnJ7inK77EpoLaGL
ybxABHwiIONAnVzWxn+N2THjqO+fbukf7LO6DvYe8FCfoaIz8A6qgGm+P9IC1CWw
xeWdZwGwWh63iRZ+fR422SlmmNtykgb4QHUdvwEZ9fqMhqPgRGP6YWl5RSuCnC8R
oE9SPG2GlA/I4kadkV6O503q496yvB6hLiOgXWZ3yWJY2uYNYJvn0sNpd+k0iZK4
H4iyzLTOIUiD3RpLgNTPrmYXn1D/wClO+l2FqRjpzgq7tDO4xVyEOY8bTH9MrFoD
36C7jhTJbW2tecxGFK5eemuG+i4Vxg==
=mxuN
-----END PGP SIGNATURE-----

--8tZVdKiiYitVG083--
