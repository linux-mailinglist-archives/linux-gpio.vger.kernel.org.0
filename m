Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 978AF6146E
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jul 2019 10:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfGGIKM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Jul 2019 04:10:12 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43103 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbfGGIKM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Jul 2019 04:10:12 -0400
Received: by mail-lf1-f66.google.com with SMTP id c19so3218555lfm.10
        for <linux-gpio@vger.kernel.org>; Sun, 07 Jul 2019 01:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Og+1ZMEbhyV3WkQcVL8uCE7LlGWe+B5LDW/MNApWX1Y=;
        b=S1Ri51ACwXiJMsz2WwUSg2J/xsP0BTp5sA8ch2iWa1+lHQrGaK1Y+Jwh1LDGzxbZaL
         L7MNooFvJq4ZjNqhtLqpIjGn+/wwp4r3BR0/mG63AZCsix8oJTVLLEPgZG1yFxyEV5Fo
         UIsrlNiop6OhKKnltnEi+bkxLXCDkI3Rear1Ry0JaJ4Pz9fO6y+avnY45+1gGOAYTYk5
         2hM8/bs/AOG7rRnhEqn0/Tu+HrF0cLop37FrpHnFslu0VukxToPHqZ1tuIQEyE2w1ny5
         ofMA+mkcAsf4Y22/l56JbnSeX6O8Pct3X+uu5A1tznXkxy5HRYIVSe+Eo8uBz/odh718
         MW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Og+1ZMEbhyV3WkQcVL8uCE7LlGWe+B5LDW/MNApWX1Y=;
        b=Q0clLgv+rwu8A9GGwbng/gZ2iztFEzhT7+jpKP/UnVDBRrQl/kkKNBQSOYfg/HlnBH
         EdsmYAX2o35piehkO7hbbnh2Ph/K3Wf6kn48ZM9yPEjhHR/AzXDBlclR8sI+TK94IfGW
         v9NY3xuuhFBauplrpOXgtmUJ+yzgYQogkreuvn52047O1tIQP0gQ2JzkejQCv35NHv/G
         EmKzJYEeZg7UX0u5wqZKJm+xWUDM6rF4bx9TYNEkH8ecXwrbvRHYLjVf83qyNIq8Yo8y
         RK3fpr+tAN/Z9hhlazLnJ75TH9jFPA92xKprtHdlbQ8ArbqgZ4dlGJZ6Nlsk3TAnAN9J
         o2ng==
X-Gm-Message-State: APjAAAVcFQlmNslDZrMfu7v6FxxYFDZVfGWvFxCkctUnc3jMIVMAMjCp
        9jKLR74Vbq1U49zAEdNQXgz/7uZswIPLgf+L/b00lA==
X-Google-Smtp-Source: APXvYqxoHHmUVZdcgQBEOQn+LeoqbK4jG7rRaLTFboV1selGXXe7TJPonCkYixwGCn7jRaj0WJKy6ko1zRXlE/GqdJs=
X-Received: by 2002:a19:7616:: with SMTP id c22mr5869043lff.115.1562487010498;
 Sun, 07 Jul 2019 01:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190624132531.6184-1-linus.walleij@linaro.org> <20190707014620.GA9690@onstation.org>
In-Reply-To: <20190707014620.GA9690@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 7 Jul 2019 10:09:58 +0200
Message-ID: <CACRpkdY7ydVi90JpNKJy2nPXxm0N2Ji5PmQu1gWbmifFnbpFYA@mail.gmail.com>
Subject: Re: [PATCH 1/4 v1] gpio: Add support for hierarchical IRQ domains
To:     Brian Masney <masneyb@onstation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 7, 2019 at 3:46 AM Brian Masney <masneyb@onstation.org> wrote:

> I got this working with spmi-gpio with two additional changes. See below
> for details. Hopefully I'll have time tomorrow evening (GMT-4) to finish
> cleaning up what I have so I can send out my series.

Awesome! No hurry because it is v5.4 material at this point but I'm
hoping to get to something you, Lina and Thierry can all use for early
merge and smoke test.

> > +static const struct irq_domain_ops gpiochip_hierarchy_domain_ops = {
> > +     .activate = gpiochip_irq_domain_activate,
> > +     .deactivate = gpiochip_irq_domain_deactivate,
> > +     .translate = gpiochip_hierarchy_irq_domain_translate,
> > +     .alloc = gpiochip_hierarchy_irq_domain_alloc,
> > +     .free = irq_domain_free_irqs_common,
> > +};
>
> spmi and ssbi gpio both need to subtract one from the hwirq in the
> translate function.
>
> https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c#L956
>
> I'm going to optionally allow overriding the translate() function
> pointer as well.

Hm was more thinking to let gpiolib call out to an optional translate
function (on top of the template) but this is maybe cleaner.

> > +             /*
> > +              * We set handle_bad_irq because the .set_type() should
> > +              * always be invoked and set the right type of handler.
> > +              */
> > +             irq_domain_set_info(d,
> > +                                 irq + i,
> > +                                 hwirq + i,
> > +                                 gc->irq.chip,
> > +                                 gc,
> > +                                 handle_bad_irq,
>                                     ^^^^^^^^^^
> In order to get this working, I had to change handle_bad_irq to
> handle_level_irq otherwise I get this attempted NULL pointer
> dereference:

Hmmmmmmmm that should not happen, we need to get to the
bottom of this.

> [    2.624430] [<c0372af4>] (irq_chip_ack_parent) from [<c0373f6c>] (__irq_do_set_handler+0x1b4/0x1bc)
> [    2.632584] [<c0373f6c>] (__irq_do_set_handler) from [<c0373fc0>] (__irq_set_handler+0x4c/0x78)
> [    2.641441] [<c0373fc0>] (__irq_set_handler) from [<c0375d44>] (irq_domain_set_info+0x38/0x4c)
> [    2.650126] [<c0375d44>] (irq_domain_set_info) from [<c06cf28c>] (gpiochip_hierarchy_irq_domain_alloc+0x16c/0x22c)
> [    2.658808] [<c06cf28c>] (gpiochip_hierarchy_irq_domain_alloc) from [<c0376bac>] (__irq_domain_alloc_irqs+0x12c/0x320)

I wonder why irq_chip_ack_parent() is called there.
Like there is some pending IRQ or something.

> The parent's irq_chip struct isn't populated yet and the error occurs
> here:
>
>     void irq_chip_ack_parent(struct irq_data *data)
>     {
>             data = data->parent_data;
>             data->chip->irq_ack(data);
>                   ^^^^
>
> We haven't called irq_domain_alloc_irqs_parent() yet, which is fine.
>
> __irq_do_set_handler() has a special check for handle_bad_irq():
>
> https://elixir.bootlin.com/linux/latest/source/kernel/irq/chip.c#L974
>
> I'm not sure what the proper fix is here and not going to dig into this
> anymore this evening.

I'm a bit puzzled too. :/

> > diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
> > index 1ce7fcd0f989..3099c7fbefdb 100644
> > --- a/Documentation/driver-api/gpio/driver.rst
> > +++ b/Documentation/driver-api/gpio/driver.rst
>
> I'm still on linux next-20190701. Does this patch series of yours
> require any other patches? I get a merge conflict against driver.rst.
> Everything else applies cleanly. I honestly haven't looked in detail
> about the conflicts.

I have some pending documentation patch I think.
Sorry about that.

Yours,
Linus Walleij
