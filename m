Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECCDA4436F4
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 21:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhKBUKz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 16:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhKBUKx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 16:10:53 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC8BC061714;
        Tue,  2 Nov 2021 13:08:17 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id j21so1475797edt.11;
        Tue, 02 Nov 2021 13:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ob+aAAsnJvY/so9O4S728AW2SLVYJnzjDGvzTWGx1F8=;
        b=YfWubnYBo8tPkcp/NoWphnxsoI0SM7757XkLqDiWoOWFvtEUHtUA/3iGSZFtVSAXJK
         U7wQyuSpXEi8YPYvVjbsNMyxpxsibH5bl7gP4un4Ma7OsdG9VyuFTgWsR2EMMx3/84Pt
         f264w4Ams8/Aq3+Zlfztc31hgrQ0TlFcvkAjY6uYC+kzXniThvBS1YwlCVW6mmuP1IG9
         EF+vw4WFOzA9PZ1xACySTdnm90aURqtvG9oSEzajKQKjk0r0qiyEX2qZ5W/zGJXPwJQQ
         w+B4pmUYJCGkkNcbYDMOuU8TN3I7J42xjyGvJGJPOXw+9W//0WbIc4cNbupYZyda9+TI
         XEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ob+aAAsnJvY/so9O4S728AW2SLVYJnzjDGvzTWGx1F8=;
        b=yY2H9xo3/gbP99DfsdqTlvq75KuLFw4pK+knQv7E4Kw6ndC3F6vCZ5J0Jkh3r6I20N
         5knvnrg9KJ0m1wmlgPKLtgNy9UCPDCdFRa53ekkj7+6ANJ4aIhT03ACCvqT1qALdvYnV
         +aObgGlur+tiKgjFyyC3QKPluWRr6nGPyeWcsEwMEyiJqY8CaJFPeyML/QG/Pg8sjVFh
         k1kMkQF46yFmN5CqqCTuCw5QFXUFJhxi+sfTFASODmiCtG0OPy0iMzBP/7Q5NbWFEJlV
         15TISWpHZP8MR4fvSsrt4F8ZWjIqd3wjssW6jhTmUpT5zFNjgtRFaeSPhNPMlGYtCbBM
         zz8A==
X-Gm-Message-State: AOAM530D/m/6XMU00qdzWIiLuykNvZ1TgG8UD9xj5K60L1u2/7SBB8O/
        nqMHslPbjvGpuddtJIZFsAfr7GXtoFrul1NTkWA=
X-Google-Smtp-Source: ABdhPJw5iTrK423ECEm/XcyMbYGdWGhn+ReKSJ1f4ncBZTxkWvudYTd3g2Ba8tgP+Bouv9tQnfgHqJdUB8NEHv4b0xE=
X-Received: by 2002:a17:906:9f21:: with SMTP id fy33mr47921381ejc.567.1635883696196;
 Tue, 02 Nov 2021 13:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
In-Reply-To: <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Nov 2021 22:07:26 +0200
Message-ID: <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
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

On Tue, Nov 2, 2021 at 10:02 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > +static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
> > +                                     unsigned int gsel,
> > +                                     unsigned long *configs,
> > +                                     unsigned int num_configs)
> > +{
> > +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> > +       const struct group_desc *group;
> > +       u16 mask, value;
> > +       int i;
> > +
> > +       group = pinctrl_generic_get_group(pctldev, gsel);
> > +       if (!group)
> > +               return -EINVAL;
> > +
> > +       mask = 0;
> > +       value = 0;
> > +       for (i = 0; i < num_configs; i++) {
> > +               int param = pinconf_to_config_param(configs[i]);
> > +               u32 arg = pinconf_to_config_argument(configs[i]);
> > +
> > +               switch (param) {
> > +               case PIN_CONFIG_BIAS_DISABLE:
> > +                       mask |= PAD_BIAS_MASK;
> > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
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
> > +
> > +       for (i = 0; i < group->num_pins; i++)
> > +               starfive_padctl_rmw(sfp, group->pins[i], mask, value);
> > +
> > +       return 0;
> > +}

Linus any comments on this code (sorry if I missed your reply)? The
idea behind above is to skip all settings from the same category and
apply only the last one, e.g. if we have "bias set to X", ..., "bias
disable", ..., "bias set to Y", the hardware will see only the last
operation, i.e. "bias set to Y". I think it may not be the best
approach (theoretically?) since the hardware definitely may behave
differently on the other side in case of such series of the
configurations (yes, I have seen some interesting implementations of
the touchpad / touchscreen GPIOs that may be affected).

-- 
With Best Regards,
Andy Shevchenko
