Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02EF844AB72
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 11:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245306AbhKIK1x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 05:27:53 -0500
Received: from mga12.intel.com ([192.55.52.136]:61631 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239354AbhKIK1w (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 05:27:52 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="212449406"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="212449406"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 02:25:04 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="451865754"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 02:25:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mkOJ7-00532k-4w;
        Tue, 09 Nov 2021 12:24:49 +0200
Date:   Tue, 9 Nov 2021 12:24:48 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] gpiolib: shrink further
Message-ID: <YYpMcKlcZ3JWqp5M@smile.fi.intel.com>
References: <20211109100207.2474024-1-arnd@kernel.org>
 <20211109100207.2474024-6-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109100207.2474024-6-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 09, 2021 at 11:02:04AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gpio_set_debounce() only has a single user, which is trivially
> converted to gpiod_set_debounce(), while gpio_cansleep() and
> devm_gpio_free() have no users at all.
> 
> Remove them all to shrink the old gpio interface.

A couple of nit-picks below.
In either case,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  .../driver-api/driver-model/devres.rst        |  1 -
>  Documentation/driver-api/gpio/legacy.rst      |  2 --
>  drivers/gpio/gpiolib-devres.c                 | 25 ----------------
>  drivers/input/touchscreen/ads7846.c           |  3 +-
>  include/linux/gpio.h                          | 29 -------------------
>  5 files changed, 2 insertions(+), 58 deletions(-)
> 
> diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
> index 148e19381b79..52821478decd 100644
> --- a/Documentation/driver-api/driver-model/devres.rst
> +++ b/Documentation/driver-api/driver-model/devres.rst
> @@ -277,7 +277,6 @@ GPIO
>    devm_gpiochip_add_data()
>    devm_gpio_request()
>    devm_gpio_request_one()
> -  devm_gpio_free()
>  
>  I2C
>    devm_i2c_new_dummy_device()
> diff --git a/Documentation/driver-api/gpio/legacy.rst b/Documentation/driver-api/gpio/legacy.rst
> index 06c05e2d62c1..eae185f771d7 100644
> --- a/Documentation/driver-api/gpio/legacy.rst
> +++ b/Documentation/driver-api/gpio/legacy.rst
> @@ -238,8 +238,6 @@ setup or driver probe/teardown code, so this is an easy constraint.)::
>          ## 	gpio_free_array()
>  
>                  gpio_free()
> -                gpio_set_debounce()
> -
>  

One more blank line removal?

