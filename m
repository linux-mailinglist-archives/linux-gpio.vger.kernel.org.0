Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD13478A62
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 12:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbhLQLsv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 06:48:51 -0500
Received: from mga06.intel.com ([134.134.136.31]:54064 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230396AbhLQLsu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Dec 2021 06:48:50 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="300513235"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="300513235"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 03:48:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="683357314"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 03:48:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1myBhv-007Odb-28;
        Fri, 17 Dec 2021 13:47:27 +0200
Date:   Fri, 17 Dec 2021 13:47:26 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] intel-gpio for 5.17-1
Message-ID: <Ybx4zg9UbqiSrbtA@smile.fi.intel.com>
References: <Ybn8pxv5xPgc5nGz@black.fi.intel.com>
 <CAMRc=MceOZWt5Qb6kFSALOOwyYb_MikFusxZqt9KgqqQPfnwgQ@mail.gmail.com>
 <YbskttzHvxlprBPM@smile.fi.intel.com>
 <CAMRc=McSULw2YpCgsK-C6+pTx85mtH3c5Y+MbawO+SSgUXM1gg@mail.gmail.com>
 <Ybs5jqW3zyDh18Vx@smile.fi.intel.com>
 <CAMRc=MdWQEk-+-rq5ML=Yj-7ZTFMv6B0WocgqWJQu6GPkOsx2g@mail.gmail.com>
 <CAHp75VfTQ-V6UMt570PV91ZkGFX8GOHepPsM3i2DSwp3J9ht1Q@mail.gmail.com>
 <CAMRc=MeZoDKOymaSyotXaD=7B+U-dM7G44b601agVqDXzRWnWQ@mail.gmail.com>
 <CAMRc=Mf+MNTkA6=xg=vhfEY8P8w9MnMzura7OwOQYOBjxcemQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf+MNTkA6=xg=vhfEY8P8w9MnMzura7OwOQYOBjxcemQw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 12:29:50PM +0100, Bartosz Golaszewski wrote:
> On Fri, Dec 17, 2021 at 12:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Fri, Dec 17, 2021 at 10:53 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Fri, Dec 17, 2021 at 1:38 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

...

> > > Btw, I have noticed you rebased your tree, can you, please, do not
> > > forget to put --rebase-merges to your `git rebase` command line so the
> > > merge won't change commit IDs?
> >
> > Oof you saved me from another LinusRant. I already pushed it, let's
> > see if I can get back to the previous state...
> 
> Done, reflog is my best friend now. Please take a look if all looks good to you.

Looks excellent, thanks!

-- 
With Best Regards,
Andy Shevchenko


