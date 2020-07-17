Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECBB9223FAD
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 17:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgGQPg7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 11:36:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:56778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726198AbgGQPg7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 11:36:59 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A8412070A;
        Fri, 17 Jul 2020 15:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595000218;
        bh=jYc1aUN/I4P6tRz3VyMWhNF0QnaoeYEKgUKNa+KrnaI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lYrCL/576fIybqoKqFHqApQ0M13jBy6owWhQN6cG6wMCWfYYJYR+ejLvNZrakEMXR
         +ehg8ackJ8jme84icUzgIHxUdZdYMkKHJTwkzu7jculJFLHRIj2SXWg9tO2moPc4G8
         e6Tn4tBGsia5bmOEY2PEFUAFKJWwet2fMyHfbk+A=
Date:   Fri, 17 Jul 2020 16:36:47 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Fabio Estevam <festevam@gmail.com>,
        Anson Huang <anson.huang@nxp.com>, Jon Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>, Olof Johansson <olof@lixom.net>,
        Russell King <linux@armlinux.org.uk>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Adam Ford <aford173@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Leo Li <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Kevin Hilman <khilman@baylibre.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/3] gpio: mxc: Support module build
Message-ID: <20200717153647.GA10361@sirena.org.uk>
References: <DB3PR0402MB39168FEA9306CBF90A596E31F5630@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916FB27846F462C2210C3BFF57E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkda2gdu8FsSM0MC6g8C1mebmVc5dFWJZwNvQUPXNi5bnkQ@mail.gmail.com>
 <DB3PR0402MB39167A4BB808A0679257DEF9F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkdbCVZaHqijqMck+jLAJuCAT31HA=9wwcV_EnQc=hsXLwg@mail.gmail.com>
 <20200717121436.GA2953399@kroah.com>
 <CAMuHMdWdaQ_jK1T_ErJ36pJbUUS3SFBcqQmyvtufaKha2C76Gg@mail.gmail.com>
 <20200717132101.GA2984939@kroah.com>
 <CAK8P3a3fwwx-2gQTXZ9dbko+DuLELGm=nKrYFXfwcJJOf0Xz5g@mail.gmail.com>
 <20200717141344.GA2992942@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
In-Reply-To: <20200717141344.GA2992942@kroah.com>
X-Cookie: You have a message from the operator.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2020 at 04:13:44PM +0200, Greg KH wrote:
> On Fri, Jul 17, 2020 at 03:54:49PM +0200, Arnd Bergmann wrote:

> > > And look at the driver core work for many driver subsystems to be fixed
> > > up just to get a single kernel image to work on multiple platforms.
> > > Just because older ones did it, doesn't mean it actually works today :)

> > Can you give a specific example? The only problem I'm aware of for
> > those SoCs is drivers being outside of the mainline kernel. Clearly
> > having support for loadable modules helps SoC vendors because it
> > allows them to support a new platform with an existing binary kernel
> > by shipping third-party driver modules, but for stuff that is already
> > in mainline, we could in theory support all hardware in a single gigantic
> > binary kernel with no support for loadable modules at all.

> That did not work for many drivers for some reason, look at all the work
> Saravana had to do in the driver core and device tree code for it to
> happen correctly over the past year.

Could you be more specific about these issues?  I'm aware of his work
around probe ordering but that's not at all arch specific, the same
issues affect every architecture, so doesn't seem to be what you're
talking about.

arm64 has never supported anything other than a multiplatform kernel,
and the actively maintained 32 bit platforms have supported one for more
than half a decade at this point.  CI systems keep managing to test
these kernels, distributions seem to keep managing to ship them and
users appear able to install and use them so it doesn't seem quite so
fundamentally broken as all that.

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8RxY4ACgkQJNaLcl1U
h9DeQgf/WFJpLDFRsnueznmq4Wb0AlXKTMQMYtt95FUFV2LNcNJzvy6OQZ/ggVo/
Y8VvSa5i9gfeOzO7kadzCZxHXPtZu9Jb4ZZYdEnzubh+/TiVUQoyhZSq7KKzo1Pt
81k6zKBpyfO+1JfXhWORRqU9lhanGvGconjefn25LVtARQw3YQWepyKVGfw4x2A2
xYxhoC3F7SdE7dLDPUa32DzmuTQmXX056JzwX6zAusBtHknnJWiFuPkLs5yjQ92f
BGi5y5bWcmZfgjJwx9kc82Fua3tY63sQnRNJrUITDxC8aeqaDIGFyna/rMwxMH5k
tV3+xNfHrx3KDuSmeyqs75QV+2+dlQ==
=YZrk
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
