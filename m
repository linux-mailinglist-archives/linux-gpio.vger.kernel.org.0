Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEAA113779
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 23:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfLDWSx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 17:18:53 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33179 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfLDWSx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 17:18:53 -0500
Received: by mail-pf1-f195.google.com with SMTP id y206so549851pfb.0;
        Wed, 04 Dec 2019 14:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YoWjZJetN7C907sf8l8S1h92ZyTU0yDuKBdSww6Y87k=;
        b=LU9SK66lfgwFDD7kZEucKxKgHL+Jh0uoijMWnOOhs32iDyR8md94bu5b+x37tbzMBF
         u2c2BxbH118usOWWuTQZzF9wvYfxsybTD2b4rHt356kxTgeFFl+ZSs9jDL79lX66k2aZ
         9CJqSK+IxU2Kb8Ycb+G7/NIG+tmgdRVb2tM8x/sfmQYtomIyx4KUOvvJ2eewZ9RQrUGL
         LnhoRvX6SXVJdfbtjmnP0JZgsQbxJzHzSuHFoxeE5PiaKrF1/+qLqpD7D+82FqjpG6ZR
         QpZ/Ar//IWQu9IzC/Tusu11iUeXFEIcHRB2Kfhxf+ye4cQSBwSIFY3HL6fbAQg64Ziqh
         P5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YoWjZJetN7C907sf8l8S1h92ZyTU0yDuKBdSww6Y87k=;
        b=LQkHqEtCB25MOImB1xM4JSJLSNQfRJ5AFo3LBUdF2GS7JZwjmyw0QYVXqmoDkx2aqP
         yv798VWv31XPbTw4L1lEA1NwTFT6jhtUD66iC/WIJT9t8alF15B3DuJNkvRyGvNczsHf
         eLM5ylgk+8ppc0956KozRFfWOLtXeUurU8erfhEQMcDQ1AFcxvR2Sf0MEisvbiRwMJgx
         RxX0HRo5/Ue4W3B0gbKh5CvBqD4WbQzZN5w9iHZoisau5kX1JxG+IDjQsoURV9GkPRhL
         KCcXcFEmuRCNLzTjV9HB2RLSFQol67orew+ueeeJWFezk+1mR4VbM2lL+SK9uCnTYao/
         TeEA==
X-Gm-Message-State: APjAAAW/a71BxdrgT8VdrhcaHVcdUWAt5/pqrJBiBb22XyynE2ZMVtps
        V0iBhnu5oIKcWE9ilIrZbGwPfuIWM544kVSBpsw=
X-Google-Smtp-Source: APXvYqwtyM9hGkXIcsL/TqnEaURm/MVXLxLwkWx4EOMvJVs+NrJXMfo6qBhLyYkk3lV65mnuzBRT+bb7M7sbOeQCVSo=
X-Received: by 2002:a63:e14a:: with SMTP id h10mr5810042pgk.74.1575497932215;
 Wed, 04 Dec 2019 14:18:52 -0800 (PST)
MIME-Version: 1.0
References: <20191204155912.17590-1-brgl@bgdev.pl> <20191204155912.17590-3-brgl@bgdev.pl>
In-Reply-To: <20191204155912.17590-3-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 00:18:40 +0200
Message-ID: <CAHp75Vc2E4iXDvq4wV7nkoizPaz_vRxfYztzwStt9ux9oYWExg@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] gpiolib: have a single place of calling set_config()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 6:04 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Instead of calling the gpiochip's set_config() callback directly and
> checking its existence every time - just add a new routine that performs
> this check internally. Call it in gpio_set_config() and
> gpiod_set_transitory(). Also call it in gpiod_set_debounce() and drop
> the check for chip->set() as it's irrelevant to this config option.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpiolib.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index a31797fe78fa..72211407469f 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -3042,6 +3042,15 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
>   * rely on gpio_request() having been called beforehand.
>   */
>
> +static int gpio_do_set_config(struct gpio_chip *gc, unsigned int offset,
> +                             enum pin_config_param mode)
> +{
> +       if (!gc->set_config)
> +               return -ENOTSUPP;
> +
> +       return gc->set_config(gc, offset, mode);
> +}
> +
>  static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
>                            enum pin_config_param mode)
>  {
> @@ -3060,7 +3069,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
>         }
>
>         config = PIN_CONF_PACKED(mode, arg);
> -       return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;
> +       return gpio_do_set_config(gc, offset, mode);
>  }
>
>  static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
> @@ -3294,15 +3303,9 @@ int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
>
>         VALIDATE_DESC(desc);
>         chip = desc->gdev->chip;
> -       if (!chip->set || !chip->set_config) {
> -               gpiod_dbg(desc,
> -                         "%s: missing set() or set_config() operations\n",
> -                         __func__);
> -               return -ENOTSUPP;
> -       }
>
>         config = pinconf_to_config_packed(PIN_CONFIG_INPUT_DEBOUNCE, debounce);
> -       return chip->set_config(chip, gpio_chip_hwgpio(desc), config);
> +       return gpio_do_set_config(chip, gpio_chip_hwgpio(desc), config);
>  }
>  EXPORT_SYMBOL_GPL(gpiod_set_debounce);
>
> @@ -3339,7 +3342,7 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
>         packed = pinconf_to_config_packed(PIN_CONFIG_PERSIST_STATE,
>                                           !transitory);
>         gpio = gpio_chip_hwgpio(desc);
> -       rc = chip->set_config(chip, gpio, packed);
> +       rc = gpio_do_set_config(chip, gpio, packed);
>         if (rc == -ENOTSUPP) {
>                 dev_dbg(&desc->gdev->dev, "Persistence not supported for GPIO %d\n",
>                                 gpio);
> --
> 2.23.0
>


-- 
With Best Regards,
Andy Shevchenko
