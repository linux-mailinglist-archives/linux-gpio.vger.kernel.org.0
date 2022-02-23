Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFD334C15DF
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 15:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241783AbiBWO4e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 09:56:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbiBWO4e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 09:56:34 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFF0B65E9;
        Wed, 23 Feb 2022 06:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645628166; x=1677164166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yf7E4wUiaBNChmt0Sg9BDFAYUdnfu15hG61/AV4fqmQ=;
  b=LWWOOvE/K/zc4gdyGte0cU4RiRoK5EmwjMQTVlpDSCHoUe/sTLFpB9/Z
   rqH7FYnVMAqP/j/y/38uwVHvfBssyjAWv9/fHXw10Rv8XWQvG779UZLH8
   2bwBXt4U2kMPQUJkSgBMc2fyqGb28aSPveI/ubTk5EVTlT7GrS0L/V9IW
   cF2OPtQdLzsvbkw3bZvwoGYjdrEkC9YmMdkdOOKDRKYPRrsIfERqw5CP1
   eqVd1k3qX1opwfFTpR8Sbpu8tA+5mgcxPTsm+agS5R2kDOYJ7d4NM1W5F
   dKQR/zozKEZqxzFBApJEpJ1BmvvfhQV8f6/JlfzRKeb060vuGqTu4ZyxM
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="250807347"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="250807347"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 06:56:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="776695201"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 06:56:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1nMt2v-007Stj-Uz;
        Wed, 23 Feb 2022 16:55:13 +0200
Date:   Wed, 23 Feb 2022 16:55:13 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/5] pinctrl/baytrail platform/x86: SUS6 mux / Lenovo
 Yoga Tablet 2 support
Message-ID: <YhZK0VPc2tg6upYg@smile.fi.intel.com>
References: <20220223133153.730337-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223133153.730337-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 23, 2022 at 02:31:48PM +0100, Hans de Goede wrote:
> Hi All,
> 
> This series consists of 2 parts:
> 
> Patch 1   : pinctrl: baytrail: Add pinconf group + function for the pmu_clk
> Patch 2-5 : platform/x86: x86-android-tablets: Add Lenovo Yoga Tab2 support
> 
> Patch 5 has a runtime dependency on patch 1, but this is only  runtime and
> there are some other patches in flight to other subsystems which are also
> needed for the Lenovo Yoga Tab2 support.
> 
> As such I believe that patch 1 can be merged independently through the
> pinctrl-intel tree and then I'll merge patches 2-5 through the pdx86 tree.
> 
> The only reason for sending this out as a series is because patch 5
> uses the new pmu_clk pinconf added by patch 1.

You may route via PDx86 and provide an IB to me, thanks!

> Regards,
> 
> Hans
> 
> 
> Hans de Goede (5):
>   pinctrl: baytrail: Add pinconf group + function for the pmu_clk
>   platform/x86: x86-android-tablets: Fix EBUSY error when requesting
>     IOAPIC IRQs
>   platform/x86: x86-android-tablets: Add Lenovo Yoga Tablet 2 830 / 1050
>     data
>   platform/x86: x86-android-tablets: Workaround Lenovo Yoga Tablet 2
>     830/1050 poweroff hang
>   platform/x86: x86-android-tablets: Lenovo Yoga Tablet 2 830/1050 sound
>     support
> 
>  drivers/pinctrl/intel/pinctrl-baytrail.c   |   9 +
>  drivers/platform/x86/x86-android-tablets.c | 280 +++++++++++++++++++++
>  2 files changed, 289 insertions(+)
> 
> -- 
> 2.35.1
> 

-- 
With Best Regards,
Andy Shevchenko


