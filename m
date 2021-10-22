Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97EC437803
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 15:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbhJVNfQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 09:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhJVNfQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 09:35:16 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5D1C061766;
        Fri, 22 Oct 2021 06:32:58 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id y12so1195697eda.4;
        Fri, 22 Oct 2021 06:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EBsLI/faLA0zw49px/yYwmlwDnDZ4uqZUJO+RDaz1A4=;
        b=RJiaRQHTNdx9xJCcOJTwXVz/wAu9/LU658C0G2n4KMxQour2tBFZMhiMtYnaqGJSyV
         dFDb+zKVE1Pyf2rWqNECbFywvgUUly6C7fnEQ9f9QF17XRz7UIL3bBtPUh16ZriiJ7TX
         hSyCX9pSmgZukuG7deAt8Zir91L1q3P2YAYQppCqhVeCmQPrJEKpY34TX4Owl5qzIvr9
         yKbKvm/DxnwYzPfmxwAtyoUJ7S4aZhMQu2ski+ykKPdBqPAfWt0t9239lPcriZ5ee/91
         blmJ78/OlhRTh+yePfnK0kPmoeR0addSaM0FnJ508hOwkKv5R3qOdHZSW+oTog8LW0pd
         DzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EBsLI/faLA0zw49px/yYwmlwDnDZ4uqZUJO+RDaz1A4=;
        b=UhaHPqQa++1XDvm9BTq5ThFsdVMSBmjmTrp8ntxaRwCm2LRegqwws+yItzs6ZJhmUj
         /v3d7i8ls9lzhXugpHoQk1tsfmxygN9sBSBt6DEf2ZE3xmpHkO7uKL2pHt7tLSugzVm1
         tDrgAC9OEv1JLxE31k0sRF+gV2OCGywR5sHIpJoL0h1OpPrw7yCEUMOS5MbQNWasXdNO
         Lhdil0PhF3+hmQno3ECyTNWkxVUBRAXXRTyjZbvzdYMOvNNODwQ/650LPNESVBULNdyg
         Q3ZzGfA+qtSWdELE6PhX8HEbCvm5oQIjiqOKCOn4o3T2qXcyIPD3cIiU0xPHw8IjmiQC
         ekOg==
X-Gm-Message-State: AOAM532E2mNWyip2ODvX6sjZzWO63Yg49n/Y+x7DHUPO9uPtLxnBhYAw
        /tfuxLUSeRbxZxI5JmzXQ1zN8Dg7+ZZsQMxMZrk=
X-Google-Smtp-Source: ABdhPJycSC5CaffjTYi/vnFOFMYpknlYdImAcoI5AuRpRXLUtJ/Ft+aip5yyxgDXPX+pdCuXCWfp6ozey0ICMvRMgi0=
X-Received: by 2002:a05:6402:2031:: with SMTP id ay17mr51080edb.240.1634909576879;
 Fri, 22 Oct 2021 06:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-13-kernel@esmil.dk>
In-Reply-To: <20211021174223.43310-13-kernel@esmil.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Oct 2021 16:31:59 +0300
Message-ID: <CAHp75Vf3yNoKxguHP3EPcRV_3tG++Fd=FVM0MXqW4_SmLA6HEw@mail.gmail.com>
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

On Thu, Oct 21, 2021 at 8:44 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> Add a combined pinctrl and GPIO driver for the StarFive JH7100 SoC.
>
> For each "GPIO" there are two registers for configuring the output and
> output enable signals which may come from other peripherals. Among these
> are two special signals that are constant 0 and constant 1 respectively.
> Controlling the GPIOs from software is done by choosing one of these
> signals. In other words the same registers are used for both pinmuxing

pin muxing

> and controlling the GPIOs, which makes it easier to combine the pinctrl
> and GPIO driver in one.
>
> I wrote the pinconf and pinmux parts, but the GPIO part of the code is
> based on the GPIO driver in the vendor tree written by Huan Feng with
> cleanups and fixes by Drew and me.

...

