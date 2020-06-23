Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2CE2046DC
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 03:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730322AbgFWBtw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 21:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730252AbgFWBtw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 21:49:52 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E14C061573;
        Mon, 22 Jun 2020 18:49:50 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y11so21570073ljm.9;
        Mon, 22 Jun 2020 18:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uYfCw8BI2c60y3+kCOVctpEieqYT0Anjq2YH+IKldVY=;
        b=ghxxE/wrmsAL/xDbcx7sIxYKnIFbw019LpKmdX/6xMqPTbmRce2PshejeLx8pbLnTk
         oUzptvlho4Bg+UdBc8JADv2t9WywLtpfDqf0SwrancdrdQpw80h+NqcSaz7TYYw4TUKJ
         dfAm6FEL9uz3vfq/eMvbqJ4/6aQ2ire95ITn7R7rqBqZfmsW+ugFg95CtKOiv8ulOoLq
         Sy5AcWCxzFSRaflHiS9WO9HH7fFc4TqzvgACeQKA44l655z0yVUnWUgLMNXCsJSq4ohi
         RddDBM73DTygO1WlaNxF+FUghuSfYwYF5wH2Lq3n5chd+zuBsXs4qh+GNsx09vygtzUz
         DJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uYfCw8BI2c60y3+kCOVctpEieqYT0Anjq2YH+IKldVY=;
        b=G5cNTK/QQe2r/Pqth0hkuLXh5HTdKbHm6AO0ss73z8JuaFSmNR89XRWOyKSL0dqipA
         8hfhDF5cY6yQGAaRfEViXk++QXr7zb+J8y89X40I6wZBlVH+K7hpLhuNe9yc/dBiQ6U/
         UKio+RQFOvoUdXBZoIrdgfMB6EhDdiexOy44k7SUrZ3uxIU6DcYb8k2hyMPa/8VxlRSy
         6xu/RXEtskqfoYEc8OCSyGSfv7pH6+KpJ3ENtTt25AJNad3+CIwKOPGFT9eh6MCLx/YX
         PcwNqRoy0svgGzXDxbcOi6nZKcR3ux0n4CE6ZN4RozARnJlnOakFcnMQe7PcatCu0EWH
         q3Sg==
X-Gm-Message-State: AOAM533dbUa5ucvlbTY0OVZdW5xSSC8/drf/fPXztUznKCZOkgew0Elu
        spTw1CLSaDKmAdr0n3t78rc=
X-Google-Smtp-Source: ABdhPJx/i9PXPHqu/g+U4bzoDipZpKdFN1wS1PtLZpd2xn2UMEGHaGdfsOJiR4j9pr77qwWvD2QZ5Q==
X-Received: by 2002:a2e:9755:: with SMTP id f21mr9436185ljj.377.1592876988825;
        Mon, 22 Jun 2020 18:49:48 -0700 (PDT)
Received: from mobilestation ([95.79.139.207])
        by smtp.gmail.com with ESMTPSA id i8sm3498423lja.18.2020.06.22.18.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 18:49:47 -0700 (PDT)
Date:   Tue, 23 Jun 2020 04:49:45 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1 0/6] mfd: Make use of software nodes
Message-ID: <20200623014945.56j3hnwnz4cj2u4t@mobilestation>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
 <20200616200225.32mwzew3zw3nuiwh@mobilestation>
 <CAHp75VfZMx8ip=Bo=gZQiGufJvh=7dtr61C3ZcZjETFrErTk6Q@mail.gmail.com>
 <20200616225648.eqzugzapatblndcy@mobilestation>
 <20200618085654.GL2428291@smile.fi.intel.com>
 <20200619221240.tvyf5alek4wxhdby@mobilestation>
 <CAHp75Vf0quL_0j0wBDwma9BToBq87PhFa0Hp0bpQMLMAoTWJpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf0quL_0j0wBDwma9BToBq87PhFa0Hp0bpQMLMAoTWJpA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 20, 2020 at 01:13:56PM +0300, Andy Shevchenko wrote:
