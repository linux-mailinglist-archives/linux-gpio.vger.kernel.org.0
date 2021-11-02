Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACE7443769
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 21:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhKBUiK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 16:38:10 -0400
Received: from mail-pl1-f181.google.com ([209.85.214.181]:39711 "EHLO
        mail-pl1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbhKBUiJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 16:38:09 -0400
Received: by mail-pl1-f181.google.com with SMTP id t21so680592plr.6;
        Tue, 02 Nov 2021 13:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+ukRUnX99GuuGwercSLJHoFG30Ze6tFA6H732ebipYw=;
        b=QHCyXIt7EzRXtJr8RfS+wg0LeQ1TQsnPPqXr5i2reF88zPmDMrDHBmXdzdtbt7WWBV
         HAzIR7rekwrG9o1lN6YdiM3m9INAfo+SXO2hpaTHNbdcnw/zDVG6OBSRnD+NPRg0cICB
         vg7ZouP5bXVNgDHmwv3kU8EXOWTsdMP9+ac+w9i8SBD5bco74Rpnm2tjNhIidB2OzSiP
         cY/bfAl9GjrwXcZYU5bKn92KBb86FlvpPffxlrku1ywfZEQNTuaDFofo/mKChkQBO40s
         Hy+WmezSDrj9jKn1iemHrCW03w31PDVzepDcByNRA6GGExCz5CMLT2QEGjCVdoblDfwX
         +A9A==
X-Gm-Message-State: AOAM530fS9UYuIlefW/8fydbJuuY4NZNxqq0LFpwE18S07Nj3A/Ag9cd
        uugzvj3HORR73QpqcccUgLHbErS74ypw/IcYysg=
X-Google-Smtp-Source: ABdhPJwcoVLt11l+ug+gF9p11omB7TPoI/gjwPD7aicE1EjLlqZEE1qV7U9Hob+ZQw1H45ZZ4/Ab1gEEMKE1bx513n0=
X-Received: by 2002:a17:90a:5b0c:: with SMTP id o12mr9748968pji.194.1635885334069;
 Tue, 02 Nov 2021 13:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
In-Reply-To: <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Tue, 2 Nov 2021 21:35:22 +0100
Message-ID: <CANBLGczn8+po09wF_uEvvU8tLCn0ahY+Gkj9JJLxOcj1LC1aLA@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
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

On Tue, 2 Nov 2021 at 21:02, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > Add a combined pinctrl and GPIO driver for the JH7100 RISC-V SoC by
> > StarFive Ltd. This is a test chip for their upcoming JH7110 SoC, which
> > is said to feature only minor changes to these pinctrl/GPIO parts.
> >
> > For each "GPIO" there are two registers for configuring the output and
> > output enable signals which may come from other peripherals. Among these
> > are two special signals that are constant 0 and constant 1 respectively.
> > Controlling the GPIOs from software is done by choosing one of these
> > signals. In other words the same registers are used for both pin muxing
> > and controlling the GPIOs, which makes it easier to combine the pinctrl
> > and GPIO driver in one.
> >
> > I wrote the pinconf and pinmux parts, but the GPIO part of the code is
> > based on the GPIO driver in the vendor tree written by Huan Feng with
> > cleanups and fixes by Drew and me.
>
> ...
>
> > +       depends on OF
>
> So this descreases test coverage.
> Linus, can we provide a necessary stub so we may drop this dependency?
>
> ...
>
> > +static inline struct device *starfive_dev(const struct starfive_pinctrl *sfp)
> > +{
> > +       return sfp->gc.parent;
> > +}
> > +
>
> This seems useless helper. You may do what it's doing just in place.
> It will save 5 LOCs.

I don't mind removing it, I just think it's easier to read when we're
explicit that all we want is a dev pointer, and we don't suddenly need
to know the parent of the gpio chip in all the pinmux/pinconf
callbacks.

> > +static void starfive_pin_dbg_show(struct pinctrl_dev *pctldev,
> > +                                 struct seq_file *s,
> > +                                 unsigned int pin)
> > +{
> > +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> > +       unsigned int gpio = starfive_pin_to_gpio(sfp, pin);
> > +       void __iomem *reg;
> > +       u32 dout, doen;
>
> > +       if (gpio >= NR_GPIOS)
> > +               return;
>
> Dead code?

No, this function is called for all 206 configurable pins, but only 64
of them are gpio pins. Which ones depend on the signal group.

> > +       reg = sfp->base + GPON_DOUT_CFG + 8 * gpio;
> > +       dout = readl_relaxed(reg + 0x000);
> > +       doen = readl_relaxed(reg + 0x004);
> > +
> > +       seq_printf(s, "dout=%lu%s doen=%lu%s",
> > +                  dout & GENMASK(7, 0), (dout & BIT(31)) ? "r" : "",
> > +                  doen & GENMASK(7, 0), (doen & BIT(31)) ? "r" : "");
> > +}
>
> ...
>
> > +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> > +       struct device *dev = starfive_dev(sfp);
> > +       const char **pgnames;
> > +       struct pinctrl_map *map;
> > +       struct device_node *child;
> > +       const char *grpname;
> > +       int *pins;
> > +       u32 *pinmux;
>
> Reversed xmas tree order?
>
> > +static int starfive_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
> > +{
> > +       struct starfive_pinctrl *sfp = container_of(gc, struct starfive_pinctrl, gc);
> > +       void __iomem *doen = sfp->base + GPON_DOEN_CFG + 8 * gpio;
> > +
> > +       /* return GPIO_LINE_DIRECTION_OUT (0) only if doen == GPO_ENABLE (0) */
> > +       return readl_relaxed(doen) != GPO_ENABLE;
>
> I believe the idea was to return the predefined values for the direction.

You mean this?
  return readl_relaxed(doen) == GPO_ENABLE ? GPIO_LINE_DIRECTION_OUT :
GPIO_LINE_DIRECTION_IN;

> > +}
>
> ...
>
> > +static int starfive_irq_set_type(struct irq_data *d, unsigned int trigger)
> > +{
> > +       struct starfive_pinctrl *sfp = starfive_from_irq_data(d);
> > +       irq_hw_number_t gpio = irqd_to_hwirq(d);
> > +       void __iomem *base = sfp->base + 4 * (gpio / 32);
> > +       u32 mask = BIT(gpio % 32);
> > +       u32 irq_type, edge_both, polarity;
> > +       unsigned long flags;
> > +
> > +       if (trigger & IRQ_TYPE_EDGE_BOTH)
> > +               irq_set_handler_locked(d, handle_edge_irq);
> > +       else if (trigger & IRQ_TYPE_LEVEL_MASK)
> > +               irq_set_handler_locked(d, handle_level_irq);
>
> Usually we don't assign this twice, so it should be after the switch.
>
> > +       switch (trigger) {
> > +       case IRQ_TYPE_EDGE_RISING:
> > +               irq_type  = mask; /* 1: edge triggered */
> > +               edge_both = 0;    /* 0: single edge */
> > +               polarity  = mask; /* 1: rising edge */
> > +               break;
> > +       case IRQ_TYPE_EDGE_FALLING:
> > +               irq_type  = mask; /* 1: edge triggered */
> > +               edge_both = 0;    /* 0: single edge */
> > +               polarity  = 0;    /* 0: falling edge */
> > +               break;
> > +       case IRQ_TYPE_EDGE_BOTH:
> > +               irq_type  = mask; /* 1: edge triggered */
> > +               edge_both = mask; /* 1: both edges */
> > +               polarity  = 0;    /* 0: ignored */
> > +               break;
> > +       case IRQ_TYPE_LEVEL_HIGH:
> > +               irq_type  = 0;    /* 0: level triggered */
> > +               edge_both = 0;    /* 0: ignored */
> > +               polarity  = mask; /* 1: high level */
> > +               break;
> > +       case IRQ_TYPE_LEVEL_LOW:
> > +               irq_type  = 0;    /* 0: level triggered */
> > +               edge_both = 0;    /* 0: ignored */
> > +               polarity  = 0;    /* 0: low level */
> > +               break;
> > +       default:
>
> > +               irq_set_handler_locked(d, handle_bad_irq);
>
> Why? You have it already in ->probe(), what's the point?

So last time you asked about this, I explained a situation where
userspace first grabs a GPIO, set the interrupt to edge triggered, and
then later loads a driver that requests an unsupported IRQ type. Then
I'd like to set the handler back to handle_bad_irq so we don't get
weird interrupts, but maybe now you know a reason why that doesn't
matter or can't happen?

> > +               return -EINVAL;
> > +       }
> > +
> > +       raw_spin_lock_irqsave(&sfp->lock, flags);
> > +       irq_type |= readl_relaxed(base + GPIOIS) & ~mask;
> > +       writel_relaxed(irq_type, base + GPIOIS);
> > +       edge_both |= readl_relaxed(base + GPIOIBE) & ~mask;
> > +       writel_relaxed(edge_both, base + GPIOIBE);
> > +       polarity |= readl_relaxed(base + GPIOIEV) & ~mask;
> > +       writel_relaxed(polarity, base + GPIOIEV);
> > +       raw_spin_unlock_irqrestore(&sfp->lock, flags);
> > +       return 0;
> > +}
>
> ...
>
> > +       ret = reset_control_deassert(rst);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "could not deassert resetd\n");
>
> > +       ret = devm_pinctrl_register_and_init(dev, &starfive_desc, sfp, &sfp->pctl);
> > +       if (ret)
>
> I don't see who will assert reset here.