> +#define PAD_BIAS_MASK                  (PAD_BIAS_STRONG_PULL_UP | \
> +                                        PAD_BIAS_DISABLE | \
> +                                        PAD_BIAS_PULL_DOWN)

It's slightly better looking if the value is begins on the next line

#define PAD_BIAS_MASK    \
        (PAD_BIAS_STRONG_PULL_UP | \
         PAD_BIAS_DISABLE | \
         PAD_BIAS_PULL_DOWN)

...

> +       seq_printf(s, "dout=%u%s doen=%u%s",
> +                  dout & (u32)GENMASK(7, 0), (dout & BIT(31)) ? "r" : "",
> +                  doen & (u32)GENMASK(7, 0), (doen & BIT(31)) ? "r" : "");

Why castings?

...

> +       for_each_child_of_node(np, child) {
> +               int npinmux = of_property_count_u32_elems(child, "pinmux");
> +               int npins   = of_property_count_u32_elems(child, "pins");
> +
> +               if (npinmux > 0 && npins > 0) {

> +                       dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: %s\n",
> +                               np, child, "both pinmux and pins set");

Why %s for string literal?! It's quite unusual. Ditto for other similar cases.

> +                       of_node_put(child);
> +                       return -EINVAL;
> +               }

...

> +               } else {
> +                       dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: %s\n",
> +                               np, child, "neither pinmux nor pins set");
> +                       of_node_put(child);
> +                       return -EINVAL;
> +               }

This can be checjed above with other sanity check(s), right?

> +               ngroups += 1;
> +       }

...

> +       ret = -ENOMEM;

It should be below...

> +       pgnames = devm_kcalloc(dev, ngroups, sizeof(*pgnames), GFP_KERNEL);
> +       if (!pgnames)
> +               return ret;

...like here, where it makes more sense.

> +       map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
> +       if (!map)
> +               goto free_pgnames;

...

> +       for_each_child_of_node(np, child) {
> +               int npins;
> +               int i;
> +
> +               ret = -ENOMEM;
> +               grpname = devm_kasprintf(dev, GFP_KERNEL, "%s.%s", np->name, child->name);
> +               if (!grpname)
> +                       goto put_child;
> +
> +               pgnames[ngroups++] = grpname;
> +
> +               if ((npins = of_property_count_u32_elems(child, "pinmux")) > 0) {
> +                       pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> +                       if (!pins)
> +                               goto free_grpname;
> +
> +                       pinmux = devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
> +                       if (!pinmux)
> +                               goto free_pins;
> +
> +                       for (i = 0; i < npins; i++) {
> +                               u32 v;
> +
> +                               ret = of_property_read_u32_index(child, "pinmux", i, &v);
> +                               if (ret)
> +                                       goto free_pinmux;
> +                               pins[i] = starfive_gpio_to_pin(sfp, starfive_pinmux_to_gpio(v));
> +                               pinmux[i] = v;
> +                       }

Why you can't use of_property_read_u32_array() APIs?

> +                       map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
> +                       map[nmaps].data.mux.function = np->name;
> +                       map[nmaps].data.mux.group = grpname;
> +                       nmaps += 1;
> +               } else if ((npins = of_property_count_u32_elems(child, "pins")) > 0) {
> +                       pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> +                       if (!pins)
> +                               goto free_grpname;
> +
> +                       pinmux = NULL;
> +
> +                       for (i = 0; i < npins; i++) {
> +                               u32 v;
> +
> +                               ret = of_property_read_u32_index(child, "pins", i, &v);
> +                               if (ret)
> +                                       goto free_pins;
> +                               pins[i] = v;
> +                       }

NIH _array() APIs.

> +               } else {
> +                       ret = -EINVAL;
> +                       goto free_grpname;
> +               }
> +
> +               ret = pinctrl_generic_add_group(pctldev, grpname, pins, npins, pinmux);
> +               if (ret < 0) {
> +                       dev_err(dev, "error adding group %pOFn.%pOFn: %d\n",
> +                               np, child, ret);
> +                       goto free_pinmux;
> +               }
> +
> +               ret = pinconf_generic_parse_dt_config(child, pctldev,
> +                                                     &map[nmaps].data.configs.configs,
> +                                                     &map[nmaps].data.configs.num_configs);
> +               if (ret) {
> +                       dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: %s\n",
> +                               np, child, "error parsing pin config");
> +                       goto put_child;
> +               }
> +
> +               /* don't create a map if there are no pinconf settings */
> +               if (map[nmaps].data.configs.num_configs == 0)
> +                       continue;
> +
> +               map[nmaps].type = PIN_MAP_TYPE_CONFIGS_GROUP;
> +               map[nmaps].data.configs.group_or_pin = grpname;
> +               nmaps += 1;
> +       }

