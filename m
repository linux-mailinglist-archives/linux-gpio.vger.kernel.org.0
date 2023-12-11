Return-Path: <linux-gpio+bounces-1227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35BE80C955
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 13:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 683C0281F06
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 12:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0723AC0B;
	Mon, 11 Dec 2023 12:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TSNUP2wo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CEF2100
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 04:17:38 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-67aa0f5855cso17754256d6.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 04:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702297057; x=1702901857; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=weJs7F5I5VRt8s3+6YY9cKhr4E2GG1O5biwr1GlkqQU=;
        b=TSNUP2wo1d5MBU6KMMFL0s3S4EoEL3+BCChoAglvT77QAwnxE3DeGrQVtgN3jVDCKR
         DstIbVsrqo9TLrEejRNFc3I61rethHhcI8yQiN1FxSMhIZs31lX1RM5PfOE09Hsk5RLv
         8Xjni1IFD5pQbg+XMLXW91QJBga4pfPs12dDzBIxTELp8opURQ2zdzKz6YAoTOUOZLxY
         D3CHTiXEhdU2Dqm2t7Qa51ASCaxUYTvTqUF3m5xtnH5ievoKdv73f8tHvXGaLZ5z2b0q
         GeOO/s34AOVSIyRJvtGvFsuv4/Jj+vyZLZga2Qz4mA+6SNmxgKPGZAcmiktvC17gEF9N
         OFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702297057; x=1702901857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weJs7F5I5VRt8s3+6YY9cKhr4E2GG1O5biwr1GlkqQU=;
        b=baow8ZD5fJBLS8pTx7kSIdaOFEYxUwpaTyejigDnAjCI8ktqhTk5a7Asa5GmvP23Tn
         YCEDlI0mR7EiTb+tS8ACmf9R37hDF2MD6my/B+/oJ4kZ42Qk9h+z9+0Uh77nanFX0D2R
         4/5e6Vszn0ioi5KbWFekUlVZMP89pZO4u9mhQbIvH6JsNI6hkv4Apiehb4NPpFXU0BQ8
         trLULe3VzLz4aRU5Zg3GtzYmnqstrBl70R5UpR0dSGMbPLQ+NV0kKP90ve/OczKfhafz
         772aNNe7neS0CPcq63UTgV/kZjBA4eXRBEI4tEUYcCmtXEqMzxi1U52FSej3n6OpCfoe
         iYbw==
X-Gm-Message-State: AOJu0YwwzzvWjhwifdp0M04UrY4905GE29T35L2xi7r+Sj3oM8QmAxRF
	VhVzXgBHcv6HVWnMJ1pBvtlXQ/TEr1Ya//6+aQ5Dwg==
X-Google-Smtp-Source: AGHT+IEEvAPb45aBvYhEnydf2ATr4KwpJVQ6oTQtixyLZOWuQQh7K+G0LE24Cn38PxHgQzAjCYtj/Kf5blW1AEGbtbY=
X-Received: by 2002:a0c:cdc8:0:b0:67a:a721:ec30 with SMTP id
 a8-20020a0ccdc8000000b0067aa721ec30mr2103392qvn.116.1702297057267; Mon, 11
 Dec 2023 04:17:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-19-peter.griffin@linaro.org> <8400d76b-2a04-4d60-ad6c-954dca07562f@linaro.org>
In-Reply-To: <8400d76b-2a04-4d60-ad6c-954dca07562f@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 11 Dec 2023 12:17:25 +0000
Message-ID: <CADrjBPotdY3guj_ZAx4pWqkkM_SDZCGRgRwJVJxM_x5BxcKSjA@mail.gmail.com>
Subject: Re: [PATCH v6 18/20] arm64: dts: exynos: google: Add initial Google
 gs101 SoC support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for the review.

