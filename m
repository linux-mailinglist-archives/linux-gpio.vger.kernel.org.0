Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4ED8202320
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2020 12:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgFTKOO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jun 2020 06:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727937AbgFTKON (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 06:14:13 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88BAC06174E;
        Sat, 20 Jun 2020 03:14:13 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id i4so5618078pjd.0;
        Sat, 20 Jun 2020 03:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mVvKSlra5tdVFw4XNbJcwJVR2kZ3RYSGoAm/1hV4qws=;
        b=N5hHbQPHLKE/w/2qjr728lTtHueNfJcXJ6r4FKNfacCG/cy40Kv2yGlZi1bevwvk0a
         NSobWLjvQIk/1CI13g0nwkSqNlEvu/6/xhddHzjyQnh4RBGXJdJ+d/nXgg3bBDX8eQd3
         2UDhKzfOvGKpb+R+4v14F6TDg/25+TKc/i1+94Ff+P3STJfghYwkKkBNexLGL4aMApp/
         TCMs5VgioVBmgUvaTYfwMfG1Nru+ws1Kva1sloSr5xdpzk7BGCXTNJYUMeu8/kGIQApa
         JgsWlmonExmAiKkCISrG41m5SzDWRKRPTJJvoN01nhUjRAGNPlDWrhBupP4TrY+bPGQy
         TPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mVvKSlra5tdVFw4XNbJcwJVR2kZ3RYSGoAm/1hV4qws=;
        b=KEoaLwpi1CdyGy2EG9+/1AYU4I6lTw9W/Fxgxbax/k100dpJCEyFsNaUOIG7sp3nyE
         bysOQX0Lrtrsphtdhi1Wlq9jUnHKu9Y9aXH9YwEyLzXaObLJqxeV+lQ2Gfbe/FIT6Y2l
         UpPHYB5MoK965xwnzHIQ9S80jkCeStqKgr0gYbGI8YK2H/bCYVAAQuOb79w7JzLOK25D
         KwwEndpttvxaOEPjbhr6+ZfVGPWYhvfyV0K180B2LGauqqAbmGoVVaKYHS5nS4m3/3ki
         dA5m64emkwqIMS7/CCqtxv/18KDddhLuQ8WAFh9e/VUgPlxw97eOVdLuUSkxs9smTqH1
         sGrg==
X-Gm-Message-State: AOAM5304Xh4cBCjQHWQ6l/dA2m3NoCZelVizm6mTpa7KSo1XaBhw0F8x
        t6fb1CwCsLyLhKqV7bxHuS2OCSMPiGjzp9AKQ9qOBJ2e
X-Google-Smtp-Source: ABdhPJwwhzS/k++C/lJteN+bAi0VlSV9sZ4nnhOo6/eKe88EnOa5Ki0TseAWi5SZOFHVPpAyZKNXfxOmbbUZuiDfwpU=
X-Received: by 2002:a17:90a:ac05:: with SMTP id o5mr8122697pjq.228.1592648052858;
 Sat, 20 Jun 2020 03:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
 <20200616200225.32mwzew3zw3nuiwh@mobilestation> <CAHp75VfZMx8ip=Bo=gZQiGufJvh=7dtr61C3ZcZjETFrErTk6Q@mail.gmail.com>
 <20200616225648.eqzugzapatblndcy@mobilestation> <20200618085654.GL2428291@smile.fi.intel.com>
 <20200619221240.tvyf5alek4wxhdby@mobilestation>
In-Reply-To: <20200619221240.tvyf5alek4wxhdby@mobilestation>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 20 Jun 2020 13:13:56 +0300
Message-ID: <CAHp75Vf0quL_0j0wBDwma9BToBq87PhFa0Hp0bpQMLMAoTWJpA@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] mfd: Make use of software nodes
To:     Serge Semin <fancer.lancer@gmail.com>
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

On Sat, Jun 20, 2020 at 1:12 AM Serge Semin <fancer.lancer@gmail.com> wrote:
> On Thu, Jun 18, 2020 at 11:56:54AM +0300, Andy Shevchenko wrote:
> > On Wed, Jun 17, 2020 at 01:56:48AM +0300, Serge Semin wrote:
> > > On Wed, Jun 17, 2020 at 12:40:35AM +0300, Andy Shevchenko wrote:
> > > > On Tue, Jun 16, 2020 at 11:03 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > > > On Mon, Jun 08, 2020 at 04:42:54PM +0300, Andy Shevchenko wrote:

...

> > > > > I am wondering whether we could move the {gpio_base, ngpio, irq_shared}
> > > > > part into the gpio-dwapb.c driver and use either the ACPI-based or
> > > > > platform_device_id-based matching to get the device-specific resources
> > > > > info through the driver_data field. By doing so you wouldn't need to
> > > > > introduce a new "snps,gpio-base"-like property and propagate
> > > > > software_node-based properties, but still you could get rid of the
> > > > > dwapb_platform_data structure since all the info would be locally
> > > > > available.
> > > >
> > > > The idea is to get rid of the driver being dependent on some quirks
> > > > when we may do it clearly and nicely.
> > >
>
> > > Yes, I've got that and in most of the aspects I like what you suggested
> > > in this parchset. But it seems to me that the maintainers are mostly prone
> > > to having some of the platform-specifics being locally (in-driver) defined.
> >
> > You are a maintainer of the dwapb-gpio. Is it what you insist?
>
> That was a discussable suggestion of how the patches could be improved to
> still have the software-node functionality and to get rid of the legacy
> platform data passing around.

