Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB341A87FD
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 19:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503063AbgDNRwJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 13:52:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:56504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730007AbgDNRwI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 13:52:08 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7AD842074D;
        Tue, 14 Apr 2020 17:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586886728;
        bh=bBmFGEaWpYg8ap7AtJ78GaxoqXkZsiVqGYraG7fEbc8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wp6LgqVscVKq5YHlPBXE2syWWh3yNkgpqC+91VEwyp5Ovod8vI0hKx65GHf0fJ9Zj
         NhIbdFNC3a6cI3RsqmE1jhfGca3nnr/xKgndpgQI88y7MVj5MX6jQQiJGmNmEug8zE
         5Rq8xDU2kQrm/wrQPpZf0Ns36wk7rBj/ct3fbo8A=
Date:   Tue, 14 Apr 2020 18:52:05 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org, tiwai@suse.de,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 03/16] ASoC: Intel: sof-pcm512x: use gpiod for LED
Message-ID: <20200414175205.GL5412@sirena.org.uk>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-4-pierre-louis.bossart@linux.intel.com>
 <20200414171752.GC34613@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HLsZ5Z1opAQvdr2J"
Content-Disposition: inline
In-Reply-To: <20200414171752.GC34613@smile.fi.intel.com>
X-Cookie: I've only got 12 cards.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--HLsZ5Z1opAQvdr2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2020 at 08:17:52PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 09, 2020 at 02:58:28PM -0500, Pierre-Louis Bossart wrote:

> > +		GPIO_LOOKUP("pcm512x-gpio", 3, "PCM512x-GPIO4", GPIO_ACTIVE_HIGH),

> It says GPIO 4 and here is number 3.
> Does this 4 come from hardware documentation?

Yes, the first GPIO in the device is GPIO1.

--HLsZ5Z1opAQvdr2J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6V+EQACgkQJNaLcl1U
h9AWgQf/bIQs+gv5yXrGrVTSpNHyX246/chEfkEGGW13vu7i30lHMx7WqTl2XYH8
dxug0+PjPKNCxQqtt278m7YnB2VZw1Go9EhQg3pq1HE7nMmf5pVgzB6wHcAkst5R
EIQB8ezHiiVoAfJzdHSC7jXNvuc7PKuqJBPqaUZrink1flI50FyPMybtKNjCHe6n
B+2NyFFIue4/P64qCSVLUtK0GQ2xZiUGIcAbCLMZQJg/CBOvugTygvVYFmLOBIXA
0CHH9ozBELK/ofd55JItdSSueHgQ6RmDNmDiwlfLIkqQhPFC+1l4SJIy0agz3IeQ
tq3d+rvrTW68hHrgEsSddNeRQEXupw==
=7ljH
-----END PGP SIGNATURE-----

--HLsZ5Z1opAQvdr2J--