On Sun, 10 Dec 2023 at 14:38, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2023 00:31, Peter Griffin wrote:
> > Google gs101 SoC is a ARMv8 mobile SoC found in the Pixel 6
> > (oriole), Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
> > phones.
> >
> > It features:
> > * 4xA55 Little cluster
> > * 2xA76 Mid cluster
> > * 2xX1 Big cluster
> >
>
> ...
>
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h b/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h
> > new file mode 100644
> > index 000000000000..68b7bc47c91b
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h
> > @@ -0,0 +1,33 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Pinctrl binding constants for GS101
> > + *
> > + * Copyright 2020-2023 Google LLC
> > + */
> > +
> > +#ifndef __DT_BINDINGS_PINCTRL_GS101_H__
> > +#define __DT_BINDINGS_PINCTRL_GS101_H__
>
> Header guards don't really match location.

Will fix.

>
> > +
> > +#define GS101_PIN_PULL_NONE          0
> > +#define GS101_PIN_PULL_DOWN          1
> > +#define GS101_PIN_PULL_UP            3
> > +
> > +/* Pin function in power down mode */
> > +#define GS101_PIN_PDN_OUT0           0
> > +#define GS101_PIN_PDN_OUT1           1
> > +#define GS101_PIN_PDN_INPUT          2
> > +#define GS101_PIN_PDN_PREV           3
> > +
> > +/* GS101 drive strengths */
> > +#define GS101_PIN_DRV_2_5_MA         0
> > +#define GS101_PIN_DRV_5_MA           1
> > +#define GS101_PIN_DRV_7_5_MA         2
> > +#define GS101_PIN_DRV_10_MA          3
> > +
> > +#define GS101_PIN_FUNC_INPUT         0
> > +#define GS101_PIN_FUNC_OUTPUT                1
> > +#define GS101_PIN_FUNC_2             2
> > +#define GS101_PIN_FUNC_3             3
> > +#define GS101_PIN_FUNC_EINT          0xf
> > +
> > +#endif /* __DT_BINDINGS_PINCTRL_GS101_H__ */
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > new file mode 100644
> > index 000000000000..60e112d25246
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > @@ -0,0 +1,476 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * GS101 SoC
> > + *
> > + * Copyright 2019-2023 Google LLC
> > + * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
> > + */
> > +
> > +#include <dt-bindings/clock/google,gs101.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/soc/samsung,exynos-usi.h>
> > +
> > +/ {
> > +     compatible = "google,gs101";
> > +     #address-cells = <2>;
> > +     #size-cells = <1>;
> > +
> > +     interrupt-parent = <&gic>;
> > +
> > +     aliases {
> > +             pinctrl0 = &pinctrl_gpio_alive;
> > +             pinctrl1 = &pinctrl_far_alive;
> > +             pinctrl2 = &pinctrl_gsacore;
> > +             pinctrl3 = &pinctrl_gsactrl;
> > +             pinctrl4 = &pinctrl_peric0;
> > +             pinctrl5 = &pinctrl_peric1;
> > +             pinctrl6 = &pinctrl_hsi1;
> > +             pinctrl7 = &pinctrl_hsi2;
> > +     };
> > +
> > +     pmu-0 {
> > +             compatible = "arm,cortex-a55-pmu";
> > +             interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
> > +     };
> > +
> > +     pmu-1 {
> > +             compatible = "arm,cortex-a76-pmu";
> > +             interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
> > +     };
> > +
> > +     pmu-2 {
> > +             compatible = "arm,cortex-x1-pmu";
> > +             interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster2>;
> > +     };
> > +
> > +     pmu-3 {
> > +             compatible = "arm,dsu-pmu";
> > +             interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>;
> > +             cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
> > +                    <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> > +     };
>
> Keep alphabetical order of top-level nodes. pmu should be before psci

Will fix

>
> > +
> > +     /* TODO replace with CCF clock */
> > +     dummy_clk: oscillator {
>
> clock-3

Will fix

>
> > +             compatible = "fixed-clock";
> > +             #clock-cells = <0>;
> > +             clock-frequency = <12345>;
> > +             clock-output-names = "pclk";
> > +     };
> > +
> > +     cpus {
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             cpu-map {
> > +                     cluster0 {
> > +                             core0 {
> > +                                     cpu = <&cpu0>;
> > +                             };
> > +                             core1 {
> > +                                     cpu = <&cpu1>;
> > +                             };
> > +                             core2 {
> > +                                     cpu = <&cpu2>;
> > +                             };
> > +                             core3 {
> > +                                     cpu = <&cpu3>;
> > +                             };
> > +                     };
> > +
> > +                     cluster1 {
> > +                             core0 {
> > +                                     cpu = <&cpu4>;
> > +                             };
> > +                             core1 {
> > +                                     cpu = <&cpu5>;
> > +                             };
> > +                     };
> > +
> > +                     cluster2 {
> > +                             core0 {
> > +                                     cpu = <&cpu6>;
> > +                             };
> > +                             core1 {
> > +                                     cpu = <&cpu7>;
> > +                             };
> > +                     };
> > +             };
>
> ...
>
> > +
> > +     /* ect node is required to be present by bootloader */
> > +     ect {
> > +     };
>
> alphabetical order

Will fix

>
> > +
> > +     ext_24_5m: clock-1 {
> > +             compatible = "fixed-clock";
> > +             #clock-cells = <0>;
> > +             clock-output-names = "oscclk";
> > +     };
> > +
> > +     ext_200m: clock-2 {
> > +             compatible = "fixed-clock";
> > +             #clock-cells = <0>;
> > +             clock-output-names = "ext-200m";
> > +     };
> > +
> > +     psci {
> > +             compatible = "arm,psci-1.0";
> > +             method = "smc";
> > +     };
> > +
> > +     reserved_memory: reserved-memory {
> > +             #address-cells = <2>;
> > +             #size-cells = <1>;
> > +             ranges;
> > +
> > +             gsa_reserved_protected: gsa@90200000 {
> > +                     reg = <0x0 0x90200000 0x400000>;
> > +                     no-map;
> > +             };
> > +
> > +             tpu_fw_reserved: tpu-fw@93000000 {
> > +                     reg = <0x0 0x93000000 0x1000000>;
> > +                     no-map;
> > +             };
> > +
> > +             aoc_reserve: aoc@94000000 {
> > +                     reg = <0x0 0x94000000 0x03000000>;
> > +                     no-map;
> > +             };
> > +
> > +             abl_reserved: abl@f8800000 {
> > +                     reg = <0x0 0xf8800000 0x02000000>;
> > +                     no-map;
> > +             };
> > +
> > +             dss_log_reserved: dss-log-reserved@fd3f0000 {
> > +                     reg = <0x0 0xfd3f0000 0x0000e000>;
> > +                     no-map;
> > +             };
> > +
> > +             debug_kinfo_reserved: debug-kinfo-reserved@fd3fe000 {
> > +                     reg = <0x0 0xfd3fe000 0x00001000>;
> > +                     no-map;
> > +             };
> > +
> > +             bldr_log_reserved: bldr-log-reserved@fd800000 {
> > +                     reg = <0x0 0xfd800000 0x00100000>;
> > +                     no-map;
> > +             };
> > +
> > +             bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
> > +                     reg = <0x0 0xfd900000 0x00002000>;
> > +                     no-map;
> > +             };
> > +     };
> > +
> > +     timer {
>
> alphabetical order, so this goes to the end

Will fix

>
> > +             compatible = "arm,armv8-timer";
> > +             interrupts =
> > +                <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> > +                <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> > +                <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> > +                <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
> > +             clock-frequency = <24576000>;
>
> I don't remember if you already got Marc's wrath, so just in case: are
> you sure it is needed?
>
> Anyway, this is board specific, not SoC.

Will double check and if required move to the board file.

>
> > +     };
> > +
> > +     soc: soc@0 {
> > +             compatible = "simple-bus";
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             ranges = <0x0 0x0 0x0 0x40000000>;
> > +
> > +             cmu_misc: clock-controller@10010000 {
> > +                     compatible = "google,gs101-cmu-misc";
> > +                     reg = <0x10010000 0x8000>;
> > +                     #clock-cells = <1>;
> > +                     clocks =  <&cmu_top CLK_DOUT_CMU_MISC_BUS>,
>
> One space after =

Will fix.

>
> > +                               <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
> > +                     clock-names = "dout_cmu_misc_bus", "dout_cmu_misc_sss";
> > +             };
> > +
> > +             watchdog_cl0: watchdog@10060000 {
> > +                     compatible = "google,gs101-wdt";
> > +                     reg = <0x10060000 0x100>;
> > +                     interrupts = <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH 0>;
> > +                     clocks =
> > +                       <&cmu_misc CLK_GOUT_MISC_WDT_CLUSTER0_PCLK>,
>
> Join lines (clocks = <foo bar>). Same in other places.

Will fix.

>
> > +                       <&ext_24_5m>;
> > +                     clock-names = "watchdog", "watchdog_src";
> > +                     samsung,syscon-phandle = <&pmu_system_controller>;
> > +                     samsung,cluster-index = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             watchdog_cl1: watchdog@10070000 {
> > +                     compatible = "google,gs101-wdt";
> > +                     reg = <0x10070000 0x100>;
> > +                     interrupts = <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH 0>;
> > +                     clocks =
> > +                       <&cmu_misc CLK_GOUT_MISC_WDT_CLUSTER1_PCLK>,
> > +                       <&ext_24_5m>;
> > +                     clock-names = "watchdog", "watchdog_src";
> > +                     samsung,syscon-phandle = <&pmu_system_controller>;
> > +                     samsung,cluster-index = <1>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             gic: interrupt-controller@10400000 {
> > +                     compatible = "arm,gic-v3";
> > +                     #interrupt-cells = <4>;
> > +                     interrupt-controller;
> > +                     reg = <0x10400000 0x10000>, /* GICD */
> > +                           <0x10440000 0x100000>;/* GICR * 8 */
> > +                     interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> > +
> > +                     ppi-partitions {
> > +                             ppi_cluster0: interrupt-partition-0 {
> > +                                     affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
> > +                             };
> > +
> > +                             ppi_cluster1: interrupt-partition-1 {
> > +                                     affinity = <&cpu4 &cpu5>;
> > +                             };
> > +
> > +                             ppi_cluster2: interrupt-partition-2 {
> > +                                     affinity = <&cpu6 &cpu7>;
> > +                             };
> > +                     };
> > +             };
> > +
> > +             sysreg_peric0: syscon@10820000 {
> > +                     compatible = "google,gs101-peric0-sysreg", "syscon";
> > +                     reg = <0x10820000 0x10000>;
> > +             };
> > +
> > +             pinctrl_peric0: pinctrl@10840000 {
> > +                     compatible = "google,gs101-pinctrl";
> > +                     reg = <0x10840000 0x00001000>;
> > +                     interrupts = <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0>;
> > +             };
> > +
> > +             usi_uart: usi@10a000c0 {
> > +                     compatible = "google,gs101-usi",
> > +                                  "samsung,exynos850-usi";
> > +                     reg = <0x10a000c0 0x20>;
> > +                     samsung,sysreg = <&sysreg_peric0 0x1020>;
> > +                     samsung,mode = <USI_V2_UART>;
>
> vendor properties go to the end, after standard properties, before status.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/tree/Documentation/devicetree/bindings/dts-coding-style.rst?h=dt/next&id=0d3a771610d0e155c9aa305f142f84dda5030fae#n122

Will fix, and thanks for the pointer to the documentation about this.
Much appreciated.

>
> > +                     #address-cells = <1>;
> > +                     #size-cells = <1>;
> > +                     ranges;
> > +                     clocks = <&dummy_clk>, <&dummy_clk>;
> > +                     clock-names = "pclk", "ipclk";
> > +                     status = "disabled";
> > +
> > +                     serial_0: serial@10a00000 {
> > +                             compatible = "google,gs101-uart";
> > +                             reg = <0x10a00000 0xc0>;
> > +                             reg-io-width = <4>;
> > +                             samsung,uart-fifosize = <256>;
>
> Ditto

Will fix.

>
> > +                             interrupts = <GIC_SPI 634
> > +                                           IRQ_TYPE_LEVEL_HIGH 0>;
> > +                             clocks = <&dummy_clk 0>, <&dummy_clk 0>;
> > +                             clock-names = "uart", "clk_uart_baud0";
> > +                             status = "disabled";
> > +                     };
> > +             };
>
>
regards,

Peter

