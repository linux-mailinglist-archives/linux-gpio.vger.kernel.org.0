Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF2844E891
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 15:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235144AbhKLOZu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 09:25:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235106AbhKLOZt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 09:25:49 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBAFCC061766;
        Fri, 12 Nov 2021 06:22:58 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id s186so24002579yba.12;
        Fri, 12 Nov 2021 06:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ggAR2uubSaydz9H2bhZaHxQ14ET7vRT2WA5ZzUM/Bq4=;
        b=RmKrY1Mg6PRkyDz1IdWCexNeP/AXl4K1EwGea8Lbgt+TIk/zCcR97hrA6qvZGTHrcM
         OeY4h7le+zysNz7HeifFubwumUkRt5uRNy2lUCnf2RD3FPIc7wMvwNihVbwO/U5scdgH
         NXx6tzo83iI1UjbUy6H6vZyelZD0FaZbx/Dw6uHde0uD4BbE35cF9XOQkzlmwJMX1KU9
         +GSdsMPZahMKqzl94uBuZkYZ77vJHKu1S/SpboJtV7ds/dEDgRmTj8qyMrLDKmVsJVnv
         /txyxYe609hUCiABQEVu3Rw/1AluIkHy4bprZ/CBxbIFiI/+kJTm1NS9sdXLk7sYQ6OH
         uYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ggAR2uubSaydz9H2bhZaHxQ14ET7vRT2WA5ZzUM/Bq4=;
        b=4rCs1hnaH/tjdI82FZVqNFo7I1ndxFdLzIDyCtIAov+xiPPQ6cCVYtwNbGccIApNuH
         G8kJATsMuG4uxqSUbN2RLNgw8o5M+UJLlVNEbmHtwxr/EY0VonFHRDdNzlT370pA9qTe
         TCcTvMCrJxZ/XksNz5U4ZipcN7NJ3Gwa+S7QVlqD2Ix7mTuWQ/PUWM31POe94PlaLhAv
         td51WL5ip7icEa78Qe0QCuLL+UKzt3gCvoP91QKbQeO3mDYWCiX0QL6+Ur02ZFt6s1d1
         Yr9jdLHRHpU41lU9onTHw7xq4a49A83yICtQKs8UuwqPn5OK4VWeOLNAa67glSdQE4/t
         kGpw==
X-Gm-Message-State: AOAM531hM73nvs5BSnwd3d6L6aY54E2By5IM+g/iWNjaZiSXcOgUoO++
        PvAJS+IxOKsn6w091LaXTLkWoniTxGf1/9oezgY=
X-Google-Smtp-Source: ABdhPJyR7CKGHvXg49KCfNoT5U0Y+hsV3oGjChLcbb/t6QQoHHxwVAoOOEMYuIH8zySnXIegmuAbgC8Cs4np+f3RF2E=
X-Received: by 2002:a25:f502:: with SMTP id a2mr17981752ybe.254.1636726977939;
 Fri, 12 Nov 2021 06:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWmvPgAeS1o8aubaYBihuFrggoVkpT8XtnTZ6nq-VXn9A@mail.gmail.com>
In-Reply-To: <CAMuHMdWmvPgAeS1o8aubaYBihuFrggoVkpT8XtnTZ6nq-VXn9A@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 12 Nov 2021 14:22:32 +0000
Message-ID: <CA+V-a8tLRircMSHxqHRP6g611fPpSrVe1motkKAULeuAM1bMUA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/7] Renesas RZ/G2L IRQC support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On Fri, Nov 12, 2021 at 2:12 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Nov 10, 2021 at 11:58 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > The RZ/G2L Interrupt Controller is a front-end for the GIC found on
> > Renesas RZ/G2L SoC's with below pins:
> > - IRQ sense select for 8 external interrupts, mapped to 8 GIC SPI interrupts
> > - GPIO pins used as external interrupt input pins out of GPIOINT0-122 a
> >   maximum of only 32 can be mapped to 32 GIC SPI interrupts,
> > - NMI edge select.
> >
> >                                                                 _____________
> >                                                                 |    GIC     |
> >                                                                 |  ________  |
> >                                          ____________           | |        | |
> > NMI ------------------------------------>|          |  SPI0-479 | | GIC-600| |
> >                 _______                  |          |------------>|        | |
> >                 |      |                 |          |  PPI16-31 | |        | |
> >                 |      | IRQ0-IRQ8       |   IRQC   |------------>|        | |
>
> IRQ0-IRQ7?
>
oops typo here.

> > P0_P48_4 ------>| GPIO |---------------->|          |           | |________| |
> >                 |      |GPIOINT0-122     |          |           |            |
> >                 |      |---------------->| TINT0-31 |           |            |
> >                 |______|                 |__________|           |____________|
> >
> > The proposed RFC patches, add the IRQ domains in GPIO (pinctrl driver) and the
> > IRQC driver. The IRQC domain handles the actual SPI interrupt and upon reception
> > of the interrupt it propagates to the GPIO IRQ domain to handle virq.
Also this bit isnt true (copy pasted from v1 :(). IRQ now is handled
by the slave driver requesting interrupts. IRQC now handles eoi
callbacks.

> > Out of GPIOINT0-122 only 32 can be mapped to GIC SPI, this mapping is handled by
> > the IRQC driver.
>

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
