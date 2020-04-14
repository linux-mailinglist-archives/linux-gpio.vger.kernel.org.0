Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2661A87E1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 19:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502509AbgDNRpf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 13:45:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:54956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502504AbgDNRpe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 13:45:34 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 145392074D;
        Tue, 14 Apr 2020 17:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586886333;
        bh=TcrgRAaCCn5C89p9zkdB+nBvjexBsT4Fl+qQqU3nKsM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m3R9ysoVEbkDNXoNnHdUSYSWAxPaom9kykXJTjcElSsM3gjBKsU6VTXo4sk5l5Ckg
         jye8BoG+8CqxCd2FahBTI8Annje94Zzz0OrSXiY8k6RG10GspQ3ZNsXgULnNTBHf8q
         SXRiNP8nTfC/YW/vSJbtz5j/o6PUKuOGzBDWfj8Q=
Date:   Tue, 14 Apr 2020 18:45:30 +0100
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
Message-ID: <20200414174530.GK5412@sirena.org.uk>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aqWxf8ydqYKP8htK"
Content-Disposition: inline
In-Reply-To: <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
X-Cookie: I've only got 12 cards.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--aqWxf8ydqYKP8htK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 09, 2020 at 02:58:27PM -0500, Pierre-Louis Bossart wrote:
> Using devm_clk_get() with a NULL string fails on ACPI platforms, use
> the "sclk" string as a fallback.

Is this something that could be fixed at the ACPI level?

--aqWxf8ydqYKP8htK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6V9roACgkQJNaLcl1U
h9BjSwf+Pss0RQ4uA5Mylj+hH2CPMjVyKi4bXcMsc0WKzPqaEjAl7piwqVzzlCzr
z1G7YxB8Azwdu5vQYLVXDBpUDUPqaxzYr5/9JkqjrXNKn2oquMs0aqpdP2Vir+In
zUogWkOk2zrRbf8uHYwXVN85CY5b3xbf2CDkA6RNZOzAJ1M4MnIylSXNmGlEfPqS
DPgtxVAB+7PDCN41/egJGbTmddfD/r1uHc7ePHBMdNgPvoxO4bGFzt+7dvIhPKms
V+gTxUY6IWDXxlXrQeCV0S+iT3BM7UdNcKd6xJDbLwISy7ApTtoNtyUyMU1ZSek9
zsjTBu467jgS9V0USWLBlD9nq9VDyw==
=y8RE
-----END PGP SIGNATURE-----

--aqWxf8ydqYKP8htK--
