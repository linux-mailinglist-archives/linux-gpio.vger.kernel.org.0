Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097714772D7
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 14:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237353AbhLPNOp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 08:14:45 -0500
Received: from mga02.intel.com ([134.134.136.20]:8052 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237368AbhLPNOp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Dec 2021 08:14:45 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="226767462"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="226767462"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 05:14:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="605502649"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 05:14:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mxqZu-0072ei-Rp;
        Thu, 16 Dec 2021 15:13:46 +0200
Date:   Thu, 16 Dec 2021 15:13:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] intel-gpio for 5.17-1
Message-ID: <Ybs7io7zg4+rsfWf@smile.fi.intel.com>
References: <Ybn8pxv5xPgc5nGz@black.fi.intel.com>
 <CAMRc=MceOZWt5Qb6kFSALOOwyYb_MikFusxZqt9KgqqQPfnwgQ@mail.gmail.com>
 <YbskttzHvxlprBPM@smile.fi.intel.com>
 <CAMRc=McSULw2YpCgsK-C6+pTx85mtH3c5Y+MbawO+SSgUXM1gg@mail.gmail.com>
 <Ybs5jqW3zyDh18Vx@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ybs5jqW3zyDh18Vx@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 16, 2021 at 03:05:18PM +0200, Andy Shevchenko wrote:
> On Thu, Dec 16, 2021 at 12:46:11PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Dec 16, 2021 at 12:37 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Dec 16, 2021 at 10:14:05AM +0100, Bartosz Golaszewski wrote:
> > > > On Wed, Dec 15, 2021 at 3:33 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > >
> > > > > Hi Linux GPIO  maintainers,
> > > > >
> > > > > Approximately a dozen of changes for v5.17 against Intel GPIO drivers and
> > > > > GPIO ACPI library. It has ben a while in Linux Next without any error reported.
> > >
> > > > Pulled, thanks!
> > >
> > > Thanks!
> > >
> > > Are you going to pull series with the OF node assignments clean up?
> > > I forgot to mention here that my PR does not include them.
> > >
> > 
> > Yes, I'll queue it this week.
> 
> Thanks!
> 
> Do you know that your branches were kicked off from the Linux Next?
> Are you going to drop previous gpio-sim from the Linux Next?


Last seen GPIO for-next
$ git tag --contains 9dbd1ab2050
next-20211207
next-20211208
next-20211210

Last seen your old GPIO simulator
$ git tag --contains 5065e08e4ef3c
DONT-USE-next-20211105
next-20211101
next-20211102
next-20211103
next-20211104
next-20211105
next-20211106
next-20211108
next-20211109
next-20211110
next-20211111
next-20211112
next-20211115
next-20211116
next-20211117
next-20211118
next-20211123
next-20211124
next-20211125
next-20211126
next-20211129
next-20211130
next-20211201
next-20211202
next-20211203
next-20211206
next-20211207
next-20211208
next-20211210
next-20211213
next-20211214
next-20211215


-- 
With Best Regards,
Andy Shevchenko


