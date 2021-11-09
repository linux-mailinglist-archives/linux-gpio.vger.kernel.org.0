Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A57144A142
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 02:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239393AbhKIBJK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 20:09:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238584AbhKIBHA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 20:07:00 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6FAC0797BB
        for <linux-gpio@vger.kernel.org>; Mon,  8 Nov 2021 17:01:50 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id l7-20020a0568302b0700b0055ae988dcc8so25190549otv.12
        for <linux-gpio@vger.kernel.org>; Mon, 08 Nov 2021 17:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t9jW1J5eNwWEbybNdKesq0t74E7W/ck/52E2VJGXkkg=;
        b=tUpaENN0tjUWzOeNT0UHfb4T1ir5hzA5JvtVSI8sTnzbpAxGN6zqp0AepxIOWpkLrE
         i9rj1FhfA7LO8kbEZq4e8dfjCkeg4oHqJFDvqkt9f8H5fa1/DFLjivlehpz1he3+ybIc
         Q+f3LW/VS4P3K/r2DWCugKqeOlb0rhBiRs8/EMU7rwa5+c5sVd59Jq2asZa60hffRYKg
         5P/aLsIczyg9eYdk9qOGdhojaJLOiZd4vB22879Vx+SQxhM1rhihHRXP3fDeUkTSQq6F
         B3d9kt0X3OjsfHCCJzKw8UCujLi+edpBxbSvIWJAX9RllF/Mox8o+jiYh7qyGpVK2zBU
         eWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t9jW1J5eNwWEbybNdKesq0t74E7W/ck/52E2VJGXkkg=;
        b=D3cmwvCnk/LL586dSQMNKsaripIR5QmRkDUzeqx9nt4VLq/7ojap/rqTPIV2wfOHLa
         ucEOTz6PP/i3e/eiotYggNdhXlN7xRzK9+MRMQcpgPrNGe7Gl5F86kJ6E3xk7JC1ONrO
         jn6OoKenLdpPcVdlJ/4AvVM3ZG1GYvzea2TKg6VWI3W/I/HLYiGdSOP5zK+tg0VgkhUm
         u1mCgnj9I//RHscfv2ErMpDj4Unfu/DUmDHub5HPG41gJQ9aCvlApLDc2ZjEF8OzYKdK
         8hyiXyHMYdw6z+2l9uosW3dfLDR48/rVSgrUCK2J2vpOYSllwhBAnhslY/Vx+ZtHeyc3
         y8vg==
X-Gm-Message-State: AOAM532szJKqwXKlGfbbpceFdpd8uRMFePvgqqOzqPdhxqJMOkHrYde9
        cReyIyizfYUHXD30xjPywC6jkI652aCn25HmuTPf7A==
X-Google-Smtp-Source: ABdhPJw7atefZ+9vTHHn1jZX0FdtT+yhNCn8qx2PNquKXMzwrqP0p2MI7f3sIpXgVuSNJNdGFjLmQJbrTBCj6pV6XZ4=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr2644104otj.35.1636419709380;
 Mon, 08 Nov 2021 17:01:49 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com> <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
In-Reply-To: <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 02:01:37 +0100
Message-ID: <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
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

