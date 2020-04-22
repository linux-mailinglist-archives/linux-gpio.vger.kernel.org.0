Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 673511B3A31
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 10:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgDVIef (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 04:34:35 -0400
Received: from mga09.intel.com ([134.134.136.24]:10657 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbgDVIef (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Apr 2020 04:34:35 -0400
IronPort-SDR: Me4B5GWu/ZsTHaSaFyEcjZeu0s88D4TdZ7UvSCbHDifRGiQN5SpJRVrcNF3Jwgd3lzSKCvMJKJ
 NoD/7b3FahAA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 01:34:34 -0700
IronPort-SDR: zh73pXRaWQGB6DME5ULAm/qQLOeLO9SJSSvikioGTmSMlnCsICjEwLWPyA8eTm8IRP8CSbBtGd
 RB5ubMX6GjHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,413,1580803200"; 
   d="scan'208";a="402470592"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 22 Apr 2020 01:34:33 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jRAq4-002P7E-36; Wed, 22 Apr 2020 11:34:36 +0300
Date:   Wed, 22 Apr 2020 11:34:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Paul Thomas <pthomas8589@gmail.com>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] gpio: pca953x: Rewrite ->get_multiple() function
Message-ID: <20200422083436.GQ185537@smile.fi.intel.com>
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
 <CAD56B7da+DDxpMvvntmq_nQaZ8aiJ+up4CY5QQ6t2hz_C8LhjQ@mail.gmail.com>
 <20200421125553.GJ185537@smile.fi.intel.com>
 <20200421140624.sipahotlak5ukrxy@pengutronix.de>
 <20200421142145.GO185537@smile.fi.intel.com>
 <CAD56B7fUZ4+oUpsmmydYeFK0K4xvZa-txth07BmoVu3XUP8iSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD56B7fUZ4+oUpsmmydYeFK0K4xvZa-txth07BmoVu3XUP8iSA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 22, 2020 at 12:33:34AM -0400, Paul Thomas wrote:
> On Tue, Apr 21, 2020 at 10:21 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Apr 21, 2020 at 04:06:24PM +0200, Uwe Kleine-König wrote:
> > > On Tue, Apr 21, 2020 at 03:55:53PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Apr 20, 2020 at 11:23:57PM -0400, Paul Thomas wrote:
> > > > > On Mon, Apr 20, 2020 at 1:27 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > > > I understand completely your goal, but
> > > > - for I²C expanders timings is the last thing to look for (they are quite slow
> > > >   by nature), so, I really don't care about 16% speed up for one call; don't
> > > >   forget that we are in multi-task OS, where this can be easily interrupted and
> > > >   user will see the result quite after expected quick result
> Sure, it's not a HUGE deal, but this will get worse for 5 bank chips.
> Also, 26us is not insignificant, with the preempt-rt kernel we're
> using that can be more than the max interrupt latency.

Using slow buses, no, not just using, but relying on them, in RT environment
seems pretty much bad hardware design. If you have time critical solution,
it should try its best by excluding points of possible failures.

> > > I didn't do any timing analysis and while I understand your
> > > argumentation, I'm not sure to agree. I noticed while debugging the
> > > problem that then resulted in my fix that gpioctl uses the .set_multiple
> > > callback. I told my customer to use gpioctl instead of /sys/class/gpio
> > > because it performs better just to notice that when using gpioctl to set
> > > a single GPIO this transfers five bytes instead of only two.
> > >
> > > Having said that I think the sane approach is to optimize
> > > .{g,s}et_multiple to reduce the read/write size to the smallest bulk
> > > size possible that covers all bits that have their corresponding bit set
> > > in mask.
> > >
> > > > - the code maintenance has a priority over micro-optimization (this driver
> > > >   suffered many times of breakages because of some optimizations done)
> Yeah, I appreciate that maintainability needs to be a big priority,
> I'm wondering if comments & syntax could be improved so that the
> general idea of 96d7c7b3e654 is clear and maintainable. It is just
> walking through mask, and whenever it gets to a new byte it reads it
> from the hardware.

I think the idea per se is worth to consider, though it should not be limited
to the ->get_multiple(), for example reading IRQ status can advantage of this
as well. So, it should be rather some common helper which takes mask as input
parameter and converts it to the set of registers to read. regmap API, IIRC,
has support of sparse reading. I dunno, though, if it is supported by regmap
I²C case.

> > > ack here. Some parts of the driver were harder to grasp than necessary.
> > >
> > > > - it breaks Uwe's approach to fix AI chips, after my patch Uwe's ones are
> > > >   applied cleanly
> > >
> > > I didn't check, is 96d7c7b3e654 broken for some chips?
> >
> > I was referring to another call to recalc address with additional parameters,
> > which your second patch actually gets rid of.
> 
> If it's just the call to pca953x_recalc_addr() that caused the
> conflict with Uwe's work with 96d7c7b3e654, we can just remove the
> last two arguments so it matches what pca953x_gpio_get_value() is
> doing.

Let's rethink entire approach. See above.

-- 
With Best Regards,
Andy Shevchenko


