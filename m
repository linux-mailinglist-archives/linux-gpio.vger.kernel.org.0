Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160DE3BA4EC
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 23:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbhGBVGl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 17:06:41 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:44594 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbhGBVGl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jul 2021 17:06:41 -0400
Received: by mail-ua1-f53.google.com with SMTP id e7so4305794uaj.11;
        Fri, 02 Jul 2021 14:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=am8+HGg2rzwAzZtDCa3feVxjiR1gxNCYI2yi6bvS4ck=;
        b=I7+hgmIyzt1FDw2ry/kTl68G48M0WsqVs97WFrVT4zh6sZ/cRZkFZ3/0F2L6LBqvSP
         9sZUp0svM3O/Gcyv5C7cl1eNFxwYyQv52X6pY0RwgHjc9/D9AFOOJbC8+3ZfflXAlXhg
         X7fol4LhekmGPYBS69429cLbF1TZbR+lWZvk0vw/B4bIsE457lzRJo59RMt9Br51FlaY
         ctJmPdzJhQO2Sp9/3a+HDibZUiGV1VmTlE7kzl7bQBPZP0laPfnQUGjGZneHCWhZX2rv
         JdEREXXUbQealk4Hd9FXP73mSIkrO8NoJcI2XU5T+oKa6vxWxua+0AOdFVnhpBqCkmqi
         9y5w==
X-Gm-Message-State: AOAM533z+5M/jR1sMzshE+O6o+7WSW9NOA2xlyVuV3PBI7o3n6AW5GKe
        KT2QgPqJER7Bz3ufqEF/LMI/zkbEc6V1KMyRQs0=
X-Google-Smtp-Source: ABdhPJyYAogpMHL9EEPH/e0Ojh4/p+fjlWhyB+Ol/kB9Yd9pDY/cIxHD8hf1fkgS8xt/3BDdTxaWLU8Eun44DNhTqjA=
X-Received: by 2002:ab0:71c1:: with SMTP id n1mr2496612uao.2.1625259848048;
 Fri, 02 Jul 2021 14:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210701002037.912625-1-drew@beagleboard.org> <20210701002037.912625-2-drew@beagleboard.org>
 <CAMuHMdWLNy6_CnFEYDvHSEdMYH=T_Fy=DCjZCF9kPGWcD-B0Qw@mail.gmail.com> <20210702205622.GA1035183@x1>
In-Reply-To: <20210702205622.GA1035183@x1>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Jul 2021 23:03:56 +0200
Message-ID: <CAMuHMdXiebr7SnpShhcN9BPyha+=n=cNiX88q0wMVLrDY0r=qA@mail.gmail.com>
Subject: Re: [RFC PATH 1/2] dt-bindings: gpio: add starfive,jh7100-gpio bindings
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Huan Feng <huan.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Drew,

On Fri, Jul 2, 2021 at 10:56 PM Drew Fustini <drew@beagleboard.org> wrote:
> On Thu, Jul 01, 2021 at 10:34:56AM +0200, Geert Uytterhoeven wrote:
> > On Thu, Jul 1, 2021 at 2:22 AM Drew Fustini <drew@beagleboard.org> wrote:
> > > Add bindings for the GPIO controller in the StarFive JH7100 SoC [1].
> > >
> > > [1] https://github.com/starfive-tech/beaglev_doc
> > >
> > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
> > > @@ -0,0 +1,60 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/gpio/starfive,jh7100-gpio.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: StarFive JH7100 GPIO controller
> > > +
> > > +maintainers:
> > > +  - Huan Feng <huan.feng@starfivetech.com>
> > > +  - Drew Fustini <drew@beagleboard.org>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: starfive,jh7100-gpio
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    description:
> > > +      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
> > > +    minItems: 1
> > > +    maxItems: 32
> >
> > What about clocks and resets?
>
> Thank you for your feedback, Geert.
>
> GPIO controller uses clk_apb1_bus under dom0_sys.  I believe the device
> tree node would use something like this:
>
>   clocks = <&clkgen JH7100_CLK_APB1>;
>
> I see the sifive-gpio.yaml has:
>
>   clocks:
>     maxItems: 1
>
> Would that be the correct way to do it for the starfive gpio yaml?

Yep.

> The reset for GPIO controller is presetn under dom_sys.  Do you think
> know you know an example that has reset in the YAML?  Is there some code
> that would actually make use of that information?
>
> >
> > > +
> > > +  gpio-controller: true
> > > +
> > > +  "#gpio-cells":
> > > +    const: 2
> > > +
> > > +  interrupt-controller: true
> > > +
> > > +  "#interrupt-cells":
> > > +    const: 2
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - interrupt-controller
> > > +  - "#interrupt-cells"
> > > +  - "#gpio-cells"
> > > +  - gpio-controller
>
> Do you think I should add 'clocks' to 'required:'?

I'm still having issues with i2c if the GPIO block lists a clock, due to
fw_devlink dependencies.

> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +      gpio@11910000 {
> > > +        compatible = "starfive,jh7100-gpio";
> > > +        reg = <0x11910000 0x10000>;
> > > +        gpio-controller;
> > > +        #gpio-cells = <2>;
> > > +        interrupt-controller;
> > > +        #interrupt-cells = <2>;
> > > +        interrupts = <32>;
>
> I would add:
>
>   clocks = <&clkgen JH7100_CLK_APB1>;
>
> But I am not sure how reset would work?

That should become "resets = <&rstgen JH7100_RSTN_GPIO_APB>",
but we don't have the reset controller in Linux yet (we do in barebox).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
