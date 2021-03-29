Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 203CA34CDF0
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 12:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232524AbhC2K0l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 06:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbhC2K0j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 06:26:39 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD6DCC061574;
        Mon, 29 Mar 2021 03:26:38 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id a12so702392pfc.7;
        Mon, 29 Mar 2021 03:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kPTbRaQZDSiQndnaQKxsVnUS05XzJHynR2rNlitxq74=;
        b=pucJCtr6tdNNNYKAD28U5mqdPM7IltL8yfh+/z7rHZnCoPDEE//4xRsliQjannpzwN
         j3Gfy6JyzBuSQ0Vh03Mjb5YeMHr2AO4SCqdGlOtrYo7YJhmQLMCVnHjH5v9LdqP+fLtt
         YSYxKsjrUaShNZdEE6ga2ETZmkeuZSQ6G03Zfwtd9XAb1e5SRLWGc94o44r10xxRjla4
         yEwATf9SoRvfuKRQ6opcu80+PnXx18rkDmpnRzcs0w5jTmVotfzKD+OKqxp2Q/udE+uB
         9RFgW15kXMWksjQGT5SD2pn2wM0frePhzB1DA4lZppW5ppjt2HU8LnoUSM3NdThlX+2I
         7pgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kPTbRaQZDSiQndnaQKxsVnUS05XzJHynR2rNlitxq74=;
        b=IZ8Xhw0loEWVpGy4lAB+8w/B/m7LQh+Ma9jd+YI7mF4w0uCuZQ/9e1NM0wN0tx+m46
         6tGwvWkpeP1zpbzIMslj96pE/4OOYWEwHAY3XcdsajaLZU+RZj+a9/EOuuDUu0S5EFln
         aBaA01oTgC/6YFzGQgL/peAeBv4dQ4Y1BBJ8Q8HScd043R/uBgZBvf8LJamdGxMx5qIZ
         O2492dTnl/GfDa/IZI7aX7iiBh3Dr6sEysCsjq6fzccMQywc8KXJlAbSiSS0O6zEhHsx
         tIpBZd2JKi3SG1FV9ERaTdWVYWB8vyX4Y+BfMw8K23UrqKHKwo8DDUjqRuVK+okm5HvA
         kuHg==
X-Gm-Message-State: AOAM533LzAFlKYhRh+2mFmzUrp83PkFlDIpHJUOKR6A71p2g0ULW5nni
        zaOdAUx77IF4iaYEhkxPzXu8Az+AXJiRuUoqs4mVqQroaOkg7g==
X-Google-Smtp-Source: ABdhPJyYcKTnBTt/BUm4afJqMlcVHNuWeLusKDyrUptDKM+qYIPCS6uxbMDSvmHRbRoal4HlM3wHIy/m89T6Zo6KMKg=
X-Received: by 2002:a63:cb44:: with SMTP id m4mr731070pgi.4.1617013598368;
 Mon, 29 Mar 2021 03:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616760183.git.sander@svanheule.net> <31e5a5aeb833c43c07daafcf939864497ff1c349.1616760183.git.sander@svanheule.net>
 <CAHp75Vdi06dLxJNCo4f1CA=cS1MuPwG0nEAnVqt8BRrz9bnOtw@mail.gmail.com> <f5059092c1d4f3a23683a2eebfa37cb739881a8a.camel@svanheule.net>
In-Reply-To: <f5059092c1d4f3a23683a2eebfa37cb739881a8a.camel@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 29 Mar 2021 13:26:21 +0300
Message-ID: <CAHp75VfTkfBqHc1S1aUm0Pr-=L_FNDUqkoH_x+KJgkXdZ33VAA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: Add Realtek Otto GPIO support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bert Vermeulen <bert@biot.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 26, 2021 at 11:11 PM Sander Vanheule <sander@svanheule.net> wrote:
> On Fri, 2021-03-26 at 20:19 +0200, Andy Shevchenko wrote:
> > On Fri, Mar 26, 2021 at 2:05 PM Sander Vanheule <sander@svanheule.net>
> > wrote:

...

