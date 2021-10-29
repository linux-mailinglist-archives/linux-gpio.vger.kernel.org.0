Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 476BC43FCD8
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 15:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbhJ2NCr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 09:02:47 -0400
Received: from mail-pl1-f174.google.com ([209.85.214.174]:34756 "EHLO
        mail-pl1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbhJ2NCq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Oct 2021 09:02:46 -0400
Received: by mail-pl1-f174.google.com with SMTP id r5so6792891pls.1;
        Fri, 29 Oct 2021 06:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vci1DyK0tNZcKwN8+74I1l8VTd7Fc9WtyWPYQLOUtNM=;
        b=d66PWdxVVP78tzUD5V0VkUAvR1NUY/r435jpc5ovvOhSB8/bkHxypaFQTd7jbX3lIf
         cRplV07dxxlfacUyzLht6kw1eCzwvIcycgBj5nbVk9jU11ZJhvpBPBMRBbvS5QtYNUM4
         rYMfP5SxFzfAXJEjlT5KmmqITpRQUu8MReNYBrPWyJP5l/M+EU2Q0MrIC+FetueqAyB6
         5vrV/CL0YMjH9Snly4/8LGsTmna6d/2RSJSlXHxHFt9mntjNYen9ZL/tx/4y9DXQqyJS
         EN3d5fux0EYuNY824n53kVKl57IprUORl9XUnFxOZUm1b744nwHcvm+Ht6fzuLRX2qUl
         JajQ==
X-Gm-Message-State: AOAM532FZEoPiO/1UKIBnkC2RqtFhCsMkZoNl91XMJ2AQOF30SfFek/c
        +AvjX9NXfW3/N3U41lzE+xDlWnkqixXr2yP4zn0=
X-Google-Smtp-Source: ABdhPJxsp4eURPFfgHBqWP+J4XlcL6ko0y3ikmW0sFVG++7P+Et7Yhh+lE5BR8RUsKI/L2xnep1G6HRqNfFSCc/WsFk=
X-Received: by 2002:a17:903:11c5:b0:13f:ef40:e319 with SMTP id
 q5-20020a17090311c500b0013fef40e319mr9604054plh.33.1635512418019; Fri, 29 Oct
 2021 06:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-12-kernel@esmil.dk>
 <YXtTUGC5P41JtvoR@robh.at.kernel.org>
In-Reply-To: <YXtTUGC5P41JtvoR@robh.at.kernel.org>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Fri, 29 Oct 2021 15:00:05 +0200
Message-ID: <CANBLGcx3L1DmqjzqRAb+vEYWZTTxeGNUVx=BUfDuw=h3q5Nkgg@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] dt-bindings: pinctrl: Add StarFive JH7100 bindings
To:     Rob Herring <robh@kernel.org>
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

On Fri, 29 Oct 2021 at 03:50, Rob Herring <robh@kernel.org> wrote:
> On Thu, Oct 21, 2021 at 07:42:18PM +0200, Emil Renner Berthing wrote:
> > +patternProperties:
> > +  '-[0-9]*$':
>
> Can you make this more specific. As-is, '-' and 'foo-' are valid.
>
> > +    type: object
> > +    patternProperties:
> > +      '-pins*$':
>
> So foo-pinsssssss is okay? Drop the '*' or use ? if you intend to
> support 'foo-pin'.

Ah, thanks. Both this and the pattern above was taken from
pinctrl/mediatek,mt6779-pinctrl.yaml if anyone feels like fixing that
too. I see now that '-[0-9]+$' and '-pins$' is more common. I'll just
use that.

> > +        type: object
> > +        description: |
> > +          A pinctrl node should contain at least one subnode representing the
> > +          pinctrl groups available on the machine. Each subnode will list the
> > +          pins it needs, and how they should be configured, with regard to
> > +          muxer configuration, bias, input enable/disable, input schmitt
> > +          trigger enable/disable, slew-rate and drive strength.
> > +        $ref: "/schemas/pinctrl/pincfg-node.yaml"
> > +
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
> > +
> > +          bias-disable: true
> > +
> > +          bias-pull-up:
> > +            type: boolean
>
> Already has a type. Need to reference the common schema.

Right, but the common schema specifies one of boolean or uint32. Is
there a way to reference that, but still say that this binding
supports only the boolean version?
