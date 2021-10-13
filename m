Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 976D042C80B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 19:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238413AbhJMRwq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 13:52:46 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:44970 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbhJMRwS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Oct 2021 13:52:18 -0400
Received: by mail-ua1-f41.google.com with SMTP id e7so6125246ual.11;
        Wed, 13 Oct 2021 10:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tIi5T5N2/yaJwmSaNVNNDL3lEJSP+D3EZbhPxV9bN7g=;
        b=lBwUf98Ya9xGJQumHemveoYA3jaTGo9zceF+dlSBGjCHA+Jw2MOMxZ9OB934ZHub28
         5V0ABhjVZZlvZ+qWYFw+P9SMRVXTIpguYu7gvrLFzeJfdcNzF1zQ6W5+GJr4ko/qmX33
         mNaU3t7S3dcefIkBVLx5WaJaO0wIUUWCcisYJ3M/Khuo1Nc8+ePnQ8t9GOtFD4xJP62a
         tNJ/V0MdsaVFB7VJj5663dRzvTghbMC3MkfLWjRt6i/7i3gInulrtow0NCcTDSC+mGLe
         Y8RJWnu649ml0kDDeEFEBJ9TUdlnr37o9CBy+bZSsXfi3ju+3sQvs4Z5+gggZ1nO8gnq
         smIw==
X-Gm-Message-State: AOAM5318vrASNhOp78jMVxYwLNjoIj3Gdwq3n7Y5wXZqlQW/7whZGddO
        DFdYQixye+6aHB/pDB0ctyRgwEr3UFmuDyTp4DY=
X-Google-Smtp-Source: ABdhPJzI98rys3rSOTMBc774JLZNtowDx6KeQUTWoK/w1LLQIcU7V1QbgCRSZxN5x/TbAcms2qoGM52BOpUZIUalKpI=
X-Received: by 2002:a67:d583:: with SMTP id m3mr967150vsj.41.1634147413827;
 Wed, 13 Oct 2021 10:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGczDZh+kLWM017mPenY8WO5OovH2DFUSS-shRD-aZVKa0A@mail.gmail.com> <YWc5zq0Moz3asWEa@smile.fi.intel.com>
In-Reply-To: <YWc5zq0Moz3asWEa@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Oct 2021 19:50:02 +0200
Message-ID: <CAMuHMdUBwUcs9GPWyrVqu=H1+VnXRzyTzT3XU2jASB+-VQ6axg@mail.gmail.com>
Subject: Re: [PATCH v1 12/16] pinctrl: starfive: Add pinctrl driver for
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
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huan Feng <huan.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 13, 2021 at 6:58 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Oct 13, 2021 at 06:38:14PM +0200, Emil Renner Berthing wrote:
> > On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

> > > > +               v = pinmux[i];
> > > > +               dout = ((v & BIT(7)) << (31 - 7)) | ((v >> 24) & 0xffU);
> > > > +               doen = ((v & BIT(6)) << (31 - 6)) | ((v >> 16) & 0xffU);
> > > > +               din  = (v >> 8) & 0xffU;
> > >
> > > What is this voodoo for?
> >
> > In order to do pinmux we need the following pieces of information from
> > the device tree for each pin ("GPIO" they call it):
> >
> > output signal: 0-133 + 1bit reverse flag
> > output enable signal: 0-133 + 1bit reverse flag
> > optional input signal: 0-74 + special "none" value, right now 0xff
> > gpio number: 0-63
> >
> > As the code is now all that info is packed into a u32 for each pin
> > using the GPIOMUX macro defined in the dt-binding header added in
> > patch 10. There is also a diagram for how this packing is done. The
> > above voodoo is for unpacking that.
> >
> > I'd very much like to hear if you have a better solution for how to
> > convey that information from the device tree to here.
>
> At very least this code should have something like above in the comment.

And perhaps introduce some helper macros to access the fields?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
