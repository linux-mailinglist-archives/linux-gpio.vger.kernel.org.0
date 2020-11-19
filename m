Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5462B93A7
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 14:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgKSN2R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 08:28:17 -0500
Received: from mga03.intel.com ([134.134.136.65]:18960 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726830AbgKSN2R (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Nov 2020 08:28:17 -0500
IronPort-SDR: abzpEfYKlI5iP3cAFRhgTXNHdE/hQqtYY+JKiwpM61Hy44OMft0JlXwhTFjQV121je763ZfRRD
 Cw8O199rK5eA==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="171384522"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="171384522"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 05:28:15 -0800
IronPort-SDR: CEMsLUQ8xd/X778JsRPtrXffTzqBk3u13DjWEvCgvBm13FLySuUx7SRueLmDib9JCYGFUHwMr0
 gBC0lcnx1d7g==
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="534775567"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 05:28:14 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kfjzw-007wy3-8e; Thu, 19 Nov 2020 15:29:16 +0200
Date:   Thu, 19 Nov 2020 15:29:16 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-gpio for 5.11-1
Message-ID: <20201119132916.GD4077@smile.fi.intel.com>
References: <20201116152625.GA20187@black.fi.intel.com>
 <CACRpkdbgO++4scNqX=3D0XKSyUhah67UvMjHDbaT4SyX0ESF-A@mail.gmail.com>
 <20201118141811.GV4077@smile.fi.intel.com>
 <CACRpkdZO+OGvYVF1+ZxgnaMO-HUCCJ2oAJPQgP_zKQwXeOLtCQ@mail.gmail.com>
 <20201119105828.GZ4077@smile.fi.intel.com>
 <CACRpkdb4ZKZpOQyV1FHnF2k1QFWe4WA=Yo0rQmk_1zgTG9r8-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb4ZKZpOQyV1FHnF2k1QFWe4WA=Yo0rQmk_1zgTG9r8-w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 19, 2020 at 01:43:38PM +0100, Linus Walleij wrote:
> On Thu, Nov 19, 2020 at 11:57 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > > And that patch was on my fixes branch, which went into v5.10-rc4,
> > > so in order to have the base commit in the devel tree I had to merge
> > > in v5.10-rc4.
> >
> > I based solely on your gpio/for-next as has been stated in the cover letter.
> > So, the PR might have been applied on top of your gpio/for-next without any
> > additional merge required.
> 
> OK but my for-next isn't what is going to be merged by Torvalds so there
> is some misunderstanding here.
> 
> In my tree "for-next" does not mean "for the next kernel that Torvalds
> is going to release", it means "for the linux-next integration tree".
> 
> What is going into v5.11 is "devel" and that is why I'm always talking
> about pulling stuff into devel etc.
> 
> for-next is created when I merged a few patches like this:
> 
> > git checkout for-next
> > git reset --hard fixes
> > git merge devel
> 
> (Procedure to create integration branch recommended by
> Stephen Rothwell at one point.)
> 
> This is why your pull request work fine anyways if I merge in -rc4
> because then "devel" will contain all commits from these two
> branches at that point.
> 
> > I admit that PR automatic text is a bit deviated (it has been taken from wrong
> > base, note that tag is correct nevertheless). I will look forward to amend my
> > scripts.
> 
> Don't worry about it.
> 
> Maybe I need to think about how I name stuff.
> 
> Should I rename the branch "for-next" to "for-sjr-next" and
> rename "devel" to "for-torvalds-next" then "fixes"
> into "for-torvalds-current" or something
> so it is crystal clear what they are for?
> 
> The community doesn't really have an established standard
> here.

Hmm... Usually for-next is what should come as material for next cycle.
And devel or so is for testing (can be rebased / etc)

I like the following schema (with possible variations in the parentheses):

 fixes (for-current) - what is going to the next rc of current cycle
 for-next - what is going to the next release cycle
 devel (review, ...) - what is under review / testing / etc

What you explained to me seems like swapped for-next and devel semantics and
this is confusing because the above schema is what I met in 99% of repositories
I'm cooking patches against.

-- 
With Best Regards,
Andy Shevchenko


