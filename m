Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A59E4C16FA
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 16:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242160AbiBWPjk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 10:39:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242154AbiBWPji (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 10:39:38 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB82FBBE3F;
        Wed, 23 Feb 2022 07:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645630750; x=1677166750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mug4g/zF6+N5TPVq60yJ26yIsPAIsToKNpF5qKDs3Oc=;
  b=mGpQOTC3YUJdUkrrAsSBJrTMA+CX97ShtPCRWG4job1O5eVW1/lby3iO
   EMtHyekSh1+PUcdzGOWzLFpO6A/5Qr6f+bmsfQYnVAXDlPmZ1CabOlF7/
   GY9HblwfPVSismiZswibSlMOpj6dRG3/QiD3lIsz5fikphdYCknBsvIIr
   +d/Zd+qGCnez9mz6zuI86w6Co22uKwc99Mik7MPlUxpcrrpRSZ/L3gOQy
   iP7PEyn8HHtw8CwnynnmkIDwW6Na6fsrwXQ1FtKrUCY4KFR0GbcvbWap+
   /P6E0WJCxtwbTwD5R5ber1LXudDEur8v5L8u58d/r9lqcGU/R1Nf1wzvh
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="338427902"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="338427902"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 07:39:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="683936700"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 07:39:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1nMtic-007Tga-9O;
        Wed, 23 Feb 2022 17:38:18 +0200
Date:   Wed, 23 Feb 2022 17:38:18 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/5] platform/x86: x86-android-tablets: Fix EBUSY error
 when requesting IOAPIC IRQs
Message-ID: <YhZU6rDSYPG3pUbx@smile.fi.intel.com>
References: <20220223133153.730337-1-hdegoede@redhat.com>
 <20220223133153.730337-3-hdegoede@redhat.com>
 <YhZLI40Vukgv+PPO@smile.fi.intel.com>
 <9cda0c14-8108-fb42-4464-36a2fde0ffda@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cda0c14-8108-fb42-4464-36a2fde0ffda@redhat.com>
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

On Wed, Feb 23, 2022 at 04:16:42PM +0100, Hans de Goede wrote:
> On 2/23/22 15:56, Andy Shevchenko wrote:
> > On Wed, Feb 23, 2022 at 02:31:50PM +0100, Hans de Goede wrote:

...

> >>  	case X86_ACPI_IRQ_TYPE_APIC:
> >> +		/*
> >> +		 * The DSDT may already reference the GSI in a device skipped by
> >> +		 * acpi_quirk_skip_i2c_client_enumeration(). Unregister the GSI
> >> +		 * to avoid EBUSY errors in this case.
> >> +		 */
> >> +		acpi_unregister_gsi(data->index);
> > 
> > Perhaps a warning (or at least debug) message?
> 
> The function returns void, so we cannot check if it did anything or not.

Another approach may be to try to register GSI and if fail, try unregister
and register again?

-- 
With Best Regards,
Andy Shevchenko


