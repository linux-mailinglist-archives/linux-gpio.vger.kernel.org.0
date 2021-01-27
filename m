Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9598B306561
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 21:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233440AbhA0UtR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 15:49:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232777AbhA0UtO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 15:49:14 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9FB1C061573;
        Wed, 27 Jan 2021 12:48:33 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id q7so3280665wre.13;
        Wed, 27 Jan 2021 12:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=9d5wFRKkqq1ZiHaiLZIbAzg3nfbY8FLusDPEk+g66Qs=;
        b=RunL/5yiuFWJac9iZcdLZbNpj2ux9USv4swmNHGnF+J3GldnKyqI/IS5LBDwa9F8Ex
         M+toLmyLt4/6RYB1Nm+8A57N2z7qKQa+VE9sHi2LFOSjhp8AgaEsirdbIglokzATe+K/
         I7qWow7f19UA/geCtFMGGFFZgQDRzRMLQHfaIwzOpJwBNJopEcTSEtug8sUoQVwRpcDc
         yV5k3+AZNYICtHgMKYmWdct2xkX3882eiRm6JnNHbtBn51fmQy/JIXA+HpCfMBoazizg
         sw13xK+OxcAZ+5+zgdtJlWuopGRSKurcSYvaQASbBCruC2+1IpeK0ywsFxIELhpwuKGx
         2PYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9d5wFRKkqq1ZiHaiLZIbAzg3nfbY8FLusDPEk+g66Qs=;
        b=rtNkkAfjATDLdw6I4JXjkATqmpdRRPv+Pq2lseIvj9pQvJj1SnvvOn0pYfKivMY/KM
         +iLYgI2L9gKT4VEq00TN7sj0iJKbgaUoWMwzjVLe+m12HWmOtckl99Tb/CplzyWadVoq
         pTuTpAJWrGF+pUYaYEeAMTqorYAXua7avQxs1i1A3AHZKsgXqa2UQhuHDoQ9OHVc0NrZ
         qC/5mGF0TkG1ZV4pv5tmjQdIuP5Dsyp3IxrGZoPQzniTJPUpntNn0RzLaKb1LUTgIYHa
         TK9mL8ckHdrPm5QNg38r+cojb09aRvR2LNb9igaGiUpriynOUlNFpHpXAuOn5/L4Vmho
         kEAw==
X-Gm-Message-State: AOAM532BM8HZ7av2+Vl3rbv5SlzQpNESdYdbZOZkRj6u5TQ6CEL6XKWE
        /Favs8nAouaSp57fbA9cGHbr8W1TjlU=
X-Google-Smtp-Source: ABdhPJyfp5rrnvGkTRFwgf4lSLEDDo7u42mU4o12L1q5P8zfrcKVLMyO9RgzEAsERWljZtmSFP2EGw==
X-Received: by 2002:a5d:640c:: with SMTP id z12mr13013106wru.342.1611780512600;
        Wed, 27 Jan 2021 12:48:32 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id i131sm3632930wmi.25.2021.01.27.12.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 12:48:31 -0800 (PST)
Message-ID: <ab96a1a58e1f7037e6d43491f1e0f698d0390296.camel@gmail.com>
Subject: Re: [PATCH v2 7/9] gpio: ep93xx: separate IRQ's setup
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 27 Jan 2021 21:48:31 +0100
In-Reply-To: <20210127104617.1173-8-nikita.shubin@maquefel.me>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-8-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Nikita,

On Wed, 2021-01-27 at 13:46 +0300, Nikita Shubin wrote:
> Separate IRQ's setup for port A,B,F.

Somehow I don't feel that moving "FIXME" code around makes much
sense. Maybe the anticipated conversion to hierarhical IRQ chip
will result in a cleanup automatically?

> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  drivers/gpio/gpio-ep93xx.c | 104 +++++++++++++++++++++++------------
> --
>  1 file changed, 64 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index e4270b4e5f26..b212c007240e 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -353,6 +353,64 @@ static void ep93xx_init_irq_chips(struct
> ep93xx_gpio *epg)
>         }
>  }
>  
> +static int ep93xx_gpio_add_ab_irq_chip(struct platform_device *pdev,
> +                                       struct gpio_irq_chip *girq,
> +                                       unsigned int irq_base)
> +{
> +       struct device *dev = &pdev->dev;
> +       int ab_parent_irq = platform_get_irq(pdev, 0);
> +
> +       girq->parent_handler = ep93xx_gpio_ab_irq_handler;
> +       girq->num_parents = 1;
> +       girq->parents = devm_kcalloc(dev, girq->num_parents,
> +                                    sizeof(*girq->parents),
> +                                    GFP_KERNEL);
> +       if (!girq->parents)
> +               return -ENOMEM;
> +       girq->default_type = IRQ_TYPE_NONE;
> +       girq->handler = handle_level_irq;
> +       girq->parents[0] = ab_parent_irq;
> +       girq->first = irq_base;
> +
> +       return 0;
> +}
> +
> +static int ep93xx_gpio_add_f_irq_chip(struct platform_device *pdev,
> +                                       struct gpio_irq_chip *girq,
> +                                       unsigned int irq_base)
> +{
> +       int gpio_irq;
> +       int i;
> +       struct device *dev = &pdev->dev;
> +
> +       /*
> +        * FIXME: convert this to use hierarchical IRQ support!
> +        * this requires fixing the root irqchip to be hierarchical.
> +        */
> +       girq->parent_handler = ep93xx_gpio_f_irq_handler;
> +       girq->num_parents = 8;
> +       girq->parents = devm_kcalloc(dev, girq->num_parents,
> +                                    sizeof(*girq->parents),
> +                                    GFP_KERNEL);
> +       if (!girq->parents)
> +               return -ENOMEM;
> +       /* Pick resources 1..8 for these IRQs */
> +       for (i = 0; i < ARRAY_SIZE(girq->parents); i++) {
> +               girq->parents[i] = platform_get_irq(pdev, i + 1);
> +               gpio_irq = irq_base + i;
> +               irq_set_chip_data(gpio_irq, &epg->gc[5]);
> +               irq_set_chip_and_handler(gpio_irq,
> +                                        &ep93xx_gpio_irq_chip,
> +                                        handle_level_irq);
> +               irq_clear_status_flags(gpio_irq, IRQ_NOREQUEST);
> +       }
> +       girq->default_type = IRQ_TYPE_NONE;
> +       girq->handler = handle_level_irq;
> +       girq->first = irq_base;
> +
> +       return 0;
> +}
> +
>  static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
>                                 struct platform_device *pdev,
>                                 struct ep93xx_gpio *epg,
> @@ -380,50 +438,16 @@ static int ep93xx_gpio_add_bank(struct
> gpio_chip *gc,
>         }
>  
>         if (bank->has_irq) {
> -               int ab_parent_irq = platform_get_irq(pdev, 0);
> -
> -               girq->parent_handler = ep93xx_gpio_ab_irq_handler;
> -               girq->num_parents = 1;
> -               girq->parents = devm_kcalloc(dev, girq->num_parents,
> -                                            sizeof(*girq->parents),
> -                                            GFP_KERNEL);
> -               if (!girq->parents)
> -                       return -ENOMEM;
> -               girq->default_type = IRQ_TYPE_NONE;
> -               girq->handler = handle_level_irq;
> -               girq->parents[0] = ab_parent_irq;
> -               girq->first = bank->irq_base;
> +               err = ep93xx_gpio_add_ab_irq_chip(pdev, girq, bank-
> >irq_base);
> +               if (err)
> +                       return err;
>         }
>  
>         /* Only bank F has especially funky IRQ handling */
>         if (bank->has_hierarchical_irq) {
> -               int gpio_irq;
> -               int i;
> -
> -               /*
> -                * FIXME: convert this to use hierarchical IRQ
> support!
> -                * this requires fixing the root irqchip to be
> hierarchical.
> -                */
> -               girq->parent_handler = ep93xx_gpio_f_irq_handler;
> -               girq->num_parents = 8;
> -               girq->parents = devm_kcalloc(dev, girq->num_parents,
> -                                            sizeof(*girq->parents),
> -                                            GFP_KERNEL);
> -               if (!girq->parents)
> -                       return -ENOMEM;
> -               /* Pick resources 1..8 for these IRQs */
> -               for (i = 0; i < ARRAY_SIZE(girq->parents); i++) {
> -                       girq->parents[i] = platform_get_irq(pdev, i +
> 1);
> -                       gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
> -                       irq_set_chip_data(gpio_irq, &epg->gc[5]);
> -                       irq_set_chip_and_handler(gpio_irq,
> -                                               
> &ep93xx_gpio_irq_chip,
> -                                                handle_level_irq);
> -                       irq_clear_status_flags(gpio_irq,
> IRQ_NOREQUEST);
> -               }
> -               girq->default_type = IRQ_TYPE_NONE;
> -               girq->handler = handle_level_irq;
> -               girq->first = EP93XX_GPIO_F_IRQ_BASE;
> +               err = ep93xx_gpio_add_f_irq_chip(pdev, girq,
> EP93XX_GPIO_F_IRQ_BASE);
> +               if (err)
> +                       return err;
>         }
>  
>         return devm_gpiochip_add_data(dev, gc, epg);

-- 
Alexander Sverdlin.


