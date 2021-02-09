Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC34315926
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 23:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhBIWJV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 17:09:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233269AbhBIWFo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 17:05:44 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A1EC08EC87;
        Tue,  9 Feb 2021 14:04:02 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id v15so23868958wrx.4;
        Tue, 09 Feb 2021 14:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=aNKWeT8ewjIKljaUQZ7nHgE6ak/7b2fOMgS7twRaGvk=;
        b=hp7i1rJjnV+qwqXAR8B8jUA0rta5SoL+0bFO01L2LHbBnoR1GahVYLCGkuMmJvIZ8b
         LW3/fIuD2iHH19Dc9J3k+YN7rqkIxI2Nwd4Tu14X9FYcZrJ5Yk0qnRYbeIDZQHl29dW5
         fxXJF875YqG+IbGQNG0YLbkU4c7dRFPR6MDJEWFnu2Zyo5QvJLZ3Q4cO8/fqMskKV8+1
         g3/dUN4I2Kh4Yi4WWOWdNNbK2/KAJor6NCUJESwWIOOd+VTJy0a87Y0v1tc425vnewS4
         OVPWGpwMIt780fJqBJ3hKh/tO+umib4ObfVzli35XsEKbRcRYCQXln3IzOe5gV9laK3S
         PISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aNKWeT8ewjIKljaUQZ7nHgE6ak/7b2fOMgS7twRaGvk=;
        b=J2x5TL1lOsr9gKbHod5709AuC64A+E5ueSMw2av1e6FwBSL74olPGC5Aqym8LPEY5y
         DyNbPs7P+wnVk1DPeIdeEJHasapBENOy6Hkc1BcoNe6Ae2wfSB9d2nm3cVFa4qyAYoKE
         wygIUQq46EKGKK5TPr1rdVj534uxWl/JTNKi6jG5ymU27c3qc9A7icmOryyjwNNg+RGU
         h5xdRfYqjbhbU1AR9QYrJSPO1EiwmLuNpIDrHtcPV4Szsg9fGSsHatvZLYNnyR0JxA4l
         pEzdgTPq7cPOK/SU8s9BEPHlsvDFR1wtPKqXZfbemRcTyvJSddySJh7v7M1X+aH/Gn2E
         Nz7g==
X-Gm-Message-State: AOAM530KYKDS/2aw0uuIPRI+02O4qc9kXJLUmWU5R/oZ5baQjh9N9s+z
        kKZK8Gj9JorvvWYhqAeySwg=
X-Google-Smtp-Source: ABdhPJwJpvdREOlxVU/INWnyVqqEOLBSAluqB/1Xm1aCvnRsA7BWnuj9BZhMN+BSyUgL+ntlrucpyQ==
X-Received: by 2002:a5d:6546:: with SMTP id z6mr182756wrv.125.1612908241478;
        Tue, 09 Feb 2021 14:04:01 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id e16sm14203501wrt.36.2021.02.09.14.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 14:04:00 -0800 (PST)
Message-ID: <223de0d7e692a5871b3fe3dfd899987c793c20da.camel@gmail.com>
Subject: Re: [PATCH v6 2/7] gpio: ep93xx: Fix single irqchip with multi
 gpiochips
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 09 Feb 2021 23:03:59 +0100
In-Reply-To: <20210209133110.7383-3-nikita.shubin@maquefel.me>
References: <20210209133110.7383-1-nikita.shubin@maquefel.me>
         <20210209133110.7383-3-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Nikita!

On Tue, 2021-02-09 at 16:31 +0300, Nikita Shubin wrote:
> Fixes the following warnings which results in interrupts disabled on
> port B/F:
> 
> gpio gpiochip1: (B): detected irqchip that is shared with multiple gpiochips: please fix the driver.
> gpio gpiochip5: (F): detected irqchip that is shared with multiple gpiochips: please fix the driver.
> 
> - added separate irqchip for each interrupt capable gpiochip
> - provided unique names for each irqchip
> 
> Fixes: d2b091961510 ("gpio: ep93xx: Pass irqchip when adding gpiochip")
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> v5->v6:
> - add devm_kasprintf() return value check and move it out from 
> ep93xx_init_irq_chip()
> - removed ep93xx_gpio_irq_chip
> - pass girq->chip instead of removed ep93xx_gpio_irq_chip to
> irq_set_chip_and_handler for port F
> ---
>  drivers/gpio/gpio-ep93xx.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index 64d6c2b4282e..94d9fa0d6aa7 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -38,6 +38,7 @@
>  #define EP93XX_GPIO_F_IRQ_BASE 80
>  
>  struct ep93xx_gpio_irq_chip {
> +       struct irq_chip ic;
>         u8 irq_offset;
>         u8 int_unmasked;
>         u8 int_enabled;
> @@ -263,15 +264,6 @@ static int ep93xx_gpio_irq_type(struct irq_data *d, unsigned int type)
>         return 0;
>  }
>  
> -static struct irq_chip ep93xx_gpio_irq_chip = {
> -       .name           = "GPIO",
> -       .irq_ack        = ep93xx_gpio_irq_ack,
> -       .irq_mask_ack   = ep93xx_gpio_irq_mask_ack,
> -       .irq_mask       = ep93xx_gpio_irq_mask,
> -       .irq_unmask     = ep93xx_gpio_irq_unmask,
> -       .irq_set_type   = ep93xx_gpio_irq_type,
> -};
> -
>  /*************************************************************************
>   * gpiolib interface for EP93xx on-chip GPIOs
>   *************************************************************************/
> @@ -331,6 +323,15 @@ static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
>         return EP93XX_GPIO_F_IRQ_BASE + offset;
>  }
>  
> +static void ep93xx_init_irq_chip(struct device *dev, struct irq_chip *ic)
> +{
> +       ic->irq_ack = ep93xx_gpio_irq_ack;
> +       ic->irq_mask_ack = ep93xx_gpio_irq_mask_ack;
> +       ic->irq_mask = ep93xx_gpio_irq_mask;
> +       ic->irq_unmask = ep93xx_gpio_irq_unmask;
> +       ic->irq_set_type = ep93xx_gpio_irq_type;
> +}
> +
>  static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
>                                 struct platform_device *pdev,
>                                 struct ep93xx_gpio *epg,
> @@ -352,6 +353,8 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
>  
>         girq = &gc->irq;
>         if (bank->has_irq || bank->has_hierarchical_irq) {
> +               struct irq_chip *ic;
> +
>                 gc->set_config = ep93xx_gpio_set_config;
>                 egc->eic = devm_kcalloc(dev, 1,
>                                         sizeof(*egc->eic),
> @@ -359,7 +362,12 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
>                 if (!egc->eic)
>                         return -ENOMEM;
>                 egc->eic->irq_offset = bank->irq;
> -               girq->chip = &ep93xx_gpio_irq_chip;
> +               ic = &egc->eic->ic;
> +               ic->name = devm_kasprintf(dev, GFP_KERNEL, "gpio-irq-%s", bank->label);
> +               if (!ic->name)
> +                       return -ENOMEM;
> +               ep93xx_init_irq_chip(dev, ic);
> +               girq->chip = ic;
>         }
>  
>         if (bank->has_irq) {
> @@ -401,7 +409,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
>                         gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
>                         irq_set_chip_data(gpio_irq, &epg->gc[5]);
>                         irq_set_chip_and_handler(gpio_irq,
> -                                                &ep93xx_gpio_irq_chip,
> +                                                girq->chip,
>                                                  handle_level_irq);
>                         irq_clear_status_flags(gpio_irq, IRQ_NOREQUEST);
>                 }

-- 
Alexander Sverdlin.