> > > So I proposed an alternative solution, which might do to satisfy their
> > > requirement.
> >
> > I'm puzzled whom about you are talking.
>
> I don't have a habit to say of myself like that) So obviously I was talking
> about Linus and Lee in the previous sentence mostly referring to the Linus'
> words regarding setting the GPIO base and having the "gpio-base" property
> at all.

Linus replied to three messages out of 7, seems you read only the first one.
That's why I have been puzzled.

> > > Note saying that you want to get rid of the quirks and
> > > introducing something like "gpio-base" firmware property seems contradicting
> > > a bit.
> >
> > Maybe I need to elaborate that under quirks I meant quirk-clean GPIO driver,
> > so, it wouldn't care about what platform(s) require base and what do not.
>
> My point is that no mater how you pass the gpio-base value it will always be a
> quirk. The same thing is with the irq_shared flag. Both of them are specific to
> the Quark-platform. They are used to tune the DW APB GPIO driver up so one would
> create a GPIO device working well with the Quark-specific DW APB GPIO block.

Precisely!

> > > > We, by applying this series, make (keep) layers independent: board
> > > > code vs. driver code. Mixing them more is the opposite to what I
> > > > propose.
> > > >
> > > > WRT property.
> > > > snps,gpio-base can be easily changed to *already in use* gpio-base or
> > > > being both converted to linux,gpio-base to explicitly show people that
> > > > this is internal stuff that must not be present in firmware nodes.
> > >
> > > As I see it the part with "gpio-base" and the irq_shared can be moved to the
> > > gpio-dwapb.c driver to be defined as the quark-specific quirks. Adding a
> > > property like "gpio-base" seems like a quirk anyway, so I'd leave it defined in
> > > the driver.
> >
>
> > Huh?! The whole idea is make GPIO driver agnostic from platforms and their quirks.
>
> As I said above having the gpio-base value set is the platform-specific thing in
> any case. So no mater whether you pass it via the software_node/properties or
> the private platform-data structure, the DW APB GPIO driver will have to handle
> those parameters in some special way, which is quirk-prone since normal platforms
> don't have such peculiar requirements.

Seems you are proposing layering violation without seeing it.
Let me explain the design of the drivers in Linux kernel.

There are basically few possible concepts how drivers are handling
quirks (because we know that most of the hardware support is a set of
quirks here and there):
1) platform provides a board files and via platform data structures
supplies quirks to the certain driver
2) platform provides a firmware node (ACPI, DT, ...) and unified
driver handles it thru the fwnode interface
3) driver is split to be a library (or core part) + glue drivers full of quirks
4) driver has embedded quirks and supplies them based on IDs (PCI ID,
ACPI ID, compatible string, ID table, etc)
5) ...missed something? ...

What I'm proposing is turn 1 to 2 for Quark case, what you are
proposing is absent on the picture, i.e.:
x) platform provides a board file (intel_quark_i2c_gpio.c) and the
driver has embedded quirks based on ID.

This is not what we want, definitely.

...

> > What you are talking about? Can you provide a code we can discuss?
>
> Here is what I suggest in step-by-step:
> Patch 1) Move the Quark-specific GPIO-base and irq_shared parameters definition
>          to the gpio-dwapb.c driver.

Layering violation: spreading board code over the kernel.

> Patch 2) Retrieve the GPIO-base and IRQ-shared parameters only for the DW APB
>          GPIO block living in the Quark platform (by means of either ACPI or
>          the platform-device ID data).

Same. (The rest doesn't matter. I dropped it because it's basically
the same what I proposed)

> By doing as I suggested you don't have to pass around the GPIO-base value and
> the IRQ-shared flag. They will be initialized and utilized locally in the
> DW APB GPIO driver if Quark-specific DW APB GPIO block is detected (patches 1
> and 2). In that case a software-node created in Patch 3 and 4 will be a normal
> firmware node described by the DW bindings. You'll still be able to get rid of
> the legacy global platform-data in the Patch 5.
>
> The spirit of your original patchset will still be preserved: introduce the
> software-nodes propagation interface and use it to pass the generic DW APB GPIO
> parameters. The only difference is that we'd move the GPIO-base and IRQ-shared
> functionality fully into the DW APB GPIO driver. By doing so we'd have:
> 1) DW APB GPIO Quark-specifics localized in a single gpio-dwapb driver.
>    In the current implementation we have them distributed between two drivers:
>    intel_quark_i2c_gpio initializes the GPIO-base and IRQ-shared parameters,
>    gpio-dwapb uses them for setup. Note there is no any other platform with DW
>    APB GPIO which needs the GPIO-base and IRQ-shared flag being setup. Why do
>    we need to have such complicated interface then if we can identify whether
>    the particular DW APB GPIO is a Quark-specific block or not? Moreover having
>    those specifics in both drivers in fact means having quirks in both of them.
> 2) Quirk-clean intel_quark_i2c_gpio driver which creates a normal DW APB GPIO
>    device with software-nodes fully compatible with DT binding. DW APB GPIO
>    driver will detect whether the block is Quark-specific and will activate
>    the corresponding quirks if it is.
> 3) Still legacy global platform-data removed.

I see. But you mistakenly made a conclusion 1). It will be spread to
two drivers.
And in 2) you considered (wrongly) that MFD driver is not a board code.

Again MFD driver _is_ a board code or i.o.w. quirk driver for specific
Quark (MFD) device.

-- 
With Best Regards,
Andy Shevchenko
