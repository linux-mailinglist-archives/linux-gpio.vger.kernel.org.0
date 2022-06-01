Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C64CD53ABB4
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 19:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236293AbiFARTg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 13:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355397AbiFARTf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 13:19:35 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880C56C565
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 10:19:34 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id x62so3103293ede.10
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jun 2022 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5xU2wpYqlOM5GuIXjr+avT+nhNT3Jx23FahP+Ju1xWY=;
        b=tfuKJcezjUx3Ws0txBom/rmXQop/X0zS2hBpJrtxJ8GcUAqXuh7s6qqLYNBYHkEryp
         4MldMMxESSIjppnttIZeg/EdtBHIMmJBrs3FNAfMkh1RU0US/F2l96Y86uCIzTQgAbBD
         OZWTTUUjzzVmVBBs3hvpJFm34hiOS0j9BEcne0HTm7DW5gdGRJPjRv0NdQVLM3v6+Q+C
         qByYtbJH9hANjsi+9hglP8+P3dykXjml8Hq7wjw2vivlcJxa2xT6hNeD0F1lxryOaxjc
         1hVDYEEWJinVv+5hBa+sFHerGdGavQIYhXPlrNZ4sgKP9uux1BbQPLMsEFuTaqAEbq3K
         ODgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5xU2wpYqlOM5GuIXjr+avT+nhNT3Jx23FahP+Ju1xWY=;
        b=KyIeGORObiP3I4mnJpkdLNv9Xpo6Rh5izX20OxxgqcPm+Z4Luf8pMLI0JYl0H0brWb
         ejGRthLUXy4FrONWcmCsDMu7CPNteGWHmADtI9Aullu4GBVLQKg/qLI5TtdRwO/gT4cG
         5+9iVVnJbwUPf8PV9d/jsdPLBv2TTLN8fSBht4VijQ5Ks+C5lNyXhbqE63asNHXTVdaj
         4E4xFZvqgG1YV7SsFAfSLcr4ZB2HZN6XCbPdWuYAMwUM27Bu0aqul0EjDpW0/5dSeGZ+
         jZIj9HLwqh1qPB6EFU3O4cixAp40aNN+ZTZLXdrxlm3KfrSTWsbEwmTaWugP5xQVSEC8
         3wvQ==
X-Gm-Message-State: AOAM533vmkopkTWHWLDftojPmOZpltMO5aWlPcyuP6bJf3sbVhcMfig1
        dKOFRkHgebcPk7SeBLwknnDYlE5OCPh8LjMFOfysRg==
X-Google-Smtp-Source: ABdhPJyTWs+Sv41WQ+qLf59C4KC3/91jojpSVlTzGdphOf6UUtKQ973ykP5ac7nJTNS0jI2xf+JEvBnPdA3AX7YczF8=
X-Received: by 2002:a05:6402:1449:b0:42d:d250:e504 with SMTP id
 d9-20020a056402144900b0042dd250e504mr811588edx.213.1654103973056; Wed, 01 Jun
 2022 10:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220601153656.76454-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220601153656.76454-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 1 Jun 2022 19:19:22 +0200
Message-ID: <CAMRc=McgEzFcmgcWMb3L3Drjcyzhs0kb4JfBHMi7AoAU04txLw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: sch: make irq_chip immutable
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 1, 2022 at 5:37 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Since recently, the kernel is nagging about mutable irq_chips:
>
>    "not an immutable chip, please consider fixing it!"
>
> Drop the unneeded copy, flag it as IRQCHIP_IMMUTABLE, add the new
> helper functions and call the appropriate gpiolib functions.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-sch.c | 35 ++++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
> index acda4c5052d3..8a83f7bf4382 100644
> --- a/drivers/gpio/gpio-sch.c
> +++ b/drivers/gpio/gpio-sch.c
> @@ -38,7 +38,6 @@
>
>  struct sch_gpio {
>         struct gpio_chip chip;
> -       struct irq_chip irqchip;
>         spinlock_t lock;
>         unsigned short iobase;
>         unsigned short resume_base;
> @@ -218,11 +217,9 @@ static void sch_irq_ack(struct irq_data *d)
>         spin_unlock_irqrestore(&sch->lock, flags);
>  }
>
> -static void sch_irq_mask_unmask(struct irq_data *d, int val)
> +static void sch_irq_mask_unmask(struct gpio_chip *gc, irq_hw_number_t gpio_num, int val)
>  {
> -       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct sch_gpio *sch = gpiochip_get_data(gc);
> -       irq_hw_number_t gpio_num = irqd_to_hwirq(d);
>         unsigned long flags;
>
>         spin_lock_irqsave(&sch->lock, flags);
> @@ -232,14 +229,32 @@ static void sch_irq_mask_unmask(struct irq_data *d, int val)
>
>  static void sch_irq_mask(struct irq_data *d)
>  {
> -       sch_irq_mask_unmask(d, 0);
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       irq_hw_number_t gpio_num = irqd_to_hwirq(d);
> +
> +       sch_irq_mask_unmask(gc, gpio_num, 0);
> +       gpiochip_disable_irq(gc, gpio_num);
>  }
>
>  static void sch_irq_unmask(struct irq_data *d)
>  {
> -       sch_irq_mask_unmask(d, 1);
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       irq_hw_number_t gpio_num = irqd_to_hwirq(d);
> +
> +       gpiochip_enable_irq(gc, gpio_num);
> +       sch_irq_mask_unmask(gc, gpio_num, 1);
>  }
>
> +static const struct irq_chip sch_irqchip = {
> +       .name = "sch_gpio",
> +       .irq_ack = sch_irq_ack,
> +       .irq_mask = sch_irq_mask,
> +       .irq_unmask = sch_irq_unmask,
> +       .irq_set_type = sch_irq_type,
> +       .flags = IRQCHIP_IMMUTABLE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
>  static u32 sch_gpio_gpe_handler(acpi_handle gpe_device, u32 gpe, void *context)
>  {
>         struct sch_gpio *sch = context;
> @@ -367,14 +382,8 @@ static int sch_gpio_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, sch);
>
> -       sch->irqchip.name = "sch_gpio";
> -       sch->irqchip.irq_ack = sch_irq_ack;
> -       sch->irqchip.irq_mask = sch_irq_mask;
> -       sch->irqchip.irq_unmask = sch_irq_unmask;
> -       sch->irqchip.irq_set_type = sch_irq_type;
> -
>         girq = &sch->chip.irq;
> -       girq->chip = &sch->irqchip;
> +       gpio_irq_chip_set_chip(girq, &sch_irqchip);
>         girq->num_parents = 0;
>         girq->parents = NULL;
>         girq->parent_handler = NULL;
> --
> 2.35.1
>

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
