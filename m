Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2158100912
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 17:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfKRQUg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 11:20:36 -0500
Received: from foss.arm.com ([217.140.110.172]:36694 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726322AbfKRQUf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Nov 2019 11:20:35 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC2861FB;
        Mon, 18 Nov 2019 08:20:34 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2ADEB3F703;
        Mon, 18 Nov 2019 08:20:34 -0800 (PST)
Date:   Mon, 18 Nov 2019 16:20:32 +0000
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
Subject: Re: [PATCH v5 09/16] regulator: bd71828: Basic support for ROHM
 bd71828 PMIC regulators
Message-ID: <20191118162032.GI9761@sirena.org.uk>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
 <ffd3ea4858f820e565aba88ccac395ce5b661538.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BWWlCdgt6QLN7tv3"
Content-Disposition: inline
In-Reply-To: <ffd3ea4858f820e565aba88ccac395ce5b661538.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
X-Cookie: no maintenance:
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--BWWlCdgt6QLN7tv3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2019 at 08:57:57AM +0200, Matti Vaittinen wrote:

> +static int ramp_delay_supported(struct regulator_dev *rdev)
> +{
> +	switch (rdev->desc->id) {
> +	case BD71828_BUCK1:
> +	case BD71828_BUCK2:
> +	case BD71828_BUCK6:
> +	case BD71828_BUCK7:
> +		return 1;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int bd71828_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
> +{
> +	unsigned int val;
> +
> +	if (!ramp_delay_supported(rdev)) {
> +		dev_err(&rdev->dev, "%s: can't set ramp-delay\n",
> +			rdev->desc->name);
> +		return -EINVAL;

Rather than doing this it's better to just not provide the operation for
devices that don't support it, that makes the handling in the core
easier.

--BWWlCdgt6QLN7tv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3SxM8ACgkQJNaLcl1U
h9Aq0QgAgjb3+2lEoadTP4w8qi9OfeekF/Te3BOzBoRw/N3CEI0LRdBuZ0f+Co++
QefQkzBXUOq8Pu7bNj+3h6eZiOVqwzPGej79fhswkmFiZGzPNHGJEegNAIQQm0Gt
FxLz5qVqIfx2orOMrYbVMIYffkH3hHE5twc3PoUf6lTpyUoErQ1miskrOfiKdqe3
WBlMS73mAzeN65q87QNESqie94xl+DxAY0caeTePuvbEA06Hgf6ZgHvv0uxb/38q
7lI/AzRptAy7HJqHYy6onIRxd12cBoKYa8SsoOlghgepja3prAwDE0eQ0iXo260q
kJTWfpuB6S3o/I5A6W0SUuKwiktIEw==
=/GhS
-----END PGP SIGNATURE-----

--BWWlCdgt6QLN7tv3--
