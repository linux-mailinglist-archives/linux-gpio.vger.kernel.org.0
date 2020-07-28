Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945FE231598
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jul 2020 00:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729491AbgG1WfM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 18:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729223AbgG1WfM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2020 18:35:12 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B7FC061794
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 15:35:12 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id p27so2784202uaa.12
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2020 15:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/FYwu3cQY9aU2xN7/NqfHQEEKyj8nkI9A4URCbTpZCE=;
        b=CzLR9HFFxMO0o00FADgrGs6ocjyw0QyOVGv/dGMZr0u2vcdamA+xFMRZQXLGybu0i4
         oO8JMbZRKAg5aoLnvWA5NikmnkomBoQdHqQ0hVCAzmQ+AkDdMYD0lm4RED0YB36gwFIg
         CSAwu1asxQIaC6Jt+2R0O3CaHxgHYOik9KxdylC2GBzHQeP2wtlDk0bOwletS2mkBggj
         EWZn2TiJfvTFdYIY/1JN2GzQ1kW7bcOLKFExQuBfqm1ZTYOWGh32hGzM00U/P5uaUU/B
         hX3MtuRgrqDFWv0GOAEZyhG7qLWBuJWQTfkKr7YI8P/ZXAIRo0QJBWVbR7pq8xoa2llf
         dkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/FYwu3cQY9aU2xN7/NqfHQEEKyj8nkI9A4URCbTpZCE=;
        b=HDVSOv93V8V6/qbkRfR6DJkXUOzzrHQAt5jIUDPGjivaOWq+HBMqAVT6II570vtq83
         uUkRQNPgfpkBcf1gfvKoN+bqv05uvX6IsRpXiw4eFF8laMQoObD5jhKbmQ5c49JFOyc+
         KLjRWAsxr9pEO7GFYFjGhIKWgbuWOJX9of8SKNQZIZ2Y/uesfAWkQ50V92G7OjzrzuCm
         HDyDkCt6oBf/WLZz2cszKaY2xWy1BVofcg+Q1G2MnC1OIPdXoA+RiyWKdS+OCPAcBpyA
         PituCCNz4a2hPMeYceXn8qGXOT+lEbYnbS2/aqOlNPukiXCiI6WSINEuVx+3kT7H7esb
         0xtQ==
X-Gm-Message-State: AOAM531K4L/EQcxtcFnkCKcWiMcYqwQmJ50WpWdIbIhZCJZNlFJehbrz
        zdPfpiwKgZKsJUQc7Vae+UkYh+gY5ZUpefxirQXtjw==
X-Google-Smtp-Source: ABdhPJwGlC/GJfX2UeLHtcLY9ZZP+zPXDTM71/OoJoFcKJdNf3cU3Tj+aet6F2Ckw8OEzCCrJUq6SUTUGk38G7s1ixI=
X-Received: by 2002:ab0:7183:: with SMTP id l3mr7493338uao.139.1595975711237;
 Tue, 28 Jul 2020 15:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200726221259.133536-1-linus.walleij@linaro.org>
In-Reply-To: <20200726221259.133536-1-linus.walleij@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 29 Jul 2020 01:34:59 +0300
Message-ID: <CAPLW+4n3A7vEU-SUHqmLgsUKn-vU3S_GLAv1-=1hPC2fH2Zp9g@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: max732x: Use irqchip template
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, 27 Jul 2020 at 01:15, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit calls to gpiochip_irqchip_add_nested() and
> gpiochip_set_nested_irqchip(). The irqchip is instead
> added while adding the gpiochip.
>
> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Set up the IRQ template *before* registering the GPIO
>   chip.
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>

Everything works fine with MAX7325. Checked LEDs (on O8-O15 pins) and
buttons via interrupts (on P0-P7 pins). The code looks good as well,
much clearer with interrupt controller implementation hidden behind
the GPIO chip abstraction.

Thanks!

>  drivers/gpio/gpio-max732x.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
> index 63472f308857..238cbe926b9f 100644
> --- a/drivers/gpio/gpio-max732x.c
> +++ b/drivers/gpio/gpio-max732x.c
> @@ -503,6 +503,8 @@ static int max732x_irq_setup(struct max732x_chip *chip,
>
>         if (((pdata && pdata->irq_base) || client->irq)
>                         && has_irq != INT_NONE) {
> +               struct gpio_irq_chip *girq;
> +
>                 if (pdata)
>                         irq_base = pdata->irq_base;
>                 chip->irq_features = has_irq;
> @@ -517,19 +519,17 @@ static int max732x_irq_setup(struct max732x_chip *chip,
>                                 client->irq);
>                         return ret;
>                 }
> -               ret =  gpiochip_irqchip_add_nested(&chip->gpio_chip,
> -                                                  &max732x_irq_chip,
> -                                                  irq_base,
> -                                                  handle_simple_irq,
> -                                                  IRQ_TYPE_NONE);
> -               if (ret) {
> -                       dev_err(&client->dev,
> -                               "could not connect irqchip to gpiochip\n");
> -                       return ret;
> -               }
> -               gpiochip_set_nested_irqchip(&chip->gpio_chip,
> -                                           &max732x_irq_chip,
> -                                           client->irq);
> +
> +               girq = &chip->gpio_chip.irq;
> +               girq->chip = &max732x_irq_chip;
> +               /* This will let us handle the parent IRQ in the driver */
> +               girq->parent_handler = NULL;
> +               girq->num_parents = 0;
> +               girq->parents = NULL;
> +               girq->default_type = IRQ_TYPE_NONE;
> +               girq->handler = handle_simple_irq;
> +               girq->threaded = true;
> +               girq->first = irq_base; /* FIXME: get rid of this */
>         }
>
>         return 0;
> @@ -695,11 +695,11 @@ static int max732x_probe(struct i2c_client *client,
>                         return ret;
>         }
>
> -       ret = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
> +       ret = max732x_irq_setup(chip, id);
>         if (ret)
>                 return ret;
>
> -       ret = max732x_irq_setup(chip, id);
> +       ret = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
>         if (ret)
>                 return ret;
>
> --
> 2.26.2
>
