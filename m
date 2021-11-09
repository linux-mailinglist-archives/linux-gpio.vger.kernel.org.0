Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87D644AB5A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 11:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245252AbhKIKW4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 05:22:56 -0500
Received: from mga06.intel.com ([134.134.136.31]:52145 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245255AbhKIKWz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 05:22:55 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="293252541"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="293252541"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 02:20:09 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="451845068"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 02:20:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mkOEN-0052ym-0F;
        Tue, 09 Nov 2021 12:19:55 +0200
Date:   Tue, 9 Nov 2021 12:19:54 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] gpiolib: remove asm-generic/gpio.h
Message-ID: <YYpLStN1YTkPx0T2@smile.fi.intel.com>
References: <20211109100207.2474024-1-arnd@kernel.org>
 <20211109100207.2474024-5-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109100207.2474024-5-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 09, 2021 at 11:02:03AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The asm-generic/gpio.h file is now always included when
> using gpiolib, so just move its contents into linux/gpio.h
> with a few minor simplifications.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/m68k/include/asm/mcfgpio.h |   2 +-
>  drivers/gpio/gpio-davinci.c     |   3 +-

>  drivers/pinctrl/core.c          |   2 +-
>  include/asm-generic/gpio.h      | 172 --------------------------------
>  include/linux/gpio.h            | 116 +++++++++++++++++++--

