Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 324F542A6C7
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 16:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236888AbhJLOKe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 10:10:34 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:39586 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbhJLOKd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 10:10:33 -0400
Received: by mail-pf1-f170.google.com with SMTP id x130so8702821pfd.6;
        Tue, 12 Oct 2021 07:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P3TH6V659MxdOd+Pk6btaCI+yJuhu8J1R8RRJ47agS4=;
        b=5mLL/fMbw1hgI+qkXL4GiZr4WzuY1onxZwt3Q94MLMg+Q/ie8ZbPSkxnOodIlCwKVh
         QEiPGmzY9LWkx3Q16srCam4TyfMxslLJwpflPDPYhJNzgQXUo4Ea7gV4AvFVOaPSvRSs
         vDbbKED7+CNw+8DkuWC0Ar6pDVzgOHGfNOKWty4mFbAB7ssmAV+G0Xe+7Kc/7D0CcmYa
         BE3GjuZ51DA/ZCoNGkdzH0RIBK8qwZ+idBcURbSUMuzN492RdhHVwSzY/obl2/OJeG0X
         kYUbcZcZt8ep1KDrxeRMcjA/XewUHLKBG1LsIyeuVU53mk9u4JeWqyQwULyT9EdCjz3s
         uonw==
X-Gm-Message-State: AOAM5318pjbdMldWXm4yz7r4MivOPh9rJyoM5jG1H0QS3WTkS+RjY9Os
        2QqCRO8m/q0pNj8R2wLLxdgd4Bgs+4lQKm7U1Uw=
X-Google-Smtp-Source: ABdhPJzFrwjhxpd8SX+RnC+WUd6r6R0aV04or0zTVrWXoTh7KJaFn5n/i+9iDY4cxS4j9PbgkDw29jCmvh5xes/0tPA=
X-Received: by 2002:a63:b11:: with SMTP id 17mr22878865pgl.51.1634047711216;
 Tue, 12 Oct 2021 07:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-10-kernel@esmil.dk>
 <9446163d07a2ff135965c7bff249f76bd0da5fb8.camel@pengutronix.de>
In-Reply-To: <9446163d07a2ff135965c7bff249f76bd0da5fb8.camel@pengutronix.de>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Tue, 12 Oct 2021 16:08:19 +0200
Message-ID: <CANBLGcwYu1P7=S4hj9eZXKjStKw9o_Ah0OOWLpCkPzrJ9qHWKw@mail.gmail.com>
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

On Tue, 12 Oct 2021 at 16:06, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Hi Emil,
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
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d2b95b96f0ec..f7883377895e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17854,6 +17854,13 @@ F:   Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
> >  F:   drivers/clk/starfive/clk-starfive-jh7100.c
> >  F:   include/dt-bindings/clock/starfive-jh7100.h
> >
> > +STARFIVE JH7100 RESET CONTROLLER DRIVER
> > +M:   Emil Renner Berthing <kernel@esmil.dk>
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> > +F:   drivers/reset/reset-starfive-jh7100.c
> > +F:   include/dt-bindings/reset/starfive-jh7100.h
> > +
> >  STATIC BRANCH/CALL
> >  M:   Peter Zijlstra <peterz@infradead.org>
> >  M:   Josh Poimboeuf <jpoimboe@redhat.com>
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index be799a5abf8a..8345521744b3 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -92,6 +92,14 @@ config RESET_INTEL_GW
> >         Say Y to control the reset signals provided by reset controller.
> >         Otherwise, say N.
> >
> > +config RESET_STARFIVE_JH7100
> > +     bool "StarFive JH7100 Reset Driver"
> > +     depends on SOC_STARFIVE || COMPILE_TEST
> > +     depends on OF
> > +     default SOC_STARFIVE
> > +     help
> > +       This enables the reset controller driver for the StarFive JH7100 SoC.
> > +
>
> Please keep these in alphabetical (config symbol name) order.

Argh, sorry. I injected the _STARFIVE_ late and forgot about ordering.
Will fix, thanks!

> regards
> Philipp
