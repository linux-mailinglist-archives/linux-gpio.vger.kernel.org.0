Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C9B438539
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Oct 2021 22:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbhJWUbb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Oct 2021 16:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbhJWUbb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Oct 2021 16:31:31 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77164C061714;
        Sat, 23 Oct 2021 13:29:11 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id d3so2511182edp.3;
        Sat, 23 Oct 2021 13:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SzVsOsazz6NgGH8KlymKLjObEboSVEskSxC1YWCAEw0=;
        b=X6FhEI8KR4yF/JzKN0WfOrZUVXXl3Z0uA43e1KGXQJH4sqg6CGTn1wlhZN61EgHmD3
         lj9nWS2tQ7rGEAQcfwtRiOy8bJ4j5QauFfdOTYAf2oZUeCvsj19Ufho8hZHTz/hlZ9WA
         249T9S+51UEZZByD7YwodCA/f2DxFBSRrgmlwIdjPFVpWavHQ3nvM85EVy1SYE+du8Nv
         EDnYB5RhTA2K3RqckOVWkkN4vUyWK7E63RqAN3NlfgfcjqBYN9uAdmRldrhOf2U1qmzb
         oN7OOKy8RBn/45MXfe+CXLDRGfPGQ/+n6ikl1UgqDXgX2LdVvvp2ZG1qANvEOlxc6IYR
         rKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SzVsOsazz6NgGH8KlymKLjObEboSVEskSxC1YWCAEw0=;
        b=m1WlXyce4lJ7n4uhfgFwTIhGjC/b7lwhTiPVQBUjw1wiMF4bYUAMvRYF01e0DddbAt
         ux/WBsd87qbv5uiXkN+JwxuxyjVNIilXrCy1z2UQR9VnbMXKIwm+KnKfItpuFdOSwqQm
         Dqbe2WTIdmn2KLQ1vXkHH2yLbQsfo5vRefdBW6QfSPnrFeHDk+MZYGPAfYJG3Ixuj7Wi
         oAHUp8YwaEwg+RejYuW3GebD3QYcetu47k/wiB2x/jXBXoP0lmf9WVqoj7IMgkJxVMtr
         Gq7Gyz6XZjYlvXhgQHlERFcLEjbytQaF9Wm8JFb2BkdXHvcez6XQUVja6f/h67ovsBWD
         O/KQ==
X-Gm-Message-State: AOAM5325Ut7JSFTBlEe1QUdAgY8L7JVgmHfzIucDfne6Sip/An1Nhm+q
        gRRkgrbZuozbvqlqkffLGybxRKEnkctf4Tker0k=
X-Google-Smtp-Source: ABdhPJwe86OXrLgQr5wEpGhqsTLlqOWg2HVfJfboGhfAmN9//Cy2DIVS6hRyxHuZK7CF3ikwca10ZYQTNd/3mna8SzI=
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr9785287ejc.69.1635020949911;
 Sat, 23 Oct 2021 13:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-13-kernel@esmil.dk>
 <CAHp75Vf3yNoKxguHP3EPcRV_3tG++Fd=FVM0MXqW4_SmLA6HEw@mail.gmail.com> <CANBLGcxEwkcZn2CC69zLaVqL8ocS6r6HDaaoUF09gg1mpDxFzg@mail.gmail.com>
