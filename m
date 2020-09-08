Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D27261736
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 19:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731810AbgIHR2Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 13:28:24 -0400
Received: from mga01.intel.com ([192.55.52.88]:4217 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731715AbgIHQQW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Sep 2020 12:16:22 -0400
IronPort-SDR: TxPoHQfAnCF44btYfNAdQr+nDHxb8GZxdL1bMW3UyVEyrxW+mRkY6gMD4jzkDad6wI/cgWQ8sj
 nip2iAAflY9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="176183609"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="176183609"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 06:49:48 -0700
IronPort-SDR: EE1FhTZi6ME/V9j17PG5lGjFOgXCqdwuuvE4gN5Bd70E2i+arsePUQFkObp4QM5EI0+fNbFIt9
 rgnFi1Ov6STQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="333478724"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 08 Sep 2020 06:49:46 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kFdy9-00FDZZ-Ef; Tue, 08 Sep 2020 16:47:33 +0300
Date:   Tue, 8 Sep 2020 16:47:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpiolib: switch to simpler IDA interface
Message-ID: <20200908134733.GA1891694@smile.fi.intel.com>
References: <20200908131225.10870-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908131225.10870-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 08, 2020 at 03:12:25PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We don't need to specify any ranges when allocating IDs so we can switch
> to ida_alloc() and ida_free() instead of the ida_simple_ counterparts.
> 
> ida_simple_get(ida, 0, 0, gfp) is equivalent to
> ida_alloc_range(ida, 0, UINT_MAX, gfp) which is equivalent to
> ida_alloc(ida, gfp). Note: IDR will never actually allocate an ID
> larger than INT_MAX.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpiolib.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 80137c1b3cdc..97f76334ec7e 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -426,7 +426,7 @@ static void gpiodevice_release(struct device *dev)
>  	struct gpio_device *gdev = dev_get_drvdata(dev);
>  
>  	list_del(&gdev->list);
> -	ida_simple_remove(&gpio_ida, gdev->id);
> +	ida_free(&gpio_ida, gdev->id);
>  	kfree_const(gdev->label);
>  	kfree(gdev->descs);
>  	kfree(gdev);
> @@ -537,7 +537,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>  		gc->of_node = gdev->dev.of_node;
>  #endif
>  
> -	gdev->id = ida_simple_get(&gpio_ida, 0, 0, GFP_KERNEL);
> +	gdev->id = ida_alloc(&gpio_ida, GFP_KERNEL);
>  	if (gdev->id < 0) {
>  		ret = gdev->id;
>  		goto err_free_gdev;
> @@ -705,7 +705,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>  err_free_descs:
>  	kfree(gdev->descs);
>  err_free_ida:
> -	ida_simple_remove(&gpio_ida, gdev->id);
> +	ida_free(&gpio_ida, gdev->id);
>  err_free_gdev:
>  	/* failures here can mean systems won't boot... */
>  	pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
> -- 
> 2.26.1
> 

-- 
With Best Regards,
Andy Shevchenko


