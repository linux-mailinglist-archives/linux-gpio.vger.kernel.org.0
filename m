Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B691606735
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Oct 2022 19:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbiJTRn0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Oct 2022 13:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiJTRnZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2022 13:43:25 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800031E7452
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 10:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666287804; x=1697823804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iJUQNS7z1wTPt+xqFgXMM+zeZG+67jT93k/IZ20tOSM=;
  b=RiCQ0R3+1SftYQUeaGcer2fPErX1E8lwYHxubi+eTxZ2veS/+tEfNBLx
   pIZ2KuT2XQlX68AdYXcurVMRqGNTqLAi9PO9+XmP6wOTWXBC7/KLbBxty
   HrU5XCUCDcMZOmo2wXmLHTvkyfMQnfHCkWI2ZOTTRA0TWdWI7nzZt1maK
   uiqTkQAZTZaBizwhijICAkMJWrBt6abQXNcdMxDQPp8cxdynw+Ej5sOto
   2GEMBEXDPpOfeUJgwhNijv4ZokdQm4F9Lk5IpjVWgoGId7qmN124K4Kji
   oJ86/Qt3kLD9ghK947fgMkGJiPxVE585RVAEvzunTRcS0EIXskUfRQO8T
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="333358235"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="333358235"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 10:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="755285972"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="755285972"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 20 Oct 2022 10:43:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1olZZe-00Afuh-1Z;
        Thu, 20 Oct 2022 20:43:18 +0300
Date:   Thu, 20 Oct 2022 20:43:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.1-1
Message-ID: <Y1GItraKIaDqFMjG@smile.fi.intel.com>
References: <Y1FgAAHJu/cVNAIC@black.fi.intel.com>
 <CAMRc=Medt_M0h+1TdtRnu=7v1NmGePqfFBS02+zceXGLQ4OV3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Medt_M0h+1TdtRnu=7v1NmGePqfFBS02+zceXGLQ4OV3w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 20, 2022 at 07:31:23PM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 20, 2022 at 4:58 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Hi Linux pin control  maintainers,
> >
> > A bunch of cleanups of the pin control and GPIO headers. It has been a couple
> > of days in Linux Next without any major issue reported, a few fixes are already
> > incorporated in the respective patches. The idea is that pin control and GPIO
> > subsystems take it now and we will continue from this for all new code.
> >
> > Linus, Bart, please pull to your trees.
> > The tag is signed and can be considered as immutable.
> >
> > Thanks,
> >
> > With Best Regards,
> > Andy Shevchenko
> >
> > The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> >
> >   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.1-1
> >
> > for you to fetch changes up to 1053f6a58766ac8eadcb72630262a5a454048479:
> >
> >   pinctrl: Clean up headers (2022-10-19 18:08:45 +0300)
> >
> > ----------------------------------------------------------------
> > intel-pinctrl for v6.1-1
> >
> > * Add missing and remove unused headers in pin control and GPIO drivers
> > * Revise the pin control and GPIO headers
> >
> > ----------------------------------------------------------------
> > Andy Shevchenko (50):
> >       gpio: aspeed: Add missing header(s)
> >       gpio: arizona: Remove unused header(s)
> >       gpio: da9052: Remove unused header(s)
> >       gpio: mockup: Add missing header(s)
> >       gpio: pca953x: Add missing header(s)
> >       gpio: pl061: Add missing header(s)
> >       gpio: reg: Add missing header(s)
> >       gpio: wm8350: Remove unused header(s)
> >       gpio: tegra186: Add missing header(s)
> >       gpiolib: cdev: Add missing header(s)
> >       gpiolib: Clean up headers
> 
> Can you send the GPIO changes separately? This way I don't need to
> pull all those pinctrl patches into the GPIO PR for the next merge
> window.

Some of them, but not all, if that what you wish.
I.o.w. a couple of the GPIO changes must be part of pin control series.

-- 
With Best Regards,
Andy Shevchenko