> > > +       bool "Realtek Otto GPIO support"
> >
> > Why not module?
>
> This driver is only useful on a few specific MIPS SoCs, where this GPIO
> peripheral is a part of that SoC. What would be the point of providing
> this driver as a module?

If it's not critical for boot this makes the kernel smaller and loads
modules only on demand.
Also, (the main part) it allows to build multi-target kernels which
are in general smaller.

That said, you must provide quite a good justification why it's *not* a module.
Otherwise, fix the Kconfig and code accordingly.

...

> > > +static struct realtek_gpio_ctrl *irq_data_to_ctrl(struct irq_data
> > > *data)
> > > +{
> > > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> > > +
> > > +       return container_of(gc, struct realtek_gpio_ctrl, gc);
> > > +}
> >
> > > +static unsigned int line_to_port(unsigned int line)
> > > +{
> > > +       return line / 8;
> > > +}
> > > +
> > > +static unsigned int line_to_port_pin(unsigned int line)
> > > +{
> > > +       return line % 8;
> > > +}
> >
> > These are useless. Just use them inline.
>
> I added these as the alternative of the /16 and %16 I had for the IMR
> offsets in v2. The function names tell the reader _why_ I'm doing the
> division and modulo operations, but I guess a properly named variable
> would do the same.

Exactly! So, please use better variable names on stack.

...


> > > +static const struct of_device_id realtek_gpio_of_match[] = {
> > > +       { .compatible = "realtek,otto-gpio" },
> > > +       {
> > > +               .compatible = "realtek,rtl8380-gpio",
> > > +               .data = (void *)GPIO_INTERRUPTS
> >
> > Not sure why this flag is needed right now. Drop it completely for
> > good.
> > > +       },
> > > +       {
> > > +               .compatible = "realtek,rtl8390-gpio",
> > > +               .data = (void *)GPIO_INTERRUPTS
> >
> > Ditto
>
> Linus Walleij asked this question too after v1:
> https://lore.kernel.org/linux-gpio/e9f0651e5fb52b7d56361ceb30b41759b6f2ec13.camel@svanheule.net/
>
> Note that the fall-back compatible doesn't have this flag set.

AFAICS all, except one have this flag, I suggest you to do other way
around, i.e. check compatible string in the code. Or do something more
clever. What happens if you have this flag enabled for the fallback
node?

If two people ask the same, it might be a smoking gun.

...

> > > +};
> >
> > > +
> >
> > Extra blank line.
>
> Add or drop?

What do you think? :-)

> I see other drivers using no empty line between the
> of_match table and the MODULE_DEVICE_TABLE macro.

Yep, this is not a competition on amount of LOCs, actually, less LOCs
is better, if it keeps the same level of readability and
maintainability,

...

> > > +               iowrite32(GENMASK(31, 0), ctrl->base +
> > > REALTEK_GPIO_REG_ISR);
> >
> > This one perhaps needs a comment like "cleaning all IRQ states".
> > Note, we have a proper callback for this, i.e. hw_init. Consider to use
> > it.
>
> Which "hw_init" are you referring too? I can't really find much, aside
> from drivers implementing it themselves to differentiate between driver
> and hardware set-up.
>
> Since this is normally only called once, I can turn it into the more
> readable:
>         for (port = 0; (port * 8) < ngpios; port++) {
>                 realtek_gpio_write_imr(ctrl, port, 0, 0);
>                 realtek_gpio_clear_isr(ctrl, port, GENMASK(7, 0));
>         }

Good and move it to the callback.

->init_hw() in GPIO IRQ chip data structure.

...

> > > +};
> >
> > > +
> >
> > Extra blank line.
>
> I see the same use of one blank line in other drivers.

Same as above.

> > > +builtin_platform_driver(realtek_gpio_driver);

...

> > So, looking into the code, I think you may easily get rid of 30-50
> > LOCs.
> > So, expecting <= 300 LOCs in v5.
>
> After trimming the file, sloccount puts me at 224, but the total line
> count is still 310. :-)

I was referring to the LOCs, i.o.w. real code with comments :-)

-- 
With Best Regards,
Andy Shevchenko
