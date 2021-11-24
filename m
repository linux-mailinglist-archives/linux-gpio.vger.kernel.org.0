Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0964945C78D
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 15:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350198AbhKXOjD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 09:39:03 -0500
Received: from mga09.intel.com ([134.134.136.24]:23471 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356120AbhKXOi6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Nov 2021 09:38:58 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="235106389"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; 
   d="scan'208";a="235106389"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 06:35:48 -0800
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; 
   d="scan'208";a="607204837"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 06:35:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mptN8-00A8FC-LU;
        Wed, 24 Nov 2021 16:35:42 +0200
Date:   Wed, 24 Nov 2021 16:35:42 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] gpiolib: improve coding style for local variables
Message-ID: <YZ5NvolYXei2qsBU@smile.fi.intel.com>
References: <20211124122850.7095-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124122850.7095-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 24, 2021 at 01:28:49PM +0100, Bartosz Golaszewski wrote:
> Drop unneeded whitespaces and put the variables of the same type
> together for consistency with the rest of the code.

I thought I gave my tag, nevermind, here we are
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> v1 -> v2:
> - keep initializations on separate lines
> 
>  drivers/gpio/gpiolib.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index abfbf546d159..ede8b8a7aa18 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -594,11 +594,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>  			       struct lock_class_key *request_key)
>  {
>  	struct fwnode_handle *fwnode = gc->parent ? dev_fwnode(gc->parent) : NULL;
> -	unsigned long	flags;
> -	int		ret = 0;
> -	unsigned	i;
> -	int		base = gc->base;
>  	struct gpio_device *gdev;
> +	unsigned long flags;
> +	int base = gc->base;
> +	unsigned int i;
> +	int ret = 0;
>  
>  	/*
>  	 * First: allocate and populate the internal stat container, and
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


