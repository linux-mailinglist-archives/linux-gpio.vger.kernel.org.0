Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB272E4163
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Dec 2020 16:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439051AbgL1PGA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Dec 2020 10:06:00 -0500
Received: from forward500p.mail.yandex.net ([77.88.28.110]:53577 "EHLO
        forward500p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2504228AbgL1PF4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Dec 2020 10:05:56 -0500
Received: from iva3-4f441b146a71.qloud-c.yandex.net (iva3-4f441b146a71.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:498c:0:640:4f44:1b14])
        by forward500p.mail.yandex.net (Yandex) with ESMTP id 48127940423;
        Mon, 28 Dec 2020 18:05:08 +0300 (MSK)
Received: from localhost (localhost [::1])
        by iva3-4f441b146a71.qloud-c.yandex.net (mxback/Yandex) with ESMTP id 3PoAR5PxjQ-57DKFFLj;
        Mon, 28 Dec 2020 18:05:07 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1609167907;
        bh=LbIGQYGVuU5ladSSucPcONHVBEN4CnC07EgGwEb9mJM=;
        h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
        b=XomDNzRhsgUveeGirs/jYiRH5/+75xmaf0/IO7vrtBGbnJeDfZIdHkeeQTITyiPZN
         8IaIuwjACxJEFd0AhQqnzUkYNcdmVa2GfGc6LTbrSsrI3Z8WX7JvyF6k/8zCfeP72M
         rEuru72NrUmnKngZ0ndx7qqHRCYe735Aw217y+1o=
Authentication-Results: iva3-4f441b146a71.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva4-0814df7d67c8.qloud-c.yandex.net with HTTP;
        Mon, 28 Dec 2020 18:05:07 +0300
From:   nikita.shubin@maquefel.me
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
In-Reply-To: <CAHp75VctYjASuKeEqOQDH1k5XKSYVGMFsf+_cOCx72JtiMnBSw@mail.gmail.com>
References: <20201224112203.7174-1-nikita.shubin@maquefel.me> <20201224112203.7174-2-nikita.shubin@maquefel.me> <CAHp75VctYjASuKeEqOQDH1k5XKSYVGMFsf+_cOCx72JtiMnBSw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] gpio: ep93xx: convert to multi irqchips
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Mon, 28 Dec 2020 18:05:07 +0300
Message-Id: <715101609167778@mail.yandex.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

