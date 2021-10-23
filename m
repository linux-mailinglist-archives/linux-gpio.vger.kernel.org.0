Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16FC54384C6
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Oct 2021 20:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhJWSsa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Oct 2021 14:48:30 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177]:37728 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhJWSs3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Oct 2021 14:48:29 -0400
Received: by mail-pf1-f177.google.com with SMTP id q19so6660889pfl.4;
        Sat, 23 Oct 2021 11:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aEAs776K6p8lZTPzkmuLZOOmJgVbRulxd0di0mx4cQo=;
        b=mnQ2vF/XFd2cx8SWyX6XgvPYUOeltIULyayh81rdDFR94qjc55wsN9EM4QHscEGDLv
         yU4OrA4Pu2UaRthSjdIJsxFDyYqPOQEKKYIaK/wk7qffddl0svI/imk5qjEX2ibG1cti
         BPrDieiJ99EoYxMEhCT6ge2alpthnckOJ8wykXvWsoXP/ZmfZejSxWzoryUJPZuZvQjI
         xvslDNy7fSgXI8DlICLPfwrpjnWj/6J1LB6sps6+0+83u+bpGHZD5vP9frzyUAe+AGHq
         Pbo+EUjnbeTp2nF6a37WXCJnpdHRDY0rNEhsdx8f2gMJbMycjUGfHfPH72XJWh6JhGa1
         qjSg==
X-Gm-Message-State: AOAM533TOELz3qZ+SoKqmYh8FvS67kWhy6sUkWUi3FZhkNi8SAzlnT0M
        rmW38fmaiSbKEdnJFz1ZJT6aQYdMu5iJ3azZ1ps=
X-Google-Smtp-Source: ABdhPJwUUFlKXvpsn91+TjHUhvKesdVA98hRAzasAzXJWFUk833ncJyUVkE0wix0yH6ytJf6E1aavF8F7rHyHiD+TzA=
X-Received: by 2002:a05:6a00:1707:b0:44d:47e1:9ffe with SMTP id
 h7-20020a056a00170700b0044d47e19ffemr7898940pfc.53.1635014770164; Sat, 23 Oct
 2021 11:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-13-kernel@esmil.dk>
 <CAHp75Vf3yNoKxguHP3EPcRV_3tG++Fd=FVM0MXqW4_SmLA6HEw@mail.gmail.com>
In-Reply-To: <CAHp75Vf3yNoKxguHP3EPcRV_3tG++Fd=FVM0MXqW4_SmLA6HEw@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Sat, 23 Oct 2021 20:45:58 +0200
Message-ID: <CANBLGcxEwkcZn2CC69zLaVqL8ocS6r6HDaaoUF09gg1mpDxFzg@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Fri, 22 Oct 2021 at 15:32, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Thu, Oct 21, 2021 at 8:44 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > +       for_each_child_of_node(np, child) {
> > +               int npins;
> > +               int i;
> > +
> > +               ret = -ENOMEM;
> > +               grpname = devm_kasprintf(dev, GFP_KERNEL, "%s.%s", np->name, child->name);
> > +               if (!grpname)
> > +                       goto put_child;
> > +
> > +               pgnames[ngroups++] = grpname;
> > +
> > +               if ((npins = of_property_count_u32_elems(child, "pinmux")) > 0) {
> > +                       pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> > +                       if (!pins)
> > +                               goto free_grpname;
> > +
> > +                       pinmux = devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
> > +                       if (!pinmux)
> > +                               goto free_pins;
> > +
> > +                       for (i = 0; i < npins; i++) {
> > +                               u32 v;
> > +
> > +                               ret = of_property_read_u32_index(child, "pinmux", i, &v);
> > +                               if (ret)
> > +                                       goto free_pinmux;
> > +                               pins[i] = starfive_gpio_to_pin(sfp, starfive_pinmux_to_gpio(v));
> > +                               pinmux[i] = v;
> > +                       }
>
> Why you can't use of_property_read_u32_array() APIs?

I can here, but..

> > +                       map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
> > +                       map[nmaps].data.mux.function = np->name;
> > +                       map[nmaps].data.mux.group = grpname;
> > +                       nmaps += 1;
> > +               } else if ((npins = of_property_count_u32_elems(child, "pins")) > 0) {
> > +                       pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> > +                       if (!pins)
> > +                               goto free_grpname;
> > +
> > +                       pinmux = NULL;
> > +
> > +                       for (i = 0; i < npins; i++) {
> > +                               u32 v;
> > +
> > +                               ret = of_property_read_u32_index(child, "pins", i, &v);
> > +                               if (ret)
> > +                                       goto free_pins;
> > +                               pins[i] = v;
> > +                       }
>
> NIH _array() APIs.

.. here the pins array is an int array and not u32 array. I can cast
it and and hope Linux will never run on a machine where sizeof(int) !=
4 if you think that's better?

> > +               } else {
> > +                       ret = -EINVAL;
> > +                       goto free_grpname;
> > +               }
> > +
> > +               ret = pinctrl_generic_add_group(pctldev, grpname, pins, npins, pinmux);
> > +               if (ret < 0) {
> > +                       dev_err(dev, "error adding group %pOFn.%pOFn: %d\n",
> > +                               np, child, ret);
> > +                       goto free_pinmux;
> > +               }
> > +
> > +               ret = pinconf_generic_parse_dt_config(child, pctldev,
> > +                                                     &map[nmaps].data.configs.configs,
> > +                                                     &map[nmaps].data.configs.num_configs);
> > +               if (ret) {
> > +                       dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: %s\n",
> > +                               np, child, "error parsing pin config");
> > +                       goto put_child;
> > +               }
> > +
> > +               /* don't create a map if there are no pinconf settings */
> > +               if (map[nmaps].data.configs.num_configs == 0)
> > +                       continue;
> > +
> > +               map[nmaps].type = PIN_MAP_TYPE_CONFIGS_GROUP;
> > +               map[nmaps].data.configs.group_or_pin = grpname;
> > +               nmaps += 1;
> > +       }
>
> ...
>
> > +free_pinmux:
> > +       devm_kfree(dev, pinmux);
> > +free_pins:
> > +       devm_kfree(dev, pins);
> > +free_grpname:
> > +       devm_kfree(dev, grpname);
>
> > +free_pgnames:
> > +       devm_kfree(dev, pgnames);
>
> Just no, please get rid of them either way as I explained in previous reviews.

