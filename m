Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61BB4644E7E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 23:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbiLFWVt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Dec 2022 17:21:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiLFWVs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Dec 2022 17:21:48 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7818326F3
        for <linux-gpio@vger.kernel.org>; Tue,  6 Dec 2022 14:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670365307; x=1701901307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EHXq8wHC2G8ZhZGyd1eB2JCmW/m7On/xBdFbULM1wTY=;
  b=ceoVsaLGq0Grw6oOyIPiulB0DV/pRSa9tpc+Pq2bcgxqz7cLEbJM8SYe
   w2O80wg5X4YLBvfjKPfp62fz3Cdrv8Qf1fFUa1tsW5PvE3KUoT80KHRTi
   bG1l6nwQLYqr1d8bcH0EaEATLM9Q1B+ji6eTvfctI8znAcz0lw5BgOkb/
   MqEvlmM7P9C3lneFMiXEu58aDy5f2zh8btWvq6KliYh5ZzPRbIJ7JnfkK
   oe4DBsOVb6J/yPMeIIXLUHzf2q7WxlU3qRmJwtdPEqJeyZWa1LNPaV+Jb
   GmKRZHhf3wDTDCUlg6fm4ChTGcsz36Z9bXagrwEnHEEzUQ+0x6kCjIl6V
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="378909184"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="378909184"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 14:21:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="624066133"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="624066133"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 06 Dec 2022 14:21:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p2gJr-005URk-1f;
        Wed, 07 Dec 2022 00:21:43 +0200
Date:   Wed, 7 Dec 2022 00:21:43 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][WIP PATCH 0/2] Convert the build from autotools to
 meson
Message-ID: <Y4/Ad7v1waTC4NJc@smile.fi.intel.com>
References: <20221205132207.94775-1-andrew@aj.id.au>
 <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
 <Y49Xi1WO1yPjvMYq@smile.fi.intel.com>
 <7fc4db18-cebc-4894-b3d7-12c9470e6a93@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fc4db18-cebc-4894-b3d7-12c9470e6a93@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 07, 2022 at 08:34:20AM +1030, Andrew Jeffery wrote:
> On Wed, 7 Dec 2022, at 01:24, Andy Shevchenko wrote:
> > On Mon, Dec 05, 2022 at 07:55:29PM +0100, Bartosz Golaszewski wrote:
> >> On Mon, Dec 5, 2022 at 2:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:

...

> >> > Meson defaults to using ninja as its backend, and automatically exploits
> >> > ccache[2] when available to keep repeated builds speedy.
> >
> > ...which is a bad idea for a clean build.
> >
> >> It does show! Full rebuild with autotools:
> >> 
> >> real 0m43,902s
> >> user 2m40,010s
> >> sys 0m20,172s
> >> 
> >> Full rebuild with meson:
> >> 
> >> real 0m10,001s
> >> user 1m1,334s
> >> sys 0m12,205s
> >> 
> >> More than 4x faster now.
> >
> > And risk to have a badly formed binaries (yes, very little risk, but > 0).
> >
> >> > [2] https://ccache.dev/
> >
> > ccache has downside of its own use. If we have a common storage for ccache --
> > the collision is just matter of time (yes, have seen that in real life).
> >
> > OTOH requiring per-project ccache storage makes a little sense for the end user
> > as they quite likely won't rebuild it many times.
> 
> Valid points. However I think they're addressed by:
> 
> 1. Not installing ccache on the system, or
> 2. Overriding the auto-detection behaviour of `meson setup ...` 
> 
> Regarding 2, you can specify the CC and CXX environment variables to force its hand:
> 
> ```
> $ command -v ccache
> /usr/bin/ccache
> $ CC=cc CXX=c++ meson setup -Dbindings=cxx build
> The Meson build system
> Version: 0.63.0
> ...
> C compiler for the host machine: cc (gcc 12.2.0 "cc (Ubuntu 12.2.0-3ubuntu1) 12.2.0")
> ...
> C++ compiler for the host machine: c++ (gcc 12.2.0 "c++ (Ubuntu 12.2.0-3ubuntu1) 12.2.0")
> ...
> ```
> 
> Compared to the default behaviour:
> 
> ```
> $ meson setup -Dbindings=cxx build
> The Meson build system
> Version: 0.63.0
> ...
> C compiler for the host machine: ccache cc (gcc 12.2.0 "cc (Ubuntu 12.2.0-3ubuntu1) 12.2.0")
> ...
> C++ compiler for the host machine: ccache c++ (gcc 12.2.0 "c++ (Ubuntu 12.2.0-3ubuntu1) 12.2.0")
> ...
> ```
> 
> This use of the CC and CXX variables is covered in the documentation:
> 
> https://mesonbuild.com/Feature-autodetection.html#ccache

Right, my point that ccache should be opt-in and not opt-out.
For example, Buidroot project has ccache support (as opt-in).

-- 
With Best Regards,
Andy Shevchenko


