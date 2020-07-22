Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2AD22994A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 15:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgGVNhT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 09:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgGVNhT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 09:37:19 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34FCC0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 06:37:18 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id k5so1377541pjg.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 06:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BHL5eSkDy00xXAumMyYegaoqtI7GDYpbjMnU1dXeiJo=;
        b=eTt/hqTEAyi7L7ukeK4sOYI/k6zlvRwxYxPFstX30hr13CvPX67mkrgqXkpgdo0YHD
         YeBzfTeomB51Qq9COQkuyhICstSjbKFvZFulK9RHRJfcsIVUg2X8kmRSSQuXqw2aMaJN
         TUfEM3vT8VsZgsZEJLMUSx2j0iYc5Ef/aFlQECJ/3tE+g04/sjdiODvjiZq2xcrG8xg1
         mbohRmJ6GsCrSGu2zk9jD0Ow8HTuRmlYPv+5bgTCUYq4eCnNo+OqJ7q8iXxucgOmv7MZ
         JTf9ZUw8c/B69H2kIcc2QrO7vEgKlOS5FJVPMELHLskJ1hon4OG2+xWXYZoc78ZzDPYq
         WYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BHL5eSkDy00xXAumMyYegaoqtI7GDYpbjMnU1dXeiJo=;
        b=ZppW228RBnO4dg8woJueQpSOSpejdUVleYtGdRLSU/ZFGsm5IXkspH92GTyJBIkVGe
         ksENz/66BLyp9XG3DVvZxHXCTQ/o57hIqplyi9IqHo5mvdYO9I4FmB1OE085yJHbb4Ji
         s7AUAVsoDGZEjJzFeo3wHJn9Wl7LfctFfL+9WcsDRu7BgC3m5F79CGV6N7tqJkFdkr5I
         GXl3ZKT1eRX/0lsb31qJUkEHcbG90+f7G5v6bhXGzv5+2iotAbShmMdH4oGbqIPjxQCW
         YK0lPi/1M04xe51JtqYSgeW7Fe5+ZAkjudcx4aIoolHIe0P2Ygi8TN4pNVrmaHtDraYg
         fqnA==
X-Gm-Message-State: AOAM530kf9EcsdhX2eLTMNkZ/mn6dkiJ9u5a5tayD4/J51Qsqm+5IT43
        mB3drSEQ//RCaxUWwn2r9jnXbdN1dASyXqTJnrs=
X-Google-Smtp-Source: ABdhPJz8Axv2lh9DX3+xCApPiPyYSRTshrHEDnSmNkb/qu8Oktr4XMsCTZJl+9X7OVMj0X2j2HplA40H/zE23MCg+gE=
X-Received: by 2002:a17:90a:a393:: with SMTP id x19mr10363257pjp.228.1595425038161;
 Wed, 22 Jul 2020 06:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200722073426.38890-1-linus.walleij@linaro.org>
In-Reply-To: <20200722073426.38890-1-linus.walleij@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Jul 2020 16:37:03 +0300
Message-ID: <CAHp75Vfi8AroC7fJfGq_VvTF7hujjcEM9AM+Nx3QieOZxwxrug@mail.gmail.com>
Subject: Re: [PATCH] gpio: dln2: Use irqchip template
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Daniel Baluta <daniel.baluta@gmail.com>,
        Octavian Purdila <octavian.purdila@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 22, 2020 at 10:37 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit calls to gpiochip_irqchip_add(). The irqchip is
> instead added while adding the gpiochip.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Tested-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Cc: Daniel Baluta <daniel.baluta@gmail.com>
> Cc: Octavian Purdila <octavian.purdila@nxp.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-dln2.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
> index 26b40c8b8a12..4c5f6d0c8d74 100644
> --- a/drivers/gpio/gpio-dln2.c
> +++ b/drivers/gpio/gpio-dln2.c
> @@ -440,6 +440,7 @@ static int dln2_gpio_probe(struct platform_device *pdev)
>  {
>         struct dln2_gpio *dln2;
>         struct device *dev = &pdev->dev;
> +       struct gpio_irq_chip *girq;
>         int pins;
>         int ret;
>
> @@ -476,6 +477,15 @@ static int dln2_gpio_probe(struct platform_device *pdev)
>         dln2->gpio.direction_output = dln2_gpio_direction_output;
>         dln2->gpio.set_config = dln2_gpio_set_config;
>
> +       girq = &dln2->gpio.irq;
> +       girq->chip = &dln2_gpio_irqchip;
> +       /* The event comes from the outside so no parent handler */
> +       girq->parent_handler = NULL;
> +       girq->num_parents = 0;
> +       girq->parents = NULL;
> +       girq->default_type = IRQ_TYPE_NONE;
> +       girq->handler = handle_simple_irq;
> +
>         platform_set_drvdata(pdev, dln2);
>
>         ret = devm_gpiochip_add_data(dev, &dln2->gpio, dln2);
> @@ -484,13 +494,6 @@ static int dln2_gpio_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> -       ret = gpiochip_irqchip_add(&dln2->gpio, &dln2_gpio_irqchip, 0,
> -                                  handle_simple_irq, IRQ_TYPE_NONE);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to add irq chip: %d\n", ret);
> -               return ret;
> -       }
> -
>         ret = dln2_register_event_cb(pdev, DLN2_GPIO_CONDITION_MET_EV,
>                                      dln2_gpio_event);
>         if (ret) {
> --
> 2.26.2
>


-- 
With Best Regards,
Andy Shevchenko
