Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2CC305A02
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 12:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236691AbhA0Lj0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 06:39:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236849AbhA0Lhj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 06:37:39 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20195C061756;
        Wed, 27 Jan 2021 03:36:59 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id 7so1573411wrz.0;
        Wed, 27 Jan 2021 03:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=a7LxkefxGZOLdisJIgK915DcipbJQfX+HmdaDtCHXIg=;
        b=hZLfCpA5CzfJc/rEMiPDn0y9mlPX9kgwJnBx3aE3hesKGCXJTHd99THhXTMRtC1k4h
         5TeLtk8QWmU2PyP7VA0z5Yk41Gk4qI4pvpWrX3RYSQVy+Al+xMXe3Gxj0++tGmqbYSFL
         8uFGgsUXZAVuxv9T42JFIt6yW88ANWo7Smcg+DIVoEy9z0Zes7K1jqFRGfn6TPjLcHw/
         gF87bbx5o0AyaUIpxVu57aObmR8zpT/73RNZyCLgR7wfxVaMKQ2dBQ/m8MYxYSRN94Wv
         aLDQSjrpaDKNjl+DAZeRARwvKS8UHjQDOd5kAavb/sehtqXX37VA+15yZ/AqTFMTeXM1
         sNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=a7LxkefxGZOLdisJIgK915DcipbJQfX+HmdaDtCHXIg=;
        b=DeAOACJp4qeN9nv+yAgr9beUw5ovKDg8caTlxo6jNQLnTA83fN48MxqtejtAmw3kYi
         TuwotmNUZE7WTlgUIIZ+xtXhJtCdkOaRN2asnBbsFwlSehltYRN5Jn7RKjz01hlNlfQy
         rLustxM7Vd21sGrk19CJbEHnrPFufjNeilzTOwJPlNIuJoDnYaVkbUJh6fr/BRvEWuXW
         1cKwbqLqX0NXULZq320vx5T6xC0xjkubdxCpUnaIFxpmnWwXVBo8PMUVoNHFbtNFnNHk
         6Ngjp92jl2O3PZlTm4oD7O+ZVE1eaOPF09Uh3wb9SWTghGxjKzdvXxggjdpLYky7bjMt
         hVMA==
X-Gm-Message-State: AOAM530drEkjZXb4KXngLArGJJHpy9jVETDA4v1iZxjob9I7b0Jj3MDN
        C0AriyCmQhvkXMk+QsDC9BqJb6ia44o=
X-Google-Smtp-Source: ABdhPJzAh/coB6ShmHXewdzUQKihr3R+8qKFKoXGunnWLZPMGNkJ1R1eE4Uf1kEzbE1iZYATFjTG3g==
X-Received: by 2002:a05:6000:1252:: with SMTP id j18mr10469946wrx.232.1611747417903;
        Wed, 27 Jan 2021 03:36:57 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id i131sm2198851wmi.25.2021.01.27.03.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 03:36:57 -0800 (PST)
Message-ID: <b241cdbc7f6c7e2187951984fa692640f52ed82e.camel@gmail.com>
Subject: Re: [PATCH v2 8/9] gpio: ep93xx: refactor base IRQ number
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 27 Jan 2021 12:36:56 +0100
In-Reply-To: <20210127104617.1173-9-nikita.shubin@maquefel.me>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-9-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

On Wed, 2021-01-27 at 13:46 +0300, Nikita Shubin wrote:
> - use predefined constants instead of plain numbers
> - use provided bank IRQ number instead of defined constant
>   for port F
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
>  drivers/gpio/gpio-ep93xx.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index b212c007240e..2aee13b5067d 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -28,6 +28,8 @@
>  /* Maximum value for irq capable line identifiers */
>  #define EP93XX_GPIO_LINE_MAX_IRQ 23
>  
> +#define EP93XX_GPIO_A_IRQ_BASE 64
> +#define EP93XX_GPIO_B_IRQ_BASE 72
>  /*
>   * Static mapping of GPIO bank F IRQS:
>   * F0..F7 (16..24) to irq 80..87.
> @@ -311,14 +313,14 @@ struct ep93xx_gpio_bank {
>  
>  static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
>         /* Bank A has 8 IRQs */
> -       EP93XX_GPIO_BANK("A", 0x00, 0x10, 0, true, false, 64),
> +       EP93XX_GPIO_BANK("A", 0x00, 0x10, 0, true, false,
> EP93XX_GPIO_A_IRQ_BASE),
>         /* Bank B has 8 IRQs */
> -       EP93XX_GPIO_BANK("B", 0x04, 0x14, 8, true, false, 72),
> +       EP93XX_GPIO_BANK("B", 0x04, 0x14, 8, true, false,
> EP93XX_GPIO_B_IRQ_BASE),
>         EP93XX_GPIO_BANK("C", 0x08, 0x18, 40, false, false, 0),
>         EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 24, false, false, 0),
>         EP93XX_GPIO_BANK("E", 0x20, 0x24, 32, false, false, 0),
>         /* Bank F has 8 IRQs */
> -       EP93XX_GPIO_BANK("F", 0x30, 0x34, 16, false, true, 0),
> +       EP93XX_GPIO_BANK("F", 0x30, 0x34, 16, false, true,
> EP93XX_GPIO_F_IRQ_BASE),
>         EP93XX_GPIO_BANK("G", 0x38, 0x3c, 48, false, false, 0),
>         EP93XX_GPIO_BANK("H", 0x40, 0x44, 56, false, false, 0),
>  };
> @@ -445,7 +447,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip
> *gc,
>  
>         /* Only bank F has especially funky IRQ handling */
>         if (bank->has_hierarchical_irq) {
> -               err = ep93xx_gpio_add_f_irq_chip(pdev, girq,
> EP93XX_GPIO_F_IRQ_BASE);
> +               err = ep93xx_gpio_add_f_irq_chip(pdev, girq, bank-
> >irq_base);
>                 if (err)
>                         return err;
>         }

-- 
Alexander Sverdlin.


