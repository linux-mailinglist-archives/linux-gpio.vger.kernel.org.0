Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E779310808
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 10:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhBEJhZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 04:37:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhBEJfS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 04:35:18 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22178C0613D6;
        Fri,  5 Feb 2021 01:34:37 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id p15so6840790wrq.8;
        Fri, 05 Feb 2021 01:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7w5jnG4xdJZgc9Rx5GYT3LYSSM2BDSwwdmkQXQ3eCAw=;
        b=MoMAQM6Y2qEp3bi6rKecrJzZB9wrr0NYVjECMguGG8X0e/8D7f6UYXw7DJlBXilV9z
         ZI64Dg+RpQd3cuA0PNNcrS3aholh3HU/YipNvY3bSjDiJn9kdl/+RZ93VADNxZj/UeQR
         AePZeEEGSFlti7SkOZAQ0YUjJLhXCKq5c9MJKZu0tw2rq+c9yYEV8Sxv8fWr5io0HgdO
         r5rN/Nasg2ZYjs7k59YWwyNPIbnYiVpuvQdPDBiYovyLCE8miwLhnWeFtoqVc4HT/dw+
         1W615tvvIp4rxrCU0/agPrdFf1fEeukSv67lkzmdGMQebwE9dJODHI32t07aTc1l0JQl
         5IyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7w5jnG4xdJZgc9Rx5GYT3LYSSM2BDSwwdmkQXQ3eCAw=;
        b=P0j3wt9I9tRB1E9PihrZJXcBYRh7EPGo9Hs8dxQ9uJpFlISajh6SKyewkw84/sScl+
         6rzn00rKCLrWlTg4KO01NCOT/AuhKeMym9CquAwaHHrI2PQZRWne4xl6a75oIO72LRuV
         2rHsAp+LDwD6TvFOFhnZTtQgD99/1JCsBFVw0+C74w0wRQHj9Z+SiOpWM9MSOwGGabSn
         csex80i5zMNbjwreEMurn4SISEkc/2p9mJc2dWgIhqMY+k573hx7HsLwcMlm+4bKyt0f
         fBCfoZqiuOgsDxLe33xxHEM+4cpsLHTTOPvoh2lLzhEWGROZtVX7/Rgrn29mEprph1Ha
         +hGA==
X-Gm-Message-State: AOAM532dYblFttmMwCfoGkzJxIjmBgqYXhRB7i6vYAkpLVLDa0E/2pww
        x5A4I0UpyIzkMTOdvaskgUs=
X-Google-Smtp-Source: ABdhPJyfhq1Guaf/1eGem0svHDy/UZI7pShXX3k1Bzn89bulrASjKx+r9g6h4G34FMQuUDMu1xEj4g==
X-Received: by 2002:a5d:6812:: with SMTP id w18mr3995690wru.203.1612517675893;
        Fri, 05 Feb 2021 01:34:35 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id b11sm11293623wrp.60.2021.02.05.01.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 01:34:35 -0800 (PST)
Message-ID: <e0230ede94c43901c2ba347cc1d2a350ae677598.camel@gmail.com>
Subject: Re: [PATCH v4 1/7] gpio: gpio-ep93xx: fix BUG_ON port F usage
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 05 Feb 2021 10:34:34 +0100
In-Reply-To: <20210205080507.16007-2-nikita.shubin@maquefel.me>
References: <20210205080507.16007-1-nikita.shubin@maquefel.me>
         <20210205080507.16007-2-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Nikita!

Overall looks good to me, except one missing "static" qialifier
below...

