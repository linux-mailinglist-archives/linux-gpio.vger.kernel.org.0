Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026B65F2E69
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Oct 2022 11:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbiJCJrd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Oct 2022 05:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbiJCJrS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Oct 2022 05:47:18 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5C8DFC6
        for <linux-gpio@vger.kernel.org>; Mon,  3 Oct 2022 02:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664790282; x=1696326282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xb8ggPFy+eDXOpSRxMhJfe7mhTnBJJB/jC/Lnoz45aA=;
  b=U+IuYG+NpJ8WzkZLSMQPPtkPsh2zzyvkODNZ1si4+7DFrHwHqyuo6Aom
   UZAErf5hOEVk+x7gqEWzKEz9W2weKm0ld9PyIMRCpUYUkm6HI3hVvekBg
   aacuNw95Iah2RaDZSUFy6W797z4ghMgU8ZHyphiZUzte5BqBs7nS6dDpf
   DSW2/DT8av9RqTw7J3XfCahWJWkanH+wgrBj9ogPWAVn0RXoBSZmdkkMt
   y5lTWqYrcma8Jz8QbnRVMIOZFN+q8vAvooKKIl9H5rJXmDN0mN29t7Sx0
   9YRyx1Y+igGi7Zc/B22iZuKDd+SYHWHS2D0lzk+WMx6NofF/5WjWxqatE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="304080114"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; 
   d="scan'208";a="304080114"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 02:44:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="656669934"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; 
   d="scan'208";a="656669934"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 03 Oct 2022 02:44:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ofI07-001Rmr-0z;
        Mon, 03 Oct 2022 12:44:39 +0300
Date:   Mon, 3 Oct 2022 12:44:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] intel-gpio for 6.1-1
Message-ID: <YzqvByGu2W9JH1wH@smile.fi.intel.com>
References: <Yym/j+Y9MBOIhWtK@black.fi.intel.com>
 <CAMRc=Me873ynTWMyM0oe434zMbb3kdFfAUELFVc+hquedDfKHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Me873ynTWMyM0oe434zMbb3kdFfAUELFVc+hquedDfKHg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 20, 2022 at 04:05:14PM +0200, Bartosz Golaszewski wrote:
> On Tue, Sep 20, 2022 at 3:26 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Hi Linux GPIO  maintainers,
> >
> > A small quirk for GPIO ACPI library. Was a few weeks in Linux Next, shouldn't
> > be any conflicts with anything. Please pull for v6.1.
> >
> > Thanks,
> >
> > With Best Regards,
> > Andy Shevchenko
> >
> > The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> >
> >   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> >
> > are available in the Git repository at:
> >
> >   git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v6.1-1
> >
> 
> Pulled, but what happened with the git://git.kernel.org/... address? :(

Because change wasn't submitted and hence old script had been used. Now
submitted and updated all my local repos with the scripts I'm using.

Thanks for pointing this out.

-- 
With Best Regards,
Andy Shevchenko


