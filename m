Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 582D3124F3E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 18:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbfLRR1a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 12:27:30 -0500
Received: from foss.arm.com ([217.140.110.172]:54920 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727089AbfLRR1a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Dec 2019 12:27:30 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EB9F1FB;
        Wed, 18 Dec 2019 09:27:29 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0E2D3F67D;
        Wed, 18 Dec 2019 09:27:28 -0800 (PST)
Date:   Wed, 18 Dec 2019 17:27:27 +0000
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
Subject: Re: [PATCH v6 08/15] regulator: bd718x7: Split driver to common and
 bd718x7 specific parts
Message-ID: <20191218172727.GL3219@sirena.org.uk>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
 <fea73fd89f0db81fac30eba3b523c2232c401eae.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7l042bGvurpep9Wg"
Content-Disposition: inline
In-Reply-To: <fea73fd89f0db81fac30eba3b523c2232c401eae.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
X-Cookie: Power is poison.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--7l042bGvurpep9Wg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 11, 2019 at 11:44:51AM +0200, Matti Vaittinen wrote:
> Few ROHM PMICs allow setting the voltage states for different system states
> like RUN, IDLE, SUSPEND and LPSR. States are then changed via SoC specific
> mechanisms. bd718x7 driver implemented device-tree parsing functions for
> these state specific voltages. The parsing functions can be re-used by
> other ROHM chip drivers like bd71828. Split the generic functions from
> bd718x7-regulator.c to rohm-regulator.c and export them for other modules
> to use.

Acked-by: Mark Brown <broonie@kernel.org>

--7l042bGvurpep9Wg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl36YX4ACgkQJNaLcl1U
h9AI5Qf8DyMoeOZZ3b1i5ellMm0RDOYSYPZHH/HbNVc9POUCUqAmocPri1eOtfK7
oEitUxGtbX9FohXmvBoVgR4+FqSitzPP3tnkOYXGpMUhnor0LT44YCFRfay6Plc9
uxAsYj8nzSfu/yvOfDMlX2iRMS1zkERyxbCc5ug7/7GF6kM/+zsrctS2mzd7wbJc
GY4PCC70UuCLim+qts5yQ1lFAtgkn0tg2Xn7O70bWyte5EjA/GZE12cz4ol2yHxr
AygfcwT1YPBkyrtT2ydvn1kRa2LJjO9mc/PVMZSTS6b3yh+gm50nybfNvQMh1l7Q
a7CveVrWl7/1JJtHwRbW5hT+tH+CKQ==
=PWlS
-----END PGP SIGNATURE-----

--7l042bGvurpep9Wg--
