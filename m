Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9ED456112
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 18:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbhKRREv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 12:04:51 -0500
Received: from mga04.intel.com ([192.55.52.120]:58077 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233851AbhKRREv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Nov 2021 12:04:51 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="232953892"
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="232953892"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 09:01:51 -0800
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="646635988"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 09:01:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mnkn8-008EZO-Tm;
        Thu, 18 Nov 2021 19:01:42 +0200
Date:   Thu, 18 Nov 2021 19:01:42 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] gpiolib: check the 'ngpios' property in core
 gpiolib code
Message-ID: <YZaG9vPYh4YIwEIi@smile.fi.intel.com>
References: <20211118132317.15898-1-brgl@bgdev.pl>
 <20211118132317.15898-2-brgl@bgdev.pl>
 <YZZ0xPU207qDaOpX@smile.fi.intel.com>
 <CAMRc=McHCUsO430t618EW92G-B_mgxXucYye3qb85697MHW_KQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McHCUsO430t618EW92G-B_mgxXucYye3qb85697MHW_KQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 05:38:14PM +0100, Bartosz Golaszewski wrote:
> On Thu, Nov 18, 2021 at 4:46 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Nov 18, 2021 at 02:23:17PM +0100, Bartosz Golaszewski wrote:
> > > Several drivers read the 'ngpios' device property on their own, but
> > > since it's defined as a standard GPIO property in the device tree bindings
> > > anyway, it's a good candidate for generalization. If the driver didn't
> > > set its gc->ngpio, try to read the 'ngpios' property from the GPIO
> > > device's firmware node before bailing out.
> >
> > Thanks for update, my comment below.
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
> >
> > > +                     ret = -EINVAL;
> >
> > Sorry, forgot to ask, why this is needed?
> 
> What do you mean? 0 lines doesn't sound like a valid value so -EINVAL
> is in order.

What is so special about -EINVAL? Why ret can't be returned?


-- 
With Best Regards,
Andy Shevchenko


