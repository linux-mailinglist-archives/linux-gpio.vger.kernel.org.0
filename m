Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F263B624BBA
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 21:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiKJUXa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 15:23:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbiKJUXU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 15:23:20 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F320FE8
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 12:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668111800; x=1699647800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UKe3n4TKZq7NkJ7uXBgCOLThSARHEukO7he9gghku9U=;
  b=ARfpCqAXZmmon3XXJsBOoQMdr3ejvWVEcwAlDFtqWr7+iAYVbfl3JWFH
   hIhLdINo+rgQ74sDfTELckrn+Oaf5xURU6EP8SU7EL2fCXu2Zaq7in1YI
   FzECvHIUoKvEmVlHEHpZOCgiyNIFt/Z/58h4f5K7rtcCG0sSRZ3X2mR9G
   AQVEWUakF/Tzow0BG0QE7M4F6XLzyw9EOHtr/0jJuRI8lvJHICx78vc6X
   oa/kNThEKyL+Se0+GUpGB5Ns68pQOmdEYrZzcgy+c5LGI0RrHhEdmcTYX
   SCT0HD+UQwmpeHqMqd5kXgUXvJgbz7mUG/ENmwx8eLsyVdme5m2b6p6gC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291837162"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="291837162"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 12:23:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="668559598"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="668559598"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 10 Nov 2022 12:23:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1otE4y-00AKWr-1r;
        Thu, 10 Nov 2022 22:23:16 +0200
Date:   Thu, 10 Nov 2022 22:23:16 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC 0/3] pinctrl: add ACPI support to pin controller
Message-ID: <Y21dtJySQX29VDIh@smile.fi.intel.com>
References: <20221110191258.1134378-1-niyas.sait@linaro.org>
 <Y21btYwNRMD4xXXL@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y21btYwNRMD4xXXL@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 10, 2022 at 10:14:45PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 10, 2022 at 07:12:55PM +0000, Niyas Sait wrote:
> > This is a proposal for adding ACPI support to pin controller.
> > 
> > The patch supports following resources introduced in ACPI from v6.2
> > 
> > - PinFunction
> > - PinConfig
> > - PinGroupFunction
> > - PinGroupConfig
> > - PinGroup
> > 
> > The patch has been tested on NXP I.MX8MP Plus platform with ACPI.
> 
> Thank you very much for this work!
> 
> I will take time to review it, presumably next week.
> 
> I'm not sure it will go to the v6/2-rc1 due to tough time range
> (we are almost at -rc5), I hope you are not in such hurry.

Meanwhile, can we see the DSDT excerpt(s) that shows how you use these
resources there?

Also note, we need some clarification to be done in the ACPI specification
regarding the numbering schema, used in those resources. TL;DR: for Gpio*()
the number space is GPIO, for Pin*() is pin control (real pin numbering,
since not all of them can be GPIOs and GPIO can have its own additional
layer of numbering mapping).

-- 
With Best Regards,
Andy Shevchenko


