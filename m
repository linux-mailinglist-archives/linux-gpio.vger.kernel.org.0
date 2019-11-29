Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99BA510D96E
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 19:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbfK2SIw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 13:08:52 -0500
Received: from foss.arm.com ([217.140.110.172]:50888 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727005AbfK2SIw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Nov 2019 13:08:52 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AB081FB;
        Fri, 29 Nov 2019 10:08:51 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17D663F68E;
        Fri, 29 Nov 2019 10:08:50 -0800 (PST)
Date:   Fri, 29 Nov 2019 18:08:49 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Zyngier <marc.zyngier@arm.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] mfd: da9062: add support for the DA9062 GPIOs in
 the core
Message-ID: <20191129180849.GB5747@sirena.org.uk>
References: <20191127115619.20278-1-m.felsch@pengutronix.de>
 <20191127115619.20278-3-m.felsch@pengutronix.de>
 <CACRpkdYLeSjsXaG6Bg4Y2-8PW41ALn4PN7QUvp3tA7XReWrKGg@mail.gmail.com>
 <20191127151929.GC4879@sirena.org.uk>
 <CACRpkdbJbCwo7yALnywscCTZBzO1ZzWY_=c5RoVGqY7Eue3t=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline
In-Reply-To: <CACRpkdbJbCwo7yALnywscCTZBzO1ZzWY_=c5RoVGqY7Eue3t=Q@mail.gmail.com>
X-Cookie: To love is good, love being difficult.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2019 at 09:49:56AM +0100, Linus Walleij wrote:
> On Wed, Nov 27, 2019 at 4:19 PM Mark Brown <broonie@kernel.org> wrote:

> > Why, what do we need to do?  We're just doing all the default stuff,
> > it's not something we've opted out of, and the whole point with using
> > the frameworks should be that we should get software features like this
> > for free :(

> I guess it is a bit about moving targets.

> The regmap irq thing was covering all reasonable cases until
> the hierarchical interrupts were introduced some years ago.

> The hallmark of these are that the irq_domain_ops implement
> .translate() .alloc() and .free() rather than .map() and .xlate()
> as the irqdomain in reqmap-irq currently does.

So there's two completely different APIs.  Are all the drivers supposed
to be being updated to implement both?  It looks like the second API is
ifdefed out when not in use so I guess so but...

> The problem with hierarchical domains is that the system using
> them need to be hierarchical "all the way up" to the overarching
> top-level irqchip. Currently only the ARM GIC and the IXP4xx
> irq top-level irq controllers supports this, ruling out some
> obvious users like all non-ARM systems (for now).

Are you sure?  It looks like the API was introduced by Intel and io_apic
appears to be using the new interfaces.

> I think the assumption in hierarchical irq is that you have
> a few hardware-specific irchips and you know exactly which
> irqchip that goes on top of another one, as well as which
> hardware irq line is connected to which hardware irq line
> on the parent.

The documentation says that this is for systems where "there may be
multiple interrupt controllers involved in delivering an interrupt from
the device to the target CPU" which describes more or less every single
regmap-irq user, though the threading might mean it doesn't quite map
onto what was being thought of there.  But basically everything I can
find suggests that regmap-irq should be a hierarchical controller apart
=66rom how we figure out the primary IRQ.

> Since we know the specific hardware (from a compatible
> string or so) we can hardcode the parent-to-child mappings
> of interrupt lines in the driver. These mappings are not
> in the device tree for example.

That seems to be part of it, yes, which seems unfortunate.

> Therefore supporting hierarchical and nonhierarchical alike
> in a very generic plug-in irqchip like the regmap-irq is a bit
> of a challenge as it has to support both hierarchical and
> non-hierarchical, because it is not possible to just
> convert this to hierarchical callbacks: it has to check what
> its parent is doing and adapt, essentially implement both
> hierarchical and non-hierarchical at this time.

It looks that way, yes.

> Also we need to pass mappings between parent and child
> somehow. In the gpiolib we did this with a callback to the
> GPIO-chip-specific driver. How to do it for something
> generic like regmap-irq is an open question.

Currently regmap-irq just gets a parent interrupt from whatever is using
it so yeah, this doesn't map on at all well especially since the user is
likely to be using just a normal interrupt binding for this which is
apparently explicitly not allowed[1].  I'm not sure what to do here.

[1] https://elinux.org/images/8/8c/Zyngier.pdf

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3hXrAACgkQJNaLcl1U
h9DjvAf/dBusub/Tb/6cifVAVsYUQ5jBLUL96REY80STQQtFD79EKeYFZovD/h5I
Bi3hilPup9OWhs6Dit19ikq7ET6GmCP1HnunBrEV8LNABTiBmmrglLqM5bqdoYqb
ykVv3yCK2U2yJ4DAfu4eG5cX7Mg72t7BfDsFF9PL8/p1jOkyocm+LAVzf3vDcatH
tuthvFlyLllErgl+OiqWsI88f6tkuhyzLmP+oesYzMSLqRVaZyz2XNQvv3UA4ykd
BWVWBHI51Kr5OO+kMBojuSsd7Y1FMiuRmp4AKswMTOfWfT3+Atjou/HHfoHhsgy/
/v3banHni7UzfhmC3kuezEnMOqywbg==
=cuXw
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
