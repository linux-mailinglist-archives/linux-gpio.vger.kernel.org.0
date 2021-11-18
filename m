Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F4B4564F3
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 22:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbhKRVTg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 16:19:36 -0500
Received: from mga05.intel.com ([192.55.52.43]:41214 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229521AbhKRVTg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Nov 2021 16:19:36 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="320508099"
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="320508099"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 13:16:35 -0800
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="587482998"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 13:16:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mnolg-008Iwg-31;
        Thu, 18 Nov 2021 23:16:28 +0200
Date:   Thu, 18 Nov 2021 23:16:27 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] gpiolib: check the 'ngpios' property in core
 gpiolib code
Message-ID: <YZbCq5Xcohm/t/FP@smile.fi.intel.com>
References: <20211118132317.15898-1-brgl@bgdev.pl>
 <20211118132317.15898-2-brgl@bgdev.pl>
 <YZaH8rsMyUztOX/r@smile.fi.intel.com>
 <CAMRc=MdR_RGLLPJ5Hqetj5_7ZQfUXOijEoVp3uR7cgEDHKnchA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdR_RGLLPJ5Hqetj5_7ZQfUXOijEoVp3uR7cgEDHKnchA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 09:12:59PM +0100, Bartosz Golaszewski wrote:
> On Thu, Nov 18, 2021 at 6:06 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Nov 18, 2021 at 02:23:17PM +0100, Bartosz Golaszewski wrote:
> > > Several drivers read the 'ngpios' device property on their own, but
> > > since it's defined as a standard GPIO property in the device tree bindings
> > > anyway, it's a good candidate for generalization. If the driver didn't
> > > set its gc->ngpio, try to read the 'ngpios' property from the GPIO
> > > device's firmware node before bailing out.
> >
> > ...
> >
> > >       if (gc->ngpio == 0) {
> > > -             chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> > > -             ret = -EINVAL;
> > > -             goto err_free_descs;
> > > +             ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> > > +             if (ret) {
> > > +                     chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> > > +                     ret = -EINVAL;
> > > +                     goto err_free_descs;
> > > +             }
> > > +
> > > +             gc->ngpio = ngpios;
> > >       }
> >
> > This should be
> >
> >         if (gc->ngpio == 0) {
> >                 ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> >                 if (ret)
> >                         return ret;
> 
> But device_property_read_u32() returning -ENODATA means there's no
> such property, which should actually be converted to -EINVAL as the
> caller wanting to create the chip provided invalid configuration - in
> this case: a chip with 0 lines. In case of the non-array variant of
> read_u32 that's also the only error that can be returned so this bit
> looks right to me.

So, what is so special about -EINVAL? Why -ENODATA is not good enough which
will exactly explain to the caller what's going on, no?

> >                 gc->ngpio = ngpios;
> >         }
> >
> >         if (gc->ngpio == 0) {
> >                 chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> >                 ret = -EINVAL;
> >                 goto err_free_descs;

When the caller intended to create a chip with 0 GPIOs they will get an error
as you wish with an error message.

> >         }

-- 
With Best Regards,
Andy Shevchenko


