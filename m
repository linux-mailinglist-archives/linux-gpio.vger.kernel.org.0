Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A8C30A8CA
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 14:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhBANcu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 08:32:50 -0500
Received: from mga01.intel.com ([192.55.52.88]:27060 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231653AbhBANct (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Feb 2021 08:32:49 -0500
IronPort-SDR: VL4isOO8cYfueigfXzCozKqN+7mgRq5dahLvI3v7APfwQ5XzRN9eO503NI0xdsuzDUUKr3AXJo
 M56u98Fw7wwg==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="199577187"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="199577187"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 05:31:02 -0800
IronPort-SDR: H9In4iRwQzn5oMIqePm/36S4CwyxKYZNadtrxiGynVPKXGEPSjyIsDuJxZiYM0s11xrfheEAgh
 VrenEZ1iqVSg==
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="412420491"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 05:30:59 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l6ZI7-0018ma-SC; Mon, 01 Feb 2021 15:30:55 +0200
Date:   Mon, 1 Feb 2021 15:30:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 8/8] gpio: sim: new testing module
Message-ID: <YBgCj3SK5J7KIOnC@smile.fi.intel.com>
References: <20210129134624.9247-1-brgl@bgdev.pl>
 <20210129134624.9247-9-brgl@bgdev.pl>
 <YBQwUkQz3LrG5G4i@smile.fi.intel.com>
 <CAMRc=MeSy4zWOAGxfoBih62WxAXuOLtkK3ROyt+4LuqLvDxtaQ@mail.gmail.com>
 <YBfX38JBa0psBizQ@smile.fi.intel.com>
 <CAMRc=Mfgw5oA-TA2PN-Z+ape0POAtLwVeDJnzH1iuzKw5wYQ5Q@mail.gmail.com>
 <YBf4zjo7JJaw5iu1@smile.fi.intel.com>
 <CAMRc=MfzxmE-+SSOp6HoV1i7hZ3dNgGgrQCeDjUUkbeXJFOhzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfzxmE-+SSOp6HoV1i7hZ3dNgGgrQCeDjUUkbeXJFOhzw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 01, 2021 at 01:53:16PM +0100, Bartosz Golaszewski wrote:
> On Mon, Feb 1, 2021 at 1:49 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Feb 01, 2021 at 11:59:31AM +0100, Bartosz Golaszewski wrote:
> > > On Mon, Feb 1, 2021 at 11:28 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sat, Jan 30, 2021 at 09:37:55PM +0100, Bartosz Golaszewski wrote:
> > > > > On Fri, Jan 29, 2021 at 4:57 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Fri, Jan 29, 2021 at 02:46:24PM +0100, Bartosz Golaszewski wrote:

...

> > > > > > > +struct gpio_sim_chip_config {
> > > > > > > +     struct config_item item;
> > > > > > > +
> > > > > > > +     /*
> > > > > > > +      * If pdev is NULL, the item is 'pending' (waiting for configuration).
> > > > > > > +      * Once the pointer is assigned, the device has been created and the
> > > > > > > +      * item is 'live'.
> > > > > > > +      */
> > > > > > > +     struct platform_device *pdev;
> > > > > >
> > > > > > Are you sure
> > > > > >
> > > > > >         struct device *dev;
> > > > > >
> > > > > > is not sufficient?
> > > > > >
> > > > >
> > > > > It may be but I really prefer those simulated devices to be on the platform bus.
> > > >
> > > > My point here is that there is no need to keep specific bus devices type,
> > > > because you may easily derive it from the struct device pointer. Basically if
> > > > you are almost using struct device in your code (seems to me the case), you
> > > > won't need to carry bus specific one and dereference it each time.
> > >
> > > But don't we need a bus to even register a device? I haven't checked
> > > in a long time but IIRC it's mandatory.
> > >
> > > Let me give you a different argument - the platform device offers a
> > > very simple API for registering devices with properties being
> > > duplicated behind the scenes etc. It seems to me that registering a
> > > bare struct device * would take more boiler-plate code for not much
> > > gain.
> >
> > Yes, I'm not objecting the platform bus choice. I'm objecting the keeping of
> > the pointer to the bus specific structure.
> >
> > There are helpers like to_platform_device() which make the bus specific
> > pointers go away from the structures and easier code when you use exactly
> > pointer to struct device rather than bus specific one.
> >
> 
> Ok I get it. We almost never dereference it though. We do it in probe,
> but there's no way around it. In sysfs callbacks we already get a
> pointer to struct device. And when unregistering the platform device,
> we need to pass it as struct platform_device anyway. I don't see any
> gain from that and would prefer to keep it as is.

It's purely trade off, if you have more *dev in use, better to use *dev, if
*pdev, then use it, although my practice shows that in most cases keeping bus
specific pointer is an overkill.

-- 
With Best Regards,
Andy Shevchenko


