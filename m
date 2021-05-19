Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9E838935B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 18:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355060AbhESQOT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 12:14:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:55404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241563AbhESQON (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 May 2021 12:14:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94A756124C;
        Wed, 19 May 2021 16:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621440773;
        bh=8fQfEqfjHd5ROSfi7Ib1dYC3Bl8NkSkPnnM0Z3H+Q9c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sWsCgfdChN1RgmC/16u9YCH70nrcWUYnNuTKVwncmZ8kmNP4tUhKXygVugSa+goX6
         UzDtv5/IwlGtnMvpIK6ZlzfnkoIDfr5k6vmp38drb9Nx2FL9ILnEWE+dbgFcdHAoVd
         TYvzZP3td1oeh9LWG78niMOoFVdifnBl4xg0fe0oZebIvKdU7ZbADPEWENeayB6T/M
         0IGcxIGNqAx4pBfXHGGn6QMa5opskkJZwU764muaTTfsx/8HJUOGBxAozBF5pTQ1Wp
         9CGzN+396KN1AupmwLqnW1G+982PnU/1mAeucGMGCuPZHhMFehJbf/cw6n6RBvWu6i
         QA6Yxq1yHg7Dw==
Date:   Wed, 19 May 2021 17:12:07 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] regmap: Add MDIO bus support
Message-ID: <20210519161207.GF4224@sirena.org.uk>
References: <cover.1621279162.git.sander@svanheule.net>
 <63b99a2fec2c4ea3c461d59d451af8d675ecf312.1621279162.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Content-Disposition: inline
In-Reply-To: <63b99a2fec2c4ea3c461d59d451af8d675ecf312.1621279162.git.sander@svanheule.net>
X-Cookie: There's no time like the pleasant.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 17, 2021 at 09:28:03PM +0200, Sander Vanheule wrote:
> Basic support for MDIO bus access. Support only includes clause-22
> register access, with 5-bit addresses, and 16-bit wide registers.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-mdio

for you to fetch changes up to 1f89d2fe16072a74b34bdb895160910091427891:

  regmap: Add MDIO bus support (2021-05-19 14:19:10 +0100)

----------------------------------------------------------------
regmap: Add MDIO bus support

----------------------------------------------------------------
Sander Vanheule (1):
      regmap: Add MDIO bus support

 drivers/base/regmap/Kconfig       |  6 ++++-
 drivers/base/regmap/Makefile      |  1 +
 drivers/base/regmap/regmap-mdio.c | 57 +++++++++++++++++++++++++++++++++++++++
 include/linux/regmap.h            | 36 +++++++++++++++++++++++++
 4 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 drivers/base/regmap/regmap-mdio.c

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmClONYACgkQJNaLcl1U
h9DEyAgAhLtOW2RwtejyDmNG0G2NxCwbumYlKtwRJ4USHi4YE890YMR1SJEkB/qa
48NRiLSHSw0dF9RV5hbywYtsu5OJBNSLDQqQwKCRxPJiWqcJ5YDVewmuoslp8tmb
ymwAjo4KYw1u6o49jbrIQVysanOTRborGn55KgPzynnZnsjfCIG1CdBHr9VdrJ57
25K2R787VjniFzaN91llWsAYlXoHa+5EwwxJzThg/KJGuaLhCnFS+4eB35UkfQcr
vMpFNF6jhqV6JX5nx0InhREUFmzo3l7yxfkWOADIXAj03HhZ7xKrbVG/pDtaNwvK
uwSsLGcenwVz8XBzPRUwbGMrsW/h8g==
=gp6K
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--
