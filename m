Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84626142609
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 09:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgATIoz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 03:44:55 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34007 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgATIoz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 03:44:55 -0500
Received: by mail-ot1-f65.google.com with SMTP id a15so27990025otf.1;
        Mon, 20 Jan 2020 00:44:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kdjFDmHpK9XF0winpVoDYfPnYppvi92C4n7zVPl2Zp0=;
        b=Iysi9HCj2N98Hk3fWUHzYwuRHmIwoeXmlrRsY5GvEQ+LR1RQaJgyIZQ6U4dj/9ktAs
         Ig8CsgC5GgIcMxy03L+HRx09nzP5xlVCYTFLSbs0IaaqpOzWKBZ8sU8NmhfV7w7/GZ3a
         g7utZI0GkaG88IK+koYv4HDxnCdxD78Ftv/8GDoyseSKhw7AgpneOOk2kZHY2OOuX8f0
         cQGH+XMWxg5W41xfyI9CyYk1ufBCNJdstDlCVKMfN/T+BiFy94zQhVYMyjU/23Ltwoiy
         uVJsYKgnJvI+IbnzVqJ+vQ1/BDtztzl9Wa/pNHEL41xJdCvlqK5mo2sLIfUmFeTRubnK
         bHRg==
X-Gm-Message-State: APjAAAVxdZ8EFMLlpVsF8pne6ktHQ51RVi8SeJHtfY1NBairpTJsVEWT
        Lrndl+gZPZeIBIfJ2rQOta4ilytbTLNccKIZrxo=
X-Google-Smtp-Source: APXvYqy/30Y6RSrNBaAzSlxodfDb5Ph0XzdHPJUcUAO6HeXVBIyWvrHlP0eVPtLEofVgH2U4+d71oxhBLNJ2ZndvgxM=
X-Received: by 2002:a05:6830:2141:: with SMTP id r1mr15192738otd.39.1579509894895;
 Mon, 20 Jan 2020 00:44:54 -0800 (PST)
MIME-Version: 1.0
References: <20191224120709.18247-1-brgl@bgdev.pl> <20191224120709.18247-3-brgl@bgdev.pl>
In-Reply-To: <20191224120709.18247-3-brgl@bgdev.pl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Jan 2020 09:44:43 +0100
Message-ID: <CAMuHMdWigj9_CDdDD49qU-y7r+he53v1NEKE9_0RBQCFUrY-Qw@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] gpiolib: have a single place of calling set_config()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Tue, Dec 24, 2019 at 1:08 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Instead of calling the gpiochip's set_config() callback directly and
> checking its existence every time - just add a new routine that performs
> this check internally. Call it in gpio_set_config() and
> gpiod_set_transitory(). Also call it in gpiod_set_debounce() and drop
> the check for chip->set() as it's irrelevant to this config option.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

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

These two lines are not equivalent: the new code no longer uses the
packed value of mode and arg!
Hence this leads to subsequent cleanups in commits e5e42ad224a040f9
("gpiolib: remove set but not used variable 'config'") and d18fddff061d2796
("gpiolib: Remove duplicated function gpio_do_set_config()").

However, what was the purpose of the PIN_CONF_PACKED() translation?
Why is it no longer needed?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
