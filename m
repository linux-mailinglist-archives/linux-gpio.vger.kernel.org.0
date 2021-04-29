Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C2036EE7C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Apr 2021 19:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240893AbhD2RBH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Apr 2021 13:01:07 -0400
Received: from mga06.intel.com ([134.134.136.31]:56680 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233302AbhD2RBG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Apr 2021 13:01:06 -0400
IronPort-SDR: gBTLXNvyzLhruyqLUDzwFuych7UBmg6N+CD6erB+cUPxqXqZc2Gd0Q2Fg+ZXDkMVZz+NY6Vaog
 tKr1DwbtHdTQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="258340398"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
   d="scan'208";a="258340398"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 10:00:18 -0700
IronPort-SDR: sPMnJ7iYBKZ20TQo60hrEApkUvzma7NPBCj0POW5iwjRF52DANpT6gnviwZzDqPU3m773p/Z2M
 ZWbIxyPnWe5g==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
   d="scan'208";a="387016290"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 10:00:17 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lcA1O-008C6C-Gy; Thu, 29 Apr 2021 20:00:14 +0300
Date:   Thu, 29 Apr 2021 20:00:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 2/3] libgpiosim: new library for controlling
 the gpio-sim module
Message-ID: <YIrmHkaKnrr4IdCT@smile.fi.intel.com>
References: <20210429094734.9585-1-brgl@bgdev.pl>
 <20210429094734.9585-3-brgl@bgdev.pl>
 <YIqXHXU/tqxXjaKA@smile.fi.intel.com>
 <CAMRc=MeKciVDxdFvq6_d8mN8M08tqDSc1qDqmywswF2gbUa=Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeKciVDxdFvq6_d8mN8M08tqDSc1qDqmywswF2gbUa=Dg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 29, 2021 at 03:07:49PM +0200, Bartosz Golaszewski wrote:
> On Thu, Apr 29, 2021 at 1:23 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Apr 29, 2021 at 11:47:33AM +0200, Bartosz Golaszewski wrote:

...

> > > +/* We don't have mkdtempat()... :( */
> >
> > But we have tmpnam() / tmpnam_r(), why to reinvent it below?
> >
> 
> Because of this:
> 
> $man tmpnam_r
> ...
> The created pathname has a directory prefix P_tmpdir.
> ...
> 
> And this:
> 
> ./stdio.h:120:# define P_tmpdir "/tmp"

Still you may advance the pointer by the length of P_tmpdir + 1.

...

> > > +     for (i = 0; i < num_names; i++)
> > > +             written += snprintf(buf + written, size - written,
> > > +                                 "\"%s\", ", names[i] ?: "");
> > > +     buf[size - 2] = '\0';
> >
> > Dunno if you can use asprintf() and actually replace NULL by "" in the original
> > array. Ah, see you already using it somewhere else, why not here?
> >
> 
> Not sure what you mean, we can't use asprintf() to create a composite
> string like what is needed here. Can you give me an example?

I have got this after sending. Either you need to create a format string with
va_args, or do it manually.


-- 
With Best Regards,
Andy Shevchenko


