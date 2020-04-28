Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBE531BC103
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 16:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgD1OS5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 10:18:57 -0400
Received: from mga17.intel.com ([192.55.52.151]:37055 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727078AbgD1OS4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 10:18:56 -0400
IronPort-SDR: ON3zgZzo0gQ5dAadDDJSsLm0uHUdpmfxCZ6Gp0esuBB8pCtVKnbqZniwgtY/oigIO4EHxRZUmF
 3ZKT7u7YMnQg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 07:18:56 -0700
IronPort-SDR: LsyQfmOH4xWCt/wrZ0Yl8XAjPU6E+GAvNo0FVrezkBj+k7UNW2QkhJCHrX4HNi86goE+75EVlW
 T1ULfvxIQLFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; 
   d="scan'208";a="404704895"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 28 Apr 2020 07:18:54 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jTR4b-003ZQM-94; Tue, 28 Apr 2020 17:18:57 +0300
Date:   Tue, 28 Apr 2020 17:18:57 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Paul Thomas <pthomas8589@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 1/3] gpio: pca953x: Rewrite ->get_multiple() function
Message-ID: <20200428141857.GW185537@smile.fi.intel.com>
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
 <20200421130300.GK185537@smile.fi.intel.com>
 <CAMpxmJVVDUN6ei__wt5z+hOJQ0w0r9TZjhN9HCtpCA8Vrud0qg@mail.gmail.com>
 <CACRpkdYDHiscnm0BrSTwG6=-SCWZeqVfnEEkMAeQcco77GM8kg@mail.gmail.com>
 <20200428124129.GR185537@smile.fi.intel.com>
 <CAD56B7cR9asgW-6PS7V+jZ8O7AYeYuH9egnF1G0uoQQaS9GhMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD56B7cR9asgW-6PS7V+jZ8O7AYeYuH9egnF1G0uoQQaS9GhMA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 28, 2020 at 09:09:03AM -0400, Paul Thomas wrote:
> On Tue, Apr 28, 2020 at 8:41 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Tue, Apr 28, 2020 at 02:13:21PM +0200, Linus Walleij wrote:
> > > On Tue, Apr 21, 2020 at 5:42 PM Bartosz Golaszewski
> > > <bgolaszewski@baylibre.com> wrote:
> > > > wt., 21 kwi 2020 o 15:03 Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> napisał(a):
> > > > > On Mon, Apr 20, 2020 at 08:27:50PM +0300, Andy Shevchenko wrote:
> >
> > ...
> >
> > > I don't mind trying to put in code to optimize use cases
> > > when accessing single bytes here either. But I'd like there
> > > to be explicit comments in the code saying why these
> > > optimizations are there. Can we do those on top of
> > > this (hopefully) known working base?
> For the record my original get_multiple patch was a known working base.
> 
> >
> > As I pointed out to Paul, the optimization like he proposed is not bad thing
> > per se, the implementation is. On top of that I suggested to take a look to IRQ
> > status bits, which presumable will leverage from this optimization as well.
> >
> > So, After applying this series it would be matter of change one line in the
> > ->get_multiple() to replace read_regs() with optimized version or so along with
> > IRQ bits changes.
> 
> This new function would then at least need to be called with mask as
> an additional argument right? Then the bitmap_replace() will set
> everything regardless of if it was read, this is fine I suppose
> because it doesn't matter if it's setting bits outside of mask. You
> just have two loops one in the new function and one in
> bitmap_replace().

Note, on 64-bit architectures there is no loop in bitmap ops (since 40 <= 64 in
this case). On 32-bit it might be (only for 40 case, which I think less present
in the wild than the rest). And bitmap ops are optimized over longs, so, it's
pretty much fast (esp. in comparison to I²C IO).

> If this is what people would like to see I can work
> on it. I did look into the sparse reads and it seems as though regmap
> has a gather_write, but not a gather_read and gather_write isn't in
> regmap-i2c.c anyway.

Yes, I think this is the right way to go.

-- 
With Best Regards,
Andy Shevchenko