...

> +free_pinmux:
> +       devm_kfree(dev, pinmux);
> +free_pins:
> +       devm_kfree(dev, pins);
> +free_grpname:
> +       devm_kfree(dev, grpname);

> +free_pgnames:
> +       devm_kfree(dev, pgnames);

Just no, please get rid of them either way as I explained in previous reviews.

...

> +               raw_spin_lock_irqsave(&sfp->lock, flags);
> +               writel_relaxed(dout, reg_dout);
> +               writel_relaxed(doen, reg_doen);
> +               if (reg_din)
> +                       writel_relaxed(gpio + 2, reg_din);

Why 0 can't be written?

> +               raw_spin_unlock_irqrestore(&sfp->lock, flags);

...

> +       dev_dbg(starfive_dev(sfp),
> +               "padctl_rmw(%u, 0x%03x, 0x%03x)\n", pin, _mask, _value);

One line?

...

> +       mask = 0;
> +       value = 0;
> +       for (i = 0; i < num_configs; i++) {
> +               int param = pinconf_to_config_param(configs[i]);
> +               u32 arg = pinconf_to_config_argument(configs[i]);
>
+
> +               switch (param) {
> +               case PIN_CONFIG_BIAS_DISABLE:
> +                       mask |= PAD_BIAS_MASK;
> +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;

Okay, I have got why you are masking on each iteration, but here is
the question, shouldn't you apply the cnages belonged to each of the
group of options as it's requested by the user? Here you basically
ignore all previous changes to bias.

I would expect that you have something like

for () {
  switch (type) {
  case BIAS*:
    return apply_bias();
  ...other types...
  default:
    return err;
  }
}

> +                       break;
> +               case PIN_CONFIG_BIAS_PULL_DOWN:
> +                       if (arg == 0)
> +                               return -ENOTSUPP;
> +                       mask |= PAD_BIAS_MASK;
> +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_PULL_DOWN;
> +                       break;
> +               case PIN_CONFIG_BIAS_PULL_UP:
> +                       if (arg == 0)
> +                               return -ENOTSUPP;
> +                       mask |= PAD_BIAS_MASK;
> +                       value = value & ~PAD_BIAS_MASK;
> +                       break;
> +               case PIN_CONFIG_DRIVE_STRENGTH:
> +                       mask |= PAD_DRIVE_STRENGTH_MASK;
> +                       value = (value & ~PAD_DRIVE_STRENGTH_MASK) |
> +                               starfive_drive_strength_from_max_mA(arg);
> +                       break;
> +               case PIN_CONFIG_INPUT_ENABLE:
> +                       mask |= PAD_INPUT_ENABLE;
> +                       if (arg)
> +                               value |= PAD_INPUT_ENABLE;
> +                       else
> +                               value &= ~PAD_INPUT_ENABLE;
> +                       break;
> +               case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +                       mask |= PAD_INPUT_SCHMITT_ENABLE;
> +                       if (arg)
> +                               value |= PAD_INPUT_SCHMITT_ENABLE;
> +                       else
> +                               value &= ~PAD_INPUT_SCHMITT_ENABLE;
> +                       break;
> +               case PIN_CONFIG_SLEW_RATE:
> +                       mask |= PAD_SLEW_RATE_MASK;
> +                       value = (value & ~PAD_SLEW_RATE_MASK) |
> +                               ((arg << PAD_SLEW_RATE_POS) & PAD_SLEW_RATE_MASK);
> +                       break;
> +               case PIN_CONFIG_STARFIVE_STRONG_PULL_UP:
> +                       if (arg) {
> +                               mask |= PAD_BIAS_MASK;
> +                               value = (value & ~PAD_BIAS_MASK) |
> +                                       PAD_BIAS_STRONG_PULL_UP;
> +                       } else {
> +                               mask |= PAD_BIAS_STRONG_PULL_UP;
> +                               value = value & ~PAD_BIAS_STRONG_PULL_UP;
> +                       }
> +                       break;
> +               default:
> +                       return -ENOTSUPP;
> +               }
> +       }

