Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB631438CD2
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 02:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbhJYAib (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 20:38:31 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:43781 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbhJYAi0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 20:38:26 -0400
Received: by mail-pf1-f172.google.com with SMTP id 187so9060599pfc.10;
        Sun, 24 Oct 2021 17:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2qH0EkjmGBqZqzNWAd5xakY+DAqcPlo0/17L+watSFo=;
        b=xYjCDeGXzElczrJq4/5CpPeaUIsLRkPrCFmX60Ip2DKd4UGdW991GssP04e5jSmWdV
         K8QY87yueWwhta5+a+PeqXM8SmzGMGbRX87sWtRdiNyyA39euhoUZ4tcVvTQLpgWNdK8
         p9VR4dnh9OhZeHQwL0BOUVm2sRSFQWZkyxbyVMNgcsqxiCb24vlX+hF+hnzHO+Wesq1r
         nCySeY3ewkLX7S6cfGREyYSwAlA6XscGoLs964WjILxJaGzQyc//+n/Ex9SBADbWXnq0
         q9PZ8BYbSvhE3TS6am4aYM2leMGEHHsF4OJcuufHfQh1X9msHxcykrcUWqLNiTgpb+IA
         Ktsw==
X-Gm-Message-State: AOAM532N5BNqC7YrBOnRSzlMcF9QoDMzatAXb6BV825yBT2HXZn9YsA5
        U0Nfm7mUrpL/bWUotLvIaM0sqzbu9qEUg6Khdm+/bR9L3SCbMQ==
X-Google-Smtp-Source: ABdhPJzl54zpKV3sQ8JY+vUbzNFdI4ziqWls7u/hP7OYNEq6resMPJD1kH5xqGf6CGbcj8bF7QSTME7U2/JD7t9HACg=
X-Received: by 2002:a63:b11:: with SMTP id 17mr11021028pgl.51.1635122163670;
 Sun, 24 Oct 2021 17:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-12-kernel@esmil.dk>
 <CACRpkdYZzKtFcBUM8sV4uze2T_EbfOGG=QkO9miDKKq=1mws_A@mail.gmail.com>
In-Reply-To: <CACRpkdYZzKtFcBUM8sV4uze2T_EbfOGG=QkO9miDKKq=1mws_A@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Mon, 25 Oct 2021 02:35:52 +0200
Message-ID: <CANBLGczuVgT30OGDSN=4WcX8AgpoTQc5goUg23YY859T8axkRQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] dt-bindings: pinctrl: Add StarFive JH7100 bindings
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
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 25 Oct 2021 at 01:11, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Oct 21, 2021 at 7:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> > Add bindings for the StarFive JH7100 GPIO/pin controller.
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>
> That is a very terse commit message for an entirely new
> SoC, please put a little blurb about this silicon there.
> Like mention that it is RISC-V at least.

Will do!

> Overall quite interesting!
>
> > +$id: http://devicetree.org/schemas/pinctrl/starfive,jh7100-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JH7100 Pin Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Emil Renner Berthing <kernel@esmil.dk>
> > +  - Drew Fustini <drew@beagleboard.org>
>
> Add description: talking about that this is a RISC-V SoC
> and other implicit things that are really good to know.

Gotcha.

> > +  starfive,signal-group:
> > +    description: |
> > +      The SoC has a global setting selecting one of 7 different pinmux
> > +      configurations of the pads named GPIO[0:63] and FUNC_SHARE[0:141]. After
> > +      this global setting is chosen only the 64 "GPIO" pins can be further
> > +      muxed by configuring them to be controlled by certain peripherals rather
> > +      than software.
> > +      Note that in configuration 0 none of GPIOs are routed to pads, and only
> > +      in configuration 1 are the GPIOs routed to the pads named GPIO[0:63].
> > +      If this property is not set it defaults to the configuration already
> > +      chosen by the earlier boot stages.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1, 2, 3, 4, 5, 6]
>
> This still is hard for me to understand. Does it mean that 0..6 define
> how the direct-to-peripheral-pins are set up?

Yeah, so the SoC has many pins, but only the pins named GPIO[0:63] and
FUNC_SHARE[0:141] can be muxed. To do that you first select one of 7
different "signal groups". This is a global setting. There is just a
single register on the whole SoC where you write either 0, 1, .., or
6. As an example signal group 6 maps LCD output to FUNC_SHARE[40:97],
ethernet phy connection to FUNC_SHARE[115:141], MIPI to GPIO[0:60] and
confusingly it maps "GPIO0", "GPIO1", ..., "GPIO63" to pins
FUNC_SHARE[0:63]. So the pin names doesn't necessarily match the
function. In fact only signal group 1 maps GPIO0-63 to pins
GPIO[0:63]. See table 11-1 starting on page 62 of this PDF:
https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Data%20Sheet%20V01.01.04-EN%20(4-21-2021).pdf

GPIO0-63 can of course be used as GPIOs, but they can also have their
output value and output enable controlled by certain (slow)
peripherals like UARTs, I2C, SPI, PWM etc. These can be chosen freely.
So once you've chosen signal group 6, you can have any of GPIO0-GPIO63
(that is any of pins FUNC_SHARE[0:63]) be controlled by the UART0 TX
signal fx.

So for each of GPIO0 to GPIO63 there is a register to select the
output value signal and a register to select its output enable signal.
You can see the list of signals to choose from in the header
introduced in the previous patch.

Input from GPIO0-63 to peripherals works the other way around. Here
there is a register for each input signal, where you can select which
(if any) of GPIO0-63 is routed to the peripheral.

> Then it would make sense to describe what happens for 0, 1, 2 ...6
> i.e. what the different set-ups are.

Yeah, so how much of table 11-1 does it make sense to write out.
Certainly I can list how GPIO0-63 are mapped to pins for each of the 7
signal groups, but should I also list LCD, ethernet, interconnect,
mipi etc. for each of the 7 signal groups?

> Actually this is what we call group-based pin multiplexing in Linux,
> this property seems to avoid using that concept.
> See for example:
> Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt

I don't think this is the same, but hope you can tell me after reading
the description above.

> > +    patternProperties:
> > +      '-pins*$':
> > +        type: object
> > +        description: |
> > +          A pinctrl node should contain at least one subnode representing the
> > +          pinctrl groups available on the machine. Each subnode will list the
> > +          pins it needs, and how they should be configured, with regard to
> > +          muxer configuration, bias, input enable/disable, input schmitt
> > +          trigger enable/disable, slew-rate and drive strength.
> > +        $ref: "/schemas/pinctrl/pincfg-node.yaml"
>
> Nice that you use pincfg-node.yaml
>
> > +        properties:
> > +          pins:
> > +            description: |
> > +              The list of pin identifiers that properties in the node apply to.
> > +              This should be set using either the PAD_GPIO or PAD_FUNC_SHARE
> > +              macro. Either this or "pinmux" has to be specified.
> > +
> > +          pinmux:
> > +            description: |
> > +              The list of GPIO identifiers and their mux settings that
> > +              properties in the node apply to. This should be set using the
> > +              GPIOMUX macro. Either this or "pins" has to be specified.
>
> What about referencing
> Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
> for this?

Sure. You just mean adding $ref: like above right?

Thanks!
/Emil
