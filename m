Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42BA3257E3E
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 18:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbgHaQJG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 12:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728266AbgHaQJE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 12:09:04 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917DBC061575
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 09:09:04 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id i22so3373675eja.5
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 09:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3gkiXp2WVgUqvT9NZ2v6eDB+0cdEA56aJhzKkAT9IKk=;
        b=1SNiRdkBK7DFUK2L4sxcHmNHZNY4XY88yBYrLxKjl36hv8ABeSoz0Z6JrNhzLnizg/
         EntY8zXhCkjOjUl0Ua1m0UsWnnizVwYXhkHaRNxkuC1LOMgNVpqg0JRoMgbiofipNn3q
         r8XZ5856hxL667wCpu2Ae1vGqSZICQzDCZJ5FJ8zehfSyNnhKiYbu+Ah3WMsFhT8ETar
         +GRjmB32VJLE/qU++bAM8dIw77iHseinlnVhqmGZAZRKYuCtjRmsxsX2sicejnB2YCZT
         /hKkvc0r0+Qr7xR1eVe9/NRNAmuQyZP/Np4ikxLJGz4iUeilCoOmBCQOKmMUB8oesFSS
         qXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3gkiXp2WVgUqvT9NZ2v6eDB+0cdEA56aJhzKkAT9IKk=;
        b=d1R7EFizDlGNDbmbTKQO3HP6eh4Wmt8JJV2S2+VqedNpuxZV9x+AgzKOmwrpLc9VKR
         rI6S31aGzVit9p4yPTGx5VW/OkVU879ki3vfiyeIZIPFXJqasQYRc4QB2n2hN+/yqqTz
         lnINzvaf4E9PMQQhDkApEN/29Hkd8jqJsiJU41tD9HmgunYtaDKB+vhQZkdkNowoH9dI
         UFIHt8+lXaT6HEUfzyGxNHLmHK0AaDUyEL05D2iwTbgH9ujKMbxMazN7r7+5pl4kfKp0
         S/QHDaxgIIlL6WGH7KIZR3g/+NccWGRs9LMmCrkvHiema7yHEtPk5S0f8GnTcUFHsX1k
         mlRw==
X-Gm-Message-State: AOAM530JOk8RWDuXof/tRWfZYnvH311URLJvExXAu+YcP44R50CGyK/s
        7yDiXBOHUmn8wtfrh/Ck9HASfY5fguoA//kFYkB8vQ==
X-Google-Smtp-Source: ABdhPJz3N3o2PM4LJEHuSD9Rk/l0WVymKDMS79uJcwBtiM/TMTGPL2YBHUHFw7UKGKU9F/bxpVhgmPVafNhLcDIFfQs=
X-Received: by 2002:a17:906:19db:: with SMTP id h27mr1732665ejd.154.1598890142945;
 Mon, 31 Aug 2020 09:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200831090947.18489-1-zhang.lyra@gmail.com>
In-Reply-To: <20200831090947.18489-1-zhang.lyra@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 31 Aug 2020 18:08:52 +0200
Message-ID: <CAMpxmJUwk9b=O4d6PEX_N39Eft1TEc1X2NQpuERQZWyPhz73-g@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: sprd: Clear interrupt when setting the type as edge
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Taiping Lai <taiping.lai@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 31, 2020 at 11:10 AM Chunyan Zhang <zhang.lyra@gmail.com> wrote:
>
> From: Taiping Lai <taiping.lai@unisoc.com>
>
> The raw interrupt status of GPIO maybe set before the interrupt is enabled,
> which would trigger the interrupt event once enabled it from user side.
> This is the case for edge interrupts only. Adding a clear operation when
> setting interrupt type can avoid that.
>
> There're a few considerations for the solution:
> 1) This issue is for edge interrupt only; The interrupts requested by users
>    are IRQ_TYPE_LEVEL_HIGH as default, so clearing interrupt when request
>    is useless.
> 2) The interrupt type can be set to edge when request and following up
>    with clearing it though, but the problem is still there once users set
>    the interrupt type to level trggier.
> 3) We can add a clear operation after each time of setting interrupt
>    enable bit, but it is redundant for level trigger interrupt.
>
> Therefore, the solution is this patch seems the best for now.
>
> Fixes: 9a3821c2bb47 ("gpio: Add GPIO driver for Spreadtrum SC9860 platform")
> Signed-off-by: Taiping Lai <taiping.lai@unisoc.com>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> ---
> * Changes since v1:
> - Rebased on v5.9-rc1.
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

Queued for fixes, thanks!

Bartosz