So I asked you if you thought it was better to leave these unused
allocations when parsing the device tree node fails but you never
answered that. I didn't want put words in your mouth so I could only
assume you didn't. I'd really like a straight answer to that so I have
something to refer to when people ask why this driver doesn't do the
same as fx. the pinctrl-single. So just to be clear: do you think it's
better to leave this unused garbage allocated if parsing the device
tree node fails?

> > +               raw_spin_lock_irqsave(&sfp->lock, flags);
> > +               writel_relaxed(dout, reg_dout);
> > +               writel_relaxed(doen, reg_doen);
> > +               if (reg_din)
> > +                       writel_relaxed(gpio + 2, reg_din);
>
> Why 0 can't be written?

Because signal 0 is a special "always 0" signal and signal 1 is a
special "always 1" signal, and after that signal n is the input value
of GPIO n - 2. We don't want to overwrite the PoR defaults.

> > +       mask = 0;
> > +       value = 0;
> > +       for (i = 0; i < num_configs; i++) {
> > +               int param = pinconf_to_config_param(configs[i]);
> > +               u32 arg = pinconf_to_config_argument(configs[i]);
> >
> +
> > +               switch (param) {
> > +               case PIN_CONFIG_BIAS_DISABLE:
> > +                       mask |= PAD_BIAS_MASK;
> > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
>
> Okay, I have got why you are masking on each iteration, but here is
> the question, shouldn't you apply the cnages belonged to each of the
> group of options as it's requested by the user? Here you basically
> ignore all previous changes to bias.
>
> I would expect that you have something like
>
> for () {
>   switch (type) {
>   case BIAS*:
>     return apply_bias();
>   ...other types...
>   default:
>     return err;
>   }
> }

I such cases where you get conflicting PIN_CONFIG_BIAS_* settings I
don't see why it's better to do the rmw on the padctl register for the
first bias setting only to then change the bits again a few
microseconds later when the loop encounters the second bias setting.
After the loop is done the end result would still be just the last
bias setting.

> > +                       break;
> > +               case PIN_CONFIG_BIAS_PULL_DOWN:
> > +                       if (arg == 0)
> > +                               return -ENOTSUPP;
> > +                       mask |= PAD_BIAS_MASK;
> > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_PULL_DOWN;
> > +                       break;
> > +               case PIN_CONFIG_BIAS_PULL_UP:
> > +                       if (arg == 0)
> > +                               return -ENOTSUPP;
> > +                       mask |= PAD_BIAS_MASK;
> > +                       value = value & ~PAD_BIAS_MASK;
> > +                       break;
> > +               case PIN_CONFIG_DRIVE_STRENGTH:
> > +                       mask |= PAD_DRIVE_STRENGTH_MASK;
> > +                       value = (value & ~PAD_DRIVE_STRENGTH_MASK) |
> > +                               starfive_drive_strength_from_max_mA(arg);
> > +                       break;
> > +               case PIN_CONFIG_INPUT_ENABLE:
> > +                       mask |= PAD_INPUT_ENABLE;
> > +                       if (arg)
> > +                               value |= PAD_INPUT_ENABLE;
> > +                       else
> > +                               value &= ~PAD_INPUT_ENABLE;
> > +                       break;
> > +               case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> > +                       mask |= PAD_INPUT_SCHMITT_ENABLE;
> > +                       if (arg)
> > +                               value |= PAD_INPUT_SCHMITT_ENABLE;
> > +                       else
> > +                               value &= ~PAD_INPUT_SCHMITT_ENABLE;
> > +                       break;
> > +               case PIN_CONFIG_SLEW_RATE:
> > +                       mask |= PAD_SLEW_RATE_MASK;
> > +                       value = (value & ~PAD_SLEW_RATE_MASK) |
> > +                               ((arg << PAD_SLEW_RATE_POS) & PAD_SLEW_RATE_MASK);
> > +                       break;
> > +               case PIN_CONFIG_STARFIVE_STRONG_PULL_UP:
> > +                       if (arg) {
> > +                               mask |= PAD_BIAS_MASK;
> > +                               value = (value & ~PAD_BIAS_MASK) |
> > +                                       PAD_BIAS_STRONG_PULL_UP;
> > +                       } else {
> > +                               mask |= PAD_BIAS_STRONG_PULL_UP;
> > +                               value = value & ~PAD_BIAS_STRONG_PULL_UP;
> > +                       }
> > +                       break;
> > +               default:
> > +                       return -ENOTSUPP;
> > +               }
> > +       }
>
> ...
>
> > +static int starfive_gpio_request(struct gpio_chip *gc, unsigned int gpio)
> > +{
> > +       return pinctrl_gpio_request(gc->base + gpio);
> > +}
> > +
> > +static void starfive_gpio_free(struct gpio_chip *gc, unsigned int gpio)
> > +{
> > +       pinctrl_gpio_free(gc->base + gpio);
> > +}
>
> Point of having these function is...?

