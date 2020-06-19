Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83921201DDF
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2020 00:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729100AbgFSWMr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Jun 2020 18:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729056AbgFSWMp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jun 2020 18:12:45 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 576D1C06174E;
        Fri, 19 Jun 2020 15:12:45 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id 9so13199251ljc.8;
        Fri, 19 Jun 2020 15:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e4EcwghmPjHSRCnJDh/adnT/+UjY7z/BVg7KYa8bZsc=;
        b=NYjYj2mIGjUyF0rYxheecOmS7E0Xis9He9Tjwhrp8dYx8ynf+5Lo/syQQFiyh0LRo2
         fn/rNnnJHr6thpStZ27JbFrmWvE5GbNDJBsIuOT12zdxXCBgG38XVOut/062b/CcYMF8
         jSkpVHpro7XTdi6amiqnUo7GSAiaZHHiZQDaOAviKH4Mqbh1WiBdHIcpkmq0Qf1hMuvQ
         rNkoWpjs/YXfj+A23XJypKCBxzWJbJZUEKPeu+6THySUeoWPrDQFN0UZOeNVBCCO//JX
         xyW78t6w4lW2Ordt7PKVM7N3MoowIRoA0ucp3hcaRRJ1VSskbM9rqD27mT5xExJbGYbs
         nFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e4EcwghmPjHSRCnJDh/adnT/+UjY7z/BVg7KYa8bZsc=;
        b=GIDM3BEZDlxzzjjkZ3ARX8vbPbeoAbYKpWt/P9R0SGbIn2FmpdTPzS784ykCvo6MfR
         aS+2jpIzBFYr4qX2kx5+I4TunGvcp78aIG0ji96qWZPAozmV8GnFTKZktfjgarwfdlQO
         xQDXh+n8j3KvehAo4yjiLxY5i78kVeL+EMPRsmzjLwV0tlBHO8iCkU2QHa0JCTrc3oYL
         mRVCqga5VbXtBp93IhKNLKzb2IZXWiXGIu6JvVtXva7TbhqQYi3vD2eOobWAeGhW2aAu
         3FC3wmqeHaS7gULFl1EJW/NHzGmorCp6PirJeM841+aw85ZyYlTsK2ZcLdDkS1PAfxik
         ka3A==
X-Gm-Message-State: AOAM531t5ELFyl/jV5yzQ+wAfKKIzygU7USu68OnNwe9p8Yw8iugDfvk
        OEfUf4II2SDqW56UZiin2fIqBktc
X-Google-Smtp-Source: ABdhPJy4QvTQxuAQ9sPZCsgxUR7ZziBNCjO5eRcFRrMxSuMKBFdn+QDJR0D8CkFH9dcVMF++rNoNmA==
X-Received: by 2002:a2e:4812:: with SMTP id v18mr2910041lja.353.1592604763614;
        Fri, 19 Jun 2020 15:12:43 -0700 (PDT)
Received: from mobilestation ([95.79.139.207])
        by smtp.gmail.com with ESMTPSA id l22sm1370213ljg.41.2020.06.19.15.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 15:12:42 -0700 (PDT)
Date:   Sat, 20 Jun 2020 01:12:40 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1 0/6] mfd: Make use of software nodes
Message-ID: <20200619221240.tvyf5alek4wxhdby@mobilestation>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
 <20200616200225.32mwzew3zw3nuiwh@mobilestation>
 <CAHp75VfZMx8ip=Bo=gZQiGufJvh=7dtr61C3ZcZjETFrErTk6Q@mail.gmail.com>
 <20200616225648.eqzugzapatblndcy@mobilestation>
 <20200618085654.GL2428291@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618085654.GL2428291@smile.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 18, 2020 at 11:56:54AM +0300, Andy Shevchenko wrote:
