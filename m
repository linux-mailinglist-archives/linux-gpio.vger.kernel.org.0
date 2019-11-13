Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E804FB14B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 14:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbfKMN20 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 08:28:26 -0500
Received: from mga11.intel.com ([192.55.52.93]:47679 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725996AbfKMN20 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Nov 2019 08:28:26 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Nov 2019 05:28:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,300,1569308400"; 
   d="scan'208";a="257135877"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2019 05:28:23 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iUsh4-0003f7-SX; Wed, 13 Nov 2019 15:28:22 +0200
Date:   Wed, 13 Nov 2019 15:28:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RESEND][PATCH v2 0/7] gpiolib: fix GPIO <-> pin mapping
 registration
Message-ID: <20191113132822.GF32742@smile.fi.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
 <20191106173055.GQ32742@smile.fi.intel.com>
 <CACRpkdaAxY-8A7gindeA8fsQ9rEdnwp8k90CyULxNs4J5VBSBw@mail.gmail.com>
 <20191108133942.GH32742@smile.fi.intel.com>
 <CACRpkdZWh7MD+psE9zndg4S59Eq-PRcmgrs-ABUaTGHnm7S4Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZWh7MD+psE9zndg4S59Eq-PRcmgrs-ABUaTGHnm7S4Sw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 13, 2019 at 10:43:28AM +0100, Linus Walleij wrote:
> On Fri, Nov 8, 2019 at 2:39 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Nov 08, 2019 at 10:40:47AM +0100, Linus Walleij wrote:
> > > On Wed, Nov 6, 2019 at 6:30 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > Linus, I think it would be good if we have first 3 (okay, I noticed you have
> > > > pushed first one to your devel branch) patches to go to v5.4. It will reduce
> > > > dependency burden in v5.5.
> > >
> > > At this point in the kernel release cycle I can really only apply
> > > patches for serious regressions. That's the policy I need to keep
> > > to.
> > >
> > > It also causes a problem if I put dependencies on Torvald's
> > > tree this late in the kernel cycle, because I need to get the
> > > changes back into my tree in order to base new stuff on them.
> > > I can't really do that until he releases an -rc that I can merge
> > > back.
> > >
> > > At this point I'd maybe have to merge back v5.4 and that doesn't
> > > feel good at all.
> > >
> > > So far I applied patches 1 & 2 for v5.5.
> >
> > Thanks! Does it mean that the rest is material for v5.6?
> 
> No, if they work for you and Hans both I have 100% trust in you
> guys so just send me a big pull request for all of it for v5.5.
> Besides Torvalds is talking about an -rc8 this next weekend.
> 
> Please base your pull request on my "devel" branch though,

I think you meant for-next, which contains reverts my series based on.

> since I already applied some of the patches (sorry for the mess!)

> We can certainly hash out any remaining nits during the v5.5
> kernel cycle.

As I explained in previous mail we have the current state:
- gpiolib patch + merrifield fixes (may be submitted as PR for v5.5)
- Intel pin control (for-next is going as usual for v5.5)
- Intel pin control fixes based on gpiolib patch (for v5.6)
- Lynxpoint as separate PR (didn't check for which tree it suits better,
  I guess due to nature of patches, it rather pin control, but we can wait
  with it till v5.6)

-- 
With Best Regards,
Andy Shevchenko


