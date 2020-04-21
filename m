Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42131B2953
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 16:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgDUOVp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 10:21:45 -0400
Received: from mga17.intel.com ([192.55.52.151]:23892 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbgDUOVp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Apr 2020 10:21:45 -0400
IronPort-SDR: y6IwI7yUYoWZD9xa9zQ2Yopdv2NLqggvq0JT+CuFPGjy/tkSjmw6Ql77wPJE+/cV5a2Ibx0v2L
 8JZi1EA/5HMQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 07:21:44 -0700
IronPort-SDR: yVxIXPtGhmSIxcWaCnnXuoikQ94RkXz/NJ6M+o/Yd1gjqiFaGnQ8APBr84MrOpFM8R01kMM4Oq
 D6Doxf6XO3aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,410,1580803200"; 
   d="scan'208";a="245694231"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 21 Apr 2020 07:21:43 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jQtmT-002FsD-WE; Tue, 21 Apr 2020 17:21:46 +0300
Date:   Tue, 21 Apr 2020 17:21:45 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Paul Thomas <pthomas8589@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] gpio: pca953x: Rewrite ->get_multiple() function
Message-ID: <20200421142145.GO185537@smile.fi.intel.com>
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
 <CAD56B7da+DDxpMvvntmq_nQaZ8aiJ+up4CY5QQ6t2hz_C8LhjQ@mail.gmail.com>
 <20200421125553.GJ185537@smile.fi.intel.com>
 <20200421140624.sipahotlak5ukrxy@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200421140624.sipahotlak5ukrxy@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 21, 2020 at 04:06:24PM +0200, Uwe Kleine-König wrote:
> On Tue, Apr 21, 2020 at 03:55:53PM +0300, Andy Shevchenko wrote:
> > On Mon, Apr 20, 2020 at 11:23:57PM -0400, Paul Thomas wrote:
> > > On Mon, Apr 20, 2020 at 1:27 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > The commit 96d7c7b3e654 ("gpio: gpio-pca953x, Add get_multiple function")
> > > > basically did everything wrong from style and code reuse perspective, i.e.
> > > Hi Andy,
> > > 
> > > Well your version is certainly elegant and simple, and does better
> > > with code reuse. However there are a couple of other goals I had in
> > > mind.
> > > First, the "lazy" approach of 96d7c7b3e654 is actually faster when
> > > user space sets up a 8-bit linehandle[1]146us (single regmap_read())
> > > vs 172us (pca953x_read_regs()) which incidentally is what we do in our
> > > application. In lazily reading 1 byte at a time it is the fastest
> > > access for that, if user space is always setting up the linehandle for
> > > the whole chip pca953x_read_regs() would be faster. Seeing as
> > > get_multiple has been unimplemented for this chip until now perhaps
> > > our use case deserves some consideration?
> > 
> > I understand completely your goal, but
> > - for I²C expanders timings is the last thing to look for (they are quite slow
> >   by nature), so, I really don't care about 16% speed up for one call; don't
> >   forget that we are in multi-task OS, where this can be easily interrupted and
> >   user will see the result quite after expected quick result
> 
> I didn't do any timing analysis and while I understand your
> argumentation, I'm not sure to agree. I noticed while debugging the
> problem that then resulted in my fix that gpioctl uses the .set_multiple
> callback. I told my customer to use gpioctl instead of /sys/class/gpio
> because it performs better just to notice that when using gpioctl to set
> a single GPIO this transfers five bytes instead of only two.
> 
> Having said that I think the sane approach is to optimize
> .{g,s}et_multiple to reduce the read/write size to the smallest bulk
> size possible that covers all bits that have their corresponding bit set
> in mask.
> 
> > - the code maintenance has a priority over micro-optimization (this driver
> >   suffered many times of breakages because of some optimizations done)
> 
> ack here. Some parts of the driver were harder to grasp than necessary.
> 
> > - it breaks Uwe's approach to fix AI chips, after my patch Uwe's ones are
> >   applied cleanly
> 
> I didn't check, is 96d7c7b3e654 broken for some chips?

I was referring to another call to recalc address with additional parameters,
which your second patch actually gets rid of.

> I will add my suggested optimisation to my todo list for evaluation. If
> I think it is still nice and maintainable I'll send a patch. Until I
> have looked into this (or someone else did) I'm in favour of applying
> Andy's patch.

-- 
With Best Regards,
Andy Shevchenko


