Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 082F41485E0
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2020 14:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387797AbgAXNWu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jan 2020 08:22:50 -0500
Received: from mga18.intel.com ([134.134.136.126]:26416 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387639AbgAXNWu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Jan 2020 08:22:50 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jan 2020 05:21:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,357,1574150400"; 
   d="scan'208";a="292397111"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2020 05:21:36 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iuyu1-0000a9-NQ; Fri, 24 Jan 2020 15:21:37 +0200
Date:   Fri, 24 Jan 2020 15:21:37 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.6-1
Message-ID: <20200124132137.GG32742@smile.fi.intel.com>
References: <20200120100957.GA11113@black.fi.intel.com>
 <CACRpkdZh4Cy83BPfdgcXR6idf7KCr15VD0YkR-7CcDxV=HZgaQ@mail.gmail.com>
 <20200124105735.GC32742@smile.fi.intel.com>
 <CACRpkdba9zw3qN5MEVsRhdkebVfi-fHoiNU+FhCZfpoZ1g3vLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdba9zw3qN5MEVsRhdkebVfi-fHoiNU+FhCZfpoZ1g3vLw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 24, 2020 at 02:02:56PM +0100, Linus Walleij wrote:
> On Fri, Jan 24, 2020 at 11:57 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Jan 23, 2020 at 03:45:14PM +0100, Linus Walleij wrote:
> 
> > > Pulled this into my "devel" branch for v5.6.
> >
> > Thanks!
> > How long usually does it take to see in linux-next?
> 
> What I need before I put it for-next is successful builds on a few
> archs.
> 
> Zeroday has been smacky before so I could quickly cornfirm the branches
> build fine and that made things quicker in the past. But as of lately
> zeroday comes and goes a bit sporadically.
> 
> I can do local builds of some archs but my computer isn't the most
> fantastic workhorse really.
> 
> Lately I am investigating a cloud build service, it is quite promising,
> you see the branch "testmerge" in linux-gpio where I merge all
> the new stuff for GPIO and pin control and toss at the build server,
> so I am working on something here.
> 
> Sometimes I just give up trying to build all stuff and submit it for
> next anyway but I'd rather not have to do that, it usually results
> in a patch storm of 4 different people fixing the same trivial
> issue in linux-next...

Thank you for so detailed answer! I didn't mean to complain or so,
I was just wondering...

-- 
With Best Regards,
Andy Shevchenko


