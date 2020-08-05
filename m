Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B71F23CD39
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Aug 2020 19:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbgHERWy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Aug 2020 13:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728721AbgHERVU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2020 13:21:20 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE45EC0086B3
        for <linux-gpio@vger.kernel.org>; Wed,  5 Aug 2020 07:56:28 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id u63so28068844oie.5
        for <linux-gpio@vger.kernel.org>; Wed, 05 Aug 2020 07:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/NJU1ivwoErz/SKDUzNkmTVr6bikyIB+YAQfx9Ou5Q=;
        b=NA2XOIBk691jjuYqiyCHeCPOGUCTz9Cu31bi43zddgUwV0AnrgWnV2/VP76ygsah9B
         uT9dK2KTHuRPmhZg0koWaPsLewj1y0L/JRFqaspmZls2azb8pRzj2U80QbhshEM7UuH7
         H9xzr3rTxUfq4Zx0/0puz14HmCXza93q/MHMpHD20M0MAYET24hMIz+ahrLaVtlqs2if
         ZPZgDJAjzrsO1GqfqdlvupbGkNajTGA1e6IoK2KPnsELdpsu0wjs2/j6CyxzgQKnYauX
         1WSMVzrXna/Cv2HsfyPgY3FKrxXic0JCXYzA/LWsC2JJMHM+mrgKthHUopBmctEn/J8J
         w8dQ==
X-Gm-Message-State: AOAM533dVlXO48agGpWbSAgyjUpIn4VOcMI/kLWKSjyva8O/Q3ZmQFiO
        xAeOOwcwbMaguUpTLrSKx7OizY6vXwcJejMr4D8=
X-Google-Smtp-Source: ABdhPJz8/QDttDzdBHcIbbffbb/wDeM+Px8m1Tay57E1wMVNT0QS5usq9FywN/gRaa68J3UieFNKNtmdsAiF06IAmtA=
X-Received: by 2002:aca:adc4:: with SMTP id w187mr2941647oie.153.1596639377785;
 Wed, 05 Aug 2020 07:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200718212608.65328-1-andriy.shevchenko@linux.intel.com> <20200718212608.65328-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200718212608.65328-2-andriy.shevchenko@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 16:56:06 +0200
Message-ID: <CAMuHMdV3vK3C-pTDDYx9YOUi1fQBdC75R0D3rrytPkE6S2DChQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: aggregator: Refactor ->{get,set}_multiple()
 to make Sparse happy
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Sat, Jul 18, 2020 at 11:26 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Sparse can't see locking scheme used in ->get_multiple() and
> ->set_multiple() callbacks.
>   CHECK   .../drivers/gpio/gpio-aggregator.c
>   .../spinlock.h:409:9: warning: context imbalance in 'gpio_fwd_get_multiple' - unexpected unlock
>   .../spinlock.h:409:9: warning: context imbalance in 'gpio_fwd_set_multiple' - unexpected unlock
>
> Refactor them to have better readability and make Sparse happy.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c

> +static int gpio_fwd_get_multiple_locked(struct gpio_chip *chip,
> +                                       unsigned long *mask, unsigned long *bits)

Trading one static analysis tool error for a different one? ;-)

ERROR: code indent should use tabs where possible

> @@ -400,11 +404,23 @@ static void gpio_fwd_set_multiple(struct gpio_chip *chip, unsigned long *mask,
>         }
>
>         gpiod_set_array_value(j, descs, NULL, values);
> +}
>
> -       if (chip->can_sleep)
> +static void gpio_fwd_set_multiple_locked(struct gpio_chip *chip,
> +                                        unsigned long *mask, unsigned long *bits)

ERROR: code indent should use tabs where possible

With the above checkpatch errors fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Code size impact is +52 bytes with arm-linux-gnueabihf-gcc 7.5.0.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
