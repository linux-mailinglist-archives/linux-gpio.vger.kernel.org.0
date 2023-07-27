Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B51B76531F
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jul 2023 14:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbjG0MCs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jul 2023 08:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233669AbjG0MCr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 08:02:47 -0400
Received: from mgamail.intel.com (unknown [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220EC2D4B;
        Thu, 27 Jul 2023 05:02:36 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399223131"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="399223131"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 05:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="726987097"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="726987097"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 27 Jul 2023 05:02:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qOzhP-002tHK-1o;
        Thu, 27 Jul 2023 15:02:31 +0300
Date:   Thu, 27 Jul 2023 15:02:31 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     j-keerthy@ti.com, linus.walleij@linaro.org, brgl@bgdev.pl,
        grygorii.strashko@ti.com, ssantosh@kernel.org, khilman@kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH -next v2] gpio: omap: Remove redundant dev_err_probe()
Message-ID: <ZMJc10fKGbvHDltH@smile.fi.intel.com>
References: <20230727115704.2663211-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727115704.2663211-1-ruanjinjie@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 27, 2023 at 07:57:04PM +0800, Ruan Jinjie wrote:
> There is no need to call the dev_err_probe() function directly to print
> a custom message when handling an error from platform_get_irq() function as
> it is going to display an appropriate error message in case of a failure.

...

> @@ -1415,7 +1415,7 @@ static int omap_gpio_probe(struct platform_device *pdev)
>  	if (bank->irq <= 0) {
>  		if (!bank->irq)
>  			bank->irq = -ENXIO;
> -		return dev_err_probe(dev, bank->irq, "can't get irq resource\n");
> +		return bank->irq;
>  	}

Actually you may go further here and drop a dead code:

	if (bank->irq < 0)
		return bank->irq;

will suffice.

-- 
With Best Regards,
Andy Shevchenko