> On Wed, Jun 17, 2020 at 01:56:48AM +0300, Serge Semin wrote:
> > On Wed, Jun 17, 2020 at 12:40:35AM +0300, Andy Shevchenko wrote:
> > > On Tue, Jun 16, 2020 at 11:03 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > > On Mon, Jun 08, 2020 at 04:42:54PM +0300, Andy Shevchenko wrote:
> > > > > Some devices would need to have a hierarchy of properties and
> > > > > child nodes passed to the child or children of MFD. For such case
> > > > > we may utilize software nodes, which is superior on device properties.
> > > > >
> > > > > Add support of software nodes to MFD core and convert one driver
> > > > > to show how it looks like. This allows to get rid of legacy platform
> > > > > data.
> > > > >
> > > > > The change has been tested on Intel Galileo Gen 2.
> > > >
> > > > I am wondering whether we could move the {gpio_base, ngpio, irq_shared}
> > > > part into the gpio-dwapb.c driver and use either the ACPI-based or
> > > > platform_device_id-based matching to get the device-specific resources
> > > > info through the driver_data field. By doing so you wouldn't need to
> > > > introduce a new "snps,gpio-base"-like property and propagate
> > > > software_node-based properties, but still you could get rid of the
> > > > dwapb_platform_data structure since all the info would be locally
> > > > available.
> > > 
> > > The idea is to get rid of the driver being dependent on some quirks
> > > when we may do it clearly and nicely.
> > 

> > Yes, I've got that and in most of the aspects I like what you suggested
> > in this parchset. But it seems to me that the maintainers are mostly prone
> > to having some of the platform-specifics being locally (in-driver) defined.
> 
> You are a maintainer of the dwapb-gpio. Is it what you insist?

That was a discussable suggestion of how the patches could be improved to
still have the software-node functionality and to get rid of the legacy
platform data passing around.

> 
> > So I proposed an alternative solution, which might do to satisfy their
> > requirement.
> 
> I'm puzzled whom about you are talking.

I don't have a habit to say of myself like that) So obviously I was talking
about Linus and Lee in the previous sentence mostly referring to the Linus'
words regarding setting the GPIO base and having the "gpio-base" property
at all.

> 
> > Note saying that you want to get rid of the quirks and
> > introducing something like "gpio-base" firmware property seems contradicting
> > a bit. 
> 
> Maybe I need to elaborate that under quirks I meant quirk-clean GPIO driver,
> so, it wouldn't care about what platform(s) require base and what do not.

My point is that no mater how you pass the gpio-base value it will always be a
quirk. The same thing is with the irq_shared flag. Both of them are specific to
the Quark-platform. They are used to tune the DW APB GPIO driver up so one would
create a GPIO device working well with the Quark-specific DW APB GPIO block.

> 
> > > We, by applying this series, make (keep) layers independent: board
> > > code vs. driver code. Mixing them more is the opposite to what I
> > > propose.
> > > 
> > > WRT property.
> > > snps,gpio-base can be easily changed to *already in use* gpio-base or
> > > being both converted to linux,gpio-base to explicitly show people that
> > > this is internal stuff that must not be present in firmware nodes.
> > 
> > As I see it the part with "gpio-base" and the irq_shared can be moved to the
> > gpio-dwapb.c driver to be defined as the quark-specific quirks. Adding a
> > property like "gpio-base" seems like a quirk anyway, so I'd leave it defined in
> > the driver.
> 

> Huh?! The whole idea is make GPIO driver agnostic from platforms and their quirks.

As I said above having the gpio-base value set is the platform-specific thing in
any case. So no mater whether you pass it via the software_node/properties or
the private platform-data structure, the DW APB GPIO driver will have to handle
those parameters in some special way, which is quirk-prone since normal platforms
don't have such peculiar requirements.

> 
> > * Note I don't really like replacing the irq_shared flag with to_of_node()
> > because in general to_of_node() doesn't mean the IRQ line is shared, so
> > selecting the shared and non-shared interrupt request paths based on that macro
> > seems hackish.
> 
> This I can understand, but can you propose better alternative?

Alas I can't at the moment. But see my comment below.

