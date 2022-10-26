Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD27F60DF61
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 13:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbiJZLSW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 07:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbiJZLSU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 07:18:20 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D82D9258C
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 04:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666783100; x=1698319100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DI/qWXRZLit5hhdvLYqsJGUl9tlVUyxXiSM7FYtJ69Y=;
  b=MBJ5vEoHro9DmtWYwKRCDwW/lpKEwyVOBzGSf2qWPNPhsAx2SRHpB++E
   XWRtEuOlnaoFj3EyRZ/PIN/L1f79bIY7+Se2AlNV603h8UCanRyRfUHCH
   cQ/F6zKbpAmJW+hekJEUEkia0B+Bjn/AFDWdD79CSW4hDmiFzikyebqUy
   3VyyMLiCjAbLlBTsItuEnoY7gyMLjVbqcUszq+AHzLDV/AmvkNbLJmZyj
   4+kE1b4/g1tZnVZvIWLmv14yrMtKdrM7b89FkOeqoZlsvmHNpfHQWpjBT
   9rr0lzjq1Xj5vkcMsOLDU2C1lXiRFQLdzx6HoLv6kl+YonYIKXXVQp/xX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="309013202"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="309013202"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 04:18:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="663158802"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="663158802"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 26 Oct 2022 04:18:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oneQJ-002btq-2q;
        Wed, 26 Oct 2022 14:18:15 +0300
Date:   Wed, 26 Oct 2022 14:18:15 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.1-2
Message-ID: <Y1kXd8++brY23LHb@smile.fi.intel.com>
References: <Y1fl6ZaTNa7L6QfQ@black.fi.intel.com>
 <CACRpkdb3-ifo2u02kcxbQzB6fJzYSQOSjVhXRWWsCRrc2_BU-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb3-ifo2u02kcxbQzB6fJzYSQOSjVhXRWWsCRrc2_BU-Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 26, 2022 at 10:00:02AM +0200, Linus Walleij wrote:
> On Tue, Oct 25, 2022 at 3:34 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > A bunch of cleanups of the pin control and GPIO headers. It has been a couple
> > of days in Linux Next without any major issue reported, a few fixes are already
> > incorporated in the respective patches. The idea is that pin control and GPIO
> > subsystems take it now and we will continue from this for all new code.
> 
> I'm a big fan of this cleanup series!
> 
> > Linus, Bart, please pull to your trees.
> > The tag is signed and can be considered as immutable.
> 
> Pulled in to my devel branch for v6.2.

Thank you!

Now I'm starting to fill the branch by the patches in the queue.

-- 
With Best Regards,
Andy Shevchenko


