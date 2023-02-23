Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF716A089C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Feb 2023 13:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233571AbjBWM3q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Feb 2023 07:29:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233240AbjBWM3o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Feb 2023 07:29:44 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91EED3B226
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2023 04:29:40 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-536be69eadfso181338517b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2023 04:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l27prqAr9h3GZK8RN08FtqLKiroMBi1v9H+IeJ/D4fk=;
        b=l5qLjcXYM6AuNV6mV4P2Y4b+VgdUFH460IL1VVy54MWjQRE6rQGEYINztLgGRFqTgh
         whRqElncLV1ytI+eC8jSdHl+vBSJsqRQ42g6hIBn5LMlYTwqXxtFJWMlcPTGdZwK56XR
         EzGCRpFvFFoxjQSHAteMZv8JLd7tzoAktyolor86l6Mvq1siiGkT6qqS6YcobwCqYPwD
         8OovUOyyWH2QTJNwOyulQv2T52A+ak1NVaoNC0IXeEGzqlK85iQo/dbACQLzWoJjnQ3q
         VEDWv9npkWeGroNfweN7SATsof0A0sSewXqAoEY2F9B4p+70b5TV+SyYZvGs93y+DqbA
         ZqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l27prqAr9h3GZK8RN08FtqLKiroMBi1v9H+IeJ/D4fk=;
        b=CT/gj9TkrkuOAW2NyN30VOYh++qCzTcZfb8dLYBTSv+Lx7//KNhuFTrGmmwWf3ctiH
         pW7fQ4VF9lP3g8gZLwJ1WW62rQ29fgQjOlVz8TayBpUuKnzfQIwtj0jC2JHJlahIz+2s
         IFV7fCz5mY7h/yGmDXe+YiXlgMGMBRg0aTUJsXGFRnZS1DXj3rDhTqRK9Np5ElLlCGAU
         zq3DmijWBBX3BsKlc5GYEx13PiBDua5jJMao2+ydE+s9s4W4YERLPhhlpaskKZvQw6RT
         Ya90Y7aHEM+48XD3ft+hIahmS3jhfqH13aysUQEd1YHpj+w6TzkGcQBF1kJwn8OscCuz
         4gCQ==
X-Gm-Message-State: AO0yUKW56CL0INEqVnfwopvYwMRwGcYWWqJoQXBDh0/wExw6ANS3dOFl
        Jn8vx+3JEpPQHR3m1xgk9RUZLfFdGHQ+xhmKERKFfg==
X-Google-Smtp-Source: AK7set8qmLU86E6/dgl73UDiOOb9YsQwumSXwVyM1QkgcgWonuRowRvEKw7fc1bI/GuseWbw/VLMNR/bELlSqejTaT0=
X-Received: by 2002:a25:918c:0:b0:8da:d0ab:258a with SMTP id
 w12-20020a25918c000000b008dad0ab258amr1927035ybl.5.1677155379491; Thu, 23 Feb
 2023 04:29:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1676042188.git.asmaa@nvidia.com> <cover.1676668853.git.asmaa@nvidia.com>
 <28f0d670407c127614b64d9c382b11c795f5077d.1676668853.git.asmaa@nvidia.com>
In-Reply-To: <28f0d670407c127614b64d9c382b11c795f5077d.1676668853.git.asmaa@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Feb 2023 13:29:28 +0100
Message-ID: <CACRpkdYgGjqL85CcNw=38_XrzsWPBX8GwhL9t3m_+fSnEjHrdw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpio: gpio-mlxbf3: Add gpio driver support
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Asamaa,

thanks for your patch!

getting a lot better all the time.

On Fri, Feb 17, 2023 at 10:27 PM Asmaa Mnebhi <asmaa@nvidia.com> wrote:

> Add support for the BlueField-3 SoC GPIO driver.
> This driver configures and handles GPIO interrupts. It also enables a user
> to manipulate certain GPIO pins via libgpiod tools or other kernel drivers.
> The usables pins are defined via the gpio-reserved-ranges property.
>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

(...)
> +config GPIO_MLXBF3
> +       tristate "Mellanox BlueField 3 SoC GPIO"
> +       depends on (MELLANOX_PLATFORM && ARM64 && ACPI) || (64BIT && COMPILE_TEST)
> +       select GPIO_GENERIC

select GPIOLIB_IRQCHIP

since you use it.

(...)
> +static void mlxbf3_gpio_irq_enable(struct irq_data *irqd)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
> +       struct mlxbf3_gpio_context *gs = gpiochip_get_data(gc);
> +       int offset = irqd_to_hwirq(irqd);
> +       unsigned long flags;
> +       u32 val;
> +
> +       raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
> +       writel(BIT(offset), gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_CLRCAUSE);
> +
> +       val = readl(gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
> +       val |= BIT(offset);
> +       writel(val, gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
> +       raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);

Here, at the end (*after* writing registers) call:

gpiochip_disable_irq(gc, offset);

> +static void mlxbf3_gpio_irq_disable(struct irq_data *irqd)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
> +       struct mlxbf3_gpio_context *gs = gpiochip_get_data(gc);
> +       int offset = irqd_to_hwirq(irqd);
> +       unsigned long flags;
> +       u32 val;
> +

Here, at the beginning (*before* writing registers) call:

gpiochip_disable_irq(gc, offset);

> +       raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
> +       val = readl(gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
> +       val &= ~BIT(offset);
> +       writel(val, gs->gpio_cause_io + MLXBF_GPIO_CAUSE_OR_EVTEN0);
> +       raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
> +}

(...)

> +static const struct irq_chip gpio_mlxbf3_irqchip = {
> +       .name = "MLNXBF33",
> +       .irq_set_type = mlxbf3_gpio_irq_set_type,
> +       .irq_enable = mlxbf3_gpio_irq_enable,
> +       .irq_disable = mlxbf3_gpio_irq_disable,

Like Andy said:

.flags = IRQCHIP_IMMUTABLE,
GPIOCHIP_IRQ_RESOURCE_HELPERS,

Apart from this it looks all right.

Yours,
Linus Walleij
