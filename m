Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A06852ED8C
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 15:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbiETNwv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 09:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350034AbiETNwu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 09:52:50 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B73C6005C
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 06:52:46 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id h11so9738894eda.8
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9aNkLnnL/x+dQzLtim+hUdjclNpx0H+tWmMwjRMln9c=;
        b=QiW0ijt+YdcplToEY0ROq8+2ihiAQRTOlOeoVXnuIsHOSl8cfk6RIofVLXpFME/DDA
         nbKxN0ZgTzYkwxTWSb+djgOpbopWZmSUTaaxFvTG2Cuf3PDqCm7L7T9gWCNj96/74MkL
         mgyenc6CIDpY13f48c/aic9GCLQu0dhNTd44Kpr50qh6+5Z8dOOERzKNoP94H7IYvIO6
         1+LxAZrX1fmg/k/GJfMprG0kldMFIVhBjI7M9sktNZVjko64lzqawvxdemzdobqnIkSn
         dNSKFyIqtpuy1ux4UQFDZCR67rA0e0r/49SepDTvBXssS6pn/XOf6f4CvtZfqLBWKV2m
         twXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9aNkLnnL/x+dQzLtim+hUdjclNpx0H+tWmMwjRMln9c=;
        b=13yd4WuHZqFZFuoUjwxmxAWKNfjxFB/4Kxku3z2VDefDrw4OKdowbyfFnrByEJBm+p
         hTDWFJmYICXYr/qRjoUa+LV+QrPWJGDcPQxuMKj8lEqWsg/0u3eiXrtGWsoz5bXcTe3R
         kFQfj8wccqBx2UK4oqaPQs69i1TVYmTXG46iZn7L/aa3wOHAMGJBZ8g1EliQiO1g79da
         zOXgbMcvNVSc0RvmeAnN3h/H91jq8nK6m7OA5u2KN2ZkIND6eRABn8mhVPJIwxRDPEf4
         QD6lODhYEyQuijyFt4OpuCg7Wpn88nJweOnVqmxJM/bD4JiU2GYPvqkw4hqQloUYLeyK
         ppHA==
X-Gm-Message-State: AOAM53379hfTI1aK//tILTIPbK4hEKwhD7EJda7Rrj8ScRswYLz3vdW8
        i3e3C4E/mLVcWe+nZfgP0R4PAMqO7Z/6Gp0rP3w=
X-Google-Smtp-Source: ABdhPJyhvhF4dqov7iKJtY3WkAyQlMJhCxTFh0sgtDhcPSLc8B5hyh24XJIf3F86UWCnbZDTxmaATO7BuxB6rpb/ekk=
X-Received: by 2002:a05:6402:294e:b0:425:f016:24e7 with SMTP id
 ed14-20020a056402294e00b00425f01624e7mr10856937edb.111.1653054764895; Fri, 20
 May 2022 06:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <26519be2a2fdd4c6741658144e3a8d78cf4d000b.1653042202.git.geert+renesas@glider.be>
In-Reply-To: <26519be2a2fdd4c6741658144e3a8d78cf4d000b.1653042202.git.geert+renesas@glider.be>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 20 May 2022 15:52:08 +0200
Message-ID: <CAHp75VeHV+YNCgEUE2jvie92BOpmc3X9R_AnHi7EHRRKoiYpzA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: sifive: Make the irqchip immutable
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
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

On Fri, May 20, 2022 at 12:34 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the sifive driver:
>
>     gpio gpiochip1: (38001000.gpio-controller): not an immutable chip, please consider fixing it!
>
> Fix this by making the irqchip in the sifive driver immutable.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against gpio/for-next.
> Boot-tested on SiPEED MAiXBiT (Canaan K210).
>
> v2:
>   - Factor out hwirq using preferred helper.
> ---
>  drivers/gpio/gpio-sifive.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 03b8c4de2e91e3c4..238f3210970cfa0e 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -75,10 +75,12 @@ static void sifive_gpio_irq_enable(struct irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct sifive_gpio *chip = gpiochip_get_data(gc);
> -       int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
> +       irq_hw_number_t hwirq = irqd_to_hwirq(d);
> +       int offset = hwirq % SIFIVE_GPIO_MAX;
>         u32 bit = BIT(offset);
>         unsigned long flags;
>
> +       gpiochip_enable_irq(gc, hwirq);
>         irq_chip_enable_parent(d);
>
>         /* Switch to input */
> @@ -101,11 +103,13 @@ static void sifive_gpio_irq_disable(struct irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct sifive_gpio *chip = gpiochip_get_data(gc);
> -       int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
> +       irq_hw_number_t hwirq = irqd_to_hwirq(d);
> +       int offset = hwirq % SIFIVE_GPIO_MAX;
>
>         assign_bit(offset, &chip->irq_state, 0);
>         sifive_gpio_set_ie(chip, offset);
>         irq_chip_disable_parent(d);
> +       gpiochip_disable_irq(gc, hwirq);
>  }
>
>  static void sifive_gpio_irq_eoi(struct irq_data *d)
> @@ -137,7 +141,7 @@ static int sifive_gpio_irq_set_affinity(struct irq_data *data,
>         return -EINVAL;
>  }
>
> -static struct irq_chip sifive_gpio_irqchip = {
> +static const struct irq_chip sifive_gpio_irqchip = {
>         .name           = "sifive-gpio",
>         .irq_set_type   = sifive_gpio_irq_set_type,
>         .irq_mask       = irq_chip_mask_parent,
> @@ -146,6 +150,8 @@ static struct irq_chip sifive_gpio_irqchip = {
>         .irq_disable    = sifive_gpio_irq_disable,
>         .irq_eoi        = sifive_gpio_irq_eoi,
>         .irq_set_affinity = sifive_gpio_irq_set_affinity,
> +       .flags          = IRQCHIP_IMMUTABLE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>
>  static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> @@ -242,7 +248,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>         chip->gc.parent = dev;
>         chip->gc.owner = THIS_MODULE;
>         girq = &chip->gc.irq;
> -       girq->chip = &sifive_gpio_irqchip;
> +       gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
>         girq->fwnode = of_node_to_fwnode(node);
>         girq->parent_domain = parent;
>         girq->child_to_parent_hwirq = sifive_gpio_child_to_parent_hwirq;
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
