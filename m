Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8E926A2E2
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 12:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgIOKNU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 06:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgIOKNR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 06:13:17 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4828C06174A;
        Tue, 15 Sep 2020 03:13:16 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id bd2so1091926plb.7;
        Tue, 15 Sep 2020 03:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PfMG7K6s5zD+uvZD4Cl6Lu46mq7iOnW8k6XALI01VBE=;
        b=qw6AIzPr/Rh5AmC82Z2j/38chFJkhiqkxfujl0vYnHP19BNF62PGamy/nwU7/4DH52
         oAXQii5iHSWkhy9vaIJT4hdLrMUT95ugqYLaxaQcN0lk9PN11BoZhB2pZ0Icn3xXLqW4
         WFBb5eN7mdoiy7svSwGw57KJcp6ORb/QRNzZcaUAOANBZajhVyb57hJ+SuCkCIiXvfl3
         FhHO5EiAWBNuYbpD3lRz145tekkFa1/tb7MplkuqTii7/e+Mk9hevSJgHtc/WaLewHuC
         VztU/r2Br4aThvay8WD3L6MItswmv6PmTY+Fn1BEquBQDP18aLsVhLeuqZ0uzPXX2xdx
         nP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PfMG7K6s5zD+uvZD4Cl6Lu46mq7iOnW8k6XALI01VBE=;
        b=D/LcFKFJhmfk/TIe88bF8kvGNp7kFR0cXAcTzmZ0h7OKaSFGEIxSWSHU5z3Q0GNxMx
         fBE6VSrpWW/n+q/UuEpDa3wQchegIcxlqwRmEWFcKzgVBu5jgFqw15kkGQCxXWHsWLCY
         W6UoqaA6qmM9YPMUQMfJimhO2vD+pj1vTU/CUc8xgx2n+FIQoAi60gKkfDbivWhHB46I
         gh9OQT3wsS5NlRVQ3T0VqQmwtO1RRqZ76SD1rIkB4w49ugRN38tAg8YxqXWxxK29EIfj
         hPmMvkP+690HuheXFlnUKD9byZ1kcD0hVgndkqHvCTVEyXgknmI7egv6UNkqG4PlAPwg
         1big==
X-Gm-Message-State: AOAM530mdHh+eqlqM+zqDXSR2mXH/eB7qZNKzqHj8Sp1gn/gQTyLwA9C
        lBQOSpLlR6auQO0weRuveRAsARqs0GXep1/5ZjE=
X-Google-Smtp-Source: ABdhPJwb/mfXoMcsisFLlJaD032s7/jrFnSdI7soYErpDVzgKUzOh7BkPJt46SZjwFv+/P2C7Juz0Gnc4cLXn4j58WQ=
X-Received: by 2002:a17:90b:fc4:: with SMTP id gd4mr3498645pjb.129.1600164796467;
 Tue, 15 Sep 2020 03:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200909102640.1657622-1-warthog618@gmail.com> <20200909102640.1657622-6-warthog618@gmail.com>
In-Reply-To: <20200909102640.1657622-6-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Sep 2020 13:12:58 +0300
Message-ID: <CAHp75Vc8pSGuQrpq6j01PPmu7PxUtok6f_B1Wx8fxoDW3eqAqQ@mail.gmail.com>
Subject: Re: [PATCH v8 05/20] gpiolib: make cdev a build option
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 9, 2020 at 1:30 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> Make the gpiolib-cdev module a build option.  This allows the CDEV
> interface to be removed from the kernel to reduce kernel size in
> applications where is it not required, and provides the parent for
> other other CDEV interface specific build options to follow.

In favour of tiny builds!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/Kconfig        | 17 +++++++++++++++--
>  drivers/gpio/Makefile       |  2 +-
>  drivers/gpio/gpiolib-cdev.h | 15 +++++++++++++++
>  3 files changed, 31 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 5cfdaf3b004d..e4debd66d71f 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -66,8 +66,21 @@ config GPIO_SYSFS
>
>           This ABI is deprecated. If you want to use GPIO from userspace,
>           use the character device /dev/gpiochipN with the appropriate
> -         ioctl() operations instead. The character device is always
> -         available.
> +         ioctl() operations instead.
> +
> +config GPIO_CDEV
> +       bool
> +       prompt "Character device (/dev/gpiochipN) support" if EXPERT
> +       default y
> +       help
> +         Say Y here to add the character device /dev/gpiochipN interface
> +         for GPIOs. The character device allows userspace to control GPIOs
> +         using ioctl() operations.
> +
> +         Only say N if you are sure that the GPIO character device is not
> +         required.
> +
> +         If unsure, say Y.
>
>  config GPIO_GENERIC
>         depends on HAS_IOMEM # Only for IOMEM drivers
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 4f9abff4f2dc..7c24c8d77068 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -7,8 +7,8 @@ obj-$(CONFIG_GPIOLIB)           += gpiolib.o
>  obj-$(CONFIG_GPIOLIB)          += gpiolib-devres.o
>  obj-$(CONFIG_GPIOLIB)          += gpiolib-legacy.o
>  obj-$(CONFIG_GPIOLIB)          += gpiolib-devprop.o
> -obj-$(CONFIG_GPIOLIB)          += gpiolib-cdev.o
>  obj-$(CONFIG_OF_GPIO)          += gpiolib-of.o
> +obj-$(CONFIG_GPIO_CDEV)                += gpiolib-cdev.o
>  obj-$(CONFIG_GPIO_SYSFS)       += gpiolib-sysfs.o
>  obj-$(CONFIG_GPIO_ACPI)                += gpiolib-acpi.o
>
> diff --git a/drivers/gpio/gpiolib-cdev.h b/drivers/gpio/gpiolib-cdev.h
> index 973578e7ad10..19a4e3d57120 100644
> --- a/drivers/gpio/gpiolib-cdev.h
> +++ b/drivers/gpio/gpiolib-cdev.h
> @@ -5,7 +5,22 @@
>
>  #include <linux/device.h>
>
> +#ifdef CONFIG_GPIO_CDEV
> +
>  int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt);
>  void gpiolib_cdev_unregister(struct gpio_device *gdev);
>
> +#else
> +
> +static inline int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
> +{
> +       return 0;
> +}
> +
> +static inline void gpiolib_cdev_unregister(struct gpio_device *gdev)
> +{
> +}
> +
> +#endif /* CONFIG_GPIO_CDEV */
> +
>  #endif /* GPIOLIB_CDEV_H */
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
