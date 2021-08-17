Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A59063EF21B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 20:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbhHQSnF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 14:43:05 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:34335 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbhHQSnC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Aug 2021 14:43:02 -0400
Received: by mail-ot1-f47.google.com with SMTP id e13-20020a9d63cd0000b02904fa42f9d275so26114858otl.1;
        Tue, 17 Aug 2021 11:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t12bYEBWi0z4wmn6e6NLudRTxxoZl2hQIUrRPCOM8Q4=;
        b=skuihdxEcBY/1D9rEkCR9HwV36dBgKVjiH9DxAKXGhsYTmOgTcuHGDk8OLSRTRwC7j
         vR+tezt+NuAThQmx7+WboRDvwQwdZK6xx1rs/LNghom0DZ+0Quf/EbhBTxzwQvSSxGQK
         +mZNLBlXE8NeX3q8NymjjvpcC7aNE6Xw2Ad/tpQx5Pc+9kFAH+2GmXJzLcS49p/tkR69
         KLr2BflARkCJ8v/jlF+7CCB8KXjQqp89UmNLBbQgXWwnrF9AYlgdrFUAzet7p3x+Pjih
         0Qji/u4BcZIijtMVC3Jk3nyOkRP/4GXRK62Oj/t7bchKKQfPI7QVI3pYN1YUwVCOBSsF
         G6vg==
X-Gm-Message-State: AOAM531QZqo7+vwwB5LbmVOPrE9C8io4khoXrCvN8GntP9o/3jsNToZl
        6aHW6XfBaQtYvmPSimn1Kw==
X-Google-Smtp-Source: ABdhPJyCXj4v1SFKlL3zbu1pyq/qO7MurDY6wV3I33NhP8P34saidcSdVm4f636dw43lzo+g5tav0A==
X-Received: by 2002:a05:6830:2a08:: with SMTP id y8mr3835309otu.61.1629225748122;
        Tue, 17 Aug 2021 11:42:28 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a19sm554079otl.48.2021.08.17.11.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 11:42:27 -0700 (PDT)
Received: (nullmailer pid 632074 invoked by uid 1000);
        Tue, 17 Aug 2021 18:42:25 -0000
Date:   Tue, 17 Aug 2021 13:42:25 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Marc Zyngier <maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
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
Subject: Re: [PATCH v3 7/7] arm64: dts: exynos: Add Exynos850 SoC support
Message-ID: <YRwDETpe019RFU/q@robh.at.kernel.org>
References: <20210811114827.27322-1-semen.protsenko@linaro.org>
 <20210811114827.27322-8-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811114827.27322-8-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 11, 2021 at 02:48:27PM +0300, Sam Protsenko wrote:
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

Please name all the pinctrl nodes with some pattern you can match on 
once there is a schema. '-pins$' is my suggestion.

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
