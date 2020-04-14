Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5D6B1A8B8F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 21:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505225AbgDNTwc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 15:52:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:40486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440447AbgDNTui (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 15:50:38 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7F8B206E9;
        Tue, 14 Apr 2020 19:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586893834;
        bh=AaVRnbZybz5vMRXZrxlv2ehOvw55VQ60KvRSyrqRWl0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T6DqFvTy/pvyT/vTpQRGMizfJxyc3EUOxpiHF8nq8wCYcvaOJRCdXubaojqlSNNQh
         hPmW0t2zAjzkUlwTXdJladshIu1UE1tKx3bVRfCUvqpqsJZltTJPomDV1QLNTQIbyR
         r3Cjah8psl1vMBwD8+TnpWsd6ujezLfHBAHVO0a0=
Date:   Tue, 14 Apr 2020 20:50:31 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, tiwai@suse.de,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
Message-ID: <20200414195031.GP5412@sirena.org.uk>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414174530.GK5412@sirena.org.uk>
 <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
 <20200414182728.GM5412@sirena.org.uk>
 <3017b762-7a0c-cee2-06dd-1e96f52eb849@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0UhZIN3Sa23/ILEd"
Content-Disposition: inline
In-Reply-To: <3017b762-7a0c-cee2-06dd-1e96f52eb849@linux.intel.com>
X-Cookie: I've only got 12 cards.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--0UhZIN3Sa23/ILEd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2020 at 02:15:16PM -0500, Pierre-Louis Bossart wrote:
> On 4/14/20 1:27 PM, Mark Brown wrote:

> > Wait, so SCLK is in the *global* namespace and the provider has to
> > register the same name?  That doesn't sound clever.  It might be better
> > to have the board register the connection from the clock provider to the
> > device rather than hard code global namespace strings like this, that
> > sounds like a recipie for misery.

> I believe this change has zero impact on DT platforms.

> The 'sclk' is a fallback here. If you find a clock with the NULL string,
> it's what gets used. Likewise for the clock provider, the 'sclk' is a lookup
> - an alias in other words. The use of the references and phandles should
> work just fine for Device Tree.

It's not just DT platforms that I'm worried about here, it's also ACPI
systems - all it takes is for a system to have a second device and a
name collision could happen, especially with such generic names.  We
tried to avoid doing this for board files for the same reason.

> > It is really sad that nobody involved in producing these systems that
> > don't work with the current limitations in ACPI has been able to make
> > progress on improving ACPI so it can cope with modern hardware and we're
> > having to deal with this stuff.

> I can't disagree but I have to live with what's available to me as an audio
> guy...I had a solution two years ago where I could set the clock directly
> from the machine driver. The recommendation at the time was to use the clk
> framework, but that clk framework is limited for ACPI platforms, so we can
> only use it with these global names.

My understanding is that ACPI just doesn't have clock bindings (or audio
bindings or...) so you're basically using board files here and board
files can definitely do more than we're seeing here.

> We had the same problem on Baytrail/Cherrytrail devices some 4 years ago and
> we had to use an 'mclk' alias. We are going to have the same problem when we
> expose the SSP MCLK, BLCK and FSYNC clocks - and that's also what the
> Skylake driver did - we don't have a solution without global names.

You should be able to register links between devices using the clock
API, or add that functionality if it's not there but AFAIK clkdev still
works.

--0UhZIN3Sa23/ILEd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6WFAYACgkQJNaLcl1U
h9Byqwf9FHKLkxTXEYOkKQknonTH+2/9DiOFIk1jbin5OOzdlJzc682Clt8cCXGO
IN2Se5PIYE0yU5nFwivSioVBRtyxjM1GSmw8B0iz6XdcF4OXa6FxNraCewLYuNoG
+BsgxShrkzMixnTORYbOthcDHX2TsoNNBL3FkWBKvZRiG8BzObkztj+lDpRvgd+f
I1d82Gdo9Hz6yozOskQnQDW0Dh/4uInR/V/cEzjcr+HaWJCD0aWkH+Ead4dYS0MA
GcFLx/t86XUxXyz65R3PUh0exPZbiTCvWQPWlFBXsTTKV8pcN355Qox5zjESiz4+
jaE33TfCTPpUXfwcwJzr0yPkBQiYHQ==
=xvJN
-----END PGP SIGNATURE-----

--0UhZIN3Sa23/ILEd--