These calls tells the pinctrl system that a certain pin is now used
for GPIO. Conversely it'll also prevent fx. userspace from doing GPIO
on a pin that's already used by I2C, a UART or some other peripheral.

> > +       /* enable input and schmitt trigger */
>
> Use capitalization consistently.

I am?

> > +       case IRQ_TYPE_EDGE_RISING:
> > +               irq_type  = mask; /* 1: edge triggered */
> > +               edge_both = 0;    /* 0: single edge */
> > +               polarity  = mask; /* 1: rising edge */
> > +               handler   = handle_edge_irq;
> > +               break;
> > +       case IRQ_TYPE_EDGE_FALLING:
> > +               irq_type  = mask; /* 1: edge triggered */
> > +               edge_both = 0;    /* 0: single edge */
> > +               polarity  = 0;    /* 0: falling edge */
> > +               handler   = handle_edge_irq
> > +               break;
> > +       case IRQ_TYPE_EDGE_BOTH:
> > +               irq_type  = mask; /* 1: edge triggered */
> > +               edge_both = mask; /* 1: both edges */
> > +               polarity  = 0;    /* 0: ignored */
> > +               handler   = handle_edge_irq;
>
> Dup. You may do it once without any temporary variable.
> I haven't got why you haven't addressed this.

So you want two switches on the trigger variable, one for irq_type,
edge_both and polarity, and one for the handler? If this is not what
you have in mind please be a lot more explicit. Trying to guess what
you mean gets really old.

> > +               break;
> > +       case IRQ_TYPE_LEVEL_HIGH:
> > +               irq_type  = 0;    /* 0: level triggered */
> > +               edge_both = 0;    /* 0: ignored */
> > +               polarity  = mask; /* 1: high level */
> > +               handler   = handle_level_irq;
> > +               break;
> > +       case IRQ_TYPE_LEVEL_LOW:
> > +               irq_type  = 0;    /* 0: level triggered */
> > +               edge_both = 0;    /* 0: ignored */
> > +               polarity  = 0;    /* 0: low level */
> > +               handler   = handle_level_irq;
>
> Ditto.
>
> > +               break;
>
> ...
>
> > +       clk = devm_clk_get(dev, NULL);
> > +       if (IS_ERR(clk)) {
>
> > +               ret = PTR_ERR(clk);
>
> Inline into below.
>
> > +               return dev_err_probe(dev, ret, "could not get clock: %d\n", ret);
> > +       }
>
> Ditto for all other similar cases.

So you would rather want this?
  return dev_err_probe(dev, PTR_ERR(clk), "could not get clock: %d\n",
PTR_ERR(clk));
or just not tell why getting the clock failed?

> > +       if (!device_property_read_u32(dev, "starfive,signal-group", &value)) {
>
> Since you are using of_property_* elsewhere, makes sense to use same
> here, or otherwise, use device_*() APIs there.

Wait, so now you want of_property_read_u32(dev->of_node, ...) here
again, is that right?

/Emil
