Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFAD20739A
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 14:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389197AbgFXMnt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 08:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388942AbgFXMnt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 08:43:49 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00459C061573;
        Wed, 24 Jun 2020 05:43:48 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id y18so1024199plr.4;
        Wed, 24 Jun 2020 05:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WK4lDdjOhSB2YX9Kt0ylng7mTc0a6hvSebEpH+B9JH0=;
        b=STRseE+xHdwcXobbZpmqYobngiahjccbZfbSksh3i6kgQspWr1QjmZU3MxTPCAeMHn
         oOkU4NLukxrf1IHEltjIz0o1vEjhJO9Cuezi1+UCiRfzuvwfYJxIzBb1l7ewrhEzNXW6
         ZLCaYFFByoO9RIkqiZrKJnJHAhCZbnsXSWkYBsl7D9857jPV8X06LN7z9jovO+hz7jIy
         QYx326J6kgvOBYEeWHlq3i+lbscxCeuPSm5GpBt4nQYYpes71j27IImOXSt3TE8iwMOu
         FR79Bbk/YiFpCS/z/gBuuukoPxhT2r8udpoCRWtGacTvYZn/8yraPjf+gHkkT4B8ZNft
         2IEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WK4lDdjOhSB2YX9Kt0ylng7mTc0a6hvSebEpH+B9JH0=;
        b=sm+EZ+WMoSfSGnwFaT9crVNDGcECHLlrpFW0u/eu88JT0Xn0//ImZPnX/rV40vPc3x
         DyLaD27iOVtz0v0d3q2yfSKYcsdhwgdS/Ggd+d/XlRglKmR64dD59GDAtZYHx/DC7T5v
         BXUsY+w+iAp6c0tADOQUIMAqyTSuss7aw4iWVgj4mIGT35Tp6Y4oswSU9ejGhMNC8SPF
         GuoO08VUVLqlGpWAsntKAbr57Uadl3Poizxs8PfxvGQ3kLpzYgV/70tWMoJpYt1BuCXo
         +z7st9mwfMo7J3NuHKDeU7SXafhMguGCpKAPlafVQcfcuxqHVVAlOqh46gXRD8mp9hQn
         YBqg==
X-Gm-Message-State: AOAM533w4ChJgsJwdXB25FVj2u9ShbtVGsEDoliCQBHlQ9O8eApOmZSD
        V+j20iQHUqaFIqmg9uuDmwOi6HI42pf8s4XiOudqfWY4LT4=
X-Google-Smtp-Source: ABdhPJxzeY5QRuWs1Cg2ZheJGjj6NlRcKFF6tLd0voNbYP6UXmHjP2W9iiQELZ2hMWAqKua0EUHZwUSRZ/Tf5qklUPU=
X-Received: by 2002:a17:90a:220f:: with SMTP id c15mr29686923pje.129.1593002628391;
 Wed, 24 Jun 2020 05:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
 <20200616200225.32mwzew3zw3nuiwh@mobilestation> <CAHp75VfZMx8ip=Bo=gZQiGufJvh=7dtr61C3ZcZjETFrErTk6Q@mail.gmail.com>
 <20200616225648.eqzugzapatblndcy@mobilestation> <20200618085654.GL2428291@smile.fi.intel.com>
 <20200619221240.tvyf5alek4wxhdby@mobilestation> <CAHp75Vf0quL_0j0wBDwma9BToBq87PhFa0Hp0bpQMLMAoTWJpA@mail.gmail.com>
 <20200623014945.56j3hnwnz4cj2u4t@mobilestation>
