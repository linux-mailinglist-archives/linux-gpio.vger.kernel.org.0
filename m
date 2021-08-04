Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E7B3E039D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 16:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238103AbhHDOoS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 10:44:18 -0400
Received: from mga18.intel.com ([134.134.136.126]:7422 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237793AbhHDOoS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Aug 2021 10:44:18 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="201116838"
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="201116838"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 07:44:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="437448740"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 07:44:03 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mBI7g-0058gw-Gg; Wed, 04 Aug 2021 17:43:56 +0300
Date:   Wed, 4 Aug 2021 17:43:56 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>
Subject: Re: [PATCH v1 2/4] gpio: dwapb: Read GPIO base from gpio-base
 property
Message-ID: <YQqnrHAuSneeEFgO@smile.fi.intel.com>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-2-andriy.shevchenko@linux.intel.com>
 <20210802135839.4clqd34npppwasyh@mobilestation>
 <CAHp75Vcz=vkaGObUcOOTZA51pHPoMc50RpPBLg4fgZgHdUStRA@mail.gmail.com>
 <20210804124433.crh7w6jzfjcswubo@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804124433.crh7w6jzfjcswubo@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 04, 2021 at 03:44:33PM +0300, Serge Semin wrote:
> On Mon, Aug 02, 2021 at 06:52:28PM +0300, Andy Shevchenko wrote:
> > On Mon, Aug 2, 2021 at 5:14 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > On Mon, Jul 26, 2021 at 03:54:34PM +0300, Andy Shevchenko wrote:
> > > > For backward compatibility with some legacy devices introduce
> > > > a new (*) property gpio-base to read GPIO base. This will allow
> > > > further cleanup of the driver.
> > 
> > Thanks for the review! My answers below.
> > 
> > > > *) Note, it's not new for GPIO library since mockup driver is
> > > >    using it already.
> > >
> > > You are right but I don't think it's a good idea to advertise the
> > > pure Linux-internal property "gpio-base" to any use-case like OF
> > > and ACPI FW nodes.
> 
> > I don't want to advertise them, actually (that's why no bindings are
> > modified). Perhaps introducing a paragraph in the GPIO documentation
> > about this (and / or in GPIO generic bindings) that gpio-base property
> > is solely for internal use and should't be used in actual DTs?
> 
> It might have been not that clear but by "advertising" I meant to have
> the property generically handled in the driver, thus permitting it
> being specified not only via the SW-nodes but also via the ACPI
> and OF firmware. (Please see my next comment for more details.)
> 
> Regarding adding the gpio-base property documentation. I am pretty
> sure it shouldn't be mentioned neither in the DW APB GPIO bindings,
> nor in any other GPIO device DT-bindings because as you are right
> saying it is the solely Linux kernel-specific parameter and isn't
> supposed to be part of the device tree specification. On the other
> hand if it gets to be frequently used then indeed we need to somehow
> have it described and of course make sure it isn't used
> inappropriately. Thus a possible option of documenting the property
> would be just adding a new paragraph/file somewhere in
> Documentation/driver-api/gpio/ since the property name implies that
> it's going to be generic and permitted to be specified for all
> GPIO-chips. Though it's for @Linus and @Bartosz to decide after all.

Thanks for elaborative point.

> > >  Especially seeing we don't have it described in the
> > > DT-bindings and noting that the mockup driver is dedicated for the
> > > GPIO tests only. What about restricting the property usage for the
> > > SW-nodes only by adding an additional check: is_software_node() here?
> 
> > I don't think we need this. But if you think it's better this way just
> > to avoid usage of this property outside of internal properties, I'm
> > fine to add. Perhaps we may issue a warning and continue? (see also
> > above)
> 
> In my opinion it's very required and here is why. Adding the generic
> gpio-base property support into the driver basically means saying:
> "Hey, the driver supports it, so you can add it to your firmware."
> Even if the property isn't described in the bindings, the platform
> developers will be able to use it in new DTS-files since it's much
> easier to add a property into a DT-file and make things working than
> to convert the drivers/platforms/apps to using the GPIOd API. In case
> if maintainers aren't that careful at review such dts may get slip
> into the kernel, which in its turn will de facto make the property
> being part of the DT specification and will need to be supported. That
> is we must be very careful in what properties are permitted in the
> driver. Thus, yes, I think we need to make sure here that the property
> is only used in framework of the kernel and isn't passed via
> inappropriate paths like DT/ACPI fw so not to get into the
> maintainability troubles in future.

Got it. I'll add the additional check in next version.

> Issuing a warning but accepting the property isn't good alternative
> due to the same reason. Why do we need to add the DT/ACPI property
> support, which isn't supposed to be used like that instead of just
> restricting the usecases beforehand? So I vote for parsing the
> "gpio-base" property only if it's passed as a part of the SW-node.

-- 
With Best Regards,
Andy Shevchenko


