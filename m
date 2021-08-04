Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD18B3E0A02
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 23:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbhHDVbB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 17:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbhHDVbB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Aug 2021 17:31:01 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B53C0613D5
        for <linux-gpio@vger.kernel.org>; Wed,  4 Aug 2021 14:30:48 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id t29so1845230vsr.5
        for <linux-gpio@vger.kernel.org>; Wed, 04 Aug 2021 14:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dxaJFL8Y5c22Jta0cMEZC2iEw41WS8AsvJV/yCHApHU=;
        b=aFm4foLY/Ah5O7HrLETjBorHA/Cbd4vqMKInq5ZltFuYyRmeKeRRProzZ+QYj1F0ki
         L2nCrSrSWq1ivhi/Sz+Tvs0z70lHYq8V5kPuzV4lb/KmyuYPEesHqj9zGjfXp81gNjwk
         Hc8Y8XbiQQygnK8nDxfxY4Ea+ILEnS2D8ZLh6V01K3pd1mGl3frQ7WWWlHFzRfyNTfGU
         j9IzlCghKlDvyGKZMPPu+sM+kackw0OGiBzo3/kNfT8KUCGiNk/ALNyTSEBJ8sZHhQ6i
         t2uCyKv4JHyjy++JVm1Phmm+hJCtaJj8F1RV4pEnOFs9kYHFlXCAi4Rzj/26hZfjQ9OI
         vPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dxaJFL8Y5c22Jta0cMEZC2iEw41WS8AsvJV/yCHApHU=;
        b=geKufaP6OABxFTJux+zRV89hdMonlbisIF8Uz6cr0xVEsYDO27la9VdCpz895Q1MEI
         27SC9uQyF5d8LFWq1larmaoEZwlBw70D8qUF8Uk0prhdK1kIMKDWuBualZtmIAFlJStk
         NeHSL/QYbs0NtnzbsjG/uogzLl6vZCkH3zPdoq4K5y8ACyTm4UKOmqU+S21T892CG0Kz
         +6x2YrKhQHGbN0Kph/uWbf2bowo4oDMVgUrgzeEoMPbwYtGCvZNksSHBhCLNdc/kCNhl
         urmUqVmEcqcrKzqbBnvpyYYjz8zxev35b8mF0JNyzU8yHUV28pld0h1Xl5QIcfEdeV96
         ZRUA==
X-Gm-Message-State: AOAM531/ZvRiqBFlO3OwDFVET/NtqrQPeYyQNLsF7B1EtEVa9B6OAxKG
        ybN+E6OjZ5Z8Tra+U+9fpxHrwzliJlLywrPfUbZ7cA==
X-Google-Smtp-Source: ABdhPJxs3KtlDburhMJ7hb4H+QMZ+qFnQt7AfD5vKDnUEhepBfw+rufW06PMmUaJ+YMjNVp0Vvi4JO3VVZ/yl7ndwcc=
X-Received: by 2002:a67:de06:: with SMTP id q6mr2048185vsk.57.1628112646443;
 Wed, 04 Aug 2021 14:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-13-semen.protsenko@linaro.org> <15871f8ced3c757fad1ab3b6e62c4e64@misterjones.org>
 <CAPLW+4=v4bDcuxGVqs06mobGj34At4cD+vg48b4dPujarS07Tg@mail.gmail.com> <bf21badb-804f-45f0-c02b-80ff57ab9931@canonical.com>
In-Reply-To: <bf21badb-804f-45f0-c02b-80ff57ab9931@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 5 Aug 2021 00:30:34 +0300
Message-ID: <CAPLW+4nY=hozOR+B_0sPZODrk9PXaXg+NB-9pVhDbAjEy7yjhg@mail.gmail.com>
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
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

