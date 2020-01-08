Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A48FF1341F6
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 13:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbgAHMlx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 07:41:53 -0500
Received: from mga09.intel.com ([134.134.136.24]:3916 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbgAHMlx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Jan 2020 07:41:53 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 04:41:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,409,1571727600"; 
   d="scan'208";a="246332130"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 08 Jan 2020 04:41:50 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ipAel-0002u1-AL; Wed, 08 Jan 2020 14:41:51 +0200
Date:   Wed, 8 Jan 2020 14:41:51 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 11/13] gpiolib: provide a dedicated function for
 setting lineinfo
Message-ID: <20200108124151.GQ32742@smile.fi.intel.com>
References: <20191224120709.18247-1-brgl@bgdev.pl>
 <20191224120709.18247-12-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191224120709.18247-12-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 24, 2019 at 01:07:07PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We'll soon be filling out the gpioline_info structure in multiple
> places. Add a separate function that given a gpio_desc sets all relevant
> fields.
> 

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpiolib.c | 98 ++++++++++++++++++++++++------------------
>  1 file changed, 55 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 543244355e1c..276a7068f23c 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1148,6 +1148,60 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
>  	return ret;
>  }
>  
> +static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
> +				  struct gpioline_info *info)
> +{
> +	struct gpio_chip *chip = desc->gdev->chip;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&gpio_lock, flags);
> +
> +	if (desc->name) {
> +		strncpy(info->name, desc->name, sizeof(info->name));
> +		info->name[sizeof(info->name) - 1] = '\0';
> +	} else {
> +		info->name[0] = '\0';
> +	}
> +
> +	if (desc->label) {
> +		strncpy(info->consumer, desc->label, sizeof(info->consumer));
> +		info->consumer[sizeof(info->consumer) - 1] = '\0';
> +	} else {
> +		info->consumer[0] = '\0';
> +	}
> +
> +	/*
> +	 * Userspace only need to know that the kernel is using this GPIO so
> +	 * it can't use it.
> +	 */
> +	info->flags = 0;
> +	if (test_bit(FLAG_REQUESTED, &desc->flags) ||
> +	    test_bit(FLAG_IS_HOGGED, &desc->flags) ||
> +	    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
> +	    test_bit(FLAG_EXPORT, &desc->flags) ||
> +	    test_bit(FLAG_SYSFS, &desc->flags) ||
> +	    !pinctrl_gpio_can_use_line(chip->base + info->line_offset))
> +		info->flags |= GPIOLINE_FLAG_KERNEL;
> +	if (test_bit(FLAG_IS_OUT, &desc->flags))
> +		info->flags |= GPIOLINE_FLAG_IS_OUT;
> +	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
> +		info->flags |= GPIOLINE_FLAG_ACTIVE_LOW;
> +	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
> +		info->flags |= (GPIOLINE_FLAG_OPEN_DRAIN |
> +				GPIOLINE_FLAG_IS_OUT);
> +	if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
> +		info->flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
> +				GPIOLINE_FLAG_IS_OUT);
> +	if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
> +		info->flags |= GPIOLINE_FLAG_BIAS_DISABLE;
> +	if (test_bit(FLAG_PULL_DOWN, &desc->flags))
> +		info->flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
> +	if (test_bit(FLAG_PULL_UP, &desc->flags))
> +		info->flags |= GPIOLINE_FLAG_BIAS_PULL_UP;
> +
> +	spin_unlock_irqrestore(&gpio_lock, flags);
> +}
> +
>  /*
>   * gpio_ioctl() - ioctl handler for the GPIO chardev
>   */
> @@ -1188,49 +1242,7 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		if (IS_ERR(desc))
>  			return PTR_ERR(desc);
>  
> -		if (desc->name) {
> -			strncpy(lineinfo.name, desc->name,
> -				sizeof(lineinfo.name));
> -			lineinfo.name[sizeof(lineinfo.name)-1] = '\0';
> -		} else {
> -			lineinfo.name[0] = '\0';
> -		}
> -		if (desc->label) {
> -			strncpy(lineinfo.consumer, desc->label,
> -				sizeof(lineinfo.consumer));
> -			lineinfo.consumer[sizeof(lineinfo.consumer)-1] = '\0';
> -		} else {
> -			lineinfo.consumer[0] = '\0';
> -		}
> -
> -		/*
> -		 * Userspace only need to know that the kernel is using
> -		 * this GPIO so it can't use it.
> -		 */
> -		lineinfo.flags = 0;
> -		if (test_bit(FLAG_REQUESTED, &desc->flags) ||
> -		    test_bit(FLAG_IS_HOGGED, &desc->flags) ||
> -		    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
> -		    test_bit(FLAG_EXPORT, &desc->flags) ||
> -		    test_bit(FLAG_SYSFS, &desc->flags) ||
> -		    !pinctrl_gpio_can_use_line(chip->base + lineinfo.line_offset))
> -			lineinfo.flags |= GPIOLINE_FLAG_KERNEL;
> -		if (test_bit(FLAG_IS_OUT, &desc->flags))
> -			lineinfo.flags |= GPIOLINE_FLAG_IS_OUT;
> -		if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
> -			lineinfo.flags |= GPIOLINE_FLAG_ACTIVE_LOW;
> -		if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
> -			lineinfo.flags |= (GPIOLINE_FLAG_OPEN_DRAIN |
> -					   GPIOLINE_FLAG_IS_OUT);
> -		if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
> -			lineinfo.flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
> -					   GPIOLINE_FLAG_IS_OUT);
> -		if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
> -			lineinfo.flags |= GPIOLINE_FLAG_BIAS_DISABLE;
> -		if (test_bit(FLAG_PULL_DOWN, &desc->flags))
> -			lineinfo.flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
> -		if (test_bit(FLAG_PULL_UP, &desc->flags))
> -			lineinfo.flags |= GPIOLINE_FLAG_BIAS_PULL_UP;
> +		gpio_desc_to_lineinfo(desc, &lineinfo);
>  
>  		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
>  			return -EFAULT;
> -- 
> 2.23.0
> 

-- 
With Best Regards,
Andy Shevchenko


