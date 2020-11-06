Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FAD32A9614
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 13:17:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbgKFMR2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 07:17:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:56176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727216AbgKFMR2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Nov 2020 07:17:28 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A44B20715;
        Fri,  6 Nov 2020 12:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604665047;
        bh=bZKxLN7RY3HhlK+0rxvWdPBgq3Fle0UPqj94HYU3RGU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1GY4xHL0sRl9FfS2prnzEVLTSNnG1Fmgmn+DetygieeuVuprMQwjik3X3Ru80NdT3
         5E6f7OTD2CVxNRXkvyvk3UZxWJ2hSmnesQagdM+aTg12kC80rvk9bngqc6L68nQFlC
         70cc6fJyWsmHpIriPBj1XRz5yfyqu5+Pu+0oIp2E=
Date:   Fri, 6 Nov 2020 12:17:15 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [RFT PATCH v2 7/8] gpio: exar: switch to using regmap
Message-ID: <20201106121715.GA49612@sirena.org.uk>
References: <20201104193051.32236-1-brgl@bgdev.pl>
 <20201104193051.32236-8-brgl@bgdev.pl>
 <20201105174057.GG4856@sirena.org.uk>
 <CAMRc=Mffr4pn+mnuO6WVP9p3JT-G_t8buJBZMBBRFjQDsfLeuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mffr4pn+mnuO6WVP9p3JT-G_t8buJBZMBBRFjQDsfLeuw@mail.gmail.com>
X-Cookie: When does later become never?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2020 at 12:13:55PM +0100, Bartosz Golaszewski wrote:
> On Thu, Nov 5, 2020 at 6:41 PM Mark Brown <broonie@kernel.org> wrote:

> > AFAICT (and indeed now I dig around assign_bit() only works on a single
> > bit and does both shifts which makes the correspondance with that
> > interface super unclear, we're not mirroring that interface here).  If
> > you're trying to clone the bitops function it should probably be an
> > actual clone of the bitops function not something different, that would
> > be clearer and it'd be easier to understand why someone would want the
> > API in the first place.  But perhaps I'm missing something here?

> It's true that bitops set/clear/assign bit macros work on single bits
> and take their offsets as arguments. However all regmap helpers
> operate on masks. Two release cycles back we added two helpers
> regmap_set_bits() and regmap_clear_bits() which are just wrappers
> around regmap_update_bits(). The naming was inspired by bitops
> (because how would one name these operations differently anyway?) but
> it was supposed to be able to clear/set multiple bits at once - at
> least this was my use-case in mtk-star-emac driver I was writing at
> the time and for which I wrote these helpers.

Which is fine and not at all unclear since there's no separate value
argument, the value comes along with the name. =20

> Now the regmap_assign_bits() helper is just an extension to these two
> which allows users to use one line instead of four. I'm not trying to
> clone bitops - it's just that I don't have a better idea for the
> naming.

I really don't see the benefit to the helper, it makes sense in the
context of bitops where the operation does all the shifting and it's
only a single bit but for regmap where it's dealing with bitmasks as
well and the naming doesn't make it crystal clear I can only see this
being confusing to people.  Had the set and clear helpers for regmap
been done as single bits it'd be a lot easier but that's not the case
and it'd also be odd to have just this one helper that took a shift
rather than a bitmask.

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+lPsoACgkQJNaLcl1U
h9B+RAf/YyKNM+XnHh2JvHiISQaTNYhLlUfYUKDPeMWWQBUJbgGMGrc85OM8pazO
9MdyCQtmU9N11JcmHWzS+9hbg1sg+8YY5Wvfh6FJSfUqTjGa+MBg9rl0n16US54D
88kXLCvg6xSf46vewCrD7h2PynyDSQEguK5n0y7qrl/8wa8kT1ftxWwON9fgQho8
nOz/7AfbIBfibYdq1SjA5DhyuGlidta4Tv1mkd4ouXxZLeHcalP623bZmwmFQ7Yo
I0Gc11CBg89EkcCofD8At/Q7peLwac8uysTXN9leBHgZyKR6BavrCeuSqlYMd54V
WuxLfmBxSDPDLQcmfjt6ETauXE7UWQ==
=78fN
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
