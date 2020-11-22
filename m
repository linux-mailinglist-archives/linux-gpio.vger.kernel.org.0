Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1199C2BC4B8
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Nov 2020 10:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727330AbgKVJbU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 Nov 2020 04:31:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgKVJbU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Nov 2020 04:31:20 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB63C0613CF;
        Sun, 22 Nov 2020 01:31:18 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id d17so19579198lfq.10;
        Sun, 22 Nov 2020 01:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E8tam/uH6FEmzwsruhPQ9Co+uT3qIE6RuudwiJDxjs8=;
        b=XRYwKflTwR7v0YQJ58f0V+mlPbmXzCiKAia0bFlvC8SonHdG+996o6xUwWEQpta4xl
         nnl6t5C54hVTTNAAUlppXTrPpiqJzO/rBcs8orIXmT9+jM2UJ11Lv60A+2z/Yr+8xzS4
         juayx72PtympXnUFmfSbYMRNqquKQ9hgMK6TmfO4uFmarzN2kiaawskjk1AE9UiRs9lM
         xzYhzJW9kmxQSAlLBOyJtq0WZZgWL8sDHMoslGpGA9tz/9/bHPusZ2SsDr96M9Qm6dh1
         Qw+pGAwoHv3JtsEAQntNdWy8hCtrd+T48vrES8H/rjWjBM8VR1J1jtdMvw5miB9dPon7
         M7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E8tam/uH6FEmzwsruhPQ9Co+uT3qIE6RuudwiJDxjs8=;
        b=HOv+9db817mnVIr876a5iVEFQFoEbIzKjLgOxNl8Xf6e/RFBGFPCNDnHnIxo+yhOam
         o2gVwWNVoODqQbCfvh5/MeABb2MMkgJI/OrPFhRxSiGNSSiNe44t50m7E+nnp7sMLckZ
         c+v97OKlhROZGIdhrYezQuFuLXmfcmit5fdUOhclX+2+hcHpyNhF5XpbaKmmd+UmxvFI
         rwCOt6TdeDw6fam5IXgdrgrZdN7Fsx0hRayHIukDpu5WwBPvWkiydp/6ImXJc8KsOs36
         muuhoe1VqzOc2IY4SHc8sQ7O56A2sbvoMDCsJRRJ3NvhwkLUmQYESkmzGD4lG8jz7pzz
         6nNw==
X-Gm-Message-State: AOAM533hwBSovavRhVwD4YUUCvebZKmcomiWcSzeXCRMornS+3sxtcVt
        cbJ3gAfktchAIOofnPmNkTrQLkLYqDBbBj3T/1U=
X-Google-Smtp-Source: ABdhPJyVwzxXipiQOTrxgOnuiq/+Qz+xRAUyX+kTJGgR1KAxgrfjKjVaMcHVK+cxgJZPibOb7lULjgYqUeEsLr/5ErA=
X-Received: by 2002:ac2:48b2:: with SMTP id u18mr12257117lfg.313.1606037476571;
 Sun, 22 Nov 2020 01:31:16 -0800 (PST)
MIME-Version: 1.0
References: <20201122092548.61979-1-gnurou@gmail.com>
In-Reply-To: <20201122092548.61979-1-gnurou@gmail.com>
From:   Alexandre Courbot <gnurou@gmail.com>
Date:   Sun, 22 Nov 2020 18:31:05 +0900
Message-ID: <CAAVeFuJ+j5qDq457h-LESmd5CY+rXUFQqGpn960S2Cz0d1O0Jw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: fix typo and unclear legacy API section
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 22, 2020 at 6:25 PM Alexandre Courbot <gnurou@gmail.com> wrote:
>
> The "Interacting With the Legacy GPIO Subsystem" of the documentation
> was unclear at best, and even included a sentence that seems to say the
> opposite of what it should say about the lifetime of the return value of
> the conversion functions.
>
> Try to clarify things a bit and hopefully make that section more
> readable.
>
> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>

Realized after sending this should also have a

Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Apologies for the omission Andy!

> ---
>  Documentation/driver-api/gpio/consumer.rst | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
> index 423492d125b9..173e4c7b037d 100644
> --- a/Documentation/driver-api/gpio/consumer.rst
> +++ b/Documentation/driver-api/gpio/consumer.rst
> @@ -440,18 +440,20 @@ For details refer to Documentation/firmware-guide/acpi/gpio-properties.rst
>
>  Interacting With the Legacy GPIO Subsystem
>  ==========================================
> -Many kernel subsystems still handle GPIOs using the legacy integer-based
> -interface. Although it is strongly encouraged to upgrade them to the safer
> -descriptor-based API, the following two functions allow you to convert a GPIO
> -descriptor into the GPIO integer namespace and vice-versa::
> +Many kernel subsystems and drivers still handle GPIOs using the legacy
> +integer-based interface. It is strongly recommended to update these to the new
> +gpiod interface. For cases where both interfaces need to be used, the following
> +two functions allow to convert a GPIO descriptor into the GPIO integer namespace
> +and vice-versa::
>
>         int desc_to_gpio(const struct gpio_desc *desc)
>         struct gpio_desc *gpio_to_desc(unsigned gpio)
>
> -The GPIO number returned by desc_to_gpio() can be safely used as long as the
> -GPIO descriptor has not been freed. All the same, a GPIO number passed to
> -gpio_to_desc() must have been properly acquired, and usage of the returned GPIO
> -descriptor is only possible after the GPIO number has been released.
> +The GPIO number returned by desc_to_gpio() can safely be used as a parameter of
> +the gpio\_*() functions for as long as the GPIO descriptor `desc` is not freed.
> +All the same, a GPIO number passed to gpio_to_desc() must first be properly
> +acquired using e.g. gpio_request_one(), and the returned GPIO descriptor is only
> +considered valid until that GPIO number is released using gpio_free().
>
>  Freeing a GPIO obtained by one API with the other API is forbidden and an
>  unchecked error.
> --
> 2.29.2
>
