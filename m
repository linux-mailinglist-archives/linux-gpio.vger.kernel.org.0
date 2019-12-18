Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D360A1247C4
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 14:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbfLRNNA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 08:13:00 -0500
Received: from foss.arm.com ([217.140.110.172]:45860 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726545AbfLRNNA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Dec 2019 08:13:00 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C74730E;
        Wed, 18 Dec 2019 05:12:59 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67D5A3F718;
        Wed, 18 Dec 2019 05:12:58 -0800 (PST)
Date:   Wed, 18 Dec 2019 13:12:57 +0000
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
Message-ID: <20191218131256.GA42175@sirena.org.uk>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
 <fea73fd89f0db81fac30eba3b523c2232c401eae.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
In-Reply-To: <fea73fd89f0db81fac30eba3b523c2232c401eae.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
X-Cookie: In the next world, you're on your own.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--jI8keyz6grp/JLjh
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

This doesn't apply against current code, please check and resend.

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl36JdgACgkQJNaLcl1U
h9DRzAf9GnOeN9QrXV/Jr5D4kRT68S0BysPHNoXDglBc5m5saw2Xi10Wt8Yov3+b
1tdcVFQmjj41vcRZ8FHNma019NBth1CezUFjN9EagATCMFH2tFculjHcLFSywRhY
EBL4+OttxR37zIS7rtqWbk6U8GUNrTjJKbZeELPODuIkSxCJGSrm5TwMvmVnyCie
8jKr9a/7f4USdEz//uVvAbK0lAhwujG781fF+ymXz8hjJw+2NyZ9QYtpxqO53x/m
Z6ImWi10KNA4p3nHHs6dcJcaotd6wYv7zB5B5bWSP5E8L9Csl/AzVfZNkHwMFK20
Nswu4+WMO8olZX88qcj/ZsccB6glKg==
=KLXG
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