...

> +static int starfive_gpio_request(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       return pinctrl_gpio_request(gc->base + gpio);
> +}
> +
> +static void starfive_gpio_free(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       pinctrl_gpio_free(gc->base + gpio);
> +}

Point of having these function is...?

...

> +       if (gpio >= NR_GPIOS)
> +               return -EINVAL;

Dead code?

...

> +       if (gpio >= NR_GPIOS)
> +               return -EINVAL;

Dead code?

...

> +       /* enable input and schmitt trigger */

Use capitalization consistently.

...

> +       if (gpio >= NR_GPIOS)
> +               return -EINVAL;

Dead code?

...

> +       if (gpio >= NR_GPIOS)
> +               return -EINVAL;

Dead code?

...

> +       if (gpio >= NR_GPIOS)
> +               return;

Dead code?

...

> +       struct starfive_pinctrl *sfp = starfive_from_gc(gc);

The starfive_from_gc() is useless. Inline it whenever you use it.

...

> +       case IRQ_TYPE_EDGE_RISING:
> +               irq_type  = mask; /* 1: edge triggered */
> +               edge_both = 0;    /* 0: single edge */
> +               polarity  = mask; /* 1: rising edge */
> +               handler   = handle_edge_irq;
> +               break;
> +       case IRQ_TYPE_EDGE_FALLING:
> +               irq_type  = mask; /* 1: edge triggered */
> +               edge_both = 0;    /* 0: single edge */
> +               polarity  = 0;    /* 0: falling edge */
> +               handler   = handle_edge_irq
> +               break;
> +       case IRQ_TYPE_EDGE_BOTH:
> +               irq_type  = mask; /* 1: edge triggered */
> +               edge_both = mask; /* 1: both edges */
> +               polarity  = 0;    /* 0: ignored */
> +               handler   = handle_edge_irq;

Dup. You may do it once without any temporary variable.
I haven't got why you haven't addressed this.

> +               break;
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               irq_type  = 0;    /* 0: level triggered */
> +               edge_both = 0;    /* 0: ignored */
> +               polarity  = mask; /* 1: high level */
> +               handler   = handle_level_irq;
> +               break;
> +       case IRQ_TYPE_LEVEL_LOW:
> +               irq_type  = 0;    /* 0: level triggered */
> +               edge_both = 0;    /* 0: ignored */
> +               polarity  = 0;    /* 0: low level */
> +               handler   = handle_level_irq;

Ditto.

> +               break;

...

> +       clk = devm_clk_get(dev, NULL);
> +       if (IS_ERR(clk)) {

> +               ret = PTR_ERR(clk);

Inline into below.

> +               return dev_err_probe(dev, ret, "could not get clock: %d\n", ret);
> +       }

Ditto for all other similar cases.

...

> +       ret = clk_prepare_enable(clk);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "could not enable clock: %d\n", ret);

Double ret?!Ditto for all other similar cases.

...

> +       if (!device_property_read_u32(dev, "starfive,signal-group", &value)) {

Since you are using of_property_* elsewhere, makes sense to use same
here, or otherwise, use device_*() APIs there.

...

> +done:

Perhaps you may factor out the function and get rid of this label.

-- 
With Best Regards,
Andy Shevchenko
