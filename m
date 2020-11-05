Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 231852A7DAC
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 13:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgKEMCJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 07:02:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgKEMCI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 07:02:08 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C0DC0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 04:02:08 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id b1so1887803lfp.11
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 04:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=acijxDiGDEUt4I2cDxK+O6StwjSex3WB5cQlpv1FYyQ=;
        b=c1DuOiIS8rPp2H8sU37QjdQYjSswWCIIgyzuwlAyEbZIntV825P2HzlPSSjZTjmu+L
         PszfPceqjXJZE3LxcculepH396McEkrMcacEBfbWTKDIuxFJVLdyR/r2uTu1xEmz4NHS
         O7B/VMMq90xd9ZL2fdZZjfC3kqEm5bCiAF6kK18Lx9BstIArgNFaCCPh1RABYhNPFmbf
         85kT9ZILCNVzdgY5lbbKVIb3iBW2U8IOnhGugZhsMXUEr5iklI+lSWALVeFO5tNZEgny
         Y2lZGPiSFIXOwpnvMNrP7RjvrGt+OU5J33PbFiC65pUc0Fd46LHxGknOTccCnCyPlexE
         nV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=acijxDiGDEUt4I2cDxK+O6StwjSex3WB5cQlpv1FYyQ=;
        b=E9B1NTVFCfU1delZ1jZjvndM3GdIjQVe1zG4/03u7P2OkANi+gur7awRwmaTQ0LihK
         HhegAHxUtaYKtpZG2dscgSszlxBctPKdv6+UBxpjt3IyF9SokYuO6KFw7BZIaZcaqEuo
         KeThq17NPrNogEmyVTr5AoRpm3uXcH/4fpomg19aFF1bjT5ILA5pbp10RUHjpjQAd/X+
         sJqntVIqpx/dPLt8lQrTxQXHYNPjWpNzd0NY5Lr1UqYzlm5YzU0iH/I4JPjEd4HbiqkL
         JpU/hCaynbHOXfnSSnnnFpHMet2aFi9AnlaYuyhVl3ZtSmrqepVo4adRLUxjKhYXgvCM
         VnrA==
X-Gm-Message-State: AOAM5311midjNK+pqGF+/qFfXbrRzGkuZ0B52ZFNMy0PoUs08+KQYAB2
        SdqFKFiAbQVPQUjIBgWtcWM7Aj1Y5xbBBQSR/eq7VA==
X-Google-Smtp-Source: ABdhPJyz0HCk27eSLygMgMvm/T9U7y0iTjhhVG7vQ+YCf7tpS/9vOrdlmgnxW0GYpObhQrtZFYwo80EfEJVI6GO5GsU=
X-Received: by 2002:a19:6a0e:: with SMTP id u14mr815519lfu.254.1604577726840;
 Thu, 05 Nov 2020 04:02:06 -0800 (PST)
MIME-Version: 1.0
References: <20201105104049.91077-1-warthog618@gmail.com>
In-Reply-To: <20201105104049.91077-1-warthog618@gmail.com>
From:   Nicolas Schichan <nschichan@freebox.fr>
Date:   Thu, 5 Nov 2020 13:01:55 +0100
Message-ID: <CAHNNwZDiwKbhBgkOhStGip2+cMKOEBTUa13n2vuHrTc_nk2sMg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix sysfs when cdev is not selected
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Kent,

On Thu, Nov 5, 2020 at 11:41 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> In gpiochip_setup_dev() the call to gpiolib_cdev_register() indirectly
> calls device_add().  This is still required for the sysfs even when
> CONFIG_GPIO_CDEV is not selected in the build.
>
> Replace the stubbed functions in gpiolib-cdev.h with macros in gpiolib.c
> that perform the required device_add() and device_del() when
> CONFIG_GPIO_CDEV is not selected.
>
> Fixes: d143493c01b7 (gpiolib: make cdev a build option)
> Reported-by: Nicolas Schichan <nschichan@freebox.fr>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib-cdev.h | 15 ---------------
>  drivers/gpio/gpiolib.c      | 18 +++++++++++++++---
>  2 files changed, 15 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.h b/drivers/gpio/gpiolib-cdev.h
> index cb41dd757338..b42644cbffb8 100644
> --- a/drivers/gpio/gpiolib-cdev.h
> +++ b/drivers/gpio/gpiolib-cdev.h
> @@ -7,22 +7,7 @@
>
>  struct gpio_device;
>
> -#ifdef CONFIG_GPIO_CDEV
> -
>  int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt);
>  void gpiolib_cdev_unregister(struct gpio_device *gdev);
>
> -#else
> -
> -static inline int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
> -{
> -       return 0;
> -}
> -
> -static inline void gpiolib_cdev_unregister(struct gpio_device *gdev)
> -{
> -}
> -
> -#endif /* CONFIG_GPIO_CDEV */
> -
>  #endif /* GPIOLIB_CDEV_H */
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 8e29a60c3697..c980ddcda833 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -480,11 +480,23 @@ static void gpiodevice_release(struct device *dev)
>         kfree(gdev);
>  }
>
> +#ifdef CONFIG_GPIO_CDEV
> +#define gcdev_register(gdev, devt)     gpiolib_cdev_register((gdev), (devt))
> +#define gcdev_unregister(gdev)         gpiolib_cdev_unregister((gdev))
> +#else
> +/*
> + * gpiolib_cdev_register() indirectly calls device_add(), which is still
> + * required even when cdev is not selected.
> + */
> +#define gcdev_register(gdev, devt)     device_add(&(gdev)->dev)
> +#define gcdev_unregister(gdev)         device_del(&(gdev)->dev)
> +#endif
> +
>  static int gpiochip_setup_dev(struct gpio_device *gdev)
>  {
>         int ret;
>
> -       ret = gpiolib_cdev_register(gdev, gpio_devt);
> +       ret = gcdev_register(gdev, gpio_devt);
>         if (ret)
>                 return ret;
>
> @@ -500,7 +512,7 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
>         return 0;
>
>  err_remove_device:
> -       gpiolib_cdev_unregister(gdev);
> +       gcdev_unregister(gdev);
>         return ret;
>  }
>
> @@ -825,7 +837,7 @@ void gpiochip_remove(struct gpio_chip *gc)
>          * be removed, else it will be dangling until the last user is
>          * gone.
>          */
> -       gpiolib_cdev_unregister(gdev);
> +       gcdev_unregister(gdev);
>         put_device(&gdev->dev);
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_remove);
> --
> 2.29.2
>

I have tested your patch and it works for both CONFIG_GPIO_CDEV set and unset.

Tested-by: Nicolas Schichan <nschichan@freebox.fr>

Regards,

-- 
Nicolas Schichan
Freebox SAS
