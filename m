Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 743BD62F28A
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 11:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241681AbiKRK2j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 05:28:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241626AbiKRK2i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 05:28:38 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5021FAC0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 02:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668767317; x=1700303317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BjJaT9KH1hVKPq0KUozHfuFawA/Z1h6VdgQFky1l/vQ=;
  b=LAoRm5g2gJSdqsY0IIPepwBVgUrzYwTTRfu+g2lyl2cLkexAwkOY6hWL
   I7qW5jqpvoShhZaXcEsya2La0gvwo3hYR1SJqx3YABZFu0kG8gWoN4Lfz
   0a8vd/P/XLjfx29FvxGBaCyi+U6qMYJ6X6QJWK5onCnbLRWrZtq2dVAz+
   dAjxRBFb5Jo4NS6IoheUdcqFmhqmqxb0dvcc5a/l6pOIhT5nkadK/LpeX
   veNWb276WGlJofHPsy8BhKoOgxdINMPu0z19hTthaWZlrjvWRlnOz5Q9K
   zeED4ynpCNY7uztq/gfuvIm5L/ZTprpy7/Mqd/vQSwBKc8iaS1SHvRmPN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="293497216"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; 
   d="scan'208";a="293497216"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2022 02:28:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="673155814"
X-IronPort-AV: E=Sophos;i="5.96,173,1665471600"; 
   d="scan'208";a="673155814"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 18 Nov 2022 02:28:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1ovybl-00Dznt-2i;
        Fri, 18 Nov 2022 12:28:29 +0200
Date:   Fri, 18 Nov 2022 12:28:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Zeng Heng <zengheng4@huawei.com>
Cc:     brgl@bgdev.pl, linux@roeck-us.net, linus.walleij@linaro.org,
        warthog618@gmail.com, linux-gpio@vger.kernel.org,
        liwei391@huawei.com
Subject: Re: [PATCH v4] gpiolib: fix memory leak in gpiochip_setup_dev()
Message-ID: <Y3deTZkdGtWLhtIG@smile.fi.intel.com>
References: <Y3ZT6KUkPlSS7whW@smile.fi.intel.com>
 <20221118022236.871576-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118022236.871576-1-zengheng4@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 18, 2022 at 10:22:36AM +0800, Zeng Heng wrote:
> Here is a backtrace report about memory leak detected in
> gpiochip_setup_dev():
> 
> unreferenced object 0xffff88810b406400 (size 512):
>   comm "python3", pid 1682, jiffies 4295346908 (age 24.090s)
>   backtrace:
>     kmalloc_trace
>     device_add 		device_private_init at drivers/base/core.c:3361

You missed my comment here about extra space.

> 			(inlined by) device_add at drivers/base/core.c:3411
>     cdev_device_add
>     gpiolib_cdev_register
>     gpiochip_setup_dev
>     gpiochip_add_data_with_key
> 
> gcdev_register() & gcdev_unregister() would call device_add() &
> device_del() (no matter CONFIG_GPIO_CDEV is enabled or not) to
> register/unregister device.
> 
> However, if device_add() succeeds, some resource (like
> struct device_private allocated by device_private_init())
> is not released by device_del().
> 
> Therefore, after device_add() succeeds by gcdev_register(), it
> needs to call put_device() to release resource in the error handle
> path.
> 
> Here we move forward the register of release function, and let it
> release every piece of resource by put_device() instead of kfree().

...

> +static void gpiochip_print_register_fail(struct gpio_chip *gc,
> +					 struct gpio_device *gdev,
> +					 const char *func, int ret)
> +{
> +	/* failures here can mean systems won't boot... */
> +	if (ret != -EPROBE_DEFER) {

Wouldn't the following work better?

	if (ret == -EPROBE_DEFER)
		return;

	/* failures here can mean systems won't boot... */
	pr_err(...);

> +		pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", func,
> +			gdev->base, gdev->base + gdev->ngpio - 1,
> +			gc->label ? : "generic", ret);
> +	}
> +}

...

>  err_free_gpiochip_mask:
>  	gpiochip_remove_pin_ranges(gc);
>  	gpiochip_free_valid_mask(gc);
> +	if (gdev->dev.release) {

> +		/* release() has been registered by gpiochip_setup_dev() */

This comment is most probably in a wrong line and should be one line below.

> +		gpiochip_print_register_fail(gc, gdev, __func__, ret);
> +		put_device(&gdev->dev);
> +		return ret;
> +	}

...

>  err_free_gdev:
> -	/* failures here can mean systems won't boot... */
> -	if (ret != -EPROBE_DEFER) {
> -		pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
> -		       gdev->base, gdev->base + gdev->ngpio - 1,
> -		       gc->label ? : "generic", ret);
> -	}
> +	gpiochip_print_register_fail(gc, gdev, __func__, ret);
>  	kfree(gdev);
>  	return ret;

Now it looks cleaner, but why you can't use the same return point with the
message? What you need is to neep the range on the stack (which is almost there).

...

Okay, let's leave this for a while, I will think how it can be improved and then
I come up with particular suggestions.

-- 
With Best Regards,
Andy Shevchenko


