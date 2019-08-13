Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C60C8ADF4
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2019 06:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbfHMEoc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Aug 2019 00:44:32 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:36602 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbfHMEoc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Aug 2019 00:44:32 -0400
Received: by mail-qk1-f193.google.com with SMTP id d23so3920398qko.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2019 21:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=feSQ5fzyGpqudaaUZJBmdJn4+i2W+ExytZKqnlJjhOQ=;
        b=fEAiBtDH4WxL0M/CqiYIraLRsaDV0yrWtzE72YXboK+fW4t5bmGNHQjf6S9kizbA6g
         mVOZLdcoSOXoDCOQ/2O/XlBIGJaoeM4juLsoWbvjsuwgF3tQtialRBQIGq4MKuY7kGxR
         lpmDd0/DUgNZw8oFtp3t9AruJy/jl9Ughwcic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=feSQ5fzyGpqudaaUZJBmdJn4+i2W+ExytZKqnlJjhOQ=;
        b=UTIfQWwWDCsR2fijhkhw3crQ2v9uzdxhl6lVOA6NQl2tew+jLBqeJ4gbKWrn17Iar2
         cjW6B1KcNSSrduucFWlbkj5tTHMrvnFCaKCUWfRgbSvzi5YHkfUBfWtsxrBC2WpwxLWT
         ThUyAi5AUbP9kpYUaVDacr0R89pQt/O4SmfgLrdsMULR50YiYtCn4Hb0g6VC82Y58ZWf
         q9Zzibcd9ajlVhCcbJbRjemYb+AXbyrIozHKTYYQeaz6Skvs4b6mYfjblKXEKZ/fGqRN
         REczrczkUg1U3L7HJ6DPjyKjOm/GSQ9rwpha/t6YsG4xmYWQGTK+9M6cfryF5KEFTr7x
         4mSA==
X-Gm-Message-State: APjAAAXuAcfk1jeJfZnoC3Mc5NZuHqkdikw3tlp8nlXXCO1F9HRiTwBJ
        R8NQTXfOEL8gAUOM+kMQr9JgRNIuSFPT2WgsQ0Q=
X-Google-Smtp-Source: APXvYqz8hMx3KYhZokl8gNJh9iOmFjj/skcXEkdmA2xfmVd8qsmLJwbVc5HRXnOzytunhbE4xyqnFjHM0L/46+Ou9Fk=
X-Received: by 2002:a05:620a:70f:: with SMTP id 15mr32175988qkc.171.1565671471239;
 Mon, 12 Aug 2019 21:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190809125515.19094-1-linus.walleij@linaro.org>
In-Reply-To: <20190809125515.19094-1-linus.walleij@linaro.org>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 13 Aug 2019 04:44:19 +0000
Message-ID: <CACPK8Xew4myVDGq5SL04kqAVeWkMdF+PsmrkutM8s-nWkJLdeA@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: Pass irqchip when adding gpiochip
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 9 Aug 2019 at 12:55, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
>
> For chained irqchips this is a pretty straight-forward
> conversion.
>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Hi Aspeed folks, it'd be great if you could test/review this
> patch.
> ---
>  drivers/gpio/gpio-aspeed.c | 60 ++++++++++++++++++--------------------
>  1 file changed, 29 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 13d80bfbc3b6..9defe25d4721 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -711,32 +711,6 @@ static void set_irq_valid_mask(struct aspeed_gpio *gpio)
>         }
>  }
>
> -static int aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
> -               struct platform_device *pdev)
> -{
> -       int rc;
> -
> -       rc = platform_get_irq(pdev, 0);
> -       if (rc < 0)
> -               return rc;
> -
> -       gpio->irq = rc;
> -
> -       set_irq_valid_mask(gpio);
> -
> -       rc = gpiochip_irqchip_add(&gpio->chip, &aspeed_gpio_irqchip,
> -                       0, handle_bad_irq, IRQ_TYPE_NONE);
> -       if (rc) {
> -               dev_info(&pdev->dev, "Could not add irqchip\n");
> -               return rc;
> -       }
> -
> -       gpiochip_set_chained_irqchip(&gpio->chip, &aspeed_gpio_irqchip,
> -                                    gpio->irq, aspeed_gpio_irq_handler);
> -
> -       return 0;
> -}
> -
>  static int aspeed_gpio_reset_tolerance(struct gpio_chip *chip,
>                                         unsigned int offset, bool enable)
>  {
> @@ -1189,7 +1163,6 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>         gpio->chip.set_config = aspeed_gpio_set_config;
>         gpio->chip.label = dev_name(&pdev->dev);
>         gpio->chip.base = -1;
> -       gpio->chip.irq.need_valid_mask = true;
>
>         /* Allocate a cache of the output registers */
>         banks = gpio->config->nr_gpios >> 5;
> @@ -1212,16 +1185,41 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>                 aspeed_gpio_change_cmd_source(gpio, bank, 3, GPIO_CMDSRC_ARM);
>         }
>
> -       rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> -       if (rc < 0)
> -               return rc;
> +       /* Optionally set up an irqchip if there is an IRQ */
> +       rc = platform_get_irq(pdev, 0);
> +       if (rc > 0) {
> +               struct gpio_irq_chip *girq;
> +
> +               gpio->irq = rc;
> +               girq = &gpio->chip.irq;
> +               girq->chip = &aspeed_gpio_irqchip;
> +               girq->parent_handler = aspeed_gpio_irq_handler;
> +               girq->num_parents = 1;
> +               girq->parents = devm_kcalloc(&pdev->dev, 1,
> +                                            sizeof(*girq->parents),
> +                                            GFP_KERNEL);

Is there a reason this is kcalloc and not kzalloc?

Other than that,

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> +               if (!girq->parents)
> +                       return -ENOMEM;
> +               girq->parents[0] = gpio->irq;
> +               girq->default_type = IRQ_TYPE_NONE;
> +               girq->handler = handle_bad_irq;
> +               girq->need_valid_mask = true;
> +       }
>
>         gpio->offset_timer =
>                 devm_kzalloc(&pdev->dev, gpio->chip.ngpio, GFP_KERNEL);
>         if (!gpio->offset_timer)
>                 return -ENOMEM;
>
> -       return aspeed_gpio_setup_irqs(gpio, pdev);
> +       rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> +       if (rc < 0)
> +               return rc;
> +
> +       /* Now the valid mask is allocated */
> +       if (gpio->irq)
> +               set_irq_valid_mask(gpio);
> +
> +       return 0;
>  }
>
>  static struct platform_driver aspeed_gpio_driver = {
> --
> 2.21.0
>