On Tue, Nov 2, 2021 at 9:08 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
(...)
> > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > +static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
> > > +                                     unsigned int gsel,
> > > +                                     unsigned long *configs,
> > > +                                     unsigned int num_configs)
> > > +{
> > > +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> > > +       const struct group_desc *group;
> > > +       u16 mask, value;
> > > +       int i;
> > > +
> > > +       group = pinctrl_generic_get_group(pctldev, gsel);
> > > +       if (!group)
> > > +               return -EINVAL;
> > > +
> > > +       mask = 0;
> > > +       value = 0;
> > > +       for (i = 0; i < num_configs; i++) {
> > > +               int param = pinconf_to_config_param(configs[i]);
> > > +               u32 arg = pinconf_to_config_argument(configs[i]);
> > > +
> > > +               switch (param) {
> > > +               case PIN_CONFIG_BIAS_DISABLE:
> > > +                       mask |= PAD_BIAS_MASK;
> > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> > > +                       break;
> > > +               case PIN_CONFIG_BIAS_PULL_DOWN:
> > > +                       if (arg == 0)
> > > +                               return -ENOTSUPP;
> > > +                       mask |= PAD_BIAS_MASK;
> > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_PULL_DOWN;
> > > +                       break;
> > > +               case PIN_CONFIG_BIAS_PULL_UP:
> > > +                       if (arg == 0)
> > > +                               return -ENOTSUPP;
> > > +                       mask |= PAD_BIAS_MASK;
> > > +                       value = value & ~PAD_BIAS_MASK;
> > > +                       break;
> > > +               case PIN_CONFIG_DRIVE_STRENGTH:
> > > +                       mask |= PAD_DRIVE_STRENGTH_MASK;
> > > +                       value = (value & ~PAD_DRIVE_STRENGTH_MASK) |
> > > +                               starfive_drive_strength_from_max_mA(arg);
> > > +                       break;
> > > +               case PIN_CONFIG_INPUT_ENABLE:
> > > +                       mask |= PAD_INPUT_ENABLE;
> > > +                       if (arg)
> > > +                               value |= PAD_INPUT_ENABLE;
> > > +                       else
> > > +                               value &= ~PAD_INPUT_ENABLE;
> > > +                       break;
> > > +               case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> > > +                       mask |= PAD_INPUT_SCHMITT_ENABLE;
> > > +                       if (arg)
> > > +                               value |= PAD_INPUT_SCHMITT_ENABLE;
> > > +                       else
> > > +                               value &= ~PAD_INPUT_SCHMITT_ENABLE;
> > > +                       break;
> > > +               case PIN_CONFIG_SLEW_RATE:
> > > +                       mask |= PAD_SLEW_RATE_MASK;
> > > +                       value = (value & ~PAD_SLEW_RATE_MASK) |
> > > +                               ((arg << PAD_SLEW_RATE_POS) & PAD_SLEW_RATE_MASK);
> > > +                       break;
> > > +               case PIN_CONFIG_STARFIVE_STRONG_PULL_UP:
> > > +                       if (arg) {
> > > +                               mask |= PAD_BIAS_MASK;
> > > +                               value = (value & ~PAD_BIAS_MASK) |
> > > +                                       PAD_BIAS_STRONG_PULL_UP;
> > > +                       } else {
> > > +                               mask |= PAD_BIAS_STRONG_PULL_UP;
> > > +                               value = value & ~PAD_BIAS_STRONG_PULL_UP;
> > > +                       }
> > > +                       break;
> > > +               default:
> > > +                       return -ENOTSUPP;
> > > +               }
> > > +       }
> > > +
> > > +       for (i = 0; i < group->num_pins; i++)
> > > +               starfive_padctl_rmw(sfp, group->pins[i], mask, value);
> > > +
> > > +       return 0;
> > > +}
>
> Linus any comments on this code (sorry if I missed your reply)? The
> idea behind above is to skip all settings from the same category and
> apply only the last one, e.g. if we have "bias set to X", ..., "bias
> disable", ..., "bias set to Y", the hardware will see only the last
> operation, i.e. "bias set to Y". I think it may not be the best
> approach (theoretically?) since the hardware definitely may behave
> differently on the other side in case of such series of the
> configurations (yes, I have seen some interesting implementations of
> the touchpad / touchscreen GPIOs that may be affected).

That sounds weird. I think we need to look at how other drivers
deal with this.

To me it seems more natural that
starfive_padctl_rmw(sfp, group->pins[i], mask, value);
would get called at the end of each iteration of the
for (i = 0; i < num_configs; i++) loop.

Yours,
Linus Walleij
