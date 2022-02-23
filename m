Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 243284C15FE
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 15:59:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241841AbiBWPAN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 10:00:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241840AbiBWPAN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 10:00:13 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E32DB8208;
        Wed, 23 Feb 2022 06:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645628385; x=1677164385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tYR2Tt5TItfk4GxPJqCzPqQkXq48vKIvuIL2D+ee80Q=;
  b=MRxiVfPu4QIf7KGUBSOUFJPBT6h6hhw8WUe7KAfW2FLBl5nWkaYbloGl
   4MSxNKhgx2BR3Tx5AjUmcxceJcTAimzPORw3rXj8gIFdqTtgM+6+pUPdp
   0C4gmk1/i2r2jF4OUBtYt5b2E2cc8e1zCxinN6g1UM8nkqKSFjsidE6wD
   6baixEsFXdaAE/psJSm3Q3s4OCVOtb4vCRkJf4tvN304mc7F3jDKyyOHg
   5dou9uw+Bngq8lLIZyIxlsaG3H/k8UJB1AFu5DInqMW/tIjorTKHJZlmE
   YeRP0wLC8EwKlgadwsapHlrjV79HDYf8jOrHrC/tPYjqVh365mG/Q3dRG
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="276600160"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="276600160"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 06:59:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="707058157"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 06:59:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1nMt6M-007Sxh-Pt;
        Wed, 23 Feb 2022 16:58:46 +0200
Date:   Wed, 23 Feb 2022 16:58:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/5] platform/x86: x86-android-tablets: Workaround Lenovo
 Yoga Tablet 2 830/1050 poweroff hang
Message-ID: <YhZLpmhobBjrOHDU@smile.fi.intel.com>
References: <20220223133153.730337-1-hdegoede@redhat.com>
 <20220223133153.730337-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223133153.730337-5-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 23, 2022 at 02:31:52PM +0100, Hans de Goede wrote:
> These tablets' DSDT does not set acpi_gbl_reduced_hardware, so
> acpi_power_off gets used as pm_power_off handler. This causes "poweroff"
> on these tablets to hang hard. Requiring pressing the powerbutton for
> 30 seconds *twice* followed by a normal 3 second press to recover.
> 
> Avoid this by overriding the global pm_power_off handler to do
> an EFI poweroff instead.

Oh, you eventually found the root cause (reduced HW bit)?
Perhaps we need to enforce it based on a quirk?

-- 
With Best Regards,
Andy Shevchenko


