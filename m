Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83CF43E246C
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 09:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236777AbhHFHtT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 03:49:19 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:59054
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241186AbhHFHtL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Aug 2021 03:49:11 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 83A8F3F350
        for <linux-gpio@vger.kernel.org>; Fri,  6 Aug 2021 07:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628236131;
        bh=Xj1sdcjYaHNPOFjlTIbkZSX9DD4AYTCYBKK6gS1J+DE=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=n/D0bNABvpv4YgsPWTyCcg7WahyYf9dOPbNV5KG14UYCFgif/a1j1y8I7qydSdcCl
         DiIZDscvW7MTXjDmVEhUidR5JBIVeDd5bZWubGt0BWDv6j3t+6a6t1YDFXsAyBLgc7
         qc8wmOU2b0KHrjkBJDj1LB7aEmxuvf1FXG74WXWsT8p026YaJIgBLRsEuuQHdZeugM
         Nwg8SynGqmDLkkykUqnDdqk66j+WCV7/eSGUEn3gAP3gUFZVGDaJ7IkZDp7D7PXqFM
         X90mNrKemju1WXSwpTqIYV8+5PBrOD72dZsA6ASzN+pIyfv56ZwiWSRo4S39VFDmag
         tzbNGZgy2fLew==
Received: by mail-ed1-f71.google.com with SMTP id de5-20020a0564023085b02903bb92fd182eso4508940edb.8
        for <linux-gpio@vger.kernel.org>; Fri, 06 Aug 2021 00:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xj1sdcjYaHNPOFjlTIbkZSX9DD4AYTCYBKK6gS1J+DE=;
        b=A8tKZHEMFRjg9zk3RGl01uZ4vFGihx7M4afUwDuniJxkRv1QfKcVIqqdUYUq1gRoPU
         SWT5jWvKFSy7cfIkj4yXYtGXFfC+CrUi7eMgBVuDa2T0ATcXYHE2pVdhNo+90fOgo7IS
         rEjEB2PGHf3JSXFxW+ptEG4FTLqHwzbtEjtbThBFyWwy7suvYQ0rxZcEELScOu5Ghkqr
         U197OJvfCZzrxYzXRpXFPShA0Y/wul0q6cfK7jg32gvu2UvkKB+lOwjrhcGG9xQBJgsc
         APam2zivpPq4tp2MfX637fatdzdxl8vHJXgdlodMNXEfKkklyNd7+mnk/NZxKHxDOuLB
         p5Kg==
X-Gm-Message-State: AOAM533vlgRIz2QhowfvaKy03qAfnPRxMGQsaI77cMPjSWVsl/2j+VsH
        iEgWUSmzGXRbIjZ8z4G8bHzoMEmWR+Hb/QAUpU8G4HSKId55RSAUESOHoXqJAUOTFccEm0962De
        X7y9tcjxoX9DnsEXIBiBYsyinCHmcvOgTGtp1nAs=
X-Received: by 2002:a05:6402:27c9:: with SMTP id c9mr11855022ede.234.1628236131095;
        Fri, 06 Aug 2021 00:48:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9BSN+HtEtT1EGZSdM1Ek0aoM5uJwbZlGfZNBmk8DCs8fivwzoDj4MdspMYJy9eZJ1pojXmg==
X-Received: by 2002:a05:6402:27c9:: with SMTP id c9mr11854985ede.234.1628236130768;
        Fri, 06 Aug 2021 00:48:50 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id qo26sm2552859ejb.65.2021.08.06.00.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 00:48:50 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
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
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-13-semen.protsenko@linaro.org>
 <455cfb5e-dff7-a5c0-3875-49abe3e900f3@canonical.com>
 <CAPLW+4nDS0atrbUFagDA0W_Ky5MvOiY+N+NQoQ+me4pndp_iWg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
