Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2320A71EFEF
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 18:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbjFAQ6y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 12:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjFAQ6x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 12:58:53 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DE410C0
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 09:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685638713; x=1717174713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u2xJYTi4T2rNoYi8R9Fd0VOCqgW2G/DBJCnnkFwUPzc=;
  b=SyLuiLEKBfdIODCYpvWbBdAJRBAcJfHkwCJ6vFYTUgdV/fbGrRxkgXNz
   emVZL2TpgRqyxO9cpLATwS7SVp53yj3gquW8hLK3t1562MOiU4fi4loZh
   xWLZslrsUrHypgBqA4c9+M9FH3W9bwf91poE219XkUBOR3mpzFaAZ2pdy
   uld1Yk+6RSNzY4eWXfIDytgVKx+MzzGRHfUpXY8oT5E8gZmX+BQUsACRk
   tkN3FNrutpsA7/SVDG4k44ioL6o9MQQaGFqyrJkLg+E82TQeZ1/HK5GgC
   O3bTfjz7v5yTafSSPrBJOf/HqEQMiQ5dgQnmkgVt2LecJmkAWa9dyl4tp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358041547"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="358041547"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 09:58:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="954115270"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="954115270"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2023 09:58:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1q4ld7-000Sss-26;
        Thu, 01 Jun 2023 19:58:29 +0300
Date:   Thu, 1 Jun 2023 19:58:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: tests: replace egrep with grep -E
Message-ID: <ZHjONQW0qVMseySZ@smile.fi.intel.com>
References: <20230601140950.779453-1-brgl@bgdev.pl>
 <ZHirBqDkd99qWGX8@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHirBqDkd99qWGX8@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 01, 2023 at 10:28:22PM +0800, Kent Gibson wrote:
> On Thu, Jun 01, 2023 at 04:09:50PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > 
> > Since version 3.11 egrep emits the following warning to stderr on startup:
> > 
> >   egrep: warning: egrep is obsolescent; using grep -E
> > 
> > This makes the tests fail (though that seems to depend on BATS version)
> > so replace egrep with grep -E as suggested.
> > 
> 
> That works for me, so I don't have any objections.
> 
> Though FWIW, my global sim cleanup script looks like:
> 
> find /sys/kernel/config/gpio-sim -type d -name hog -print0 2>/dev/null | xargs -0 -r rmdir
> find /sys/kernel/config/gpio-sim -type d -name "line*" -print0  2>/dev/null | xargs -0 -r rmdir
> find /sys/kernel/config/gpio-sim -type d -name "bank*" -print0 2>/dev/null | xargs -0 -r rmdir
> rmdir /sys/kernel/config/gpio-sim/*
> 
> So no grep at all, just find and xargs.

Maybe you can even use -exec... :-)
But I don't remember if it forks for each entry (and I don't remember by heart
what -r does for xargs, which usually adds as many parameters as possible to
the command line of the calling tool).

> That is for all sims, but could easily be reduced to a particular sim,
> given the sim name.
> 
> Setting live to 0 seems to be optional - deleting everything works fine
> for me.

-- 
With Best Regards,
Andy Shevchenko


