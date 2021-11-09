Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8DE744AB90
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 11:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241776AbhKIKfb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 05:35:31 -0500
Received: from mga09.intel.com ([134.134.136.24]:25292 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242417AbhKIKfa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 05:35:30 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="232264040"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="232264040"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 02:32:45 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="533643415"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 02:32:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mkOQY-0053Ad-If;
        Tue, 09 Nov 2021 12:32:30 +0200
Date:   Tue, 9 Nov 2021 12:32:30 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] gpiolib: remove gpio_to_chip
Message-ID: <YYpOPs+/RuUq+ld8@smile.fi.intel.com>
References: <20211109100207.2474024-1-arnd@kernel.org>
 <20211109100207.2474024-8-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109100207.2474024-8-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 09, 2021 at 11:02:06AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There are only two callers of this helper, remove them by
> open-coding the call to the gpiod version.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/pinctrl/core.c    | 5 ++---
>  drivers/soc/fsl/qe/gpio.c | 4 +---
>  include/linux/gpio.h      | 7 -------
>  3 files changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 976607758e98..8d3c00782178 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -28,7 +28,6 @@

>  #ifdef CONFIG_GPIOLIB

I'm wondering if we need this ifdeffery at all.

>  #include "../gpio/gpiolib.h"
> -#include <linux/gpio.h>
>  #endif
>  
>  #include "core.h"
> @@ -324,7 +323,7 @@ static bool pinctrl_ready_for_gpio_range(unsigned gpio)
>  {
>  	struct pinctrl_dev *pctldev;
>  	struct pinctrl_gpio_range *range = NULL;
> -	struct gpio_chip *chip = gpio_to_chip(gpio);
> +	struct gpio_chip *chip = gpiod_to_chip(gpio_to_desc(gpio));
>  
>  	if (WARN(!chip, "no gpio_chip for gpio%i?", gpio))
>  		return false;
> @@ -1657,7 +1656,7 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
>  			}
>  		}
>  		if (gpio_num >= 0)
> -			chip = gpio_to_chip(gpio_num);
> +			chip = gpiod_to_chip(gpio_to_desc(gpio_num));
>  		else
>  			chip = NULL;
>  		if (chip)
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index 99f7de43c3c6..a6aa55055e9a 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -15,8 +15,6 @@
>  #include <linux/of.h>
>  #include <linux/of_gpio.h>
>  #include <linux/gpio/driver.h>
> -/* FIXME: needed for gpio_to_chip() get rid of this */
> -#include <linux/gpio.h>
>  #include <linux/slab.h>
>  #include <linux/export.h>
>  #include <soc/fsl/qe/qe.h>
> @@ -173,7 +171,7 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
>  	err = of_get_gpio(np, index);
>  	if (err < 0)
>  		goto err0;
> -	gc = gpio_to_chip(err);
> +	gc = gpiod_to_chip(gpio_to_desc(err));
>  	if (WARN_ON(!gc)) {
>  		err = -ENODEV;
>  		goto err0;
> diff --git a/include/linux/gpio.h b/include/linux/gpio.h
> index 7ceb93678689..61fb427b4e70 100644
> --- a/include/linux/gpio.h
> +++ b/include/linux/gpio.h
> @@ -96,12 +96,6 @@ static inline bool gpio_is_valid(int number)
>  
>  struct device;
>  
> -/* caller holds gpio_lock *OR* gpio is marked as requested */
> -static inline struct gpio_chip *gpio_to_chip(unsigned gpio)
> -{
> -	return gpiod_to_chip(gpio_to_desc(gpio));
> -}
> -
>  /* Always use the library code for GPIO management calls,
>   * or when sleeping may be involved.
>   */
> @@ -158,7 +152,6 @@ int devm_gpio_request_one(struct device *dev, unsigned gpio,
>  #include <linux/bug.h>
>  
>  struct device;
> -struct gpio_chip;
>  
>  static inline bool gpio_is_valid(int number)
>  {
> -- 
> 2.29.2
> 

-- 
With Best Regards,
Andy Shevchenko


