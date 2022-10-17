Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1A860107D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 15:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbiJQNuH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 09:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbiJQNuE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 09:50:04 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C92205C6
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 06:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666014599; x=1697550599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HZiKABG9IGsN1GZK5SDt7EonO2BpW0PFo7Auk+xQ9ro=;
  b=TKQGhaYBLLZ44NNqyIwUZews4sGVFmMxw69u0VM4AfXGcVTVq9jUsx5z
   ZVRxJLVxpUHWyxoFUDY7Vrh+SmEyXAQ43WxGdJcBkOIEoicaB2IeuZ8ai
   +e4gEYJxoEZn/kQLDIg/2rphHuE1aaLidap3bBSC5L6BKrXn9gCQhHAD2
   DeTyYZCdBZPs2zEB3Mwwe2PdoR5mLOAbdEL9UAd/yS7cEXWlxz8bg/HPQ
   7lNpIzRXEB7WFzPeAD0hE1hSj83gghOVWE7qg05Xit4/gQmCyO7DYZBRx
   D0zUk7VPq/VqBT+7eBdyKxKm4ckapogL4MsZqUR961MK4yC+zfAOunwY3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="286193867"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="286193867"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 06:49:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579378480"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="579378480"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 17 Oct 2022 06:49:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1okQV9-008pH6-13;
        Mon, 17 Oct 2022 16:49:55 +0300
Date:   Mon, 17 Oct 2022 16:49:55 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 2/4] bindings: python: add examples
Message-ID: <Y01dg+vTDKbdjcOI@smile.fi.intel.com>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <20221007145521.329614-3-brgl@bgdev.pl>
 <Y0eBbUkzryyJZKwq@sol>
 <CAMRc=MfpGFUPntmBNKsyuheD7Enqxq=K+K2hsp24ru18mn0x2A@mail.gmail.com>
 <Y01GcJbDKPdctduH@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y01GcJbDKPdctduH@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 08:11:28PM +0800, Kent Gibson wrote:
> On Mon, Oct 17, 2022 at 02:00:15PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Oct 13, 2022 at 5:09 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > On Fri, Oct 07, 2022 at 04:55:19PM +0200, Bartosz Golaszewski wrote:
> > > > This adds the regular set of example programs implemented using libgpiod
> > > > python bindings.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > > +    path = sys.argv[1]
> > > > +    values = dict()
> > > > +    lines = []
> > > > +    for arg in sys.argv[2:]:
> > > > +        arg = arg.split("=")
> > > > +        key = int(arg[0]) if arg[0].isdigit() else arg[0]
> > > > +        val = int(arg[1])
> > > > +
> > > > +        lines.append(key)
> > > > +        values[key] = Value(val)
> > > > +
> > >
> > >         lvs = [ arg.split('=') for arg in sys.argv[2:] ]
>             lvs = [ (x,int(y)) for (x,y) in lvs ]
> > >         lines = [ x[0] for x in lvs ]
> > >         values = dict(lvs)
> > 
> 
> An extra pass to fix the int values.

In Python we have map(), which I think is the best for that kind of job.

> You could do it in one with a more appropriate parser function.

It seems we need some Python guru to revisit the code, because to me
it looks a bit C:ish :-)

Maybe I can ask colleague of mine, if he has time for a such...
No guarantees, though.

-- 
With Best Regards,
Andy Shevchenko


