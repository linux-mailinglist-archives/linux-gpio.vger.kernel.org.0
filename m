Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB37458D43
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 12:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbhKVLX6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 06:23:58 -0500
Received: from mga06.intel.com ([134.134.136.31]:41952 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229516AbhKVLX5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Nov 2021 06:23:57 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="295577131"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; 
   d="scan'208";a="295577131"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 03:20:51 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; 
   d="scan'208";a="674029881"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 03:20:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mp7NN-009Pk1-MS;
        Mon, 22 Nov 2021 13:20:45 +0200
Date:   Mon, 22 Nov 2021 13:20:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] gpiolib: check the 'ngpios' property in core
 gpiolib code
Message-ID: <YZt9DVihGaq0kjKG@smile.fi.intel.com>
References: <20211118132317.15898-1-brgl@bgdev.pl>
 <20211118132317.15898-2-brgl@bgdev.pl>
 <YZaH8rsMyUztOX/r@smile.fi.intel.com>
 <CAMRc=MdR_RGLLPJ5Hqetj5_7ZQfUXOijEoVp3uR7cgEDHKnchA@mail.gmail.com>
 <YZbCq5Xcohm/t/FP@smile.fi.intel.com>
 <CAMRc=MdBhm-+oDiBdYQJZXYEko8rGhZtHQfu6p3DFy_a3aJOZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdBhm-+oDiBdYQJZXYEko8rGhZtHQfu6p3DFy_a3aJOZw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 19, 2021 at 08:35:33PM +0100, Bartosz Golaszewski wrote:
> On Thu, Nov 18, 2021 at 10:16 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Nov 18, 2021 at 09:12:59PM +0100, Bartosz Golaszewski wrote:
> > > On Thu, Nov 18, 2021 at 6:06 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Nov 18, 2021 at 02:23:17PM +0100, Bartosz Golaszewski wrote:

...

> > > > >       if (gc->ngpio == 0) {
> > > > > -             chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> > > > > -             ret = -EINVAL;
> > > > > -             goto err_free_descs;
> > > > > +             ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> > > > > +             if (ret) {
> > > > > +                     chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> > > > > +                     ret = -EINVAL;
> > > > > +                     goto err_free_descs;
> > > > > +             }
> > > > > +
> > > > > +             gc->ngpio = ngpios;
> > > > >       }
> > > >
> > > > This should be
> > > >
> > > >         if (gc->ngpio == 0) {
> > > >                 ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> > > >                 if (ret)
> > > >                         return ret;
> > >
> > > But device_property_read_u32() returning -ENODATA means there's no
> > > such property, which should actually be converted to -EINVAL as the
> > > caller wanting to create the chip provided invalid configuration - in
> > > this case: a chip with 0 lines. In case of the non-array variant of
> > > read_u32 that's also the only error that can be returned so this bit
> > > looks right to me.
> >
> > So, what is so special about -EINVAL? Why -ENODATA is not good enough which
> > will exactly explain to the caller what's going on, no?
> >
> 
> Let's imagine the user sets gc->ngpio = 0 incorrectly thinking it'll
> make gpiolib set it to some sane default. Then gpiochip_add_data()
> returns -ENODATA (No data available). This is confusing IMO. But if we
> convert it to -EINVAL, it now says "Invalid value" which points to the
> wrong configuration.
> 
> ENODATA means "device tree property is not present" in this case but
> the problem is that user supplies the gpiolib with invalid
> configuration. EINVAL is the right error here.

Then be explicit, don't shadow other error codes from fwnode API.

	if (ret && ret != -ENODATA)

> > > >                 gc->ngpio = ngpios;
> > > >         }
> > > >
> > > >         if (gc->ngpio == 0) {
> > > >                 chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> > > >                 ret = -EINVAL;
> > > >                 goto err_free_descs;
> >
> > When the caller intended to create a chip with 0 GPIOs they will get an error
> > as you wish with an error message.
> 
> Yes, as it was before.

-- 
With Best Regards,
Andy Shevchenko


