Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FD634CF81
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 13:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbhC2L5C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 07:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbhC2L4j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 07:56:39 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6610C061574;
        Mon, 29 Mar 2021 04:56:38 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id w10so4926630pgh.5;
        Mon, 29 Mar 2021 04:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EnFBJVazfWibXzhJ5rFjkl18/36Z2C8O31hRW2EttRI=;
        b=A9cEsaeO3naOM710L2wuvIqbPGfwMqsINL0RsSR3ub4D76xfVmp2uPyA9wgdeF1fej
         nquXimcD83GEyR0BDLAE3Uyb3tyyDpnv//EAsfWzn7DA8vh1AgM0iSzsHYOaMQSw5n8Q
         PIdczv5EB0yCI8k1Qua9JVn30khMPAFFgmJdPldw3QonBdWkiYaYn0/WVcLSnOAIeoMA
         tINEdTuOGv0TKW7prcSeDHfxpX1KRt9//dVTelcsMi/ZWrAIcqHQS4sKEIoMRQStRCHm
         zLOvhNjDFoTW0I+WFfmpzxSnnVxZ/jm+yA495ctTVPbaq2dU0+UdO+OVP59WJsgqCWpC
         iLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EnFBJVazfWibXzhJ5rFjkl18/36Z2C8O31hRW2EttRI=;
        b=r3lYF0gFuZJZH+3Q+W4edY/aeYWbDelwD7G1tvkzXwcTKiFZJ7wSWabtjcmqAcbxGZ
         rlxp8nTtTK34iDamm3417YW5HnP2gWElJQL0BRrHsI/UKHZ90wfSxDxUVnEVNNJkKC8K
         DbSXaasmHYz05hENu5TTGcY8iUB4Dwv9ViF833pmn9ORuGSrnkMuFrgikJ5zv2vR+8ea
         Z0aDd9GM2SKSfVaCJkIMVCLLKQUb9m3Vea1I3+A6U9DFfpEEmuwugA55a2h7B2lhXNoD
         b3WZfj2ztN0D8/wSxYJwr66v3kPShy0sAsayUaqfatNNA5YaiAPqG/4lRoMJoWZwUjv6
         T/WA==
X-Gm-Message-State: AOAM531a6ILmzDz4WNI9ExjcSGuW1pTtnJ2x7x+AYuWJjZm4LjgvUVGC
        L7vXjgyUqYTjB+idxyubnV8hYOgAJ1xaop8gVgTHXymjVQZ6wQ==
X-Google-Smtp-Source: ABdhPJxz6Y3Wwr3WdRctkjolrbirCvNh0/HlbM9vuGK4xJH+M9zFIKH1xBeqzhhiWXrXT6L9hNo9bP1vVwanduLj6Ms=
X-Received: by 2002:a63:cb44:: with SMTP id m4mr1017181pgi.4.1617018998358;
 Mon, 29 Mar 2021 04:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com> <d1ec9f4cb6dd9afcfbeecfa717e863d75e18133b.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <d1ec9f4cb6dd9afcfbeecfa717e863d75e18133b.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 29 Mar 2021 14:56:22 +0300
Message-ID: <CAHp75VeaEGbnyro2UUCddNxZaKHSWyfyDmExV6s7a0TJKGnkNA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: sysfs: Obey valid_mask
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 2:42 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> Do not allow exporting GPIOs which are set invalid
> by the driver's valid mask.

> Fixes: 726cb3ba49692bdae6caff457755e7cdb432efa4
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Should not be blank lines in the tag block.

Dunno if you can convert those pr_*() to dev_*(), but it's definitely
out of the scope here.

I like the idea, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> ---
>  drivers/gpio/gpiolib-sysfs.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index 26c5466b8179..ae49bb23c6ed 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -458,6 +458,8 @@ static ssize_t export_store(struct class *class,
>         long                    gpio;
>         struct gpio_desc        *desc;
>         int                     status;
> +       struct gpio_chip        *gc;
> +       int                     offset;
>
>         status = kstrtol(buf, 0, &gpio);
>         if (status < 0)
> @@ -469,6 +471,12 @@ static ssize_t export_store(struct class *class,
>                 pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
>                 return -EINVAL;
>         }
> +       gc = desc->gdev->chip;
> +       offset = gpio_chip_hwgpio(desc);
> +       if (!gpiochip_line_is_valid(gc, offset)) {
> +               pr_warn("%s: GPIO %ld masked\n", __func__, gpio);
> +               return -EINVAL;
> +       }
>
>         /* No extra locking here; FLAG_SYSFS just signifies that the
>          * request and export were done by on behalf of userspace, so
> --
> 2.25.4
>
>
> --
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =]



-- 
With Best Regards,
Andy Shevchenko
