Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06D842A7D9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 17:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237311AbhJLPHD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 11:07:03 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177]:38684 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237223AbhJLPHD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 11:07:03 -0400
Received: by mail-pf1-f177.google.com with SMTP id k26so17810137pfi.5;
        Tue, 12 Oct 2021 08:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hdJDtZAfGIdmZ/ukdHpeB6ObCJRx81CajNUOCsrybQI=;
        b=PLODMfvtk0akldX2uKuW3OfA8uRa9S2MSPgbhHny7guY2xuIOIBNg2FKgf0F16h9gz
         1ZQpB58gQrvKlii1NheXBLFGfoOMdCz3R8BkzJhfAMxqeqbSxvS8JcHTOY16lOP3KWgd
         RWJ3PuIS79mjngoa84d7DwO7U/9nAybKQtf3By4ioA2y9iilbpLA4Vc54zDhE8tUYQ8W
         s8vE58lrTTKofu460M46eLmO3h1K8BA+6DPvqx6+TtY6F5VKXYiuhp+HWDNKMSKi2Y49
         RfEewfNDPke9JF6zh0kFOMMNSRdI85BA7K4pCwFS0v5Z42AT3WqH6UI7ehdTpq9hFJ3d
         FDJw==
X-Gm-Message-State: AOAM531G6sDhSraynjZ3qRa1fAWYAhd40u4sRhINO2jDYft/lBxLxoQs
        E+KVX8gAq3WPk2zhWhFqVU31bqxPjAoYpltM7F8=
X-Google-Smtp-Source: ABdhPJwjzF1OeRyJAl+WVfOcbYpjaH0YTTRuWHlM9SeqDs+4nR3B9BF7FubISuSdaFjCzlSGaxlHolurGeiz3wPpntQ=
X-Received: by 2002:a63:b11:: with SMTP id 17mr23103923pgl.51.1634051101136;
 Tue, 12 Oct 2021 08:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-10-kernel@esmil.dk>
 <99ddc44924bcb89110a74d3182b1d3eea623dce1.camel@pengutronix.de>
In-Reply-To: <99ddc44924bcb89110a74d3182b1d3eea623dce1.camel@pengutronix.de>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Tue, 12 Oct 2021 17:04:49 +0200
Message-ID: <CANBLGcyA3LzRNhR1pFpZmnHPXHSMcxyF93_p2nvVfscZCAO06w@mail.gmail.com>
Subject: Re: [PATCH v1 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 12 Oct 2021 at 16:31, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Tue, 2021-10-12 at 15:40 +0200, Emil Renner Berthing wrote:
> > Add a driver for the StarFive JH7100 reset controller.
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > ---
> >  MAINTAINERS                           |   7 ++
> >  drivers/reset/Kconfig                 |   8 ++
> >  drivers/reset/Makefile                |   1 +
> >  drivers/reset/reset-starfive-jh7100.c | 164 ++++++++++++++++++++++++++
> >  4 files changed, 180 insertions(+)
> >  create mode 100644 drivers/reset/reset-starfive-jh7100.c
> >
> [...]
> > diff --git a/drivers/reset/reset-starfive-jh7100.c b/drivers/reset/reset-starfive-jh7100.c
> > new file mode 100644
> > index 000000000000..26bc5b59c1f3
> > --- /dev/null
> > +++ b/drivers/reset/reset-starfive-jh7100.c
> > @@ -0,0 +1,164 @@
> [...]
> > +static int jh7100_reset_update(struct reset_controller_dev *rcdev,
> > +                            unsigned long id, bool assert)
> > +{
> > +     struct jh7100_reset *data = jh7100_reset_from(rcdev);
> > +     unsigned long offset = id / 32;
> > +     void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + 4 * offset;
> > +     void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + 4 * offset;
> > +     u32 mask = BIT(id % 32);
> > +     u32 done = jh7100_reset_asserted[offset] & mask;
> > +     unsigned long flags;
> > +     u32 value;
> > +
> > +     if (!assert)
> > +             done ^= mask;
> > +
> > +     spin_lock_irqsave(&data->lock, flags);
> > +
> > +     value = readl(reg_assert);
> > +     if (assert)
> > +             value |= mask;
> > +     else
> > +             value &= ~mask;
> > +     writel(value, reg_assert);
> > +
> > +     do {
> > +             value = readl(reg_status) & mask;
> > +     } while (value != done);
>
> Looking at the barebox driver, this could loop indefinitely if the
> caller forgets to enable the corresponding peripheral clock. Maybe
> use readl_poll_timeout() as a safety net.

You're right. Asserting without the clock enabled is fine, but
deasserting will hang forever. At least for the temperature sensor
clock/resets I tried it with. I'll add the timeout, thanks!

/Emil
