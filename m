Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2306E36FF77
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 19:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbhD3R1Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 13:27:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:46948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229750AbhD3R1Y (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Apr 2021 13:27:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9F40613E1;
        Fri, 30 Apr 2021 17:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619803596;
        bh=1rUgNSN7FcJQXauj0ZsJ1XOjvcnWQfWVkDhofbK+0ig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ugms4PpvNVoSYYXSKuM73dyHM9jSuiQetkar6RaGMVfECdYSwGLamjK5G8hlwg/Pj
         Zs3eoN8E2hsha6DUV9c7XWxSJEBDtimdT3r5lye60orZ4tXNRDLNv8jGsvJHSj5j0l
         qFpeEgZBX3pvY8EgjEbZpIAPt4Aqas/60oWgwH1j/c4mg8J5lOcpY3rSDfLvudBJCk
         IFRFp0Cd5etrGrlLI2a75ioFOGFxSTKdyO5vlCVSBP0ScgggnZ3zvgmOGHiprYLJ7U
         UzUS0m+LJ1geyZuo5dszDXCQORKatENtmucUxEqNkde9E/KQ4DvsekgTJBHWhTf8A/
         DvPa1XgIWLoHQ==
Date:   Fri, 30 Apr 2021 18:26:03 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] regmap: add regmap_might_sleep()
Message-ID: <20210430172603.GE5981@sirena.org.uk>
References: <20210430130645.31562-1-michael@walle.cc>
 <20210430151908.GC5981@sirena.org.uk>
 <df27a6508e9edcd8b56058ac4834fd56@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VUDLurXRWRKrGuMn"
Content-Disposition: inline
In-Reply-To: <df27a6508e9edcd8b56058ac4834fd56@walle.cc>
X-Cookie: QOTD:
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--VUDLurXRWRKrGuMn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 30, 2021 at 06:01:49PM +0200, Michael Walle wrote:
> Am 2021-04-30 17:19, schrieb Mark Brown:

> > Whatever is creating the regmap really ought to know what device it's
> > dealing with...

> But creating and using the regmap are two seperate things, no? Consider
> the gpio-sl28cpld. It will just use whatever regmap the parent has created.
> How would it know what type of regmap it is?

But that's a driver for a specific device AFAICT which looks like it's
only got an I2C binding on the MFD so the driver knows that it's for a
device that's on a bus that's going to sleep and doesn't need to infer
anything?  This looks like the common case I'd expect where there's no
variation.

> > > It might be possible to pass this information via the
> > > gpio_regmap_config, but this has the following drawbacks. First, that
> > > property is redundant and both places might contratict each other. And
> > > secondly, the driver might not even know the type of the regmap
> > > because
> > > it just gets an opaque pointer by querying the device tree.

> > If it's a generic GPIO driver from a code correctness point of view it's
> > always got a risk of sleeping...

> I can't follow you here.

If users happen to end up with a map flagged as fast they can work on
the whatever driver uses this stuff and not realise they're breaking
other users of the same driver that end up with slow I/O.  The whole
point of the flag in GPIO is AIUI warnings to help with that case.

--VUDLurXRWRKrGuMn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCMPasACgkQJNaLcl1U
h9CnCAf/UXniZtyrlKutaOFYFv/DIS5vgZNPX9TKPSpuf7OSIdu3/Su5BCBIdz8U
607bHT20bfXcATQf0VqNm7mJ5+mQA4GcDa+z0SggpsBB1PqkMXqsGHgMEpxe9/yR
DzRAm+aaQFWkp4MWQh7AYkNcN0ctgP+IWH1eV8e5dv8c+6eDH2h8Dp90JtfsYU7q
wUUxm4xco031Oz1ciiNjDqlZxV7d5KJpVbWd8hgGqmtABAIzcva6DaPw1MwCnEpF
c+JX0FRUlI0hPiDDbt07QJbaNwbAA4X9WVZz8e6soFjr5O/kjiiSmTy9qudB3UE3
5w5PxpCBVGXSrSDBPl5EKFHjgtBKFA==
=UiNe
-----END PGP SIGNATURE-----

--VUDLurXRWRKrGuMn--
