Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5EC3EA072
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 10:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234093AbhHLISQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 04:18:16 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:39842
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235102AbhHLISM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Aug 2021 04:18:12 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id A0FAB3F0A2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 08:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628756266;
        bh=S8najR91LdeCOHewSNHVvzm6RVQFLJakoKJmVvB2l2o=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=SPX57QnUirHp8ktN4M7KUg8lOKQbbjhyNgvaReOOP4swu1pj+mfW0YkvWcFloapjX
         5kckfWI4y0LwbuV6bIURwemIlXu8RlvWsvuH1l+Z0i+LPo6W9jSo8TLF4v7DnMDl+b
         yeIVbU94IF4/bwmf8wJUpif4ewWEn/7inlcfnnSqpZzzdd5zl6i6EBkvB5K7JEo76H
         jxh9DWcmHlymJzFTJZAVaQ/jhqBFVyfpzxC3z0AiThIGaqbNZGTUXFBVB19ugchXYt
         70rkqKfYeK3umJsH4S5ugP1saYcw9XDBiaepmxnQPaRjY75M01XHAg9dlg5Nf1BR+w
         bg21lEuK3gt8Q==
Received: by mail-wm1-f71.google.com with SMTP id l19-20020a05600c4f13b029025b036c91c6so1589546wmq.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 01:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S8najR91LdeCOHewSNHVvzm6RVQFLJakoKJmVvB2l2o=;
        b=OEkVnl7AdXHC3uwM6VErQOI5bFHV9HDSTuD4f/Y05BuHldaA85BMmMDp+rLIR3ZG0w
         w1EpBqBun0zGyQ9hJyIR7qy7zEdz1en21GhIaQkLod3/tTKznCiwdCXdsPtY/rnfPwjo
         NAwYBUpUiPwVDjE3cZo0kksUy11+OJiawuWb0mtF+NpbpStILPjK/2oYmvEj7EbUEhEq
         wmvSH8exTsFtlFSrHTj2V2jOtzC9tLn7M7LD56OI/qE5DYsAuP9vs1E9528zLQLheYC6
         a2fek50dobh5DeJoHCrd9X9Qz1oFazuc8Km80vkxNStaXZ5GLodOmAL9k4hfLnlHEFI4
         GCZA==
X-Gm-Message-State: AOAM531nOhYDS4p/5SoRwIHa5pr9cQz+EK6JNoZZuprusCg/qKpkJm2M
        7zIi87Tg5uUYukAOX1ow2QhexkEEkuBv4AScMxb1137vxJewTjiIMz1ycZ7EhpuzFasgJHDhDK5
        nq1Y+8J1IKV5PWGcJ/GjlFwiilCL0uKFfZC7Wyn0=
X-Received: by 2002:a50:ff19:: with SMTP id a25mr3940644edu.311.1628756255631;
        Thu, 12 Aug 2021 01:17:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcx6Y0xZT+z7esb9nKfDYWRfjQiUwZgK46UCQeYU2aGgtbRCFtPatO9OwMw8sU4TTBzZOwPQ==
X-Received: by 2002:a50:ff19:: with SMTP id a25mr3940592edu.311.1628756255266;
        Thu, 12 Aug 2021 01:17:35 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id 8sm517557ejy.65.2021.08.12.01.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 01:17:34 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org
References: <20210811114827.27322-1-semen.protsenko@linaro.org>
 <20210811114827.27322-8-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 7/7] arm64: dts: exynos: Add Exynos850 SoC support
