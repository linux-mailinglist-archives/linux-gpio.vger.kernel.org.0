Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A92F8E9D4D
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 15:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfJ3ORn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 10:17:43 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42550 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbfJ3ORn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 10:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=5mkGcP2WEwjWYjEFxVfk1OeHzCHQXe8iz/K+tKvtbEE=; b=Wlr5WeIMFCk8/pi7ka8smGkye
        mE4m6j9f6OBbLCh8aBdQD32ul7wZF8oGzSa2ehLosTFnwBmqp9Ik3ELdSF9VdXDMnBeFh22poJebF
        QTyeTEZIdT0p4b2L47NrdRyRPOdsqy9KiuokalQv/X9t1Rke161XIcB+u1SnP20GVFS90=;
Received: from [195.11.164.221] (helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1iPon2-0005Ek-Vv; Wed, 30 Oct 2019 14:17:37 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 9C399D020A6; Wed, 30 Oct 2019 14:17:36 +0000 (GMT)
Date:   Wed, 30 Oct 2019 14:17:36 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
Message-ID: <20191030141736.GN4568@sirena.org.uk>
References: <20191030120440.3699-1-peter.ujfalusi@ti.com>
 <CAL_JsqK-eqoyU7RWiVXMpPZ8BfT8a0WB47756s8AUtyOqbkPXA@mail.gmail.com>
 <5bca4eb6-6379-394f-c95e-5bbbba5308f1@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dp9QYJgVRVEW2bsm"
Content-Disposition: inline
In-Reply-To: <5bca4eb6-6379-394f-c95e-5bbbba5308f1@ti.com>
X-Cookie: Keep out of the sunlight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--dp9QYJgVRVEW2bsm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 30, 2019 at 03:32:09PM +0200, Peter Ujfalusi wrote:
> On 30/10/2019 15.12, Rob Herring wrote:

> > Why can't we just add a shared flag like we have for interrupts?
> > Effectively, we have that for resets too, it's just hardcoded in the
> > the drivers.

> This would be kind of the same thing what the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE does, which was a quick workaround for
> fixed-regulators afaik.

The theory with that was that any usage of this would need the
higher level code using the GPIO to cooperate so they didn't step
on each other's toes so the GPIO code should just punt to it.

> But let's say that a board design will pick two components (C1 and C2)
> and use the same GPIO line to enable them. We already have the drivers
> for them and they are used in boards already.

This is basically an attempt to make a generic implementation of
that cooperation for simple cases.

--dp9QYJgVRVEW2bsm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl25m38ACgkQJNaLcl1U
h9DOmwf+JLW+Mnv1zxmPd4I5WIvRwdka4+X5vKvVEQGfkcbkvBPGj0jBL3B4GEKz
vjCpNmVnfgc6KlvwsGqEsyKo5Hxo5ZmXJlbVpKw0zFjCGuj4hVQsMrvu7zz8dCRn
LZOP/iKwPUHrpQ5F5vBURBc6gjj97WqAg3w0RdqCe0gJehqYrV9ulo28wB5pv8Cz
2IHQ21/bOkpu3caVGJO0+LevtN+s2qVY4gYo0tRTQI9XbDGcarivPJr0AVvle9qi
5QX0Jdfj84F5cu0f8I29G9Zk0i887OqJ0iKA5k2mUojkho+57hZY87TJ0KZZTh9o
SIS+L6vhF2qKKYb54Unpp4jMS83pvw==
=BRXS
-----END PGP SIGNATURE-----

--dp9QYJgVRVEW2bsm--
