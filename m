Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9703550B7
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Apr 2021 12:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241450AbhDFKVQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Apr 2021 06:21:16 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:45940 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236072AbhDFKVQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Apr 2021 06:21:16 -0400
Received: by mail-ua1-f53.google.com with SMTP id f4so4453915uad.12
        for <linux-gpio@vger.kernel.org>; Tue, 06 Apr 2021 03:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OUBP99vT+8jG42JKceMbMfDWYYlTFgqZDEqNKWvKBOE=;
        b=OhKAOelnKjU6x4KFWgNehka+ePWkypPfMZvu17P3lSOJWhjuNNOstqJJ4J2Qswpyd0
         Ar8pEZrGrwFlkPhRg7yeiRY0Ox1fcX08XTLSaDvreS836QTrLTXa2G135LrZGnboUFOS
         y7gjE9ZwUEIjtKSCf5D6Jak0Nauu5IqvrtIURdxu7Jc28Ppm5pXKK4q3MjU4DOnWq0YR
         QsAOnIWJRD6A+4gMvpMf6u3QD3Kiox8U1QJF7VBhsyp55URdI3yEsBcz01UaBB0en0cn
         JYKzgRkPMspUsY22LECMd0rYcWOJGDNfvsFfWCDZXQOQxBFd+l8K3UlZ/IUvaiU+O60l
         TVnA==
X-Gm-Message-State: AOAM533dwnuuS9htpuCtG79Vy8RUukzKk0aYMyLvhHUE/tc6b41rPv6g
        b38zRX2qoaBduqmlKU3aX4rc0mWxpiko9hnldVQ=
X-Google-Smtp-Source: ABdhPJwT0E/xMv8TcacNdt039HQ6nn+jOoTnW66hQlPr4ldrHnTn4XyymXbIc9qWZ5rVdsMKyQNNKQ7ipH+Hl6BNEQU=
X-Received: by 2002:ab0:2c16:: with SMTP id l22mr16514798uar.100.1617704468705;
 Tue, 06 Apr 2021 03:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201117213351.249668-1-linus.walleij@linaro.org>
In-Reply-To: <20201117213351.249668-1-linus.walleij@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 6 Apr 2021 12:20:57 +0200
Message-ID: <CAMuHMdUu2UpcbvNGuDfHAp+aFGkhMS4rJXLwiqQu6QFB+FytBw@mail.gmail.com>
Subject: Re: [PATCH 1/2 v1] gpio: sifive: Set affinity callback to parent
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yash Shah <yash.shah@sifive.com>,
        "Wesley W . Terpstra" <wesley@sifive.com>,
        Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, Nov 17, 2020 at 10:37 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> This assigns the .irq_set_affinity to the parent callback.
> I assume the sifive GPIO can be used in systems with
> SMP.
>
> I used the pattern making the hirerarchy tolerant for missing
> parent as in Marc's earlier patches.
>
> Cc: Yash Shah <yash.shah@sifive.com>
> Cc: Wesley W. Terpstra <wesley@sifive.com>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for your patch!

> ---
> ChangeLog RFT->v1:
> - Make the affinity setting call return -EINVAL if there
>   is no parent.

Would it make sense to incorporate this check into
irq_chip_set_affinity_parent(), so drivers can just point
.irq_set_affinity to the latter, without having to provide (duplicate)
the same wrapper over and over?

> - Real patch because now we believe in this
> ---
>  drivers/gpio/gpio-sifive.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index c54dd08f2cbf..485820e4488c 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -128,6 +128,16 @@ static void sifive_gpio_irq_eoi(struct irq_data *d)
>         irq_chip_eoi_parent(d);
>  }
>
> +static int sifive_gpio_irq_set_affinity(struct irq_data *data,
> +                                       const struct cpumask *dest,
> +                                       bool force)
> +{
> +       if (data->parent_data)
> +               return irq_chip_set_affinity_parent(data, dest, force);
> +
> +       return -EINVAL;
> +}
> +
>  static struct irq_chip sifive_gpio_irqchip = {
>         .name           = "sifive-gpio",
>         .irq_set_type   = sifive_gpio_irq_set_type,
> @@ -136,6 +146,7 @@ static struct irq_chip sifive_gpio_irqchip = {
>         .irq_enable     = sifive_gpio_irq_enable,
>         .irq_disable    = sifive_gpio_irq_disable,
>         .irq_eoi        = sifive_gpio_irq_eoi,
> +       .irq_set_affinity = sifive_gpio_irq_set_affinity,
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