Message-ID: <f0e892ce-acd0-7acc-4881-dd67dda6fb38@canonical.com>
Date:   Thu, 12 Aug 2021 10:17:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811114827.27322-8-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/08/2021 13:48, Sam Protsenko wrote:
> Samsung Exynos850 is ARMv8-based mobile-oriented SoC.
> 
> This patch adds minimal SoC support by including next Device Tree nodes:
> 
> 1. Octa cores (Cortex-A55), supporting PSCI v1.0
> 2. ARM architecture timer (armv8-timer)
> 3. Interrupt controller (GIC-400)
> 4. Pinctrl nodes for GPIO
> 5. Serial node
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v3:
>  - Used generic fixed clock for serial
> 
> Changes in v2:
>  * Commit message:
>    - Documented added dts features instead of CPU features
> 
>  * exynos850-usi.dtsi:
>    - Removed, moved everything to exynos850.dtsi
> 
>  * exynos850.dtsi:
>    - Root node:
>      - Added comment about engineering name (Exynos3830)
>      - Renamed pinctrl nodes, adding domain names
>      - Used hard coded IRQ numbers instead of named constants everywhere
>      - Added soc node, moved next nodes there: gic, clock, pinctrls and
>        serial
>      - Used address-cells=1 for soc node and removed unneeded 0x0 from
>        reg properties
>      - Moved exynos850-pinctrl.dtsi include line to the end of
>        exynos850.dtsi
>      - Coding style fixes
>    - cpus:
>      - Used address-cells=1 for cpus node
>      - Renamed cpu@0001 to cpu@1, and so on
>      - Left only "arm,cortex-a55" for cpus compatible
>      - Renamed reg = <0x0001> to <0x1> for cpus
>    - armv8 timer:
>      - Add comment about missing HV timer IRQ to armv8 timer node
>      - Removed not existing properties from armv8 timer node
>      - Fixed cpu number in CPU_MASK()
>      - Removed obsolete clock-frequency property
>    - GIC:
>      - Fixed GIC type to be GIC-400
>      - Fixed size of GIC's 2nd region to be 0x2000
>    - serial node:
>      - Hard coded clock number for serial_0 for now; will replace with
>        named const once proper clock driver is implemented
>      - Removed gate_uart_clk0 clock from serial_0, as that clock is not
>        supported in serial driver anyway (yet)
>    - clock node:
>      - Fixed clock controller node name (@0x12.. -> @12..)
> 
>  * exynos850-pinctrl.dtsi:
>    - Referenced pinctrl nodes instead of defining those again in root node
>    - Fixed interrupt-cells (3 -> 2)
>    - Fixed USI related comments for pin config nodes
>    - Removed decon_f_te_* and fm_lna_en nodes (won't be used)
>    - Reordered pin config nodes by pin numbers
>    - Improved all comments
>    - Used existing named constants for pin-function and pin-pud
>    - Fixed node names (used hyphens instead of underscore)
>    - Fixed warnings found in W=1 build
> 
>  .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 748 ++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 261 ++++++
>  2 files changed, 1009 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> new file mode 100644
> index 000000000000..ba5d5f33e2f6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> @@ -0,0 +1,748 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung's Exynos850 SoC pin-mux and pin-config device tree source
> + *
> + * Copyright (C) 2017 Samsung Electronics Co., Ltd.
> + * Copyright (C) 2021 Linaro Ltd.
> + *
> + * Samsung's Exynos850 SoC pin-mux and pin-config options are listed as device
> + * tree nodes in this file.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/samsung.h>
> +
> +&pinctrl_alive {
> +	gpa0: gpa0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpa1: gpa1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpa2: gpa2 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpa3: gpa3 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpa4: gpa4 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpq0: gpq0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	/* I2C5 (also called CAM_PMIC_I2C in TRM) */
> +	i2c5_bus: i2c5-bus {
> +		samsung,pins = "gpa3-5", "gpa3-6";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	/* I2C6 (also called MOTOR_I2C in TRM) */
> +	i2c6_bus: i2c6-bus {
> +		samsung,pins = "gpa3-7", "gpa4-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	/* USI: UART */
> +	uart0_bus: uart0-bus {
> +		samsung,pins = "gpq0-0", "gpq0-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +};
> +
> +&pinctrl_cmgp {
> +	gpm0: gpm0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpm1: gpm1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpm2: gpm2 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpm3: gpm3 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpm4: gpm4 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpm5: gpm5 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	/* USI_CMGP0: HSI2C function */
> +	hsi2c3_bus: hsi2c3-bus {
> +		samsung,pins = "gpm0-0", "gpm1-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <0>;

There are also macros for DRV.

I assume you checked whether the actual values of FUNC/PULL/DRV macros
match Exynos850 datasheet.

> +	};
> +
> +	/* USI_CMGP0: UART function (4 pins, Auto Flow Control) */
> +	uart1_bus_single: uart1-bus {
> +		samsung,pins = "gpm0-0", "gpm1-0", "gpm2-0", "gpm3-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_CMGP0: UART function (2 pins, Non-Auto Flow Control) */
> +	uart1_bus_dual: uart1-bus-dual {
> +		samsung,pins = "gpm0-0", "gpm1-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_CMGP0: SPI function */
> +	spi1_bus: spi1-bus {
> +		samsung,pins = "gpm0-0", "gpm1-0", "gpm2-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	spi1_cs: spi1-cs {
> +		samsung,pins = "gpm3-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	spi1_cs_func: spi1-cs-func {
> +		samsung,pins = "gpm3-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	/* USI_CMGP1: HSI2C function */
> +	hsi2c4_bus: hsi2c4-bus {
> +		samsung,pins = "gpm4-0", "gpm5-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	/* USI_CMGP1: UART function (4 pins, Auto Flow Control) */
> +	uart2_bus_single: uart2-bus {
> +		samsung,pins = "gpm4-0", "gpm5-0", "gpm6-0", "gpm7-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_CMGP1: UART function (2 pins, Non-Auto Flow Control) */
> +	uart2_bus_dual: uart2-bus-dual {
> +		samsung,pins = "gpm4-0", "gpm5-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
> +	/* USI_CMGP1: SPI function */
> +	spi2_bus: spi2-bus {
> +		samsung,pins = "gpm4-0", "gpm5-0", "gpm6-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	spi2_cs: spi2-cs {
> +		samsung,pins = "gpm7-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	spi2_cs_func: spi2-cs-func {
> +		samsung,pins = "gpm7-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <0>;
> +	};
> +};
> +
> +&pinctrl_aud {
> +	gpb0: gpb0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb1: gpb1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	aud_codec_mclk: aud-codec-mclk {
> +		samsung,pins = "gpb0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_codec_mclk_idle: aud-codec-mclk-idle {
> +		samsung,pins = "gpb0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s0_bus: aud-i2s0-bus {
> +		samsung,pins = "gpb0-1", "gpb0-2", "gpb0-3", "gpb0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s0_idle: aud-i2s0-idle {
> +		samsung,pins = "gpb0-1", "gpb0-2", "gpb0-3", "gpb0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s1_bus: aud-i2s1-bus {
> +		samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_i2s1_idle: aud-i2s1-idle {
> +		samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_fm_bus: aud-fm-bus {
> +		samsung,pins = "gpb1-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +
> +	aud_fm_idle: aud-fm-idle {
> +		samsung,pins = "gpb1-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +};
> +
> +&pinctrl_hsi {
> +	gpf2: gpf2 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	sd2_clk: sd2-clk {
> +		samsung,pins = "gpf2-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <2>;
> +	};
> +
> +	sd2_clk_fast_slew_rate_1x: sd2-clk-fast-slew-rate-1x {
> +		samsung,pins = "gpf2-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	sd2_clk_fast_slew_rate_1_5x: sd2-clk-fast-slew-rate-1-5x {
> +		samsung,pins = "gpf2-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <1>;
> +	};
> +
> +	sd2_clk_fast_slew_rate_2x: sd2-clk-fast-slew-rate-2x {
> +		samsung,pins = "gpf2-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <2>;
> +	};
> +
> +	sd2_clk_fast_slew_rate_2_5x: sd2-clk-fast-slew-rate-2-5x {
> +		samsung,pins = "gpf2-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <3>;
> +	};
> +
> +	sd2_clk_fast_slew_rate_3x: sd2-clk-fast-slew-rate-3x {
> +		samsung,pins = "gpf2-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <4>;
> +	};
> +
> +	sd2_clk_fast_slew_rate_4x: sd2-clk-fast-slew-rate-4x {
> +		samsung,pins = "gpf2-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <5>;
> +	};
> +
> +	sd2_cmd: sd2-cmd {
> +		samsung,pins = "gpf2-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <2>;
> +	 };
> +
> +	sd2_bus1: sd2-bus-width1 {
> +		samsung,pins = "gpf2-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <2>;
> +	};
> +
> +	sd2_bus4: sd2-bus-width4 {
> +		samsung,pins = "gpf2-3", "gpf2-4", "gpf2-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <2>;
> +	};
> +
> +	sd2_pins_as_pdn: sd2-pins-as-pdn {
> +		samsung,pins = "gpf2-0", "gpf2-1", "gpf2-2", "gpf2-3",
> +			       "gpf2-4", "gpf2-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +	};
> +};
> +
> +&pinctrl_core {
> +	gpf0: gpf0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpf1: gpf1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	sd0_clk: sd0-clk {
> +		samsung,pins = "gpf0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <3>;
> +	};
> +
> +	sd0_clk_fast_slew_rate_1x: sd0-clk-fast-slew-rate-1x {
> +		samsung,pins = "gpf0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <1>;
> +	};
> +
> +	sd0_clk_fast_slew_rate_2x: sd0-clk-fast-slew-rate-2x {
> +		samsung,pins = "gpf0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <2>;
> +	};
> +
> +	sd0_clk_fast_slew_rate_3x: sd0-clk-fast-slew-rate-3x {
> +		samsung,pins = "gpf0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <2>;
> +	};
> +
> +	sd0_clk_fast_slew_rate_4x: sd0-clk-fast-slew-rate-4x {
> +		samsung,pins = "gpf0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <3>;
> +	};
> +
> +	sd0_cmd: sd0-cmd {
> +		samsung,pins = "gpf0-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <3>;
> +	};
> +
> +	sd0_rdqs: sd0-rdqs {
> +		samsung,pins = "gpf0-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +		samsung,pin-drv = <3>;
> +	};
> +
> +	sd0_nreset: sd0-nreset {
> +		samsung,pins = "gpf0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <3>;
> +	};
> +
> +	sd0_bus1: sd0-bus-width1 {
> +		samsung,pins = "gpf1-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <3>;
> +	};
> +
> +	sd0_bus4: sd0-bus-width4 {
> +		samsung,pins = "gpf1-1", "gpf1-2", "gpf1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <3>;
> +	};
> +
> +	sd0_bus8: sd0-bus-width8 {
> +		samsung,pins = "gpf1-4", "gpf1-5", "gpf1-6", "gpf1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <3>;
> +	};
> +};
> +
> +&pinctrl_peri {
> +	gpg0: gpg0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpp0: gpp0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +	gpp1: gpp1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpp2: gpp2 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg1: gpg1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg2: gpg2 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpg3: gpg3 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpc0: gpc0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpc1: gpc1 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	/* USI: HSI2C0 */
> +	hsi2c0_bus: hsi2c0-bus {
> +		samsung,pins = "gpc1-0", "gpc1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	/* USI: HSI2C1 */
> +	hsi2c1_bus: hsi2c1-bus {
> +		samsung,pins = "gpc1-2", "gpc1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	/* USI: HSI2C2 */
> +	hsi2c2_bus: hsi2c2-bus {
> +		samsung,pins = "gpc1-4", "gpc1-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	/* USI: SPI */
> +	spi0_bus: spi0-bus {
> +		samsung,pins = "gpp2-0", "gpp2-2", "gpp2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	spi0_cs: spi0-cs {
> +		samsung,pins = "gpp2-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	spi0_cs_func: spi0-cs-func {
> +		samsung,pins = "gpp2-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	i2c0_bus: i2c0-bus {
> +		samsung,pins = "gpp0-0", "gpp0-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	i2c1_bus: i2c1-bus {
> +		samsung,pins = "gpp0-2", "gpp0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	i2c2_bus: i2c2-bus {
> +		samsung,pins = "gpp0-4", "gpp0-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	i2c3_bus: i2c3-bus {
> +		samsung,pins = "gpp1-0", "gpp1-1";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	i2c4_bus: i2c4-bus {
> +		samsung,pins = "gpp1-2", "gpp1-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	sensor_mclk0_in: sensor-mclk0-in {
> +		samsung,pins = "gpc0-0";

All these gpc0 go before hsi2c0_bus node (to have them ordered by
datasheet pin name).

> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <2>;
> +	};
> +

Rest looks good but anyway will wait for the board DTS. :)

Best regards,
Krzysztof
