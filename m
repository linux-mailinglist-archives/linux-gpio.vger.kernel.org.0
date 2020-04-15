Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CE51AB204
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 21:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436694AbgDOTuo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 15:50:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:40418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406367AbgDOTuh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 15:50:37 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E6B920774;
        Wed, 15 Apr 2020 19:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586980236;
        bh=k50LK4AV1A49znM2MRiULTORGEhOJ6EmpCBTRgrN6FQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0H4lC/7am8WdK6fXWwABQFceU4C+0rCh5I/2agBq0tpwPPrR26Dq4BrtiB20fC7r4
         i7gt2mapzLtpi+fwVPpUubKRlQFXSqy0667p5n1Bhpc/l7vqbHJ85Du1FNU/eWlHI6
         UtDQV3tsyrIOihC7gRS33LfmHXcrezTbLCnIwamQ=
Date:   Wed, 15 Apr 2020 20:50:33 +0100
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
Message-ID: <20200415195033.GL5265@sirena.org.uk>
References: <20200414174530.GK5412@sirena.org.uk>
 <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
 <20200414182728.GM5412@sirena.org.uk>
 <3017b762-7a0c-cee2-06dd-1e96f52eb849@linux.intel.com>
 <20200414195031.GP5412@sirena.org.uk>
 <0d2aed9b-5c79-9ed2-6ca1-67b2688e4c99@linux.intel.com>
 <20200415113630.GC5265@sirena.org.uk>
 <4635e57b-fccd-d8a9-fa99-8124debb3428@linux.intel.com>
 <20200415162247.GF5265@sirena.org.uk>
 <9a7fbbac-818a-01d0-7a32-8ae313f9ad50@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CgTrtGVSVGoxAIFj"
Content-Disposition: inline
In-Reply-To: <9a7fbbac-818a-01d0-7a32-8ae313f9ad50@linux.intel.com>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--CgTrtGVSVGoxAIFj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 12:26:57PM -0500, Pierre-Louis Bossart wrote:

> > You have the opportunity to run whatever code you want to run at the
> > point where you're registering your drivers with the system on module
> > init, things like DMI quirk tables (which is what you're going to need
> > to do here AFAICT) should work just as well there as they do later on
> > when the driver loads.

> The idea here was to have one single build, and then rely on what the user
> configured with initrd override to probe the right I2C codec driver and
> indirectly the machine driver. It's similar to device tree overlays.

> With the same up2 board, I change the .aml file in
> /lib/firmware/acpi-upgrades, swap one HAT board for another and the new
> board is handled automagically.

> I don't see how I can use hard-coded DMI tables or board-specific things
> without losing the single build?

Ugh, so you change for another machine description and don't update any
of the DMI information?  Perhaps you can't...  That doesn't seem very
ACPI given how reliant it is on doing quirks based on DMI data for
modern systems :/

> > The clkdev stuff can use dev_name() so so long as the devices appear
> > with predictable names you should be fine.  If not IIRC everything in
> > ACPI is named in the AML so clkdev could be extended to be able to find
> > things based on the names it gives.

> I had a discussion with Andy Shevchenko that we should precisely not be
> using dev_name() since we don't control the names that ACPI selects for u=
s.

It's not ideal and you should definitely use something better if it's
available but if it's all you've got...  You could also search for the
device by binding string at runtime, that'd blow up if you've got more
than one of the same device but it's a bit less likely.

> And since I was using the generic PRP0001 thing for the clock device to
> probe using the 'compatible' string it's actually even less reliable and
> unique...

I see, though actually that might be a place to set up links from now I
think about it - if you know what the I2C device is going to be called
you could have the platform device for the clock source register the
links too.

> > If existing usages that have ended up getting merged are going to be
> > used to push for additional adoption then that's not encouraging.

> I wasn't trying to push this against your will, rather I wanted to highli=
ght
> that we should be clear on the direction for all these uses of the clk API
> in an ACPI context. If what I suggested here is not the right path, then =
how
> do we deal with all the existing cases? This PCM512x use is not a mainstr=
eam
> usage, we use this board mainly for validation and for community support,
> the other cases with 'mclk' and 'sspX_fsync' are critical and impact devi=
ces
> shipping in large volumes.

The ideal thing would of course be to extend ACPI to encode things like
this in the firmware description so that it is able to reflect the
reality of modern systems, the graph bits of this were already specified
so most of the work has been done.  However it's a bit late for
the shipping systems.

Normal shipping systems are in a lot better position here in that they=20
do have some hope of being able to patch up the links after the fact
with DMI based quirks.  It really would be good to see a way of doing
that deployed, especially in cases where you might otherwise have to
modify the CODEC driver.  I *think* that should be doable, assuming
there's some stable or runtime discoverable naming for the ACPI devices.

In the case of this driver could you look at registering the link from
the device for the clocks?  Have it say "I supply SCK on device X" as it
registers.  That should be fairly straightforward I think, we do that
for one of the regulators.

The main thing I want to avoid is having to have the CODEC drivers know
platform specific strings that they're supposed to look up, or general
approaches where that ends up being a thing that looks idiomatic.  That
was something board files did for a while, it didn't work very well and
we did something better with clkdev instead.  I'm a lot less worried
about this for cases where it's two devices that are part of the SoC
talking to each other, that's relatively well controled and doesn't
affect non-x86 platforms.  When it starts touching the CODECs it's a lot
more worrying.

I think by now there's ample evidence that it's worth investing in
better firmware descriptions :(

--CgTrtGVSVGoxAIFj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6XZYgACgkQJNaLcl1U
h9CYcwf/bDWwfuo2FiWQSP36OnUu8ZBkLZ9OalzWaANi6JQfpeFsDg+aYY0KgjqG
uCFPdS0qLy3ElI1Kn9oyODo8HYrqGHdB5kZn6Eui22vWdq79bH79t5Pt9DUL/pqQ
L5G2HYN72IniSogSEzytlDNbqwocdfsEvmv/ru6EMCimcDDQE3TpBa8u0s3suTIc
zuvB/7rgdPGUATu6koJwfS2/mG5yXq2uE6d3R889bXWnPpnW0EIo3tUWXSF+mh97
Y1zRXPSQVDlLX0aS/cz6XQyPGpgKBtaxAlUSCziVkjDtULYW07dc5iAh2tRkpJY8
4XOjJkROeYdNB2/Hr+ZXzDUFUCeJDA==
=jfnC
-----END PGP SIGNATURE-----

--CgTrtGVSVGoxAIFj--
