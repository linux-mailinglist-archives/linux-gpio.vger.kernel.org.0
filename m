Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4049C455FCE
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 16:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232713AbhKRPtq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 10:49:46 -0500
Received: from mga04.intel.com ([192.55.52.120]:50682 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232712AbhKRPto (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Nov 2021 10:49:44 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="232927708"
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="232927708"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 07:44:34 -0800
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="536733885"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 07:44:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mnjaM-008DOj-4f;
        Thu, 18 Nov 2021 17:44:26 +0200
Date:   Thu, 18 Nov 2021 17:44:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] gpiolib: improve coding style for local variables
Message-ID: <YZZ02ZgjyhAiQtqb@smile.fi.intel.com>
References: <20211118132317.15898-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118132317.15898-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 02:23:16PM +0100, Bartosz Golaszewski wrote:
> Drop unneeded whitespaces and put the variables of the same type
> together for consistency with the rest of the code.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index abfbf546d159..20d63028b85c 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -594,11 +594,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>  			       struct lock_class_key *request_key)
>  {
>  	struct fwnode_handle *fwnode = gc->parent ? dev_fwnode(gc->parent) : NULL;
> -	unsigned long	flags;
> -	int		ret = 0;
> -	unsigned	i;
> -	int		base = gc->base;
> +	int ret = 0, base = gc->base;
>  	struct gpio_device *gdev;
> +	unsigned long flags;
> +	unsigned int i;
>  
>  	/*
>  	 * First: allocate and populate the internal stat container, and
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


