Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74BAB45D92E
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 12:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbhKYL2m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 06:28:42 -0500
Received: from mga11.intel.com ([192.55.52.93]:22844 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234506AbhKYL0m (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 Nov 2021 06:26:42 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="232992535"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="232992535"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 03:18:13 -0800
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="607538955"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 03:18:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mqClU-00APiI-Nu;
        Thu, 25 Nov 2021 13:18:08 +0200
Date:   Thu, 25 Nov 2021 13:18:08 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] gpiolib: check the 'ngpios' property in core
 gpiolib code
Message-ID: <YZ9w8EU8XN8xhpDp@smile.fi.intel.com>
References: <20211124122850.7095-1-brgl@bgdev.pl>
 <20211124122850.7095-2-brgl@bgdev.pl>
 <YZ5QYsu2ed5FiSWE@smile.fi.intel.com>
 <CAMRc=Mfcph_YPryowhtGtb9G_GOveRm+27BJYyznjxc=BK-jWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfcph_YPryowhtGtb9G_GOveRm+27BJYyznjxc=BK-jWg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 11:10:08AM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 24, 2021 at 3:47 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Nov 24, 2021 at 01:28:50PM +0100, Bartosz Golaszewski wrote:

...

> > > +             ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> > > +             if (ret) {
> > > +                     if (ret == -ENODATA) {
> > > +                             chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> > > +                             ret = -EINVAL;
> > > +                     }
> > > +
> > > +                     goto err_free_descs;
> > > +             }
> >
> > And if the property returns 0 in ngpios?
> >
> > What about the modified suggestion from previous version:
> >
> >         if (gc->ngpio == 0) {
> >                 ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);

> The comment is a good idea but other than that - it's overcomplicating things.

I don't think so. It is plain and self-explaining each step. See at the end of
the message how.

> >                 if (ret == -ENODATA)
> >                         ngpios = 0;
> >                 else if (ret)
> >                         return ret;

> You still need to goto err_free_descs here.

Right, this doesn't affect the main point / logic here.

> >                 gc->ngpio = ngpios;
> >         }
> >
> >         if (gc->ngpio == 0) {
> 
> Why check that again? We already know the driver set it to 0, we
> checked it a couple lines before. If we can't get the setting from the
> properties then it won't be non 0 here right?

No, it's not right. The check is needed to tell that properties supplied 0.

> >                 chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> >                 ret = -EINVAL;
> >                 goto err_free_descs;
> >         }
> >
> > ?
> >
> > > +             gc->ngpio = ngpios;
> > >       }
> > >
> > >       if (gc->ngpio > FASTPATH_NGPIO)

> I suggest the following:

It's buggy as submitted version (I actually haven't found any difference in
the code, but comments).

You see, I propose less changes and straight forward logic:

1. Check if the supplied ->ngpio equal to 0
2. If so, try device properties
2.1. If there is no property found, make sure we a) don't use uninitialized
     variable, b) we don't change ->ngpio, so it stays 0
2.2. If there is an error, return it as is to the caller
2.3. Assign ->ngpio by value from property (which very well may be 0!)
3. Check ->ngpio for 0 again, if so, issue a message and return -EINVAL to
the user.

We have three places where ->ngpio can be 0, all of them I covered.

-- 
With Best Regards,
Andy Shevchenko


