Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44553E037D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 16:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238043AbhHDOkL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 10:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237935AbhHDOkE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Aug 2021 10:40:04 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D32C061798
        for <linux-gpio@vger.kernel.org>; Wed,  4 Aug 2021 07:39:51 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id o2so493456vkb.4
        for <linux-gpio@vger.kernel.org>; Wed, 04 Aug 2021 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rDKZtg82NP3ddCZ+CbKtTQlVqMfRo/3JfYFc/Sav3bE=;
        b=Rb4w2JW9NDUtFI5B1DdY4p2VknlohGp3Ak2rkEyHilaSfQWGfO0PvM1LI8VTGSK58E
         E5E1B7V9pL3lsFa9AlJN5av9Qj+fCiZP+6tceSKxdI88Ba47f90C3X8Z4yv2iUc+dHm0
         I4ldJ6XAhqprsW6XOH5F45fxk02OUBmUTwEKyL9gV6aedQ/k3CI1uHi8cB5PtGBQKZG6
         Odz6nToeGDrD5vdlizhxdCzailrpXe2J3KfMjoivaI8rPBD1almFcOU+6j2dUPFr0uer
         zfNkuOoXistHWz3jiy1hDLDplsrrln/1yOHA4dOaP9Z9uNs+SeRuriIj+AuA6y67mGyN
         xNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rDKZtg82NP3ddCZ+CbKtTQlVqMfRo/3JfYFc/Sav3bE=;
        b=sP8t+raQx32lpl9U9jtuy9gEVRQPXZqqz2aj6/Bel3fnsNrH+zbntREWc9BAMCPbOc
         jifb05ve4b0ZMXoa+hqZ7LQ6wY1t4DXiJ+jVk33LJv4wc92oOs97xwKFU/uqduYZL9mC
         ii+EBJZSR/k5Edi3/CBcn77lesr2OMEtgyxjeNxsQBrZcOr0sry9knaCt4S5sFyMzQya
         zw8+pLH8Y2Z4JANzUfrkc59ysOuAtJYyaXcnzdDNp0lcVODkTJmkZBUpa/fLRbXVvxP8
         Dny/ninU9DU9k3x3innGAkr/V9qUrEsTeEPbfP1jiaO6Oes9Uvpt1vQt2zHL2y1pLi0b
         IEXQ==
X-Gm-Message-State: AOAM533KejTlcPbJnspn9ZNlws65iLjhJir2b5a71iacG+Xw+Oy/5+4A
        1T+Pp3fcaERTYx621M9RNGjRxQZ76uYpXUbFCboHiw==
X-Google-Smtp-Source: ABdhPJxlsfrubol74U2vzDZDlR75ZOAD7I215GfcgIYKIkBbyLzJAazUw8L/PPcVieLCSBWNf4qgTYF7TKl9M+mp1Eo=
X-Received: by 2002:a05:6122:549:: with SMTP id y9mr5395608vko.7.1628087990034;
 Wed, 04 Aug 2021 07:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-13-semen.protsenko@linaro.org> <15871f8ced3c757fad1ab3b6e62c4e64@misterjones.org>
In-Reply-To: <15871f8ced3c757fad1ab3b6e62c4e64@misterjones.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 4 Aug 2021 17:39:38 +0300
Message-ID: <CAPLW+4=v4bDcuxGVqs06mobGj34At4cD+vg48b4dPujarS07Tg@mail.gmail.com>
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

Hi Marc,

