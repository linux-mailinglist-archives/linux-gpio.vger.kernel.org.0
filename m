Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAC563A60FB
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 12:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233565AbhFNKkv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 06:40:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:46340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233142AbhFNKih (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Jun 2021 06:38:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7628D61356;
        Mon, 14 Jun 2021 10:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623666846;
        bh=Lk48o2qLj6bgfpm6K80Agsg0f6fwEF9lq3lLe0tDo+c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qlv8o5bqOFA1C4eoryKnM3zip0RBZBkLIWFuPWuFGpdXL7BHkcSSETudt68fnLOj1
         NHGotGL0IppIebMpRVj+gD/5Fj3PFp7YujkgUuflsFlZf1GJeIHAGqfhYN79CT0Rsi
         joitk6ZsSf5Q8Hqs4UR5N0SIgnJ6A0v8tBSt9AVmn0U9QW5oPNzUdmfH3bH7qLRwK6
         q/ZjsDyJO7y8KqtnClx1/PBXIAIdCrcQVXysjkQVYIHy6h//19wMqKPWe69qYH1uWl
         9f+8dlGH4ElrBc7ofHU1Oy8d0EPY+tvzaCwzoomCLdPn2CP5vDPL4AyF40Yt3pEqP5
         +B4iI8rdMqEjg==
Date:   Mon, 14 Jun 2021 11:33:46 +0100
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
Subject: Re: [PATCH v5 1/8] regmap: Support atomic forced uncached reads
Message-ID: <20210614103346.GB5646@sirena.org.uk>
References: <cover.1623532208.git.sander@svanheule.net>
 <e1be20bb92cff2688153125b534b738b71c3a743.1623532208.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
In-Reply-To: <e1be20bb92cff2688153125b534b738b71c3a743.1623532208.git.sander@svanheule.net>
X-Cookie: Some restrictions may apply.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 12, 2021 at 11:12:31PM +0200, Sander Vanheule wrote:

> When a user wants to read a single uncached register, cache bypassing
> can be enabled. However, this is not atomic unless an external lock is
> used for the regmap. When using regcache_cache_bypass, the original
> bypass state also cannot be restored.

> Add support to atomically read a single uncached value, bypassing any
> regmap cache.

The expectation here is that if there is a need to do this for some
reason the user can arrange to do this for itself - if something is
happening that makes a normally non-volatile register volatile then=20
it probably needs higher level coordination.  What's the use case?

> +int regmap_read_bypassed(struct regmap *map, unsigned int reg, unsigned =
int *val)

Bypassed what?  I think Andy's naming suggestion was much better.

Please also keep to 80 columns if you can, I know the requirements got
relaxed a bit but no need to do it excessively.

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDHMIkACgkQJNaLcl1U
h9AVKgf8DG38L+uh12gqBaGzENI6AwYWhYFF7fxG15+iMEqcDc/+KojOLV19AsOD
bZy4/g0ejJWDACovU34ee9CYGrrVOsoWxe7731Sx6dhy4EmiKlX5lSl9ujINyqv6
kRnjrVK4WRDOENsotnlKS32NXE0IGlI/56XfhB6Or6tNcb7T63YYEVReJFXW5V/7
zT62SoDlipWFedJ+v5m1sp/3clwM6O/IV46KmpWtQuetGjLf3sjG9GQkh3qDvEwf
7MT+tqzJiymYfbXu/udiQQfkFxR7kSb4KvWvGQVnZ4yqtX4jhCH+6atr23dCO1id
rWLPlACVcIHjAElEvzJ5IAqZnRpprQ==
=g941
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