In-Reply-To: <20200623014945.56j3hnwnz4cj2u4t@mobilestation>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 24 Jun 2020 15:43:35 +0300
Message-ID: <CAHp75Vd0YM=mRkUweK0TRhg9wyb2bs6-AO3m21BRE_=ZMEv8hg@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] mfd: Make use of software nodes
To:     Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 23, 2020 at 4:49 AM Serge Semin <fancer.lancer@gmail.com> wrote:
> On Sat, Jun 20, 2020 at 01:13:56PM +0300, Andy Shevchenko wrote:
> > On Sat, Jun 20, 2020 at 1:12 AM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > On Thu, Jun 18, 2020 at 11:56:54AM +0300, Andy Shevchenko wrote:
> > > > On Wed, Jun 17, 2020 at 01:56:48AM +0300, Serge Semin wrote:
> > > > > On Wed, Jun 17, 2020 at 12:40:35AM +0300, Andy Shevchenko wrote:
> > > > > > On Tue, Jun 16, 2020 at 11:03 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > > > > > On Mon, Jun 08, 2020 at 04:42:54PM +0300, Andy Shevchenko wrote:

...

> > Linus replied to three messages out of 7, seems you read only the first one.

> Actually I've read all of them and from what I could see, he didn't like a code
> setting gpio-base regardless whether it has been created before your patchset
> or your explanation why it was necessary.

Yes, and then he realized what happened in the past. TBH I also do not
like this kind of thing, but we may not get rid of it because we will
get a regression.
The compromise (which is used in several cases of my knowledge, but I
believe there are more) is to use internal property. This keeps layers
separate and individual drivers nicer and neater.

...

> > > My point is that no mater how you pass the gpio-base value it will always be a
> > > quirk. The same thing is with the irq_shared flag. Both of them are specific to
> > > the Quark-platform. They are used to tune the DW APB GPIO driver up so one would
> > > create a GPIO device working well with the Quark-specific DW APB GPIO block.
> >
> > Precisely!
> >
> > > > > > We, by applying this series, make (keep) layers independent: board
> > > > > > code vs. driver code. Mixing them more is the opposite to what I
> > > > > > propose.
> > > > > >
> > > > > > WRT property.
> > > > > > snps,gpio-base can be easily changed to *already in use* gpio-base or
> > > > > > being both converted to linux,gpio-base to explicitly show people that
> > > > > > this is internal stuff that must not be present in firmware nodes.
> > > > >
> > > > > As I see it the part with "gpio-base" and the irq_shared can be moved to the
> > > > > gpio-dwapb.c driver to be defined as the quark-specific quirks. Adding a
> > > > > property like "gpio-base" seems like a quirk anyway, so I'd leave it defined in
> > > > > the driver.
> > > >
> > >
> > > > Huh?! The whole idea is make GPIO driver agnostic from platforms and their quirks.
> > >
> > > As I said above having the gpio-base value set is the platform-specific thing in
> > > any case. So no mater whether you pass it via the software_node/properties or
> > > the private platform-data structure, the DW APB GPIO driver will have to handle
> > > those parameters in some special way, which is quirk-prone since normal platforms
> > > don't have such peculiar requirements.
> >
>
> > Seems you are proposing layering violation without seeing it.
> > Let me explain the design of the drivers in Linux kernel.
> >
> > There are basically few possible concepts how drivers are handling
> > quirks (because we know that most of the hardware support is a set of
> > quirks here and there):
> > 1) platform provides a board files and via platform data structures
> > supplies quirks to the certain driver
> > 2) platform provides a firmware node (ACPI, DT, ...) and unified
> > driver handles it thru the fwnode interface
> > 3) driver is split to be a library (or core part) + glue drivers full of quirks
> > 4) driver has embedded quirks and supplies them based on IDs (PCI ID,
> > ACPI ID, compatible string, ID table, etc)
> > 5) ...missed something? ...
> >
> > What I'm proposing is turn 1 to 2 for Quark case, what you are
> > proposing is absent on the picture, i.e.:
> > x) platform provides a board file (intel_quark_i2c_gpio.c) and the
> > driver has embedded quirks based on ID.
> >
> > This is not what we want, definitely.
>
> From the list you provided it's still not obvious why what I suggested wasn't
> good, because it's perfectly fine to have both ACPI/DT-based firmware node
> (entry 2) and quirks based on IDs (entry 4), which plenty of the kernel
> drivers do.

