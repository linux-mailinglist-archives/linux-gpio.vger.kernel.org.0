Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C0D36F983
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 13:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhD3Lmq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 07:42:46 -0400
Received: from mga07.intel.com ([134.134.136.100]:31963 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229875AbhD3Lmp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Apr 2021 07:42:45 -0400
IronPort-SDR: 7mS4ACEa1gs4Wd0pqunRGk+iDI+qZJG4l5WjS0fSGqgxSwEuUZgpxK5Rg0PRX074cDv+fr3qxG
 y5vuLlTfArSA==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="261203264"
X-IronPort-AV: E=Sophos;i="5.82,262,1613462400"; 
   d="scan'208";a="261203264"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2021 04:41:56 -0700
IronPort-SDR: SklqaXO4qHXyNK7OS66vpOzZsMO4cllONuXfDI1piJ6BYCfarsWlRk4W/Ai5I1bBN74T8PBzfr
 e8ikdvNSUIVw==
X-IronPort-AV: E=Sophos;i="5.82,262,1613462400"; 
   d="scan'208";a="424961633"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2021 04:41:54 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lcRWq-008P3B-51; Fri, 30 Apr 2021 14:41:52 +0300
Date:   Fri, 30 Apr 2021 14:41:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 2/3] libgpiosim: new library for controlling
 the gpio-sim module
Message-ID: <YIvtACUK779d6J/I@smile.fi.intel.com>
References: <20210429094734.9585-1-brgl@bgdev.pl>
 <20210429094734.9585-3-brgl@bgdev.pl>
 <YIqXHXU/tqxXjaKA@smile.fi.intel.com>
 <CAMRc=MeKciVDxdFvq6_d8mN8M08tqDSc1qDqmywswF2gbUa=Dg@mail.gmail.com>
 <YIrmHkaKnrr4IdCT@smile.fi.intel.com>
 <YIrmxckO0P1Z4w/a@smile.fi.intel.com>
 <YIrnK105JB0vNVva@smile.fi.intel.com>
 <CAMRc=Mcf_wpBx6z3p=cEvFitnv+eSiNPp6w7Uus4K2CZLR-G4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mcf_wpBx6z3p=cEvFitnv+eSiNPp6w7Uus4K2CZLR-G4A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 30, 2021 at 11:29:59AM +0200, Bartosz Golaszewski wrote:
> On Thu, Apr 29, 2021 at 7:04 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Apr 29, 2021 at 08:03:01PM +0300, Andy Shevchenko wrote:
> > > On Thu, Apr 29, 2021 at 08:00:14PM +0300, Andy Shevchenko wrote:
> > > > On Thu, Apr 29, 2021 at 03:07:49PM +0200, Bartosz Golaszewski wrote:
> >
> > ...
> >
> > > > Still you may advance the pointer by the length of P_tmpdir + 1.
> > >
> > > There is also tempnam().
> >
> > Scratch it. It seems legacy one that actually tries to create file...
> 
> And also this:
> 
> libgpiod/tests/gpiosim/gpiosim.c:331: warning: the use of `tmpnam_r'
> is dangerous, better use `mkstemp'
> 
> So I'll go with my solution.

My gosh, we so much legacy stuff here and there...


-- 
With Best Regards,
Andy Shevchenko


