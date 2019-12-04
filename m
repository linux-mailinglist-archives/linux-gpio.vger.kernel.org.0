Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1DB211377B
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 23:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbfLDWTY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 17:19:24 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38617 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfLDWTY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 17:19:24 -0500
Received: by mail-pg1-f195.google.com with SMTP id a33so332459pgm.5;
        Wed, 04 Dec 2019 14:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xl8E0mgQambwqoFrAc3CJUxXJzHeSi7VR9fzrX/x0q0=;
        b=n4bF80xcpB+udzzoUkrNj9ZfkOnls5AfByEw3XNv01PQXdQmiR3sYgKPtwr9YB2lrx
         F8IEEklg2DIajMhePXR/6kXm+CCiqsb7+VeWY+PMr2Ij5Nn/jm9GNt1l+wxayjpDoBm0
         FvPMA5+ck1yATpHxyOFn2n9QDJCmt9/Xm8qIsBo0ODDWQs2RZa5l9BV2dELlri/rCsIG
         1LkUhisdlDXTy/6sThdKdqs6CYL6pCd4mUrypmxC+XIgmRkDbWsK7LTANro/LkZWSt+F
         NxClde6xanY8IDrYT5yfYt3vH1k6tlPrX0aPeE/lGt9OkW+hNv65u/QCYJjKIB2DtqQu
         KQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xl8E0mgQambwqoFrAc3CJUxXJzHeSi7VR9fzrX/x0q0=;
        b=F30MfJsHOGrtUGQhh95+NulifH2aftVYo8A14lGZK9asXmx9TRNmYVQ2L7XmLvEeOx
         QZnPVQ4Tdqp77J4wAUfntNqz8klUCyEe/IHFJXjpLL/kPtUovsJFQgDJEsipQLeVLUpy
         nSsB8VG2EpmN8aWxaYWKif5oAu4RjjnWo4g7r6baT575F3m3mOJxotJQqgePQN0MMCYk
         GvqEstV884WXMvatt8Fc2ON6p1cjm+D9pddkQQWICbulKJsBCXt9JhTYoiXmdsTgV9aq
         H8ifzByVbTCh5fwNXRIBPVPaQ8K3HKBZTD5HjM75T15TQbGgzX4XlgTU27HxH0+IkEqM
         21Tw==
X-Gm-Message-State: APjAAAW4xrAPPBHiE4qYDYrYmA2Z59eK0X02GuyP7vobzYVeWQPZFcZv
        FTHtLhiD1vjjk+a07XgSLQpwy6/WM7S18YuPm1g=
X-Google-Smtp-Source: APXvYqzT7YxFYkAqlWm7KTZo31O/e70i9EEmakKRcw+6PBRjlhIMivEQziHwnGGMKjRmU2xpMWP7U5Z06aM2hSbCgL8=
X-Received: by 2002:a63:941:: with SMTP id 62mr6098806pgj.203.1575497962954;
 Wed, 04 Dec 2019 14:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20191204155912.17590-1-brgl@bgdev.pl> <20191204155912.17590-4-brgl@bgdev.pl>
In-Reply-To: <20191204155912.17590-4-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 00:19:11 +0200
Message-ID: <CAHp75VfL95BXuj=bhEjh0zbwoiaj3bQb0HEGfx8RqGppHDCyHQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] gpiolib: convert the type of hwnum to unsigned
 int in gpiochip_get_desc()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 6:04 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> gpiochip_get_desc() takes a u16 hwnum, but it turns out most users don't
> respect that and usually pass an unsigned int. Since implicit casting to
> a smaller type is dangerous - let's change the type of hwnum to unsigned
> int in gpiochip_get_desc() and in gpiochip_request_own_desc() where the
> size of hwnum is not respected either and who's a user of the former.
>
> This is safe as we then check the hwnum against the number of lines
> before proceeding in gpiochip_get_desc().
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpiolib.c      | 5 +++--
>  drivers/gpio/gpiolib.h      | 3 ++-
>  include/linux/gpio/driver.h | 3 ++-
>  3 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 72211407469f..b3ffb079e323 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -140,7 +140,7 @@ EXPORT_SYMBOL_GPL(gpio_to_desc);
>   * in the given chip for the specified hardware number.
>   */
>  struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
> -                                   u16 hwnum)
> +                                   unsigned int hwnum)
>  {
>         struct gpio_device *gdev = chip->gpiodev;
>
> @@ -2990,7 +2990,8 @@ EXPORT_SYMBOL_GPL(gpiochip_is_requested);
>   * A pointer to the GPIO descriptor, or an ERR_PTR()-encoded negative error
>   * code on failure.
>   */
> -struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip, u16 hwnum,
> +struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip,
> +                                           unsigned int hwnum,
>                                             const char *label,
>                                             enum gpio_lookup_flags lflags,
>                                             enum gpiod_flags dflags)
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index ca9bc1e4803c..a1cbeabadc69 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -78,7 +78,8 @@ struct gpio_array {
>         unsigned long           invert_mask[];
>  };
>
> -struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip, u16 hwnum);
> +struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
> +                                   unsigned int hwnum);
>  int gpiod_get_array_value_complex(bool raw, bool can_sleep,
>                                   unsigned int array_size,
>                                   struct gpio_desc **desc_array,
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index e2480ef94c55..4f032de10bae 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -715,7 +715,8 @@ gpiochip_remove_pin_ranges(struct gpio_chip *chip)
>
>  #endif /* CONFIG_PINCTRL */
>
> -struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip, u16 hwnum,
> +struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *chip,
> +                                           unsigned int hwnum,
>                                             const char *label,
>                                             enum gpio_lookup_flags lflags,
>                                             enum gpiod_flags dflags);
> --
> 2.23.0
>


-- 
With Best Regards,
Andy Shevchenko
