Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7F51FEE31
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 10:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728945AbgFRI5S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 04:57:18 -0400
Received: from mga18.intel.com ([134.134.136.126]:9917 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728957AbgFRI5B (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Jun 2020 04:57:01 -0400
IronPort-SDR: /V+J27ipgjfERc3R9X4ROxUL/rtRhNhQHPeSH8kJmof0DSfltmva1DtSXfFqS5OhcZc7fXy6un
 9Cm+l/CsS/cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="129838105"
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="129838105"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2020 01:56:54 -0700
IronPort-SDR: ZGxC2mJAjIhIqoZ7Ayl/dGYggHaOBy1q/pA5op6tYrSozL8Y1S7uTRMbtIcWiMasAXVhzZ4zI8
 mfRvg4mzBiiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="299596268"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jun 2020 01:56:52 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1jlqLu-00EEZK-OX; Thu, 18 Jun 2020 11:56:54 +0300
Date:   Thu, 18 Jun 2020 11:56:54 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1 0/6] mfd: Make use of software nodes
Message-ID: <20200618085654.GL2428291@smile.fi.intel.com>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
 <20200616200225.32mwzew3zw3nuiwh@mobilestation>
 <CAHp75VfZMx8ip=Bo=gZQiGufJvh=7dtr61C3ZcZjETFrErTk6Q@mail.gmail.com>
 <20200616225648.eqzugzapatblndcy@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616225648.eqzugzapatblndcy@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 17, 2020 at 01:56:48AM +0300, Serge Semin wrote:
> On Wed, Jun 17, 2020 at 12:40:35AM +0300, Andy Shevchenko wrote:
> > On Tue, Jun 16, 2020 at 11:03 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > On Mon, Jun 08, 2020 at 04:42:54PM +0300, Andy Shevchenko wrote:
> > > > Some devices would need to have a hierarchy of properties and
> > > > child nodes passed to the child or children of MFD. For such case
> > > > we may utilize software nodes, which is superior on device properties.
> > > >
> > > > Add support of software nodes to MFD core and convert one driver
> > > > to show how it looks like. This allows to get rid of legacy platform
> > > > data.
> > > >
> > > > The change has been tested on Intel Galileo Gen 2.
> > >
> > > I am wondering whether we could move the {gpio_base, ngpio, irq_shared}
> > > part into the gpio-dwapb.c driver and use either the ACPI-based or
> > > platform_device_id-based matching to get the device-specific resources
> > > info through the driver_data field. By doing so you wouldn't need to
> > > introduce a new "snps,gpio-base"-like property and propagate
> > > software_node-based properties, but still you could get rid of the
> > > dwapb_platform_data structure since all the info would be locally
> > > available.
> > 
> > The idea is to get rid of the driver being dependent on some quirks
> > when we may do it clearly and nicely.
> 
> Yes, I've got that and in most of the aspects I like what you suggested
> in this parchset. But it seems to me that the maintainers are mostly prone
> to having some of the platform-specifics being locally (in-driver) defined.

You are a maintainer of the dwapb-gpio. Is it what you insist?

> So I proposed an alternative solution, which might do to satisfy their
> requirement.

I'm puzzled whom about you are talking.

> Note saying that you want to get rid of the quirks and
> introducing something like "gpio-base" firmware property seems contradicting
> a bit. 

Maybe I need to elaborate that under quirks I meant quirk-clean GPIO driver,
so, it wouldn't care about what platform(s) require base and what do not.

> > We, by applying this series, make (keep) layers independent: board
> > code vs. driver code. Mixing them more is the opposite to what I
> > propose.
> > 
> > WRT property.
> > snps,gpio-base can be easily changed to *already in use* gpio-base or
> > being both converted to linux,gpio-base to explicitly show people that
> > this is internal stuff that must not be present in firmware nodes.
> 
> As I see it the part with "gpio-base" and the irq_shared can be moved to the
> gpio-dwapb.c driver to be defined as the quark-specific quirks. Adding a
> property like "gpio-base" seems like a quirk anyway, so I'd leave it defined in
> the driver.

Huh?! The whole idea is make GPIO driver agnostic from platforms and their quirks.

> * Note I don't really like replacing the irq_shared flag with to_of_node()
> because in general to_of_node() doesn't mean the IRQ line is shared, so
> selecting the shared and non-shared interrupt request paths based on that macro
> seems hackish.

This I can understand, but can you propose better alternative?

> > > If ACPI-based matching doesn't uniquely address the Quark GPIO node,
> > > then you could just replace the intel_quark_mfd_cells[0].name with
> > > something like "gpio-dwapb-quark", which then by the MFD core will be
> > > copied to the corresponding platform_device->name due to calling
> > > platform_device_alloc() with cell-name passed. That name will be used
> > > to match a platform_driver with id_table having that new name added.
> > 
> > Oh, that doesn't sound right. It makes things ugly.
> 
> I may have said that a bit unclearly. The only thing you'd need to do is to
> add an unique name to the Quark GPIO cell, like:
> drivers/mfd/intel_quark_i2c_gpio.c:
> static struct mfd_cell intel_quark_mfd_cells[] = {
>         {
>                 .name = "gpio-dwapb-quark",
>         }
> 
> Then make the gpio-dwapb.c driver being compatible with that device by declaring
> the id_table with that device name and passing the table to the DW APB GPIO
> "struct platform_driver" descriptor. The MFD/platform cores already provide the
> functionality of matching those two device and driver. If ACPI node uniquely
> defines the Quark GPIO with all that quirks applicable then you wouldn't even
> need to do the platform_device-driver-based matching. Just use the acpi_device_id
> to get the quirks flags/descriptors. 

What you are talking about? Can you provide a code we can discuss?

> * Though indeed it would be better to mark the "snps,nr-gpios" as deprecated in
> the DT schema and have the "ngpios" supported as well.

Actually I used to have that piece in my first patches, but decided to remove
due to this property being (semi-)internal. I would like to hear GPIO
maintainers about this.

Bart, Linus?

-- 
With Best Regards,
Andy Shevchenko