And I'm not talking about combinations of 2+4, what I'm talking about
is 1+4 which *is* layering violation and a bad idea to start with.

> The difference between the most of those drivers and what I
> suggested is that by bonding a device with a driver they provide
> !device!-quirks, but not the !platform!-quirks. While the platform quirks
> and platform properties are normally provided by means of the platform data,
> firmware nodes, glue layers, etc. Moving some of the platform-quirks to a
> driver you called "layering violation". Well, I've never met that definition
> in the kernel before

> (have you just come up with it?),

Nope, I heard it many times during reviews.

> but at least I see
> what you meant.

> Anyway there are GPIO-drivers which still use the device IDs to get the
> platform quirks

Maybe you missed that we have more players here than simple dwapb-gpio?
How many of them are part of MFD (being used as MFD cells)?

> or get the GPIO-base from an of node alias (gpio-zynq.c,
> gpio-vf610.c, gpio-zx.c, gpio-mxc.c, gpio-mxs.c). There are even some,
> which either use a static variable to redistribute the GPIO-base between
> all available GPIO-chips (gpio-brcmstb.c, gpio-sta2x11.c, gpio-omap.c)
> or set a fixed GPIO-based value (like gpio-xlp.c, gpio-iop.c, gpio-ep93xx.c,
> gpio-vx855.c, gpio-cs5535.c, gpio-sch311x.c, gpio-loongson.c, gpio-loongson1.c,
> gpio-ath79.c, gpio-octeon.c),

So,  the question is above.

> or even get the GPIO-base value from some
> hardware register (gpio-merrifield.c, gpio-intel-mid.c).

These examples are not good, they are not part of MFD and the latter
one actually should be a glue driver to gpio-pxa.c.

> I am pretty sure
> the examples of having the locally-defined platform quirks and the concepts
> 1, 2, 3 and 4 at some extent utilized in a single driver can be found in another
> subsystems too.

I'm pretty sure layering violation can be found in many places in the
kernel. It doesn't mean we have to take bad or different examples as
suitable.

> I am not saying, that the approaches utilized in those drivers are ideal.
> Those are just examples, that the platform specifics can be reflected in
> the corresponding drivers and the so called "layering violation" is allowed
> at some circumstances. Linus, correct me if I am wrong.

It depends how a certain driver is being used. In our case we don't
need to spread board code over the kernel, we may be smarter than
that!

> Getting back to this patchset. As I see it, the main problem here is connected
> with two parameters:
> - GPIO-base. You suggest to update the gpio-dwapb.c driver so one would
>   support a firmware property like "gpio-base". It's not good, since the
>   property will be implicitly supported by OF API as well and nothing will
>   prevent a user from using it. Even though you said that we won't advertise
>   that property, some user may try to define it in dts anyway, which can be
>   easily missed on review.

No, if we don't advertise that and if we add "linux," prefix (see DWC3
for example) to be explicit what this is used for and why.

> - IRQ-shared. As I said before it's not good to replace the irq_shared flag
>   with the to_of_node() macro. Because having to_of_node() returned an
>   of-node doesn't mean the IRQs can't be shared.

This is a valid point, but I would ask you, as a more familiar guy
with the OF/DT system,  what suggestion would be better?

> As I see it the convenience provided by your patchset in relation to the
> GPIO-base and IRQ-shared properties doesn't overcome the problems denoted
> above. IMO it would be better either to move the GPIO-base and the IRQ-shared
> parameters definition to the gpio-dwapb.c driver despite of the so called
> "layering violation" or just leave them in the MFD driver. Linus, please join
> the discussion. Do you have any better idea of what to do with these
> properties?

Moving them to gpio-dwapb is a silly move. Better to do nothing if you
insist, but I consider that is non-constructive.

--
With Best Regards,
Andy Shevchenko
