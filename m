Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD06C70CC29
	for <lists+linux-gpio@lfdr.de>; Mon, 22 May 2023 23:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbjEVVS3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 May 2023 17:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbjEVVS2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2023 17:18:28 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986ADC6;
        Mon, 22 May 2023 14:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684790307; x=1716326307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CdbwOlXNCEB2KHd8npPp73hSzfS0N1Vy96GTktSop4s=;
  b=BfXKp3hdhVTjWwt0SXAgAIue+lWUZXGooKE2I7nBZ487k6tLEjleK3ro
   stA2i8UCcTJbcBJdxbDJNX4t1n0RYx44Sp7svHpa3lxyTGlH+qPtg9SJg
   GqGkdximaCiXlbS1pCp+8QTHvUCJWM9WtaQkJ2wp76ZCmPaOWCiqIPm9q
   mcXjuGh6wSolPCpyY6aLBV/085T45VooJJsaexm0mP6VlJlPI4Rnb0I9S
   3qitWInY8jWRtIC5S8neADv2ld8P2JfaH25Y3+JQaeAL2HCyDBJ49DVKt
   AUekjnMfNcz1YUIEXzm/s8Y3BdxLIberddsXfmt2Mm7P9rShmz4PkqiCg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="337633725"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="337633725"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 14:18:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="815841346"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="815841346"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 22 May 2023 14:18:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1q1Cv9-000EqS-1U;
        Tue, 23 May 2023 00:18:23 +0300
Date:   Tue, 23 May 2023 00:18:23 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pinctrl: at91: fix a couple NULL vs IS_ERR() checks
Message-ID: <ZGvcH06N8XI2sG3U@smile.fi.intel.com>
References: <5697980e-f687-47a7-9db8-2af34ae464bd@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5697980e-f687-47a7-9db8-2af34ae464bd@kili.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 22, 2023 at 10:44:54AM +0300, Dan Carpenter wrote:
> The devm_kasprintf_strarray() function doesn't return NULL on error,
> it returns error pointers.  Update the checks accordingly.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Thanks!

> Fixes: f494c1913cbb ("pinctrl: at91: use devm_kasprintf() to avoid potential leaks (part 2)")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/pinctrl/pinctrl-at91.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> index 871209c24153..39956d821ad7 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -1389,8 +1389,8 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
>  		char **names;
>  
>  		names = devm_kasprintf_strarray(dev, "pio", MAX_NB_GPIO_PER_BANK);
> -		if (!names)
> -			return -ENOMEM;
> +		if (IS_ERR(names))
> +			return PTR_ERR(names);
>  
>  		for (j = 0; j < MAX_NB_GPIO_PER_BANK; j++, k++) {
>  			char *name = names[j];
> @@ -1870,8 +1870,8 @@ static int at91_gpio_probe(struct platform_device *pdev)
>  	}
>  
>  	names = devm_kasprintf_strarray(dev, "pio", chip->ngpio);
> -	if (!names)
> -		return -ENOMEM;
> +	if (IS_ERR(names))
> +		return PTR_ERR(names);
>  
>  	for (i = 0; i < chip->ngpio; i++)
>  		strreplace(names[i], '-', alias_idx + 'A');
> -- 
> 2.39.2
> 

-- 
With Best Regards,
Andy Shevchenko


