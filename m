Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC4F43780E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 15:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbhJVNh2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 09:37:28 -0400
Received: from mail-pj1-f54.google.com ([209.85.216.54]:36441 "EHLO
        mail-pj1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbhJVNh1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 09:37:27 -0400
Received: by mail-pj1-f54.google.com with SMTP id s61-20020a17090a69c300b0019f663cfcd1so5761986pjj.1;
        Fri, 22 Oct 2021 06:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gB9nPqjC9kxzaGyB2tMhiS6mHnq6MtGEClgbmCe1njU=;
        b=oKz5XugOcFNwrwnTaCY/SSpL7pnROnKkrienvzj5uVBK0QBc1mJr/o5RqGfeRX23z7
         7Exq6062+04598c1mBbQlOz/HtDxkoVO0Ik5R3i4A0rvl0EYDNjdV3YBd3UdRXyCr58K
         0lHAgP0GY7HJG/6lvnrV/yeWg45+7KZ3mNMXyk46gysLDISFGEb33iInu5Wp7HNx+OZU
         rW/3w+GLfgz0z9oi7AMDhac1LZ3Lr5PV0TYw/VxjS9FsTSP5zVUOKy1DX4nqrl0cuXKI
         JPO6BNZbzUf99uSsbdSfXebVYRCJfjxp/+BdsKxy4f8GY0tXrOQJQQYYrdC89hKvosrD
         JUbA==
X-Gm-Message-State: AOAM530liQ+0FFyaHU7QLNSpfe/j4WG2aXlL5u+Gt3ECLD6Rf1KMZoib
        gJ8nNZqmtfuD7JaNfuEJzyBa9Qwn7yD5+rtRVXo=
X-Google-Smtp-Source: ABdhPJzqcT67gDitD+qJ4y7d2w+3rgIO7RJA2uS12QTmtGTpMOXJEAZLRBCBCYbMxbHPzzavLq8IpRdVwEBpC6v5jgY=
X-Received: by 2002:a17:90b:390f:: with SMTP id ob15mr13460474pjb.185.1634909710011;
 Fri, 22 Oct 2021 06:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
In-Reply-To: <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Fri, 22 Oct 2021 15:34:58 +0200
Message-ID: <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > +static const u32 jh7100_reset_asserted[4] = {
>
> > +       BIT(JH7100_RST_U74 % 32) |
> > +       BIT(JH7100_RST_VP6_DRESET % 32) |
> > +       BIT(JH7100_RST_VP6_BRESET % 32),
>
> It's hard to notice that this is only one entry. See also below.

Yeah, so what would be a better way to style it?

> > +       BIT(JH7100_RST_HIFI4_DRESET % 32) |
> > +       BIT(JH7100_RST_HIFI4_BRESET % 32),
> > +
> > +       BIT(JH7100_RST_E24 % 32)
>
> + Comma.
>
> > +};
>
> Why all these ugly % 32 against constants?

Because the JH7100_RST_ values goes higher than 31. There is a
BIT_MASK macro, but that does % BITS_PER_LONG and this is a 64bit
machine.

> ...
>
> > +       if (!assert)
> > +               done ^= mask;
>
> Can you convert this to simple
>
>   if (assert)
>     ret = readl_...
>   else
>     ret = readl_...
>
> below?

I don't see how that would work. We're using the done value in in the
readl_poll_timeout. Maybe you can be a bit more explicit.

The reason is that for most reset lines a 0 in the status register
means it's asserted and a 1 means it's deasserted. For the few reset
lines above this is reversed though.

/Emil
