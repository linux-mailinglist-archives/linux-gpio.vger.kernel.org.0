Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFDB07650AC
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jul 2023 12:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233337AbjG0KMC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jul 2023 06:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233407AbjG0KMA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 06:12:00 -0400
Received: from mgamail.intel.com (unknown [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D7A010FC;
        Thu, 27 Jul 2023 03:11:50 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347881764"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="347881764"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 03:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="762114514"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="762114514"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 27 Jul 2023 03:11:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qOxyD-00GfuY-0g;
        Thu, 27 Jul 2023 13:11:45 +0300
Date:   Thu, 27 Jul 2023 13:11:44 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     j-keerthy@ti.com, linus.walleij@linaro.org, brgl@bgdev.pl,
        grygorii.strashko@ti.com, ssantosh@kernel.org, khilman@kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH -next] gpio: Remove redundant dev_err_probe()
Message-ID: <ZMJC4B9Z2pVRDEOJ@smile.fi.intel.com>
References: <20230727091446.859984-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727091446.859984-1-ruanjinjie@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 27, 2023 at 05:14:46PM +0800, Ruan Jinjie wrote:
> There is no need to call the dev_err_probe() function directly to print
> a custom message when handling an error from platform_get_irq() function as
> it is going to display an appropriate error message in case of a failure.

Please, split on per-driver basis.
The code wise it's okay, you may add to each patch in v2
Reviewed-by: Andy Shevchenko <andy@kernel.org>

>  drivers/gpio/gpio-davinci.c | 2 +-
>  drivers/gpio/gpio-omap.c    | 2 +-

-- 
With Best Regards,
Andy Shevchenko


