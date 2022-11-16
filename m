Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5D9562B706
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 10:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbiKPJ4z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 04:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbiKPJ4w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 04:56:52 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A413E13DFC
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 01:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668592611; x=1700128611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tu0sNJQTKDO8mAJxG1XcwcuCCiX7XH4ZJAxKXq4ecas=;
  b=Y6Ec1uN9OVbJx9l3L5B+RqdQH008floFtXiEVDQTpl6NTvdpdq8Q3PM5
   58IETgpyZyAqfP0lB/ODXaAEh3kL56BHehPlN8E/lsjTwTHQQvUGCcuIK
   fMu3c16l/s7pjXZN1mtqR/uoZ/WQMu1Kg4rggsCDeUo9QFWOM3SZZBpRY
   gl2lQZEKUy3QWLdgJMkrtNMfwdHjLUjOjE631Jcr2L3WalRSVLmSY06WJ
   FmRg0wVeW6yDOcEKgV0uxnGf1RHfJPVJ0HxalacTsjj7iTqK3RV2e4ahh
   nchXb4gIdsP3rZvScIS+XSc0p3hEh630SINWq++3eXbMw7iIGWzUeEfRx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="312508523"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="312508523"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 01:56:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="814029173"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="814029173"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 16 Nov 2022 01:56:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ovFA0-00D4Zl-0C;
        Wed, 16 Nov 2022 11:56:48 +0200
Date:   Wed, 16 Nov 2022 11:56:47 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC v2 0/3] pinctrl: add ACPI support to pin controller
Message-ID: <Y3Sz32+4uuynGeAy@smile.fi.intel.com>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <Y3PWjZb9Jci1oXyM@smile.fi.intel.com>
 <3766343a-ce40-10aa-99dc-2ea94bc1ffbd@linaro.org>
 <Y3Pexz7tLrAP05uY@smile.fi.intel.com>
 <c9eb64c4-4cb3-b25c-df04-97da24a595fd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9eb64c4-4cb3-b25c-df04-97da24a595fd@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 16, 2022 at 09:50:05AM +0000, Niyas Sait wrote:
> On 15/11/2022 18:47, Andy Shevchenko wrote:
> > On top of that, how other hardware can utilize what you are doing without
> > adding redundancy to the ACPI?
> 
> Sorry I missed this question.
> 
> I am not sure if there is any redundancy to ACPI spec.
> 
> ACPI pin resources gives you most of the bits you need to describe the pin
> dependencies and configuration required for the device.
> 
> For my particular implementation (not part of this proposal), I had to pass
> extra data to the driver to describe the GPIO number to Pin mapping and conf
> and mux registers. But that can be potentially fully handled in the driver.
> Sorry for the repetition.

The GPIO to pin mapping is done by GPIO ranges. This can be made up in the
driver or, IIRC, in DT (so in ACPI) by already registered properties).

Not sure, why you don't use them.

> Let me know if I missed your question :-)

-- 
With Best Regards,
Andy Shevchenko


