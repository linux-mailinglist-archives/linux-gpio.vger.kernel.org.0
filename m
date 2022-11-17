Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB7F562D864
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 11:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234669AbiKQKuC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 05:50:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239133AbiKQKuA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 05:50:00 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3925813F61
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 02:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668682200; x=1700218200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2y5lpAFVDJfbF80va10vU9Mj/p06ATOdbWbWYJeTcBM=;
  b=JasQra0ixyjAlrswYo3/S6Ia9bfa+DB/vW8HGKtqsO9WPvg2Jqsc9Dno
   Xz1sG+o1wPOCBbPGaN2auKixDPrds3Zx75Xtuv3s91A/Lr1WOoAkKNDv4
   zPl2xNqEBf0lnddbG6byoR/mvOOtr9+qAmoj/ve+5CKT1pldEOO2wyB1e
   XYq6Vol773LYu+Gv8Sp+jCNb4rJ2G3TskmJkIjUCU7vL73YzasDlX0u8k
   Jf+/7GekkCpIkDxUk0nQKZ12NLsElJBsnHJl5Y59TVJJU0VEKUA5ABvjF
   yLdwmf0amWOYDlOALzpD7oC7gENZ32mxvRDdxuPfJU3PXXRD3a4sil87r
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="313968303"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="313968303"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 02:49:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="728779485"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="728779485"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Nov 2022 02:49:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1ovcSw-00DXPT-1q;
        Thu, 17 Nov 2022 12:49:54 +0200
Date:   Thu, 17 Nov 2022 12:49:54 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Zeng Heng <zengheng4@huawei.com>
Cc:     brgl@bgdev.pl, linux@roeck-us.net, linus.walleij@linaro.org,
        warthog618@gmail.com, linux-gpio@vger.kernel.org,
        liwei391@huawei.com
Subject: Re: [PATCH v3] gpiolib: fix memory leak in gpiochip_setup_dev()
Message-ID: <Y3YR0rBSWHu5WhfL@smile.fi.intel.com>
References: <f118d0b1-1bf2-b710-c3b4-2745c72f02b3@huawei.com>
 <20221117090247.122980-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117090247.122980-1-zengheng4@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 17, 2022 at 05:02:47PM +0800, Zeng Heng wrote:
> Here is a report about memory leak detected in gpiochip_setup_dev():
> 
> unreferenced object 0xffff88810b406400 (size 512):
>   comm "python3", pid 1682, jiffies 4295346908 (age 24.090s)
>   backtrace:
>     kmalloc_trace
>     device_add 		device_private_init at drivers/base/core.c:3361

Seems like unneeded space after device_add. Also note, we refer to
the functions as func().

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
> 
> Fixes: 159f3cd92f17 ("gpiolib: Defer gpio device setup until after gpiolib initialization")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---

Where is changelog since we see this as v3?

...

>  err_free_gpiochip_mask:
>  	gpiochip_remove_pin_ranges(gc);
>  	gpiochip_free_valid_mask(gc);
> +	/*
> +	 * If gdev->dev.release has been registered by
> +	 * gpiochip_setup_dev(), print err msg and
> +	 * call put_device() to release all.
> +	 */
> +	if (gdev->dev.release)
> +		goto err_free_gdev;

(1)

>  err_remove_from_list:
>  	spin_lock_irqsave(&gpio_lock, flags);
>  	list_del(&gdev->list);

...

> -	kfree(gdev);

> +	if (gdev->dev.release)
> +		put_device(&gdev->dev);

Why you can't do this above at (1)?
Is there any other hidden way to get here with release set?

> +	else
> +		kfree(gdev);
>  	return ret;

-- 
With Best Regards,
Andy Shevchenko


