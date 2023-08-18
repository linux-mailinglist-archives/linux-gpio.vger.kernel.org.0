Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01EB1780CEA
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Aug 2023 15:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240150AbjHRNth (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Aug 2023 09:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377455AbjHRNtE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Aug 2023 09:49:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79773C38;
        Fri, 18 Aug 2023 06:48:38 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="353406980"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="353406980"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 06:47:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="770141696"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="770141696"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 18 Aug 2023 06:47:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qWzp0-00ARzE-15;
        Fri, 18 Aug 2023 16:47:26 +0300
Date:   Fri, 18 Aug 2023 16:47:25 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Li Zetao <lizetao1@huawei.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, j-keerthy@ti.com,
        vz@mleia.com, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, grygorii.strashko@ti.com,
        ssantosh@kernel.org, khilman@kernel.org,
        shubhrajyoti.datta@amd.com, srinivas.neeli@amd.com,
        michal.simek@amd.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH -next 03/11] gpio: ftgpio010: Use helper function
 devm_clk_get_enabled()
Message-ID: <ZN92bVsblGb/wYfY@smile.fi.intel.com>
References: <20230818093018.1051434-1-lizetao1@huawei.com>
 <20230818093018.1051434-4-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230818093018.1051434-4-lizetao1@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 18, 2023 at 05:30:10PM +0800, Li Zetao wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for
> prepared and enabled clocks"), devm_clk_get() and clk_prepare_enable()
> can now be replaced by devm_clk_get_enabled() when the driver enables
> (and possibly prepares) the clocks for the whole lifetime of the device.
> Moreover, it is no longer necessary to unprepare and disable the clocks
> explicitly.

...

> -	} else if (PTR_ERR(g->clk) == -EPROBE_DEFER) {
> +	g->clk = devm_clk_get_enabled(dev, NULL);
> +	if (PTR_ERR_OR_ZERO(g->clk) == -EPROBE_DEFER)
>  		/*
>  		 * Percolate deferrals, for anything else,
>  		 * just live without the clocking.
>  		 */
>  		return PTR_ERR(g->clk);
> -	}

It means you need to use _optional variant here and return whatever error you
get.

...

>  	platform_set_drvdata(pdev, g);

Do you now need this?

-- 
With Best Regards,
Andy Shevchenko