Message-ID: <68734f6c-fc76-595c-8d34-8924dbbbb845@canonical.com>
Date:   Fri, 6 Aug 2021 09:48:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4nDS0atrbUFagDA0W_Ky5MvOiY+N+NQoQ+me4pndp_iWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/08/2021 01:06, Sam Protsenko wrote:
> On Sat, 31 Jul 2021 at 12:03, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
> 
>>>
>>> This patch adds minimal SoC support. Particular board device tree files
>>> can include exynos850.dtsi file to get SoC related nodes, and then
>>> reference those nodes further as needed.
>>>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>>  .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 782 ++++++++++++++++++
>>>  arch/arm64/boot/dts/exynos/exynos850-usi.dtsi |  30 +
>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 245 ++++++
>>
>> Not buildable. Missing Makefile, missing DTS. Please submit with initial
>> DTS, otherwise no one is able to verify it even compiles.
>>
> 
> This device is not available for purchase yet. I'll send the patch for
> board dts once it's announced. I can do all the testing for now, if
> you have any specific requests. Would it be possible for us to review
> and apply only SoC support for now? Will send v2 soon...

What you propose is equal to adding a driver (C source code) without
ability to compile it. What's the point of having it in the kernel? It's
unverifiable, unbuildable and unusable.

We can review the DTSI however merging has to be with a DTS. Usually the
SoC vendor adds first an evalkit (e.g. SMDK board). Maybe you have one
for Exynos850? Otherwise if you cannot disclose the actual board, the
DTSI will have to wait. You can submit drivers, though.

> 
>>>  3 files changed, 1057 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-usi.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
>>> new file mode 100644
>>> index 000000000000..4cf0a22cc6db
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
>>> @@ -0,0 +1,782 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Samsung's Exynos850 SoC pin-mux and pin-config device tree source
>>> + *
>>> + * Copyright (C) 2017 Samsung Electronics Co., Ltd.
>>> + * Copyright (C) 2021 Linaro Ltd.
>>> + *
>>> + * Samsung's Exynos850 SoC pin-mux and pin-config options are listed as device
>>> + * tree nodes in this file.
>>> + */
>>> +
>>> +#include <dt-bindings/interrupt-controller/exynos850.h>
>>> +
>>> +/ {
>>> +     /* ALIVE */
>>> +     pinctrl@11850000 {
>>> +             gpa0: gpa0 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <3>;
>>
>> That's odd a little, why three cells? How this would be used/referenced?
>>
> 
> Fixed. You are right, irq_domain_xlate_twocell() is used in
> pinctrl-exynos.c. Btw, that fixed the use-case when gpX is specified
> as interrupt-parrent for other nodes.
> 
>>> +                     interrupt-parent = <&gic>;
>>> +                     interrupts =
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT0 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT1 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT2 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT3 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT4 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT5 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT6 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT7 IRQ_TYPE_LEVEL_HIGH>;
>>> +             };
>>> +
>>> +             gpa1: gpa1 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <3>;
>>> +                     interrupt-parent = <&gic>;
>>> +                     interrupts =
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT8 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT9 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT10 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT11 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT12 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT13 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT14 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT15 IRQ_TYPE_LEVEL_HIGH>;
>>> +             };
>>> +
>>> +             gpa2: gpa2 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <3>;
>>> +                     interrupt-parent = <&gic>;
>>> +                     interrupts =
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT16 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT17 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT18 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT19 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT20 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT21 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT22 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT23 IRQ_TYPE_LEVEL_HIGH>;
>>> +             };
>>> +
>>> +             gpa3: gpa3 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <3>;
>>> +                     interrupt-parent = <&gic>;
>>> +                     interrupts =
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT24 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT25 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT26 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT27 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT28 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT29 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT30 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT31 IRQ_TYPE_LEVEL_HIGH>;
>>> +             };
>>> +
>>> +             gpa4: gpa4 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <3>;
>>> +                     interrupt-parent = <&gic>;
>>> +                     interrupts =
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT32 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT33 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT34 IRQ_TYPE_LEVEL_HIGH>,
>>> +                         <GIC_SPI INTREQ__ALIVE_EINT35 IRQ_TYPE_LEVEL_HIGH>;
>>> +             };
>>> +
>>> +             gpq0: gpq0 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +             };
>>> +
>>> +             /* USI_PERI_UART_DBG */
>>> +             uart0_bus: uart0-bus {
>>> +                     samsung,pins = "gpq0-0", "gpq0-1";
>>> +                     samsung,pin-function = <2>;
>>
>> EXYNOS_PIN_FUNC_2
>>
> 
> Done, thanks.
> 
>>> +                     samsung,pin-pud = <0>;
>>
>> EXYNOS_PIN_PULL_xx?
>>
> 
> Yes, replaced pin-pud values with these constants, thanks. Won't touch
> pin-drv properties, though, as different domains have different
> meanings for the same values, so don't want to introduce the whole
> bunch of consts.
> 
>>> +             };
>>> +
>>> +             decon_f_te_on: decon_f_te_on {
>>
>> 1. Where is it used?
>> 2. Use hyphens in node names.
>> Please build it with W=1 and fix the warnings.
>>
> 
> decon* nodes seem like leftover from vendor kernel. Those are not
> connected anywhere on my board, so I removed those nodes.
> 
> Also fixed node names as you suggested, and fixed all stuff found with
> W=1 build, thanks for reminding me that.
> 
>>> +                     samsung,pins = "gpa4-1";
>>
>> Order the nodes based on first pin name, so:
>> i2c5_bus
>> i2c6_bus
>> decon_f_te_on
>> uart0_bus
>>
> 
> Done. Also rearranged the nodes in that way for other pinctrl domains.
> 
>>> +                     samsung,pin-function = <0xf>;
>>> +             };
>>> +
>>> +             decon_f_te_off: decon_f_te_off {
>>
>> Where is it used?
>>
> 
> Removed, as explained above.
> 
>>> +                     samsung,pins = "gpa4-1";
>>> +                     samsung,pin-function = <0x0>;
>>> +             };
>>> +
>>> +             /* I2C_5 | CAM_PMIC_I2C */
>>
>> This comment is confusing. I2C-5 is obvious from node name and label.
>> CAM_PMIC_I2C does not look like property of SoC but board.
>>
> 
> Yeah, unfortunately this confusing I2C naming (CAM_PMIC_I2C and
> MOTOR_I2C) actually comes from TRM and SoC schematic symbol.

