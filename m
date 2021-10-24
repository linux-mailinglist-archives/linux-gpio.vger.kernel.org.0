Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70DFD438C75
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 01:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhJXXNm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 19:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbhJXXNl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 19:13:41 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FB7C061745
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 16:11:19 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id u5so8681686ljo.8
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 16:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1vsRSHd5ol8s+6s2RmI1HSUriW3Srp1b0zXswHBU7Sk=;
        b=Fbe4EIds06j7G15aUzedORb13lKIjQ6UiPypMt2r3Za3UkwMy3eZjMeqrH72ZYFrTs
         r8q7Xz0FkqCRKj57sd4OSEzXDwuhh3wq32AKWpty61ch5UA/SFwkpc+7dDPJEdkrrbAE
         mVDrQsy3h3IongKhzglUoxh8y3AIsZA27Fq6xk2oaDprAjT9vW1Xox4IaQisRGixQYr5
         OqySCDG5ZsJMLA8aSr6+JqAwIRDuHGCbAlt4SA3g6LphVfONBIDlGoYC7VW/MfBllOq+
         yZt55HEO30faBn4r38/QxRyweFJ9NRLRmVtzqWNka692YwBWW15nQAEUQ8dEWs9C18+9
         FtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1vsRSHd5ol8s+6s2RmI1HSUriW3Srp1b0zXswHBU7Sk=;
        b=kIKdou7HgDMbYJYF/iL1xDDm2kAnwZR8dIPY34rfaXaUaY2LMtB+f/YlA4FszUF3zY
         Y0lGzxJQAXEl9QM+zr1OaMrXG7zeTBb4mteDm2vw2dIP/ANKGXWF94e7hnNd2arM7YFY
         ItUEFS6m4K9qpFOc/+BGZU7nCks5LSi07Get3omgwUnbo0zESnc+eWJHgujBPk3Yyin1
         e44yKK5sEKjxpyNUxDlyS9PbSHFH9o3YzznzElCdV2jdv3bN9WgnqpsmD3vt7Dl/OpMm
         PeqGhKX0PIPN2P8gTpQc9xEXPhTWawwrXPihQQyIVD2TYOBVsgTiJ6KQzYliNDnZNj3R
         Nacw==
X-Gm-Message-State: AOAM532YWWYI7dHssFxF4qiOg8U+f05ld3sXaHWps/sWjEJWGPVup0v7
        CqYvAuwhOuOLaHIJVO4umcC3Qhi2BAPOQoj8Mx6kSg==
X-Google-Smtp-Source: ABdhPJxpFfDTust0osAQmfxwkSpS6S7VhiwJS8EWyFLBIURethZXfMtoI8uRXG2acFxprQg+kqMuagHZV9BMfu8ocAA=
X-Received: by 2002:a05:651c:111:: with SMTP id a17mr14808602ljb.145.1635117078094;
 Sun, 24 Oct 2021 16:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-12-kernel@esmil.dk>
In-Reply-To: <20211021174223.43310-12-kernel@esmil.dk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 Oct 2021 01:11:06 +0200
Message-ID: <CACRpkdYZzKtFcBUM8sV4uze2T_EbfOGG=QkO9miDKKq=1mws_A@mail.gmail.com>
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

On Thu, Oct 21, 2021 at 7:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

> Add bindings for the StarFive JH7100 GPIO/pin controller.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

That is a very terse commit message for an entirely new
SoC, please put a little blurb about this silicon there.
Like mention that it is RISC-V at least.

Overall quite interesting!

> +$id: http://devicetree.org/schemas/pinctrl/starfive,jh7100-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7100 Pin Controller Device Tree Bindings
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +  - Drew Fustini <drew@beagleboard.org>

Add description: talking about that this is a RISC-V SoC
and other implicit things that are really good to know.

> +  starfive,signal-group:
> +    description: |
> +      The SoC has a global setting selecting one of 7 different pinmux
> +      configurations of the pads named GPIO[0:63] and FUNC_SHARE[0:141]. After
> +      this global setting is chosen only the 64 "GPIO" pins can be further
> +      muxed by configuring them to be controlled by certain peripherals rather
> +      than software.
> +      Note that in configuration 0 none of GPIOs are routed to pads, and only
> +      in configuration 1 are the GPIOs routed to the pads named GPIO[0:63].
> +      If this property is not set it defaults to the configuration already
> +      chosen by the earlier boot stages.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3, 4, 5, 6]

This still is hard for me to understand. Does it mean that 0..6 define
how the direct-to-peripheral-pins are set up?

Then it would make sense to describe what happens for 0, 1, 2 ...6
i.e. what the different set-ups are.

Actually this is what we call group-based pin multiplexing in Linux,
this property seems to avoid using that concept.
See for example:
Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt

> +    patternProperties:
> +      '-pins*$':
> +        type: object
> +        description: |
> +          A pinctrl node should contain at least one subnode representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to
> +          muxer configuration, bias, input enable/disable, input schmitt
> +          trigger enable/disable, slew-rate and drive strength.
> +        $ref: "/schemas/pinctrl/pincfg-node.yaml"

Nice that you use pincfg-node.yaml

> +        properties:
> +          pins:
> +            description: |
> +              The list of pin identifiers that properties in the node apply to.
> +              This should be set using either the PAD_GPIO or PAD_FUNC_SHARE
> +              macro. Either this or "pinmux" has to be specified.
> +
> +          pinmux:
> +            description: |
> +              The list of GPIO identifiers and their mux settings that
> +              properties in the node apply to. This should be set using the
> +              GPIOMUX macro. Either this or "pins" has to be specified.

What about referencing
Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
for this?

Yours,
Linus Walleij
