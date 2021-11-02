Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D66DE4436EC
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 21:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbhKBUFd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 16:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhKBUFc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 16:05:32 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B5EC061714;
        Tue,  2 Nov 2021 13:02:57 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id f8so1562677edy.4;
        Tue, 02 Nov 2021 13:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4JOy2KvbxYD38ikOI7qR7VbaAXGVgm1esl1DyzO8Sgw=;
        b=me7FKbRZkHm/ayWnwtwMa9g+TjLkhOHnSSKF9P4tRJDRWaW8OUULBmN+f63QGZq+Wt
         5S+eYM+dHCO+26Ubq0qqu4plmHLG8EnlHcDUBBeayViJrXbezbRhibbh34Y988KKXO1r
         wJAqLsn3XOoY4YtdWb3zzYmOAYIvcPiI+JSPJ2VUm3BPgPGpdjSSkvyRgfCCiHreaSqy
         +7iEltj2CcEdYX53vp84HqSEz/sKpX/3qsPkoLLnIcjrHEUDtzgImwePytRVTaW3hNSf
         i7oX54Rxyr3m+OdhJlmVDnoWTpktUwSpHQ6rG0JlNc53VH7+YhD0xHaRFmfwVVkIdVwH
         SEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4JOy2KvbxYD38ikOI7qR7VbaAXGVgm1esl1DyzO8Sgw=;
        b=BsS3XkTZYV3j85sYA91BPF7zEv9ai/0Jc8k61gYsFd0Yjw0x5mrXifbmtUzigL0zG5
         VTZ7t+ViZLOQT7DN4fqtObFjkXFmT32DK54tJULCnklHPZto0lFQ33NRNX0dMURWZUno
         fR51chbLmjMQ3Pzeyu65ygtEKrShxLhCsWyLely+XbyShSMaQk7y8UO3QIqSwHpVDvtw
         /U4uDS6+U9DRrzNUVZ7LQC27YBr1Y/ZSKQl61HfLnmpAFDh4FF5TWcpgRkTVkTh2i3Qi
         Z71uDLMtSfgBmZ15zVJr6zFZLG7ij5wLje8Q0ofd3iTkVBw281qBr09bXDXfiFo+hdiU
         dvmQ==
X-Gm-Message-State: AOAM533N7W2hgEvpCXjb0aLLM0ZGCuliUKORkNcKEZuyEJKTV6NqVjYn
        jFSPmY0ryStUv/BUStgoHIlZ4Nez1GP3hmf9xuk=
X-Google-Smtp-Source: ABdhPJwjbJymvrQg7/GMcQpyR3RkMc82Ibyg7WIrLLSEblkmtRuOLYWOWUg151dY2z0V1Aq556PvbGa+JP+7P4ITGyM=
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr48108442ejc.69.1635883375499;
 Tue, 02 Nov 2021 13:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-13-kernel@esmil.dk>
In-Reply-To: <20211102161125.1144023-13-kernel@esmil.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Nov 2021 22:02:06 +0200
Message-ID: <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
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

On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> Add a combined pinctrl and GPIO driver for the JH7100 RISC-V SoC by
> StarFive Ltd. This is a test chip for their upcoming JH7110 SoC, which
> is said to feature only minor changes to these pinctrl/GPIO parts.
>
> For each "GPIO" there are two registers for configuring the output and
> output enable signals which may come from other peripherals. Among these
> are two special signals that are constant 0 and constant 1 respectively.
> Controlling the GPIOs from software is done by choosing one of these
> signals. In other words the same registers are used for both pin muxing
> and controlling the GPIOs, which makes it easier to combine the pinctrl
> and GPIO driver in one.
>
> I wrote the pinconf and pinmux parts, but the GPIO part of the code is
> based on the GPIO driver in the vendor tree written by Huan Feng with
> cleanups and fixes by Drew and me.

...

> +       depends on OF

So this descreases test coverage.
Linus, can we provide a necessary stub so we may drop this dependency?

...

> +static inline struct device *starfive_dev(const struct starfive_pinctrl *sfp)
> +{
> +       return sfp->gc.parent;
> +}
> +

This seems useless helper. You may do what it's doing just in place.
It will save 5 LOCs.

...

> +static void starfive_pin_dbg_show(struct pinctrl_dev *pctldev,
> +                                 struct seq_file *s,
> +                                 unsigned int pin)
> +{
> +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> +       unsigned int gpio = starfive_pin_to_gpio(sfp, pin);
> +       void __iomem *reg;
> +       u32 dout, doen;

> +       if (gpio >= NR_GPIOS)
> +               return;

Dead code?

> +       reg = sfp->base + GPON_DOUT_CFG + 8 * gpio;
> +       dout = readl_relaxed(reg + 0x000);
> +       doen = readl_relaxed(reg + 0x004);
> +
> +       seq_printf(s, "dout=%lu%s doen=%lu%s",
> +                  dout & GENMASK(7, 0), (dout & BIT(31)) ? "r" : "",
> +                  doen & GENMASK(7, 0), (doen & BIT(31)) ? "r" : "");
> +}

...

> +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> +       struct device *dev = starfive_dev(sfp);
> +       const char **pgnames;
> +       struct pinctrl_map *map;
> +       struct device_node *child;
> +       const char *grpname;
> +       int *pins;
> +       u32 *pinmux;

Reversed xmas tree order?

> +       int nmaps;
> +       int ngroups;
> +       int ret;

...

