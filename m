Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE913ED137
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 11:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235519AbhHPJqD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 05:46:03 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:36696
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235516AbhHPJqD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Aug 2021 05:46:03 -0400
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 52A5940CBA
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 09:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629107127;
        bh=0YPeosyPSKYRu+3IMfidh4Xy4sl5Ld4HC2vVfEQcmh8=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=knmfLTwYYlk+AxjW60bh1sR9dBCBPVP25ps+bsxO1n9x+UIpDIeBffaxaWHaTxu50
         DyjAQcw/OrSo1KPnaUIri67hxlNNdn39dadN60xfaJDNiU7uZs3+WznMcXkw1DlFV+
         P8EiJywLSQ+MAHrqoBKehZhJ6rwChro225FHInEkMfSv7gIWPeEPKjM08kMFD/fQ9z
         lxHhMtnwZfdHBhgh6Pz4We9l/fqV+ShqcvyMeWlv+zpDug3CVu0fzfgreVbNT+sni/
         oCjbIrorDinNVF7BwaMjtkBxSiuydDtCziFDfchL4d9Uy8jlSB4n8vSZX+sZle80uB
         xXdfE0fSCbj7w==
Received: by mail-ej1-f69.google.com with SMTP id kf21-20020a17090776d5b02905af6ad96f02so4512797ejc.12
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 02:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0YPeosyPSKYRu+3IMfidh4Xy4sl5Ld4HC2vVfEQcmh8=;
        b=Kx2Ct7HxD+tOGchZ2DU0DaV/nAeNVFjkIMrDXwbv0SEbaRiMAAqgPvJMrCZK0eCMtE
         MGneIx3DA1hUVV9cGiuXkv7pqAhgxcnNm46tKCSlNdZvuJ4T8I2gjINGHqK43bLGsPuq
         A3ov+75mcJLAqnvgCY0TmrJpG0hq0NrWVSt8a88O6SiGBt/jJe3m9yykIDuY0AFVSjwy
         zMR4oMlD0Sa7yeT/9tT/4RnXaEFRkS0uQLu87QA61IWS74WeffQqar+4RQrzk+DBW9bp
         OMhPvap7lNphOavHnAkQMAilJwIeoudfFFZfwnztkfi9TFmZ3vrkpRSyW8bLiUX/CX83
         fh0Q==
X-Gm-Message-State: AOAM531jqCV20lwrz0EGwd5NHZhL4LWPD5at0JqXNxpU9lfDJwcKKTY1
        KOIc9usJGs5TrCKqH8AJsdhWF4W/i08u2dYZMh69FI1OJZSHFHuRX7RB0WGx3wQER7+Z5bOOXEo
        EPZPEfNh1brNMCNiykO6uSRk0NO8sIEqXcb1DzVw=
X-Received: by 2002:a17:906:b195:: with SMTP id w21mr3439822ejy.12.1629107126865;
        Mon, 16 Aug 2021 02:45:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuvp8D3ZgBwPmEOii5wrRifN9jfWsAO8nKcRBli/sHMv7eXnxEkHJaNyywLt+pQvHAdcMCQg==
X-Received: by 2002:a17:906:b195:: with SMTP id w21mr3439794ejy.12.1629107126702;
        Mon, 16 Aug 2021 02:45:26 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id wc16sm3479626ejb.15.2021.08.16.02.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 02:45:26 -0700 (PDT)
Subject: Re: [PATCH v3 7/7] arm64: dts: exynos: Add Exynos850 SoC support
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
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
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
References: <20210811114827.27322-1-semen.protsenko@linaro.org>
 <20210811114827.27322-8-semen.protsenko@linaro.org>
 <f0e892ce-acd0-7acc-4881-dd67dda6fb38@canonical.com>
 <CAPLW+4=2msw44EjujeTUvcYJ701iZTPwkVoO3UzZyakspev20A@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <40dd9a0a-eccc-1b0c-70ec-06edc8b91177@canonical.com>
