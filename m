Return-Path: <linux-gpio+bounces-1203-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1496E80BE56
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 00:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 886BD1F20E7A
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 23:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743DE1DFF5;
	Sun, 10 Dec 2023 23:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+5Xqu3M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67274EB
	for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 15:48:01 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-286e05d9408so2880967a91.1
        for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 15:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702252081; x=1702856881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gq4gs9H1LdhHAHkv2rBgKSqg7vsFCOtAe9enDaStH0A=;
        b=V+5Xqu3MQZ3lc7pqC4j1PItZf+11XYeKxrEJ6qrqxyh84eyT15q24ZeFm4ewKFdyRv
         ymIkRBmwqdMpBoV/hKBlwuMNzDpxu8NXYMKc2/hNjs8eIb+nnzT8Gg1osrqWlRj3AwoY
         MJz0CvOoEOGHLvNk2R3ngBT0car7/jygJrkms6qd4gYSXaJzUweMwbDsGo5b8WlwUN+5
         BLq8TTmFUq7OQ0CIs6jagMqtI+XTYpsEtcDCbWa8c6i2UVKm9ao+FYsm6uS0Ab9Zhyuc
         0zgRPk5qhFF1J1xGSwYsUAgDGr5KZnEDcTwMDPA5X+WxH3DHmM55d4Yh7w3YhYB2ulZA
         Z0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702252081; x=1702856881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gq4gs9H1LdhHAHkv2rBgKSqg7vsFCOtAe9enDaStH0A=;
        b=FfqilgE4lRD5lN3dTuWNx2c2yHE0Oh9x6Q6EbzsFfJMtwefDQLh6DIhjOHKaarhpjk
         kyXYYiUMJnlhxh3nw3BZlE5sde5sah9Le0Hy7GgJofYDamXO561HJawyGHIYom82wlu3
         8WQwKsMDOyVeVkVnnNX8j4fcxMci0t0scRKEubXnhDTqR21fTGXYX9KdsokPa9J4qamQ
         TjLXyWafIh+9vt7AowyFVuTSzDvlCkZ7Vtz5iH8Qz8xKK7tq9tPNmyL8krKpL5anT1Au
         SNMWlLVB9/KN6alEjZsk6Oeg8dVtZQN8aPiuvtMwOG8kGtB0TgFWYyFUXOmI3mlQT8Lk
         +5xQ==
X-Gm-Message-State: AOJu0Yw8NMPJhlZbcxg6nUlXcXl312YmLSiN1krA7TKyQdef6qw73hab
	EgrRFGl3fPB1dNirz+uxPZICMPy3ACMZ00Z3TUzpVA==
X-Google-Smtp-Source: AGHT+IGGKo8fcqF3rvcRAWo3OU9m8oKBxw8kZ1vTDX+zYJgiMNj03zdN5wnxKLykKpsIkEm9F18IOfxXGw/aHQUgIx4=
X-Received: by 2002:a17:90a:ec83:b0:286:6cd8:ef17 with SMTP id
 f3-20020a17090aec8300b002866cd8ef17mr5259705pjy.47.1702252080838; Sun, 10 Dec
 2023 15:48:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-19-peter.griffin@linaro.org> <8400d76b-2a04-4d60-ad6c-954dca07562f@linaro.org>
