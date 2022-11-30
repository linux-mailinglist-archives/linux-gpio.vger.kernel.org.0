Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B37763D763
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 14:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiK3N7a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 08:59:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbiK3N73 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 08:59:29 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3D429C9A
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 05:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669816767; x=1701352767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wvU7oIxGAwkvjRmle78W/XpCDKJzt3FhK7wEMNS5ac0=;
  b=LTBdBkR10colZeEotV+sCCLlkVEh+/gMcNsNsocLYtuuV8nsXwI7jC44
   IP+YHszCByNCWC4/CLlFPRth8gR/pDv85aw+J4iGT/OLIl71zFXl2Cffp
   bwqHZOhqz9lBZu9xUxeTn0lGNQGBPVhpaJ8/m5y2/dyKfd1Lf76ol3Cw3
   6c8lUcEntUT6l+8DIkqlrH33uokQKf93yFwoaI01rYWloizBuq8VahtWb
   KUhaoDHtvK5vbwldFf81GlvtbUsxuCDOI/N5eO3Wu/7x0DlCWVqkGuO9o
   EWsfOFANnj5238HoMtvjaPkQ2BZh/JNkm3C6XpAzvzApmSRnZwnnGrlCF
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="303001006"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="303001006"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 05:59:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="707651881"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="707651881"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 30 Nov 2022 05:59:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p0NcR-002I9w-39;
        Wed, 30 Nov 2022 15:59:23 +0200
Date:   Wed, 30 Nov 2022 15:59:23 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 02/11] treewide: apply formatting changes with
 clang-format
Message-ID: <Y4dhu0rgNoyvR7cf@smile.fi.intel.com>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
 <20221130124231.1054001-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130124231.1054001-3-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 30, 2022 at 01:42:22PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use linux kernel's .clang-format file to automatically improve the coding
> style of libgpiod's C code base. We don't import the file into the
> repository as it's not perfect and certain converted fragments were
> rolled back because they looked better before the conversion.

...

>  		if (gpiod_line_settings_get_direction(
> -				per_line->node->settings) !=
> +			    per_line->node->settings) !=
>  		    GPIOD_LINE_DIRECTION_OUTPUT)
>  			continue;

Personally I percept this as an ugly indented code...

One reason is too strict 80 or whatever rule (we are almost in
the second quarter of the 21st century!), another is that trailing
opening parenthesis.

That said, some of the changes in this patch I like, some I disgust.
Quite controversial to me, but it's your project and esp. taking into
account that it's a user space, the kernel or other project rules are
not applicable in a general sense anyway.

-- 
With Best Regards,
Andy Shevchenko