On Fri, 30 Jul 2021 at 19:50, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2021-07-30 15:49, Sam Protsenko wrote:
> > Samsung Exynos850 is ARMv8-based mobile-oriented SoC.
> >
> > Features:
> >  * CPU: Cortex-A55 Octa (8 cores), up to 2 GHz
> >  * Memory interface: LPDDR4/4x 2 channels (12.8 GB/s)
> >  * SD/MMC: SD 3.0, eMMC5.1 DDR 8-bit
> >  * Modem: 4G LTE, 3G, GSM/GPRS/EDGE
> >  * RF: Quad GNSS, WiFi 5 (802.11ac), Bluetooth 5.0
> >  * GPU: Mali-G52 MP1
> >  * Codec: 1080p 60fps H64, HEVC, JPEG HW Codec
> >  * Display: Full HD+ (2520x1080)@60fps LCD
> >  * Camera: 16+5MP/13+8MP ISP, MIPI CSI 4/4/2, FD, DRC
> >  * Connectivity: USB 2.0 DRD, USI (SPI/UART/I2C), HSI2C, I3C, ADC,
> > Audio
> >
> > This patch adds minimal SoC support. Particular board device tree files
> > can include exynos850.dtsi file to get SoC related nodes, and then
> > reference those nodes further as needed.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 782 ++++++++++++++++++
> >  arch/arm64/boot/dts/exynos/exynos850-usi.dtsi |  30 +
> >  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 245 ++++++
> >  3 files changed, 1057 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> >  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-usi.dtsi
> >  create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> > b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> > new file mode 100644
> > index 000000000000..4cf0a22cc6db
>
> [...]
>
> > +     gic: interrupt-controller@12a00000 {
> > +             compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>
> One thing for sure, it cannot be both. And given that it is
> an A55-based SoC, it isn't either. It is more likely a GIC400.
>

Yes, it's GIC-400, thanks for pointing that out. Will fix that in v2.

> > +             #interrupt-cells = <3>;
> > +             #address-cells = <0>;
> > +             interrupt-controller;
> > +             reg = <0x0 0x12a01000 0x1000>,
> > +                   <0x0 0x12a02000 0x1000>,
>
> This is wrong. It is architecturally set to 8kB.
>

Nice catch! Actually there is an error (typo?) in SoC's TRM, saying
that Virtual Interface Control Register starts at 0x3000 offset (from
0x12a00000), where it obviously should be 0x4000, that's probably
where this dts error originates from. Btw, I'm also seeing the same
error in exynos7.dtsi. Though I don't have a TRM for Exynos7 SoCs, so
not sure if I should go ahead and fix that too. Anyway, for Exynos850,
I'll fix that in v2 series.

> > +                   <0x0 0x12a04000 0x2000>,
> > +                   <0x0 0x12a06000 0x2000>;
> > +             interrupts = <GIC_PPI 9
> > +                             (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>
> 4? With 8 CPUs?
>

Will be fixed in v2, thanks.

> I also find it curious that you went through the unusual
> (and IMO confusing) effort to allocate a name to each and
> every SPI in the system, but didn't do it for any on the PPIs...
>

Yeah, after some consideration I removed the whole interrupts header
and used hard-coded values instead. I probably felt it would be right
thing to have, just because there is no public TRM for Exynos850, thus
documenting interrupts somewhere would be nice. But that reasoning is
wrong, as trying to mix that kind of documentation with code just
clutters it. The right thing to do is probably just provide a public
TRM, but that's not for me to decide, alas :) Anyway, will be fixed in
v2.

>
> > +     };
> > +
> > +     timer {
> > +             compatible = "arm,armv8-timer";
> > +             interrupts = <GIC_PPI 13
> > +                             (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> > +                          <GIC_PPI 14
> > +                             (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> > +                          <GIC_PPI 11
> > +                             (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> > +                          <GIC_PPI 10
> > +                             (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> > +             clock-frequency = <26000000>;
>
> No, please. Fix the firmware to program CNTFRQ_EL0 on each
> and every CPU. This isn't 2012 anymore.
>

Ok, will remove that property in v2. Though it looks like CNTFRQ_EL0
register can be only changed in EL3 execution level, so I'll have to
ask the vendor to fix their BL31 or whatever. But that might take some
time, so I'll have to keep "clock-frequency" workaround in my local
tree for now, to make scheduler work.

> You are also missing the hypervisor virtual timer interrupt.
>

Checked SoC TRM, there is no PPI for hypervisor virtual timer
interrupt, and no mentioning of it at all. Likewise, I checked ARMv8
ARM and TRM, almost no description of it. Also, I checked other
platforms, and seems like everyone does the same (having only 4
interrupts). And I wasn't able to find any documentation on that, so I
guess I'll leave it as is, if you don't mind.

> > +             use-clocksource-only;
> > +             use-physical-timer;
>
> Thankfully, these two properties do not exist.
>

Yeah, that's just some leftover from vendor's kernel, overlook by
me... Will remove in v2, thanks.

> Thanks,
>
>          M.
> --
> Jazz is not dead. It just smells funny...
