Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED4B44640E
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 14:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhKEN0i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 09:26:38 -0400
Received: from mga09.intel.com ([134.134.136.24]:31247 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232258AbhKEN0h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 09:26:37 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="231739591"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="231739591"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 06:23:57 -0700
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="562026535"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 06:23:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mizBx-003nhY-0i;
        Fri, 05 Nov 2021 15:23:37 +0200
Date:   Fri, 5 Nov 2021 15:23:36 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org,
        gerg@linux-m68k.org, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
        dalias@libc.org, ysato@users.sourceforge.jp,
        Arnd Bergmann <arnd@arndb.de>,
        Fu Wei <tekkamanninja@gmail.com>, Alex Shi <alexs@kernel.org>,
        Hu Haowen <src.res@email.cn>,
        linux-doc-tw-discuss@lists.sourceforge.net,
        Jonathan Corbet <corbet@lwn.net>,
        Drew Fustini <drew@beagleboard.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC 1/3] gpiolib: remove irq_to_gpio() definition
Message-ID: <YYUwWFOeiFBC2Nhd@smile.fi.intel.com>
References: <20211105130338.241100-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105130338.241100-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 05, 2021 at 02:03:03PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All implementations other than coldfire have returned an error since
> the avr32 and blackfin architectures got removed, and the last user in
> driver code was removed in 2016, so just remove this old interface.
> 
> The only reference is now in the Chinese documentation, which should be
> changed to remove this reference as well.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks, Arnd, for cleaning this up!

> Cc: Fu Wei <tekkamanninja@gmail.com>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Hu Haowen <src.res@email.cn>
> Cc: linux-doc-tw-discuss@lists.sourceforge.net
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  Documentation/driver-api/gpio/legacy.rst | 20 +++++---------------
>  arch/m68k/include/asm/gpio.h             |  7 -------
>  arch/sh/include/asm/gpio.h               |  5 -----
>  include/linux/gpio.h                     | 12 ------------
>  4 files changed, 5 insertions(+), 39 deletions(-)
> 
> diff --git a/Documentation/driver-api/gpio/legacy.rst b/Documentation/driver-api/gpio/legacy.rst
> index 9b12eeb89170..06c05e2d62c1 100644
> --- a/Documentation/driver-api/gpio/legacy.rst
> +++ b/Documentation/driver-api/gpio/legacy.rst
> @@ -382,22 +382,18 @@ GPIOs mapped to IRQs
>  --------------------
>  GPIO numbers are unsigned integers; so are IRQ numbers.  These make up
>  two logically distinct namespaces (GPIO 0 need not use IRQ 0).  You can
> -map between them using calls like::
> +map between them using::
>  
>  	/* map GPIO numbers to IRQ numbers */
>  	int gpio_to_irq(unsigned gpio);
>  
> -	/* map IRQ numbers to GPIO numbers (avoid using this) */
> -	int irq_to_gpio(unsigned irq);
> -
> -Those return either the corresponding number in the other namespace, or
> +This returns an irq number corresponding to the gpio number, or
>  else a negative errno code if the mapping can't be done.  (For example,
>  some GPIOs can't be used as IRQs.)  It is an unchecked error to use a GPIO
> -number that wasn't set up as an input using gpio_direction_input(), or
> -to use an IRQ number that didn't originally come from gpio_to_irq().
> +number that wasn't set up as an input using gpio_direction_input().
>  
> -These two mapping calls are expected to cost on the order of a single
> -addition or subtraction.  They're not allowed to sleep.
> +The mapping call is expected to cost on the order of a single
> +addition or subtraction.  It is not allowed to sleep.
>  
>  Non-error values returned from gpio_to_irq() can be passed to request_irq()
>  or free_irq().  They will often be stored into IRQ resources for platform
> @@ -405,12 +401,6 @@ devices, by the board-specific initialization code.  Note that IRQ trigger
>  options are part of the IRQ interface, e.g. IRQF_TRIGGER_FALLING, as are
>  system wakeup capabilities.
>  
> -Non-error values returned from irq_to_gpio() would most commonly be used
> -with gpio_get_value(), for example to initialize or update driver state
> -when the IRQ is edge-triggered.  Note that some platforms don't support
> -this reverse mapping, so you should avoid using it.
> -
> -
>  Emulating Open Drain Signals
>  ----------------------------
>  Sometimes shared signals need to use "open drain" signaling, where only the
> diff --git a/arch/m68k/include/asm/gpio.h b/arch/m68k/include/asm/gpio.h
> index a50b27719a58..5cfc0996ba94 100644
> --- a/arch/m68k/include/asm/gpio.h
> +++ b/arch/m68k/include/asm/gpio.h
> @@ -66,13 +66,6 @@ static inline int gpio_to_irq(unsigned gpio)
>  		return __gpio_to_irq(gpio);
>  }
>  
> -static inline int irq_to_gpio(unsigned irq)
> -{
> -	return (irq >= MCFGPIO_IRQ_VECBASE &&
> -		irq < (MCFGPIO_IRQ_VECBASE + MCFGPIO_IRQ_MAX)) ?
> -		irq - MCFGPIO_IRQ_VECBASE : -ENXIO;
> -}
> -
>  static inline int gpio_cansleep(unsigned gpio)
>  {
>  	return gpio < MCFGPIO_PIN_MAX ? 0 : __gpio_cansleep(gpio);
> diff --git a/arch/sh/include/asm/gpio.h b/arch/sh/include/asm/gpio.h
> index d643250f0a0f..588c1380e4cb 100644
> --- a/arch/sh/include/asm/gpio.h
> +++ b/arch/sh/include/asm/gpio.h
> @@ -40,11 +40,6 @@ static inline int gpio_to_irq(unsigned gpio)
>  	return __gpio_to_irq(gpio);
>  }
>  
> -static inline int irq_to_gpio(unsigned int irq)
> -{
> -	return -ENOSYS;
> -}
> -
>  #endif /* CONFIG_GPIOLIB */
>  
>  #endif /* __ASM_SH_GPIO_H */
> diff --git a/include/linux/gpio.h b/include/linux/gpio.h
> index 008ad3ee56b7..d8d7daa7eb94 100644
> --- a/include/linux/gpio.h
> +++ b/include/linux/gpio.h
> @@ -81,11 +81,6 @@ static inline int gpio_to_irq(unsigned int gpio)
>  	return __gpio_to_irq(gpio);
>  }
>  
> -static inline int irq_to_gpio(unsigned int irq)
> -{
> -	return -EINVAL;
> -}
> -
>  #endif /* ! CONFIG_ARCH_HAVE_CUSTOM_GPIO_H */
>  
>  /* CONFIG_GPIOLIB: bindings for managed devices that want to request gpios */
> @@ -219,13 +214,6 @@ static inline int gpio_to_irq(unsigned gpio)
>  	return -EINVAL;
>  }
>  
> -static inline int irq_to_gpio(unsigned irq)
> -{
> -	/* irq can never have been returned from gpio_to_irq() */
> -	WARN_ON(1);
> -	return -EINVAL;
> -}
> -
>  static inline int devm_gpio_request(struct device *dev, unsigned gpio,
>  				    const char *label)
>  {
> -- 
> 2.29.2
> 

-- 
With Best Regards,
Andy Shevchenko


