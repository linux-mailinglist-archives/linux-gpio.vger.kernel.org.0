Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B1B469A14
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 16:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345801AbhLFPF0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Dec 2021 10:05:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345884AbhLFPFI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Dec 2021 10:05:08 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAAFAC0698D0
        for <linux-gpio@vger.kernel.org>; Mon,  6 Dec 2021 07:01:39 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id v1so44279701edx.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Dec 2021 07:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rx5WAdQgjQYUCUZMzb32WIOm3fil4JEYgpwFBPU8zKs=;
        b=IPbhCarYqsh/4Wq5Lr1kUUW/BtDobSHyDFJ2AK+R9dhWTehtS93HZQY7q6cfTwpAII
         Oj52t13kQwbTOOcSEQPZqEEGWnght/mrwIWIlczKwHH7ML0sMjVI30kwSw5PgU65sTCJ
         0DxRN5IVvsfOkxymtxkwMxPIDPbBlgDCwF3SQaUpeQJxMLcGD2C7TFX4u0fu+Pr6hQ6y
         zLxuIv/Z3oPp/wsVv9dS6AIU1yQ1EFoBX9h/Z1aytVPR3C3DDJi6uODkibjIb7s8kmXI
         vrfnKQ/zzUb51fvEvKxur1uf7Bf/CRjFNz3IFK0qzVJXqMWXtVpgLS9ynsXDtOweIMJN
         9CfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rx5WAdQgjQYUCUZMzb32WIOm3fil4JEYgpwFBPU8zKs=;
        b=WG8tfXgOk9qvO6IBAgh8eI5qVxUxob9Pr1iE7ii13XUDF+741l0NYEawz4QoCNgiCF
         5BjMMF6sirj50dzik7LHm1RyaDxv2WeBwz6Bvo1ebduHzFnkd5Co2oUt98CosTEGRyOi
         FS2MQFDwMg+5oY7m5LMbN481oOLROhGdZAsl5SneGfxyD7QF1MdqO+kiKQ+iAyt75UKg
         LK0yKrOg2DmuTa9RF9YXvswHaTWi5Qkb+MU0sEBbvWjlgAqizeyLM4iyFaJpu/+QVL+h
         iCPRQm/GUt/uf22HPobL3WcvGcv6KsDxnEdMf9i1r4Mlb1worqAD+Vohep/Elfaw30c5
         uHXw==
X-Gm-Message-State: AOAM532nC9o8jLZJGXwH349yW6t0am1zXY03xEqpg9vY9WH/2155SamZ
        I/jE1v9ORvsQcz/Kws2ygF8zhLvHhFFGWxJYZ/oOzg==
X-Google-Smtp-Source: ABdhPJzxD0ZDyRJnuncz7yUaU5TRZM2LaW7rbNql/zgBMCZCfT8faSEd9txG9QvT2c92je2h2IJypVeTECPXvFOgsts=
X-Received: by 2002:a17:907:75f0:: with SMTP id jz16mr47037953ejc.77.1638802896192;
 Mon, 06 Dec 2021 07:01:36 -0800 (PST)
MIME-Version: 1.0
References: <20211202134034.14048-1-brgl@bgdev.pl> <20211202134034.14048-2-brgl@bgdev.pl>
In-Reply-To: <20211202134034.14048-2-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Dec 2021 16:01:25 +0100
Message-ID: <CAMRc=MfBvFzww_wZ=afjUY4aSnyKyL2ZXLmfWbu_u3tnZ8J0Ng@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpiolib: check the 'ngpios' property in core
 gpiolib code
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Johan Hovold <johan@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 2, 2021 at 2:40 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Several drivers read the 'ngpios' device property on their own, but
> since it's defined as a standard GPIO property in the device tree bindings
> anyway, it's a good candidate for generalization. If the driver didn't
> set its gc->ngpio, try to read the 'ngpios' property from the GPIO
> device's firmware node before bailing out.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> v1 -> v2:
> - use device_property_read_u32() instead of fwnode_property_read_u32()
> - reverse the error check logic
>
> v2 -> v3:
> - don't shadow errors other than -ENODATA in device_property_read_u32()
>
> v3 -> v4:
> - also make sure we return -EINVAL when the device 'ngpios' property is
>   set to 0 (thanks Andy!)
>
>  drivers/gpio/gpiolib.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ede8b8a7aa18..bd9b8cb53476 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -599,6 +599,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>         int base = gc->base;
>         unsigned int i;
>         int ret = 0;
> +       u32 ngpios;
>
>         /*
>          * First: allocate and populate the internal stat container, and
> @@ -646,6 +647,26 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>                 goto err_free_dev_name;
>         }
>
> +       /*
> +        * Try the device properties if the driver didn't supply the number
> +        * of GPIO lines.
> +        */
> +       if (gc->ngpio == 0) {
> +               ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> +               if (ret == -ENODATA)
> +                       /*
> +                        * -ENODATA means that there is no property found and
> +                        * we want to issue the error message to the user.
> +                        * Besides that, we want to return different error code
> +                        * to state that supplied value is not valid.
> +                        * */
> +                       ngpios = 0;
> +               else if (ret)
> +                       goto err_free_descs;
> +
> +               gc->ngpio = ngpios;
> +       }
> +
>         if (gc->ngpio == 0) {
>                 chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
>                 ret = -EINVAL;
> --
> 2.25.1
>

Queued for next.

Bart