No, so originally this driver would first assert and then deassert
reset. I decided against that because in all likelyhood earlier boot
stages would have set pinmux up for a serial port, and we don't want
to interrupt the serial debug output. The only reason I make sure the
reset line is deasserted is in case someone makes a really minimal
bootloader that just does the absolute minimal to load a Linux kernel
and doesn't even log any anything.

By the same token we also don't want to assert reset on error in case
it resets pin muxing for the the serial line that was supposed to log
the error.

>
> > +               return dev_err_probe(dev, ret, "could not register pinctrl driver\n");
>
> ...
>
> > +       switch (value) {
> > +       case 0:
> > +               sfp->gpios.pin_base = PAD_INVALID_GPIO;
> > +               goto done;
> > +       case 1:
> > +               sfp->gpios.pin_base = PAD_GPIO(0);
> > +               break;
> > +       case 2:
> > +               sfp->gpios.pin_base = PAD_FUNC_SHARE(72);
> > +               break;
> > +       case 3:
> > +               sfp->gpios.pin_base = PAD_FUNC_SHARE(70);
> > +               break;
> > +       case 4: case 5: case 6:
> > +               sfp->gpios.pin_base = PAD_FUNC_SHARE(0);
> > +               break;
> > +       default:
>
> Ditto.
>
> > +               return dev_err_probe(dev, -EINVAL, "invalid signal group %u\n", value);
> > +       }
>
> ...
>
> > +       ret = devm_gpiochip_add_data(dev, &sfp->gc, sfp);
> > +       if (ret)
>
> Ditto.
>
> > +               return dev_err_probe(dev, ret, "could not register gpiochip\n");
> > +
> > +done:
> > +       return pinctrl_enable(sfp->pctl);
>
> Ditto.
>
> And better to use label name like following
> out_pinctrl_enable:

Good idea.
