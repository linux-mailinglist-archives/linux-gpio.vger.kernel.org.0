Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C205E298FE1
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782046AbgJZOuU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:50:20 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46254 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782044AbgJZOuU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:50:20 -0400
Received: by mail-ed1-f68.google.com with SMTP id 33so9632557edq.13
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2bC0C8f6SVmggGuAiNHakUjoa8NDOkSBxpQiV8U8oeE=;
        b=l80MJfwaRgVSRK0Hi9Img/WMe3gQ1NQ0U7mlE231Npx8OUjpW2CfGUKRTdxOZuVvFF
         e5cunW5zmJPT1NQN8s/mFmz8qAEnvzgc2Atuu9mvBbftyqhmsUoQu9/e775G8ShL/Vbq
         7OQi6qJwCOsMK/I9Q7LVVzj86W2ojWWRDCkqjmbH38G73Pg8NW6F97xJIOjwTohMSqLc
         rHkBR78gKBJtYz0foUWYL2KE+HFW63nNwK4QWN6fk8l15if/rsjQTztMN2+fIzc52x8m
         4339OJgtxQh4azrhDBApYRLS1NCyefbh6f8AJ/LNtVys5tgxJYz3p2hon8XG9qGj2DmX
         075g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2bC0C8f6SVmggGuAiNHakUjoa8NDOkSBxpQiV8U8oeE=;
        b=h7VlA0/RIiuqgPCQidhqNoTfd4EsXYwjllpvWwa2oUxyAdDPAQ4OCUGGADNuZsErAL
         kn9acjRxGqii61c9kcs1InjaG9CsgE9IMKXygNy069LuPKBFVjdvxqQgez3hQyPQkrxP
         y5Tt9S6t9dFCZpDDiL2mLKk3oaoyIEoULT/3qXwH7/lpoMLa0xA+FkO1exGHMr8L3XYh
         foAz2Rm9gjcJEkS2ElVc8BqJQI6w4EHlIjFLHHjZOt7XoTEnz1wYJt5PDkSHHAmwb2WO
         x93yvhh58TAv6pt7f8IE437X9BwLkNnCd48cF1PxE0FDpMkMeO17VWn/7bSPSIwPlObJ
         ePCg==
X-Gm-Message-State: AOAM533kK0Q1NSGrXL+77pPs2+XqkJYW//SL6+vWaECPIo0Q3e5JJcj/
        1f6s3dD715WoURXXXE7JQe6OW0Ell2zwwcKVMBKYPA==
X-Google-Smtp-Source: ABdhPJxuMJy3ivLB5JJbRTrIeTAWyHaAyGCOXYHPDw5c7T7apKCYN9IyGGGSvLQbQmnXYa3oNHhDKn0aqyg3DAwe0rI=
X-Received: by 2002:a05:6402:3045:: with SMTP id bu5mr16446052edb.232.1603723817500;
 Mon, 26 Oct 2020 07:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201016153544.162611-1-justin.he@arm.com>
In-Reply-To: <20201016153544.162611-1-justin.he@arm.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 26 Oct 2020 15:50:05 +0100
Message-ID: <CAMpxmJUf2jBgFe+9N3VVegyX2fbUyN5t57TFCDwZC4_q3ue6Eg@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: Fix missing conversion to GPIO-lib-based IRQ-chip
To:     Jia He <justin.he@arm.com>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 16, 2020 at 5:36 PM Jia He <justin.he@arm.com> wrote:
>
> Commit 0ea683931adb ("gpio: dwapb: Convert driver to using the
> GPIO-lib-based IRQ-chip") missed the case in dwapb_irq_set_wake().
>
> Without this fix, probing the dwapb gpio driver will hit a error:
> "address between user and kernel address ranges" on a Ampere armv8a
> server and cause a panic.
>
> Fixes: 0ea683931adb ("gpio: dwapb: Convert driver to using the
> GPIO-lib-based IRQ-chip")

No need to break the line in Fixes: tag.

> Signed-off-by: Jia He <justin.he@arm.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index a5b326754124..2a9046c0fb16 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -343,8 +343,8 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
>  #ifdef CONFIG_PM_SLEEP
>  static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
>  {
> -       struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
> -       struct dwapb_gpio *gpio = igc->private;
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
>         struct dwapb_context *ctx = gpio->ports[0].ctx;
>         irq_hw_number_t bit = irqd_to_hwirq(d);
>
> --
> 2.17.1
>

Applied for fixes, thanks!

Bartosz