> On Sat, Jun 20, 2020 at 1:12 AM Serge Semin <fancer.lancer@gmail.com> wrote:
> > On Thu, Jun 18, 2020 at 11:56:54AM +0300, Andy Shevchenko wrote:
> > > On Wed, Jun 17, 2020 at 01:56:48AM +0300, Serge Semin wrote:
> > > > On Wed, Jun 17, 2020 at 12:40:35AM +0300, Andy Shevchenko wrote:
> > > > > On Tue, Jun 16, 2020 at 11:03 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > > > > On Mon, Jun 08, 2020 at 04:42:54PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > > > > I am wondering whether we could move the {gpio_base, ngpio, irq_shared}
> > > > > > part into the gpio-dwapb.c driver and use either the ACPI-based or
> > > > > > platform_device_id-based matching to get the device-specific resources
> > > > > > info through the driver_data field. By doing so you wouldn't need to
> > > > > > introduce a new "snps,gpio-base"-like property and propagate
> > > > > > software_node-based properties, but still you could get rid of the
> > > > > > dwapb_platform_data structure since all the info would be locally
> > > > > > available.
> > > > >
> > > > > The idea is to get rid of the driver being dependent on some quirks
> > > > > when we may do it clearly and nicely.
> > > >
> >
> > > > Yes, I've got that and in most of the aspects I like what you suggested
> > > > in this parchset. But it seems to me that the maintainers are mostly prone
> > > > to having some of the platform-specifics being locally (in-driver) defined.
> > >
> > > You are a maintainer of the dwapb-gpio. Is it what you insist?
> >
> > That was a discussable suggestion of how the patches could be improved to
> > still have the software-node functionality and to get rid of the legacy
> > platform data passing around.
> 
> > > > So I proposed an alternative solution, which might do to satisfy their
> > > > requirement.
> > >
> > > I'm puzzled whom about you are talking.
> >
> > I don't have a habit to say of myself like that) So obviously I was talking
> > about Linus and Lee in the previous sentence mostly referring to the Linus'
> > words regarding setting the GPIO base and having the "gpio-base" property
> > at all.
> 
> Linus replied to three messages out of 7, seems you read only the first one.
> That's why I have been puzzled.

Actually I've read all of them and from what I could see, he didn't like a code
setting gpio-base regardless whether it has been created before your patchset
or your explanation why it was necessary.

> 
> > > > Note saying that you want to get rid of the quirks and
> > > > introducing something like "gpio-base" firmware property seems contradicting
> > > > a bit.
> > >
> > > Maybe I need to elaborate that under quirks I meant quirk-clean GPIO driver,
> > > so, it wouldn't care about what platform(s) require base and what do not.
> >
> > My point is that no mater how you pass the gpio-base value it will always be a
> > quirk. The same thing is with the irq_shared flag. Both of them are specific to
> > the Quark-platform. They are used to tune the DW APB GPIO driver up so one would
> > create a GPIO device working well with the Quark-specific DW APB GPIO block.
> 
> Precisely!
> 
> > > > > We, by applying this series, make (keep) layers independent: board
> > > > > code vs. driver code. Mixing them more is the opposite to what I
> > > > > propose.
> > > > >
> > > > > WRT property.
> > > > > snps,gpio-base can be easily changed to *already in use* gpio-base or
> > > > > being both converted to linux,gpio-base to explicitly show people that
> > > > > this is internal stuff that must not be present in firmware nodes.
> > > >
> > > > As I see it the part with "gpio-base" and the irq_shared can be moved to the
> > > > gpio-dwapb.c driver to be defined as the quark-specific quirks. Adding a
> > > > property like "gpio-base" seems like a quirk anyway, so I'd leave it defined in
> > > > the driver.
> > >
> >
> > > Huh?! The whole idea is make GPIO driver agnostic from platforms and their quirks.
> >
> > As I said above having the gpio-base value set is the platform-specific thing in
> > any case. So no mater whether you pass it via the software_node/properties or
> > the private platform-data structure, the DW APB GPIO driver will have to handle
> > those parameters in some special way, which is quirk-prone since normal platforms
> > don't have such peculiar requirements.
> 

> Seems you are proposing layering violation without seeing it.
> Let me explain the design of the drivers in Linux kernel.
> 
> There are basically few possible concepts how drivers are handling
> quirks (because we know that most of the hardware support is a set of
> quirks here and there):
> 1) platform provides a board files and via platform data structures
> supplies quirks to the certain driver
> 2) platform provides a firmware node (ACPI, DT, ...) and unified
> driver handles it thru the fwnode interface
> 3) driver is split to be a library (or core part) + glue drivers full of quirks
> 4) driver has embedded quirks and supplies them based on IDs (PCI ID,
> ACPI ID, compatible string, ID table, etc)
> 5) ...missed something? ...
> 
> What I'm proposing is turn 1 to 2 for Quark case, what you are
> proposing is absent on the picture, i.e.:
> x) platform provides a board file (intel_quark_i2c_gpio.c) and the
> driver has embedded quirks based on ID.
> 
> This is not what we want, definitely.

From the list you provided it's still not obvious why what I suggested wasn't
good, because it's perfectly fine to have both ACPI/DT-based firmware node
(entry 2) and quirks based on IDs (entry 4), which plenty of the kernel
drivers do. The difference between the most of those drivers and what I
suggested is that by bonding a device with a driver they provide
!device!-quirks, but not the !platform!-quirks. While the platform quirks
and platform properties are normally provided by means of the platform data,
firmware nodes, glue layers, etc. Moving some of the platform-quirks to a
driver you called "layering violation". Well, I've never met that definition
in the kernel before (have you just come up with it?), but at least I see
what you meant.

