Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41FDA601356
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 18:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiJQQYq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 12:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiJQQYp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 12:24:45 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178901C939
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 09:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666023884; x=1697559884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/mN6KinL9kfxuSZANQxMa2A3Z6Qh8kMxTdX5R5obadE=;
  b=nRZCHZOg9OYeoTKGUxFL/+EXWDvgPjEGkIJjKvb1VJv6IUbg4PVfug9Q
   CrrAoxkNbg+Zd9bWDkeYEAfwjOKVFgEUJ4wVpjM52LxAYZ7+Qlk7IjIQs
   U3bXtGZBUSzymjctC9jAEMW6kjFYs9B2Ufp663BQR+YH1Kcl2SrM1nRtG
   gozS8vFGt1mhgBjzPmsqC9Sw7flQQXMcTAK4KHPrOGnI3hCk0ozxRiPDK
   +DifqRndPdC6XhV6F2+RHk4ryLVV21XWCBAfDH1xn5Pjw+OsQnR0BYlJT
   buavitQ9efrBGwaM58zsYpDftEAEif2UrhF4M7nK8WWx+iXAh8BK/r5LH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="286240810"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; 
   d="scan'208";a="286240810"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 09:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="630750275"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; 
   d="scan'208";a="630750275"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 17 Oct 2022 09:24:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1okSuu-008uot-1y;
        Mon, 17 Oct 2022 19:24:40 +0300
Date:   Mon, 17 Oct 2022 19:24:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 2/4] bindings: python: add examples
Message-ID: <Y02ByMEjM7LjvHE4@smile.fi.intel.com>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <20221007145521.329614-3-brgl@bgdev.pl>
 <Y0eBbUkzryyJZKwq@sol>
 <CAMRc=MfpGFUPntmBNKsyuheD7Enqxq=K+K2hsp24ru18mn0x2A@mail.gmail.com>
 <Y01GcJbDKPdctduH@sol>
 <Y01dg+vTDKbdjcOI@smile.fi.intel.com>
 <Y01hlUvj7cSdpCcx@sol>
 <Y01kYc8K8oStLz3g@smile.fi.intel.com>
 <CAMRc=MfAVVpc_k9ZsAib1s5WCyThgmfTb46VCx7P8iuDKBpuoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfAVVpc_k9ZsAib1s5WCyThgmfTb46VCx7P8iuDKBpuoA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 05:53:52PM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 17, 2022 at 4:19 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> How about this?
> 
>     lvs = list(
>         map(
>             lambda val: [val[0], Value(int(val[1]))],
>             [arg.split("=") for arg in sys.argv[2:]],
>         )
>     )

Yeah, this looks ugly... So initial variant with two lines looks to me
like this:

  lvs = [arg.split("=") for arg in sys.argv[2:]] # btw, needs handling 2 exceptions
  values = dict((x, Value(int(y))) for (x,y) in lvs) # needs to handle an exception
  # Perhaps you need ordered dict?
  lines = values.keys()

>     lines = [x[0] for x in lvs]
>     values = dict(lvs)

> It's so much less readable but at least it's pythonic, look at those
> lambdas and comprehension lists and even a map! :)


-- 
With Best Regards,
Andy Shevchenko


