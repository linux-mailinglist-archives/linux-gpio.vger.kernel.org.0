Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D204D1AA2FE
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 15:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505747AbgDONCv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 09:02:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:56330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2897154AbgDOLge (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 07:36:34 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF07220857;
        Wed, 15 Apr 2020 11:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586950592;
        bh=hGaPNPo2bXtmqhGm530nnBNN9yGymFS64dOLD7ZHm+o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RDSYzi66kakJCorZcJfkhARuzoUP//RGk5PLdJ450hrz9g205FplNu38EDzppW/ov
         TCUjHOeKWHOSTLwCFCbpwKqRyUxti0cC9B2ozrkZROzXFkqvqAvpSIOxTy8oo0lB0W
         Xk5FBXSqwwoz0VxNjsg4z4a60Fm/ZN4QZv2mS4DA=
Date:   Wed, 15 Apr 2020 12:36:30 +0100
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
Message-ID: <20200415113630.GC5265@sirena.org.uk>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414174530.GK5412@sirena.org.uk>
 <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
 <20200414182728.GM5412@sirena.org.uk>
 <3017b762-7a0c-cee2-06dd-1e96f52eb849@linux.intel.com>
 <20200414195031.GP5412@sirena.org.uk>
 <0d2aed9b-5c79-9ed2-6ca1-67b2688e4c99@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Content-Disposition: inline
In-Reply-To: <0d2aed9b-5c79-9ed2-6ca1-67b2688e4c99@linux.intel.com>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2020 at 03:13:01PM -0500, Pierre-Louis Bossart wrote:
> On 4/14/20 2:50 PM, Mark Brown wrote:

> > It's not just DT platforms that I'm worried about here, it's also ACPI
> > systems - all it takes is for a system to have a second device and a
> > name collision could happen, especially with such generic names.  We
> > tried to avoid doing this for board files for the same reason.

> I am on the paranoid side but here I don't see much potential for conflicts:

> a) this only works for the Up2 board with a HAT connector
> b) this only work with the Hifiberry DAC+ PRO board.

> This codec is not used in any traditional client devices.

That's what you're doing right now but someone else can use the same
devices, or adopt the same approaches on something like a Chromebook.

> > My understanding is that ACPI just doesn't have clock bindings (or audio
> > bindings or...) so you're basically using board files here and board
> > files can definitely do more than we're seeing here.

> I don't understand your definition of board file, sorry. We've never had
> one, the only thing that's board-specific is the machine driver.

Architectures that don't have firmware bindings use straight C code to
register and set things up.  Machine drivers are essentially board
files, they're just audio specific bits of board file that use audio
APIs and so are in the sound directory.

> > You should be able to register links between devices using the clock
> > API, or add that functionality if it's not there but AFAIK clkdev still
> > works.

> The machine driver has no information whatsoever on who provides the clock.
> I just don't see how I might link stuff without at least some amount of
> information?

The machine driver must have this information, it knows exactly what
hardware it runs on.  The whole point of a machine driver is that it's
board specific.

> All I needed was to toggle 2 gpios to select 44.1 or 48kHz...Looks like it's
> going to take two more years, oh well.

I think you're giving up way too easily here.  The kernel has really
good support for systems that don't have any firmware description at
all, this shouldn't be complex or breaking new ground.

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6W8b0ACgkQJNaLcl1U
h9D17Af/RhGgm4ZGHtLAdFJ+aGM6tFqBf1vbPHV3CiIESBM6b2F4siv8Zz1Tm62X
ZrLAoIDt7NB9a9wxuWGYzZL0QKOunAXzw4kAxwdh3HlJPhrlc+mG0CPkc2gccNgb
v9AQRQJX5Q6RkRsXPKLTENGvvBH/pjsybKCnHGZtj4ffWfitIRGLkRWa5ieEL0XS
NAY2B1/Oqj0m9UXZnPC4vHPEyflD5z5thYNpCtrikrqWA0f/ydpYVOhLZxI7/Sli
Bc/Z2E7vEoA/uifEu97t0X0VEqHShdd1ha7EPpNdPv5OUFW4GSrM6XJOIYGmtcAx
ZKzPKc7vExdL8HgvNakMTp98Uxxfhw==
=Be0S
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--