>  
>  Claiming and Releasing GPIOs
> diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
> index 79da85d17b71..55465ead492f 100644
> --- a/drivers/gpio/gpiolib-devres.c
> +++ b/drivers/gpio/gpiolib-devres.c
> @@ -385,13 +385,6 @@ static void devm_gpio_release(struct device *dev, void *res)
>  	gpio_free(*gpio);
>  }
>  
> -static int devm_gpio_match(struct device *dev, void *res, void *data)
> -{
> -	unsigned *this = res, *gpio = data;
> -
> -	return *this == *gpio;
> -}
> -
>  /**
>   *      devm_gpio_request - request a GPIO for a managed device
>   *      @dev: device to request the GPIO for
> @@ -459,24 +452,6 @@ int devm_gpio_request_one(struct device *dev, unsigned gpio,
>  }
>  EXPORT_SYMBOL_GPL(devm_gpio_request_one);
>  
> -/**
> - *      devm_gpio_free - free a GPIO
> - *      @dev: device to free GPIO for
> - *      @gpio: GPIO to free
> - *
> - *      Except for the extra @dev argument, this function takes the
> - *      same arguments and performs the same function as gpio_free().
> - *      This function instead of gpio_free() should be used to manually
> - *      free GPIOs allocated with devm_gpio_request().
> - */
> -void devm_gpio_free(struct device *dev, unsigned int gpio)
> -{
> -
> -	WARN_ON(devres_release(dev, devm_gpio_release, devm_gpio_match,
> -		&gpio));
> -}
> -EXPORT_SYMBOL_GPL(devm_gpio_free);
> -
>  static void devm_gpio_chip_release(void *data)
>  {
>  	struct gpio_chip *gc = data;
> diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
> index a25a77dd9a32..d0664e3b89bb 100644
> --- a/drivers/input/touchscreen/ads7846.c
> +++ b/drivers/input/touchscreen/ads7846.c
> @@ -27,6 +27,7 @@
>  #include <linux/of.h>

>  #include <linux/of_gpio.h>

(1)

>  #include <linux/of_device.h>

> +#include <linux/gpio/consumer.h>

(2)

>  #include <linux/gpio.h>

(3)

Seems too many...

Are you planning to clean up this driver to get rid of (1) and (3) altogether?

(I understand that for current purposes above is a good quick cleanup)

>  #include <linux/spi/spi.h>
>  #include <linux/spi/ads7846.h>
> @@ -1018,7 +1019,7 @@ static int ads7846_setup_pendown(struct spi_device *spi,
>  		ts->gpio_pendown = pdata->gpio_pendown;
>  
>  		if (pdata->gpio_pendown_debounce)
> -			gpio_set_debounce(pdata->gpio_pendown,
> +			gpiod_set_debounce(gpio_to_desc(pdata->gpio_pendown),
>  					  pdata->gpio_pendown_debounce);
>  	} else {
>  		dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
> diff --git a/include/linux/gpio.h b/include/linux/gpio.h
> index c19256f67e02..64cc8f09eba8 100644
> --- a/include/linux/gpio.h
> +++ b/include/linux/gpio.h
> @@ -117,11 +117,6 @@ static inline int gpio_direction_output(unsigned gpio, int value)
>  	return gpiod_direction_output_raw(gpio_to_desc(gpio), value);
>  }
>  
> -static inline int gpio_set_debounce(unsigned gpio, unsigned debounce)
> -{
> -	return gpiod_set_debounce(gpio_to_desc(gpio), debounce);
> -}
> -
>  static inline int gpio_get_value_cansleep(unsigned gpio)
>  {
>  	return gpiod_get_raw_value_cansleep(gpio_to_desc(gpio));
> @@ -140,11 +135,6 @@ static inline void gpio_set_value(unsigned gpio, int value)
>  	return gpiod_set_raw_value(gpio_to_desc(gpio), value);
>  }
>  
> -static inline int gpio_cansleep(unsigned gpio)
> -{
> -	return gpiod_cansleep(gpio_to_desc(gpio));
> -}
> -
>  static inline int gpio_to_irq(unsigned gpio)
>  {
>  	return gpiod_to_irq(gpio_to_desc(gpio));
> @@ -181,8 +171,6 @@ struct device;
>  int devm_gpio_request(struct device *dev, unsigned gpio, const char *label);
>  int devm_gpio_request_one(struct device *dev, unsigned gpio,
>  			  unsigned long flags, const char *label);
> -void devm_gpio_free(struct device *dev, unsigned int gpio);
> -
>  #else /* ! CONFIG_GPIOLIB */
>  
>  #include <linux/kernel.h>
> @@ -239,11 +227,6 @@ static inline int gpio_direction_output(unsigned gpio, int value)
>  	return -ENOSYS;
>  }
>  
> -static inline int gpio_set_debounce(unsigned gpio, unsigned debounce)
> -{
> -	return -ENOSYS;
> -}
> -
>  static inline int gpio_get_value(unsigned gpio)
>  {
>  	/* GPIO can never have been requested or set as {in,out}put */
> @@ -257,13 +240,6 @@ static inline void gpio_set_value(unsigned gpio, int value)
>  	WARN_ON(1);
>  }
>  
> -static inline int gpio_cansleep(unsigned gpio)
> -{
> -	/* GPIO can never have been requested or set as {in,out}put */
> -	WARN_ON(1);
> -	return 0;
> -}
> -
>  static inline int gpio_get_value_cansleep(unsigned gpio)
>  {
>  	/* GPIO can never have been requested or set as {in,out}put */
> @@ -319,11 +295,6 @@ static inline int devm_gpio_request_one(struct device *dev, unsigned gpio,
>  	return -EINVAL;
>  }
>  
> -static inline void devm_gpio_free(struct device *dev, unsigned int gpio)
> -{
> -	WARN_ON(1);
> -}
> -
>  #endif /* ! CONFIG_GPIOLIB */
>  
>  #endif /* __LINUX_GPIO_H */
> -- 
> 2.29.2
> 

-- 
With Best Regards,
Andy Shevchenko


