Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864CF234EC8
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Aug 2020 01:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgGaX7N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Jul 2020 19:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgGaX7N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Jul 2020 19:59:13 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6364C06174A;
        Fri, 31 Jul 2020 16:59:12 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id v12so3768602ljc.10;
        Fri, 31 Jul 2020 16:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UsimTWbIrqsHqWHrugIeQHRl2pI9arEz0nqny+Jdx80=;
        b=utYyUXWFBG19iMOaqbTjqZjscEIXbcx7v1vLol18jiKTYRhX+ajiGTEdZkIZbE1xGO
         ya6Dt/2zN3bJNoJPSrNavs9KiDD63R33H1D/Y29D0J4nO/RFpd+o+QptgGwz4JHjuC50
         h5QZUpXltw5YzDfyd63hjnCpN/5gYLydc9ly/GEDT0UFBf+o8M6IL1ikTIU7tlO3pzux
         86SGQeXcqI/vEuxrQEG9h+CbQSNlc4Vv2Fo5SasGBGzyEZ58UOzVv5zJjjGy4GwwKl7k
         aE6233UfVWhErWQgbSjVOg+GvRej2+8k4SCdTRczeb1rghlxzKkgUDcrG8eFQlfzWDSI
         J+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UsimTWbIrqsHqWHrugIeQHRl2pI9arEz0nqny+Jdx80=;
        b=aEPX+bueXCqd6rtnSu+dmyl+J83MJA74ebTU+oML0JwlNnmKow3jkDOmESBODX2fQ5
         ISa5YTi039/X+J+czVmw1y+fBpf7CygCfoySQFPApQIVWdVuVv3bTThbJfXC5YuINhyx
         X6BWpguOHmFZKnHghKg4N+LJ8v+cSSz+us1bxHDzJDCuhN42enDs1Yh1KgGGfo06FKPz
         bPDIteCGlownQ9P6ZCwv09E1zh3yz7XOBRpM+FDB1n7GS0w0P5vY8jiqnijqn9/gl6F0
         K+JYYBf3e/9qpD2JoQMZHN+37SY8s3C3FdtaDJuP/xJlYrTJP9nvBZ8ZJfhuRaEijCz1
         Yviw==
X-Gm-Message-State: AOAM532LrYWiOwFsSNu/B3fWcceVltTNAqQ3OuUFzcSslABO72sayVEN
        IMf7tJGzlntt8vBEUvczr/480w23SpZrRx4bqGxoARH4
X-Google-Smtp-Source: ABdhPJyuFPum9EZ4xPwGLLRNhsfcctEtKyXIrIFwRlk9aXs5vD/fJgPGGo+5lZGA8s4Wgzgm9WPoKYSWNuEjwSxFSr0=
X-Received: by 2002:a2e:6e0a:: with SMTP id j10mr2736087ljc.389.1596239951119;
 Fri, 31 Jul 2020 16:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200729093450.28585-1-zhang.lyra@gmail.com>
In-Reply-To: <20200729093450.28585-1-zhang.lyra@gmail.com>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Sat, 1 Aug 2020 07:58:56 +0800
Message-ID: <CADBw62p=aB3EZYkMm44Zx4Krww21SS9vCsMnPOq0pn2DgA8VkQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: sprd: Clear interrupt when setting the type as edge
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Taiping Lai <taiping.lai@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 29, 2020 at 5:35 PM Chunyan Zhang <zhang.lyra@gmail.com> wrote:
>
> From: Taiping Lai <taiping.lai@unisoc.com>
>
> The raw interrupt status of GPIO maybe set before the interrupt is enabled,
> which would trigger the interrupt event once enabled it from user side.
> This is the case for edge interrupts only. Adding a clear operation when
> setting interrupt type can avoid that.
>
> Fixes: 9a3821c2bb47 ("gpio: Add GPIO driver for Spreadtrum SC9860 platform")
> Signed-off-by: Taiping Lai <taiping.lai@unisoc.com>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> ---
>  drivers/gpio/gpio-sprd.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpio/gpio-sprd.c b/drivers/gpio/gpio-sprd.c
> index d7314d39ab65..36ea8a3bd451 100644
> --- a/drivers/gpio/gpio-sprd.c
> +++ b/drivers/gpio/gpio-sprd.c
> @@ -149,17 +149,20 @@ static int sprd_gpio_irq_set_type(struct irq_data *data,
>                 sprd_gpio_update(chip, offset, SPRD_GPIO_IS, 0);
>                 sprd_gpio_update(chip, offset, SPRD_GPIO_IBE, 0);
>                 sprd_gpio_update(chip, offset, SPRD_GPIO_IEV, 1);
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IC, 1);

I think you should move this abonormal interrupt clearing operation to
sprd_gpio_request(), when users request a GPIO.

>                 irq_set_handler_locked(data, handle_edge_irq);
>                 break;
>         case IRQ_TYPE_EDGE_FALLING:
>                 sprd_gpio_update(chip, offset, SPRD_GPIO_IS, 0);
>                 sprd_gpio_update(chip, offset, SPRD_GPIO_IBE, 0);
>                 sprd_gpio_update(chip, offset, SPRD_GPIO_IEV, 0);
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IC, 1);
>                 irq_set_handler_locked(data, handle_edge_irq);
>                 break;
>         case IRQ_TYPE_EDGE_BOTH:
>                 sprd_gpio_update(chip, offset, SPRD_GPIO_IS, 0);
>                 sprd_gpio_update(chip, offset, SPRD_GPIO_IBE, 1);
> +               sprd_gpio_update(chip, offset, SPRD_GPIO_IC, 1);
>                 irq_set_handler_locked(data, handle_edge_irq);
>                 break;
>         case IRQ_TYPE_LEVEL_HIGH:
> --
> 2.20.1
>


-- 
Baolin Wang
