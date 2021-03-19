Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F37E3427A9
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 22:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbhCSVZN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 17:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbhCSVZJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 17:25:09 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A813BC06175F;
        Fri, 19 Mar 2021 14:25:09 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so5478087pjb.2;
        Fri, 19 Mar 2021 14:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qRtsF/dRkOsgC7bXIOXSMSGDm3H0cggAXrtsiFsMryE=;
        b=Q/gXesbs6qytNhnbjEQMggXEdW34FDkgbW7dPaazjBWC2Yt/aVo4PgBim8fvcANFDm
         7YEOpNyesvvatHDj0WiAVnwde9wna+1lahc5R8jsfrB/SBfhJXg0lURUvNTuA8MRD4vP
         p1rN5wShfI89wwZyjxuXA8gBNOOsiTOHwTH56dPuhmBxYCV26YuhMFNA3ipa4j+w2NdZ
         xdMkq9ZBJoqBdd5DFuDXO9QWMoNllNoCYqD9NQ2mH7D/xHmj9GgYzfszF86sFndqauB+
         3IHOg645LvEV2BhPdUtuWeFpNAT0tPzjG1kiDF4W+gAsaTCjR/11m9AI7DM2R5wcGMU0
         lckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qRtsF/dRkOsgC7bXIOXSMSGDm3H0cggAXrtsiFsMryE=;
        b=OiNV4pWhbneJHXotIjfcexDNod7fNSjLo2fFeE9iZTA3Y25k6+GMJceynR7MFNNO2o
         frQXxZW45e00Xk+AnwwuGSO+2yHwNu0POrh6ODtFHpHuFZFKZKlHAtT4Ni2Rfl0TMutw
         JvP5mDKV3tRx9hB7ebN57K0g0lMvS6ZbOluYiCjT6J496YLdCCSDB/yDfmCU/scfXZr3
         aO0XQU+R1TpBLS6sTJ0XJvl+QPsaglSxOhxr8K8WLFk2Q7UE39nx+8xa/xa/6LADmQQ4
         3LShIP/FRq0iNZu09ohoZDLmPbnkOYs65s3+tZQD3MO2KUrSeBYHfcnLXt/9c2soGCPW
         9nuw==
X-Gm-Message-State: AOAM533GzM0wz40TsDB5Mi7y8TBn+YkWVTKgMJL5zhRxGyeyq6SQ9ILM
        ubLVT1xvC38lBPBqO4Kuc1bxgtyHpOQVzOXeUDobwK6n0LVOZQ==
X-Google-Smtp-Source: ABdhPJykzDalAhlv2UjBz6E9rWvDWdmqiZSWrtXLP+PlfMn5zRRPdwNAr22UAmgJ5E5UIDlDnm0v/wUPj/fVoPOb/Os=
X-Received: by 2002:a17:902:a406:b029:e6:78c4:71c8 with SMTP id
 p6-20020a170902a406b02900e678c471c8mr15987628plq.17.1616189108975; Fri, 19
 Mar 2021 14:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210315082339.9787-1-sander@svanheule.net> <20210315190806.66762-1-sander@svanheule.net>
 <20210315190806.66762-3-sander@svanheule.net> <CAHp75Vc6aaDhVN7LzvLNQjuOPguz+nbfmfpZ7TZHK=fNjCRz8w@mail.gmail.com>
 <a7d410216d35ed2b3015bfdd8e21dafd9c42d9d4.camel@svanheule.net>
 <CAHp75VdrqE0kBwzK9Jk7pZGjyfFnhatfa8UY0z-3T1w1PrbAbw@mail.gmail.com> <9d736f272aae42b154a4fdfbcadc1572ee82f516.camel@svanheule.net>
In-Reply-To: <9d736f272aae42b154a4fdfbcadc1572ee82f516.camel@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 19 Mar 2021 23:24:52 +0200
Message-ID: <CAHp75Vf=-WdJ3U6o1G-Xi4W7tkCzyij0FD3MNY1q0x6bkimxow@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: Add Realtek Otto GPIO support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bert Vermeulen <bert@biot.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 19, 2021 at 11:20 PM Sander Vanheule <sander@svanheule.net> wrote:
> On Fri, 2021-03-19 at 19:57 +0200, Andy Shevchenko wrote:
> > On Fri, Mar 19, 2021 at 5:51 PM Sander Vanheule
> > <sander@svanheule.net> wrote:
> > > On Wed, 2021-03-17 at 15:08 +0200, Andy Shevchenko wrote:
> > > > On Mon, Mar 15, 2021 at 11:11 PM Sander Vanheule <
> > > > sander@svanheule.net> wrote:

...

> > > > > +       return swab32(readl(ctrl->base +
> > > > > REALTEK_GPIO_REG_ISR));
> > > >
> > > > Why swab?! How is this supposed to work on BE CPUs?
> > > > Ditto for all swabXX() usage.
> > >
> > > My use of swab32/swahw32 has little to do with the CPU being BE or
> > > LE,
> > > but more with the register packing in the GPIO peripheral.
> > >
> > > The supported SoCs have port layout A-B-C-D in the registers, where
> > > firmware built with Realtek's SDK always denotes A0 as the first
> > > GPIO
> > > line. So bit 24 in a register has the value for A0 (with the
> > > exception
> > > of the IMR register).
> > >
> > > I wrote these wrapper functions to be able to use the BIT() macro
> > > with
> > > the GPIO line number, similar to how gpio-mmio uses ioread32be()
> > > when
> > > the BGPIOF_BIG_ENDIAN_BYTE_ORDER flag is used.
> > >
> > > For the IMR register, port A again comes first, but is now 16 bits
> > > wide
> > > instead of 8, with A0 at bits 16:17. That's why swahw32 is used for
> > > this register.
> > >
> > > On the currently unsupported RTL9300-series, the port layout is
> > > reversed: D-C-B-A. GPIO line A0 is then at bit 0, so the swapping
> > > functions won't be required. When support for this alternate port
> > > layout is added, some code will need to be added to differentiate
> > > between the two cases.
> >
> > Yes, you have different endianess on the hardware level, why not to
> > use the proper accessors (with or without utilization of the above
> > mentioned BGPIOF_BIG_ENDIAN_BYTE_ORDER)?
>
> The point I was trying to make, is that it isn't an endianess issue. I
> shouldn't have used a register with single byte values to try to
> illustrate that.
>
> Consider instead the interrupt masking registers. To write the IMR bits
> for port A (GPIO 0-7), a 16-bit value must be written. This value (e.g.
> u16 port_a_imr) is always BE, independent of the packing order of the
> ports in the registers:
>
>    // On RTL8380: port A is in the upper word
>    writew(port_a_imr, base + OFFSET_IMR_AB);
>
>    // On RTL9300: port A is in the lower word
>    writew(port_a_imr, base + OFFSET_IMR_AB + 2);
>
> I want the low GPIO lines to be in the lower half-word, so I can
> manipulate GPIO lines 0-15 with simple mask and shift operations.
>
> It just so happens, that all registers needed by bgpio_init contain
> single-byte values. With BGPIO_BIG_ENDIAN_BYTE_ORDER  the port order is
> reversed as required, but it's a bit of a misnomer here.

How many registers (per GPIO / port) do you have?
Can you list them and show endianess of the data for each of them and
for old and new hardware (something like a 3 column table)?

-- 
With Best Regards,
Andy Shevchenko
