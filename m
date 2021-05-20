Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3CF6389F72
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 10:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhETII0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 04:08:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:34384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229536AbhETIIZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 04:08:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E629161001;
        Thu, 20 May 2021 08:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621498024;
        bh=id6zAme7GZs+vo1M9ZM5itNDYSCzHpFKTmIcfoA3cTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qz6yu606BkTLg2CBE/zXqSojnuYgGi7sXgRjuIyIdsvGDfjuWaZ56YdOsBJSmoE6P
         NDtEFkNp0jNa15E+3PyS/4/rZiK5efJcyMLE/6o8CokA9aQug9jW9VX0+TXD1XWi+s
         DvXi69cxs/VYtfw/AADmqJAQQZBFry6oePkkAMYR3ssXMUP1KJEF3YntgOd/BZwk9A
         vYvh4NaKvSHKJs0SCkgK/ghsyfWbrM1r3bIdLq9k6jKMz+h3ClonJfgzEGxAAVdlgn
         n7l/NeXB0cKngPFOCPMtdA/cd3MkF8+PnKefpLvsh4DrYBEiluOSe3Y3I+BxmEh+AE
         Sq4DvoqkcMx6Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ljdhv-0001oS-At; Thu, 20 May 2021 10:07:04 +0200
Date:   Thu, 20 May 2021 10:07:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpiolib: Introduce for_each_gpio_desc_if() macro
Message-ID: <YKYYp6Z4HAYHLaFz@hovoldconsulting.com>
References: <20210518083339.23416-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518083339.23416-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 18, 2021 at 11:33:39AM +0300, Andy Shevchenko wrote:
> In a few places we are using a loop against all GPIO descriptors
> with a given flag for a given device. Replace it with a consolidated
> for_each type of macro.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: fixed compilation issue (LKP), injected if (test_bit) into the loop
>  drivers/gpio/gpiolib-of.c    | 10 ++++------
>  drivers/gpio/gpiolib-sysfs.c |  7 ++-----
>  drivers/gpio/gpiolib.c       |  7 +++----
>  drivers/gpio/gpiolib.h       |  7 +++++++
>  4 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index bbcc7c073f63..2f8f3f0c8373 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -711,14 +711,12 @@ static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
>  static void of_gpiochip_remove_hog(struct gpio_chip *chip,
>  				   struct device_node *hog)
>  {
> -	struct gpio_desc *descs = chip->gpiodev->descs;
> +	struct gpio_desc *desc;
>  	unsigned int i;
>  
> -	for (i = 0; i < chip->ngpio; i++) {
> -		if (test_bit(FLAG_IS_HOGGED, &descs[i].flags) &&
> -		    descs[i].hog == hog)
> -			gpiochip_free_own_desc(&descs[i]);
> -	}
> +	for_each_gpio_desc_if(i, chip, desc, FLAG_IS_HOGGED)
> +		if (desc->hog == hog)
> +			gpiochip_free_own_desc(desc);

The _if suffix here is too vague.

Please use a more descriptive name so that you don't need to look at the
implementation to understand what the macro does.

Perhaps call it 

	for_each_gpio_desc_with_flag()

or just add the more generic macro 

	for_each_gpio_desc()

and open-code the test so that it's clear what's going on here.

>  struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc, unsigned int hwnum);
> +
> +#define for_each_gpio_desc_if(i, gc, desc, flag)		\
> +	for (i = 0, desc = gpiochip_get_desc(gc, i);		\
> +	     i < gc->ngpio;					\
> +	     i++, desc = gpiochip_get_desc(gc, i))		\
> +		if (!test_bit(flag, &desc->flags)) {} else
> +
>  int gpiod_get_array_value_complex(bool raw, bool can_sleep,
>  				  unsigned int array_size,
>  				  struct gpio_desc **desc_array,

Johan
