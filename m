Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC7316489DD
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Dec 2022 22:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiLIVFW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Dec 2022 16:05:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiLIVFV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Dec 2022 16:05:21 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74FAB079F
        for <linux-gpio@vger.kernel.org>; Fri,  9 Dec 2022 13:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670619920; x=1702155920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PddMd/TeiQUM6c9fv5DaQNe6cUqJoGjxjyLGjFZy3bU=;
  b=QgttXnWFpRsxXt+asLOc8t4RO77a2tZPqyEH+YJArxro5+XRPOelvbpM
   MntOipweTWwW5gwR4t0Pir/C0k3c3WcbZWrkODbTdc3ehvmGfXbEttTcM
   Nb2JtdtUwqr4mAc1rjByWreM2RHNMb+CTGepx0EQWReA/LEg9hcLEejH4
   OBMbAw7nA10ifZQYV2LyRfSzf9ahiewL/JK4c/a+4giM7cCwz+kYfIpYH
   DzPYyxv+yJQaCG3wrLTuw03gDtDKql5y0CFhf0tOBpIxIo3+uIrDq2rkn
   uvXW0BFCMwy6KcTTmRHv7/afKq0+C0PmO6eCJOaAiPNokurQjh2M9BmTN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="344592792"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="344592792"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 13:05:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="625236621"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="625236621"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 09 Dec 2022 13:05:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p3kYW-007BTM-2M;
        Fri, 09 Dec 2022 23:05:16 +0200
Date:   Fri, 9 Dec 2022 23:05:16 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     haibo.chen@nxp.com
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, linux-imx@nxp.com,
        linux-gpio@vger.kernel.org, martyn.welch@collabora.com
Subject: Re: [PATCH 2/2] gpio: pca953x: avoid logically dead code
Message-ID: <Y5OjDFIM5hqVQKib@smile.fi.intel.com>
References: <20221209075040.2141042-1-haibo.chen@nxp.com>
 <20221209075040.2141042-2-haibo.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209075040.2141042-2-haibo.chen@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 09, 2022 at 03:50:40PM +0800, haibo.chen@nxp.com wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> The current code logic make the condition "else if (reg >= 0x54)"
> can't be true, cause the dead code. So fix it to match the coder
> expectation. This is reported by Coverity.

...

> -	if (reg >= 0x30) {
> +	if (reg >= 0x30 && reg < 0x54) {
>  		/*
>  		 * Reserved block between 14h and 2Fh does not align on
>  		 * expected bank boundaries like other devices.

Can we convert this to a switch case with ranges?

-- 
With Best Regards,
Andy Shevchenko


