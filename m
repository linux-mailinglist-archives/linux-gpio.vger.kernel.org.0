Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5CC86B92B
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2019 11:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbfGQJ2L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jul 2019 05:28:11 -0400
Received: from mga06.intel.com ([134.134.136.31]:37187 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbfGQJ2K (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jul 2019 05:28:10 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jul 2019 02:28:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,273,1559545200"; 
   d="scan'208";a="169510654"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga007.fm.intel.com with ESMTP; 17 Jul 2019 02:28:09 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hngEK-0002O2-1x; Wed, 17 Jul 2019 12:28:08 +0300
Date:   Wed, 17 Jul 2019 12:28:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2] gpio: of: Break out OF-only code
Message-ID: <20190717092808.GR9224@smile.fi.intel.com>
References: <20190717071001.3858-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717071001.3858-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 17, 2019 at 09:10:01AM +0200, Linus Walleij wrote:
> The core gpiolib should not contain any OF/device tree-only
> code. Try to break out the main part of it and push it down
> into the optional gpiolib-of.c part of the library.
> 
> Create a local gpiolib-of.h header and move stuff around a
> bit to get a clean cut.

Are you going to split ACPI parts as well (at least to a header)?

One nit to address below (sorry, didn't notice before), and take mine
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> -static int gpiochip_alloc_valid_mask(struct gpio_chip *gpiochip)
> +static int gpiochip_alloc_valid_mask(struct gpio_chip *gc)
>  {
> -#ifdef CONFIG_OF_GPIO
> -	int size;
> -	struct device_node *np = gpiochip->of_node;
> -
> -	size = of_property_count_u32_elems(np,  "gpio-reserved-ranges");
> -	if (size > 0 && size % 2 == 0)
> -		gpiochip->need_valid_mask = true;
> -#endif
> -
> -	if (!gpiochip->need_valid_mask)
> +	if (IS_ENABLED(CONFIG_OF_GPIO))
> +		gc->need_valid_mask = of_gpio_need_valid_mask(gc);

		gpiochip->need_valid_mask = of_gpio_need_valid_mask(gpiochip);

Even with full name it fits 80.
Can you drop renaming here?

> +	if (!gc->need_valid_mask)
>  		return 0;
>  
> -	gpiochip->valid_mask = gpiochip_allocate_mask(gpiochip);
> -	if (!gpiochip->valid_mask)
> +	gc->valid_mask = gpiochip_allocate_mask(gc);
> +	if (!gc->valid_mask)
>  		return -ENOMEM;

-- 
With Best Regards,
Andy Shevchenko


