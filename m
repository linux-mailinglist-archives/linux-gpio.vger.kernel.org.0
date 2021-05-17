Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05CE53825EA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 09:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235246AbhEQH5D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 03:57:03 -0400
Received: from mga03.intel.com ([134.134.136.65]:50789 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235027AbhEQH5D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 May 2021 03:57:03 -0400
IronPort-SDR: KAMnd1YtSwBbjCYa5z7VdkF8NM+fl1pnSglzntDVif5JELZ7254yqmnhtfcmz8mjgINsFBejOK
 wigoqYb1xVmg==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="200459838"
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; 
   d="scan'208";a="200459838"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 00:55:47 -0700
IronPort-SDR: HnOoOAmNEhEepcKBwbvROy/NWVLdQ0LtDAXMc4EIB22l/Zf0wu2bLkAPhFkuRq4eb4UjrSLh95
 KUCERN4XulUA==
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; 
   d="scan'208";a="438794044"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 00:55:45 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1liY6H-00Cgtx-Kj; Mon, 17 May 2021 10:55:41 +0300
Date:   Mon, 17 May 2021 10:55:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        andy@kernel.org
Subject: Re: [PATCH] gpio: gpio-crystalcove: remove platform_set_drvdata() +
 cleanup probe
Message-ID: <YKIhfQg5mV7dQZRC@smile.fi.intel.com>
References: <20210514093226.22703-1-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514093226.22703-1-aardelean@deviqon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 14, 2021 at 12:32:26PM +0300, Alexandru Ardelean wrote:
> The platform_set_drvdata() call is only useful if we need to retrieve back
> the private information.
> Since the driver doesn't do that, it's not useful to have it.
> 
> If this is removed, we can also just do a direct return on
> devm_gpiochip_add_data(). We don't need to print that this call failed as
> there are other ways to log/see this during probe.

Pushed to my review and testing queue, thanks!

> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> ---
>  drivers/gpio/gpio-crystalcove.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
> index 2ba225720086..5a909f3c79e8 100644
> --- a/drivers/gpio/gpio-crystalcove.c
> +++ b/drivers/gpio/gpio-crystalcove.c
> @@ -339,8 +339,6 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
>  	if (!cg)
>  		return -ENOMEM;
>  
> -	platform_set_drvdata(pdev, cg);
> -
>  	mutex_init(&cg->buslock);
>  	cg->chip.label = KBUILD_MODNAME;
>  	cg->chip.direction_input = crystalcove_gpio_dir_in;
> @@ -372,13 +370,7 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
>  		return retval;
>  	}
>  
> -	retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
> -	if (retval) {
> -		dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
> -		return retval;
> -	}
> -
> -	return 0;
> +	return devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
>  }
>  
>  static struct platform_driver crystalcove_gpio_driver = {
> -- 
> 2.31.1
> 

-- 
With Best Regards,
Andy Shevchenko


