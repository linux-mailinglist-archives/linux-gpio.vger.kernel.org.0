Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBDE71A9BC5
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 13:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393928AbgDOLH5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 07:07:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:47144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390655AbgDOLHy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 07:07:54 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D1E720737;
        Wed, 15 Apr 2020 11:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586948874;
        bh=UK2YfDhi6th3yPk2HH2R+bk5vBepXBcx+kjcQDjg4ns=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wNkzIf6IsycXNBLxZcPoEvQ8q6mBrTzaO4+u1noOkWYub3+X6Mmtsf5qLANSSeXMu
         9Toyd5nAP8MhKkzRSSzM8x1phPlseQAusbk1xtvXRFR02aQ9PsFYZ3cUmItglNdmul
         5b2O6SNPBP5LmjwudDb0WBwLQkB5GqpL52iniCM0=
Date:   Wed, 15 Apr 2020 12:07:51 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org, tiwai@suse.de,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Hui Wang <hui.wang@canonical.com>,
        Matthias Reichl <hias@horus.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
Message-ID: <20200415110751.GB5265@sirena.org.uk>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414174530.GK5412@sirena.org.uk>
 <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
 <20200414182728.GM5412@sirena.org.uk>
 <3017b762-7a0c-cee2-06dd-1e96f52eb849@linux.intel.com>
 <20200414195031.GP5412@sirena.org.uk>
 <0d2aed9b-5c79-9ed2-6ca1-67b2688e4c99@linux.intel.com>
 <8876c7ef-89f1-b79f-c7c4-7862b9f37db1@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline
In-Reply-To: <8876c7ef-89f1-b79f-c7c4-7862b9f37db1@linux.intel.com>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2020 at 04:02:00PM -0500, Pierre-Louis Bossart wrote:

> Thinking a bit more on this, is the objection on the notion of using a fixed
> string, on the way it's registered or the lack of support for clocks in
> ACPI?

The issue is using a clock named in the global namespace.  Like I keep
saying you're not using ACPI here, you're using board files and board
files can do better.

> From a quick look, the use of a fixed string is rather prevalent, see below.
> Less than 10% of codec drivers rely on a NULL string, so is it really a
> dangerous precedent so use "sclk" in this case? It seems to me that all clk
> providers need to use a unique string - what am I missing here?

> adau17x1.c:	adau->mclk = devm_clk_get(dev, "mclk");

Notice how all the clock lookup functions take both a device and a
string - the device is important here, the string is namespaced with the
device in most usage (including board file usage) so if two different
devices ask for the same name they might get different clocks.

> wm8962.c:	pdata->mclk = devm_clk_get(&i2c->dev, NULL);

This is how lookups that don't even specify a name can work.  You seem
to want to rely on the name only which is very much not good practice,
even on board files.

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6W6wYACgkQJNaLcl1U
h9D2/gf+LXkjRBEzfUWscE+SXIB9cbYvEbk/QxdKbt4nE92a9znb/4i7OhX0mL1n
jypfnP5cV3Jwxe7W6H9DiQ/7kOkzyj0T4eeUANUrnTdO4T/2syULRbl5iEJt4Bcg
G1Kr5copsLvu+Q4DA2dnDSGf+IHoWld/VilQjf3jYKMjQ7nB3EyCMVx2uh4T86uF
XffW9vJJPSnceNgAEgZPBrjfRCp2VR0H0vDZuod9Hi7gbRQ9a9VLTHh0HgrjbOxx
tu9j5y1f9ORSRgzt+i4lg9T5mTY4z+Cp7wS1PBSMSQhbsE26+sXxls+CXYYY2W94
ZyJy69fNojmO5e1xy3kBpKozOk1PJQ==
=Prgy
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