For these three
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>  5 files changed, 110 insertions(+), 185 deletions(-)
>  delete mode 100644 include/asm-generic/gpio.h
> 
> diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
> index 27f32cc81da6..2cefe8445980 100644
> --- a/arch/m68k/include/asm/mcfgpio.h
> +++ b/arch/m68k/include/asm/mcfgpio.h
> @@ -9,7 +9,7 @@
>  #define mcfgpio_h
>  
>  #ifdef CONFIG_GPIOLIB
> -#include <asm-generic/gpio.h>
> +#include <linux/gpio.h>
>  #else
>  
>  int __mcfgpio_get_value(unsigned gpio);
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index cb5afaa7ed48..8122c3a8d659 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/gpio/driver.h>
> +#include <linux/gpio.h>
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/clk.h>
> @@ -23,8 +24,6 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/spinlock.h>
>  
> -#include <asm-generic/gpio.h>
> -
>  #define MAX_REGS_BANKS 5
>  #define MAX_INT_PER_BANK 32
>  
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index ffe39336fcac..976607758e98 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -28,7 +28,7 @@
>  
>  #ifdef CONFIG_GPIOLIB
>  #include "../gpio/gpiolib.h"
> -#include <asm-generic/gpio.h>
> +#include <linux/gpio.h>
>  #endif
>  
>  #include "core.h"
> diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
> deleted file mode 100644
> index aea9aee1f3e9..000000000000
> --- a/include/asm-generic/gpio.h
> +++ /dev/null
> @@ -1,172 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_GENERIC_GPIO_H
> -#define _ASM_GENERIC_GPIO_H
> -
> -#include <linux/types.h>
> -#include <linux/errno.h>
> -
> -#ifdef CONFIG_GPIOLIB
> -
> -#include <linux/compiler.h>
> -#include <linux/gpio/driver.h>
> -#include <linux/gpio/consumer.h>
> -
> -/* Platforms may implement their GPIO interface with library code,
> - * at a small performance cost for non-inlined operations and some
> - * extra memory (for code and for per-GPIO table entries).
> - *
> - * While the GPIO programming interface defines valid GPIO numbers
> - * to be in the range 0..MAX_INT, this library restricts them to the
> - * smaller range 0..ARCH_NR_GPIOS-1.
> - *
> - * ARCH_NR_GPIOS is somewhat arbitrary; it usually reflects the sum of
> - * builtin/SoC GPIOs plus a number of GPIOs on expanders; the latter is
> - * actually an estimate of a board-specific value.
> - */
> -
> -#ifndef ARCH_NR_GPIOS
> -#if defined(CONFIG_ARCH_NR_GPIO) && CONFIG_ARCH_NR_GPIO > 0
> -#define ARCH_NR_GPIOS CONFIG_ARCH_NR_GPIO
> -#else
> -#define ARCH_NR_GPIOS		512
> -#endif
> -#endif
> -
> -/*
> - * "valid" GPIO numbers are nonnegative and may be passed to
> - * setup routines like gpio_request().  only some valid numbers
> - * can successfully be requested and used.
> - *
> - * Invalid GPIO numbers are useful for indicating no-such-GPIO in
> - * platform data and other tables.
> - */
> -
> -static inline bool gpio_is_valid(int number)
> -{
> -	return number >= 0 && number < ARCH_NR_GPIOS;
> -}
> -
> -struct device;
> -struct gpio;
> -struct seq_file;
> -struct module;
> -struct device_node;
> -struct gpio_desc;
> -
> -/* caller holds gpio_lock *OR* gpio is marked as requested */
> -static inline struct gpio_chip *gpio_to_chip(unsigned gpio)
> -{
> -	return gpiod_to_chip(gpio_to_desc(gpio));
> -}
> -
> -/* Always use the library code for GPIO management calls,
> - * or when sleeping may be involved.
> - */
> -extern int gpio_request(unsigned gpio, const char *label);
> -extern void gpio_free(unsigned gpio);
> -
> -static inline int gpio_direction_input(unsigned gpio)
> -{
> -	return gpiod_direction_input(gpio_to_desc(gpio));
> -}
> -static inline int gpio_direction_output(unsigned gpio, int value)
> -{
> -	return gpiod_direction_output_raw(gpio_to_desc(gpio), value);
> -}
> -
> -static inline int gpio_set_debounce(unsigned gpio, unsigned debounce)
> -{
> -	return gpiod_set_debounce(gpio_to_desc(gpio), debounce);
> -}
> -
> -static inline int gpio_get_value_cansleep(unsigned gpio)
> -{
> -	return gpiod_get_raw_value_cansleep(gpio_to_desc(gpio));
> -}
> -static inline void gpio_set_value_cansleep(unsigned gpio, int value)
> -{
> -	return gpiod_set_raw_value_cansleep(gpio_to_desc(gpio), value);
> -}
> -
> -
> -/* A platform's <asm/gpio.h> code may want to inline the I/O calls when
> - * the GPIO is constant and refers to some always-present controller,
> - * giving direct access to chip registers and tight bitbanging loops.
> - */
> -static inline int __gpio_get_value(unsigned gpio)
> -{
> -	return gpiod_get_raw_value(gpio_to_desc(gpio));
> -}
> -static inline void __gpio_set_value(unsigned gpio, int value)
> -{
> -	return gpiod_set_raw_value(gpio_to_desc(gpio), value);
> -}
> -
> -static inline int __gpio_cansleep(unsigned gpio)
> -{
> -	return gpiod_cansleep(gpio_to_desc(gpio));
> -}
> -
> -static inline int __gpio_to_irq(unsigned gpio)
> -{
> -	return gpiod_to_irq(gpio_to_desc(gpio));
> -}
> -
> -extern int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
> -extern int gpio_request_array(const struct gpio *array, size_t num);
> -extern void gpio_free_array(const struct gpio *array, size_t num);
> -
> -/*
> - * A sysfs interface can be exported by individual drivers if they want,
> - * but more typically is configured entirely from userspace.
> - */
> -static inline int gpio_export(unsigned gpio, bool direction_may_change)
> -{
> -	return gpiod_export(gpio_to_desc(gpio), direction_may_change);
> -}
> -
> -static inline int gpio_export_link(struct device *dev, const char *name,
> -				   unsigned gpio)
> -{
> -	return gpiod_export_link(dev, name, gpio_to_desc(gpio));
> -}
> -
> -static inline void gpio_unexport(unsigned gpio)
> -{
> -	gpiod_unexport(gpio_to_desc(gpio));
> -}
> -
> -#else	/* !CONFIG_GPIOLIB */
> -
> -#include <linux/kernel.h>
> -
> -static inline bool gpio_is_valid(int number)
> -{
> -	/* only non-negative numbers are valid */
> -	return number >= 0;
> -}
> -
> -/* platforms that don't directly support access to GPIOs through I2C, SPI,
> - * or other blocking infrastructure can use these wrappers.
> - */
> -
> -static inline int gpio_cansleep(unsigned gpio)
> -{
> -	return 0;
> -}
> -
> -static inline int gpio_get_value_cansleep(unsigned gpio)
> -{
> -	might_sleep();
> -	return __gpio_get_value(gpio);
> -}
> -
> -static inline void gpio_set_value_cansleep(unsigned gpio, int value)
> -{
> -	might_sleep();
> -	__gpio_set_value(gpio, value);
> -}
> -
> -#endif /* !CONFIG_GPIOLIB */
> -
> -#endif /* _ASM_GENERIC_GPIO_H */
> diff --git a/include/linux/gpio.h b/include/linux/gpio.h
> index 7e6b1b8277ca..c19256f67e02 100644
> --- a/include/linux/gpio.h
> +++ b/include/linux/gpio.h
> @@ -54,26 +54,124 @@ struct gpio {
>  };
>  
>  #ifdef CONFIG_GPIOLIB
> -#include <asm-generic/gpio.h>
>  
> -static inline int gpio_get_value(unsigned int gpio)
> +#include <linux/compiler.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/consumer.h>
> +
> +/* Platforms may implement their GPIO interface with library code,
> + * at a small performance cost for non-inlined operations and some
> + * extra memory (for code and for per-GPIO table entries).
> + *
> + * While the GPIO programming interface defines valid GPIO numbers
> + * to be in the range 0..MAX_INT, this library restricts them to the
> + * smaller range 0..ARCH_NR_GPIOS-1.
> + *
> + * ARCH_NR_GPIOS is somewhat arbitrary; it usually reflects the sum of
> + * builtin/SoC GPIOs plus a number of GPIOs on expanders; the latter is
> + * actually an estimate of a board-specific value.
> + */
> +
> +#ifndef ARCH_NR_GPIOS
> +#if defined(CONFIG_ARCH_NR_GPIO) && CONFIG_ARCH_NR_GPIO > 0
> +#define ARCH_NR_GPIOS CONFIG_ARCH_NR_GPIO
> +#else
> +#define ARCH_NR_GPIOS		512
> +#endif
> +#endif
> +
> +/*
> + * "valid" GPIO numbers are nonnegative and may be passed to
> + * setup routines like gpio_request().  only some valid numbers
> + * can successfully be requested and used.
> + *
> + * Invalid GPIO numbers are useful for indicating no-such-GPIO in
> + * platform data and other tables.
> + */
> +
> +static inline bool gpio_is_valid(int number)
>  {
> -	return __gpio_get_value(gpio);
> +	return number >= 0 && number < ARCH_NR_GPIOS;
>  }
>  
> -static inline void gpio_set_value(unsigned int gpio, int value)
> +struct device;
> +
> +/* caller holds gpio_lock *OR* gpio is marked as requested */
> +static inline struct gpio_chip *gpio_to_chip(unsigned gpio)
>  {
> -	__gpio_set_value(gpio, value);
> +	return gpiod_to_chip(gpio_to_desc(gpio));
>  }
>  
> -static inline int gpio_cansleep(unsigned int gpio)
> +/* Always use the library code for GPIO management calls,
> + * or when sleeping may be involved.
> + */
> +extern int gpio_request(unsigned gpio, const char *label);
> +extern void gpio_free(unsigned gpio);
> +
> +static inline int gpio_direction_input(unsigned gpio)
> +{
> +	return gpiod_direction_input(gpio_to_desc(gpio));
> +}
> +static inline int gpio_direction_output(unsigned gpio, int value)
> +{
> +	return gpiod_direction_output_raw(gpio_to_desc(gpio), value);
> +}
> +
> +static inline int gpio_set_debounce(unsigned gpio, unsigned debounce)
>  {
> -	return __gpio_cansleep(gpio);
> +	return gpiod_set_debounce(gpio_to_desc(gpio), debounce);
>  }
>  
> -static inline int gpio_to_irq(unsigned int gpio)
> +static inline int gpio_get_value_cansleep(unsigned gpio)
> +{
> +	return gpiod_get_raw_value_cansleep(gpio_to_desc(gpio));
> +}
> +static inline void gpio_set_value_cansleep(unsigned gpio, int value)
> +{
> +	return gpiod_set_raw_value_cansleep(gpio_to_desc(gpio), value);
> +}
> +
> +static inline int gpio_get_value(unsigned gpio)
> +{
> +	return gpiod_get_raw_value(gpio_to_desc(gpio));
> +}
> +static inline void gpio_set_value(unsigned gpio, int value)
> +{
> +	return gpiod_set_raw_value(gpio_to_desc(gpio), value);
> +}
> +
> +static inline int gpio_cansleep(unsigned gpio)
> +{
> +	return gpiod_cansleep(gpio_to_desc(gpio));
> +}
> +
> +static inline int gpio_to_irq(unsigned gpio)
> +{
> +	return gpiod_to_irq(gpio_to_desc(gpio));
> +}
> +
> +extern int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
> +extern int gpio_request_array(const struct gpio *array, size_t num);
> +extern void gpio_free_array(const struct gpio *array, size_t num);
> +
> +/*
> + * A sysfs interface can be exported by individual drivers if they want,
> + * but more typically is configured entirely from userspace.
> + */
> +static inline int gpio_export(unsigned gpio, bool direction_may_change)
> +{
> +	return gpiod_export(gpio_to_desc(gpio), direction_may_change);
> +}
> +
> +static inline int gpio_export_link(struct device *dev, const char *name,
> +				   unsigned gpio)
> +{
> +	return gpiod_export_link(dev, name, gpio_to_desc(gpio));
> +}
> +
> +static inline void gpio_unexport(unsigned gpio)
>  {
> -	return __gpio_to_irq(gpio);
> +	gpiod_unexport(gpio_to_desc(gpio));
>  }
>  
>  /* CONFIG_GPIOLIB: bindings for managed devices that want to request gpios */
> -- 
> 2.29.2
> 

-- 
With Best Regards,
Andy Shevchenko


