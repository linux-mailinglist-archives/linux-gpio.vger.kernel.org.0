Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 461D7EFB35
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388093AbfKEKba (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:31:30 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35708 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388022AbfKEKba (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:31:30 -0500
Received: by mail-oi1-f193.google.com with SMTP id n16so17059730oig.2;
        Tue, 05 Nov 2019 02:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9X0DXNrB/4MiRITEvRdYyhvXbr57xrW/zeknfciLamY=;
        b=stQApTNmuVIa2YAZasv7ex8oC/1Ab5qa1jvJlpJhQDljcVjHa+p7t5sIvREtwxMm2X
         ZB+az4J4gWm/bILHqBmFz8E9Sah4j7RDMDmLy7+yRaDT6jocfnbli5AzN/nff4fmGcU3
         6k2VT4j/4CU7y6qCIovZOuqua4Chwk2VlJSkZ3Xq5hlndFh30PbmLTd/utJQcqr8pREn
         SHD1qaMFEy6UZSgaUZOn4W0VHHtDVYL5pmgQABz9KZpEIUBfAoXz2+eFgVrIIhUCWG1r
         C0XolAacoaUEScnZVxfX5B8uCQ1w+f1W6WgYT51LrM1XRrRx2JWfJgN/yRzKGIaGSKJh
         Njqw==
X-Gm-Message-State: APjAAAWM2qxDMV4fQvSefIS0Uc8QVClZCqJyEZhQgrUQWBpxANhyoiuV
        RVJpodJMjVxAULSRCMUO9L4AZd7XDCyql2ABhUg=
X-Google-Smtp-Source: APXvYqzaVPIaoOsr7E7sRmBza2Q4igYoE9YRw29ruaDMLtQK+/3iEy/DNnyBgGw6IdcB0+QMJ54HHaB16f6Jz5fA+eo=
X-Received: by 2002:aca:fc92:: with SMTP id a140mr3154328oii.153.1572949889346;
 Tue, 05 Nov 2019 02:31:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1572945734.git.matti.vaittinen@fi.rohmeurope.com> <07ed3f5b199c81fcb214b9e0e6e37bfed079e2f7.1572945734.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <07ed3f5b199c81fcb214b9e0e6e37bfed079e2f7.1572945734.git.matti.vaittinen@fi.rohmeurope.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Nov 2019 11:31:18 +0100
Message-ID: <CAMuHMdWOBXQ0VzS_OBNSxGG3QhroFQ6-H=8oedk+V43UYC14uw@mail.gmail.com>
Subject: Re: [PATCH 10/62] gpio: gpio-bd9571mwv: Use new GPIO_LINE_DIRECTION
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Matti,

On Tue, Nov 5, 2019 at 11:15 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
> It's hard for occasional GPIO code reader/writer to know if values 0/1
> equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT to help them out.
>
> NOTE: This commit also changes the return value for direction get
> to equal 1 for direction INPUT. Prior this commit the driver returned
> different values depending on GPIO pin for the INPUT state.

Indeed. Which means you cannot assume the assembler output
before/after is identical (which it should be for most changes).

> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/gpio/gpio-bd9571mwv.c
> +++ b/drivers/gpio/gpio-bd9571mwv.c
> @@ -37,8 +37,10 @@ static int bd9571mwv_gpio_get_direction(struct gpio_chip *chip,
>         ret = regmap_read(gpio->bd->regmap, BD9571MWV_GPIO_DIR, &val);
>         if (ret < 0)
>                 return ret;

Nit: I'd keep the blank line here.

> +       if (val & BIT(offset))
> +               return GPIO_LINE_DIRECTION_IN;
>
> -       return val & BIT(offset);
> +       return GPIO_LINE_DIRECTION_OUT;
>  }
>
>  static int bd9571mwv_gpio_direction_input(struct gpio_chip *chip,

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
