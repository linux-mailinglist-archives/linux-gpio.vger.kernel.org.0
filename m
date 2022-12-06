Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02DD9644753
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 16:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234982AbiLFPB0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Dec 2022 10:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233206AbiLFPBB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Dec 2022 10:01:01 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A872F39F
        for <linux-gpio@vger.kernel.org>; Tue,  6 Dec 2022 06:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670338448; x=1701874448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hB5LRJZTijTRKy0u/I20Ep24TCC5lNSOSNlZO8Ua9yU=;
  b=dEq3Pvlk5TgRS5FPFT53hCjRX1LhpPkwQjlZM+WeogoR/3gA06/bjYKb
   Ap1cmM2XZ8LlxFGJW8qPR05/RLT93e51jOHpA8jO3G2Onrgxko0to8s8Y
   n2UuwUMKpSRGYFCImBNL/4tPth7m1cHuXhB18kxxskKzxz+S74vPKNqjr
   sfZ7VB6HWpxJ6k1FLXkqb9T3W3N1tedYWPZLV1OSGZJKWWmscV+simJ25
   kURhPsqtv3HqHCBEtadnhiAXqFM8ntQXBb8D16+u9HrRO5AIAvsCosRkA
   nT+FnITh7jkGIwJh6hdlNnlP5DD225Qd3MNUdQf4jTyoFVEN+kXaQZ6Fo
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="380932191"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="380932191"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 06:54:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="735023697"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="735023697"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Dec 2022 06:54:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p2ZKe-005Lpq-0V;
        Tue, 06 Dec 2022 16:54:04 +0200
Date:   Tue, 6 Dec 2022 16:54:03 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][WIP PATCH 0/2] Convert the build from autotools to
 meson
Message-ID: <Y49Xi1WO1yPjvMYq@smile.fi.intel.com>
References: <20221205132207.94775-1-andrew@aj.id.au>
 <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 05, 2022 at 07:55:29PM +0100, Bartosz Golaszewski wrote:
> On Mon, Dec 5, 2022 at 2:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:

...

> > Meson defaults to using ninja as its backend, and automatically exploits
> > ccache[2] when available to keep repeated builds speedy.

...which is a bad idea for a clean build.

> It does show! Full rebuild with autotools:
> 
> real 0m43,902s
> user 2m40,010s
> sys 0m20,172s
> 
> Full rebuild with meson:
> 
> real 0m10,001s
> user 1m1,334s
> sys 0m12,205s
> 
> More than 4x faster now.

And risk to have a badly formed binaries (yes, very little risk, but > 0).

> > [2] https://ccache.dev/

ccache has downside of its own use. If we have a common storage for ccache --
the collision is just matter of time (yes, have seen that in real life).

OTOH requiring per-project ccache storage makes a little sense for the end user
as they quite likely won't rebuild it many times.

-- 
With Best Regards,
Andy Shevchenko


