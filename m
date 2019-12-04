Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2964C112B91
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 13:35:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbfLDMfW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 07:35:22 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:36870 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfLDMfW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 07:35:22 -0500
Received: by mail-pj1-f67.google.com with SMTP id ep17so2965699pjb.4;
        Wed, 04 Dec 2019 04:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YPZbrljyNjC5j7q28Y1yjStc3oy4UmLl5B93KBpnvIM=;
        b=GoheGBkSxxZ2NEshTyIX/Ttdx3CJSOLqcHa40SoFDIs3V8urBZ3Jy4URycaDCzXoDH
         00kh0HualCF0KBfW8fYntwGYmPSUdZ22u/QR3EofTFJsWQ6TcMkwd1OXg9oLm6JxvxZm
         bh7DCHbBokIJvrielyZRpZafcDUqQQMh8vbMgvh7Vz8NUFQ46Mbq3qN5/tFiiO8xurk7
         So4p+tUanA4K5Ik2NtvjKz0DpTV9Lm++Gg8/CTvcMNcdfwwlm5W/yCfEWCcWREG2oUqB
         EJCWUvFMoATg4rTmyvIG/RMEYfjHS/0rzo+WBkqTYlmAooznA+cJNPnOVluzw6k/lT75
         3Z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YPZbrljyNjC5j7q28Y1yjStc3oy4UmLl5B93KBpnvIM=;
        b=dwWAe1OmdkebWTKdRwfzKO4Ia2tCy5YeqLUy24J/ji6mVPuOSfUwKtPajBHMA89E/2
         wHUog5PiukO+2R68v+uXLjOMsNoHKoUy6YqvXFJfej9xsV0NX36rda93BIlCSUCfp1ps
         2jLD4Ue8R73z9K8dZeMKGfthtF/HfLiqZXpQ9d3LvUFN/6GvfULRgA6Y94Osq3/FdJ02
         /K3uRtaeUatJgEcfe1ZsB6KQHhAjnlVoE9cUMPwheY38my3WsKiHALfTq7Iv7gFhanVJ
         sEhdMW8Seai2jqQpkzJBYB4xyw4N49xItlYa5fm08D3rUhDwYp8gvYdwnjZ6ExMfDk8w
         W96Q==
X-Gm-Message-State: APjAAAUTxqDgLJYM7S4AtxaaPUA8Qmh23aH14LueSAWmy4lG5UJpDSNj
        FubeK5uUV6dJy+/Ch09585qRW4QvPZ+qF9PqvGQ=
X-Google-Smtp-Source: APXvYqwhVWSxxvAv2De28QrHHETKA2K8Fjug4l6wpXAC5Wz3wrCTeVAemgGKgq2ymv4AVWx6Z6UfSlORnOxvAsK067g=
X-Received: by 2002:a17:90b:3109:: with SMTP id gc9mr3093142pjb.30.1575462921462;
 Wed, 04 Dec 2019 04:35:21 -0800 (PST)
MIME-Version: 1.0
References: <20191204101042.4275-2-cleger@kalray.eu>
In-Reply-To: <20191204101042.4275-2-cleger@kalray.eu>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Dec 2019 14:35:11 +0200
Message-ID: <CAHp75VfL5mRB0wy86_352nosKkKqVLZC_amCbLvhBTyNZztgRw@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: export acpi_gpiochip_request_interrupts in gpio/driver.h
To:     Clement Leger <cleger@kalray.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 12:13 PM Clement Leger <cleger@kalray.eu> wrote:
>
> dwapb-gpio driver which uses this function will be moved to pinctrl for
> pinctrl support. Export this function in gpio/driver.h to allow using
> it.
>

I don't think this is proper way to do it.
The driver has to register IRQ chip and GPIO core will take care of
ACPI related stuff.

> Signed-off-by: Clement Leger <cleger@kalray.eu>
> ---
>  drivers/gpio/gpiolib-acpi.h |  4 ----
>  include/linux/gpio/driver.h | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-acpi.h b/drivers/gpio/gpiolib-acpi.h
> index 1c6d65cf0629..ba2f187babe3 100644
> --- a/drivers/gpio/gpiolib-acpi.h
> +++ b/drivers/gpio/gpiolib-acpi.h
> @@ -34,7 +34,6 @@ struct acpi_gpio_info {
>  void acpi_gpiochip_add(struct gpio_chip *chip);
>  void acpi_gpiochip_remove(struct gpio_chip *chip);
>
> -void acpi_gpiochip_request_interrupts(struct gpio_chip *chip);
>  void acpi_gpiochip_free_interrupts(struct gpio_chip *chip);
>
>  int acpi_gpio_update_gpiod_flags(enum gpiod_flags *flags,
> @@ -56,9 +55,6 @@ int acpi_gpio_count(struct device *dev, const char *con_id);
>  static inline void acpi_gpiochip_add(struct gpio_chip *chip) { }
>  static inline void acpi_gpiochip_remove(struct gpio_chip *chip) { }
>
> -static inline void
> -acpi_gpiochip_request_interrupts(struct gpio_chip *chip) { }
> -
>  static inline void
>  acpi_gpiochip_free_interrupts(struct gpio_chip *chip) { }
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index e2480ef94c55..40b9f13d77e1 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -733,6 +733,18 @@ void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
>
>  struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
>
> +
> +#ifdef CONFIG_GPIO_ACPI
> +
> +void acpi_gpiochip_request_interrupts(struct gpio_chip *chip);
> +
> +#else
> +
> +static inline void acpi_gpiochip_request_interrupts(struct gpio_chip *chip)
> +{
> +}
> +
> +#endif /* CONFIG_GPIO_ACPI */
>  #else /* CONFIG_GPIOLIB */
>
>  static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
> --
> 2.15.0.276.g89ea799
>


-- 
With Best Regards,
Andy Shevchenko