Anyway there are GPIO-drivers which still use the device IDs to get the
platform quirks or get the GPIO-base from an of node alias (gpio-zynq.c,
gpio-vf610.c, gpio-zx.c, gpio-mxc.c, gpio-mxs.c). There are even some,
which either use a static variable to redistribute the GPIO-base between
all available GPIO-chips (gpio-brcmstb.c, gpio-sta2x11.c, gpio-omap.c)
or set a fixed GPIO-based value (like gpio-xlp.c, gpio-iop.c, gpio-ep93xx.c,
gpio-vx855.c, gpio-cs5535.c, gpio-sch311x.c, gpio-loongson.c, gpio-loongson1.c,
gpio-ath79.c, gpio-octeon.c), or even get the GPIO-base value from some
hardware register (gpio-merrifield.c, gpio-intel-mid.c). I am pretty sure
the examples of having the locally-defined platform quirks and the concepts
1, 2, 3 and 4 at some extent utilized in a single driver can be found in another
subsystems too.

I am not saying, that the approaches utilized in those drivers are ideal.
Those are just examples, that the platform specifics can be reflected in
the corresponding drivers and the so called "layering violation" is allowed
at some circumstances. Linus, correct me if I am wrong.

Getting back to this patchset. As I see it, the main problem here is connected
with two parameters:
- GPIO-base. You suggest to update the gpio-dwapb.c driver so one would
  support a firmware property like "gpio-base". It's not good, since the
  property will be implicitly supported by OF API as well and nothing will
  prevent a user from using it. Even though you said that we won't advertise
  that property, some user may try to define it in dts anyway, which can be
  easily missed on review.
- IRQ-shared. As I said before it's not good to replace the irq_shared flag
  with the to_of_node() macro. Because having to_of_node() returned an
  of-node doesn't mean the IRQs can't be shared.

As I see it the convenience provided by your patchset in relation to the
GPIO-base and IRQ-shared properties doesn't overcome the problems denoted
above. IMO it would be better either to move the GPIO-base and the IRQ-shared
parameters definition to the gpio-dwapb.c driver despite of the so called
"layering violation" or just leave them in the MFD driver. Linus, please join
the discussion. Do you have any better idea of what to do with these
properties?

-Sergey

> 
> ...
> 
> > > What you are talking about? Can you provide a code we can discuss?
> >
> > Here is what I suggest in step-by-step:
> > Patch 1) Move the Quark-specific GPIO-base and irq_shared parameters definition
> >          to the gpio-dwapb.c driver.
> 
> Layering violation: spreading board code over the kernel.
> 
> > Patch 2) Retrieve the GPIO-base and IRQ-shared parameters only for the DW APB
> >          GPIO block living in the Quark platform (by means of either ACPI or
> >          the platform-device ID data).
> 
> Same. (The rest doesn't matter. I dropped it because it's basically
> the same what I proposed)
> 
> > By doing as I suggested you don't have to pass around the GPIO-base value and
> > the IRQ-shared flag. They will be initialized and utilized locally in the
> > DW APB GPIO driver if Quark-specific DW APB GPIO block is detected (patches 1
> > and 2). In that case a software-node created in Patch 3 and 4 will be a normal
> > firmware node described by the DW bindings. You'll still be able to get rid of
> > the legacy global platform-data in the Patch 5.
> >
> > The spirit of your original patchset will still be preserved: introduce the
> > software-nodes propagation interface and use it to pass the generic DW APB GPIO
> > parameters. The only difference is that we'd move the GPIO-base and IRQ-shared
> > functionality fully into the DW APB GPIO driver. By doing so we'd have:
> > 1) DW APB GPIO Quark-specifics localized in a single gpio-dwapb driver.
> >    In the current implementation we have them distributed between two drivers:
> >    intel_quark_i2c_gpio initializes the GPIO-base and IRQ-shared parameters,
> >    gpio-dwapb uses them for setup. Note there is no any other platform with DW
> >    APB GPIO which needs the GPIO-base and IRQ-shared flag being setup. Why do
> >    we need to have such complicated interface then if we can identify whether
> >    the particular DW APB GPIO is a Quark-specific block or not? Moreover having
> >    those specifics in both drivers in fact means having quirks in both of them.
> > 2) Quirk-clean intel_quark_i2c_gpio driver which creates a normal DW APB GPIO
> >    device with software-nodes fully compatible with DT binding. DW APB GPIO
> >    driver will detect whether the block is Quark-specific and will activate
> >    the corresponding quirks if it is.
> > 3) Still legacy global platform-data removed.
> 
> I see. But you mistakenly made a conclusion 1). It will be spread to
> two drivers.
> And in 2) you considered (wrongly) that MFD driver is not a board code.
> 
> Again MFD driver _is_ a board code or i.o.w. quirk driver for specific
> Quark (MFD) device.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
