Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B58E3E922D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 15:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbhHKNFl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 09:05:41 -0400
Received: from mga03.intel.com ([134.134.136.65]:57334 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230033AbhHKNFl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Aug 2021 09:05:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="215144050"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="215144050"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 06:05:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="672866927"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 06:05:13 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mDnut-007pVX-Lh; Wed, 11 Aug 2021 16:05:07 +0300
Date:   Wed, 11 Aug 2021 16:05:07 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 2/4] gpio: dwapb: Read GPIO base from gpio-base
 property
Message-ID: <YRPLA5xMDS5EnYrc@smile.fi.intel.com>
References: <20210804160019.77105-1-andriy.shevchenko@linux.intel.com>
 <20210804160019.77105-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdazSqdOaoCknv=0wo3vw-FjrZKAy0rgh1hFbgd6au0vYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdazSqdOaoCknv=0wo3vw-FjrZKAy0rgh1hFbgd6au0vYw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 11, 2021 at 02:50:46PM +0200, Linus Walleij wrote:
> On Wed, Aug 4, 2021 at 6:15 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > For backward compatibility with some legacy devices introduce
> > a new (*) property gpio-base to read GPIO base. This will allow
> > further cleaning up of the driver.
> >
> > *) Note, it's not new for the GPIO library since the mockup driver
> >    is using it already.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > v2: added check to ensure that the property won't be used by FW (Serge)
> >  drivers/gpio/gpio-dwapb.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> > index 4c7153cb646c..674e91e69cc5 100644
> > --- a/drivers/gpio/gpio-dwapb.c
> > +++ b/drivers/gpio/gpio-dwapb.c
> > @@ -584,6 +584,10 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
> >
> >                 pp->gpio_base   = -1;
> >
> > +               /* For internal use only, new platforms mustn't exercise this */
> > +               if (is_software_node(fwnode))
> > +                       fwnode_property_read_u32(fwnode, "gpio-base", &pp->gpio_base);
> 
> You rewrite the code quicker than I can review  :D

Sorry for that :-)

> So this is elegant, I would prefer "linux,gpio-base" but the
> overall change is more important, with or without that change:

I'm okay with the either, but the thing is that gpio-base is already in use.
Perhaps in the future somebody can change both (gpio-mockup and this driver)
to use the proposed one (AFAIU we free to change it since it's not part of FW
interface).

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

-- 
With Best Regards,
Andy Shevchenko


