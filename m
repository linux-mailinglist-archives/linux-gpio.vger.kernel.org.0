Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A109F3BA7E9
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jul 2021 10:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhGCIwi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Jul 2021 04:52:38 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:37860 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbhGCIwh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Jul 2021 04:52:37 -0400
Received: by mail-vs1-f42.google.com with SMTP id r24so1639324vsg.4;
        Sat, 03 Jul 2021 01:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ztvTWAqkHN2mDtjML2AdkD2LHf36o5PEQqo09qwLkPY=;
        b=VbNHRivAOWRQuNbOBkFVY4Nk8lTQmUuaGckyKlEHwlLJSVJx1lpxXtxLeCs+lmEwV/
         ClQozK2JfMFhgl0K1pJ4aAajetRO958Aj0TvzDIBfNfNTrASngUFQBRXYwsJw4xgIw10
         fgouUpVyz8y+iVBE8Tqs6JZTdsc3oDLy9mb7FOvH03adSCV/5SLzYY96d3TDQGkxnKD3
         wBr7ETfDBwqvHK+0exNuLf2LtZgiP5QN1GthSw4P6plTcAQdZeh4UcSnkYDpwbSBZ3OR
         ofkCAbCm2rziaRdCbRtStPhdlzmc69hOLDwbYKOCw+nuSRWdFO5vwZ5AjsYKXcy2r4K5
         fzWw==
X-Gm-Message-State: AOAM530553P6BEa/3mxIZKMMGIjHOoP2OQVYhOGBQLQsdZY6bRMFUnBi
        2Q4mwBeeIEzwKaQ9XT5nCyLGEDRCyx0dHiT3ta4=
X-Google-Smtp-Source: ABdhPJyuUXkzJRe7nyGQY7VgkmHMTPL/ZKX7ox8bFgwnO/Xk8lPPexJD9V2v7FD0qLeUSgwjtNu/9IKshQ+B396Uvoc=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr3311187vsd.42.1625302203003;
 Sat, 03 Jul 2021 01:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210701002037.912625-1-drew@beagleboard.org> <20210701002037.912625-2-drew@beagleboard.org>
 <CAMuHMdWLNy6_CnFEYDvHSEdMYH=T_Fy=DCjZCF9kPGWcD-B0Qw@mail.gmail.com>
 <20210702205622.GA1035183@x1> <CAMuHMdXiebr7SnpShhcN9BPyha+=n=cNiX88q0wMVLrDY0r=qA@mail.gmail.com>
 <20210703064600.GA1050194@x1>
In-Reply-To: <20210703064600.GA1050194@x1>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 3 Jul 2021 10:49:51 +0200
Message-ID: <CAMuHMdVTj-TLZz=ieW648cqV4fWBHb4nnt59N5EEFw2qZ0jbaA@mail.gmail.com>
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

On Sat, Jul 3, 2021 at 8:46 AM Drew Fustini <drew@beagleboard.org> wrote:
> On Fri, Jul 02, 2021 at 11:03:56PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jul 2, 2021 at 10:56 PM Drew Fustini <drew@beagleboard.org> wrote:
> > > On Thu, Jul 01, 2021 at 10:34:56AM +0200, Geert Uytterhoeven wrote:
> > > > On Thu, Jul 1, 2021 at 2:22 AM Drew Fustini <drew@beagleboard.org> wrote:
> > > > > Add bindings for the GPIO controller in the StarFive JH7100 SoC [1].
> > > > >
> > > > > [1] https://github.com/starfive-tech/beaglev_doc
> > > > >
> > > > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > > > > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
> > > > > @@ -0,0 +1,60 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/gpio/starfive,jh7100-gpio.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: StarFive JH7100 GPIO controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Huan Feng <huan.feng@starfivetech.com>
> > > > > +  - Drew Fustini <drew@beagleboard.org>
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    items:
> > > > > +      - const: starfive,jh7100-gpio
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupts:
> > > > > +    description:
> > > > > +      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
> > > > > +    minItems: 1
> > > > > +    maxItems: 32
> > > >
> > > > What about clocks and resets?

> > > But I am not sure how reset would work?
> >
> > That should become "resets = <&rstgen JH7100_RSTN_GPIO_APB>",
> > but we don't have the reset controller in Linux yet (we do in barebox).
>
> Do you think I should add reset item like this?
>
>   resets:
>     maxItems: 1
>
> I suppose this is supposed to describe the hardware and it shouldn't
> matter whether or not Linux uses the property, right?

Exactly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
