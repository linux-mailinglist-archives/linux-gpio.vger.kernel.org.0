Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4466B43FE9D
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 16:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhJ2OrN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 10:47:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:45970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229511AbhJ2OrM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Oct 2021 10:47:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C884611CB;
        Fri, 29 Oct 2021 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635518684;
        bh=JXq063lxP5NdObYVfsylEOeDpQ9heda2NljDpPAKCVY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pwIj0TbCChJdPc7ZRljY9/z91EdKF/FwQJvaAalrsJxPz7mrgEECL8PcZXoM9vSl5
         tYKW3kl6h1zRV+580CPZdqJwcC0mw6W+o+ZZbRd830NMSOkU1TV7zkeLsL5WBoGhlP
         sp0xydfFgSaSocdQEPLvSMWwVvpCSw3hNHIBuviafOjJna+lSAZPCTKJiA7EbsrCLN
         4aQedFp+HHqccwyRw2wWrHtYFaQ5I8JOF0SO2x3v6j8PTmaIB40QXYSwTqRqG6VcQn
         dFvDh1pEMaJDqJQT0hcxcLWp7wCQvTtXSOiELuxnprUksK+wuAPSnMeVggopNPf6vZ
         rRKI5ksr0b0xg==
Received: by mail-ed1-f45.google.com with SMTP id w15so39627795edc.9;
        Fri, 29 Oct 2021 07:44:44 -0700 (PDT)
X-Gm-Message-State: AOAM531mNebXHUeGaT/+cJQTCkynfd2/TieWRN2b3OfY/h/on8j8yzfG
        TpjMPzJyL3tiO8qwmI3DCXhClAk1HRhRKzKaeg==
X-Google-Smtp-Source: ABdhPJzgKku5UI29pWp+EBd22f3zuolB3qfN6dXWo83KbECOM1/m8h0OEK7iECxDyOFCsyGMYpk0WwXYpKdvn2KU2O0=
X-Received: by 2002:a17:906:d553:: with SMTP id cr19mr13689318ejc.128.1635518682351;
 Fri, 29 Oct 2021 07:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-12-kernel@esmil.dk>
 <YXtTUGC5P41JtvoR@robh.at.kernel.org> <CANBLGcx3L1DmqjzqRAb+vEYWZTTxeGNUVx=BUfDuw=h3q5Nkgg@mail.gmail.com>
In-Reply-To: <CANBLGcx3L1DmqjzqRAb+vEYWZTTxeGNUVx=BUfDuw=h3q5Nkgg@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 29 Oct 2021 09:44:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLBZV6ADY-B+3HCkxT1KpBJ5s3kcUfewSYf_rJ8HTu9Mw@mail.gmail.com>
Message-ID: <CAL_JsqLBZV6ADY-B+3HCkxT1KpBJ5s3kcUfewSYf_rJ8HTu9Mw@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] dt-bindings: pinctrl: Add StarFive JH7100 bindings
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
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

On Fri, Oct 29, 2021 at 8:00 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> On Fri, 29 Oct 2021 at 03:50, Rob Herring <robh@kernel.org> wrote:
> > On Thu, Oct 21, 2021 at 07:42:18PM +0200, Emil Renner Berthing wrote:
> > > +patternProperties:
> > > +  '-[0-9]*$':
> >
> > Can you make this more specific. As-is, '-' and 'foo-' are valid.
> >
> > > +    type: object
> > > +    patternProperties:
> > > +      '-pins*$':
> >
> > So foo-pinsssssss is okay? Drop the '*' or use ? if you intend to
> > support 'foo-pin'.
>
> Ah, thanks. Both this and the pattern above was taken from
> pinctrl/mediatek,mt6779-pinctrl.yaml if anyone feels like fixing that
> too. I see now that '-[0-9]+$' and '-pins$' is more common. I'll just
> use that.
>
> > > +        type: object
> > > +        description: |
> > > +          A pinctrl node should contain at least one subnode representing the
> > > +          pinctrl groups available on the machine. Each subnode will list the
> > > +          pins it needs, and how they should be configured, with regard to
> > > +          muxer configuration, bias, input enable/disable, input schmitt
> > > +          trigger enable/disable, slew-rate and drive strength.
> > > +        $ref: "/schemas/pinctrl/pincfg-node.yaml"
> > > +
> > > +        properties:
> > > +          pins:
> > > +            description: |
> > > +              The list of pin identifiers that properties in the node apply to.
> > > +              This should be set using either the PAD_GPIO or PAD_FUNC_SHARE
> > > +              macro. Either this or "pinmux" has to be specified.
> > > +
> > > +          pinmux:
> > > +            description: |
> > > +              The list of GPIO identifiers and their mux settings that
> > > +              properties in the node apply to. This should be set using the
> > > +              GPIOMUX macro. Either this or "pins" has to be specified.
> > > +
> > > +          bias-disable: true
> > > +
> > > +          bias-pull-up:
> > > +            type: boolean
> >
> > Already has a type. Need to reference the common schema.
>
> Right, but the common schema specifies one of boolean or uint32. Is
> there a way to reference that, but still say that this binding
> supports only the boolean version?

Okay, then keep this.

Rob
