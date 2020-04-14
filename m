Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3962B1A897A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 20:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503957AbgDNS1e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 14:27:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:39760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503953AbgDNS1c (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 14:27:32 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2070620774;
        Tue, 14 Apr 2020 18:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586888851;
        bh=setRMLbaGbdY6PfeXmGfv+P7oCdBEUV8af+jR4fH8Oo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mgUpmwnb5CDveFVgJHc4JDrOUzHq9FBD78BcxY4mQQouaDyuIGe1f1kFNblCrx3Ja
         nvkNxhJcNe9EQKPcCiE/1QcJc81oQZh4MeXoY97nuBMpATca9MxwKNv/YFNGy/LPEn
         eGjATpc0T7zOs8qPcKYUdihbl1y7nTWUKNhxcqK8=
Date:   Tue, 14 Apr 2020 19:27:28 +0100
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
Message-ID: <20200414182728.GM5412@sirena.org.uk>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414174530.GK5412@sirena.org.uk>
 <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2YJj5f1P6Th4nBRw"
Content-Disposition: inline
In-Reply-To: <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
X-Cookie: I've only got 12 cards.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--2YJj5f1P6Th4nBRw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2020 at 01:14:41PM -0500, Pierre-Louis Bossart wrote:
> On 4/14/20 12:45 PM, Mark Brown wrote:
> > On Thu, Apr 09, 2020 at 02:58:27PM -0500, Pierre-Louis Bossart wrote:

> > > Using devm_clk_get() with a NULL string fails on ACPI platforms, use
> > > the "sclk" string as a fallback.

> > Is this something that could be fixed at the ACPI level?

> I guess to fix this we'd need some sort of ACPI-level connection or
> description of the clock, and I've never seen such a description?

Wait, so SCLK is in the *global* namespace and the provider has to
register the same name?  That doesn't sound clever.  It might be better
to have the board register the connection from the clock provider to the
device rather than hard code global namespace strings like this, that
sounds like a recipie for misery.

It is really sad that nobody involved in producing these systems that
don't work with the current limitations in ACPI has been able to make
progress on improving ACPI so it can cope with modern hardware and we're
having to deal with this stuff.

> All the examples I've seen use an explicit 'mclk' string (that's e.g. what
> we did for the PMC clocks for Baytrail/Cherrytrail machine drivers, we added
> a lookup). Here I used 'sclk' since it's what TI refers to in their
> documentation.

They appear to call it SCK not SCLK.

--2YJj5f1P6Th4nBRw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6WAJAACgkQJNaLcl1U
h9BADwf/fED5QJj8MeBLvtZRaTiqY4MJ/SKDCRbWQCSE1rKJquN+Q6S3Sw9LA6Pl
+b6iqkWOyfvqyeHJTwR0cSNAgmaPHhbsmMKx6zX2+lyV0PO440CQ9B7EyK48Bp4F
CX950pYjFVn0bmMKvwCE2zfogp2U7ZZky8NftSWGUkYb84/8sRyL3MTa52dR+SEW
XI7I157Jehggi1pMsv5W11ikZnzGF3IwlIviWtq/3cM1Ji+4ZDiYCAni/zheOfFF
w8OdUEoRqh8NIU2/apKSFLWAuyEubp7v2i784hEmjJrXgDQfs4P06rwb2Z0Og2MG
0xmKr5g0y2UpAqVwO5SPq+uriix5FA==
=5dN/
-----END PGP SIGNATURE-----

--2YJj5f1P6Th4nBRw--