Date:   Mon, 16 Aug 2021 11:45:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4=2msw44EjujeTUvcYJ701iZTPwkVoO3UzZyakspev20A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/08/2021 19:42, Sam Protsenko wrote:
> On Thu, 12 Aug 2021 at 11:17, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 11/08/2021 13:48, Sam Protsenko wrote:
>>> Samsung Exynos850 is ARMv8-based mobile-oriented SoC.
>>>
>>> This patch adds minimal SoC support by including next Device Tree nodes:
>>>
>>> 1. Octa cores (Cortex-A55), supporting PSCI v1.0
>>> 2. ARM architecture timer (armv8-timer)
>>> 3. Interrupt controller (GIC-400)
>>> 4. Pinctrl nodes for GPIO
>>> 5. Serial node
>>>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>> Changes in v3:
>>>  - Used generic fixed clock for serial
>>>
>>> Changes in v2:
>>>  * Commit message:
>>>    - Documented added dts features instead of CPU features
>>>
>>>  * exynos850-usi.dtsi:
>>>    - Removed, moved everything to exynos850.dtsi
>>>
>>>  * exynos850.dtsi:
>>>    - Root node:
>>>      - Added comment about engineering name (Exynos3830)
>>>      - Renamed pinctrl nodes, adding domain names
>>>      - Used hard coded IRQ numbers instead of named constants everywhere
>>>      - Added soc node, moved next nodes there: gic, clock, pinctrls and
>>>        serial
>>>      - Used address-cells=1 for soc node and removed unneeded 0x0 from
>>>        reg properties
>>>      - Moved exynos850-pinctrl.dtsi include line to the end of
>>>        exynos850.dtsi
>>>      - Coding style fixes
>>>    - cpus:
>>>      - Used address-cells=1 for cpus node
>>>      - Renamed cpu@0001 to cpu@1, and so on
>>>      - Left only "arm,cortex-a55" for cpus compatible
>>>      - Renamed reg = <0x0001> to <0x1> for cpus
>>>    - armv8 timer:
>>>      - Add comment about missing HV timer IRQ to armv8 timer node
>>>      - Removed not existing properties from armv8 timer node
>>>      - Fixed cpu number in CPU_MASK()
>>>      - Removed obsolete clock-frequency property
>>>    - GIC:
>>>      - Fixed GIC type to be GIC-400
>>>      - Fixed size of GIC's 2nd region to be 0x2000
>>>    - serial node:
>>>      - Hard coded clock number for serial_0 for now; will replace with
>>>        named const once proper clock driver is implemented
>>>      - Removed gate_uart_clk0 clock from serial_0, as that clock is not
>>>        supported in serial driver anyway (yet)
>>>    - clock node:
>>>      - Fixed clock controller node name (@0x12.. -> @12..)
>>>
>>>  * exynos850-pinctrl.dtsi:
>>>    - Referenced pinctrl nodes instead of defining those again in root node
>>>    - Fixed interrupt-cells (3 -> 2)
>>>    - Fixed USI related comments for pin config nodes
>>>    - Removed decon_f_te_* and fm_lna_en nodes (won't be used)
>>>    - Reordered pin config nodes by pin numbers
>>>    - Improved all comments
>>>    - Used existing named constants for pin-function and pin-pud
>>>    - Fixed node names (used hyphens instead of underscore)
>>>    - Fixed warnings found in W=1 build
>>>
>>>  .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 748 ++++++++++++++++++
>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 261 ++++++
>>>  2 files changed, 1009 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
>>> new file mode 100644
>>> index 000000000000..ba5d5f33e2f6
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
>>> @@ -0,0 +1,748 @@
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
>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +#include <dt-bindings/pinctrl/samsung.h>
>>> +
>>> +&pinctrl_alive {
>>> +     gpa0: gpa0 {
>>> +             gpio-controller;
>>> +             #gpio-cells = <2>;
>>> +
>>> +             interrupt-controller;
>>> +             #interrupt-cells = <2>;
>>> +             interrupt-parent = <&gic>;
>>> +             interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>>> +     };
>>> +
>>> +     gpa1: gpa1 {
>>> +             gpio-controller;
>>> +             #gpio-cells = <2>;
>>> +
>>> +             interrupt-controller;
>>> +             #interrupt-cells = <2>;
>>> +             interrupt-parent = <&gic>;
>>> +             interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>>> +     };
>>> +
>>> +     gpa2: gpa2 {
>>> +             gpio-controller;
>>> +             #gpio-cells = <2>;
>>> +
>>> +             interrupt-controller;
>>> +             #interrupt-cells = <2>;
>>> +             interrupt-parent = <&gic>;
>>> +             interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>>> +     };
>>> +
>>> +     gpa3: gpa3 {
>>> +             gpio-controller;
>>> +             #gpio-cells = <2>;
>>> +
>>> +             interrupt-controller;
>>> +             #interrupt-cells = <2>;
>>> +             interrupt-parent = <&gic>;
>>> +             interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>>> +     };
>>> +
>>> +     gpa4: gpa4 {
>>> +             gpio-controller;
>>> +             #gpio-cells = <2>;
>>> +
>>> +             interrupt-controller;
>>> +             #interrupt-cells = <2>;
>>> +             interrupt-parent = <&gic>;
>>> +             interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>>> +     };
>>> +
>>> +     gpq0: gpq0 {
>>> +             gpio-controller;
>>> +             #gpio-cells = <2>;
>>> +
>>> +             interrupt-controller;
>>> +             #interrupt-cells = <2>;
>>> +     };
>>> +
>>> +     /* I2C5 (also called CAM_PMIC_I2C in TRM) */
>>> +     i2c5_bus: i2c5-bus {
>>> +             samsung,pins = "gpa3-5", "gpa3-6";
>>> +             samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
>>> +             samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
>>> +             samsung,pin-drv = <0>;
>>> +     };
>>> +
>>> +     /* I2C6 (also called MOTOR_I2C in TRM) */
>>> +     i2c6_bus: i2c6-bus {
>>> +             samsung,pins = "gpa3-7", "gpa4-0";
>>> +             samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
>>> +             samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
>>> +             samsung,pin-drv = <0>;
>>> +     };
>>> +
>>> +     /* USI: UART */
>>> +     uart0_bus: uart0-bus {
>>> +             samsung,pins = "gpq0-0", "gpq0-1";
>>> +             samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
>>> +             samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
>>> +     };
>>> +};
>>> +
>>> +&pinctrl_cmgp {
>>> +     gpm0: gpm0 {
>>> +             gpio-controller;
>>> +             #gpio-cells = <2>;
>>> +
>>> +             interrupt-controller;
>>> +             #interrupt-cells = <2>;
>>> +             interrupt-parent = <&gic>;
>>> +             interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
>>> +     };
>>> +
>>> +     gpm1: gpm1 {
>>> +             gpio-controller;
>>> +             #gpio-cells = <2>;
>>> +
>>> +             interrupt-controller;
>>> +             #interrupt-cells = <2>;
>>> +             interrupt-parent = <&gic>;
>>> +             interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
>>> +     };
>>> +
>>> +     gpm2: gpm2 {
>>> +             gpio-controller;
>>> +             #gpio-cells = <2>;
>>> +
>>> +             interrupt-controller;
>>> +             #interrupt-cells = <2>;
>>> +             interrupt-parent = <&gic>;
>>> +             interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
>>> +     };
>>> +
>>> +     gpm3: gpm3 {
>>> +             gpio-controller;
>>> +             #gpio-cells = <2>;
>>> +
>>> +             interrupt-controller;
>>> +             #interrupt-cells = <2>;
>>> +             interrupt-parent = <&gic>;
>>> +             interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
>>> +     };
>>> +
>>> +     gpm4: gpm4 {
>>> +             gpio-controller;
>>> +             #gpio-cells = <2>;
>>> +
>>> +             interrupt-controller;
>>> +             #interrupt-cells = <2>;
>>> +             interrupt-parent = <&gic>;
>>> +             interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>>> +     };
>>> +
>>> +     gpm5: gpm5 {
>>> +             gpio-controller;
>>> +             #gpio-cells = <2>;
>>> +
>>> +             interrupt-controller;
>>> +             #interrupt-cells = <2>;
>>> +             interrupt-parent = <&gic>;
>>> +             interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
>>> +     };
>>> +
>>> +     /* USI_CMGP0: HSI2C function */
>>> +     hsi2c3_bus: hsi2c3-bus {
>>> +             samsung,pins = "gpm0-0", "gpm1-0";
>>> +             samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
>>> +             samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
>>> +             samsung,pin-drv = <0>;
>>
>> There are also macros for DRV.
>>
> 
> Unfortunately, existing DRV macros won't work for Exynos850. DRV
> constants have different meaning for different GPIO domains in
> Exynos850, so I thought introducing several groups of DRV constants
> might be confusing. But please let me know if you still want me do
> that.
> 

Oh, damn, raw values are ok then.


Best regards,
Krzysztof
