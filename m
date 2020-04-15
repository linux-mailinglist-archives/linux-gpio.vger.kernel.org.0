Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3321AB2CD
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 22:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438175AbgDOUjZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 16:39:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:55430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438090AbgDOUjX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 16:39:23 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4AA6120787;
        Wed, 15 Apr 2020 20:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586983162;
        bh=F3qZyBdt2Xx1NwEP6uSq60pJt8B7zrWHn0GD/ylers8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RisHhF3jA6l7pk2/1o4KS7ZVzduaO9wpuoTq4cpb1LqSFRrPVk2cxGA3ebcru1oLg
         vTmRqcRDblI5UfRiOpU257GuoDjSId0OmwBRigzMPdHnOshL0vp0PGtHYdDstGUru5
         ZjymD2Yc1OOWIhyTR2vtky9zew687ZvpEpHTs9zo=
Date:   Wed, 15 Apr 2020 21:39:20 +0100
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
Message-ID: <20200415203920.GN5265@sirena.org.uk>
References: <20200414182728.GM5412@sirena.org.uk>
 <3017b762-7a0c-cee2-06dd-1e96f52eb849@linux.intel.com>
 <20200414195031.GP5412@sirena.org.uk>
 <0d2aed9b-5c79-9ed2-6ca1-67b2688e4c99@linux.intel.com>
 <20200415113630.GC5265@sirena.org.uk>
 <4635e57b-fccd-d8a9-fa99-8124debb3428@linux.intel.com>
 <20200415162247.GF5265@sirena.org.uk>
 <9a7fbbac-818a-01d0-7a32-8ae313f9ad50@linux.intel.com>
 <20200415195033.GL5265@sirena.org.uk>
 <b2db6026-c29f-0213-98d1-d8533e3159e1@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="prC3/KjdfqNV7evK"
Content-Disposition: inline
In-Reply-To: <b2db6026-c29f-0213-98d1-d8533e3159e1@linux.intel.com>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--prC3/KjdfqNV7evK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 03:22:50PM -0500, Pierre-Louis Bossart wrote:

> > In the case of this driver could you look at registering the link from
> > the device for the clocks?  Have it say "I supply SCK on device X" as it
> > registers.  That should be fairly straightforward I think, we do that
> > for one of the regulators.

> When you wrote 'in the case of this driver', were you referring to the clock
> provider, saying 'I support SCK on device i2c-104C5122:00' ?

Yes.

> If you have a pointer on the regulator example, I'd appreciate it, I am
> really way beyond my comfort zone.

The arizona driver is what I was thinking of, that's more complex than
you proabably need as it's a MFD.

> Maybe an alternate suggestion if you want to avoid hard-coded strings in the
> kernel: what if we added optional properties for the clock lookup name in
> both the codec and clock driver, and set the name in a _DSD blob. That would
> move the platform-specific names to platform firmware, and avoid the links
> described above that are probably ACPI-only.

If you read the lookup information from firmware somehow that's probably
fine I think.  It's not nice but if it's baked into firmware...

> > I think by now there's ample evidence that it's worth investing in
> > better firmware descriptions :(

> Indeed, and tools to check they are correct! Most of the stuff we defined
> for SoundWire ends-up wrong or undefined, still an uphill battle...

The audio-graph-card appears to be working really well FWIW,
Morimoto-san did an excellent job there.

--prC3/KjdfqNV7evK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6XcPcACgkQJNaLcl1U
h9CebAf6A48V9aus+H7FxEuq8AB7bAyf63kZiGZv2wSHn2LPeRtdM3Gq+gQ8DX9B
ABou4ScgfHuBiZJgP6/CXeSIJDoyRSvrMWyv/RkGa9Dunj+THYuMATPnC9lDZYPt
mNV/3tTBBOBajXwJgkMKw3lGnUz9o2BaQeiWBYin8LH0SpqddEn5ORv5Jv2Pf4CN
dNhyO1C8Bfd1aUhhUzmLQwvkh9WU7hRPutGJMcj1Ygf3ayRFUTHV8txS1d8ikEi6
2wi8zeIhgpgK4G4WUxgLUbT4kj1zqV3ZAPEaz9ALlh8Fy7EctSi8tFeAWCZMETX/
Kli2fIRNAisVjMywH3V0NtxEI/MVxA==
=uaKf
-----END PGP SIGNATURE-----

--prC3/KjdfqNV7evK--