Schematic symbol of SoC? Interesting document... What do you have there?
Internals of SoC?


> So in
> Device Tree it's called just i2c5 and i2c6 (because it's a regular I2C
> really), but in TRM it's a mix of both names. I guess it's just a poor
> pin function naming, done by SoC designers.
> 
> That said, I suggest changing these comments to something like this:
> 
>     /* I2C5 (also called CAM_PMIC_I2C in TRM) */
>     /* I2C6 (also called MOTOR_I2C in TRM) */

OK, assuming that by TRM you mean Exynos850 TRM.

> 
>>> +             i2c5_bus: i2c5-bus {
>>> +                     samsung,pins = "gpa3-5", "gpa3-6";
>>> +                     samsung,pin-function = <3>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             /* I2C_6 | MOTOR_I2C */
>>> +             i2c6_bus: i2c6-bus {
>>> +                     samsung,pins = "gpa3-7", "gpa4-0";
>>> +                     samsung,pin-function = <3>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +     };
>>> +
>>> +     /* CMGP */
>>> +     pinctrl@11c30000 {
>>> +             gpm0: gpm0 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <3>;
>>> +                     interrupt-parent = <&gic>;
>>> +                     interrupts =
>>> +                       <GIC_SPI INTREQ__CMGP_EXT_INTM00 IRQ_TYPE_LEVEL_HIGH>;
>>> +             };
>>> +
>>> +             gpm1: gpm1 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <3>;
>>> +                     interrupt-parent = <&gic>;
>>> +                     interrupts =
>>> +                       <GIC_SPI INTREQ__CMGP_EXT_INTM01 IRQ_TYPE_LEVEL_HIGH>;
>>> +             };
>>> +
>>> +             gpm2: gpm2 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <3>;
>>> +                     interrupt-parent = <&gic>;
>>> +                     interrupts =
>>> +                       <GIC_SPI INTREQ__CMGP_EXT_INTM02 IRQ_TYPE_LEVEL_HIGH>;
>>> +             };
>>> +
>>> +             gpm3: gpm3 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <3>;
>>> +                     interrupt-parent = <&gic>;
>>> +                     interrupts =
>>> +                       <GIC_SPI INTREQ__CMGP_EXT_INTM03 IRQ_TYPE_LEVEL_HIGH>;
>>> +             };
>>> +
>>> +             gpm4: gpm4 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <3>;
>>> +                     interrupt-parent = <&gic>;
>>> +                     interrupts =
>>> +                       <GIC_SPI INTREQ__CMGP_EXT_INTM04 IRQ_TYPE_LEVEL_HIGH>;
>>> +             };
>>> +
>>> +             gpm5: gpm5 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <3>;
>>> +                     interrupt-parent = <&gic>;
>>> +                     interrupts =
>>> +                       <GIC_SPI INTREQ__CMGP_EXT_INTM05 IRQ_TYPE_LEVEL_HIGH>;
>>> +             };
>>> +
>>> +             /* usi_cmgp00 */
>>> +             hsi2c3_bus: hsi2c3-bus {
>>> +                     samsung,pins = "gpm0-0", "gpm1-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             /* usi_cmgp01 */
>>> +             hsi2c4_bus: hsi2c4-bus {
>>> +                     samsung,pins = "gpm4-0", "gpm5-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             /* spi usi_cmgp00 */
>>> +             spi1_bus: spi1-bus {
>>> +                     samsung,pins = "gpm0-0", "gpm1-0", "gpm2-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             spi1_cs: spi1-cs {
>>> +                     samsung,pins = "gpm3-0";
>>> +                     samsung,pin-function = <1>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             spi1_cs_func: spi1-cs-func {
>>> +                     samsung,pins = "gpm3-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             /* spi usi_cmgp01 */
>>> +             spi2_bus: spi2-bus {
>>> +                     samsung,pins = "gpm4-0", "gpm5-0", "gpm6-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             spi2_cs: spi2-cs {
>>> +                     samsung,pins = "gpm7-0";
>>> +                     samsung,pin-function = <1>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             spi2_cs_func: spi2-cs-func {
>>> +                     samsung,pins = "gpm7-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             /* usi_cmgp00_uart */
>>> +             uart1_bus_single: uart1-bus {
>>> +                     samsung,pins = "gpm0-0", "gpm1-0", "gpm2-0", "gpm3-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +             };
>>> +
>>> +             uart1_bus_dual: uart1-bus-dual {
>>> +                     samsung,pins = "gpm0-0", "gpm1-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +             };
>>> +
>>> +             /* usi_cmgp01_uart */
>>> +             uart2_bus_single: uart2-bus {
>>> +                     samsung,pins = "gpm4-0", "gpm5-0", "gpm6-0", "gpm7-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +             };
>>> +
>>> +             uart2_bus_dual: uart2-bus-dual {
>>> +                     samsung,pins = "gpm4-0", "gpm5-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +             };
>>> +     };
>>> +
>>> +     /* AUD */
>>> +     pinctrl@14a60000 {
>>> +             gpb0: gpb0 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +             };
>>> +
>>> +             gpb1: gpb1 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +             };
>>> +
>>> +             aud_codec_mclk: aud-codec-mclk {
>>> +                     samsung,pins = "gpb0-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <1>;
>>> +             };
>>> +
>>> +             aud_codec_mclk_idle: aud-codec-mclk-idle {
>>> +                     samsung,pins = "gpb0-0";
>>> +                     samsung,pin-function = <0>;
>>> +                     samsung,pin-pud = <1>;
>>> +             };
>>> +
>>> +             aud_i2s0_bus: aud-i2s0-bus {
>>> +                     samsung,pins = "gpb0-1", "gpb0-2", "gpb0-3", "gpb0-4";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <1>;
>>> +             };
>>> +
>>> +             aud_i2s0_idle: aud-i2s0-idle {
>>> +                     samsung,pins = "gpb0-1", "gpb0-2", "gpb0-3", "gpb0-4";
>>> +                     samsung,pin-function = <0>;
>>> +                     samsung,pin-pud = <1>;
>>> +             };
>>> +
>>> +             aud_i2s1_bus: aud-i2s1-bus {
>>> +                     samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <1>;
>>> +             };
>>> +
>>> +             aud_i2s1_idle: aud-i2s1-idle {
>>> +                     samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
>>> +                     samsung,pin-function = <0>;
>>> +                     samsung,pin-pud = <1>;
>>> +             };
>>> +
>>> +             aud_fm_bus: aud-fm-bus {
>>> +                     samsung,pins = "gpb1-4";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <1>;
>>> +             };
>>> +
>>> +             aud_fm_idle: aud-fm-idle {
>>> +                     samsung,pins = "gpb1-4";
>>> +                     samsung,pin-function = <0>;
>>> +                     samsung,pin-pud = <1>;
>>> +             };
>>> +     };
>>> +
>>> +     /* HSI */
>>> +     pinctrl@13430000 {
>>> +             gpf2: gpf2 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +             };
>>> +
>>> +             sd2_clk: sd2-clk {
>>> +                     samsung,pins = "gpf2-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <2>;
>>> +             };
>>> +
>>> +             sd2_cmd: sd2-cmd {
>>> +                     samsung,pins = "gpf2-1";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <2>;
>>> +              };
>>> +
>>> +             sd2_bus1: sd2-bus-width1 {
>>> +                     samsung,pins = "gpf2-2";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <2>;
>>> +             };
>>> +
>>> +             sd2_bus4: sd2-bus-width4 {
>>> +                     samsung,pins = "gpf2-3", "gpf2-4", "gpf2-5";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <2>;
>>> +             };
>>> +
>>> +             sd2_clk_fast_slew_rate_1x: sd2-clk_fast_slew_rate_1x {
>>> +                     samsung,pins = "gpf2-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             sd2_clk_fast_slew_rate_1_5x: sd2-clk_fast_slew_rate_1_5x {
>>> +                     samsung,pins = "gpf2-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <1>;
>>> +             };
>>> +
>>> +             sd2_clk_fast_slew_rate_2x: sd2-clk_fast_slew_rate_2x {
>>> +                     samsung,pins = "gpf2-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <2>;
>>> +             };
>>> +
>>> +             sd2_clk_fast_slew_rate_2_5x: sd2-clk_fast_slew_rate_2_5x {
>>> +                     samsung,pins = "gpf2-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <3>;
>>> +             };
>>> +
>>> +             sd2_clk_fast_slew_rate_3x: sd2-clk_fast_slew_rate_3x {
>>> +                     samsung,pins = "gpf2-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <4>;
>>> +             };
>>> +
>>> +             sd2_clk_fast_slew_rate_4x: sd2-clk_fast_slew_rate_4x {
>>> +                     samsung,pins = "gpf2-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <5>;
>>> +             };
>>> +
>>> +             sd2_pins_as_pdn: sd2-pins-as-pdn {
>>> +                     samsung,pins = "gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
>>> +                                    "gpf2-4", "gpf2-5";
>>> +                     samsung,pin-function = <0>;
>>> +                     samsung,pin-pud = <2>;
>>> +             };
>>> +
>>
>> No need for blank line.
>>
> 
> Fixed.
> 
>>> +     };
>>> +
>>> +     /* CORE */
>>> +     pinctrl@12070000 {
>>> +             gpf0: gpf0 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +             };
>>> +
>>> +             sd0_clk: sd0-clk {
>>> +                     samsung,pins = "gpf0-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <3>;
>>> +             };
>>> +
>>> +             sd0_cmd: sd0-cmd {
>>> +                     samsung,pins = "gpf0-1";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <3>;
>>> +             };
>>> +
>>> +             sd0_rdqs: sd0-rdqs {
>>> +                     samsung,pins = "gpf0-2";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <1>;
>>> +                     samsung,pin-drv = <3>;
>>> +             };
>>> +
>>> +             sd0_nreset: sd0-nreset {
>>> +                     samsung,pins = "gpf0-3";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <3>;
>>> +             };
>>> +
>>> +             sd0_clk_fast_slew_rate_1x: sd0-clk_fast_slew_rate_1x {
>>> +                     samsung,pins = "gpf0-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <1>;
>>> +             };
>>> +
>>> +             sd0_clk_fast_slew_rate_2x: sd0-clk_fast_slew_rate_2x {
>>> +                     samsung,pins = "gpf0-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <2>;
>>> +             };
>>> +
>>> +             sd0_clk_fast_slew_rate_3x: sd0-clk_fast_slew_rate_3x {
>>> +                     samsung,pins = "gpf0-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <2>;
>>> +             };
>>> +
>>> +             sd0_clk_fast_slew_rate_4x: sd0-clk_fast_slew_rate_4x {
>>> +                     samsung,pins = "gpf0-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <3>;
>>> +             };
>>> +
>>> +             gpf1: gpf1 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +             };
>>> +
>>> +             sd0_bus1: sd0-bus-width1 {
>>> +                     samsung,pins = "gpf1-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <3>;
>>> +             };
>>> +
>>> +             sd0_bus4: sd0-bus-width4 {
>>> +                     samsung,pins = "gpf1-1", "gpf1-2", "gpf1-3";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <3>;
>>> +             };
>>> +
>>> +             sd0_bus8: sd0-bus-width8 {
>>> +                     samsung,pins = "gpf1-4", "gpf1-5", "gpf1-6", "gpf1-7";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <3>;
>>> +             };
>>> +     };
>>> +
>>> +     /* PERI */
>>> +     pinctrl@139b0000 {
>>> +             gpg0: gpg0 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +             };
>>> +
>>> +             gpp0: gpp0 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +             };
>>> +             gpp1: gpp1 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +             };
>>> +
>>> +             gpp2: gpp2 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +             };
>>> +
>>> +             gpg1: gpg1 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +             };
>>> +
>>> +             gpg2: gpg2 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +             };
>>> +
>>> +             gpg3: gpg3 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +             };
>>> +
>>> +             gpc0: gpc0 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +             };
>>> +
>>> +             gpc1: gpc1 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +             };
>>> +
>>> +             xclkout: xclkout {
>>> +                     samsung,pins = "gpq0-2";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +             };
>>> +
>>> +             /* usi_hsi2c_0 */
>>
>> Comment seems to duplicate node name/label.
>>
> 
> I think the comment is useful, maybe just designed poorly. It's
> pointing out that this HS-I2C block is based on USI IP-core. Basically
> we have 7 USI blocks in this SoC:
>   - 5 USIs that pre-defined: HSI2C0, HSI2C1, HSI2C2, UART0 and SPI0;
> although AFAIU they can be changed via System Register as well, but
> seems like nobody does that
>   - 2 USIs from CMGP blocks (CMGP0 and CMGP1), which are actually configurable
> 
> I will revise all such comments like this, just to show those blocks
> are based on USI design:
> 
>     /* USI: HSI2C0 */

