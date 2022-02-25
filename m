Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 573BD4C4AEA
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Feb 2022 17:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243077AbiBYQgj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Feb 2022 11:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243069AbiBYQgj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Feb 2022 11:36:39 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A2022310F;
        Fri, 25 Feb 2022 08:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645806966; x=1677342966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IZnoVmPnir54K979MChGEoGFpJMdRJjovN5lCewDRbA=;
  b=NmM6eDuiQVNgaHy0gIgCrc91HhVpHMouEdTKiqgv+a5pWy0YI+YYRUX3
   exsY2W2AqGSlDQeWwQ8+nrgbiy59jDIurmHl2fAEK5WqW5o65LuXgDAn1
   TzRP2e0fCfQbji5ggOEAcg/J/lFh8kTIkJKwYVKoFVMBr+L/Ud2PxUbFy
   /LhtBamY5pzV02f3HS90KDseUIdVUIIBL4KXZZ5+qVgCiLkygBFnNAd/J
   Znm6Kbf8Xmk54z9xykqJg33IXQez7jpkMS+IjuNsK1a457ZuxPXknVIw+
   NbXgY1xp4PZ25RBhjdF5s7fxrLqaOugkj+BsELH2fFoJKmOUc01GGo0SX
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252724623"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="252724623"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 08:36:06 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="509317892"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 08:36:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1nNdYo-008GPw-6W;
        Fri, 25 Feb 2022 18:35:14 +0200
Date:   Fri, 25 Feb 2022 18:35:13 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/5] platform/x86: x86-android-tablets: Workaround Lenovo
 Yoga Tablet 2 830/1050 poweroff hang
Message-ID: <YhkFQa82XVsu37xN@smile.fi.intel.com>
References: <20220223133153.730337-1-hdegoede@redhat.com>
 <20220223133153.730337-5-hdegoede@redhat.com>
 <YhZLpmhobBjrOHDU@smile.fi.intel.com>
 <0568e484-4ab2-5641-53ae-29ff48e952e6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0568e484-4ab2-5641-53ae-29ff48e952e6@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 24, 2022 at 05:57:11PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 2/23/22 15:58, Andy Shevchenko wrote:
> > On Wed, Feb 23, 2022 at 02:31:52PM +0100, Hans de Goede wrote:
> >> These tablets' DSDT does not set acpi_gbl_reduced_hardware, so
> >> acpi_power_off gets used as pm_power_off handler. This causes "poweroff"
> >> on these tablets to hang hard. Requiring pressing the powerbutton for
> >> 30 seconds *twice* followed by a normal 3 second press to recover.
> >>
> >> Avoid this by overriding the global pm_power_off handler to do
> >> an EFI poweroff instead.
> > 
> > Oh, you eventually found the root cause (reduced HW bit)?
> 
> I'm not sure, it is possible that not setting the reduced HW bit
> is actually correct for this hw, but that does lead to using
> acpi_power_off which seems broken on this system.
> 
> I've updated the commit message while merging this to reflect
> that using acpi_power_off is the problem, rather then not setting
> the reduced HW bit.

Understood. Thanks!

> Also note that the issue of reboot being the same as poweroff once
> the system has been rebooted at least once is still unresolved.

-- 
With Best Regards,
Andy Shevchenko


