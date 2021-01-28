Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 082A6307E0C
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 19:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231506AbhA1Sc7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 13:32:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbhA1Sa6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 13:30:58 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A92AC061756;
        Thu, 28 Jan 2021 10:30:17 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id m2so5096825wmm.1;
        Thu, 28 Jan 2021 10:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=FOT56mw0O0r1/EN41NHrTrcQj92z0Zt2Tm5uGtNf7nU=;
        b=qYnAHPQLGrD49l4LyT+zlLwR82HT6fro1oVy1mVw7IOtn7QVc1N1QezOI53dvPHPX6
         /TeiMv8C1azZjkqvvsa3FfyUmyxltRG/hv8/R5d0KFhi7uwKyVhZHwrTanwZ6We3VRul
         SuaXlG3OEZ6QPZpIBCgZjmxBlLM8P8hE6f72BA0ZfBndvSdVHYgV3xi24nagpz3HV1Eg
         J/tNk+m1cixLGqiAU1BndClq2ixWRTQtfTRPrOajxLVD2egJsrW/g2Ufum7di7e4h0Td
         IFKqOmANrvtFVd/JDRlSBuAwlbBsGLlqY0y9a16/vIMV0jjwej0hkxHHnLeShSAMS+AR
         FaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FOT56mw0O0r1/EN41NHrTrcQj92z0Zt2Tm5uGtNf7nU=;
        b=l/6hvlNsBcb8XR1izlstDPUTWDmp2BPwf8OjcVw/W9tZr9BoU9DfmsMurgYb9Laf52
         2T4HbHj/Ujq0hZnGy0eCG7XBHfCXgEwtLwD2pWmO/Z23eszDJowEaEInwPdcIjcyHm8h
         X4mK5mMv2WnODhw447ZhvaCp+Z9GHsJxjdXFaKrhRQnx4pgWYR5dBHrJKtD+DGMEk9Y+
         w4DHkfOla+X0JAo+de/GRtUqeIrSMD8bDIyBMgBxF00CMMJg8B+UpgksqN8KrXp/QWxH
         +yotCG1DTYnytB3Slsah7rXAfbtROSXupQCE+6bActEHJovlx8VXkCKoi3K9h1hrJBSg
         gF9A==
X-Gm-Message-State: AOAM532YNUJ2BPKPd2Nrj8PjrtmAxdyfkrC6CuQsfLAPxMFp/vGnGJO2
        aRAJcqXqGxaTMXWOnlfQvOU=
X-Google-Smtp-Source: ABdhPJyIC1JObbIm5EPnjP8J70ZZu+ICvNjxUdqJvHK+8Lu6u6lyUXKfjIOv3B+4EI/HdstNS1hnHw==
X-Received: by 2002:a05:600c:35c4:: with SMTP id r4mr523115wmq.174.1611858616283;
        Thu, 28 Jan 2021 10:30:16 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id z15sm7570542wrs.25.2021.01.28.10.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 10:30:15 -0800 (PST)
Message-ID: <f964e132200b9e952a3ad424c5fa82f9d1bf74f1.camel@gmail.com>
Subject: Re: [PATCH v3 7/7] gpiod: ep93xx: refactor base IRQ number
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 28 Jan 2021 19:30:14 +0100
In-Reply-To: <20210128122123.25341-8-nikita.shubin@maquefel.me>
References: <20210128122123.25341-1-nikita.shubin@maquefel.me>
         <20210128122123.25341-8-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

On Thu, 2021-01-28 at 15:21 +0300, Nikita Shubin wrote:
> - use predefined constants instead of plain numbers
> - use provided bank IRQ number instead of defined constant
>   for port F
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
>  drivers/gpio/gpio-ep93xx.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index df55aa13bd9a..b1501607e8ed 100644
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
> @@ -414,7 +416,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip
> *gc,
>                 /* Pick resources 1..8 for these IRQs */
>                 for (i = 0; i < girq->num_parents; i++) {
>                         girq->parents[i] = platform_get_irq(pdev, i +
> 1);
> -                       gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
> +                       gpio_irq = bank->irq_base + i;
>                         irq_set_chip_data(gpio_irq, &epg->gc[5]);
>                         irq_set_chip_and_handler(gpio_irq,
>                                                 
> &ep93xx_gpio_irq_chip,
> @@ -423,7 +425,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip
> *gc,
>                 }
>                 girq->default_type = IRQ_TYPE_NONE;
>                 girq->handler = handle_level_irq;
> -               girq->first = EP93XX_GPIO_F_IRQ_BASE;
> +               girq->first = bank->irq_base;
>         }
>  
>         return devm_gpiochip_add_data(dev, gc, epg);

-- 
Alexander Sverdlin.