OK

> 
> At least when I was bringing up this board, I was really confused for
> long time about this USI business. So I'm sure some kind of comments
> might be actually helpful. And that's one reason to keep
> exynos850-usi.dtsi file: although I removed it for now, squashing it
> into exynos850.dtsi, I think it might be a good idea to bring that
> back once all USI nodes are described. Just thinking aloud :)
> 
>>> +             hsi2c0_bus: hsi2c0-bus {
>>> +                     samsung,pins = "gpc1-0", "gpc1-1";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             /* usi_hsi2c_1 */
>>> +             hsi2c1_bus: hsi2c1-bus {
>>> +                     samsung,pins = "gpc1-2", "gpc1-3";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             /* usi_hsi2c_2 */
>>> +             hsi2c2_bus: hsi2c2-bus {
>>> +                     samsung,pins = "gpc1-4", "gpc1-5";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             /* usi_spi_0 */
>>> +             spi0_bus: spi0-bus {
>>> +                     samsung,pins = "gpp2-0", "gpp2-2", "gpp2-3";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             spi0_cs: spi0-cs {
>>> +                     samsung,pins = "gpp2-1";
>>> +                     samsung,pin-function = <1>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             spi0_cs_func: spi0-cs-func {
>>> +                     samsung,pins = "gpp2-1";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             i2c0_bus: i2c0-bus {
>>> +                     samsung,pins = "gpp0-0", "gpp0-1";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             i2c1_bus: i2c1-bus {
>>> +                     samsung,pins = "gpp0-2", "gpp0-3";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             i2c2_bus: i2c2-bus {
>>> +                     samsung,pins = "gpp0-4", "gpp0-5";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             i2c3_bus: i2c3-bus {
>>> +                     samsung,pins = "gpp1-0", "gpp1-1";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             i2c4_bus: i2c4-bus {
>>> +                     samsung,pins = "gpp1-2", "gpp1-3";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <0>;
>>> +             };
>>> +
>>> +             fm_lna_en: fm-lna-en {
>>> +                     samsung,pins = "gpg2-3";
>>> +                     samsung,pin-function = <1>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-val = <0>;
>>> +             };
>>> +
>>> +             sensor_mclk0_in: sensor-mclk0-in {
>>> +                     samsung,pins = "gpc0-0";
>>> +                     samsung,pin-function = <0>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <2>;
>>> +             };
>>> +
>>> +             sensor_mclk0_out: sensor-mclk0-out {
>>> +                     samsung,pins = "gpc0-0";
>>> +                     samsung,pin-function = <1>;
>>> +                     samsung,pin-pud = <1>;
>>> +                     samsung,pin-drv = <2>;
>>> +             };
>>> +
>>> +             sensor_mclk0_fn: sensor-mclk0-fn {
>>
>> No, seriously. What sensor is it? In SoC?
>>
> 
> In this context, "sensor" stands for "camera". Of course, it resides
> (or rather *may* reside) outside of the SoC. This is just useful pin
> configuration for camera master clock lines (3 of them). On schematic
> those 3 lines are grouped into "MCLK" block, and those pins main
> function is CAM_MCLK. I guess it makes sense to keep those
> definitions, as I doubt somebody would actually consider using those
> lines for somthing else. Or I can remove all those sensor*
> definitions, if you'd like, then those can be added later, when camera
> support cames in.

Hmmm, indeed we define in pinctrl useful typical functions and I
understand this one is such. Let's keep them then.

> 
>>> +                     samsung,pins = "gpc0-0";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <2>;
>>> +             };
>>> +
>>> +             sensor_mclk1_in: sensor-mclk1-in {
>>> +                     samsung,pins = "gpc0-1";
>>> +                     samsung,pin-function = <0>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <2>;
>>> +             };
>>> +
>>> +             sensor_mclk1_out: sensor-mclk1-out {
>>> +                     samsung,pins = "gpc0-1";
>>> +                     samsung,pin-function = <1>;
>>> +                     samsung,pin-pud = <1>;
>>> +                     samsung,pin-drv = <2>;
>>> +             };
>>> +
>>> +             sensor_mclk1_fn: sensor-mclk1-fn {
>>> +                     samsung,pins = "gpc0-1";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <2>;
>>> +             };
>>> +
>>> +             sensor_mclk2_in: sensor-mclk2-in {
>>> +                     samsung,pins = "gpc0-2";
>>> +                     samsung,pin-function = <0>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <2>;
>>> +             };
>>> +
>>> +             sensor_mclk2_out: sensor-mclk2-out {
>>> +                     samsung,pins = "gpc0-2";
>>> +                     samsung,pin-function = <1>;
>>> +                     samsung,pin-pud = <1>;
>>> +                     samsung,pin-drv = <2>;
>>> +             };
>>> +
>>> +             sensor_mclk2_fn: sensor-mclk2-fn {
>>> +                     samsung,pins = "gpc0-2";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <0>;
>>> +                     samsung,pin-drv = <2>;
>>> +             };
>>> +     };
>>> +};
>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850-usi.dtsi b/arch/arm64/boot/dts/exynos/exynos850-usi.dtsi
>>> new file mode 100644
>>> index 000000000000..fb243e0a6260
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/exynos/exynos850-usi.dtsi
>>> @@ -0,0 +1,30 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Samsung's Exynos850 SoC USI device tree source
>>> + *
>>> + * Copyright (C) 2019 Samsung Electronics Co., Ltd.
>>> + * Copyright (C) 2021 Linaro Ltd.
>>> + *
>>> + * Samsung's Exynos850 SoC USI channels are listed in this file as device tree
>>> + * nodes.
>>
>> Why here not in exynos850.dtsi?
>>
> 
> Yeah, you're right. As it's only serial_0 for now, I've moved that
> into exynos850.dtsi and removed exynos850-usi.dtsi.
> 
>>> + */
>>> +
>>> +#include <dt-bindings/clock/exynos850.h>
>>> +
>>> +/ {
>>> +     aliases {
>>> +             uart0 = &serial_0;
>>> +     };
>>> +
>>> +     /* USI_UART */
>>> +     serial_0: uart@13820000 {
>>
>> This should ne in soc node.
>>
> 
> Done.
> 
>>> +             compatible = "samsung,exynos850-uart";
>>> +             reg = <0x0 0x13820000 0x100>;
>>> +             interrupts = <GIC_SPI INTREQ__UART IRQ_TYPE_LEVEL_HIGH>;
>>> +             pinctrl-names = "default";
>>> +             pinctrl-0 = <&uart0_bus>;
>>> +             clocks = <&clock GATE_UART_QCH>, <&clock DOUT_UART>;
>>> +             clock-names = "gate_uart_clk0", "uart";
>>> +             status = "disabled";
>>> +     };
>>> +};
>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>> new file mode 100644
>>> index 000000000000..ed2d1c8ae0c3
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>> @@ -0,0 +1,245 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Samsung Exynos850 SoC device tree source
>>> + *
>>> + * Copyright (C) 2018 Samsung Electronics Co., Ltd.
>>> + * Copyright (C) 2021 Linaro Ltd.
>>> + *
>>> + * Samsung Exynos850 SoC device nodes are listed in this file.
>>> + * Exynos based board files can include this file and provide
>>> + * values for board specific bindings.
>>> + */
>>> +
>>> +#include <dt-bindings/interrupt-controller/exynos850.h>
>>> +#include <dt-bindings/clock/exynos850.h>
>>> +#include "exynos850-pinctrl.dtsi"
>>> +#include "exynos850-usi.dtsi"
>>> +
>>> +/ {
>>
>> Add a comment like:
>> /* Also known under engineering name exynos3830 */
>>
> 
> Sure.
> 
>>> +     compatible = "samsung,exynos850";
>>
>> Undocumented compatible. Checkpatch should complain.
>>
> 
> It actually doesn't, though it does complain about other undocumented
> compatibles. I understand that it should be documented in
> samsung-boards.yaml, but is it ok with you if I do that later, when
> adding some actual board's dts? Just don't want to have two patches
> for that.

We're back to the first question - it needs to come with DTS and then
you document both compatibles.

Best regards,
Krzysztof
