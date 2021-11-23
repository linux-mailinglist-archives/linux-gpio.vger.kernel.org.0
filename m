Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6144045AC16
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 20:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhKWTTL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 14:19:11 -0500
Received: from mga07.intel.com ([134.134.136.100]:12739 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229549AbhKWTTJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 14:19:09 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="298517948"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="298517948"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 11:15:45 -0800
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="456800981"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 11:15:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mpbGV-009sOf-AB;
        Tue, 23 Nov 2021 21:15:39 +0200
Date:   Tue, 23 Nov 2021 21:15:39 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Suresh Balakrishnan <suresh.balakrishnan@intel.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Never return internal error codes to
 user space
Message-ID: <YZ0928wfsYIBJYcQ@smile.fi.intel.com>
References: <20210518155013.45622-1-andriy.shevchenko@linux.intel.com>
 <20210518232451.GA7362@sol>
 <YKTCDNcyUlrgE0Y4@smile.fi.intel.com>
 <20210519080434.GA22854@sol>
 <YKTMninSSY3MK6Hf@smile.fi.intel.com>
 <CAMpxmJVJBx2J87bS0CUYPyJkHKt=nvFw65y_+iG-5JbVekuaqw@mail.gmail.com>
 <CAHp75VdZ3aws3G=4_r82LMfuMNmNdLoBpqRsfF_ogZ7c=vyTsQ@mail.gmail.com>
 <CAMpxmJVy12at1+37iPiqTXe6mvodUpjDKCkFQO02Cu=u5_sp_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJVy12at1+37iPiqTXe6mvodUpjDKCkFQO02Cu=u5_sp_A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 20, 2021 at 04:39:50PM +0200, Bartosz Golaszewski wrote:
> On Thu, May 20, 2021 at 3:15 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Thu, May 20, 2021 at 4:08 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > On Wed, May 19, 2021 at 10:30 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Wed, May 19, 2021 at 04:04:34PM +0800, Kent Gibson wrote:
> > > > > On Wed, May 19, 2021 at 10:45:16AM +0300, Andy Shevchenko wrote:
> > > > > > On Wed, May 19, 2021 at 07:24:51AM +0800, Kent Gibson wrote:
> > > > > > > On Tue, May 18, 2021 at 06:50:12PM +0300, Andy Shevchenko wrote:
> >
> > ...
> >
> > > > > > > > Fixes: d7c51b47ac11 ("gpio: userspace ABI for reading/writing GPIO lines")
> > > > > > > > Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > > > > > > > Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")
> >
> > ...
> >
> > > > > > > You immediately revert this patch in patch 2.
> > > > > > > My understanding is that is not allowed within a patch set.
> > > > > >
> > > > > > > Why split the patches instead of going direct to the new helper?
> > > > > >
> > > > > > It's for backporting to make it easier. (I deliberately left the context above)
> > > > > >
> > > > > > I can fold them if maintainers think it's okay to do.
> > > > > >
> > > > >
> > > > > Not sure what the constraints are on backporting, but wouldn't it be
> > > > > simpler and cleaner to backport the new helper?
> > > >
> > > > Logically (and ideally) it would be three different patches:
> > > >  1) introduce helper
> > > >  2) use helper
> > > >  3) fix places where it's needed to be done
> > > >
> > > > But the above scheme doesn't fit backporting idea (we don't backport new
> > > > features and APIs without really necessity). So, the options left are:
> > > >
> > > > Option a: One patch (feels a bit like above)
> > > > Option b: Two patches like in this series (yes, you are correct about
> > > >           disadvantages)
> > > >
> > > > > But, as you say, it is the maintainers' call.
> >
> > > Third option is to backport this patch but apply the helper
> > > immediately to master.
> >
> > If I got you correctly, you want to have two patches, one for
> > backporting and one for current, correct? But how can we backport
> > something which has never been upstreamed?
> >
> 
> Well we would not technically backport anything - there would be one
> patch for mainline and a separate fix for stable.

So, what should I do here?

-- 
With Best Regards,
Andy Shevchenko


