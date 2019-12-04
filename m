Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06835112D50
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 15:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbfLDOO4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 09:14:56 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:55236 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbfLDOOz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 09:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=NqBGe6Sv6wTyUXzOxX9rDh/sNVl/hYS/XAALT4ejUXI=; b=Apkm/2we9LPbnYBcBOrJgyc0O
        NbgXGmUd9oQMVhO4Fpez4qiBbjt3MgJbAbGNYNtO1mIiFm7Uz5joyJkKgug1+3FBKPpXP+obwEvPk
        kruNQwoeQbblSr9iuI2BoIUxKTKE6FEDdeIIezL1vutBt0K+8qrAOz0TKaEluLLCKTQns=;
Received: from fw-tnat-cam6.arm.com ([217.140.106.54] helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1icVQH-0000he-IS; Wed, 04 Dec 2019 14:14:33 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 4977BD003B4; Wed,  4 Dec 2019 14:14:33 +0000 (GMT)
Date:   Wed, 4 Dec 2019 14:14:33 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Message-ID: <20191204141433.GU1998@sirena.org.uk>
References: <20191119181325.GD3634@sirena.org.uk>
 <fa69d01504817e3260d2b023ae2637aa2f1b2862.camel@fi.rohmeurope.com>
 <20191119193636.GH3634@sirena.org.uk>
 <eb685cc78b936bc61ed9f7fbfa18c96398b00909.camel@fi.rohmeurope.com>
 <20191129120925.GA5747@sirena.org.uk>
 <297fa021fb243072dbbb7bca455e57c13e8c6843.camel@fi.rohmeurope.com>
 <20191202131140.GD1998@sirena.org.uk>
 <72a1f4c5768b8c08c2669ea01e60d1b614095a43.camel@fi.rohmeurope.com>
 <20191204124717.GR1998@sirena.org.uk>
 <6f7b96c71bd1257b0b218a092f8aca7f32ef5468.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="b9dEYEwnDXkv9lSy"
Content-Disposition: inline
In-Reply-To: <6f7b96c71bd1257b0b218a092f8aca7f32ef5468.camel@fi.rohmeurope.com>
X-Cookie: Cleanliness is next to impossible.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--b9dEYEwnDXkv9lSy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 04, 2019 at 01:13:08PM +0000, Vaittinen, Matti wrote:

> I think I once again explained myself badly. There can be only one
> group with 4 RUN states selected by combination of 2 GPIO lines. bucks
> 1,2,6 and 7 can each either be assigned into this one group or
> controlled individually via I2C. But I doubt assigning only one of the
> bucks in this group is the typical use-case. What we would need would

I don't think this is as unusual as you're thinking - the
regulators people want to control quickly are usually the main
CPU supply regulators and these often vary independently of
anything else.

--b9dEYEwnDXkv9lSy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3nv0gACgkQJNaLcl1U
h9Bidgf+JmJlmuyYk4HvvR+RXTF/LJMH+3BvZucpl9loKpF5zI4HySCJdL/apiLp
N5OogFNqhJpzh/RoOiZOncfXinT/nO8ZE9sv5Xfq+2gXb9fcReutNFi71oYuBQoX
SeihA1H/gvu9WEp0JGNZ4qn/mfxLSa5ZV5PsBZOTYihLVw6GsSnP1uZeb6EuvKSN
3zecgHr5LDb8xdqfomgPLSP70jvkkX/0Mlk1LjaS0uCo3ozHi9Gg9NP4yS1hIOjo
9z6f4jNleLrQ9YGV+OjfpXOsx4QuyDg5Tvk9CNd7Oy522ZCWbBHu78Y4IoKzLrgw
R61Ph6IhTgRyzufu4R0X2Y62I+X8yQ==
=+XL6
-----END PGP SIGNATURE-----

--b9dEYEwnDXkv9lSy--
