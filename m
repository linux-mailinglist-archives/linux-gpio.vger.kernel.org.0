Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91E8F42AEC1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 23:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234191AbhJLVXe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 17:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233635AbhJLVXd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 17:23:33 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67970C061570;
        Tue, 12 Oct 2021 14:21:31 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id r18so1347236edv.12;
        Tue, 12 Oct 2021 14:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gOFNBJr+5UGYcXXM52CBBPVCPAsy4cPdDGbGieRT3Pw=;
        b=TjyrNYrAJjITZgQqDIhNBw1waTJz03vnWMl+Y/NcIBBjvX+/eQQKKsaNJr5LF9vE/m
         U7HF99K3buQSlliPH7Y57gW8fcassAWYG8KLcminqJ3HpgDIA4QOzM1ttT4Toam8i+zj
         loUEwm7f4uGNYNP+lEiX76DKTTWoRBqMX6MQtDuOpXW5WdtCCRfhhZbqwC9bVl/Jx137
         6zn0fRNrLwrgXBQPfibscSDKJ0TyA2u1+2N4tdOIJTICaaYl9RtiuyGYH01Vxh3gKJJe
         sbjeY31IlJkRviou4RLSupw9CNHNivQ+REiV0LHNpTHNQiiTBtoh9FtRbcU6L9o6M1md
         S3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gOFNBJr+5UGYcXXM52CBBPVCPAsy4cPdDGbGieRT3Pw=;
        b=aDRHj+pxJ3CklbQzyOnYKQLXev7NIxyZOegulFp+sT3Lry5/PdYo9GWtGiPN/POiza
         YcZmnnC3QgSYSbvfY5CmZfszCJLjMBAfc8b7qyXfijhn2h6zTFXqmH9MtHWfIegkFD0A
         QokH56p6mMZWLMmDh+rv8ZxOCxHZn9NTOiUv9IZPMLKuZd+XzMqkv2MRq+f2GmkxGoSR
         amEus9Yx3wZENFNQ6OfLjrYv9Mfr0G+XdxRYnWTaifIcz/BscvVKF9OFU2RxOXELp2K7
         7PvQTWimZqN6KzDVN9UoJD3vsBGFQtcmOSb65uevFk2/+ZAA1TB5jXzrfb313Uct3b1G
         ebSg==
X-Gm-Message-State: AOAM5302Zj3GgQ5/XRgRLQrKYUvilzw4vAUGHIASwmYoAIeMZapHGjBw
        DAU7nPTKANKEnzQqK5weQT2eK0OzfyTZGOfcio0=
X-Google-Smtp-Source: ABdhPJwEOXZ3Sz3Z+75oIHMBoXtzmDYFRay0T/yAdFIEl1UtVqX3R3fR7pveB81mNdmIUdJ/kDbGrP2U5ErDIePd6pc=
X-Received: by 2002:a17:906:5a47:: with SMTP id my7mr35357939ejc.128.1634073689974;
 Tue, 12 Oct 2021 14:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-7-kernel@esmil.dk>
 <CAHp75Vetqi=FMoRxfXHL+d1DhAXgLr+5e7ss1M_Rkhqa07H5Jg@mail.gmail.com> <CANBLGcyCpSrxQi7pxLWQLkgbVGAKxJMXhoVbF_DdYDiv5_YJXQ@mail.gmail.com>
In-Reply-To: <CANBLGcyCpSrxQi7pxLWQLkgbVGAKxJMXhoVbF_DdYDiv5_YJXQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 13 Oct 2021 00:20:53 +0300
Message-ID: <CAHp75VcM97vcrNOG_T==E0JyZ_RT_n8MCiVtfmYQM4g8kVtegg@mail.gmail.com>
Subject: Re: [PATCH v1 06/16] clk: starfive: Add JH7100 clock generator driver
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 12, 2021 at 11:08 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 12 Oct 2021 at 17:40, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Oct 12, 2021 at 4:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > +       value |= readl_relaxed(reg) & ~mask;
> >
> > value is not masked, is it okay?
> >
> > Usual pattern for this kind of operations is
> >
> > value = (current & ~mask) | (value & mask);
>
> This function is only ever called with constants, already masked
> values or the parent number from the clk framework, so it should be
> ok.

Up to you, but I think it's better to have a usual pattern.

> > > +       writel_relaxed(value, reg);

...

> > > +       rate = parent / div;
> > > +       if (rate < req->min_rate && div > 1) {
> > > +               div -= 1;
> > > +               rate = parent / div;
> > > +       }
> >
> > Seems like homegrown DIV_ROUND_UP() or so. Who will guarantee that
> > decreasing div by 1 will satisfy the conditional again?
>
> Maths unless I'm mistaken: div = DIV_ROUND_UP(parent, target), so in
> rational numbers
>   div - 1 < parent / target
> But the target is clamped by min_rate and max_rate, so
>   min_rate <= target < parent / (div - 1) = rate
>
> Sorry, re-using the rate varable for both the target and result is
> confusing. I'll fix that.

Also needs a comment, I believe.

...

> > > +#ifdef CONFIG_DEBUG_FS
> >
> > Perhaps __maybe_unused?
>
> I can definitely use __maybe_unused for the function declaration, but
> then I'll need a conditional every time clk_ops.debug_init needs to be
> initialized to either the function or NULL depending on
> CONFIG_DEBUG_FS below. Is that better?

Actually, why can't you always initialize the field? Shouldn't CLK
core take care about this conditional?

> > > +#else
> > > +#define jh7100_clk_debug_init NULL
> > > +#endif

...

> > > +       while (idx > 0)
> > > +               clk_hw_unregister(&priv->reg[--idx].hw);
> >
> > The
> >
> >        while (idx--)
> >                clk_hw_unregister(&priv->reg[idx].hw);
> >
> > is slightly better to read.
>
> It's not something I'll insist hard on, but I must admit I disagree.
> To me the above looks like cartoon characters running off a cliff and
> back. As a middle ground could we maybe do this?
>
>   while (idx)
>     clk_hw_unregister(&priv->reg[--idx].hw);

My point is exactly in having the common pattern for error paths, i.e.

  while (counter--)
    ...bla-bla-bla...

Your second approach is better, but I think that proposed by me is even better.

...

> > > +subsys_initcall(clk_starfive_jh7100_init);
> >
> > Any  explanation why subsys_initcall() is in use?
>
> TBH I just inherited that from Geert's first mock driver and never
> thought to question it. What would be a better alternative to try?

At least add a comment to explain the choice.

-- 
With Best Regards,
Andy Shevchenko
