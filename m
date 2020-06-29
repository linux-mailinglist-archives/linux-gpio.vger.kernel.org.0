Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1F520DD94
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2020 23:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731677AbgF2TOI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jun 2020 15:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731656AbgF2TOE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jun 2020 15:14:04 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D638C02E2EC
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2020 07:25:34 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id t7so7688986qvl.8
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2020 07:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rA9epWFsG5fbaq7o7Q/6VMPdIfht3K/e6mhw2OtNl9U=;
        b=hzAE1YatrpkZQ7jnLFTXC8QY7HnN+hfZ399QqsJj7tLxfrFjf06NFKvZC3HpmfReQp
         krbHWZ2eodd+i28Exn1eMViNZl5pZF8YjqxUIdxufGNDPnYmPT0wjM7iRV2Vhj9glwiT
         mue+E8bAcJT9UOHzRlon78YuZHExdmyPWuszUPv5VOhRcXZB8AcNSnN8ZOQWOG4zwIdf
         YyoKPksd/nqs+8RjLK6vO7rmQPQ1QbcuvqXHYuv3nmyXJfYQ1PnQ8Ogx3tE/dTldtFPy
         YtLYEPzGwTasDiDtR6fgVB38skKLMGn4YAcPaGeU9yLKq1l6hS7+xyNMpYGTttxgUvqu
         jy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rA9epWFsG5fbaq7o7Q/6VMPdIfht3K/e6mhw2OtNl9U=;
        b=X/aw+Kdc58Ag42AqBrxmjs9B/dkJPCmuepkP7TNaOneJXdgD9rt4mNaMeMsXUlWpLI
         UGPCfyxgCxqhB6YJ+YQ9g2gslYZTlOg9zCv5ObfbaHx+Ibny63k/WtZGohH/6VhARDpH
         ZfMspQ/EQCuyMe/qJewlcwzi/D9+Ne2uwyruE0hSnbbLT9zWnK6Sj7hKoGSe3oVmlVoG
         nK+6Wxgs42aFHqWD3M90nkTBPIO5v0gS0F7H9nbLrs2X3N0pDIe9Z9YgMneEQ2qadNVw
         KZtTPKH0x2IhOYjlSMwjPot83XzWhxEyez2rf8LbGNN9IRytY+capieSUWW3csoRwXO8
         mcJw==
X-Gm-Message-State: AOAM532B/bTL5BPWaW7V8d19sjmnnByWWdrrF9/pyYpi8T821wVEmh2E
        SneSqNZI9w2eWibEGexAyNAL72ucwXGF4pzo8Hwp3w==
X-Google-Smtp-Source: ABdhPJySGZ/xP3qtD93JKEbk3jl1yLhggXL/YUW0iBOECJJHNZns1BmCY8SVCiQh2hnzho0g5QR6PDjvW7UHi0vQJWU=
X-Received: by 2002:a0c:ec04:: with SMTP id y4mr12044188qvo.148.1593440733466;
 Mon, 29 Jun 2020 07:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-15-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-15-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 29 Jun 2020 16:25:22 +0200
Message-ID: <CAMpxmJVQmo2S6AQgcPACHH8ziSQNUvAhkUJ3eW_YsLkbyGzm=Q@mail.gmail.com>
Subject: Re: [PATCH 14/22] gpiolib: make cdev a build option
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 23, 2020 at 6:02 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Make the gpiolib-cdev module a build option.  This allows the CDEV
> interface to be removed from the kernel to reduce kernel size in
> applications where is it not required, and provides the parent for
> other other CDEV interface specific build options to follow.
>
> Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>
> ---
>  drivers/gpio/Kconfig        | 16 ++++++++++++++--
>  drivers/gpio/Makefile       |  2 +-
>  drivers/gpio/gpiolib-cdev.h | 15 +++++++++++++++
>  3 files changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index c6b5c65c8405..affc1524bc2c 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -66,8 +66,20 @@ config GPIO_SYSFS
>
>           This ABI is deprecated. If you want to use GPIO from userspace,
>           use the character device /dev/gpiochipN with the appropriate
> -         ioctl() operations instead. The character device is always
> -         available.
> +         ioctl() operations instead.
> +
> +config GPIO_CDEV
> +       bool "/dev/gpiochipN (character device interface)"
> +       default y
> +       help
> +         Say Y here to add the character device /dev/gpiochipN interface
> +         for GPIOs. The character device allows userspace to control GPIOs
> +         using ioctl() operations.
> +
> +         Only say N is you are sure that the GPIO character device is not
> +         required.
> +
> +         If unsure, say Y.
>
>  config GPIO_GENERIC
>         depends on HAS_IOMEM # Only for IOMEM drivers
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index ef666cfef9d0..45eb09808d12 100644
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
> 2.27.0
>

I know Linus doesn't like this, but I'm personally in favor of adding
this as long as it's enabled by default.

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
