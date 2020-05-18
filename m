Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873D31D7E03
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 18:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgERQME (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 12:12:04 -0400
Received: from mga05.intel.com ([192.55.52.43]:18649 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727006AbgERQME (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 May 2020 12:12:04 -0400
IronPort-SDR: rVzpAtkwxWImQH9bE0RHGbPnQA4M8tu7ld+X+Ht0fAxdHuoF8kzAyLseIxAKeNaASQGRMDr4Xs
 tZVO7sQBRHQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 09:12:04 -0700
IronPort-SDR: qUS5oLTDrxSZ0bH/AOEQB4rLaYfif3OfmJCvbAzRM4X88RzGWxanx8l5H9zXoahrwqplDrk+rH
 JcaUqIox48BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="465632150"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 18 May 2020 09:12:02 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jaiN2-007SoE-Ry; Mon, 18 May 2020 19:12:04 +0300
Date:   Mon, 18 May 2020 19:12:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 2/4] gpio: dwapb: Don't use 0 as valid Linux interrupt
 number
Message-ID: <20200518161204.GJ1634618@smile.fi.intel.com>
References: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
 <20200512184513.86883-2-andriy.shevchenko@linux.intel.com>
 <20200517125244.oayqjhhq5755b4cg@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200517125244.oayqjhhq5755b4cg@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 17, 2020 at 03:52:44PM +0300, Serge Semin wrote:
> On Tue, May 12, 2020 at 09:45:11PM +0300, Andy Shevchenko wrote:
> > 0 is not valid IRQ number in Linux interrupt number space.
> > Refactor the code with this kept in mind.

Serge, thanks for review, my answers below.

...

> > +	int err, j;
> 
> Err might be used uninitialized here. The compiler also says so:
> 
> drivers/gpio/gpio-dwapb.c:560:14: warning: ‘err’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>    pp->irq[j] = err;
> 
> drivers/gpio/gpio-dwapb.c:547:6: note: ‘err’ was declared here
>   int err, j;

Good catch! I'm puzzled how I missed it :-(
I usually compile with W=1.

Hmm... gcc (Debian 9.3.0-12) 9.3.0 building for i386, doesn't give me a
warning, but I see that there is potentially possible that scenario, so, I'm
going to fix it.

> Could you please make it initialized with error number like -ENXIO by default?

Will do.

> Also if it was just a single issue in my mind, I wouldn't have probably payed
> much attention to this. But since you need to send v2 anyway, I'd prefer to have
> a positive naming here since normally both of_irq_get() and
> platform_get_irq_optional() return IRQ number, and error is returned only on
> failure. So checking an erroneous value of a positively named variable seems
> more natural, rather than copying an error-named variable to a normal variable.
> To cut it short could you please rename err to something like irq?

Makes sense.

...

> > +	pp->has_irq = memchr_inv(pp->irq, 0, sizeof(pp->irq)) != NULL;
> 
> Sorry, but I don't see why is setting the has_irq flag in the loop above worse than
> using memchr_inv()? As I see it since we need to perform the loop above anyway, it
> would be normal to update the flag synchronously there instead of traversing the
> irq's array byte-by-byte again in the memchr_inv() method. Moreover
> (memchr_inv() != NULL) seems harder to read. A kernel hacker needs to keep in
> mind the method semantics, that it returns non-null if unmatched character found
> in the array, to get the line logic. Setting "has_irq = true" is straightforward -
> if IRQ's found then set the flag to true. So if you don't have a strong opinion
> against my reasoning could you please get the setting the has_irq flag back in to
> the loop above?

It's done in that way for a reason of the next clean ups, i.e. moving this to
the actual user of it. I hope you already read further patches to see the
intention behind this change. So, I prefer to leave it as is, however I agree
with you in general.

Btw, we may also leave the domain when even no IRQ is available as some other
drivers do, but I consider it less plausible than using memchr_inv().

-- 
With Best Regards,
Andy Shevchenko


