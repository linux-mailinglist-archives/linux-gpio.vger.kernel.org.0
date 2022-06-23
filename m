Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B819555772C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 11:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbiFWJym (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 05:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiFWJyl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 05:54:41 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D806D2B27E;
        Thu, 23 Jun 2022 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655978080; x=1687514080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s9GG/sY6wixWx6Kt3EOgPjnu6ifIHWLBKr6/jZ+J2kc=;
  b=IITV4DWRuYjDMX+DzJYsiSTcYCDNqm2xHBdymjGRcv/DW/n/dgKOGnHx
   DUnrO3nAFsN96lba2guO0wGPJruWZ9aj7fDkLWj6kXDA/xadvSpW+hDeE
   4qb/3h+7eoZIbl/HnJXDHW0mnuWt/kJIG5XGeaDnEXYg0RXpcCG45hKgZ
   UkJo9LD/oyESJXFE8z/hZD3bql3348j152X3nYQH5ZYYcWY0ScVoaq5Kd
   egAWPCQ8Wnf3VaFB0CwKeY4rNSelZXlI5PQLGXcuO8ZaDtwWk3cwaIKSJ
   fpWRuBu+Pn/D4GZ74OagS6fxk0IVtMT2Iaz9QFnAcUr9L2sqXp+Emh+Od
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="306136383"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="306136383"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 02:54:40 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="563387365"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 02:54:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o4JXn-000t1W-Hf;
        Thu, 23 Jun 2022 12:54:35 +0300
Date:   Thu, 23 Jun 2022 12:54:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] gpio: winbond: Fix error code in winbond_gpio_get()
Message-ID: <YrQ4WwSzhpai0aPc@smile.fi.intel.com>
References: <YrQkfBuIHArxHSNr@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrQkfBuIHArxHSNr@kili>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 23, 2022 at 11:29:48AM +0300, Dan Carpenter wrote:
> This error path returns 1, but it should instead propagate the negative
> error code from winbond_sio_enter().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: a0d65009411c ("gpio: winbond: Add driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpio/gpio-winbond.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-winbond.c b/drivers/gpio/gpio-winbond.c
> index 7f8f5b02e31d..4b61d975cc0e 100644
> --- a/drivers/gpio/gpio-winbond.c
> +++ b/drivers/gpio/gpio-winbond.c
> @@ -385,12 +385,13 @@ static int winbond_gpio_get(struct gpio_chip *gc, unsigned int offset)
>  	unsigned long *base = gpiochip_get_data(gc);
>  	const struct winbond_gpio_info *info;
>  	bool val;
> +	int ret;
>  
>  	winbond_gpio_get_info(&offset, &info);
>  
> -	val = winbond_sio_enter(*base);
> -	if (val)
> -		return val;
> +	ret = winbond_sio_enter(*base);
> +	if (ret)
> +		return ret;
>  
>  	winbond_sio_select_logical(*base, info->dev);
>  
> -- 
> 2.35.1
> 

-- 
With Best Regards,
Andy Shevchenko


