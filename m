Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F313106DF
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 09:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbhBEIiC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 03:38:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhBEIhq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 03:37:46 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D452DC0613D6;
        Fri,  5 Feb 2021 00:37:05 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d16so6630073wro.11;
        Fri, 05 Feb 2021 00:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=eNfqjY/zwxIcGbCLTuwXZxII3ZokQC9ul9pWtTPMU6I=;
        b=LA/smjCg/2a2TQt6xGxsu+aPKwPtPXr79X+DqzEborwV+fxfnGnoWb7qK9/oAsNlG+
         LyZTRZFD6F5pKu6DXbC51Bo8kBdL+GwMUrvY6YWomok64jh8DA5XWuuZ6X1Vx97cY2qK
         jeHyvGNMiJ6SxOqIrWQE5/0XKv9ojBKT1Q9+RzXdGQy8I89awyza6Z9styxoXVA00j8h
         rmnyHwuFdpD9/cbxg9W9bk5sObtr3sfly6RkmS+hML5JwO3AzozqaRUZWwVj64l6TwJt
         0g61Sw7KuGD8X792yq8zy4nzVPnZvmiBYCJBHB/VDRyTa/DNojT7KmcTShK9aVX1OxIc
         adoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eNfqjY/zwxIcGbCLTuwXZxII3ZokQC9ul9pWtTPMU6I=;
        b=sRyGVC8Q8VTgEaqkm6z1CmkribpxRq8SQ3AMBtmkn0/wFjV/yBZoVkumo7bXD/4xu/
         zIWOTstmp1OvUQzbGsJxnSQRca6bSiwx9jOiCm9GlnkSykTxXgwQkHOMFc2Go+Wje7au
         TUHhKiF5xsqIqq/oqJ/9m8w/2Dub+t0s+LskyIcjXAw77xr17BuqHwYHtfNueTX7G8es
         VhWObf2TqNf7eN62kQjzqpT+r/KARgYI/Ht6fpqn3LscwN5qR43cyUYk9JVumCFqTa3m
         sCoITjBHEzMJL7DsBXrb72U8A3gkS4Olop/VukHNSsX50hTFWj2sj97bKJQUY9fXfzwc
         zK9Q==
X-Gm-Message-State: AOAM5319T7FeYg43F9V7Eu2smHPQcVFFGSbM31t+LYqQKIfyIE7kXVyH
        YSu8/uHHo8gj9mIzRmJM0Yk=
X-Google-Smtp-Source: ABdhPJxNTepENOonxcvzw+BlqfhVSPPoxBngmY5gfOdciOtICKZSrPsF4QjilbytJXVnkE0klw9kxA==
X-Received: by 2002:a5d:6812:: with SMTP id w18mr3721223wru.203.1612514224584;
        Fri, 05 Feb 2021 00:37:04 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id t205sm8360944wmt.28.2021.02.05.00.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 00:37:03 -0800 (PST)
Message-ID: <a3d0abc9c457fd88138035a29b46204e30e939fe.camel@gmail.com>
Subject: Re: [PATCH v4 2/7] gpio: gpio-ep93xx: Fix single irqchip with multi
 gpiochips
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 05 Feb 2021 09:37:03 +0100
In-Reply-To: <20210205080507.16007-3-nikita.shubin@maquefel.me>
References: <20210205080507.16007-1-nikita.shubin@maquefel.me>
         <20210205080507.16007-3-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

On Fri, 2021-02-05 at 11:05 +0300, Nikita Shubin wrote:
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
> ---
>  drivers/gpio/gpio-ep93xx.c | 38 ++++++++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index e3b5e2c37259..3c9f7233e62d 100644
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
> @@ -284,9 +285,11 @@ struct ep93xx_gpio_bank {
>         bool            has_irq;
>         bool            has_hierarchical_irq;
>         unsigned int    irq_base;
> +       const char      *irq_name;
>  };
>  
> -#define EP93XX_GPIO_BANK(_label, _data, _dir, _irq, _base, _has_irq, _has_hier, _irq_base) \
> +#define EP93XX_GPIO_BANK(_label, _data, _dir, _irq, _base, _has_irq, _has_hier, _irq_base, \
> +_irq_name) \
>         {                                                       \
>                 .label          = _label,                       \
>                 .data           = _data,                        \
> @@ -296,20 +299,21 @@ struct ep93xx_gpio_bank {
>                 .has_irq        = _has_irq,                     \
>                 .has_hierarchical_irq = _has_hier,              \
>                 .irq_base       = _irq_base,                    \
> +               .irq_name       = _irq_name,                    \
>         }
>  
>  static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
>         /* Bank A has 8 IRQs */
> -       EP93XX_GPIO_BANK("A", 0x00, 0x10, 0x90, 0, true, false, 64),
> +       EP93XX_GPIO_BANK("A", 0x00, 0x10, 0x90, 0, true, false, 64, "gpio-irq-a"),
>         /* Bank B has 8 IRQs */
> -       EP93XX_GPIO_BANK("B", 0x04, 0x14, 0xac, 8, true, false, 72),
> -       EP93XX_GPIO_BANK("C", 0x08, 0x18, 0x00, 40, false, false, 0),
> -       EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 0x00, 24, false, false, 0),
> -       EP93XX_GPIO_BANK("E", 0x20, 0x24, 0x00, 32, false, false, 0),
> +       EP93XX_GPIO_BANK("B", 0x04, 0x14, 0xac, 8, true, false, 72, "gpio-irq-b"),
> +       EP93XX_GPIO_BANK("C", 0x08, 0x18, 0x00, 40, false, false, 0, 0),
> +       EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 0x00, 24, false, false, 0, 0),
> +       EP93XX_GPIO_BANK("E", 0x20, 0x24, 0x00, 32, false, false, 0, 0),
>         /* Bank F has 8 IRQs */
> -       EP93XX_GPIO_BANK("F", 0x30, 0x34, 0x4c, 16, false, true, 0),
> -       EP93XX_GPIO_BANK("G", 0x38, 0x3c, 0x00, 48, false, false, 0),
> -       EP93XX_GPIO_BANK("H", 0x40, 0x44, 0x00, 56, false, false, 0),
> +       EP93XX_GPIO_BANK("F", 0x30, 0x34, 0x4c, 16, false, true, 0, "gpio-irq-b"),

This copy-paste error makes it obvious, that this information is
superfluous...

> +       EP93XX_GPIO_BANK("G", 0x38, 0x3c, 0x00, 48, false, false, 0, 0),
> +       EP93XX_GPIO_BANK("H", 0x40, 0x44, 0x00, 56, false, false, 0, 0),
>  };
>  
>  static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned offset,
> @@ -331,6 +335,16 @@ static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
>         return EP93XX_GPIO_F_IRQ_BASE + offset;
>  }
>  
> +static void ep93xx_init_irq_chip(struct irq_chip *ic, const char *irq_name)
> +{
> +       ic->name = irq_name;

Assuming you pass "label" here, you could do something like
	ic->name = kasprintf(GFP_KERNEL, "gpio-irq-%s", irq_name);

> +       ic->irq_ack = ep93xx_gpio_irq_ack;
> +       ic->irq_mask_ack = ep93xx_gpio_irq_mask_ack;
> +       ic->irq_mask = ep93xx_gpio_irq_mask;
> +       ic->irq_unmask = ep93xx_gpio_irq_unmask;
> +       ic->irq_set_type = ep93xx_gpio_irq_type;
> +}

-- 
Alexander Sverdlin.


