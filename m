Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7EF31170A
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Feb 2021 00:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhBEXXQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 18:23:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbhBEKDF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 05:03:05 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31477C06178C
        for <linux-gpio@vger.kernel.org>; Fri,  5 Feb 2021 02:02:16 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id f14so10956655ejc.8
        for <linux-gpio@vger.kernel.org>; Fri, 05 Feb 2021 02:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hsH61KDDx3Y8OXz/ss9YObsNe+q0AigWapDctDER+4o=;
        b=0tGaTw+7R4737QFUR7L03ZUcXH86QHMgoqUHr23glRdIx079vNPmrPdq733mNlcmpz
         gWlue8u7HtNZuwztRRTiNdL+QeM8vff1jsYhDjUiIlmHjEHIg/Uu6PTL6R9EGJd5jnui
         fy3BDRuOhtMi/b6OIUnfFIZpj6gW/LHkRkwKEwpuPS3+oCsEy+nwBayXJPEbcj9tSIYR
         mzohb+aD+asOyK/5d3OZI5o4FcMp5E8Ly5FYKBckPcEJrajoPk5vCBc3ffkA1DKctFHl
         ueTRTjCYofnO/KPblRuMNmwS7lse3lltLUuDzavC6i1+j4x43hCL4bqQbTw/jOyfq7FD
         eDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hsH61KDDx3Y8OXz/ss9YObsNe+q0AigWapDctDER+4o=;
        b=aeZ23VuXoT3RxweEk5REUdiUeidMtcMzRSRUN9G0K/yFJvVTUi2tiOyFWSuOsyx2FO
         kYItehuL2781bcEGaOVqaCA0Xw4anGFdrADdM7PiDWbci5MGZWi/4hr4fVYHGrTOZ0tS
         Hzwz/ayq/791Wrz3t3wBiv3VPvwcjhkehxcGv2UjzkCchzR3ulgQdVVxARZYSnGPsOkT
         KNb29j2G/Tu7tGdDNi2m20T4CNTNO8E4GtUU661+RzyX2+m+zxXVZJIl8ZKKZYmbAlAE
         bzZlNNaDTrHe/u+cIPYklxEY0jvXsY0ih5oFCygqPOmRqmS9A/ZRwhMga+Fq+RiP7ij2
         6uWg==
X-Gm-Message-State: AOAM5312cGxeDb7eIMfgCHNlVp0hKAA/H2uP2iNMLRoSY+xKO2CPW6T6
        UqZIMiboaf1DeolSGImXvHDs7zAt+vzeC+gYxN2yUA==
X-Google-Smtp-Source: ABdhPJx7xtmfvkbZBlgp22UnO9FMKZTPTwGhYg+QYtWNxMQmoX5+jZMzc9EWb1UGVcog4SwbazfAjmEnpvk1r7powrc=
X-Received: by 2002:a17:906:84d7:: with SMTP id f23mr3484797ejy.87.1612519334867;
 Fri, 05 Feb 2021 02:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20210205020730.1746354-1-saravanak@google.com>
In-Reply-To: <20210205020730.1746354-1-saravanak@google.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 5 Feb 2021 11:02:04 +0100
Message-ID: <CAMRc=Mci+LThvb5M5hmzjoCNSK1EAqZEqo7YU9Gp5Mo0FSRggw@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Don't probe gpio_device if it's not the
 primary device
To:     Saravana Kannan <saravanak@google.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>, kernel-team@android.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 5, 2021 at 3:08 AM Saravana Kannan <saravanak@google.com> wrote:
>
> Dmitry reported[1] boot error messages caused by
> commit 4731210c09f5 ("gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default").
>
> gpio-1022 (cpu-pwr-req-hog): hogged as input
> max77620-pinctrl max77620-pinctrl: pin gpio4 already requested by max77620-pinctrl; cannot claim for gpiochip1
> max77620-pinctrl max77620-pinctrl: pin-4 (gpiochip1) status -22
> max77620-pinctrl max77620-pinctrl: could not request pin 4 (gpio4) from group gpio4  on device max77620-pinctrl
> gpio_stub_drv gpiochip1: Error applying setting, reverse things back
> gpio_stub_drv: probe of gpiochip1 failed with error -22
>
> This happens because when we try to probe a device, driver core calls
> into pinctrl to set up the pins. However, if the GPIO DT node already
> has a proper device created and probed, trying to probe the gpio_device
> with a stub driver makes the pins be claimed twice. pinctrl doesn't like
> this and throws an error.
>
> So, this patch makes sure the gpio_stub_drv doesn't match with a
> gpio_device if it's not the primary device for the fwnode.
>
> [1] - https://lore.kernel.org/lkml/544ad0e4-0954-274c-8e77-866aaa5661a8@gmail.com/
> Fixes: 4731210c09f5 ("gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default")
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> Greg/Linus,
>
> This will need to go into driver-core because the Fixes is in
> driver-core too.
>
> Thanks,
> Saravana
>
>  drivers/gpio/gpiolib.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 8e0564c50840..8ad679a928b0 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -56,8 +56,10 @@
>  static DEFINE_IDA(gpio_ida);
>  static dev_t gpio_devt;
>  #define GPIO_DEV_MAX 256 /* 256 GPIO chip devices supported */
> +static int gpio_bus_match(struct device *dev, struct device_driver *drv);
>  static struct bus_type gpio_bus_type = {
>         .name = "gpio",
> +       .match = gpio_bus_match,
>  };
>
>  /*
> @@ -4199,6 +4201,18 @@ void gpiod_put_array(struct gpio_descs *descs)
>  }
>  EXPORT_SYMBOL_GPL(gpiod_put_array);
>
> +
> +static int gpio_bus_match(struct device *dev, struct device_driver *drv)
> +{
> +       /*
> +        * Only match if the fwnode doesn't already have a proper struct device
> +        * created for it.
> +        */
> +       if (dev->fwnode && dev->fwnode->dev != dev)
> +               return 0;
> +       return 1;
> +}
> +
>  static int gpio_stub_drv_probe(struct device *dev)
>  {
>         /*
> --
> 2.30.0.365.g02bc693789-goog
>

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