In-Reply-To: <CANBLGcxEwkcZn2CC69zLaVqL8ocS6r6HDaaoUF09gg1mpDxFzg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 23 Oct 2021 23:28:33 +0300
Message-ID: <CAHp75Vc5-Sg-0kKN=OMs_2iJbtc+D9=f0-Sp+SpY5O3roU3XdA@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huan Feng <huan.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 23, 2021 at 9:46 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Fri, 22 Oct 2021 at 15:32, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Thu, Oct 21, 2021 at 8:44 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > +               } else if ((npins = of_property_count_u32_elems(child, "pins")) > 0) {
> > > +                       pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> > > +                       if (!pins)
> > > +                               goto free_grpname;
> > > +
> > > +                       pinmux = NULL;
> > > +
> > > +                       for (i = 0; i < npins; i++) {
> > > +                               u32 v;
> > > +
> > > +                               ret = of_property_read_u32_index(child, "pins", i, &v);
> > > +                               if (ret)
> > > +                                       goto free_pins;
> > > +                               pins[i] = v;
> > > +                       }
> >
> > NIH _array() APIs.
>
> .. here the pins array is an int array and not u32 array. I can cast
> it and and hope Linux will never run on a machine where sizeof(int) !=
> 4 if you think that's better?

Can you make it u32?

...

> > > +free_pinmux:
> > > +       devm_kfree(dev, pinmux);
> > > +free_pins:
> > > +       devm_kfree(dev, pins);
> > > +free_grpname:
> > > +       devm_kfree(dev, grpname);
> >
> > > +free_pgnames:
> > > +       devm_kfree(dev, pgnames);
> >
> > Just no, please get rid of them either way as I explained in previous reviews.
>
> So I asked you if you thought it was better to leave these unused
> allocations when parsing the device tree node fails but you never
> answered that. I didn't want put words in your mouth so I could only
> assume you didn't. I'd really like a straight answer to that so I have
> something to refer to when people ask why this driver doesn't do the
> same as fx. the pinctrl-single. So just to be clear: do you think it's
> better to leave this unused garbage allocated if parsing the device
> tree node fails?

If it's only one time use, I don't think it's good to have it hanging
around, BUT at the same time devm_*() is not suitable for such
allocations.

...

> > > +               if (reg_din)
> > > +                       writel_relaxed(gpio + 2, reg_din);
> >
> > Why 0 can't be written?
>
> Because signal 0 is a special "always 0" signal and signal 1 is a
> special "always 1" signal, and after that signal n is the input value
> of GPIO n - 2. We don't want to overwrite the PoR defaults.

Okay, this, perhaps, needs a comment (if I have not missed the existing one).

And what about checking for reg_din? Do you have some blocks output-only?

...

> > > +               case PIN_CONFIG_BIAS_DISABLE:
> > > +                       mask |= PAD_BIAS_MASK;
> > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> >
> > Okay, I have got why you are masking on each iteration, but here is
> > the question, shouldn't you apply the cnages belonged to each of the
> > group of options as it's requested by the user? Here you basically
> > ignore all previous changes to bias.
> >
> > I would expect that you have something like
> >
> > for () {
> >   switch (type) {
> >   case BIAS*:
> >     return apply_bias();
> >   ...other types...
> >   default:
> >     return err;
> >   }
> > }
>
> I such cases where you get conflicting PIN_CONFIG_BIAS_* settings I
> don't see why it's better to do the rmw on the padctl register for the
> first bias setting only to then change the bits again a few
> microseconds later when the loop encounters the second bias setting.
> After the loop is done the end result would still be just the last
> bias setting.

It could be bias X followed by something else followed by bias Y. You
will write something else with bias Y. I admit I don't know this
hardware and you and maintainers are supposed to decide what's better,
but my guts are telling me that current algo is buggy.

> > > +                       break;

...

> > > +static int starfive_gpio_request(struct gpio_chip *gc, unsigned int gpio)
> > > +{
> > > +       return pinctrl_gpio_request(gc->base + gpio);
> > > +}
> > > +
> > > +static void starfive_gpio_free(struct gpio_chip *gc, unsigned int gpio)
> > > +{
> > > +       pinctrl_gpio_free(gc->base + gpio);
> > > +}
> >
> > Point of having these function is...?
>
> These calls tells the pinctrl system that a certain pin is now used
> for GPIO. Conversely it'll also prevent fx. userspace from doing GPIO
> on a pin that's already used by I2C, a UART or some other peripheral.

Isn't pin control doing it by default?

...

> > > +       /* enable input and schmitt trigger */
> >
> > Use capitalization consistently.
>
> I am?

In the comment is one style, in other comments it's another.

...

> > > +       case IRQ_TYPE_EDGE_RISING:

> > > +               handler   = handle_edge_irq;
> > > +               break;
> > > +       case IRQ_TYPE_EDGE_FALLING:

> > > +               handler   = handle_edge_irq
> > > +               break;
> > > +       case IRQ_TYPE_EDGE_BOTH:

> > > +               handler   = handle_edge_irq;
> >
> > Dup. You may do it once without any temporary variable.
> > I haven't got why you haven't addressed this.
>
> So you want two switches on the trigger variable, one for irq_type,
> edge_both and polarity, and one for the handler? If this is not what
> you have in mind please be a lot more explicit. Trying to guess what
> you mean gets really old.

switch (type) {
case bla bla bla:
  ...everything except handler...
}

if (type & EDGE)
 irq_lock(edge_handler)
else if (type & LEVEL)
 irq_lock(level_handler)

>
> > > +               break;
> > > +       case IRQ_TYPE_LEVEL_HIGH:

> > > +               handler   = handle_level_irq;
> > > +               break;
> > > +       case IRQ_TYPE_LEVEL_LOW:

> > > +               handler   = handle_level_irq;
> >
> > Ditto.
> >
> > > +               break;

...

> > > +       clk = devm_clk_get(dev, NULL);
> > > +       if (IS_ERR(clk)) {
> >
> > > +               ret = PTR_ERR(clk);
> >
> > Inline into below.
> >
> > > +               return dev_err_probe(dev, ret, "could not get clock: %d\n", ret);
> > > +       }
> >
> > Ditto for all other similar cases.
>
> So you would rather want this?
>   return dev_err_probe(dev, PTR_ERR(clk), "could not get clock: %d\n",
> PTR_ERR(clk));
> or just not tell why getting the clock failed?

Of course not, no dup of the printing error code is needed. I guess I
mentioned it in another patch.

return dev_err_probe(dev, PTR_ERR($error), "$msg\n");

...

> > > +       if (!device_property_read_u32(dev, "starfive,signal-group", &value)) {
> >
> > Since you are using of_property_* elsewhere, makes sense to use same
> > here, or otherwise, use device_*() APIs there.
>
> Wait, so now you want of_property_read_u32(dev->of_node, ...) here
> again, is that right?

Before I missed that there are other of_property_read*() calls, now
since you used them elsewhere it makes sense to be consistent over the
code.

-- 
With Best Regards,
Andy Shevchenko
