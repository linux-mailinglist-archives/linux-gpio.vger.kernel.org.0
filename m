Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 365192E2EDF
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Dec 2020 18:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgLZRxf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Dec 2020 12:53:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgLZRxe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Dec 2020 12:53:34 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C745C0617A2;
        Sat, 26 Dec 2020 09:52:17 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id be12so3671211plb.4;
        Sat, 26 Dec 2020 09:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OG4g1yM5ywKB6bxe2+5JdEWT+4qZ70kc1se9lNzGopE=;
        b=OWI9TM3WL33MQcqQu8ac5U+Ob8SrHawLXDUz0qLoFAL2mlVYRaOmiy8Whj1QWVVF1i
         jrKllEghXCTUbcDIbpPOTBY+8BWO1wdmbvL4aVwp93WxxoCABzUakEHkkN9zzp/hSGQO
         FMGD+KuZUDITmPkM6b2rJL9SnjjYUepZEd+GkXlgzo7K6waT4YVrII8G8HmPMyIfCJFf
         fi9EJjNHFOCkoPQ4oaQ2dXMStCOhksfrdqp2yCA3P/QZ+QHBWVjTU1ej5+BPRu/gEdgi
         yXUAaOtLCWZHI5+C6Zai+aDj504AwEFKrjer4sGO6W5aI2Ci4Eug1RhSmxJZrtmcVm47
         4evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OG4g1yM5ywKB6bxe2+5JdEWT+4qZ70kc1se9lNzGopE=;
        b=TscPIIbgn7wpc9xSg3vekcvRdBF+kJSRDjrOQAV3yQuL/Q4xFCJQvBGkDZ5seednKq
         DHWF9BoakpIzKRXKVO1DHwkdpZw9oys8A1568uJL8LCE5pwhkIoVpzWSSN279Y+Hg+vO
         I7ya2SJHiDfp8ma6zruU+dxgd3KLPHvQ+fU2wFJdJicLZ1rRFC0e+sIZXoZgnfjkFkrt
         qm4mKQSu1CJ2kdBs5rUicGFq8cTMYzEXXkPWyMvs4ZrXFUTeVHKRCnQK3TDq+zpVG5i+
         c6UwOrRRfRYCE9Rn8ZYMeSPJexlnu/yTCDnd/ZmKO53e3UFckVxZkz9MWMeKKZ/2Vya0
         3sxA==
X-Gm-Message-State: AOAM533n5ir3KBI5znDjKC5PQp+TF7IQ1bVC/JNXeqq+rgm5eBhsXQml
        RjKc2f8cpL8rZhElo8d994ik1XD2SddmJHCQxbA=
X-Google-Smtp-Source: ABdhPJwfqKKI2EWejUpP/LhpPPPAYbjruZeZPYzm+AYd0wAw5dt2Gb9bV85ppbLQC2UCvB1RGX6H5aXA09YpispALbE=
X-Received: by 2002:a17:902:e98c:b029:da:cb88:f11d with SMTP id
 f12-20020a170902e98cb02900dacb88f11dmr16925069plb.17.1609005136604; Sat, 26
 Dec 2020 09:52:16 -0800 (PST)
MIME-Version: 1.0
References: <20201224112203.7174-1-nikita.shubin@maquefel.me> <20201224112203.7174-2-nikita.shubin@maquefel.me>
In-Reply-To: <20201224112203.7174-2-nikita.shubin@maquefel.me>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 26 Dec 2020 19:52:00 +0200
Message-ID: <CAHp75VctYjASuKeEqOQDH1k5XKSYVGMFsf+_cOCx72JtiMnBSw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] gpio: ep93xx: convert to multi irqchips
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 24, 2020 at 1:23 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> Since gpiolib requires having separate irqchips for each gpiochip, we
> need to add some we definetly need a separate one for F port, and we

definitely

> could combine gpiochip A and B into one - but this will break namespace
> and logick.
>
> So despite 3 irqchips is a bit beefy we need a separate irqchip for each

is a -> being a

> interrupt capable port.
>
> - added separate irqchip for each iterrupt capable gpiochip

interrupt

