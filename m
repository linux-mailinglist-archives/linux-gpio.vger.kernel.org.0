Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502B23E1803
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 17:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241881AbhHEPau (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 11:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239933AbhHEPat (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Aug 2021 11:30:49 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B076C061798
        for <linux-gpio@vger.kernel.org>; Thu,  5 Aug 2021 08:30:35 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id n22so3300763vsq.11
        for <linux-gpio@vger.kernel.org>; Thu, 05 Aug 2021 08:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2HwiUKZxqy53dDfBp1901/849S4t5mjJtJjeA2wMPec=;
        b=wg/GjsYLif0ZYYHMg3KnRLOxv3tYLMjO5yw61rpFo2U6f/PHccXPTRMbf7TjDmFtIy
         SaTMUBl6mtykhQHxwVxwXJdpsqEsHECguuguS4suj2+mcgflMfdF0s+ZKBY/mMwQDdPU
         akilIu+Sq0Sui1mKolQYpIPGxSkmZDxq5dA+WIymASwSwHXudWOYS2o/qCTkvAHocnl3
         C/RrpZm24VqvSY06dlB6yx07zS4xtnbXplFKA/cAVOVuu+r+47pbvV9OUzUTh6gqIuEK
         Ra4N9BqLgbBx/+PV59gv17Jp1pvOjvaqtB6MrhpxChT5YJ6s07YTularepv+VbeBnprM
         biwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2HwiUKZxqy53dDfBp1901/849S4t5mjJtJjeA2wMPec=;
        b=EqGQzc5vyr3RnBk0WrkotNhjzmcuhAZAfu7rs07oOly7uVUKUmtBxLjHU5+jH2ijrf
         jvlb4g4/b6fMOxsEC02HXs7vEUScqrlEsBUIj1YUex8GtzY7NuUS5T3mIkD060BJN92P
         6R6A7OnaPeKYzEZfigacBaoYj/0ug+O9XKRt8ZZlQSaB+2pa8+hUGPKvjrSfL4cVR0oW
         lquYpqIbCSrQqzFhNurQHVstOFNhSuNTKsVjabn9BFCdD13V56TxTGa6LfbqIE2eCT1I
         f9FmNUe01WaFv1nmJAIOkmFISnXH3MWLjXa9AT5TbM9O+pYHCP2+HbVkYp0Aj2keXaSv
         0prg==
X-Gm-Message-State: AOAM530uLn1F5vXIQbLd82R/Gk8KUNqvHgHqNLRsgTKBKggCFQRQ5Jjj
        35YTUQp4fDRZE8J4XcVUv/hQz7MpFCK+1UDLu/Mg1w==
X-Google-Smtp-Source: ABdhPJz7ndSuSpMNkkGlw9G/nEeHBUu9O9atQyI5vE3atZWBaEoYd/rSmKp8dYwaj/T41dDFjGZta+VdrhSjdEuiiNo=
X-Received: by 2002:a67:de06:: with SMTP id q6mr5210772vsk.57.1628177434529;
 Thu, 05 Aug 2021 08:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-13-semen.protsenko@linaro.org> <15871f8ced3c757fad1ab3b6e62c4e64@misterjones.org>
 <CAPLW+4=v4bDcuxGVqs06mobGj34At4cD+vg48b4dPujarS07Tg@mail.gmail.com>
 <87k0l1w8y5.wl-maz@kernel.org> <CAPLW+4mMF9B2BiY2hTgHz5=DNbDJZ7TDzt=Xefb5tDKwQhpEew@mail.gmail.com>
 <87y29gbas7.wl-maz@kernel.org>
In-Reply-To: <87y29gbas7.wl-maz@kernel.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 5 Aug 2021 18:30:23 +0300
Message-ID: <CAPLW+4nCfSBfwMcemaVvU5MgBACgnhXaW9eAAjw66G6Zhz2Gbw@mail.gmail.com>
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
To:     Marc Zyngier <maz@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 5 Aug 2021 at 10:39, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 04 Aug 2021 19:37:24 +0100,
> Sam Protsenko <semen.protsenko@linaro.org> wrote:
> >
> > On Wed, 4 Aug 2021 at 18:01, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Wed, 04 Aug 2021 15:39:38 +0100,
> > > Sam Protsenko <semen.protsenko@linaro.org> wrote:
> > >
> > > > > You are also missing the hypervisor virtual timer interrupt.
> > > > >
> > > >
> > > > Checked SoC TRM, there is no PPI for hypervisor virtual timer
> > > > interrupt, and no mentioning of it at all. Likewise, I checked ARMv8
> > > > ARM and TRM, almost no description of it. Also, I checked other
> > > > platforms, and seems like everyone does the same (having only 4
> > > > interrupts). And I wasn't able to find any documentation on that, so I
> > > > guess I'll leave it as is, if you don't mind.
> > >
> > > I *do* mind, and other DTs being wrong isn't a good enough excuse! ;-)
> > >
> > > From the ARMv8 ARM (ARM DDI 0487G.b)
> > > <quote>
> > > D11.2.4 Timers
> > >
> > > In an implementation of the Generic Timer that includes EL3, if EL3
> > > can use AArch64, the following timers are implemented:
> > >
> > > * An EL1 physical timer, that:
> > >   - In Secure state, can be accessed from EL1.
> > >   - In Non-secure state, can be accessed from EL1 unless those
> > >     accesses are trapped to EL2.
> > >     When this timer can be accessed from EL1, an EL1 control
> > >     determines whether it can be accessed from EL0.
> > > * A Non-secure EL2 physical timer.
> > > * A Secure EL3 physical timer. An EL3 control determines whether this
> > >   register is accessible from Secure EL1.
> > > * An EL1 virtual timer.
> > > * When FEAT_VHE is implemented, a Non-secure EL2 virtual timer.
> > > * When FEAT_SEL2 is implemented, a Secure EL2 physical timer.
> > > * When FEAT_SEL2 is implemented, a Secure EL2 virtual timer.
> > > </quote>
> > >
> > > Cortex-A55 being an ARMv8.2 implementation, it has FEAT_VHE, and thus
> > > it does have a NS-EL2 virtual timer. This is further confirmed by the
> > > TRM which documents CNTHV*_EL2 as valid system registers[1].
> > >
> > > So the timer exists, the signal is routed out of the core, and it
> > > is likely that it is connected to the GIC.
> > >
> > > If the designers have omitted it, then it needs to be documented as
> > > such.
> > >
> >
> > Ok, I've checked thoroughly all docs again, and it seems like there is
> > no dedicated PPI number for this "EL2 Hypervisor Virtual Timer" in
> > Exynos850 SoC. The timer instance itself might exist of course, but
> > interrupt line is probably wasn't connected to GIC by SoC designers,
> > at least it's not documented.
>
> Can you try and check this? You can directly program the virtual timer
> so that it has a pending interrupt, and then check the pending
> register on the same CPU to see if there is anything appearing there.
>
> > Moreover, from [1,2] it looks like if it were existing it would have
> > been PPI=12 (INTID=28). But in GIC-400 TRM this PPI is assigned to
> > "Legacy FIQ signal",
>
> No. That's only if you set the bypass bits in GICD_CTLR, which nobody
> with half a brain would consider doing.
>
> > and all there is no PPI for Hypervisor Virtual
> > Timer documented there as well. In Exynos850 TRM the source for this
> > PPI's interrupt source is marked as "-", which means it's not used.
> >
> > So if you know something that I don't know -- please point me out the
> > doc where this PPI line is documented. Otherwise I can add the comment
> > to device tree, stating that this interrupt line is not present in
> > SoC's GIC, i.e. something like this:
> >
> > 8<------------------------------------------------------------------------------->8
> >     timer {
> >         compatible = "arm,armv8-timer";
> >         interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) |
> >                       IRQ_TYPE_LEVEL_LOW)>,
> >                  <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) |
> >                       IRQ_TYPE_LEVEL_LOW)>,
> >                  <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) |
> >                       IRQ_TYPE_LEVEL_LOW)>,
> >                  <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) |
> >                       IRQ_TYPE_LEVEL_LOW)>;
> >         /* Hypervisor Virtual Timer PPI is not present in this SoC GIC */
> >     };
> > 8<------------------------------------------------------------------------------->8
> >
> > Is that ok with you?
>
> I'd rather you verify the above first. And if you can't, I'd like a
> comment that is a bit more explicit:
>

I'm afraid I won't be able to verify your idea: seems like CNTHV_EL2
can be only modified (or read) in EL2. I tried to read that reg
anyway, which unsurprisingly resulted in el1_undef() BUG. The kernel
on my board is running in EL1, and I don't have access to the source
code for EL3 bootloaders. I have the source code for the last
bootloader, but it's already running in EL1.

> /* The vendor couldn't be bothered to wire the EL2 Virtual Timers */
>

I'll add the comment as you suggested. I propose we come back to this
issue later, either when the need for HV timer arises or when I have
some means to test your theory about existing PPI.

Thanks!

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