In-Reply-To: <8400d76b-2a04-4d60-ad6c-954dca07562f@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sun, 10 Dec 2023 17:47:49 -0600
Message-ID: <CAPLW+4=b5SoX8ngPhzjtf9bE+7bJcV+gS_0ocD=mKAX6Z8B1Qg@mail.gmail.com>
Subject: Re: [PATCH v6 18/20] arm64: dts: exynos: google: Add initial Google
 gs101 SoC support
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	cw00.choi@samsung.com, alim.akhtar@samsung.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 10, 2023 at 8:38=E2=80=AFAM Krzysztof Kozlowski
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
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h b/arch/a=
rm64/boot/dts/exynos/google/gs101-pinctrl.h
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
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/=
boot/dts/exynos/google/gs101.dtsi
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
> > +     compatible =3D "google,gs101";
> > +     #address-cells =3D <2>;
> > +     #size-cells =3D <1>;
> > +
> > +     interrupt-parent =3D <&gic>;
> > +
> > +     aliases {
> > +             pinctrl0 =3D &pinctrl_gpio_alive;
> > +             pinctrl1 =3D &pinctrl_far_alive;
> > +             pinctrl2 =3D &pinctrl_gsacore;
> > +             pinctrl3 =3D &pinctrl_gsactrl;
> > +             pinctrl4 =3D &pinctrl_peric0;
> > +             pinctrl5 =3D &pinctrl_peric1;
> > +             pinctrl6 =3D &pinctrl_hsi1;
> > +             pinctrl7 =3D &pinctrl_hsi2;
> > +     };
> > +
> > +     pmu-0 {
> > +             compatible =3D "arm,cortex-a55-pmu";
> > +             interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluste=
r0>;
> > +     };
> > +
> > +     pmu-1 {
> > +             compatible =3D "arm,cortex-a76-pmu";
> > +             interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluste=
r1>;
> > +     };
> > +
> > +     pmu-2 {
> > +             compatible =3D "arm,cortex-x1-pmu";
> > +             interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluste=
r2>;
> > +     };
> > +
> > +     pmu-3 {
> > +             compatible =3D "arm,dsu-pmu";
> > +             interrupts =3D <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>;
> > +             cpus =3D <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
> > +                    <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> > +     };
>
> Keep alphabetical order of top-level nodes. pmu should be before psci
>
> > +
> > +     /* TODO replace with CCF clock */
> > +     dummy_clk: oscillator {
>
> clock-3
>
> > +             compatible =3D "fixed-clock";
> > +             #clock-cells =3D <0>;
> > +             clock-frequency =3D <12345>;
> > +             clock-output-names =3D "pclk";
> > +     };
> > +
> > +     cpus {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             cpu-map {
> > +                     cluster0 {
> > +                             core0 {
> > +                                     cpu =3D <&cpu0>;
> > +                             };
> > +                             core1 {
> > +                                     cpu =3D <&cpu1>;
> > +                             };
> > +                             core2 {
> > +                                     cpu =3D <&cpu2>;
> > +                             };
> > +                             core3 {
> > +                                     cpu =3D <&cpu3>;
> > +                             };
> > +                     };
> > +
> > +                     cluster1 {
> > +                             core0 {
> > +                                     cpu =3D <&cpu4>;
> > +                             };
> > +                             core1 {
> > +                                     cpu =3D <&cpu5>;
> > +                             };
> > +                     };
> > +
> > +                     cluster2 {
> > +                             core0 {
> > +                                     cpu =3D <&cpu6>;
> > +                             };
> > +                             core1 {
> > +                                     cpu =3D <&cpu7>;
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
>
> > +
> > +     ext_24_5m: clock-1 {
> > +             compatible =3D "fixed-clock";
> > +             #clock-cells =3D <0>;
> > +             clock-output-names =3D "oscclk";
> > +     };
> > +
> > +     ext_200m: clock-2 {
> > +             compatible =3D "fixed-clock";
> > +             #clock-cells =3D <0>;
> > +             clock-output-names =3D "ext-200m";
> > +     };
> > +
> > +     psci {
> > +             compatible =3D "arm,psci-1.0";
> > +             method =3D "smc";
> > +     };
> > +
> > +     reserved_memory: reserved-memory {
> > +             #address-cells =3D <2>;
> > +             #size-cells =3D <1>;
> > +             ranges;
> > +
> > +             gsa_reserved_protected: gsa@90200000 {
> > +                     reg =3D <0x0 0x90200000 0x400000>;
> > +                     no-map;
> > +             };
> > +
> > +             tpu_fw_reserved: tpu-fw@93000000 {
> > +                     reg =3D <0x0 0x93000000 0x1000000>;
> > +                     no-map;
> > +             };
> > +
> > +             aoc_reserve: aoc@94000000 {
> > +                     reg =3D <0x0 0x94000000 0x03000000>;
> > +                     no-map;
> > +             };
> > +
> > +             abl_reserved: abl@f8800000 {
> > +                     reg =3D <0x0 0xf8800000 0x02000000>;
> > +                     no-map;
> > +             };
> > +
> > +             dss_log_reserved: dss-log-reserved@fd3f0000 {
> > +                     reg =3D <0x0 0xfd3f0000 0x0000e000>;
> > +                     no-map;
> > +             };
> > +
> > +             debug_kinfo_reserved: debug-kinfo-reserved@fd3fe000 {
> > +                     reg =3D <0x0 0xfd3fe000 0x00001000>;
> > +                     no-map;
> > +             };
> > +
> > +             bldr_log_reserved: bldr-log-reserved@fd800000 {
> > +                     reg =3D <0x0 0xfd800000 0x00100000>;
> > +                     no-map;
> > +             };
> > +
> > +             bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
> > +                     reg =3D <0x0 0xfd900000 0x00002000>;
> > +                     no-map;
> > +             };
> > +     };
> > +
> > +     timer {
>
> alphabetical order, so this goes to the end
>
> > +             compatible =3D "arm,armv8-timer";
> > +             interrupts =3D
> > +                <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_L=
OW) 0>,
> > +                <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_L=
OW) 0>,
> > +                <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_L=
OW) 0>,
> > +                <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_L=
OW) 0>;
> > +             clock-frequency =3D <24576000>;
>
> I don't remember if you already got Marc's wrath, so just in case: are
> you sure it is needed?
>
> Anyway, this is board specific, not SoC.
>
> > +     };
> > +
> > +     soc: soc@0 {
> > +             compatible =3D "simple-bus";
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <1>;
> > +             ranges =3D <0x0 0x0 0x0 0x40000000>;
> > +
> > +             cmu_misc: clock-controller@10010000 {
> > +                     compatible =3D "google,gs101-cmu-misc";
> > +                     reg =3D <0x10010000 0x8000>;
> > +                     #clock-cells =3D <1>;
> > +                     clocks =3D  <&cmu_top CLK_DOUT_CMU_MISC_BUS>,
>
> One space after =3D
>
> > +                               <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
> > +                     clock-names =3D "dout_cmu_misc_bus", "dout_cmu_mi=
sc_sss";
> > +             };
> > +
> > +             watchdog_cl0: watchdog@10060000 {
> > +                     compatible =3D "google,gs101-wdt";
> > +                     reg =3D <0x10060000 0x100>;
> > +                     interrupts =3D <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH 0=
>;
> > +                     clocks =3D
> > +                       <&cmu_misc CLK_GOUT_MISC_WDT_CLUSTER0_PCLK>,
>
> Join lines (clocks =3D <foo bar>). Same in other places.
>
> > +                       <&ext_24_5m>;
> > +                     clock-names =3D "watchdog", "watchdog_src";
> > +                     samsung,syscon-phandle =3D <&pmu_system_controlle=
r>;
> > +                     samsung,cluster-index =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             watchdog_cl1: watchdog@10070000 {
> > +                     compatible =3D "google,gs101-wdt";
> > +                     reg =3D <0x10070000 0x100>;
> > +                     interrupts =3D <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH 0=
>;
> > +                     clocks =3D
> > +                       <&cmu_misc CLK_GOUT_MISC_WDT_CLUSTER1_PCLK>,
> > +                       <&ext_24_5m>;
> > +                     clock-names =3D "watchdog", "watchdog_src";
> > +                     samsung,syscon-phandle =3D <&pmu_system_controlle=
r>;
> > +                     samsung,cluster-index =3D <1>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             gic: interrupt-controller@10400000 {
> > +                     compatible =3D "arm,gic-v3";
> > +                     #interrupt-cells =3D <4>;
> > +                     interrupt-controller;
> > +                     reg =3D <0x10400000 0x10000>, /* GICD */
> > +                           <0x10440000 0x100000>;/* GICR * 8 */
> > +                     interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> > +
> > +                     ppi-partitions {
> > +                             ppi_cluster0: interrupt-partition-0 {
> > +                                     affinity =3D <&cpu0 &cpu1 &cpu2 &=
cpu3>;
> > +                             };
> > +
> > +                             ppi_cluster1: interrupt-partition-1 {
> > +                                     affinity =3D <&cpu4 &cpu5>;
> > +                             };
> > +
> > +                             ppi_cluster2: interrupt-partition-2 {
> > +                                     affinity =3D <&cpu6 &cpu7>;
> > +                             };
> > +                     };
> > +             };
> > +
> > +             sysreg_peric0: syscon@10820000 {
> > +                     compatible =3D "google,gs101-peric0-sysreg", "sys=
con";
> > +                     reg =3D <0x10820000 0x10000>;
> > +             };
> > +
> > +             pinctrl_peric0: pinctrl@10840000 {
> > +                     compatible =3D "google,gs101-pinctrl";
> > +                     reg =3D <0x10840000 0x00001000>;
> > +                     interrupts =3D <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0=
>;
> > +             };
> > +
> > +             usi_uart: usi@10a000c0 {
> > +                     compatible =3D "google,gs101-usi",
> > +                                  "samsung,exynos850-usi";
> > +                     reg =3D <0x10a000c0 0x20>;
> > +                     samsung,sysreg =3D <&sysreg_peric0 0x1020>;
> > +                     samsung,mode =3D <USI_V2_UART>;
>
> vendor properties go to the end, after standard properties, before status=
.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/tree/Docum=
entation/devicetree/bindings/dts-coding-style.rst?h=3Ddt/next&id=3D0d3a7716=
10d0e155c9aa305f142f84dda5030fae#n122
>
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +                     ranges;
> > +                     clocks =3D <&dummy_clk>, <&dummy_clk>;
> > +                     clock-names =3D "pclk", "ipclk";
> > +                     status =3D "disabled";
> > +
> > +                     serial_0: serial@10a00000 {
> > +                             compatible =3D "google,gs101-uart";
> > +                             reg =3D <0x10a00000 0xc0>;
> > +                             reg-io-width =3D <4>;
> > +                             samsung,uart-fifosize =3D <256>;
>
> Ditto
>

Assuming Krzysztof's comments are fixed, feel free to add:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> > +                             interrupts =3D <GIC_SPI 634
> > +                                           IRQ_TYPE_LEVEL_HIGH 0>;
> > +                             clocks =3D <&dummy_clk 0>, <&dummy_clk 0>=
;
> > +                             clock-names =3D "uart", "clk_uart_baud0";
> > +                             status =3D "disabled";
> > +                     };
> > +             };
>
>
> Best regards,
> Krzysztof
>

