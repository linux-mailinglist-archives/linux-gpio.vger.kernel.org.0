Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870873C151A
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jul 2021 16:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbhGHO0W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jul 2021 10:26:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:39358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231515AbhGHO0V (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Jul 2021 10:26:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62D026186A;
        Thu,  8 Jul 2021 14:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625754219;
        bh=Jbd9IggvJ7GGkRHDwp6su00yw5ijHxncZTTO5Mzqt1A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eC4wsD6j5bH6p7WZt0YH1p1eB7no1QxWQuvdLMm4N4LKTOfeltnYJwpXDJzSVk6T2
         cMkBaXpMN5ew16pafUOItx1h/k0VvsLm754saMKVv5hV5SNMlkeomNyufNmv80Pmld
         hwMAYxkVwhH83wS0AAkZt3eN6nQAE2jrbHETzeBoW1xAX4nhJTBQ9rjzlaGNrt5wMN
         8s+DiXzsKgf/RBgOqbk/0KzmgbQnlLDeW6Ryz+VfTw021aGM+lvFl2dXPvZkorgAjI
         43vJ9VmYKQHUVTQqEOTA0AhBJg+9rx4B2cnzrf8FqbPCaTCi2nqai2QH1hQDTUYuOo
         uBVI2fhfumyhQ==
Date:   Thu, 8 Jul 2021 15:23:06 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/8] gpio: regmap: Add quirk for aliased data registers
Message-ID: <20210708142306.GA4106@sirena.org.uk>
References: <cover.1623532208.git.sander@svanheule.net>
 <5d8e5e8a29ecf39da48beb94c42003a5c686ec4e.1623532208.git.sander@svanheule.net>
 <CAHp75VeOMb2xUJ+g2UQJnBybmehmYr0dGPEzDZObUGr=Q95+wA@mail.gmail.com>
 <dee12a4f5dc1a37feb14e20074cf365dbb86bc05.camel@svanheule.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <dee12a4f5dc1a37feb14e20074cf365dbb86bc05.camel@svanheule.net>
X-Cookie: You do not have mail.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 07, 2021 at 10:53:19PM +0200, Sander Vanheule wrote:

> I've made an attempt at implementing a "regmap_aliased()", similar to
> "regmap_volatile()". However, this meant I had to make _regmap_read() aware of
> wether the read- or write-alias was being read (from cache), touching some parts
> of the regmap code I'm not using myself. Furthermore, this "aliased" property
> isn't really perpendicular to "volatile", since writes should never be volatile,
> and non-volatile reads don't make much sense (to me) on a read-only register.

As far as the abstractions in regmap are concerned these registers are
volatile, that's currently how regmap undertands registers where
readback won't give you the last written value.  Trying to convince the
framework to handle these registers as anything other than volatile is
going to of need be an invasive change.

> If a regmap_field could overwrite the specifiers of it's parent register, I
> think this may provide quite a natural solution to the aliasing problem: just
> create two regmap_field defintions. One definition would be 'write-only' (and
> cached for RMW), the other 'volatile read-only'. All regmap_fields could still
> rely on a single cached register value, I think. I didn't try to implement this
> though, so maybe I'm missing some behaviour that would disqualify this solution.
> Would you think this could be an acceptable way to move forward here?

This feels like a painful and potentially high overhead approach to
things - at the minute fields are layered on top of registers and are
totally invisible at the register level, pulling the two together would
touch a lot of places and make things tense, especially if we ended up
with two different fields aliasing each other.  I'd need to see code but
it feels like a difficult approach to take.

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDnCkkACgkQJNaLcl1U
h9BgWQf9EXRMoRdnrVCUNqRa20ezBb+4TyMBmX2rqTraVIEfms7khy2lloQFA0t9
ArWkAGDXYDTGJE5e4sHFNTKNHqSbdWkFSjl0chkoamwv5GgpBuyA3YIOXplpet2J
eYxbvsuYh/TBYo2NFgKCVa0UXYjuD0aemNElyfrIltjBZqfAMlFJah40HsoZdDQj
LwNmxou2+oaRmQw7u9qtzQvHbxv4a4dRMga7KdP6QK2gpqIGK04DnFMjAqaiv5uk
L6BgvcrHDvhWOSNpguXdt4Actyyae0qPjs6258E4t1S3weKO5ZXOB8C1eQtQDxP2
+Zqh5cDxsxPtObuk4e7Bj2tJvlGEQw==
=4IS2
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
