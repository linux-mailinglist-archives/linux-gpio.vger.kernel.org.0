Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE6992CFF40
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 22:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgLEVeS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 16:34:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgLEVeR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 16:34:17 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728E9C0613CF
        for <linux-gpio@vger.kernel.org>; Sat,  5 Dec 2020 13:33:37 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id e7so468712ljg.10
        for <linux-gpio@vger.kernel.org>; Sat, 05 Dec 2020 13:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=44cM81jwDy3oSJ5c3tpV4IlBGDrsE7jmCYgRJXxm894=;
        b=olsBNT8OXaV/QWtQpC33sHoZgjrGOoBbg/3DZZGkM7R1HtfgTJsytlsl9xTl1LdLKj
         +X+1S8OTcdUDtaqr88DMBHhoj0jUjOoiQ0Db6/za+mN+dXxtSF12wyr1n43ePih4Ibhd
         7jizVyoP/RxPRFKwIjLd2mXYfLU7cD6QHIVj0ZpSQ/+CkjAyxmJTm7qTaHVQuCMJOWey
         mfY0R8x/hj9PS9X/JhqOHdEcbLdqzCz76tTfLW6PdEva/mb7KPKseWXh1945ToF/8T4i
         Q26YUNjB9Tg6PGIAOozjZP1hv2H6PKTllOzPUskkQc0Y9T/44hBz3zjRP5DvQO08ce8R
         X8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=44cM81jwDy3oSJ5c3tpV4IlBGDrsE7jmCYgRJXxm894=;
        b=dfg3xd33CbzIDR+cFaAAUecqEEKmZbyR1xu8ANnnQW9ayXdYogclBLeBwU+HYmarZL
         5XSHwpyt/HyZjOA3QZdc3tiDA00liJYKv6RgxpijjVWakHRYNhYAP6Ppg/W17HLoLeKI
         IbXoeSdArWj35wLTP/tOoymnvWRzA/k0S2sY6JWKixZPz/6Pyk1AQxeay3wFl5UlOOsg
         yqU0IXXBqycvox9CnlYaCi0NFtqHqo3lwdRiWjNhx1wjxSJ3O1oC1r1kUakchrW87zXR
         mL4lzmtZ8XJt/j4HWqtzWhZHXaPI4MybR6sBdJqfejb6zzoqGk8wjXZ1NYTXGKgeakG1
         wD8A==
X-Gm-Message-State: AOAM533FyxutbqTcEk8ZsEjNDh3MaqhLn+fOSegdOYJuhK0rxJXofSdi
        rCWCKUuhkWFYfUlKjbbNw1+0BxSzT8pMCMWlgk6h/A==
X-Google-Smtp-Source: ABdhPJyS/nBnudQvrGNGdH8DXPxEfZtPNZH7bAoPMUKmttA9jwmhgIJBCwKO6CfEItZdbV5BfC4BEsqVV22asvr4nt0=
X-Received: by 2002:a2e:b1c9:: with SMTP id e9mr5995158lja.283.1607204015946;
 Sat, 05 Dec 2020 13:33:35 -0800 (PST)
MIME-Version: 1.0
References: <20201127140852.123192-1-thierry.reding@gmail.com> <20201127140852.123192-3-thierry.reding@gmail.com>
In-Reply-To: <20201127140852.123192-3-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Dec 2020 22:33:24 +0100
Message-ID: <CACRpkdZ3Krgsjyc3-NU0pmYkzFPue_-1VWqkdNvxoG2c6OF7aQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: tegra: Convert to gpio_irq_chip
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 27, 2020 at 3:09 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Convert the Tegra GPIO driver to use the gpio_irq_chip infrastructure.
> This allows a bit of boiler plate to be removed and while at it enables
> support for hierarchical domains, which is useful to support PMC wake
> events on Tegra210 and earlier.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

The patch didn't apply to my "devel" branch for some reason
so have a look at that, seems gpio-tegra.c has some changes not
in my tree.

>  struct tegra_gpio_soc_config {
> @@ -93,12 +91,12 @@ struct tegra_gpio_soc_config {
>  struct tegra_gpio_info {
>         struct device                           *dev;
>         void __iomem                            *regs;
> -       struct irq_domain                       *irq_domain;
>         struct tegra_gpio_bank                  *bank_info;
>         const struct tegra_gpio_soc_config      *soc;
>         struct gpio_chip                        gc;
>         struct irq_chip                         ic;
>         u32                                     bank_count;
> +       unsigned int                            *irqs;

So this is hierarchical with several IRQs.

>  static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  {
>         unsigned int gpio = d->hwirq, port = GPIO_PORT(gpio), lvl_type;
> -       struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
> -       struct tegra_gpio_info *tgi = bank->tgi;
> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
> +       struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
> +       struct tegra_gpio_bank *bank;
>         unsigned long flags;
> -       u32 val;
>         int ret;
> +       u32 val;
> +
> +       bank = &tgi->bank_info[GPIO_BANK(d->hwirq)];

So the general idea is to look up the bank from the IRQ offset.

But...

> -       return 0;
> +       if (d->parent_data)
> +               ret = irq_chip_set_type_parent(d, type);
> +
> +       return ret;

I don't quite get this. This makes sense if there is one parent IRQ
per interrupt, but if one of the users of a GPIO in a bank sets the
IRQ type to edge and then another one comes in and set another
of the lines to level and then the function comes here, what type
gets set on the parent? Whichever comes last?

Normally with banked GPIOs collecting several lines in a cascaded
fashion, the GPIO out of the bank toward the GIC is level triggered.

I don't understand how this GPIO controller can be hierarchical,
it looks cascaded by the definition of the document
Documentation/driver-api/gpio/driver.rst

Yours,
Linus Walleij
