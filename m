Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3170044AA7C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 10:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244815AbhKIJYV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 04:24:21 -0500
Received: from mail-pl1-f179.google.com ([209.85.214.179]:37465 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244806AbhKIJYT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 04:24:19 -0500
Received: by mail-pl1-f179.google.com with SMTP id n8so19825754plf.4;
        Tue, 09 Nov 2021 01:21:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vCxzbvDJEmmS0S1dn6IErGyixaEwc//p9ymy/wdvxtw=;
        b=jRTqA9CjNbMIaAbN2vA83XYv+AFhETkDyDbVjnWvwsHOo2s86fzQ1SraY29Dozzz1U
         +OeKQjVl2IAeHxhsyd80SK7Qmb0yr7mHowW1KwwnbjCg6t0hyqrIdzZ6aEKUSjuxCe1b
         fAPfSqIkrPglwsJEE1JFvdbV7Z1AgDXDuNgZapsMHDiqS9QhdYCf0aCWhen8Fkr5Ni2L
         rhKbEVzM74q3F6nH482PO/m6u322gY57tMyEyucMF6+liCuLnNxoHma0h31R3/O543+r
         68IPjwx1vLRBYjfK/Be6/TNSq9C9UwuMUZxLlGKfRwfnwtNc3xJ2U2a5cFbQ1J4yeY0z
         1tTA==
X-Gm-Message-State: AOAM531tzjR+rIZRVBb943hg/e06zflSN37cQ1lc4883icJFOnpfrBIi
        OjXtBj8lkygYkYaWnEGM3VGCwY/ddOT7pUV7CC4=
X-Google-Smtp-Source: ABdhPJxeU3ygXo8r/E5kP4Zn/e69OhIOKZcjPawrK0dUmlnrErW2Q4cDHdP743SYHawatA0U/RlEabrMniGDI/paKZs=
X-Received: by 2002:a17:903:11c5:b0:13f:ef40:e319 with SMTP id
 q5-20020a17090311c500b0013fef40e319mr5828558plh.33.1636449693539; Tue, 09 Nov
 2021 01:21:33 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com> <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
In-Reply-To: <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Tue, 9 Nov 2021 10:21:22 +0100
Message-ID: <CANBLGcyo3YjygkjDmdjt4C_H=MZdHQwqumsxnatuObeP2LADAg@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
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

On Tue, 9 Nov 2021 at 02:01, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Nov 2, 2021 at 9:08 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> (...)
> > > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > ...
> >
> > > > +static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
> > > > +                                     unsigned int gsel,
> > > > +                                     unsigned long *configs,
> > > > +                                     unsigned int num_configs)
> > > > +{
> > > > +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> > > > +       const struct group_desc *group;
> > > > +       u16 mask, value;
> > > > +       int i;
> > > > +
> > > > +       group = pinctrl_generic_get_group(pctldev, gsel);
> > > > +       if (!group)
> > > > +               return -EINVAL;
> > > > +
> > > > +       mask = 0;
> > > > +       value = 0;
> > > > +       for (i = 0; i < num_configs; i++) {
> > > > +               int param = pinconf_to_config_param(configs[i]);
> > > > +               u32 arg = pinconf_to_config_argument(configs[i]);
> > > > +
> > > > +               switch (param) {
> > > > +               case PIN_CONFIG_BIAS_DISABLE:
> > > > +                       mask |= PAD_BIAS_MASK;
> > > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> > > > +                       break;
> > > > +               case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > +                       if (arg == 0)
> > > > +                               return -ENOTSUPP;
> > > > +                       mask |= PAD_BIAS_MASK;
> > > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_PULL_DOWN;
> > > > +                       break;
> > > > +               case PIN_CONFIG_BIAS_PULL_UP:
> > > > +                       if (arg == 0)
> > > > +                               return -ENOTSUPP;
> > > > +                       mask |= PAD_BIAS_MASK;
> > > > +                       value = value & ~PAD_BIAS_MASK;
> > > > +                       break;
> > > > +               case PIN_CONFIG_DRIVE_STRENGTH:
> > > > +                       mask |= PAD_DRIVE_STRENGTH_MASK;
> > > > +                       value = (value & ~PAD_DRIVE_STRENGTH_MASK) |
> > > > +                               starfive_drive_strength_from_max_mA(arg);
> > > > +                       break;
> > > > +               case PIN_CONFIG_INPUT_ENABLE:
> > > > +                       mask |= PAD_INPUT_ENABLE;
> > > > +                       if (arg)
> > > > +                               value |= PAD_INPUT_ENABLE;
> > > > +                       else
> > > > +                               value &= ~PAD_INPUT_ENABLE;
> > > > +                       break;
> > > > +               case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> > > > +                       mask |= PAD_INPUT_SCHMITT_ENABLE;
> > > > +                       if (arg)
> > > > +                               value |= PAD_INPUT_SCHMITT_ENABLE;
> > > > +                       else
> > > > +                               value &= ~PAD_INPUT_SCHMITT_ENABLE;
> > > > +                       break;
> > > > +               case PIN_CONFIG_SLEW_RATE:
> > > > +                       mask |= PAD_SLEW_RATE_MASK;
> > > > +                       value = (value & ~PAD_SLEW_RATE_MASK) |
> > > > +                               ((arg << PAD_SLEW_RATE_POS) & PAD_SLEW_RATE_MASK);
> > > > +                       break;
> > > > +               case PIN_CONFIG_STARFIVE_STRONG_PULL_UP:
> > > > +                       if (arg) {
> > > > +                               mask |= PAD_BIAS_MASK;
> > > > +                               value = (value & ~PAD_BIAS_MASK) |
> > > > +                                       PAD_BIAS_STRONG_PULL_UP;
> > > > +                       } else {
> > > > +                               mask |= PAD_BIAS_STRONG_PULL_UP;
> > > > +                               value = value & ~PAD_BIAS_STRONG_PULL_UP;
> > > > +                       }
> > > > +                       break;
> > > > +               default:
> > > > +                       return -ENOTSUPP;
> > > > +               }
> > > > +       }
> > > > +
> > > > +       for (i = 0; i < group->num_pins; i++)
> > > > +               starfive_padctl_rmw(sfp, group->pins[i], mask, value);
> > > > +
> > > > +       return 0;
> > > > +}
> >
> > Linus any comments on this code (sorry if I missed your reply)? The
> > idea behind above is to skip all settings from the same category and
> > apply only the last one, e.g. if we have "bias set to X", ..., "bias
> > disable", ..., "bias set to Y", the hardware will see only the last
> > operation, i.e. "bias set to Y". I think it may not be the best
> > approach (theoretically?) since the hardware definitely may behave
> > differently on the other side in case of such series of the
> > configurations (yes, I have seen some interesting implementations of
> > the touchpad / touchscreen GPIOs that may be affected).
>
> That sounds weird. I think we need to look at how other drivers
> deal with this.
>
> To me it seems more natural that
> starfive_padctl_rmw(sfp, group->pins[i], mask, value);
> would get called at the end of each iteration of the
> for (i = 0; i < num_configs; i++) loop.

That would work, but when the loop is done the end result would be
exactly the same. The only difference is that the above would rapidly
"blink" the different states during the loop until it arrives at the
result. This would certainly be different, but it can never be the
intended behaviour and only a side-effect on how the pinctrl framework
works. The order the different states are blinked depends entirely on
how the pinctrl framework parses the device tree. I still think it
would be more natural to cleanly go to the end result without this
blinking.

/Emil
