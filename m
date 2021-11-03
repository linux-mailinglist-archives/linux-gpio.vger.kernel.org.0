Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38D73443F0A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 10:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbhKCJPi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Nov 2021 05:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbhKCJPi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Nov 2021 05:15:38 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB47C061714;
        Wed,  3 Nov 2021 02:13:01 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z20so6591730edc.13;
        Wed, 03 Nov 2021 02:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xKAL9xp/+xMBb6SWWdbM18jjZhDpz2vLJFJj9z7WZW0=;
        b=VhiZ4M005IQJVGme3IaI5C/e6/VHSTZ8OeA37oUhiPODQeRbZoBlkbOIt5dnzjkDP2
         czOsVsaV0BcyFBGY5nAO0Ew8HOjcDbJ+dR0GK0Toncies9mF66baSnNp1HEESaeENdYm
         kULAuvWCQmNHaimi1v+rmU5MSaqzxoPSSOcgII1Qv88sl8yH+NlRItTwPrPZI46ELr16
         +v3Qvt0C4gxXRtKO69r6aZlTi5ln6jnv4aFlRmfo5LyNlr+RsWy6fxLT+MXBREXzWTmW
         uuMZVQ5Kdnpuci8unVq50JyTTClXZFszh7yjqvafDmNja5cg4YWeaUKjlZLuUqkYcfTX
         23qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xKAL9xp/+xMBb6SWWdbM18jjZhDpz2vLJFJj9z7WZW0=;
        b=bJOsbl6PqJiNJANzdDJdiW7Tw9bvAlyUvKNJovgCErLl73UgibtwfWBoSgpNICSCBi
         1y9AyDiv1zmsiTeYgyEWeMbSelY1OlXVui3c0HxxKfWPLUT7QrsMynVqWzyZZVsfmGjG
         YUk3Q3dVRAYv2Q0ZH8Z8A35h7hibNlmBjpL/gwRIzX5GzIoQqRZrb02zt3M28uzjVzlK
         sIWCbwLtu34ZVCrnzQWLJLAmkeWDhMmlfzr52ljJQ6g3LkaQt4y0LNyOC2OmzK0nU5qY
         oEGmnXpKvWoq8w1YCB1QvTMNnL39lTCvhxfZHGKfsugbw9cYiIiTuhY3ZKDURnf5zLqI
         LPpw==
X-Gm-Message-State: AOAM531oxHSsOvQ9BJC9BsFSHj4vdEfHCURWSrS+0ULkkMLCvBghWOxn
        NTpHD7qp6YlF6js8HHj4RhWL9MBW2aYPh/JXUaQ=
X-Google-Smtp-Source: ABdhPJw3gEKvcXzWscXHSKOeQHEdUeowhKhWDUie0k1xHof3mJ6WZb1bBy0j4iaHfePYZ1ng5He8bLypLuGuXbzyj0A=
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr52699100ejc.69.1635930780351;
 Wed, 03 Nov 2021 02:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com> <CANBLGczn8+po09wF_uEvvU8tLCn0ahY+Gkj9JJLxOcj1LC1aLA@mail.gmail.com>
In-Reply-To: <CANBLGczn8+po09wF_uEvvU8tLCn0ahY+Gkj9JJLxOcj1LC1aLA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 3 Nov 2021 11:12:24 +0200
Message-ID: <CAHp75VetDHt9G+PT77_py8N4Z06j7oytnXgQq8zss_xZBBeEng@mail.gmail.com>
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

On Tue, Nov 2, 2021 at 10:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> On Tue, 2 Nov 2021 at 21:02, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > +static inline struct device *starfive_dev(const struct starfive_pinctrl *sfp)
> > > +{
> > > +       return sfp->gc.parent;
> > > +}
> > > +
> >
> > This seems useless helper. You may do what it's doing just in place.
> > It will save 5 LOCs.
>
> I don't mind removing it, I just think it's easier to read when we're
> explicit that all we want is a dev pointer, and we don't suddenly need
> to know the parent of the gpio chip in all the pinmux/pinconf
> callbacks.

I don't really see the gain of it.

...

> > > +static int starfive_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
> > > +{
> > > +       struct starfive_pinctrl *sfp = container_of(gc, struct starfive_pinctrl, gc);
> > > +       void __iomem *doen = sfp->base + GPON_DOEN_CFG + 8 * gpio;
> > > +
> > > +       /* return GPIO_LINE_DIRECTION_OUT (0) only if doen == GPO_ENABLE (0) */
> > > +       return readl_relaxed(doen) != GPO_ENABLE;
> >
> > I believe the idea was to return the predefined values for the direction.
>
> You mean this?
>   return readl_relaxed(doen) == GPO_ENABLE ? GPIO_LINE_DIRECTION_OUT :
> GPIO_LINE_DIRECTION_IN;

For example, or with if (...) return _OUT; return _IN;'

> > > +}

...

> > > +       if (trigger & IRQ_TYPE_EDGE_BOTH)
> > > +               irq_set_handler_locked(d, handle_edge_irq);
> > > +       else if (trigger & IRQ_TYPE_LEVEL_MASK)
> > > +               irq_set_handler_locked(d, handle_level_irq);
> >
> > Usually we don't assign this twice, so it should be after the switch.
> >
> > > +       switch (trigger) {

> > > +       default:
> >
> > > +               irq_set_handler_locked(d, handle_bad_irq);
> >
> > Why? You have it already in ->probe(), what's the point?
>
> So last time you asked about this, I explained a situation where
> userspace first grabs a GPIO, set the interrupt to edge triggered, and
> then later loads a driver that requests an unsupported IRQ type.

I didn't get this scenario. Is it real?

> Then
> I'd like to set the handler back to handle_bad_irq so we don't get
> weird interrupts, but maybe now you know a reason why that doesn't
> matter or can't happen?

In ->probe() you set _default_ handler to bad(), what do you mean by
'set the handler back to bad()'? How is it otherwise if you free an
interrupt?

So, please elaborate with call traces what the scenario / use case you
are talking about. If it's true what you are saying, we have a
situation (plenty of GPIO drivers don't do what you are suggesting
here).

> > > +               return -EINVAL;
> > > +       }

...

> > > +       ret = reset_control_deassert(rst);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret, "could not deassert resetd\n");
> >
> > > +       ret = devm_pinctrl_register_and_init(dev, &starfive_desc, sfp, &sfp->pctl);
> > > +       if (ret)
> >
> > I don't see who will assert reset here.
>
> No, so originally this driver would first assert and then deassert
> reset. I decided against that because in all likelyhood earlier boot
> stages would have set pinmux up for a serial port, and we don't want
> to interrupt the serial debug output. The only reason I make sure the
> reset line is deasserted is in case someone makes a really minimal
> bootloader that just does the absolute minimal to load a Linux kernel
> and doesn't even log any anything.
>
> By the same token we also don't want to assert reset on error in case
> it resets pin muxing for the the serial line that was supposed to log
> the error.

Perhaps comment in the code explaining this?

-- 
With Best Regards,
Andy Shevchenko
