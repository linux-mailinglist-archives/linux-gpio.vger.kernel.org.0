Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B1436FD93
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 17:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbhD3PUb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 11:20:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:32968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230187AbhD3PUa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Apr 2021 11:20:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A772161407;
        Fri, 30 Apr 2021 15:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619795982;
        bh=ENA3ABoJbCZuijsVd4K0y84DVv2hOGedvQdYNfFhILE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j5p6Zd7cX8GW9SXLUoZBJ5o8HJfiKh14Hoi8wieFH33H1S0f27HIYZ5bfTh0TSkwC
         1wMJCtDUgI1dvRQBsUquWVzL8WdnotvMAFpFfkH6vx0xP6K6wJvkEipQd73LC9K+0n
         DkrKZATabQRihQlPmkdFKAReuNREFT954iq2X3TSqhQgL8aVigJVwXn4Uooap/fjvU
         7pCVTFtLoCfph7WNlRDRmad99V9Fu9uSiwJypKshZ8woaZYKKWwNJj5ZGvrvFfcjbe
         SVJXzxjjqSVqrF8ROINLpEzzCMG/AADm+Apka85SnamquX0qjlt/nKtZ8DcpT1uZtg
         uCOs5ajtCkBJw==
Date:   Fri, 30 Apr 2021 16:19:09 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] regmap: add regmap_might_sleep()
Message-ID: <20210430151908.GC5981@sirena.org.uk>
References: <20210430130645.31562-1-michael@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HG+GLK89HZ1zG0kk"
Content-Disposition: inline
In-Reply-To: <20210430130645.31562-1-michael@walle.cc>
X-Cookie: QOTD:
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--HG+GLK89HZ1zG0kk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 30, 2021 at 03:06:44PM +0200, Michael Walle wrote:

> Sometimes a driver needs to know if the underlying regmap could sleep.
> For example, consider the gpio-regmap driver which needs to fill the
> gpiochip->can_sleep property.

Whatever is creating the regmap really ought to know what device it's
dealing with...

> It might be possible to pass this information via the
> gpio_regmap_config, but this has the following drawbacks. First, that
> property is redundant and both places might contratict each other. And
> secondly, the driver might not even know the type of the regmap because
> it just gets an opaque pointer by querying the device tree.

If it's a generic GPIO driver from a code correctness point of view it's
always got a risk of sleeping...

--HG+GLK89HZ1zG0kk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCMH+wACgkQJNaLcl1U
h9AwsQf+OapHHPJboJLbJVrs6ODnuJ1aJa4YJWqxhqh+/mJXRRYsV4O9PDFacYDT
aFqHwzvB364wtityGw0MeeOOVEfvjkrMeVaPfUf6vegIcpMzKAqv5KOxo7fXLHGV
Zz6QoVuhqq4fKRV+LOEQ6whDaKqm+YhleQN5e5rQgPiI6ipwVk7DtBqLnibZqj5I
zWWp66hKrqGeiimSdc3tUyNBv5gQjdXzRg4r9WKBHByPyzQH5PN/j0xiRK2x+nzW
Gkj89BSRB/huHGHErNvdYTyjcFbsrWbWFwDeEcbvtfUhVEyGrojWR5tlZhRnvMtw
R1U3GEY84VSjdbkSjenuatTpfBk+1g==
=DSyN
-----END PGP SIGNATURE-----

--HG+GLK89HZ1zG0kk--