26.12.2020, 20:52, "Andy Shevchenko" <andy.shevchenko@gmail.com>:
> On Thu, Dec 24, 2020 at 1:23 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>>  Since gpiolib requires having separate irqchips for each gpiochip, we
>>  need to add some we definetly need a separate one for F port, and we
>
> definitely
>
>>  could combine gpiochip A and B into one - but this will break namespace
>>  and logick.
>>
>>  So despite 3 irqchips is a bit beefy we need a separate irqchip for each
>
> is a -> being a
>
>>  interrupt capable port.
>>
>>  - added separate irqchip for each iterrupt capable gpiochip
>
> interrupt
>
>>  - dropped ep93xx_gpio_port (it wasn't working correct for port F anyway)
>>  - moved irq registers into separate struct ep93xx_irq_chip, togather
>
> irq -> IRQ (everywhere)
>
> together
>
>>    with regs current state
>>  - reworked irq handle for ab gpiochips (through bit not tottaly sure this
>>    is a correct thing to do)
>
> ab -> AB ?
>
> In the parentheses something like "I'm not totally sure that this is a
> correct thing to do, though".
>
>>  - dropped has_irq and has_hierarchical_irq and added a simple index
>>    which we rely on when adding irq's to gpiochip's
>
> IRQs to GPIO chips
>
> (It would be nice if you can spell check and proofread commit
> messages and comments in the code.
>
> ...
>
>>  +struct ep93xx_irq_chip {
>>  + void __iomem *int_type1;
>>  + void __iomem *int_type2;
>>  + void __iomem *eoi;
>>  + void __iomem *en;
>>  + void __iomem *debounce;
>>  + void __iomem *status;
>
> This is a bit... overcomplicated.
> Can we rather use regmap API?
>
>>  + u8 gpio_int_unmasked;
>>  + u8 gpio_int_enabled;
>>  + u8 gpio_int_type1;
>>  + u8 gpio_int_type2;
>>  + u8 gpio_int_debounce;
>>  + struct irq_chip chip;
>>  +};
>
> ...
>
>>   /* Port ordering is: A B F */
>>  +static const char *irq_chip_names[3] = {"gpio-irq-a",
>>  + "gpio-irq-b",
>>  + "gpio-irq-f"};
>
> Can you use better pattern, ie.
> static const char * const foo[] = {
>   ...
> };
>
> (there are two things: splitting per lines and additional const)?
>
> ...
>
>>  + ab_parent_irq = platform_get_irq(pdev, 0);
>
> Error check, please?
> Also, if it's an optional resource, use platform_get_irq_optional().
>
>>  + err = devm_request_irq(dev, ab_parent_irq,
>>  + ep93xx_ab_irq_handler,
>>  + IRQF_SHARED, eic->chip.name, gc);
>
>>  +
>
> Redundant blank line.
>
>>  + if (err) {
>>  + dev_err(dev, "error requesting IRQ : %d\n", ab_parent_irq);
>>  + return err;
>>  + }
>
> ...
>
>>  + girq->num_parents = 1;
>>  + girq->parents = devm_kcalloc(dev, 1,
>>  + sizeof(*girq->parents),
>>  + GFP_KERNEL);
>
> Can be squeezed to less amount of LOCs. Also consider to use
> girq->num_parents as a parameter to devm_kcalloc().
>
>>  + if (!girq->parents)
>>  + return -ENOMEM;
>
> ...
>
>>  + girq->handler = handle_level_irq;
>
> Don't we want to mark them as bad by using handle_bad_irq() as default handler?
>
> ...
>
>>  + /*
>>  + * FIXME: convert this to use hierarchical IRQ support!
>>  + * this requires fixing the root irqchip to be hierarchial.
>
> hierarchical
>
>>  + */
>
> ...
>
>>  + girq->num_parents = 8;
>>  + girq->parents = devm_kcalloc(dev, 8,
>>  + sizeof(*girq->parents),
>>  + GFP_KERNEL);
>
> As per above.
>
>>  +
>
> Redundant blank line.
>
>>  + if (!girq->parents)
>>  + return -ENOMEM;
>
> ...
>
>>  + /* Pick resources 1..8 for these IRQs */
>>  + for (i = 1; i <= 8; i++)
>>  + girq->parents[i - 1] = platform_get_irq(pdev, i);
>
> I would rather like to see i + 1 as a parameter which is much easier
> to read and understand.
>
>>  + for (i = 0; i < 8; i++) {
>
> Also in both cases replace 8 by ARRAY_SIZE() or predefined constant.
>
>>  + gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
>>  + irq_set_chip_data(gpio_irq, gc);
>>  + irq_set_chip_and_handler(gpio_irq,
>>  + girq->chip,
>>  + handle_level_irq);
>>  + irq_clear_status_flags(gpio_irq, IRQ_NOREQUEST);
>>  + }
>
> Okay, I see that this is in the original code. Consider them as
> suggestions for additional changes.
>
> And briefly looking into the rest of the code the recommendation is to
> split this and perhaps other patches to smaller logical pieces.
>
> Also, try to organize your series in groups each of them respectively
> represents the following
> 1) fixes (can be backported, usually contain Fixes tag to the culprit commit);
> 2) preparatory refactoring patches / cleanups;
> 3) new features.
>
> --
> With Best Regards,
> Andy Shevchenko

Thank you, Andy, i ll rework my RFC patch according to your advices and resubmit.
