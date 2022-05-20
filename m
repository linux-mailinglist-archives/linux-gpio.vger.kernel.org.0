Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3E1252ED91
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 15:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348957AbiETNyP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 09:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239709AbiETNyM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 09:54:12 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17AF55EDC2;
        Fri, 20 May 2022 06:54:11 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id er5so10855485edb.12;
        Fri, 20 May 2022 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/wAzst6/G3m+QO5ZKc1mp3lz+ymj39tazrR00b1+V2U=;
        b=Qp8thrzqzPuy3Nswujx77bsulF5qPCpHorkXnhW8wOvTV5W9meP+RFjcXOdRlH8peY
         N8dfGtF2bYJ3X3Q9F8NNELvzZ87y/0nSJtpAx2nPHYqvOI9FInxt4/0QTeW2v+Jzz2JW
         hanSkOlZMhjQ4XkPbKkT63QeKd/OoT00CSmnzuS6Z2WXnXr7hsJuQnK6D35a3WD+jzgE
         UWxzhGYoz2ZSoj6BCtAzVRDzI6JVcaxIWm8GLhAgstRXvzlQXe7hEm7MKrdi5YF2DhLf
         w2OdQXSrLCyoAew5dwVlxX/nn7Rg5YdeUaoybb+6y2KaD6gDXzbj7K2ijlc+ZeHKva8c
         gG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/wAzst6/G3m+QO5ZKc1mp3lz+ymj39tazrR00b1+V2U=;
        b=EJClvcGBH38qhofS9XoN1Cni80jmQCkKcR2SWf5msWkX0ik8dFxJ8N4WjxMp2t+BAu
         src1zbnri09mB2T63SAKuQBjxC91sCqPhwXeyIzP5MC9BC3qoxAlDFgQOJIA58hpdWMm
         WcW1m3sz4G0Bth0ylawrxnnZXlQFXcP2KVcwrk62uaDSY/YdkElU+nszMDIyS0e49F3O
         jffgtLpNHlmBYAShmlBSDbMqVA5b5VZOVLukb2BBaubLWwBHlUY+7I/4wJMBTZlP9qwP
         FlGRQJUcUvhMkImDdACq9ajPJcr9go1R/jkS1hwIZ0UlToopA2UOwCy5l53cSv5IuGYj
         CQjw==
X-Gm-Message-State: AOAM531uyaX3rc8vl+IOCkCjjFrypoEF7r7+KNT611JliR8ZOQ+Xv1hT
        Lzgy0oAi1J4MdlQEoCJeU9kK4b51ZHp5wkFMpuMT1NQ4V+RIKg==
X-Google-Smtp-Source: ABdhPJym1UtoPdNoVCprWkNpi8iWmB70+IVX1IJ1Cl4GXh+vpFsMo8SrEqblAKw4TzMY6st7YoE9GmKaRFjmPozfO38=
X-Received: by 2002:aa7:df86:0:b0:42a:ba05:3ee7 with SMTP id
 b6-20020aa7df86000000b0042aba053ee7mr10908006edy.141.1653054849495; Fri, 20
 May 2022 06:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <7b57347151a452286cc88358bfc839de30937089.1653041878.git.geert+renesas@glider.be>
In-Reply-To: <7b57347151a452286cc88358bfc839de30937089.1653041878.git.geert+renesas@glider.be>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 20 May 2022 15:53:33 +0200
Message-ID: <CAHp75VdACoEeTRQOs__nPfAf7Lv8UAbb3zawsGkWNSGpssCwmg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: rcar: Make the irqchip immutable
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 20, 2022 at 3:36 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the gpio-rcar driver:
>
>     gpio gpiochip0: (e6050000.gpio): not an immutable chip, please consider fixing it!
>
> Fix this by making the irqchip in the gpio-rcar driver immutable.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against gpio/for-next.
> Tested on the koelsch development board (R-Car M2-W).
>
> v2:
>   - Factor out hwirq using preferred helper.
> ---
>  drivers/gpio/gpio-rcar.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index 356aac4de17cf142..5b117f3bd322b5a7 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -44,7 +44,6 @@ struct gpio_rcar_priv {
>         spinlock_t lock;
>         struct device *dev;
>         struct gpio_chip gpio_chip;
> -       struct irq_chip irq_chip;
>         unsigned int irq_parent;
>         atomic_t wakeup_path;
>         struct gpio_rcar_info info;
> @@ -96,16 +95,20 @@ static void gpio_rcar_irq_disable(struct irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct gpio_rcar_priv *p = gpiochip_get_data(gc);
> +       irq_hw_number_t hwirq = irqd_to_hwirq(d);
>
> -       gpio_rcar_write(p, INTMSK, ~BIT(irqd_to_hwirq(d)));
> +       gpio_rcar_write(p, INTMSK, ~BIT(hwirq));
> +       gpiochip_disable_irq(gc, hwirq);
>  }
>
>  static void gpio_rcar_irq_enable(struct irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct gpio_rcar_priv *p = gpiochip_get_data(gc);
> +       irq_hw_number_t hwirq = irqd_to_hwirq(d);
>
> -       gpio_rcar_write(p, MSKCLR, BIT(irqd_to_hwirq(d)));
> +       gpiochip_enable_irq(gc, hwirq);
> +       gpio_rcar_write(p, MSKCLR, BIT(hwirq));
>  }
>
>  static void gpio_rcar_config_interrupt_input_mode(struct gpio_rcar_priv *p,
> @@ -203,6 +206,17 @@ static int gpio_rcar_irq_set_wake(struct irq_data *d, unsigned int on)
>         return 0;
>  }
>
> +static const struct irq_chip gpio_rcar_irq_chip = {
> +       .name           = "gpio-rcar",
> +       .irq_mask       = gpio_rcar_irq_disable,
> +       .irq_unmask     = gpio_rcar_irq_enable,
> +       .irq_set_type   = gpio_rcar_irq_set_type,
> +       .irq_set_wake   = gpio_rcar_irq_set_wake,
> +       .flags          = IRQCHIP_IMMUTABLE | IRQCHIP_SET_TYPE_MASKED |
> +                         IRQCHIP_MASK_ON_SUSPEND,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
>  static irqreturn_t gpio_rcar_irq_handler(int irq, void *dev_id)
>  {
>         struct gpio_rcar_priv *p = dev_id;
> @@ -481,7 +495,6 @@ static int gpio_rcar_probe(struct platform_device *pdev)
>  {
>         struct gpio_rcar_priv *p;
>         struct gpio_chip *gpio_chip;
> -       struct irq_chip *irq_chip;
>         struct gpio_irq_chip *girq;
>         struct device *dev = &pdev->dev;
>         const char *name = dev_name(dev);
> @@ -531,16 +544,8 @@ static int gpio_rcar_probe(struct platform_device *pdev)
>         gpio_chip->base = -1;
>         gpio_chip->ngpio = npins;
>
> -       irq_chip = &p->irq_chip;
> -       irq_chip->name = "gpio-rcar";
> -       irq_chip->irq_mask = gpio_rcar_irq_disable;
> -       irq_chip->irq_unmask = gpio_rcar_irq_enable;
> -       irq_chip->irq_set_type = gpio_rcar_irq_set_type;
> -       irq_chip->irq_set_wake = gpio_rcar_irq_set_wake;
> -       irq_chip->flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
> -
>         girq = &gpio_chip->irq;
> -       girq->chip = irq_chip;
> +       gpio_irq_chip_set_chip(girq, &gpio_rcar_irq_chip);
>         /* This will let us handle the parent IRQ in the driver */
>         girq->parent_handler = NULL;
>         girq->num_parents = 0;
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
