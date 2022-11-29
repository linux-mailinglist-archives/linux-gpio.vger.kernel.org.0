Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB7763C04D
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 13:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234274AbiK2MvG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 07:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbiK2MvE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 07:51:04 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C1B31ED8
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 04:51:03 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id q6so4969241uao.9
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 04:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XwmBWeXqzFRkjLR/Y7tX6hBRPz/SUjO89KlcxDK6Fio=;
        b=MRGbEnnoWIckois7J8FMXG3q8Da4E1FJGjqhHjtQgro1UCnpPetTFgEeP4v2fMHW72
         4RkWuyZmc3E3Naa4A2lX7HJn9lkxMrxg/0exBwnxwdQZQ29yGcEr6RaVIE+1Ks7P42eg
         JpsHZsmG+/SfKZIIniNQj7SlXMTjn00zhta6n0gNRtE4iWXkg5aGPYP/GM0O4WFHm+Jw
         HpLBQ5e52dfED6gg6fiNbXifesTkkyU/lkpreYxANdZywSPoXHXqhwPODItTuMvrazx9
         Dp/w+mR3u/yN2B8q7N4JPvBxwFbEnHSzo20yKzXYodk6NeFb6yBm031Eka+MBqzhuFPa
         omiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwmBWeXqzFRkjLR/Y7tX6hBRPz/SUjO89KlcxDK6Fio=;
        b=g9XkfKBpgz34Yzu8WW5FLU1qei43ULqzajNy/+lyJWPNBTG1ztArvHfDbnNLyCx3tF
         PI3ZddrucTw6wO/F5BkHksmLwQ1/VmavSZwEevOvgm0bdQRDkUZCSIua0ia9mlIGen65
         qnD9uVLIOKCmhSrKpc1f2G4xBVOLPd7cnOl387c5X83igT9sj+J1OshxLA/IyFDLXeI/
         uJu88GCUZ7m5nok1o606mk/gfta7ea1aj60aceSuihX7pi1f4QqBcuehrU4FVvT9+bDH
         /LZveKz00BjM6HIX8Z45xAFYQHIIPrYdlHRVvRU2otYxT1OQUkZcljcgGj8d+MD9dZL9
         V9yA==
X-Gm-Message-State: ANoB5pliam/4g1Q681/Ng0WC6z29+RPUoNZLhdR0RUZLUsRO5s4pmE03
        xwkUh2B7VpxIZ0McxIw3TdG0IzaO9nR4ERbeTpIgFK2Si1Y=
X-Google-Smtp-Source: AA0mqf5H7jmD2TgPI2aHcQvGLdEIoyxZQmV0ulPABTDWe7ZLxtjU6J+EoNpEEEjWfBT58un5Pyo3UM4UK4Ql2cNQ5us=
X-Received: by 2002:ab0:76d9:0:b0:419:1a4a:cefa with SMTP id
 w25-20020ab076d9000000b004191a4acefamr7041792uaq.66.1669726262949; Tue, 29
 Nov 2022 04:51:02 -0800 (PST)
MIME-Version: 1.0
References: <20221128190055.6350-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221128190055.6350-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 29 Nov 2022 13:50:51 +0100
Message-ID: <CAMRc=Mcfy7HjA0DvFgkgJUZ8LVF4Nnrq39jDr82UUVQ6xsmH8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Provide to_gpio_device() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 28, 2022 at 8:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Provide to_gpio_device() helper which can be utilized in the existing
> and future code.
>
> While at it, make sure it becomes no-op at compilation time.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: made helper static inline (Bart)
>  drivers/gpio/gpiolib.c | 2 +-
>  drivers/gpio/gpiolib.h | 9 +++++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index a11480634213..ccd47da4ec66 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -548,7 +548,7 @@ EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
>
>  static void gpiodevice_release(struct device *dev)
>  {
> -       struct gpio_device *gdev = container_of(dev, struct gpio_device, dev);
> +       struct gpio_device *gdev = to_gpio_device(dev);
>         unsigned long flags;
>
>         spin_lock_irqsave(&gpio_lock, flags);
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index d900ecdbac46..e443c1023a37 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -20,9 +20,9 @@
>
>  /**
>   * struct gpio_device - internal state container for GPIO devices
> - * @id: numerical ID number for the GPIO chip
>   * @dev: the GPIO device struct
>   * @chrdev: character device for the GPIO device
> + * @id: numerical ID number for the GPIO chip
>   * @mockdev: class device used by the deprecated sysfs interface (may be
>   * NULL)
>   * @owner: helps prevent removal of modules exporting active GPIOs
> @@ -47,9 +47,9 @@
>   * userspace.
>   */
>  struct gpio_device {
> -       int                     id;

Sorry I didn't notice it before but why the churn? This is not needed
for container_of to work.

Bart

>         struct device           dev;
>         struct cdev             chrdev;
> +       int                     id;
>         struct device           *mockdev;
>         struct module           *owner;
>         struct gpio_chip        *chip;
> @@ -72,6 +72,11 @@ struct gpio_device {
>  #endif
>  };
>
> +static inline struct gpio_device *to_gpio_device(struct device *dev)
> +{
> +       return container_of(dev, struct gpio_device, dev);
> +}
> +
>  /* gpio suffixes used for ACPI and device tree lookup */
>  static __maybe_unused const char * const gpio_suffixes[] = { "gpios", "gpio" };
>
> --
> 2.35.1
>
