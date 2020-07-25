Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2F122D9DF
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 22:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgGYUaH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 16:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbgGYUaH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 16:30:07 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5540CC08C5C0;
        Sat, 25 Jul 2020 13:30:07 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a9so7076053pjd.3;
        Sat, 25 Jul 2020 13:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nwY+/tJ0rnnwCDiaWmm+N+wbOgL2p5NbRLZLkADAyRw=;
        b=YpmyHvZtSrZ6atS0RCrqRZ1Z0vHqKFnlljCO8iS8qa0Tmiznt12PZprJuqovWCPno7
         qamlb0T3rj+7Zm63S68BPi23q7OEN+gTqVr0fSeEjB8RJw4/NQgX8jvDnboWSa5zN/Lk
         fDbaeU+CVw1V7SJtghaqbBM8RTTN2fgk/cYpy16TjS4YdAgnt39mdb+iW7oIoKqBXU3/
         pLXrQRKLrAjp8QPFcu2S+pjy7uqB3Iz5C9LmBgXF4ShJiDRluqXHfoqujDVSbZ+O7WPF
         dUGQyTCRut4ARqVmw0/6WRDP9EvWY7TKO6d4NuV7vRXSO/MMG6aGyPDj0bFq0U3vFgda
         W59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nwY+/tJ0rnnwCDiaWmm+N+wbOgL2p5NbRLZLkADAyRw=;
        b=F4H7ZmGQhRihb6jkokbSgK3cqVlX/zb0TEyKhw5wEx4jTwly3q/j6Qn/k5ysWg4eZr
         mFSfFywCVtySBQBss/IMXIMBA99FUZPp4PcG6fbI7Hx2hRAIBdcNOor6heYcjrgxl1RG
         cdKH8TLJWxtipfWWuVBOJ5Lt7gZ2UPe1XIgErAwa2jdc/SNtMLx4EiHcL6hBi9iZkQBj
         SegpPBsm9iZh2pUdbcR3LWlCdW5rhw0hW5LziN86N6EsxyktZfaIi60jtqZIyi7oWjmr
         UJ14C0P6qYyYzNg3b5ErfTCq5T+JaO1sOJP63nSpHxc5ZWtcYkEuQo3QUVlOgsR8q6O6
         FO4g==
X-Gm-Message-State: AOAM533DPqLZKhghKHVLUo26iswqbeF8QGIArc/vwv4ofksgISMycnsi
        o02zmM5QrBOY8bLX5Qdq7EimEndPNBm5l0sPwTk=
X-Google-Smtp-Source: ABdhPJxlR7PFFbFXWRPb5neSRyvjY1sUwyQAN09BBPm++FcmYgvy9mLJeggjDUJMCiVpjfdPkEkatYmxMJEchR75TXo=
X-Received: by 2002:a17:902:9a4b:: with SMTP id x11mr13333727plv.255.1595709006739;
 Sat, 25 Jul 2020 13:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200725041955.9985-1-warthog618@gmail.com> <20200725041955.9985-4-warthog618@gmail.com>
In-Reply-To: <20200725041955.9985-4-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 25 Jul 2020 23:29:50 +0300
Message-ID: <CAHp75Ve4e4JdAQ2YGWqm9JEaKViw861fSUbCfxEP7HnKBDj_fQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] gpiolib: make cdev a build option
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

On Sat, Jul 25, 2020 at 7:21 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Make the gpiolib-cdev module a build option.  This allows the CDEV
> interface to be removed from the kernel to reduce kernel size in
> applications where is it not required, and provides the parent for
> other other CDEV interface specific build options to follow.
>
> Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/Kconfig        | 16 ++++++++++++++--
>  drivers/gpio/Makefile       |  2 +-
>  drivers/gpio/gpiolib-cdev.h | 15 +++++++++++++++
>  3 files changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 8030fd91a3cc..b5bb9efc1092 100644
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

is -> if

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
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
