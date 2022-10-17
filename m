Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA45A6010EE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 16:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbiJQOTT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 10:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbiJQOTR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 10:19:17 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0602642E6
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 07:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666016356; x=1697552356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WaFYotmxN/LgkPH7lLZ0ZCkgNHSXrKyM8nabiBe5dvI=;
  b=H79af1xHMabiv7V/ru5IDp2R1264+10zm+uoGJ3/9X7BynTXXWHDI3Uz
   bQAWeh5CxagWkDLSEd9d3z2QdXG6GZqSo4cEOLQ7a4cSYKxtfIpQgytPi
   PCNJJokAALezPphN/fCu01v6OiFf4R7YxQPISVA4QNZlW8WGF5tA3iiiU
   5s0LBp8kjM6YKcSZCXTSXGEMd9ylvvWKSdcSAsOuRoCqjFL9G6mcv1Y/K
   8S7xMwyaVXZORCIVffYwTzYdHk2OKy3jBMwRNIFmlWwpls+nkFgNont8e
   wLh98WjzDyY09IN4X34rXXrbahyXa8y/TBhNFTrX7anqQJ84JMNxEVRFO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="304549224"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="304549224"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 07:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="957349686"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="957349686"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 17 Oct 2022 07:19:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1okQxW-008q5v-05;
        Mon, 17 Oct 2022 17:19:14 +0300
Date:   Mon, 17 Oct 2022 17:19:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 2/4] bindings: python: add examples
Message-ID: <Y01kYc8K8oStLz3g@smile.fi.intel.com>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <20221007145521.329614-3-brgl@bgdev.pl>
 <Y0eBbUkzryyJZKwq@sol>
 <CAMRc=MfpGFUPntmBNKsyuheD7Enqxq=K+K2hsp24ru18mn0x2A@mail.gmail.com>
 <Y01GcJbDKPdctduH@sol>
 <Y01dg+vTDKbdjcOI@smile.fi.intel.com>
 <Y01hlUvj7cSdpCcx@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y01hlUvj7cSdpCcx@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 10:07:17PM +0800, Kent Gibson wrote:
> On Mon, Oct 17, 2022 at 04:49:55PM +0300, Andy Shevchenko wrote:
> > On Mon, Oct 17, 2022 at 08:11:28PM +0800, Kent Gibson wrote:
> > > On Mon, Oct 17, 2022 at 02:00:15PM +0200, Bartosz Golaszewski wrote:
> > > > On Thu, Oct 13, 2022 at 5:09 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > On Fri, Oct 07, 2022 at 04:55:19PM +0200, Bartosz Golaszewski wrote:

...

> > > > >         lvs = [ arg.split('=') for arg in sys.argv[2:] ]
> > >             lvs = [ (x,int(y)) for (x,y) in lvs ]
> > > > >         lines = [ x[0] for x in lvs ]
> > > > >         values = dict(lvs)
> > > > 
> > > 
> > > An extra pass to fix the int values.
> > 
> > In Python we have map(), which I think is the best for that kind of job.
> > 
> 
> My understanding is map/filter is old school and list comprehensions
> have replaced map, as generators have replaced filter.
> 
> i.e.
>     list(map(function, iterable))
> becomes
>     [function(x) for x in iterable]

Definitely it does not cover all the cases map() is taking care of.
So it can't be old school :-)

* Yes, in this particular case it may be map() or list comprehension.
  But I think with map() the two lines can become one.

> Either way, what we are missing here is a parser function that gives us
> exactly the (offset,value) output we want from the command line string.
> 
> Oh, and we need both the lines list and the values dict, both of which
> are easily created from the interim lvs.
> 
> > > You could do it in one with a more appropriate parser function.
> > 
> > It seems we need some Python guru to revisit the code, because to me
> > it looks a bit C:ish :-)
> 
> The for loop or the list comprehension?
> Last I checked only one of those is available in C.
> And yeah, the for loop version reads as C, so not at all Pythonic,
> which is why I suggested the list comprehension.

Yes, but I believe it does not utilize the powerfulness of the current Python.
Anyway, I'm not a Py guru, take my remarks with a grain of salt.

-- 
With Best Regards,
Andy Shevchenko


