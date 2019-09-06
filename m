Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93F15AC227
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 23:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404651AbfIFVrJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 17:47:09 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46830 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404449AbfIFVrJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 17:47:09 -0400
Received: by mail-ot1-f68.google.com with SMTP id g19so7114098otg.13;
        Fri, 06 Sep 2019 14:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AxdmH4Las6LxoPzUkRRDSuUEuP8kEFd6s6/nV6yfxfg=;
        b=kJ8V6SKUgTMBpZVLUgCBoDhLUAbrxohNBnGKYz5ADglBM8cRRC1XNgOxTfO09Ao0wV
         8BQczCd7yaJz8hbUKtmym+hsPhNtnOH6VfJeyhMLJf02rJj5kcMcbVCoYJgL7w8JymdV
         a6sIuJJnXC+WYQdwJkTwB6KlZCMRFOWZypKUDrlCRYHXJoLcgWFawqoYD0FEll+HRcQv
         lkATQM/e/CxseNcd8hAOhXPWzrxqvEV0H7/8NRqkwJypKjzjRzJqRcBjmMkcJFX3W1b/
         C/0/IwQcNBLmREJ6IoFqK1nu6D1qlhUj5yGseVzABJBooBmDdzzhqbXnPPEcsP1Hp0uL
         X+MQ==
X-Gm-Message-State: APjAAAWgjKQBs5F/JE9VoVTCxiSHM7wQu1Ja2vZUveWaudQtNON2ZItc
        4GvN8WaC3vXjWsrTRisWOlj07Tds
X-Google-Smtp-Source: APXvYqyKdkJy2UYmQBEftN3cVDKDxGk7OkLkrI9pGAnrPLPlQPtaJfgj/TAw7lpHUajBdykqy4i+wg==
X-Received: by 2002:a9d:127:: with SMTP id 36mr3127123otu.64.1567806427609;
        Fri, 06 Sep 2019 14:47:07 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id b21sm2544627otl.12.2019.09.06.14.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2019 14:47:06 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id t84so6244575oih.10;
        Fri, 06 Sep 2019 14:47:06 -0700 (PDT)
X-Received: by 2002:a54:4492:: with SMTP id v18mr25801oiv.175.1567806426189;
 Fri, 06 Sep 2019 14:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190906115614.5645-1-hui.song_1@nxp.com>
In-Reply-To: <20190906115614.5645-1-hui.song_1@nxp.com>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Fri, 6 Sep 2019 16:46:54 -0500
X-Gmail-Original-Message-ID: <CADRPPNSjOV4RvJiFU2krj_-0gwcvw07x27Ku9t7h+VKNd=BStQ@mail.gmail.com>
Message-ID: <CADRPPNSjOV4RvJiFU2krj_-0gwcvw07x27Ku9t7h+VKNd=BStQ@mail.gmail.com>
Subject: Re: [PATCH] gpio/mpc8xxx: change irq handler from chained to normal
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 6, 2019 at 10:20 AM Hui Song <hui.song_1@nxp.com> wrote:
>
> From: Song Hui <hui.song_1@nxp.com>
>

The English below need to be fixed.

> more one gpio controller use share one interrupt,
> make request interrupt to be shared.

More than one gpio controllers can share one interrupt, change the
driver to request shared irq.

>
> Signed-off-by: Laurentiu Tudor <Laurentiu.Tudor@nxp.com>
> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 16a47de..4006250 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -22,6 +22,7 @@
>  #include <linux/irq.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/bitops.h>
> +#include <linux/interrupt.h>
>
>  #define MPC8XXX_GPIO_PINS      32
>
> @@ -127,10 +128,9 @@ static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
>                 return -ENXIO;
>  }
>
> -static void mpc8xxx_gpio_irq_cascade(struct irq_desc *desc)
> +static irqreturn_t mpc8xxx_gpio_irq_cascade(int irq, void *data)
>  {
> -       struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_desc_get_handler_data(desc);
> -       struct irq_chip *chip = irq_desc_get_chip(desc);
> +       struct mpc8xxx_gpio_chip *mpc8xxx_gc = (struct mpc8xxx_gpio_chip *)data;
>         struct gpio_chip *gc = &mpc8xxx_gc->gc;
>         unsigned int mask;
>
> @@ -139,8 +139,8 @@ static void mpc8xxx_gpio_irq_cascade(struct irq_desc *desc)
>         if (mask)
>                 generic_handle_irq(irq_linear_revmap(mpc8xxx_gc->irq,
>                                                      32 - ffs(mask)));
> -       if (chip->irq_eoi)
> -               chip->irq_eoi(&desc->irq_data);
> +
> +       return IRQ_HANDLED;
>  }
>
>  static void mpc8xxx_irq_unmask(struct irq_data *d)
> @@ -409,8 +409,14 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>         if (devtype->gpio_dir_in_init)
>                 devtype->gpio_dir_in_init(gc);
>
> -       irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
> -                                        mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
> +       ret = request_irq(mpc8xxx_gc->irqn, mpc8xxx_gpio_irq_cascade,
> +               IRQF_NO_THREAD | IRQF_SHARED, "gpio-cascade", mpc8xxx_gc);
> +       if (ret) {
> +               pr_err("%s: failed to request_irq(%d), ret = %d\n",
> +                               np->full_name, mpc8xxx_gc->irqn, ret);
> +               goto err;
> +       }
> +
>         return 0;
>  err:
>         iounmap(mpc8xxx_gc->regs);
> --
> 2.9.5
>
