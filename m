Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D027152865
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2020 10:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgBEJeT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Feb 2020 04:34:19 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:33311 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbgBEJeT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2020 04:34:19 -0500
Received: by mail-qk1-f195.google.com with SMTP id h4so1176528qkm.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2020 01:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jvVh6vtKQ9GefS2i8EN8qUYezUgnIjoyE/DQMc5Dzr4=;
        b=FTBygeOz8SE/iqv9zlvunC+vzoXyKZZxA0qFbyzlAyD0B5hQyro7Rxyv5ZSC6mhDwT
         gPP5+nEOdcCS18i8SYWSfZfYELN/ibM3yf+LUt6pcXeCPZjLk6KlsZcHwhSjQOKJ0en/
         OcU93vvJbyL0C+KgE9+rphhSWYNiPAEkiZDqxwEIpA6AusW1gBc1CRPDKVE9pj9tVEbF
         5yTwP3ho89DLMtffLSTUrjglaAzqs+zy3iwdwMOLxJV2Unye7GqCmm6DJeG1q8l7HPsZ
         i92chVqxBHuRFEKN31+ysP3xLYgS8qmrpMlJSOBmpEvSU1y1sGruIr7PUNklu3Crv3Dg
         ro3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jvVh6vtKQ9GefS2i8EN8qUYezUgnIjoyE/DQMc5Dzr4=;
        b=UAmEmJpl93/LpinyiArg3C2/1e9UT0IuPccKuJdvg8/5Ab1kZl6+0zZvCeqlFqkz8t
         I+jAZpm2g8SeYf6JLh+jW8pyi1X6ZWDagKq6/sT9j8VxGnHTeJCCBvHbmM5unW5MGnkq
         TLNhaw3yPsXdmMDYqJCxOdTJ0diFmES5m+zYKxBBfh1aK0kpUK7DrD/SPNOKs1lrGhjy
         pt3vJkYnXYhMpGwmG0RVgoIpJ5EHqXlsnU8JyngHi61ZJNrd1TsZbQvXBWoeWwuIpDTy
         WNsYkS1YNEjZGSZEEckumnLFKwrk+hna+A0DnQ7/p0BVLCRB/BB6vVnOd8g68L66j3DE
         eHqQ==
X-Gm-Message-State: APjAAAXUNGZTlYD6rrG67h7ZLkYweruSCZI2oro4EAdolFS6cyVaCd8A
        TfDRthFX6nb6M4ILPWZAiuo4uUPoYAhzA9b8yQr68w==
X-Google-Smtp-Source: APXvYqxcHL8Cezn/XPutzRe6SYZyibLU4S0unLE2HMFcrvuAXvuiphfCE463+0AfKZ6EpD74B4jbDoH8+pPKq8YG4NE=
X-Received: by 2002:a37:4808:: with SMTP id v8mr29693619qka.263.1580895258016;
 Wed, 05 Feb 2020 01:34:18 -0800 (PST)
MIME-Version: 1.0
References: <20200204190733.56783-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200204190733.56783-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 5 Feb 2020 10:34:06 +0100
Message-ID: <CAMpxmJXh_1kUGgW57H=YohR1nkP8fWdaCcrmuM-yhOy4wZ_WTw@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: Avoid kernel.h inclusion where it's possible
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 4 lut 2020 o 20:07 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> Inclusion of kernel.h increases the mess with the header dependencies.
> Avoid kernel.h inclusion where it's possible.
>
> Besides that, clean up a bit other inclusions inside GPIO subsystem heade=
rs.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/asm-generic/gpio.h    | 4 ++--
>  include/linux/gpio.h          | 2 --
>  include/linux/gpio/consumer.h | 5 ++++-
>  include/linux/of_gpio.h       | 9 ++++++---
>  4 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
> index 19eadac415c4..aea9aee1f3e9 100644
> --- a/include/asm-generic/gpio.h
> +++ b/include/asm-generic/gpio.h
> @@ -2,10 +2,8 @@
>  #ifndef _ASM_GENERIC_GPIO_H
>  #define _ASM_GENERIC_GPIO_H
>
> -#include <linux/kernel.h>
>  #include <linux/types.h>
>  #include <linux/errno.h>
> -#include <linux/of.h>
>
>  #ifdef CONFIG_GPIOLIB
>
> @@ -140,6 +138,8 @@ static inline void gpio_unexport(unsigned gpio)
>
>  #else  /* !CONFIG_GPIOLIB */
>
> +#include <linux/kernel.h>
> +
>  static inline bool gpio_is_valid(int number)
>  {
>         /* only non-negative numbers are valid */
> diff --git a/include/linux/gpio.h b/include/linux/gpio.h
> index 2157717c2136..008ad3ee56b7 100644
> --- a/include/linux/gpio.h
> +++ b/include/linux/gpio.h
> @@ -102,11 +102,9 @@ void devm_gpio_free(struct device *dev, unsigned int=
 gpio);
>  #include <linux/kernel.h>
>  #include <linux/types.h>
>  #include <linux/bug.h>
> -#include <linux/pinctrl/pinctrl.h>
>
>  struct device;
>  struct gpio_chip;
> -struct pinctrl_dev;

If this forward declaration is removed because it's no longer needed
after removing the pinctrl include, then please mention it in the
commit message. If it's unrelated then please put it in a different
patch.

Bartosz

>
>  static inline bool gpio_is_valid(int number)
>  {
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.=
h
> index bf2d017dd7b7..0a72fccf60ff 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -2,9 +2,10 @@
>  #ifndef __LINUX_GPIO_CONSUMER_H
>  #define __LINUX_GPIO_CONSUMER_H
>
> +#include <linux/bits.h>
>  #include <linux/bug.h>
> +#include <linux/compiler_types.h>
>  #include <linux/err.h>
> -#include <linux/kernel.h>
>
>  struct device;
>
> @@ -189,6 +190,8 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct =
device *dev,
>
>  #else /* CONFIG_GPIOLIB */
>
> +#include <linux/kernel.h>
> +
>  static inline int gpiod_count(struct device *dev, const char *con_id)
>  {
>         return 0;
> diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
> index 16967390a3fe..f821095218b0 100644
> --- a/include/linux/of_gpio.h
> +++ b/include/linux/of_gpio.h
> @@ -11,9 +11,8 @@
>  #define __LINUX_OF_GPIO_H
>
>  #include <linux/compiler.h>
> -#include <linux/kernel.h>
> -#include <linux/errno.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio.h>                /* FIXME: Shouldn't be here */
>  #include <linux/of.h>
>
>  struct device_node;
> @@ -34,6 +33,8 @@ enum of_gpio_flags {
>
>  #ifdef CONFIG_OF_GPIO
>
> +#include <linux/kernel.h>
> +
>  /*
>   * OF GPIO chip for memory mapped banks
>   */
> @@ -63,6 +64,8 @@ extern void of_mm_gpiochip_remove(struct of_mm_gpio_chi=
p *mm_gc);
>
>  #else /* CONFIG_OF_GPIO */
>
> +#include <linux/errno.h>
> +
>  /* Drivers may not strictly depend on the GPIO support, so let them link=
. */
>  static inline int of_get_named_gpio_flags(struct device_node *np,
>                 const char *list_name, int index, enum of_gpio_flags *fla=
gs)
> --
> 2.24.1
>
