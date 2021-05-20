Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D1D38A0A7
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 11:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhETJRr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 05:17:47 -0400
Received: from mga03.intel.com ([134.134.136.65]:60366 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230361AbhETJRr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 05:17:47 -0400
IronPort-SDR: HYkiJExSu7LHzARqJ1D/p3H4p0AiM8/0MFLKUWX0nEl8+g5R94PHZQFFcbwHe/nIVhZmr1zEMh
 I0hURpN5lqOg==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="201238889"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="201238889"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 02:16:24 -0700
IronPort-SDR: Xp4TsI8ViZpdVxEshJ5a1TG1H2oEoUUHgTy45XWgoWcWpJ1DLLl8Q7S/ZL8hLWiTSLycvinMrX
 x5vRBfW0iINQ==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="440373654"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 02:16:22 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1ljemy-00DRZT-7e; Thu, 20 May 2021 12:16:20 +0300
Date:   Thu, 20 May 2021 12:16:20 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpiolib: Introduce for_each_gpio_desc_if() macro
Message-ID: <YKYo5EBBDbSDiIwD@smile.fi.intel.com>
References: <20210518083339.23416-1-andriy.shevchenko@linux.intel.com>
 <YKYYp6Z4HAYHLaFz@hovoldconsulting.com>
 <CAHp75Vf_tQxPcRa_ObYngUFQqzFrx2RyUcqemyeHFDOD1XEnbQ@mail.gmail.com>
 <YKYe4rgGTDRfq+va@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKYe4rgGTDRfq+va@hovoldconsulting.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 20, 2021 at 10:33:38AM +0200, Johan Hovold wrote:
> On Thu, May 20, 2021 at 11:15:31AM +0300, Andy Shevchenko wrote:
> > On Thu, May 20, 2021 at 11:07 AM Johan Hovold <johan@kernel.org> wrote:
> > > On Tue, May 18, 2021 at 11:33:39AM +0300, Andy Shevchenko wrote:
> 
> > > The _if suffix here is too vague.
> > >
> > > Please use a more descriptive name so that you don't need to look at the
> > > implementation to understand what the macro does.
> > >
> > > Perhaps call it
> > >
> > >         for_each_gpio_desc_with_flag()
> > 
> > Haha, I have the same in my internal tree, but then I have changed to
> > _if and here is why:
> > - the API is solely for internal use (note, internals of struct
> > gpio_desc available for the same set of users)
> 
> That's not a valid argument here. You should never make code harder to
> read.
> 
> There are other ways of marking functions as intended for internal use
> (e.g. do not export them and add a _ prefix or whatever).
> 
> > - the current users do only same pattern
> 
> That's not an argument against using a descriptive name. Possibly
> against adding a generic for_each_gpio_desc() macro.
> 
> > - I don't expect that we will have this to be anything else in the future
> 
> Again, irrelevant. Possibly an argument against adding another helper in
> the first place.
> 
> > Thus, _if is a good balance between scope of use and naming.
> 
> No, no, no. It's never a good idea to obfuscate code.
> 
> > I prefer to leave it as is.
> 
> I hope you'll reconsider, or that my arguments can convince the
> maintainers to step in here.
> 
> > > or just add the more generic macro
> > >
> > >         for_each_gpio_desc()
> > >
> > > and open-code the test so that it's clear what's going on here.
> 
> FWIW, NAK due to the non-descriptive for_each_desc_if() name.

Btw, missed argument

..._with_flag(..., FLAG_...)

breaks the DRY principle. If you read current code it's clear with that

_if(..., FLAG_...)

-- 
With Best Regards,
Andy Shevchenko


