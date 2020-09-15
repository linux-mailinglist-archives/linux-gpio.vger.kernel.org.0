Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6DEA26A5B8
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 14:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgIOM7R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 08:59:17 -0400
Received: from mga05.intel.com ([192.55.52.43]:50118 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726423AbgIOM6p (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Sep 2020 08:58:45 -0400
IronPort-SDR: ZXGw2Xz5kiG+fU24AsC+AXzpDzRhQymPI2rbxlssW227ZTM73tfFAlHxx23DEK+4mCCYX3CUob
 RCRAjdrpcgug==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="244081698"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; 
   d="scan'208";a="244081698"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2020 05:56:32 -0700
IronPort-SDR: SsnKrWLzw0kJIxhL+X029pIGfoMOwN3sN/OG7D28F0tSq750PVO2tecqhlq04ndOc7siuRJ82u
 D7vFnrXbGCWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; 
   d="scan'208";a="335637509"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 15 Sep 2020 05:56:30 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kIAVX-00GqGc-Ij; Tue, 15 Sep 2020 15:56:27 +0300
Date:   Tue, 15 Sep 2020 15:56:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] gpiolib: Fix line event handling in syscall
 compatible mode
Message-ID: <20200915125627.GW3956970@smile.fi.intel.com>
References: <20200914143743.39871-1-andriy.shevchenko@linux.intel.com>
 <20200914230526.GA4138@sol>
 <20200915092022.GR3956970@smile.fi.intel.com>
 <20200915121815.GA98308@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915121815.GA98308@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 15, 2020 at 08:18:15PM +0800, Kent Gibson wrote:
> On Tue, Sep 15, 2020 at 12:20:22PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 15, 2020 at 07:05:26AM +0800, Kent Gibson wrote:
> > > On Mon, Sep 14, 2020 at 05:37:43PM +0300, Andy Shevchenko wrote:
> > 
> > ...
> > 
> > > It can return size_t now.
> > 
> > > >  	ssize_t bytes_read = 0;
> > > > +	ssize_t ge_size;
> > > 
> > > Similarly here.
> > 
> > I deliberately left the ssize_t type to be consistent with the returned type of
> > the function and bytes_read. If you insist on the type change I will do, though
> > I personally like my approach.
> > 
> 
> Bart prefers to use unsigned ints where variables are never negative,
> and lineevent_get_size() never returns negative so should be size_t.
> And it feels like a sizeof() to me so should return a size_t.
> 
> By the same logic bytes_read is never negative so it should be size_t as
> well.  It seems reasonable to assume that bytes_read will always be less
> than SSIZE_MAX so any cast to ssize_t for the return would be harmless.
> Though changing that would probably mean a separate patch?
> 
> > Thanks for your review. Before I'm going on it, can you confirm that these are
> > the only issues with the patch and after addressing them you will be okay with
> > the patch?
> 
> I have suggested renaming ge_size to event_size, but that is just personal
> preference. You have more than enough documentation describing the issue
> where it is assigned, so I'm fine with that.
> 
> These are just my suggestions. Feel free to ignore them.

Thanks for review!

I will send v3 soon, but I will leave ssize_t by the reasons I mentioned above.

-- 
With Best Regards,
Andy Shevchenko


