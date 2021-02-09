Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA2B315122
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 15:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbhBIOB6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 09:01:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbhBIOBY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 09:01:24 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75012C061786;
        Tue,  9 Feb 2021 06:00:43 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id l18so1698345pji.3;
        Tue, 09 Feb 2021 06:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BFxMSD/AQcmkX+KoxgHYBz0TzhP10uzovcwUnUn+wN8=;
        b=eyV9zl6SE/ri3+RNlNsKXI2uB3FofVMItlp3gcCFSzlmYkkFhqon77AophZbGpI0EC
         gnuChfUSJDSKyKDILuHAJiy8G+l5yZ+3Ef+/ADu8zXmjlm7ThAf0p3M7+DYp4y+Rt9wA
         92wpAaCBjiwybDqquWolhVfRzQnFgqawGxf/BVUHaIeXoV8HPiMJhZHpwUOY35hZ8TIn
         5kvqeYBFcErqbpRAv3kST3MNhzTtH/g/hkYh8MYS3EmQMR5fcQfuQvxLZwyps5EXNDlo
         PgV+MkSEhvpg5w0lTFnn+5sdkm5SMaYguubwti6DKFbUn6rNV5iYAn2nYdwxSZ76FnTJ
         WeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BFxMSD/AQcmkX+KoxgHYBz0TzhP10uzovcwUnUn+wN8=;
        b=VYHB0p02Vm4oyX52hfruRfZ/RhEiNQWOwbI1mgrgwNkFJOdKHEsKcbhn7WyZos1cFN
         a2BBG+Voul0FIS9hmERyyYKM7/vEYwvpzAbDd2RLJXWTk7HEc09ycdeADKp7gtgHmWFK
         LxGqoEQYzTHZ0tm5NtoVDUkwdfjwZzVxWER8pSRP8et2FwslJLyC88tD1VJdsPfpxQX8
         xjy8w+HOmH8ADcRLZGaR3jjF7ANAWKWqW3HbIuDX0iIs2CaE3cjtyHoDk2FGGF4Qrw95
         6UTeS2zI21jFhb7EM4bLgmY/wuFkIjjmvNVBbLzyRt1wl9xTuzuXiovyJuAFijV1eY8j
         EI8A==
X-Gm-Message-State: AOAM531WRj6vKmknf19o1XBErwlqx/HYwH64k1jqTrr+4BbRQZcOhYFQ
        F4LvWwrbXCFkrfyZjCxzA2MyOrbYg+s97GIPGh8=
X-Google-Smtp-Source: ABdhPJzlfJkFzgUvSIvVuwhq3+ETrxIHUAGWLUaEcxYlTfscXzSZAM4CTn9MsztDb6bIGZvlcZ/y6VPbCnEIuKJQ6hg=
X-Received: by 2002:a17:902:b190:b029:df:fff2:c345 with SMTP id
 s16-20020a170902b190b02900dffff2c345mr20733584plr.17.1612879241613; Tue, 09
 Feb 2021 06:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20210209133110.7383-1-nikita.shubin@maquefel.me> <20210209133110.7383-2-nikita.shubin@maquefel.me>
In-Reply-To: <20210209133110.7383-2-nikita.shubin@maquefel.me>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 9 Feb 2021 16:00:25 +0200
Message-ID: <CAHp75VeLJy4zG2U2jbRnGr0f8k0F5LD_zY66W2YwJA4kC2iofQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] gpio: ep93xx: fix BUG_ON port F usage
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 9, 2021 at 3:31 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:

...

> +               .irq            = _irq,                         \

>                 .has_irq        = _has_irq,                     \
>                 .has_hierarchical_irq = _has_hier,              \

Just a side note for the further cleanup. No need to resend or update
right now! (of course if you or maintainers feel otherwise...)

Now you have the duplicate information, i.e. irq covers has_irq. Hence
you may drop has_irq, rename has_hierarchival_irq to
is_irq_hierarchical and update below table.

>  static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
>         /* Bank A has 8 IRQs */
> -       EP93XX_GPIO_BANK("A", 0x00, 0x10, 0, true, false, 64),
> +       EP93XX_GPIO_BANK("A", 0x00, 0x10, 0x90, 0, true, false, 64),
>         /* Bank B has 8 IRQs */
> -       EP93XX_GPIO_BANK("B", 0x04, 0x14, 8, true, false, 72),
> -       EP93XX_GPIO_BANK("C", 0x08, 0x18, 40, false, false, 0),
> -       EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 24, false, false, 0),
> -       EP93XX_GPIO_BANK("E", 0x20, 0x24, 32, false, false, 0),
> +       EP93XX_GPIO_BANK("B", 0x04, 0x14, 0xac, 8, true, false, 72),
> +       EP93XX_GPIO_BANK("C", 0x08, 0x18, 0x00, 40, false, false, 0),
> +       EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 0x00, 24, false, false, 0),
> +       EP93XX_GPIO_BANK("E", 0x20, 0x24, 0x00, 32, false, false, 0),
>         /* Bank F has 8 IRQs */
> -       EP93XX_GPIO_BANK("F", 0x30, 0x34, 16, false, true, 0),
> -       EP93XX_GPIO_BANK("G", 0x38, 0x3c, 48, false, false, 0),
> -       EP93XX_GPIO_BANK("H", 0x40, 0x44, 56, false, false, 0),
> +       EP93XX_GPIO_BANK("F", 0x30, 0x34, 0x4c, 16, false, true, 0),
> +       EP93XX_GPIO_BANK("G", 0x38, 0x3c, 0x00, 48, false, false, 0),
> +       EP93XX_GPIO_BANK("H", 0x40, 0x44, 0x00, 56, false, false, 0),
>  };

-- 
With Best Regards,
Andy Shevchenko