On Wed, 4 Aug 2021 at 21:36, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 04/08/2021 16:39, Sam Protsenko wrote:
> > Hi Marc,
> >
> > On Fri, 30 Jul 2021 at 19:50, Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On 2021-07-30 15:49, Sam Protsenko wrote:
> >>> Samsung Exynos850 is ARMv8-based mobile-oriented SoC.
> >>>
> >>> Features:
> >>>  * CPU: Cortex-A55 Octa (8 cores), up to 2 GHz
> >>>  * Memory interface: LPDDR4/4x 2 channels (12.8 GB/s)
> >>>  * SD/MMC: SD 3.0, eMMC5.1 DDR 8-bit
> >>>  * Modem: 4G LTE, 3G, GSM/GPRS/EDGE
> >>>  * RF: Quad GNSS, WiFi 5 (802.11ac), Bluetooth 5.0
> >>>  * GPU: Mali-G52 MP1
> >>>  * Codec: 1080p 60fps H64, HEVC, JPEG HW Codec
> >>>  * Display: Full HD+ (2520x1080)@60fps LCD
> >>>  * Camera: 16+5MP/13+8MP ISP, MIPI CSI 4/4/2, FD, DRC
> >>>  * Connectivity: USB 2.0 DRD, USI (SPI/UART/I2C), HSI2C, I3C, ADC,
> >>> Audio
> >>>
> >>> This patch adds minimal SoC support. Particular board device tree files
> >>> can include exynos850.dtsi file to get SoC related nodes, and then
> >>> reference those nodes further as needed.
> >>>
> >>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> >>> ---
> >>>  .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 782 ++++++++++++++++++
> >>>  arch/arm64/boot/dts/exynos/exynos850-usi.dtsi |  30 +
> >>>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 245 ++++++
> >>>  3 files changed, 1057 insertions(+)
> >>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> >>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-usi.dtsi
> >>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi
> >>>
> >>> diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> >>> b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> >>> new file mode 100644
> >>> index 000000000000..4cf0a22cc6db
> >>
> >> [...]
> >>
> >>> +     gic: interrupt-controller@12a00000 {
> >>> +             compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
> >>
> >> One thing for sure, it cannot be both. And given that it is
> >> an A55-based SoC, it isn't either. It is more likely a GIC400.
> >>
> >
> > Yes, it's GIC-400, thanks for pointing that out. Will fix that in v2.
> >
> >>> +             #interrupt-cells = <3>;
> >>> +             #address-cells = <0>;
> >>> +             interrupt-controller;
> >>> +             reg = <0x0 0x12a01000 0x1000>,
> >>> +                   <0x0 0x12a02000 0x1000>,
> >>
> >> This is wrong. It is architecturally set to 8kB.
> >>
> >
> > Nice catch! Actually there is an error (typo?) in SoC's TRM, saying
> > that Virtual Interface Control Register starts at 0x3000 offset (from
> > 0x12a00000), where it obviously should be 0x4000, that's probably
> > where this dts error originates from. Btw, I'm also seeing the same
> > error in exynos7.dtsi.
>
> What's the error exactly? The "Virtual interface control register"
> offset (3rd region) is set properly to 0x4000 on Exynos7. Also one for
> the Exynos5433 looks correct.
>

The issue is that 2nd region's size is 0x1000, but it must be 0x2000.
It's defined by GIC-400 architecture, as I understand. Please look at
[1], table 3-1 has very specific offsets and sizes for each functional
block, and each particular SoC must adhere to that spec. So having
0x1000 for 2nd region can't be correct. And because exynos7.dtsi has
GIC-400 as well, and 0x1000 is specified there for 2nd region size
too, so I presume there is the same mistake there.

Can you please check the TRM for Exynos7 SoC (if you have one in your
possession), and see if there is a typo there? E.g. in case of
Exynos850 TRM I can see that in "Register Map Summary" section the
offset for the first register (GICH_HCR) in "Virtual Interface Control
Register" region is specified as 0x3000, where it should be 0x4000, so
it's probably a typo. But the register description is correct, saying
that: "Address = Base Address + 0x4000".

[1] https://developer.arm.com/documentation/ddi0471/b/programmers-model/gic-400-register-map

> > Though I don't have a TRM for Exynos7 SoCs, so
> > not sure if I should go ahead and fix that too. Anyway, for Exynos850,
> > I'll fix that in v2 series.
>
>
> However while we are at addresses - why are you using address-cells 2?
> It adds everywhere additional 0x0 before actual address.
>

Right. For "cpus" node I'll change the address-cells to 1 in my v2
series. I'll keep address-cells=2 for the root node, but I'm going to
encapsulate some nodes into soc node (as you suggested earlier), where
I'll make address-cells=1. That's pretty much how it's done in
exynos7.dtsi and in exynos5433.dtsi, so I guess that's should be fine
(to get rid of superfluous 0x0 and conform with other Exynos DTs)?

>
> Best regards,
> Krzysztof
