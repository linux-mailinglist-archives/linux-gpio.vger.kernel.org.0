Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6AB8CFD6
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 11:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfHNJk1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 05:40:27 -0400
Received: from mga03.intel.com ([134.134.136.65]:49501 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbfHNJk1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Aug 2019 05:40:27 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Aug 2019 02:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,384,1559545200"; 
   d="scan'208";a="376662539"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga006.fm.intel.com with ESMTP; 14 Aug 2019 02:40:24 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hxplW-0001wV-Sl; Wed, 14 Aug 2019 12:40:22 +0300
Date:   Wed, 14 Aug 2019 12:40:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        David Cohen <david.a.cohen@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] gpio: lynxpoint: Pass irqchip when adding gpiochip
Message-ID: <20190814094022.GS30120@smile.fi.intel.com>
References: <20190812081351.21284-1-linus.walleij@linaro.org>
 <20190812105825.GB30120@smile.fi.intel.com>
 <CACRpkda_2T_eBf5AxpNG0P54KTLds-NvYDMcTWx5BtOa9kK-mA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkda_2T_eBf5AxpNG0P54KTLds-NvYDMcTWx5BtOa9kK-mA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 14, 2019 at 10:46:49AM +0200, Linus Walleij wrote:
> On Mon, Aug 12, 2019 at 12:58 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Aug 12, 2019 at 10:13:51AM +0200, Linus Walleij wrote:
> 
> > > +             girq->num_parents = 1;
> > > +             girq->parents = devm_kcalloc(&pdev->dev, 1,
> > > +                                          sizeof(*girq->parents),
> > > +                                          GFP_KERNEL);
> > > +             if (!girq->parents)
> > > +                     return -ENOMEM;
> >
> > I understand the point to use kcalloc() for one entry, though I would make
> > intention more explicitly, i.e. use girq->num_parents in it instead of hard
> > coded value.
> 
> That is better, but I have a loose plan to get rid of this
> and just set parents to a fixed width because all the allocation
> is annoying.

I see your intentions, though for current state I think the less hard coded
constants the better. In any case I pushed updated versions to my trees.

> > > +             girq->parents[0] = (unsigned)irq_rc->start;
> > > +             girq->default_type = IRQ_TYPE_NONE;
> >
> > > +             girq->handler = handle_simple_irq;
> >
> > > -             ret = gpiochip_irqchip_add(gc, &lp_irqchip, 0,
> > > -                                        handle_simple_irq, IRQ_TYPE_NONE);
> >
> > Hmm... Now I'm wondering, shall we use handle_bad_irq() here?
> 
> If you are sure that every consumer will call .set_type() you can
> use handle_bad_irq, and that is preferred.

They should do this. Let me prepare the patch for next cycle (v5.5) and I put
it to my tree after merge window. If we see any complains from linux-next
testers, we will act accordingly.

-- 
With Best Regards,
Andy Shevchenko


