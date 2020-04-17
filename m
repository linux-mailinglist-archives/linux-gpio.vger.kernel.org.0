Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3F81ADDA7
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 14:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729828AbgDQM4d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 08:56:33 -0400
Received: from mga06.intel.com ([134.134.136.31]:9115 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729694AbgDQM4c (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 08:56:32 -0400
IronPort-SDR: d7jA/eeZ6D8R1P7s105yFrwZ8uvDe39P8xxKY9AlcOZF31V+8JMNnvMkmoVLDgS0Pd8BNuvzLE
 d9voUpcnFc5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2020 05:56:32 -0700
IronPort-SDR: Jk8R/4dnn0SUssH71jDN3jnssV/3fcfHTcDNp+NBmRwZ26A0aN7upU2JnkFAUCwqn+o91A22MG
 ajB2+onStORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; 
   d="scan'208";a="243000932"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 17 Apr 2020 05:56:31 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jPQXp-001VMK-QU; Fri, 17 Apr 2020 15:56:33 +0300
Date:   Fri, 17 Apr 2020 15:56:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 13/14] gpio: dwapb: Use positive conditional in
 dwapb_configure_irqs()
Message-ID: <20200417125633.GX185537@smile.fi.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-14-andriy.shevchenko@linux.intel.com>
 <20200415163710.e26czil5abouujzu@mobilestation>
 <CACRpkdaO8GMXOOMomzmzfhDqYfgdhjTq8XvQHXuGRmnrfk7bOw@mail.gmail.com>
 <20200416134805.r5qp4o34rpxr2h2d@mobilestation>
 <CACRpkdYCOHQ-e8sswUqv=exuKEasanWKUjPOjsvGDQC5sV4C4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYCOHQ-e8sswUqv=exuKEasanWKUjPOjsvGDQC5sV4C4g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 12:42:33PM +0200, Linus Walleij wrote:
> On Thu, Apr 16, 2020 at 3:48 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > On Thu, Apr 16, 2020 at 01:53:25PM +0200, Linus Walleij wrote:
> > > On Wed, Apr 15, 2020 at 6:37 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > > On Wed, Apr 15, 2020 at 05:15:33PM +0300, Andy Shevchenko wrote:
> > > > > The negative conditionals are harder to parse by reader.
> > > > > Switch to positive one in dwapb_configure_irqs().
> > > >
> > > > Sorry as for me this modification is redundant. Yes, I know that if-else
> > > > statement in some cases better to start with positive expression to make it
> > > > a bit more clear, but in this case I'd leave it as is. First this rule is
> > > > applicable if both branches are more or less equal, but here I see the most
> > > > normal case of using the dt-based generic device, which doesn't declare the
> > > > IRQs as shared seeing it is selected by far more devices at the moment.
> > > > Second the non-shared IRQs case also covers a combined and multiple-lined
> > > > GPIO IRQs (chained cascaded GPIO irqchip), while the irq_shared clause have
> > > > only a single IRQ source supported. Finally If the code was like you
> > > > suggested from the very beginning I wouldn't say a word, but this patch seems
> > > > to me at least just moving the code around with gaining less than we have at
> > > > the moment.
> > > >
> > > > Linus, Bartosz and other GPIO-ers may think differently though. Lets see their
> > > > opinion.
> > >
> > > I think I already applied all patches with the batch application tool b4,
> > > without properly checking which patches you reviewed and not, sorry :(
> > >
> > > However if any change is controversial I can revert or pull the patch out.
> >
> > In this case it's up to you to decide.
> 
> I backed out the last two patches now and kept the rest except 13 and 14.

Fine with me, thanks!

-- 
With Best Regards,
Andy Shevchenko