On Fri, 2021-02-05 at 11:05 +0300, Nikita Shubin wrote:
> Two index spaces and ep93xx_gpio_port conversion are confusing.
> 
> Instead add a separate struct to store necessary data and remove
> ep93xx_gpio_port.
> 
> - add struct to store IRQ related data for each IRQ capable chip
> - replace offset array with defined offsets
> - add IRQ registers offset for each IRQ capable chip into
>   ep93xx_gpio_banks
> 
> ------------[ cut here ]------------
> kernel BUG at drivers/gpio/gpio-ep93xx.c:64!
> ---[ end trace 3f6544e133e9f5ae ]---
> 
> Fixes: fd935fc421e74 ("gpio: ep93xx: Do not pingpong irq numbers")
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
> v3->v4:
> - drop ep93xx_gpio_port
> - embed IRQ data into struct ep93xx_gpio_irq_chip, 
>   which also contains offset of specific IRQ
> - allocate ep93xx_gpio_irq_chip for IRQ capable gpiochips
> - drop offset arrays
> - add IRQ register offsets defines
> - add IRQ chip offset to ep93xx_gpio_banks
> ---
>  drivers/gpio/gpio-ep93xx.c | 186 ++++++++++++++++++++-----------------
>  1 file changed, 99 insertions(+), 87 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index 226da8df6f10..e3b5e2c37259 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -25,6 +25,9 @@
>  /* Maximum value for gpio line identifiers */
>  #define EP93XX_GPIO_LINE_MAX 63
>  
> +/* Number of GPIO chips in EP93XX */
> +#define EP93XX_GPIO_CHIP_NUM 8
> +
>  /* Maximum value for irq capable line identifiers */
>  #define EP93XX_GPIO_LINE_MAX_IRQ 23
>  
> @@ -34,74 +37,74 @@
>   */
>  #define EP93XX_GPIO_F_IRQ_BASE 80
>  
> -struct ep93xx_gpio {
> -       void __iomem            *base;
> -       struct gpio_chip        gc[8];
> +struct ep93xx_gpio_irq_chip {
> +       u8 irq_offset;
> +       u8 int_unmasked;
> +       u8 int_enabled;
> +       u8 int_type1;
> +       u8 int_type2;
> +       u8 int_debounce;
>  };
>  
> -/*************************************************************************
> - * Interrupt handling for EP93xx on-chip GPIOs
> - *************************************************************************/
> -static unsigned char gpio_int_unmasked[3];
> -static unsigned char gpio_int_enabled[3];
> -static unsigned char gpio_int_type1[3];
> -static unsigned char gpio_int_type2[3];
> -static unsigned char gpio_int_debounce[3];
> -
> -/* Port ordering is: A B F */
> -static const u8 int_type1_register_offset[3]   = { 0x90, 0xac, 0x4c };
> -static const u8 int_type2_register_offset[3]   = { 0x94, 0xb0, 0x50 };
> -static const u8 eoi_register_offset[3]         = { 0x98, 0xb4, 0x54 };
> -static const u8 int_en_register_offset[3]      = { 0x9c, 0xb8, 0x58 };
> -static const u8 int_debounce_register_offset[3]        = { 0xa8, 0xc4, 0x64 };
> -
> -static void ep93xx_gpio_update_int_params(struct ep93xx_gpio *epg, unsigned port)
> -{
> -       BUG_ON(port > 2);
> +struct ep93xx_gpio_chip {
> +       struct gpio_chip                gc;
> +       struct ep93xx_gpio_irq_chip     *eic;
> +};
>  
> -       writeb_relaxed(0, epg->base + int_en_register_offset[port]);
> +struct ep93xx_gpio {
> +       void __iomem            *base;
> +       struct ep93xx_gpio_chip gc[EP93XX_GPIO_CHIP_NUM];
> +};
>  
> -       writeb_relaxed(gpio_int_type2[port],
> -                      epg->base + int_type2_register_offset[port]);
> +#define to_ep93xx_gpio_chip(x) container_of(x, struct ep93xx_gpio_chip, gc)
>  
> -       writeb_relaxed(gpio_int_type1[port],
> -                      epg->base + int_type1_register_offset[port]);
> +struct ep93xx_gpio_irq_chip *to_ep93xx_gpio_irq_chip(struct gpio_chip *gc)

^ static ...

> +{
> +       struct ep93xx_gpio_chip *egc = to_ep93xx_gpio_chip(gc);
>  
> -       writeb(gpio_int_unmasked[port] & gpio_int_enabled[port],
> -              epg->base + int_en_register_offset[port]);
> +       return egc->eic;
>  }
>  
> -static int ep93xx_gpio_port(struct gpio_chip *gc)
> +/*************************************************************************
> + * Interrupt handling for EP93xx on-chip GPIOs
> + *************************************************************************/
> +#define EP93XX_INT_TYPE1_OFFSET                0x00
> +#define EP93XX_INT_TYPE2_OFFSET                0x04
> +#define EP93XX_INT_EOI_OFFSET          0x08
> +#define EP93XX_INT_EN_OFFSET           0x0c
> +#define EP93XX_INT_STATUS_OFFSET       0x10
> +#define EP93XX_INT_RAW_STATUS_OFFSET   0x14
> +#define EP93XX_INT_DEBOUNCE_OFFSET     0x18
> +
> +static void ep93xx_gpio_update_int_params(struct ep93xx_gpio *epg,
> +                                         struct ep93xx_gpio_irq_chip *eic)
>  {
> -       struct ep93xx_gpio *epg = gpiochip_get_data(gc);
> -       int port = 0;
> +       writeb_relaxed(0, epg->base + eic->irq_offset + EP93XX_INT_EN_OFFSET);
>  
> -       while (port < ARRAY_SIZE(epg->gc) && gc != &epg->gc[port])
> -               port++;
> +       writeb_relaxed(eic->int_type2,
> +                      epg->base + eic->irq_offset + EP93XX_INT_TYPE2_OFFSET);
>  
> -       /* This should not happen but is there as a last safeguard */
> -       if (port == ARRAY_SIZE(epg->gc)) {
> -               pr_crit("can't find the GPIO port\n");
> -               return 0;
> -       }
> +       writeb_relaxed(eic->int_type1,
> +                      epg->base + eic->irq_offset + EP93XX_INT_TYPE1_OFFSET);
>  
> -       return port;
> +       writeb_relaxed(eic->int_unmasked & eic->int_enabled,
> +                      epg->base + eic->irq_offset + EP93XX_INT_EN_OFFSET);
>  }
>  
>  static void ep93xx_gpio_int_debounce(struct gpio_chip *gc,
>                                      unsigned int offset, bool enable)
>  {
>         struct ep93xx_gpio *epg = gpiochip_get_data(gc);
> -       int port = ep93xx_gpio_port(gc);
> +       struct ep93xx_gpio_irq_chip *eic = to_ep93xx_gpio_irq_chip(gc);
>         int port_mask = BIT(offset);
>  
>         if (enable)
> -               gpio_int_debounce[port] |= port_mask;
> +               eic->int_debounce |= port_mask;
>         else
> -               gpio_int_debounce[port] &= ~port_mask;
> +               eic->int_debounce &= ~port_mask;
>  
> -       writeb(gpio_int_debounce[port],
> -              epg->base + int_debounce_register_offset[port]);
> +       writeb(eic->int_debounce,
> +              epg->base + eic->irq_offset + EP93XX_INT_DEBOUNCE_OFFSET);
>  }
>  
>  static void ep93xx_gpio_ab_irq_handler(struct irq_desc *desc)
> @@ -122,12 +125,12 @@ static void ep93xx_gpio_ab_irq_handler(struct irq_desc *desc)
>          */
>         stat = readb(epg->base + EP93XX_GPIO_A_INT_STATUS);
>         for_each_set_bit(offset, &stat, 8)
> -               generic_handle_irq(irq_find_mapping(epg->gc[0].irq.domain,
> +               generic_handle_irq(irq_find_mapping(epg->gc[0].gc.irq.domain,
>                                                     offset));
>  
>         stat = readb(epg->base + EP93XX_GPIO_B_INT_STATUS);
>         for_each_set_bit(offset, &stat, 8)
> -               generic_handle_irq(irq_find_mapping(epg->gc[1].irq.domain,
> +               generic_handle_irq(irq_find_mapping(epg->gc[1].gc.irq.domain,
>                                                     offset));
>  
>         chained_irq_exit(irqchip, desc);
> @@ -153,52 +156,52 @@ static void ep93xx_gpio_f_irq_handler(struct irq_desc *desc)
>  static void ep93xx_gpio_irq_ack(struct irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct ep93xx_gpio_irq_chip *eic = to_ep93xx_gpio_irq_chip(gc);
>         struct ep93xx_gpio *epg = gpiochip_get_data(gc);
> -       int port = ep93xx_gpio_port(gc);
>         int port_mask = BIT(d->irq & 7);
>  
>         if (irqd_get_trigger_type(d) == IRQ_TYPE_EDGE_BOTH) {
> -               gpio_int_type2[port] ^= port_mask; /* switch edge direction */
> -               ep93xx_gpio_update_int_params(epg, port);
> +               eic->int_type2 ^= port_mask; /* switch edge direction */
> +               ep93xx_gpio_update_int_params(epg, eic);
>         }
>  
> -       writeb(port_mask, epg->base + eoi_register_offset[port]);
> +       writeb(port_mask, epg->base + eic->irq_offset + EP93XX_INT_EOI_OFFSET);
>  }
>  
>  static void ep93xx_gpio_irq_mask_ack(struct irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct ep93xx_gpio_irq_chip *eic = to_ep93xx_gpio_irq_chip(gc);
>         struct ep93xx_gpio *epg = gpiochip_get_data(gc);
> -       int port = ep93xx_gpio_port(gc);
>         int port_mask = BIT(d->irq & 7);
>  
>         if (irqd_get_trigger_type(d) == IRQ_TYPE_EDGE_BOTH)
> -               gpio_int_type2[port] ^= port_mask; /* switch edge direction */
> +               eic->int_type2 ^= port_mask; /* switch edge direction */
>  
> -       gpio_int_unmasked[port] &= ~port_mask;
> -       ep93xx_gpio_update_int_params(epg, port);
> +       eic->int_unmasked &= ~port_mask;
> +       ep93xx_gpio_update_int_params(epg, eic);
>  
> -       writeb(port_mask, epg->base + eoi_register_offset[port]);
> +       writeb(port_mask, epg->base + eic->irq_offset + EP93XX_INT_EOI_OFFSET);
>  }
>  
>  static void ep93xx_gpio_irq_mask(struct irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct ep93xx_gpio_irq_chip *eic = to_ep93xx_gpio_irq_chip(gc);
>         struct ep93xx_gpio *epg = gpiochip_get_data(gc);
> -       int port = ep93xx_gpio_port(gc);
>  
> -       gpio_int_unmasked[port] &= ~BIT(d->irq & 7);
> -       ep93xx_gpio_update_int_params(epg, port);
> +       eic->int_unmasked &= ~BIT(d->irq & 7);
> +       ep93xx_gpio_update_int_params(epg, eic);
>  }
>  
>  static void ep93xx_gpio_irq_unmask(struct irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct ep93xx_gpio_irq_chip *eic = to_ep93xx_gpio_irq_chip(gc);
>         struct ep93xx_gpio *epg = gpiochip_get_data(gc);
> -       int port = ep93xx_gpio_port(gc);
>  
> -       gpio_int_unmasked[port] |= BIT(d->irq & 7);
> -       ep93xx_gpio_update_int_params(epg, port);
> +       eic->int_unmasked |= BIT(d->irq & 7);
> +       ep93xx_gpio_update_int_params(epg, eic);
>  }
>  
>  /*
> @@ -209,8 +212,8 @@ static void ep93xx_gpio_irq_unmask(struct irq_data *d)
>  static int ep93xx_gpio_irq_type(struct irq_data *d, unsigned int type)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct ep93xx_gpio_irq_chip *eic = to_ep93xx_gpio_irq_chip(gc);
>         struct ep93xx_gpio *epg = gpiochip_get_data(gc);
> -       int port = ep93xx_gpio_port(gc);
>         int offset = d->irq & 7;
>         int port_mask = BIT(offset);
>         irq_flow_handler_t handler;
> @@ -219,32 +222,32 @@ static int ep93xx_gpio_irq_type(struct irq_data *d, unsigned int type)
>  
>         switch (type) {
>         case IRQ_TYPE_EDGE_RISING:
> -               gpio_int_type1[port] |= port_mask;
> -               gpio_int_type2[port] |= port_mask;
> +               eic->int_type1 |= port_mask;
> +               eic->int_type2 |= port_mask;
>                 handler = handle_edge_irq;
>                 break;
>         case IRQ_TYPE_EDGE_FALLING:
> -               gpio_int_type1[port] |= port_mask;
> -               gpio_int_type2[port] &= ~port_mask;
> +               eic->int_type1 |= port_mask;
> +               eic->int_type2 &= ~port_mask;
>                 handler = handle_edge_irq;
>                 break;
>         case IRQ_TYPE_LEVEL_HIGH:
> -               gpio_int_type1[port] &= ~port_mask;
> -               gpio_int_type2[port] |= port_mask;
> +               eic->int_type1 &= ~port_mask;
> +               eic->int_type2 |= port_mask;
>                 handler = handle_level_irq;
>                 break;
>         case IRQ_TYPE_LEVEL_LOW:
> -               gpio_int_type1[port] &= ~port_mask;
> -               gpio_int_type2[port] &= ~port_mask;
> +               eic->int_type1 &= ~port_mask;
> +               eic->int_type2 &= ~port_mask;
>                 handler = handle_level_irq;
>                 break;
>         case IRQ_TYPE_EDGE_BOTH:
> -               gpio_int_type1[port] |= port_mask;
> +               eic->int_type1 |= port_mask;
>                 /* set initial polarity based on current input level */
>                 if (gc->get(gc, offset))
> -                       gpio_int_type2[port] &= ~port_mask; /* falling */
> +                       eic->int_type2 &= ~port_mask; /* falling */
>                 else
> -                       gpio_int_type2[port] |= port_mask; /* rising */
> +                       eic->int_type2 |= port_mask; /* rising */
>                 handler = handle_edge_irq;
>                 break;
>         default:
> @@ -253,9 +256,9 @@ static int ep93xx_gpio_irq_type(struct irq_data *d, unsigned int type)
>  
>         irq_set_handler_locked(d, handler);
>  
> -       gpio_int_enabled[port] |= port_mask;
> +       eic->int_enabled |= port_mask;
>  
> -       ep93xx_gpio_update_int_params(epg, port);
> +       ep93xx_gpio_update_int_params(epg, eic);
>  
>         return 0;
>  }
> @@ -276,17 +279,19 @@ struct ep93xx_gpio_bank {
>         const char      *label;
>         int             data;
>         int             dir;
> +       int             irq;
>         int             base;
>         bool            has_irq;
>         bool            has_hierarchical_irq;
>         unsigned int    irq_base;
>  };
>  
> -#define EP93XX_GPIO_BANK(_label, _data, _dir, _base, _has_irq, _has_hier, _irq_base) \
> +#define EP93XX_GPIO_BANK(_label, _data, _dir, _irq, _base, _has_irq, _has_hier, _irq_base) \
>         {                                                       \
>                 .label          = _label,                       \
>                 .data           = _data,                        \
>                 .dir            = _dir,                         \
> +               .irq            = _irq,                         \
>                 .base           = _base,                        \
>                 .has_irq        = _has_irq,                     \
>                 .has_hierarchical_irq = _has_hier,              \
> @@ -295,16 +300,16 @@ struct ep93xx_gpio_bank {
>  
>  static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
>         /* Bank A has 8 IRQs */
> -       EP93XX_GPIO_BANK("A", 0x00, 0x10, 0, true, false, 64),
> +       EP93XX_GPIO_BANK("A", 0x00, 0x10, 0x90, 0, true, false, 64),
>         /* Bank B has 8 IRQs */
> -       EP93XX_GPIO_BANK("B", 0x04, 0x14, 8, true, false, 72),
> -       EP93XX_GPIO_BANK("C", 0x08, 0x18, 40, false, false, 0),
> -       EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 24, false, false, 0),
> -       EP93XX_GPIO_BANK("E", 0x20, 0x24, 32, false, false, 0),
> +       EP93XX_GPIO_BANK("B", 0x04, 0x14, 0xac, 8, true, false, 72),
> +       EP93XX_GPIO_BANK("C", 0x08, 0x18, 0x00, 40, false, false, 0),
> +       EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 0x00, 24, false, false, 0),
> +       EP93XX_GPIO_BANK("E", 0x20, 0x24, 0x00, 32, false, false, 0),
>         /* Bank F has 8 IRQs */
> -       EP93XX_GPIO_BANK("F", 0x30, 0x34, 16, false, true, 0),
> -       EP93XX_GPIO_BANK("G", 0x38, 0x3c, 48, false, false, 0),
> -       EP93XX_GPIO_BANK("H", 0x40, 0x44, 56, false, false, 0),
> +       EP93XX_GPIO_BANK("F", 0x30, 0x34, 0x4c, 16, false, true, 0),
> +       EP93XX_GPIO_BANK("G", 0x38, 0x3c, 0x00, 48, false, false, 0),
> +       EP93XX_GPIO_BANK("H", 0x40, 0x44, 0x00, 56, false, false, 0),
>  };
>  
>  static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned offset,
> @@ -326,13 +331,14 @@ static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
>         return EP93XX_GPIO_F_IRQ_BASE + offset;
>  }
>  
> -static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
> +static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
>                                 struct platform_device *pdev,
>                                 struct ep93xx_gpio *epg,
>                                 struct ep93xx_gpio_bank *bank)
>  {
>         void __iomem *data = epg->base + bank->data;
>         void __iomem *dir = epg->base + bank->dir;
> +       struct gpio_chip *gc = &egc->gc;
>         struct device *dev = &pdev->dev;
>         struct gpio_irq_chip *girq;
>         int err;
> @@ -347,6 +353,12 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
>         girq = &gc->irq;
>         if (bank->has_irq || bank->has_hierarchical_irq) {
>                 gc->set_config = ep93xx_gpio_set_config;
> +               egc->eic = devm_kcalloc(dev, 1,
> +                                       sizeof(*egc->eic),
> +                                       GFP_KERNEL);
> +               if (!egc->eic)
> +                       return -ENOMEM;
> +               egc->eic->irq_offset = bank->irq;
>                 girq->chip = &ep93xx_gpio_irq_chip;
>         }
>  
> @@ -415,7 +427,7 @@ static int ep93xx_gpio_probe(struct platform_device *pdev)
>                 return PTR_ERR(epg->base);
>  
>         for (i = 0; i < ARRAY_SIZE(ep93xx_gpio_banks); i++) {
> -               struct gpio_chip *gc = &epg->gc[i];
> +               struct ep93xx_gpio_chip *gc = &epg->gc[i];
>                 struct ep93xx_gpio_bank *bank = &ep93xx_gpio_banks[i];
>  
>                 if (ep93xx_gpio_add_bank(gc, pdev, epg, bank))

-- 
Alexander Sverdlin.


