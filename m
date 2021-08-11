Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E4F3E924A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 15:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbhHKNMd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 09:12:33 -0400
Received: from mga12.intel.com ([192.55.52.136]:56801 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230212AbhHKNMH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Aug 2021 09:12:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="194705919"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="194705919"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 06:11:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="676115455"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 06:11:36 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mDo14-007pau-DP; Wed, 11 Aug 2021 16:11:30 +0300
Date:   Wed, 11 Aug 2021 16:11:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 2/4] gpio: dwapb: Read GPIO base from gpio-base
 property
Message-ID: <YRPMgvlGWBaD/Trq@smile.fi.intel.com>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdarpuFwzj-xRPRe0Y4iWwMtsMeTKwZRp8E0hSyDZZcHwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdarpuFwzj-xRPRe0Y4iWwMtsMeTKwZRp8E0hSyDZZcHwg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 11, 2021 at 02:37:42PM +0200, Linus Walleij wrote:
> On Mon, Jul 26, 2021 at 2:54 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > For backward compatibility with some legacy devices introduce
> > a new (*) property gpio-base to read GPIO base. This will allow
> > further cleanup of the driver.
> >
> > *) Note, it's not new for GPIO library since mockup driver is
> >    using it already.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> (...)
> > -               pp->gpio_base   = -1;
> > +               if (fwnode_property_read_u32(fwnode, "gpio-base", &pp->gpio_base))
> > +                       pp->gpio_base = -1;
> 
> This is problematic because we have repeatedly NACKed this property
> to be added to device trees.
> 
> I don't know about fwnode policies, but in the device tree this would have
> to be "linux,gpio-base" and then it would be NACKed because of adding
> an operating-system specific thing to a OS-independent hardware
> description.
> 
> I don't know what to do with this really, but I understand the need of it
> as a kernel-internal thing, however I am afraid that adding this will make
> it possible to add linux,gpio-base = <n> to any device tree gpio_chip
> as well and that encourages bad behaviour even if we don't allow a
> DT binding (YAML) like that.
> 
> Is there a way to make a fwnode property only come from software
> nodes and not allowed to be used in ACPI or DT? (I guess not...)

This has been the very same concern by Serge and we agreed on limiting this to
software nodes only. And I have seen you are fine with the approach, thanks!

-- 
With Best Regards,
Andy Shevchenko


