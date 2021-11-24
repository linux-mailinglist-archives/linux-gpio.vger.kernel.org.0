Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E6E45C7ED
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 15:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354231AbhKXOuU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 09:50:20 -0500
Received: from mga06.intel.com ([134.134.136.31]:42313 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1354130AbhKXOuQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Nov 2021 09:50:16 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="296094983"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; 
   d="scan'208";a="296094983"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 06:47:03 -0800
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; 
   d="scan'208";a="475289889"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 06:47:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mptY2-00A8S9-NF;
        Wed, 24 Nov 2021 16:46:58 +0200
Date:   Wed, 24 Nov 2021 16:46:58 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] gpiolib: check the 'ngpios' property in core
 gpiolib code
Message-ID: <YZ5QYsu2ed5FiSWE@smile.fi.intel.com>
References: <20211124122850.7095-1-brgl@bgdev.pl>
 <20211124122850.7095-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124122850.7095-2-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 24, 2021 at 01:28:50PM +0100, Bartosz Golaszewski wrote:
> Several drivers read the 'ngpios' device property on their own, but
> since it's defined as a standard GPIO property in the device tree bindings
> anyway, it's a good candidate for generalization. If the driver didn't
> set its gc->ngpio, try to read the 'ngpios' property from the GPIO
> device's firmware node before bailing out.

> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> v1 -> v2:
> - use device_property_read_u32() instead of fwnode_property_read_u32()
> - reverse the error check logic
> 
> v2 -> v3:
> - don't shadow errors other than -ENODATA in device_property_read_u32()
> 
>  drivers/gpio/gpiolib.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ede8b8a7aa18..f79fd2551cf7 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -599,6 +599,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>  	int base = gc->base;
>  	unsigned int i;
>  	int ret = 0;
> +	u32 ngpios;
>  
>  	/*
>  	 * First: allocate and populate the internal stat container, and
> @@ -647,9 +648,17 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>  	}

>  	if (gc->ngpio == 0) {
> -		chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> -		ret = -EINVAL;
> -		goto err_free_descs;
> +		ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> +		if (ret) {
> +			if (ret == -ENODATA) {
> +				chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> +				ret = -EINVAL;
> +			}
> +
> +			goto err_free_descs;
> +		}

And if the property returns 0 in ngpios?

What about the modified suggestion from previous version:

	if (gc->ngpio == 0) {
		ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
		/*
		 * -ENODATA means that there is no property found and
		 * we want to issue the error message to the user. Besides
		 * that, we want to return different error code to state
		 * that supplied value is not valid.
		 */
		if (ret == -ENODATA)
			ngpios = 0;
		else if (ret)
			return ret;

		gc->ngpio = ngpios;
	}

	if (gc->ngpio == 0) {
		chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
		ret = -EINVAL;
		goto err_free_descs;
	}

?

> +		gc->ngpio = ngpios;
>  	}
>  
>  	if (gc->ngpio > FASTPATH_NGPIO)
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