> 
> > > > If ACPI-based matching doesn't uniquely address the Quark GPIO node,
> > > > then you could just replace the intel_quark_mfd_cells[0].name with
> > > > something like "gpio-dwapb-quark", which then by the MFD core will be
> > > > copied to the corresponding platform_device->name due to calling
> > > > platform_device_alloc() with cell-name passed. That name will be used
> > > > to match a platform_driver with id_table having that new name added.
> > > 
> > > Oh, that doesn't sound right. It makes things ugly.
> > 
> > I may have said that a bit unclearly. The only thing you'd need to do is to
> > add an unique name to the Quark GPIO cell, like:
> > drivers/mfd/intel_quark_i2c_gpio.c:
> > static struct mfd_cell intel_quark_mfd_cells[] = {
> >         {
> >                 .name = "gpio-dwapb-quark",
> >         }
> > 
> > Then make the gpio-dwapb.c driver being compatible with that device by declaring
> > the id_table with that device name and passing the table to the DW APB GPIO
> > "struct platform_driver" descriptor. The MFD/platform cores already provide the
> > functionality of matching those two device and driver. If ACPI node uniquely
> > defines the Quark GPIO with all that quirks applicable then you wouldn't even
> > need to do the platform_device-driver-based matching. Just use the acpi_device_id
> > to get the quirks flags/descriptors. 
> 
> What you are talking about? Can you provide a code we can discuss?

Here is what I suggest in step-by-step:
Patch 1) Move the Quark-specific GPIO-base and irq_shared parameters definition
         to the gpio-dwapb.c driver.
Patch 2) Retrieve the GPIO-base and IRQ-shared parameters only for the DW APB
         GPIO block living in the Quark platform (by means of either ACPI or
         the platform-device ID data).
Patch 3) Introduce the software_node propagation functionality (AFAIU Lee
         wants it to be a part of the platform-device core instead of being
         created on the MFD level).
Patch 4) Convert the intel_quark_i2c_gpio driver to using the software nodes
         instead of creating the dwapb_platform_data instance (nearly matches
         your patch 4 except it won't introduce any "gpio-base"-like property).
Patch 5) Get rid of the global dwapb_platform_data utilization (matches your
         patch 5).
Patch 6) Introduce the IRQ and GPIO lines macro (matches your patch 6).

By doing as I suggested you don't have to pass around the GPIO-base value and
the IRQ-shared flag. They will be initialized and utilized locally in the
DW APB GPIO driver if Quark-specific DW APB GPIO block is detected (patches 1
and 2). In that case a software-node created in Patch 3 and 4 will be a normal
firmware node described by the DW bindings. You'll still be able to get rid of
the legacy global platform-data in the Patch 5.

The spirit of your original patchset will still be preserved: introduce the
software-nodes propagation interface and use it to pass the generic DW APB GPIO
parameters. The only difference is that we'd move the GPIO-base and IRQ-shared
functionality fully into the DW APB GPIO driver. By doing so we'd have:
1) DW APB GPIO Quark-specifics localized in a single gpio-dwapb driver.
   In the current implementation we have them distributed between two drivers:
   intel_quark_i2c_gpio initializes the GPIO-base and IRQ-shared parameters,
   gpio-dwapb uses them for setup. Note there is no any other platform with DW
   APB GPIO which needs the GPIO-base and IRQ-shared flag being setup. Why do
   we need to have such complicated interface then if we can identify whether
   the particular DW APB GPIO is a Quark-specific block or not? Moreover having
   those specifics in both drivers in fact means having quirks in both of them.
2) Quirk-clean intel_quark_i2c_gpio driver which creates a normal DW APB GPIO
   device with software-nodes fully compatible with DT binding. DW APB GPIO
   driver will detect whether the block is Quark-specific and will activate
   the corresponding quirks if it is.
3) Still legacy global platform-data removed.

-Sergey

> 
> > * Though indeed it would be better to mark the "snps,nr-gpios" as deprecated in
> > the DT schema and have the "ngpios" supported as well.
> 
> Actually I used to have that piece in my first patches, but decided to remove
> due to this property being (semi-)internal. I would like to hear GPIO
> maintainers about this.
> 
> Bart, Linus?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
