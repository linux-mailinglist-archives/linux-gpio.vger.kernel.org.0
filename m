Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24EAB42D761
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 12:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbhJNKsp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Oct 2021 06:48:45 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177]:34374 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhJNKso (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Oct 2021 06:48:44 -0400
Received: by mail-pf1-f177.google.com with SMTP id g14so5136117pfm.1;
        Thu, 14 Oct 2021 03:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DJvXSZseMVfQbBmTt0BMqFozFQd+wMN0VfIKZGrZECk=;
        b=N36jNuup8DbNKcQt0loYqEFNYdNshFTcCbPLB1O63rYXHyMRpTCwtdGyA5ddfILOja
         glNutC5d9xuyHF6kdKWcUCSMppkYkwu8IwiVUSXF5+ftQFr3hnwZzVN88l9jPz9Actn3
         uC3fZ30P2HwyldFGy48wkIcuaPjddiNtiruKcF1VZi/ICmzu0uIyoJCCBygRIJw+O3wH
         OGldTzRB0reiVmkCDbztBcClCJr2XuELgsAVWFjb2eGVM98TkysqS2nAcQkydtZbS2Mf
         jXmnvzSHmmvSfrMA3Nv8ciyti27jV1oUpuodtjW/N4eoGQDp0DschB3b82pQgWm3lQ36
         5a0A==
X-Gm-Message-State: AOAM533lWBk3GKnw3dbq+zngUcCXD2QfntZFIKhoqWL9rGTuahQu2l6i
        zi4Fr4NdpuZmnbaL0pgusza1AkdhNXbkK1UyemA=
X-Google-Smtp-Source: ABdhPJwtbEns4mDs0xX2KLgZa1X/jK39DitRxJ5GZBX6KxfQkmgA4slF3Il6bBNO+Vq6ZZEe58g8utxI0258TBE2Aiw=
X-Received: by 2002:a62:31c5:0:b0:447:cd37:61f8 with SMTP id
 x188-20020a6231c5000000b00447cd3761f8mr4695364pfx.29.1634208399368; Thu, 14
 Oct 2021 03:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <CACRpkdaB27Ar0a+Kxh9bmH78bUL_vFush==Suua2TDjt7wpYug@mail.gmail.com>
In-Reply-To: <CACRpkdaB27Ar0a+Kxh9bmH78bUL_vFush==Suua2TDjt7wpYug@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Thu, 14 Oct 2021 12:46:28 +0200
Message-ID: <CANBLGcyno5YGsjAyScDMXqdOPpyXQDH8u7=qMD07rsNVLrOC_Q@mail.gmail.com>
Subject: Re: [PATCH v1 00/16] Basic StarFive JH7100 RISC-V SoC support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
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
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 14 Oct 2021 at 01:32, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Oct 12, 2021 at 3:41 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> >   dt-bindings: pinctrl: Add StarFive pinctrl definitions
> >   dt-bindings: pinctrl: Add StarFive JH7100 bindings
> >   pinctrl: starfive: Add pinctrl driver for StarFive SoCs
>
> I'd be happy to apply these to the pinctrl tree if everybody is
> happy.
> If you prefer some other merge path:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thank you, that sounds great to me. Let me post v2 to address Andy and
Geerts comments though.

/Emil
