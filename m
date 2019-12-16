Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1120B1208FC
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 15:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbfLPOzd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 09:55:33 -0500
Received: from foss.arm.com ([217.140.110.172]:57962 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728008AbfLPOzd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Dec 2019 09:55:33 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6664A1FB;
        Mon, 16 Dec 2019 06:55:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D91B93F718;
        Mon, 16 Dec 2019 06:55:31 -0800 (PST)
Date:   Mon, 16 Dec 2019 14:55:28 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v6 09/15] regulator: bd71828: Basic support for ROHM
 bd71828 PMIC regulators
Message-ID: <20191216145528.GE4161@sirena.org.uk>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
 <5b1c4a22c7945e97ff2a7924abfeb3239043f8eb.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vv4Sf/kQfcwinyKX"
Content-Disposition: inline
In-Reply-To: <5b1c4a22c7945e97ff2a7924abfeb3239043f8eb.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
X-Cookie: Backed up the system lately?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--vv4Sf/kQfcwinyKX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 11, 2019 at 11:46:11AM +0200, Matti Vaittinen wrote:

> +static int bd71828_ldo6_get_voltage(struct regulator_dev *rdev)
> +{
> +	return BD71828_LDO_6_VOLTAGE;
> +}
> +
> +static const struct regulator_ops bd71828_ldo6_ops = {
> +	.enable = regulator_enable_regmap,
> +	.disable = regulator_disable_regmap,
> +	.get_voltage = bd71828_ldo6_get_voltage,

You can just set fixed_uV in the regulator_desc, you don't need a
get_voltage() operation here.  Otherwise this looks good, I'll apply it
and please send an incremental fix for this.

--vv4Sf/kQfcwinyKX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl33mt8ACgkQJNaLcl1U
h9DPqggAhcsF1ZeRBaP6Lzz9ZA0lX48wnM91c45AzpXxhBPVmVU8EJrJFkmUT+zI
VYHCWzrWqZoUwoxRDUntTg0W7omOi4CoU10/2SGjxkdxHiAmutKvaV8e155DaKRj
hhZGeaSRdWgD3uYUZGBB1W9OYmzuHx6NtlL76FfabMt6TTPQCq7X3VjSuI4wi4oN
7JLtu6Gzf2WNSmP1uqZLMSqk1RvgZa2K1rgRwf+SYhTD21VWliTuq/qGtg0zmijW
BA398k1yTl123ecTnS9Fnk+IsqPSTd/mBJT4TmFkdakxVm3JSYIqpqIiJYZtGOBs
aUVTHrBVlYfYIk4raTP8w2l2xYiNdg==
=0wbA
-----END PGP SIGNATURE-----

--vv4Sf/kQfcwinyKX--
