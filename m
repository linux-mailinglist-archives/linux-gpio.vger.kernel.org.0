Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D82B3DDF5E
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 20:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhHBSiQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 14:38:16 -0400
Received: from mga06.intel.com ([134.134.136.31]:61248 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229612AbhHBSiQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Aug 2021 14:38:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="274574200"
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; 
   d="scan'208";a="274574200"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 11:38:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; 
   d="scan'208";a="666746113"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 11:38:02 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mAcp2-004S1r-7f; Mon, 02 Aug 2021 21:37:56 +0300
Date:   Mon, 2 Aug 2021 21:37:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 1/4] gpio: dwapb: Unify ACPI enumeration checks in
 get_irq() and configure_irqs()
Message-ID: <YQg7hNKlUlkz/fkv@smile.fi.intel.com>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210802134021.flrkpmlrcjfxdrdr@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802134021.flrkpmlrcjfxdrdr@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 02, 2021 at 04:40:21PM +0300, Serge Semin wrote:
> Hello Andy
> Thanks for the cleanup series. A tiny note is below.

Thanks for review!

> On Mon, Jul 26, 2021 at 03:54:33PM +0300, Andy Shevchenko wrote:
> > Shared IRQ is only enabled for ACPI enumeration, there is no need
> > to have a special flag for that, since we simple can test if device
> > has been enumerated by ACPI. This unifies the checks in dwapb_get_irq()
> > and dwapb_configure_irqs().
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/gpio/gpio-dwapb.c                | 13 ++++++-------
> >  drivers/mfd/intel_quark_i2c_gpio.c       |  1 -
> >  include/linux/platform_data/gpio-dwapb.h |  1 -
> >  3 files changed, 6 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> > index 3eb13d6d31ef..f6ae69d5d644 100644
> > --- a/drivers/gpio/gpio-dwapb.c
> > +++ b/drivers/gpio/gpio-dwapb.c
> > @@ -436,12 +436,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
> >  	pirq->irqchip.irq_set_wake = dwapb_irq_set_wake;
> >  #endif
> >  
> 
> > -	if (!pp->irq_shared) {
> > -		girq->num_parents = pirq->nr_irqs;
> > -		girq->parents = pirq->irq;
> > -		girq->parent_handler_data = gpio;
> > -		girq->parent_handler = dwapb_irq_handler;
> > -	} else {
> > +	if (has_acpi_companion(gpio->dev)) {
> 
> Before this patch the platform flag irq_shared has been as kind of a
> hint regarding the shared IRQ case being covered here. But now it
> doesn't seem obvious why we've got the ACPI and ACPI-less cases
> differently handled. What about adding a small comment about that?
> E.g. like this: "Intel ACPI-based platforms mostly have the DW APB
> GPIO IRQ lane shared between several devices. In that case the
> parental IRQ has to be handled in the shared way so to be properly
> delivered to all the connected devices." or something more detailed
> for your preference. After that the rest of the comments in the
> if-clause could be discarded.

Sure!


-- 
With Best Regards,
Andy Shevchenko


