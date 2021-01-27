Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344033059F2
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 12:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236675AbhA0LhJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 06:37:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236743AbhA0LfG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 06:35:06 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50077C06174A;
        Wed, 27 Jan 2021 03:34:26 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id c12so1535528wrc.7;
        Wed, 27 Jan 2021 03:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Q6b+1UJ94SrHM9YoZWUW6Ba704krJMsxqmPoO23+o7Y=;
        b=OJyUkFvxajJtTVTxSsfuE27E6p8deuvhKxhUK5hsR9nqXmAccg/DLo4nsf1IHKcw5n
         XbWN+q6KA/l+0EBRAqvZlsXkE2t9q105ZQQqDKYxsdbygPZFUKhHB3u53MzwkSkJTHau
         TvAgpJLR8ZY9OFiu7+6/YRGTPKihZ18udUM9H/DSPe8XrfEAUz6nrqaakoemmb8G0/Ki
         8mAfFzEjZzBzXXzkKbT7SnCft2vHGNF9lI/1gOb4O/DFPYYmRBaRdKpHXlTZ7t1aP0DD
         gwhwPD0hToNBB4g0r1cLh1VYyA0rRom6Rubr6vNE5rl+SK8tJCqDIanJq31la+rnppdH
         XWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Q6b+1UJ94SrHM9YoZWUW6Ba704krJMsxqmPoO23+o7Y=;
        b=a7pYikBFmucjO1QuMp/nmnDvrZEvoVKeaI+KEgMnrnyF4uyT76tnD8h2e90wHwlHKb
         uNDMPN6APnFl5pJ7eXeypCkn0MpST62h7M9OD+UwwuPy1cxlVg2RrtyaEkiETP/5v636
         OzvV9UblP/3PV0uk89gORFJoEMV6JTUxopPfYpliXmP5jonR4ga2XaeNz7TRfrK+jGPF
         xPgCpIsEfAg5z84d7lehN2KePTjM2iTTNohqCZP/GDZ17X1K7VOzmJ32tFRupTXmJ3II
         M304ZIi2azg0dfwzyP9H2RYgc8pVhRtpVVhDEWoBnyYENvywYvHTVcq4jTNGr4kHxrum
         Bmdw==
X-Gm-Message-State: AOAM530pN/UnG5Cgpn3mmlc2lblJy5wRaBeEyj6lpSiscm7P5nzs88g3
        YUsgu4eS5/ZyhIGQoQYm5fo=
X-Google-Smtp-Source: ABdhPJzCEoOE5KD4clRDsuWj7AzHlFuErA+IV2gYegV7tMrwwlJOhVZiBS9DM4SjEcMrynbenPmf8w==
X-Received: by 2002:a5d:6cb4:: with SMTP id a20mr10745650wra.192.1611747264977;
        Wed, 27 Jan 2021 03:34:24 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id m82sm2193218wmf.29.2021.01.27.03.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 03:34:24 -0800 (PST)
Message-ID: <409a17a00b4797b56ce6d47441c6477d34734309.camel@gmail.com>
Subject: Re: [PATCH v2 9/9] gpio: ep93xx: replace bools with idx for IRQ
 ports
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 27 Jan 2021 12:34:23 +0100
In-Reply-To: <20210127104617.1173-10-nikita.shubin@maquefel.me>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-10-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Nikita!

On Wed, 2021-01-27 at 13:46 +0300, Nikita Shubin wrote:
> Replace boolean values used for determining if gpiochip is IRQ
> capable
> or not with index.

What's the purpose of this patch?
It neither makes the code more effective nor does it make
the code more readable IMO. There are also some changes in the
code which were not mentioned in the commit message.

> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  drivers/gpio/gpio-ep93xx.c | 47 ++++++++++++++++++++----------------
> --
>  1 file changed, 25 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index 2aee13b5067d..f75a33b79504 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -44,6 +44,8 @@ struct ep93xx_gpio {
>         struct irq_chip         ic[EP93XX_GPIO_IRQ_CHIPS_NUM];
>  };
>  
> +#define EP93XX_GPIO_A_PORT_INDEX 0
> +#define EP93XX_GPIO_B_PORT_INDEX 1
>  /*
>   * F Port index in GPIOCHIP'S array is 5
>   * but we use index 2 for stored values and offsets
> @@ -291,38 +293,36 @@ static struct irq_chip ep93xx_gpio_irq_chip = {
>   * gpiolib interface for EP93xx on-chip GPIOs
>  
> *********************************************************************
> ****/
>  struct ep93xx_gpio_bank {
> +       u8              idx;
>         const char      *label;
>         int             data;
>         int             dir;
>         int             base;
> -       bool            has_irq;
> -       bool            has_hierarchical_irq;
>         unsigned int    irq_base;
>  };
>  
> -#define EP93XX_GPIO_BANK(_label, _data, _dir, _base, _has_irq,
> _has_hier, _irq_base) \
> +#define EP93XX_GPIO_BANK(_index, _label, _data, _dir, _base,
> _irq_base) \
>         {                                                       \
> +               .idx            = _index,                       \
>                 .label          = _label,                       \
>                 .data           = _data,                        \
>                 .dir            = _dir,                         \
>                 .base           = _base,                        \
> -               .has_irq        = _has_irq,                     \
> -               .has_hierarchical_irq = _has_hier,              \
>                 .irq_base       = _irq_base,                    \
>         }
>  
>  static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
>         /* Bank A has 8 IRQs */
> -       EP93XX_GPIO_BANK("A", 0x00, 0x10, 0, true, false,
> EP93XX_GPIO_A_IRQ_BASE),
> +       EP93XX_GPIO_BANK(0, "A", 0x00, 0x10, 0,
> EP93XX_GPIO_A_IRQ_BASE),
>         /* Bank B has 8 IRQs */
> -       EP93XX_GPIO_BANK("B", 0x04, 0x14, 8, true, false,
> EP93XX_GPIO_B_IRQ_BASE),
> -       EP93XX_GPIO_BANK("C", 0x08, 0x18, 40, false, false, 0),
> -       EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 24, false, false, 0),
> -       EP93XX_GPIO_BANK("E", 0x20, 0x24, 32, false, false, 0),
> +       EP93XX_GPIO_BANK(1, "B", 0x04, 0x14, 8,
> EP93XX_GPIO_B_IRQ_BASE),
> +       EP93XX_GPIO_BANK(2, "C", 0x08, 0x18, 40, 0),
> +       EP93XX_GPIO_BANK(3, "D", 0x0c, 0x1c, 24, 0),
> +       EP93XX_GPIO_BANK(4, "E", 0x20, 0x24, 32, 0),
>         /* Bank F has 8 IRQs */
> -       EP93XX_GPIO_BANK("F", 0x30, 0x34, 16, false, true,
> EP93XX_GPIO_F_IRQ_BASE),
> -       EP93XX_GPIO_BANK("G", 0x38, 0x3c, 48, false, false, 0),
> -       EP93XX_GPIO_BANK("H", 0x40, 0x44, 56, false, false, 0),
> +       EP93XX_GPIO_BANK(5, "F", 0x30, 0x34, 16,
> EP93XX_GPIO_F_IRQ_BASE),
> +       EP93XX_GPIO_BANK(6, "G", 0x38, 0x3c, 48, 0),
> +       EP93XX_GPIO_BANK(7, "H", 0x40, 0x44, 56, 0),
>  };
>  
>  static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned
> offset,
> @@ -356,10 +356,11 @@ static void ep93xx_init_irq_chips(struct
> ep93xx_gpio *epg)
>  }
>  
>  static int ep93xx_gpio_add_ab_irq_chip(struct platform_device *pdev,
> -                                       struct gpio_irq_chip *girq,
> +                                       struct gpio_chip *gc,
>                                         unsigned int irq_base)
>  {
>         struct device *dev = &pdev->dev;
> +       struct gpio_irq_chip *girq = &gc->irq;
>         int ab_parent_irq = platform_get_irq(pdev, 0);
>  
>         girq->parent_handler = ep93xx_gpio_ab_irq_handler;
> @@ -378,12 +379,13 @@ static int ep93xx_gpio_add_ab_irq_chip(struct
> platform_device *pdev,
>  }
>  
>  static int ep93xx_gpio_add_f_irq_chip(struct platform_device *pdev,
> -                                       struct gpio_irq_chip *girq,
> +                                       struct gpio_chip *gc,
>                                         unsigned int irq_base)
>  {
>         int gpio_irq;
>         int i;
>         struct device *dev = &pdev->dev;
> +       struct gpio_irq_chip *girq = &gc->irq;
>  
>         /*
>          * FIXME: convert this to use hierarchical IRQ support!
> @@ -397,10 +399,10 @@ static int ep93xx_gpio_add_f_irq_chip(struct
> platform_device *pdev,
>         if (!girq->parents)
>                 return -ENOMEM;
>         /* Pick resources 1..8 for these IRQs */
> -       for (i = 0; i < ARRAY_SIZE(girq->parents); i++) {
> +       for (i = 0; i < girq->num_parents; i++) {
>                 girq->parents[i] = platform_get_irq(pdev, i + 1);
>                 gpio_irq = irq_base + i;
> -               irq_set_chip_data(gpio_irq, &epg->gc[5]);
> +               irq_set_chip_data(gpio_irq, gc);
>                 irq_set_chip_and_handler(gpio_irq,
>                                          &ep93xx_gpio_irq_chip,
>                                          handle_level_irq);
> @@ -433,21 +435,22 @@ static int ep93xx_gpio_add_bank(struct
> gpio_chip *gc,
>         gc->base = bank->base;
>  
>         girq = &gc->irq;
> -       if (bank->has_irq || bank->has_hierarchical_irq) {
> +       if (bank->irq_base != 0) {
>                 gc->set_config = ep93xx_gpio_set_config;
>                 port = ep93xx_gpio_port(epg, gc);
>                 girq->chip = &epg->ic[port];
>         }
>  
> -       if (bank->has_irq) {
> -               err = ep93xx_gpio_add_ab_irq_chip(pdev, girq, bank-
> >irq_base);
> +       if (bank->idx == EP93XX_GPIO_A_PORT_INDEX ||
> +               bank->idx == EP93XX_GPIO_B_PORT_INDEX) {
> +               err = ep93xx_gpio_add_ab_irq_chip(pdev, gc, bank-
> >irq_base);
>                 if (err)
>                         return err;
>         }
>  
>         /* Only bank F has especially funky IRQ handling */
> -       if (bank->has_hierarchical_irq) {
> -               err = ep93xx_gpio_add_f_irq_chip(pdev, girq, bank-
> >irq_base);
> +       if (bank->idx == EP93XX_GPIO_F_PORT_INDEX) {
> +               err = ep93xx_gpio_add_f_irq_chip(pdev, gc, bank-
> >irq_base);
>                 if (err)
>                         return err;
>         }

-- 
Alexander Sverdlin.