> - dropped ep93xx_gpio_port (it wasn't working correct for port F anyway)
> - moved irq registers into separate struct ep93xx_irq_chip, togather

irq -> IRQ (everywhere)

together

>   with regs current state
> - reworked irq handle for ab gpiochips (through bit not tottaly sure this
>   is a correct thing to do)

ab -> AB ?

In the parentheses something like "I'm not totally sure that this is a
correct thing to do, though".

> - dropped has_irq and has_hierarchical_irq and added a simple index
>   which we rely on when adding irq's to gpiochip's

IRQs to GPIO chips

(It would be nice if you can spell check and proofread  commit
messages and comments in the code.

...

> +struct ep93xx_irq_chip {
> +       void __iomem    *int_type1;
> +       void __iomem    *int_type2;
> +       void __iomem    *eoi;
> +       void __iomem    *en;
> +       void __iomem    *debounce;
> +       void __iomem    *status;

This is a bit... overcomplicated.
Can we rather use regmap API?

> +       u8              gpio_int_unmasked;
> +       u8              gpio_int_enabled;
> +       u8              gpio_int_type1;
> +       u8              gpio_int_type2;
> +       u8              gpio_int_debounce;
> +       struct  irq_chip chip;
> +};

...

>  /* Port ordering is: A B F */
> +static const char *irq_chip_names[3]           = {"gpio-irq-a",
> +                                               "gpio-irq-b",
> +                                               "gpio-irq-f"};

Can you use better pattern, ie.
static const char * const foo[] = {
  ...
};

(there are two things: splitting per lines and additional const)?

...

> +       ab_parent_irq = platform_get_irq(pdev, 0);

Error check, please?
Also, if it's an optional resource, use platform_get_irq_optional().

> +       err = devm_request_irq(dev, ab_parent_irq,
> +                       ep93xx_ab_irq_handler,
> +                       IRQF_SHARED, eic->chip.name, gc);

> +

Redundant blank line.

> +       if (err) {
> +               dev_err(dev, "error requesting IRQ : %d\n", ab_parent_irq);
> +               return err;
> +       }

...

> +       girq->num_parents = 1;
> +       girq->parents = devm_kcalloc(dev, 1,
> +                               sizeof(*girq->parents),
> +                               GFP_KERNEL);

Can be squeezed to less amount of LOCs. Also consider to use
girq->num_parents as a parameter to devm_kcalloc().

> +       if (!girq->parents)
> +               return -ENOMEM;

...

> +       girq->handler = handle_level_irq;

Don't we want to mark them as bad by using handle_bad_irq() as default handler?

...

> +       /*
> +        * FIXME: convert this to use hierarchical IRQ support!
> +        * this requires fixing the root irqchip to be hierarchial.

hierarchical

> +        */

...

> +       girq->num_parents = 8;
> +       girq->parents = devm_kcalloc(dev, 8,
> +                                    sizeof(*girq->parents),
> +                                    GFP_KERNEL);

As per above.

> +

Redundant blank line.

> +       if (!girq->parents)
> +               return -ENOMEM;

...

> +       /* Pick resources 1..8 for these IRQs */
> +       for (i = 1; i <= 8; i++)
> +               girq->parents[i - 1] = platform_get_irq(pdev, i);

I would rather like to see i + 1 as a parameter which is much easier
to read and understand.

> +       for (i = 0; i < 8; i++) {

Also in both cases replace 8 by ARRAY_SIZE() or predefined constant.

> +               gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
> +               irq_set_chip_data(gpio_irq, gc);
> +               irq_set_chip_and_handler(gpio_irq,
> +                                       girq->chip,
> +                                       handle_level_irq);
> +               irq_clear_status_flags(gpio_irq, IRQ_NOREQUEST);
> +       }

Okay, I see that this is in the original code. Consider them as
suggestions for additional changes.

And briefly looking into the rest of the code the recommendation is to
split this and perhaps other patches to smaller logical pieces.

Also, try to organize your series in groups each of them respectively
represents the following
1) fixes (can be backported, usually contain Fixes tag to the culprit commit);
2) preparatory refactoring patches / cleanups;
3) new features.


-- 
With Best Regards,
Andy Shevchenko
