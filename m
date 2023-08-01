Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBF5A76BC8E
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 20:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjHASf3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 14:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjHASf2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 14:35:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5E01BC1
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 11:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690914927; x=1722450927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FOos6loOU8enJ6bot1EXRmZmOEt+HtMXrPbJ2XyYJ3g=;
  b=aNLPVos5HmdbRsymL67GCrCplUkb5tieTqbGj5hYfCTIK42cVDZFscpq
   VJdEsRlq6/zaBFqjYXLebD8FpURrCApbXHp6v8oCYhkWF0T078jzlBAmQ
   uXrNYUbqDjQckaAafzQzaw93SITjHCGipCTx2tzIGCEjIuYzqEuZ2mtGr
   +ZdX4KkfO9V2cvGIPHV0mw4IBi/xOF3yO4nRrDXAV/G5CIUtmFWUxFP4R
   lpmguDfbWGYvhHvzhYujR8B8MOMEQbMAWlBn4BywLlSkXn9M+8duU1i77
   0yBF9JGDWTIoBXUZOWu3aJpNKpKpa14k62pdy3funkz3XI1+IezKPqPjE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="359425666"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="359425666"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 11:35:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="852589345"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="852589345"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 01 Aug 2023 11:35:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQuD5-00Endg-1t;
        Tue, 01 Aug 2023 21:35:07 +0300
Date:   Tue, 1 Aug 2023 21:35:07 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, vz@mleia.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        u.kleine-koenig@pengutronix.de, arnd@arndb.de
Subject: Re: [PATCH -next] gpio: lpc32xx: remove redundant CONFIG_OF and
 of_match_ptr
Message-ID: <ZMlQW0J3OY+sidPe@smile.fi.intel.com>
References: <20230801033547.220980-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801033547.220980-1-wangzhu9@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 01, 2023 at 11:35:47AM +0800, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use
> CONFIG_OF and of_match_ptr here, so we remove them all.

of_match_ptr()

> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it.

There are two mails with the same subject. Which one to consider?
This one is good (with commit message change
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> ---
>  drivers/gpio/gpio-lpc32xx.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
> index d2b65cfb336e..5ef8af824980 100644
> --- a/drivers/gpio/gpio-lpc32xx.c
> +++ b/drivers/gpio/gpio-lpc32xx.c
> @@ -525,17 +525,15 @@ static int lpc32xx_gpio_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_OF
>  static const struct of_device_id lpc32xx_gpio_of_match[] = {
>  	{ .compatible = "nxp,lpc3220-gpio", },
>  	{ },
>  };
> -#endif
>  
>  static struct platform_driver lpc32xx_gpio_driver = {
>  	.driver		= {
>  		.name	= "lpc32xx-gpio",
> -		.of_match_table = of_match_ptr(lpc32xx_gpio_of_match),
> +		.of_match_table = lpc32xx_gpio_of_match,
>  	},
>  	.probe		= lpc32xx_gpio_probe,
>  };
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


