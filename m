Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6B1369648
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Apr 2021 17:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237271AbhDWPif (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Apr 2021 11:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242623AbhDWPif (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Apr 2021 11:38:35 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7FFC06174A;
        Fri, 23 Apr 2021 08:37:58 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id em21-20020a17090b0155b029014e204a81e6so4653313pjb.1;
        Fri, 23 Apr 2021 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e6LvPN5k/e6aeDrQflzhvIspluilkhQHg67ojXCyOBs=;
        b=Tk3OglU8G2AJv4SGZhCyFCJjt8fgdTjSTqcMopPgywdvcv13dBwJCXoIW3bWqIRbQ1
         wRlRnUrUw+avpWjLlwHgPFM/Ey8AhILNMmdrPrBcA1P5wGDcIQPgJtJHoKvnM2WTv0SF
         xhEoGKaFpCa4pS+6Iv1YFcxCIDyOXes/n0CjKoB38qQA28Rh0i+v1V3fgaDzRzLllX8Q
         xP43XXMaV50fn1GoCbd1JG+SBD7dE1kJ7j3eeP6el2R6ma28LoSxxrV4RpqPD470G3go
         uPFUaQVaHfwrR5yunBlVCWFrOHyLzNP1fpMRjClvRAzmjQnklZ8J5Y/iX4KtC6u85mtv
         SgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e6LvPN5k/e6aeDrQflzhvIspluilkhQHg67ojXCyOBs=;
        b=Wpi/AbayBATn6RKi6g4IGEC5QWr9d/x62PWXaQNttLqudkImo9kZLzNRAltELRTMgK
         bdzUSeooFq4NrK/RwFY5jnIHkDNEg0p63DdiOZN6tosJO0Ci5LZgdQDO7OL2kCxAVXEB
         G5Jfj8KSU6X1YwjnGSm5haZDK148tV9BSrSO4lOhjwLbk0xNHJ4Zoh3v/W+cX0bzFl3s
         r7jADm32xvJ2ajZfEgwH19Bw5NVvg9LH5bjzrcigJG0wf56bnlY1tKVoA2VpSQLjepnx
         HNYpEuSPNRn/aN2LM+/X1leI1pZe52c/3INO3De+YQPUQAPUPNavjCnJIDuASDNw73XB
         lfkQ==
X-Gm-Message-State: AOAM531SOtLbjvQUDR5abxlsoP/Um8eSDjLtKJ9t2bRySw70P1SoFKng
        hzhdicXSVJHLyE1XPnqUG5QxRRRzCDm7Y6IfeiQ=
X-Google-Smtp-Source: ABdhPJzTza+5jyGlQ2j+ywWd9ns17382C+/TZwys5DJ6aS783eNyYPuvy6ta8sD/mKk4RVE6ZofvLiB08h7zeJijrec=
X-Received: by 2002:a17:90b:1c0f:: with SMTP id oc15mr5263860pjb.228.1619192277759;
 Fri, 23 Apr 2021 08:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210422152055.85544-1-tsbogend@alpha.franken.de>
In-Reply-To: <20210422152055.85544-1-tsbogend@alpha.franken.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 23 Apr 2021 18:37:41 +0300
Message-ID: <CAHp75Ve6PEr5TFGRgALPCbi-T5Y5yNPV+-fJHC7C2mU+ms30uw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 22, 2021 at 6:21 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> IDT 79RC3243x SoCs integrated a gpio controller, which handles up
> to 32 gpios. All gpios could be used as interrupt source.

as an interrupt

Thanks for an update, my comments below (minus that you already figured out).

...

> +config GPIO_IDT3243X
> +       tristate "IDT 79RC3243X GPIO support"
> +       depends on MIKROTIK_RB532 || COMPILE_TEST

Right.

But if MikroTik is dependent on this you may return default in a form of

  default MIKROTIK_RB532

Up to you. (What I meant previously is the unnecessary ' y if' part).

> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
> +       help
> +         Select this option to enable GPIO driver for
> +         IDT 79RC3243X SoC devices.

Seems like you may elaborate a bit more here, what kind of the
devices, list one or couple of examples, etc.

> +         To compile this driver as a module, choose M here: the module will
> +         be called gpio-idt3243x.

...

> +/*
> + * Driver for IDT/Renesas 79RC3243x Interrupt Controller.
> + */

One line?

...

> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

Why is this?

...

> +#include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>

> +#include <linux/irqchip.h>
> +#include <linux/irqchip/chained_irq.h>

Aren't those guaranteed to be included by irq.h?

> +#include <linux/irqdomain.h>

Missed mod_devicetable.h
module.h

> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>

Do you use them anyhow? (See below as well)

Missed types.h

...

> +static void idt_gpio_dispatch(struct irq_desc *desc)
> +{
> +       struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> +       struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
> +       struct irq_chip *host_chip = irq_desc_get_chip(desc);
> +       unsigned int bit, virq;
> +       unsigned long pending;
> +
> +       chained_irq_enter(host_chip, desc);
> +
> +       pending = readl(ctrl->pic + IDT_PIC_IRQ_PEND);
> +       pending &= ~ctrl->mask_cache;
> +       for_each_set_bit(bit, &pending, gc->ngpio) {

> +               virq = irq_linear_revmap(gc->irq.domain, bit);

Is it guaranteed to be linear always?

> +               if (virq)
> +                       generic_handle_irq(virq);
> +       }
> +
> +       chained_irq_exit(host_chip, desc);
> +}

...

> +       if (sense & ~(IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))

There is a _BOTH variant.

> +               return -EINVAL;

> +       ilevel = readl(ctrl->gpio + IDT_GPIO_ILEVEL);
> +       if (sense & IRQ_TYPE_LEVEL_HIGH)
> +               ilevel |= BIT(d->hwirq);
> +       else if (sense & IRQ_TYPE_LEVEL_LOW)
> +               ilevel &= ~BIT(d->hwirq);

> +       else
> +               return -EINVAL;

Is it a double check of the above?

...

> +       ctrl->gc.parent = dev;

Wondering if it's already done by GPIO library.

...

> +       ctrl->gc.ngpio = ngpios;

Shouldn't you do this before calling for bgpio_init()?

...

> +       parent_irq = irq_of_parse_and_map(pdev->dev.of_node, 0);

platform_get_irq() ?..

> +       if (!parent_irq) {

> +               dev_err(&pdev->dev, "Failed to map parent IRQ!\n");

...and drop this, since it will be taken care of.

> +               return -EINVAL;
> +       }

...

> +       /* Mask interrupts. */
> +       ctrl->mask_cache = 0xffffffff;
> +       writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);

What about using ->init_hw() call back?

...

> +       girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),

1 -> girq->num_parents

> +                                    GFP_KERNEL);
> +       if (!girq->parents) {
> +               ret = -ENOMEM;
> +               goto out_unmap_irq;
> +       }

...

> +       girq->handler = handle_level_irq;

handle_bad_irq()

...

> +       ret = devm_gpiochip_add_data(&pdev->dev, &ctrl->gc, ctrl);
> +       if (ret)
> +               goto out_unmap_irq;
> +
> +       return 0;

return devm_...;

...

> +out_unmap_irq:
> +       irq_dispose_mapping(parent_irq);
> +       return ret;
> +}

No need.

-- 
With Best Regards,
Andy Shevchenko
