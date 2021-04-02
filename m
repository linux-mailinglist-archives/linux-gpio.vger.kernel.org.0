Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 875DD352F9F
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Apr 2021 21:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236457AbhDBTUG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Apr 2021 15:20:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:35558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229553AbhDBTUF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Apr 2021 15:20:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A737A6115A;
        Fri,  2 Apr 2021 19:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617391204;
        bh=PRpSTE+uCYtRFa0lZsZ+bpij6OkbE/yPXMysib3so3k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=friQo4yO67kYFvDFxkgZfH9Lx1H71ACkbqEVS4OPgHsAG7/MzDCvZ6YY1E6SWWAnh
         5cRwKaYG2/GofZz4fnvfQGUdUF2NxNkY7I/nT+BsLv9scUlkmdDw7D6xPAE3g7udc/
         WncWAPWD2z09HdbRJ2bNymXcYIy4zNWJ8grNtjIemIOx6k+qUU5sb1/nB4LC600prC
         R8evLQxp+MIFz75/uTPzQJUyMTx5nGew5Bbg6+DMaE9Cz4LD4SOQ6581BDiOZOenNi
         pf0/d1TMFNUOlv7qb129ustqmdJnob5OAgjoWCA5t/Yh4PebvAEnhEsHJJ54cgWxTH
         9lmheeWdBrRVw==
Date:   Fri, 2 Apr 2021 20:19:50 +0100
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [PATCH v5 00/19] Support ROHM BD71815 PMIC
Message-ID: <20210402191950.GK5402@sirena.org.uk>
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
 <303b164aaa3d36cf8c9d03ee9b3863635be4073d.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EVcIhgQsEzAXu06J"
Content-Disposition: inline
In-Reply-To: <303b164aaa3d36cf8c9d03ee9b3863635be4073d.camel@fi.rohmeurope.com>
X-Cookie: Dammit Jim, I'm an actor, not a doctor.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--EVcIhgQsEzAXu06J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 30, 2021 at 11:06:53AM +0000, Vaittinen, Matti wrote:

> Do you think Lee could merge other but the regulator parts to MFD if
> Mark is busy? I'd like to be able to squeeze the amount of patches and
> recipients for future iterations. It might be easier to work directly
> on regulator tree if regulator part gets delayed to next cycle. (I do
> also plan further working with the GPIO part during 5.13-rc cycle to
> utilize the regmap_gpio. That could be done in the GPIO tree then). I
> think the other portions are in a pretty stable shape now.

This wouldn't be a bad idea in general for these serieses, especially
the bigger ones or the ones that get a lot of review comments on some
patches.

In any case, here's a pull request for the helpers that are added

The following changes since commit 0d02ec6b3136c73c09e7859f0d0e4e2c4c07b49b:

  Linux 5.12-rc4 (2021-03-21 14:56:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-list-ramp-helpers

for you to fetch changes up to fb8fee9efdcf084d9e31ba14cc4734d97e5dd972:

  regulator: Add regmap helper for ramp-delay setting (2021-04-02 18:33:59 +0100)

----------------------------------------------------------------
regulator: Add a new helper and export an existing one

For new drivers.

----------------------------------------------------------------
Matti Vaittinen (2):
      regulator: helpers: Export helper voltage listing
      regulator: Add regmap helper for ramp-delay setting

 drivers/regulator/helpers.c      | 101 +++++++++++++++++++++++++++++++++++----
 include/linux/regulator/driver.h |   7 +++
 2 files changed, 100 insertions(+), 8 deletions(-)

--EVcIhgQsEzAXu06J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBnblUACgkQJNaLcl1U
h9BQEwf/RuI3X5ibi67PgHKtZBl58wGqUZfH+2oBTHq1nRZle8r/3i2I+o+Ifvd8
BHC7PcWUW7ieEwXgntZnt9jTe2rQCdYsBHK1+VUJ43BDOH0wocz+/9voeVpoLQgu
THWJLSayS9+jjv0knBuG8evSH4ddiRrnBJXq9fHHRYwqQukAXaAZLFYfF5N1cTnd
b2oZoGeom7DBtrBh75tV8ZmrtvafigjoaZFOh+euYstYfjoNK4ZBmDxYtwX7qTfl
yYOikVjMXeLCWLKmuR8rdjZ8NNnuduPl7ct8vx7DbkdIDt3ajwj+EkCs29mLc3RB
JxucX6EF4NI4inJqd3+NVzpze3hU5A==
=RfZr
-----END PGP SIGNATURE-----

--EVcIhgQsEzAXu06J--
