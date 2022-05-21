Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F342B52FE92
	for <lists+linux-gpio@lfdr.de>; Sat, 21 May 2022 19:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240147AbiEURaP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 May 2022 13:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236589AbiEURaP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 May 2022 13:30:15 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4752346142
        for <linux-gpio@vger.kernel.org>; Sat, 21 May 2022 10:30:13 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id fd25so14179250edb.3
        for <linux-gpio@vger.kernel.org>; Sat, 21 May 2022 10:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lw9l9XhgzFDdMitofhKDVOWV8jETC2jKAq3fO5XGw4Q=;
        b=kUuJ5wWHWjKWsDRBPoww4zM44k5uSMhzxtKnwG41X/2+S1wzWIb5S83lZJ1kiPrjXs
         Lk+NFw1og0RGJ2FZV4SGY9U6WsmKvXlbprV1kM4jyTP6yfoIiOPAD25+r+b91hnktKUO
         /38fOGLKOgHroeg9lq21U4us+rD7+LHx3EE/cawLJvxzBToW+43NLpTGeDjIYFYQoqmV
         Hh9SfBSoPUunJTLGMfhmy2mB6/v+D3dYo5mOGaV895YA/mjvm9sPiqxNl7StHb4J51/J
         VpUX1oSNUtOhmh8OOpYJz+qq+JwlD2/aQcQt/4lvAEmPlE16/wim7y8uHWP+4CxfVYsE
         jq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lw9l9XhgzFDdMitofhKDVOWV8jETC2jKAq3fO5XGw4Q=;
        b=Nh1y8eYZ0FDtO33fimmv3giDOp8gKLd5TF4l2oSKq+pszA0El1+08pE4x4WA720Y2Y
         +P+VhuiH4WNfmdD+8ELa/Wik1vyrCSaIwU4ofdy4a9z89yg5TyqOn7Cg84bs5h3T/0X7
         79ZGy2dgbxvToPqaduZdeTq1A3aU6dr86uyY4GKCk/1c03ifWptiTZoK5L5M5+XlLPm0
         ZF7TeVzhSNpbliQnFBzQQ7t8+PcD8M65hWLfSLmy93HT+Nu/lJotXqdOKZ0buZHYgj6X
         vouQS6ct/ikIW/TH+oCC2M2YEFfeyIzT4I/Cu0QEAOFsamQIdSiyNHikNTYYH+jY8oAR
         mUgg==
X-Gm-Message-State: AOAM533q4MB2RPwqwHNN3c4iaFXemOrjhau+F8bET+PXkEOo70dJoISo
        q195dCcoQML7M10Y3TfDv4YA6D2w8wCSRrRaR8w=
X-Google-Smtp-Source: ABdhPJy2TxNKIqC1Yor5yBxq81Ci/hFucbJyBw1Ta8YDyXt5ZlMzDNyvbdM1ltWmaT9oXAXgatUajWgTI249NJsuUBw=
X-Received: by 2002:aa7:df86:0:b0:42a:ba05:3ee7 with SMTP id
 b6-20020aa7df86000000b0042aba053ee7mr16311032edy.141.1653154211758; Sat, 21
 May 2022 10:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
In-Reply-To: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 21 May 2022 19:29:35 +0200
Message-ID: <CAHp75Vc-z=K5GPBeXd8JvG=JgjG4Y2U9pBz0hFwjmJ-zP39kZw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: dwapb: Make the irqchip immutable
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
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

On Sat, May 21, 2022 at 1:24 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the dwapb driver:
>
>     gpio gpiochip0: (50200000.gpio): not an immutable chip, please consider fixing it!
>
> Fix this by making the irqchip in the dwapb driver immutable.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against gpio/for-next.
> Boot-tested on SiPEED MAiXBiT (Canaan K210).
>
> v2:
>   - Factor out hwirq using preferred helper.
> ---
>  drivers/gpio/gpio-dwapb.c | 38 ++++++++++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 7130195da48d75dd..04afe728e18748df 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -95,7 +95,6 @@ struct dwapb_context {
>  #endif
>
>  struct dwapb_gpio_port_irqchip {
> -       struct irq_chip         irqchip;
>         unsigned int            nr_irqs;
>         unsigned int            irq[DWAPB_MAX_GPIOS];
>  };
> @@ -252,24 +251,30 @@ static void dwapb_irq_mask(struct irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
> +       irq_hw_number_t hwirq = irqd_to_hwirq(d);
>         unsigned long flags;
>         u32 val;
>
>         raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -       val = dwapb_read(gpio, GPIO_INTMASK) | BIT(irqd_to_hwirq(d));
> +       val = dwapb_read(gpio, GPIO_INTMASK) | BIT(hwirq);
>         dwapb_write(gpio, GPIO_INTMASK, val);
>         raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +       gpiochip_disable_irq(gc, hwirq);
>  }
>
>  static void dwapb_irq_unmask(struct irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
> +       irq_hw_number_t hwirq = irqd_to_hwirq(d);
>         unsigned long flags;
>         u32 val;
>
> +       gpiochip_enable_irq(gc, hwirq);
> +
>         raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -       val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(irqd_to_hwirq(d));
> +       val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(hwirq);
>         dwapb_write(gpio, GPIO_INTMASK, val);
>         raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
> @@ -364,8 +369,23 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
>
>         return 0;
>  }
> +#else
> +#define dwapb_irq_set_wake     NULL
>  #endif
>
> +static const struct irq_chip dwapb_irq_chip = {
> +       .name           = DWAPB_DRIVER_NAME,
> +       .irq_ack        = dwapb_irq_ack,
> +       .irq_mask       = dwapb_irq_mask,
> +       .irq_unmask     = dwapb_irq_unmask,
> +       .irq_set_type   = dwapb_irq_set_type,
> +       .irq_enable     = dwapb_irq_enable,
> +       .irq_disable    = dwapb_irq_disable,
> +       .irq_set_wake   = dwapb_irq_set_wake,
> +       .flags          = IRQCHIP_IMMUTABLE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
>  static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
>                                    unsigned offset, unsigned debounce)
>  {
> @@ -439,16 +459,6 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>         girq->default_type = IRQ_TYPE_NONE;
>
>         port->pirq = pirq;
> -       pirq->irqchip.name = DWAPB_DRIVER_NAME;
> -       pirq->irqchip.irq_ack = dwapb_irq_ack;
> -       pirq->irqchip.irq_mask = dwapb_irq_mask;
> -       pirq->irqchip.irq_unmask = dwapb_irq_unmask;
> -       pirq->irqchip.irq_set_type = dwapb_irq_set_type;
> -       pirq->irqchip.irq_enable = dwapb_irq_enable;
> -       pirq->irqchip.irq_disable = dwapb_irq_disable;
> -#ifdef CONFIG_PM_SLEEP
> -       pirq->irqchip.irq_set_wake = dwapb_irq_set_wake;
> -#endif
>
>         /*
>          * Intel ACPI-based platforms mostly have the DesignWare APB GPIO
> @@ -475,7 +485,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>                 girq->parent_handler = dwapb_irq_handler;
>         }
>
> -       girq->chip = &pirq->irqchip;
> +       gpio_irq_chip_set_chip(girq, &dwapb_irq_chip);
>
>         return;
>
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
