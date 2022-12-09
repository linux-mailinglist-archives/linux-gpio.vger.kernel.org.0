Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F41DC6489DB
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Dec 2022 22:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiLIVEi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Dec 2022 16:04:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiLIVEi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Dec 2022 16:04:38 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902EDB079F
        for <linux-gpio@vger.kernel.org>; Fri,  9 Dec 2022 13:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670619877; x=1702155877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JIqMeoktrVOYYP9jNFnEYJ7qxsg6jLtbpghXdjBs/pU=;
  b=Q+y6bz7Nxv0MNrubLcvR6jSGPPw7gQlGxR/e9876c50VRlsQCnGxpGS5
   62WnOafg88KaBA8O/BWdG9DcmXOKFOUgt852qeIegBXw9TWXfsMztaBJj
   8iOVy5hH6OrGQR64wzGGZaopkvcMgLHoKu5Znk7EUgogh7tBXHHqnmX6b
   cCU4DH+UvZXIZvKTqy3yr29V0i2Ew9kEyTe3a2t3dDvJzOFa8WdevBkic
   FybGCHHBe2xrMz+8vWax7nApRLwrU0QBzBPH8dnMMjcgEIDuVzzP74GrK
   ViBm9NhF8u8t4+lxGm9iAqD4gOYCMcs/UBARZ6WFlBnz76cwjytuoL0aa
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="381853005"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="381853005"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 13:04:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="649673755"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="649673755"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 09 Dec 2022 13:04:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p3kXp-007BS0-1K;
        Fri, 09 Dec 2022 23:04:33 +0200
Date:   Fri, 9 Dec 2022 23:04:33 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     haibo.chen@nxp.com
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, linux-imx@nxp.com,
        linux-gpio@vger.kernel.org, martyn.welch@collabora.com
Subject: Re: [PATCH 1/2] gpio: pca953x: avoid to use uninitialized value
 pinctrl
Message-ID: <Y5Oi4Y1/pQS8TqLM@smile.fi.intel.com>
References: <20221209075040.2141042-1-haibo.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209075040.2141042-1-haibo.chen@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 09, 2022 at 03:50:39PM +0800, haibo.chen@nxp.com wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> There is a variable pinctrl declared without initializer. And then
> has the case (switch operation chose the default case) to directly
> use this uninitialized value, this is not a safe behavior. So here
> initialize the pinctrl as 0 to avoid this issue.

> This is reported by Coverity.

Nice, but we need this to be in align with the datasheet.
Can you please check what registers are there and what their layout is?

...

> -	int pinctrl;
> +	int pinctrl = 0;

If it will becomes a correct fix, I would rather see the default case in
the switch-case than this.

-- 
With Best Regards,
Andy Shevchenko