> +static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
> +                                     unsigned int gsel,
> +                                     unsigned long *configs,
> +                                     unsigned int num_configs)
> +{
> +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> +       const struct group_desc *group;
> +       u16 mask, value;
> +       int i;
> +
> +       group = pinctrl_generic_get_group(pctldev, gsel);
> +       if (!group)
> +               return -EINVAL;
> +
> +       mask = 0;
> +       value = 0;
> +       for (i = 0; i < num_configs; i++) {
> +               int param = pinconf_to_config_param(configs[i]);
> +               u32 arg = pinconf_to_config_argument(configs[i]);
> +
> +               switch (param) {
> +               case PIN_CONFIG_BIAS_DISABLE:
> +                       mask |= PAD_BIAS_MASK;
> +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
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
> +
> +       for (i = 0; i < group->num_pins; i++)
> +               starfive_padctl_rmw(sfp, group->pins[i], mask, value);
> +
> +       return 0;
> +}

...

> +static int starfive_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       struct starfive_pinctrl *sfp = container_of(gc, struct starfive_pinctrl, gc);
> +       void __iomem *doen = sfp->base + GPON_DOEN_CFG + 8 * gpio;
> +
> +       /* return GPIO_LINE_DIRECTION_OUT (0) only if doen == GPO_ENABLE (0) */
> +       return readl_relaxed(doen) != GPO_ENABLE;

I believe the idea was to return the predefined values for the direction.

> +}

...

> +static int starfive_irq_set_type(struct irq_data *d, unsigned int trigger)
> +{
> +       struct starfive_pinctrl *sfp = starfive_from_irq_data(d);
> +       irq_hw_number_t gpio = irqd_to_hwirq(d);
> +       void __iomem *base = sfp->base + 4 * (gpio / 32);
> +       u32 mask = BIT(gpio % 32);
> +       u32 irq_type, edge_both, polarity;
> +       unsigned long flags;
> +
> +       if (trigger & IRQ_TYPE_EDGE_BOTH)
> +               irq_set_handler_locked(d, handle_edge_irq);
> +       else if (trigger & IRQ_TYPE_LEVEL_MASK)
> +               irq_set_handler_locked(d, handle_level_irq);

Usually we don't assign this twice, so it should be after the switch.

> +       switch (trigger) {
> +       case IRQ_TYPE_EDGE_RISING:
> +               irq_type  = mask; /* 1: edge triggered */
> +               edge_both = 0;    /* 0: single edge */
> +               polarity  = mask; /* 1: rising edge */
> +               break;
> +       case IRQ_TYPE_EDGE_FALLING:
> +               irq_type  = mask; /* 1: edge triggered */
> +               edge_both = 0;    /* 0: single edge */
> +               polarity  = 0;    /* 0: falling edge */
> +               break;
> +       case IRQ_TYPE_EDGE_BOTH:
> +               irq_type  = mask; /* 1: edge triggered */
> +               edge_both = mask; /* 1: both edges */
> +               polarity  = 0;    /* 0: ignored */
> +               break;
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               irq_type  = 0;    /* 0: level triggered */
> +               edge_both = 0;    /* 0: ignored */
> +               polarity  = mask; /* 1: high level */
> +               break;
> +       case IRQ_TYPE_LEVEL_LOW:
> +               irq_type  = 0;    /* 0: level triggered */
> +               edge_both = 0;    /* 0: ignored */
> +               polarity  = 0;    /* 0: low level */
> +               break;
> +       default:

> +               irq_set_handler_locked(d, handle_bad_irq);

Why? You have it already in ->probe(), what's the point?

> +               return -EINVAL;
> +       }
> +
> +       raw_spin_lock_irqsave(&sfp->lock, flags);
> +       irq_type |= readl_relaxed(base + GPIOIS) & ~mask;
> +       writel_relaxed(irq_type, base + GPIOIS);
> +       edge_both |= readl_relaxed(base + GPIOIBE) & ~mask;
> +       writel_relaxed(edge_both, base + GPIOIBE);
> +       polarity |= readl_relaxed(base + GPIOIEV) & ~mask;
> +       writel_relaxed(polarity, base + GPIOIEV);
> +       raw_spin_unlock_irqrestore(&sfp->lock, flags);
> +       return 0;
> +}

...

> +       ret = reset_control_deassert(rst);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "could not deassert resetd\n");

> +       ret = devm_pinctrl_register_and_init(dev, &starfive_desc, sfp, &sfp->pctl);
> +       if (ret)

I don't see who will assert reset here.

> +               return dev_err_probe(dev, ret, "could not register pinctrl driver\n");

...

> +       switch (value) {
> +       case 0:
> +               sfp->gpios.pin_base = PAD_INVALID_GPIO;
> +               goto done;
> +       case 1:
> +               sfp->gpios.pin_base = PAD_GPIO(0);
> +               break;
> +       case 2:
> +               sfp->gpios.pin_base = PAD_FUNC_SHARE(72);
> +               break;
> +       case 3:
> +               sfp->gpios.pin_base = PAD_FUNC_SHARE(70);
> +               break;
> +       case 4: case 5: case 6:
> +               sfp->gpios.pin_base = PAD_FUNC_SHARE(0);
> +               break;
> +       default:

Ditto.

> +               return dev_err_probe(dev, -EINVAL, "invalid signal group %u\n", value);
> +       }

...

> +       ret = devm_gpiochip_add_data(dev, &sfp->gc, sfp);
> +       if (ret)

Ditto.

> +               return dev_err_probe(dev, ret, "could not register gpiochip\n");
> +
> +done:
> +       return pinctrl_enable(sfp->pctl);

Ditto.

And better to use label name like following
out_pinctrl_enable:

-- 
With Best Regards,
Andy Shevchenko
