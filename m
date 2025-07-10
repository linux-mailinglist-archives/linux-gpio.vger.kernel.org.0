Return-Path: <linux-gpio+bounces-23055-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE73AFFA52
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 09:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C898D189704D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 07:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F097A2874E9;
	Thu, 10 Jul 2025 07:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdiNRxki"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DC4FC1D;
	Thu, 10 Jul 2025 07:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752130988; cv=none; b=K+D7RcFaayuQLCcQp3DBjAv5h69WC+6+q4U29zP+rN7hfqgoM0A/vJ1H5LILyRcGeirhvh705Te6dDo52+FZD6RoX7FKIdshwbE9Q7lMxi4yX8C06DaB+Yq5XzecExfiSLTM+v5cGq68XJadUCCH9cWC0J/S2CT+ONN92ynDUdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752130988; c=relaxed/simple;
	bh=OrTGxFrw0ZmJFljrK6uFin1VEz5eOA4NkCPwBi0T8sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fAqo9snvw+D14hRML2Luc023WslUSx2848CBzmGP+Qggc58nHgwjNQ6tS5dO4A8yvpjlBHfDPEFa66dDbDyqO+WKVEY4XkmRiA6x0yOI2AeQCj6C2PTesKHLVAW6m9Zg2b9v5/C7gjlpFIYZFTI5J06JcGSd4XpmdLb0yEPfCvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdiNRxki; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A336C4CEF5;
	Thu, 10 Jul 2025 07:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752130988;
	bh=OrTGxFrw0ZmJFljrK6uFin1VEz5eOA4NkCPwBi0T8sk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EdiNRxkiTAtiLgRS1Y6C3hUD+y1cX5n4ohdHvLlfiiPAD3LaDnf18I56SYmpNYL2N
	 eGdkNdv2r4XrekAwPPTJxfy7agiOdzGLVxznnwVQJoFQzCM7IsBUKe2VyE1kpsv9TP
	 3q+IAmiMxmzOaricb56Ct9skSXyuCFaFDVp+MegzOPyPFulGFhptSEXnKRXy2JQrI8
	 jetuNJgqvHrk1LvzOyWxWaaXCfwupivp3Qb6nSDoCjaXHhWMLZv1l0wZf6xtvEYV8o
	 BLx2YspRLNUrAic2qd5W7T9EVR3cX1mRX2PWhH0sKPARaR4CdXI1tSBWKN6GDIhfAK
	 27QfiTGZHEwAA==
Message-ID: <5998de2a-f3ae-46bf-a975-081da20bab03@kernel.org>
Date: Thu, 10 Jul 2025 09:02:55 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] arm64: dts: axis: Add initial device tree support
To: ksk4725@coasia.com, Jesper Nilsson <jesper.nilsson@axis.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa
 <tomasz.figa@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Ravi Patel <ravi.patel@samsung.com>, SungMin Park <smn1196@coasia.com>
Cc: kenkim <kenkim@coasia.com>, Jongshin Park <pjsin865@coasia.com>,
 GunWoo Kim <gwk1013@coasia.com>, HaGyeong Kim <hgkim05@coasia.com>,
 GyoungBo Min <mingyoungbo@coasia.com>,
 Pankaj Dubey <pankaj.dubey@samsung.com>, Shradha Todi
 <shradha.t@samsung.com>, Inbaraj E <inbaraj.e@samsung.com>,
 Swathi K S <swathi.ks@samsung.com>, Hrishikesh <hrishikesh.d@samsung.com>,
 Dongjin Yang <dj76.yang@samsung.com>, Sang Min Kim
 <hypmean.kim@samsung.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <20250710002047.1573841-15-ksk4725@coasia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250710002047.1573841-15-ksk4725@coasia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/07/2025 02:20, ksk4725@coasia.com wrote:
> From: sungminpark <smn1196@coasia.com>
> 
> Add initial device tree support for Axis ARTPEC-8 SoC and Grizzly board.
> This SoC contains four cores of cortex-a53 CPUs and other various

Subject: Initial device tree of what?

> peripheral IPs.
> 
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> Signed-off-by: sungminpark <smn1196@coasia.com>
> ---
>  MAINTAINERS                                  |  14 ++
>  arch/arm64/Kconfig.platforms                 |  13 +
>  arch/arm64/boot/dts/Makefile                 |   1 +
>  arch/arm64/boot/dts/axis/Makefile            |   4 +
>  arch/arm64/boot/dts/axis/artpec8-grizzly.dts |  67 +++++
>  arch/arm64/boot/dts/axis/artpec8.dtsi        | 252 +++++++++++++++++++
>  6 files changed, 351 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/axis/Makefile
>  create mode 100644 arch/arm64/boot/dts/axis/artpec8-grizzly.dts
>  create mode 100644 arch/arm64/boot/dts/axis/artpec8.dtsi
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa1e04e87d1d..371005f3f41a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2320,6 +2320,20 @@ F:	drivers/crypto/axis
>  F:	drivers/mmc/host/usdhi6rol0.c
>  F:	drivers/pinctrl/pinctrl-artpec*
>  
> +ARM/ARTPEC ARM64 MACHINE SUPPORT

This is samsung soc, so I need a pattern for that as well as I will be
handling patches.

> +M:	Jesper Nilsson <jesper.nilsson@axis.com>
> +M:	Ravi Patel <ravi.patel@samsung.com>
> +M:	SeonGu Kang <ksk4725@coasia.com>
> +M:	SungMin Park <smn1196@coasia.com>

Please keep only maintainers who will actually perform reviews of the
code. I am not even sure if this is worth separate entry outside of
Samsung. Please list the IP blocks which are not Samsung here.

> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
> +L:	linux-arm-kernel@axis.com
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/clock/axis,artpec*-clock.yaml
> +F:	arch/arm64/boot/dts/axis/
> +F:	drivers/clk/samsung/clk-artpec*.c
> +F:	include/dt-bindings/clock/axis,artpec*-clk.h
> +
>  ARM/ASPEED I2C DRIVER
>  M:	Ryan Chen <ryan_chen@aspeedtech.com>
>  R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 8b76821f190f..418ee47227c1 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -40,6 +40,19 @@ config ARCH_APPLE
>  	  This enables support for Apple's in-house ARM SoC family, such
>  	  as the Apple M1.
>  
> +config ARCH_ARTPEC
> +	bool "Axis Communications ARTPEC SoC Family"
> +	help
> +	   This enables support for the ARMv8 based ARTPEC SoC Family.
> +
> +config ARCH_ARTPEC8

No, drop. One ARCH symbol.

> +	bool "Axis ARTPEC-8 SoC Platform"
> +	depends on ARCH_ARTPEC
> +	depends on ARCH_EXYNOS

And that's the proof that this is Samsung SoC.

> +	select ARM_GIC
> +	help
> +	  This enables support for the Axis ARTPEC-8 SoC.
> +
>  menuconfig ARCH_BCM
>  	bool "Broadcom SoC Support"
>  
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 79b73a21ddc2..6b6a3aedc2ed 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -9,6 +9,7 @@ subdir-y += amlogic
>  subdir-y += apm
>  subdir-y += apple
>  subdir-y += arm
> +subdir-y += axis
>  subdir-y += bitmain
>  subdir-y += blaize
>  subdir-y += broadcom
> diff --git a/arch/arm64/boot/dts/axis/Makefile b/arch/arm64/boot/dts/axis/Makefile
> new file mode 100644
> index 000000000000..ccf00de64016
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axis/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +dtb-$(CONFIG_ARCH_ARTPEC) += \
> +	artpec8-grizzly.dtb
> diff --git a/arch/arm64/boot/dts/axis/artpec8-grizzly.dts b/arch/arm64/boot/dts/axis/artpec8-grizzly.dts
> new file mode 100644
> index 000000000000..7671130a0333
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axis/artpec8-grizzly.dts
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Axis ARTPEC-8 Grizzly board device tree source
> + *
> + * Copyright (c) 2022-2025 Samsung Electronics Co., Ltd.
> + *             https://www.samsung.com
> + * Copyright (c) 2022-2025  Axis Communications AB.
> + *             https://www.axis.com
> + */
> +
> +/dts-v1/;
> +#include "artpec8.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +/ {
> +	model = "ARTPEC-8 grizzly board";
> +	compatible = "axis,artpec8-grizzly", "axis,artpec8";
> +
> +	aliases {
> +		serial0 = &serial_0;
> +	};
> +
> +	chosen {
> +		stdout-path = &serial_0;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x80000000>;
> +	};
> +};
> +
> +&osc_clk {
> +	clock-frequency = <50000000>;
> +	status = "okay";

Why?

> +};
> +
> +&serial_0 {

Follow DTS coding style. s > c
o > c


> +	status = "okay";
> +};
> +
> +&cmu_cmu {
> +	status = "okay";
> +};
> +
> +&cmu_bus {
> +	status = "okay";
> +};
> +
> +&cmu_core {
> +	status = "okay";
> +};
> +
> +&cmu_cpucl {
> +	status = "okay";
> +};
> +
> +&cmu_fsys {
> +	status = "okay";
> +};
> +
> +&cmu_imem {
> +	status = "okay";
> +};
> +
> +&cmu_peri {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/axis/artpec8.dtsi b/arch/arm64/boot/dts/axis/artpec8.dtsi
> new file mode 100644
> index 000000000000..296192560adf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axis/artpec8.dtsi
> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Axis ARTPEC-8 SoC device tree source
> + *
> + * Copyright (c) 2022-2025 Samsung Electronics Co., Ltd.
> + *             https://www.samsung.com
> + * Copyright (c) 2022-2025  Axis Communications AB.
> + *             https://www.axis.com
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/axis,artpec8-clk.h>
> +
> +/ {
> +	compatible = "axis,artpec8";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0>;
> +			cpu-idle-states = <&cpu_sleep>;
> +			enable-method = "psci";
> +			clocks = <&cmu_cpucl DOUT_CLK_CPUCL_CPU>;
> +			clock-names = "dout_clk_cpucl_cpu";
> +			clock-frequency = <1200000000>;

This feels wrong. Frequency changes, doesn't it?

> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x1>;
> +			cpu-idle-states = <&cpu_sleep>;
> +			enable-method = "psci";
> +			clock-frequency = <1200000000>;
> +		};
> +
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x2>;
> +			cpu-idle-states = <&cpu_sleep>;
> +			enable-method = "psci";
> +			clock-frequency = <1200000000>;
> +		};
> +
> +		cpu3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x3>;
> +			cpu-idle-states = <&cpu_sleep>;
> +			enable-method = "psci";
> +			clock-frequency = <1200000000>;
> +		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			cpu_sleep: cpu-sleep {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x0010000>;
> +				local-timer-stop;
> +				entry-latency-us = <300>;
> +				exit-latency-us = <1200>;
> +				min-residency-us = <2000>;
> +			};
> +		};
> +	};
> +
> +	timer {

Also wrongly ordered. See DTS coding style.


> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pmu {
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	osc_clk: xxti {

clock-xxti

> +		compatible = "fixed-clock";
> +		clock-output-names = "xxti";
> +		#clock-cells = <0>;
> +	};
> +
> +	fin_pll: fin_pll {

DTS coding style.

> +		compatible = "fixed-factor-clock";
> +		clocks = <&osc_clk>;
> +		#clock-cells = <0>;
> +		clock-div = <2>;
> +		clock-mult = <1>;
> +		clock-output-names = "fin_pll";
> +	};
> +
> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x0 0x17000000>;

DTS coding style.

> +
> +		mct@10040000 {

Look at other SoCs first

> +			compatible = "samsung,exynos4210-mct";

You just missed two years of development, right? Look at other SoCs.


> +			reg = <0x10040000 0x1000>;
> +			clocks = <&fin_pll>, <&cmu_imem MOUT_IMEM_ACLK_USER>;
> +			clock-names = "fin_pll", "mct";
> +			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		gic: interrupt-controller@10201000 {
> +			compatible = "arm,gic-400";
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +			interrupt-controller;
> +			reg = <0x10201000 0x00001000>,
> +			      <0x10202000 0x00002000>,
> +			      <0x10204000 0x00002000>,
> +			      <0x10206000 0x00002000>;

DTS coding style.

> +		};
> +
> +		cmu_cmu: clock-controller@12400000 {
> +			compatible = "axis,artpec8-cmu-cmu";
> +			reg = <0x12400000 0x4000>;
> +			#clock-cells = <1>;
> +			clocks = <&fin_pll>;
> +			clock-names = "fin_pll";
> +			status = "disabled";

Why? No, don't do that, even if clock frequency of xxti is missing. Look
at other SoCs.


> +		};
> +
> +		cmu_bus: clock-controller@12c10000 {
> +			compatible = "axis,artpec8-cmu-bus";
> +			reg = <0x12c10000 0x4000>;
> +			#clock-cells = <1>;
> +			clocks = <&fin_pll>,
> +				 <&cmu_cmu DOUT_CLKCMU_BUS_BUS>,
> +				 <&cmu_cmu DOUT_CLKCMU_BUS_DLP>;
> +			clock-names = "fin_pll",
> +				      "dout_clkcmu_bus_bus",
> +				      "dout_clkcmu_bus_dlp";
> +			status = "disabled";
> +		};
> +
> +		cmu_core: clock-controller@12410000 {
> +			compatible = "axis,artpec8-cmu-core";
> +			reg = <0x12410000 0x4000>;
> +			#clock-cells = <1>;
> +			clocks = <&fin_pll>,
> +				 <&cmu_cmu DOUT_CLKCMU_CORE_MAIN>,
> +				 <&cmu_cmu DOUT_CLKCMU_CORE_DLP>;
> +			clock-names = "fin_pll",
> +				      "dout_clkcmu_core_main",
> +				      "dout_clkcmu_core_dlp";
> +			status = "disabled";
> +		};
> +
> +		cmu_cpucl: clock-controller@11410000 {
> +			compatible = "axis,artpec8-cmu-cpucl";
> +			reg = <0x11410000 0x4000>;
> +			#clock-cells = <1>;
> +			clocks = <&fin_pll>,
> +				 <&cmu_cmu DOUT_CLKCMU_CPUCL_SWITCH>;
> +			clock-names = "fin_pll",
> +				"dout_clkcmu_cpucl_switch";
> +			status = "disabled";
> +		};
> +
> +		cmu_fsys: clock-controller@16c10000 {
> +			compatible = "axis,artpec8-cmu-fsys";
> +			reg = <0x16c10000 0x4000>;
> +			#clock-cells = <1>;
> +			clocks = <&fin_pll>,
> +				 <&cmu_cmu DOUT_CLKCMU_FSYS_SCAN0>,
> +				 <&cmu_cmu DOUT_CLKCMU_FSYS_SCAN1>,
> +				 <&cmu_cmu DOUT_CLKCMU_FSYS_BUS>,
> +				 <&cmu_cmu DOUT_CLKCMU_FSYS_IP>;
> +			clock-names = "fin_pll",
> +				      "dout_clkcmu_fsys_scan0",
> +				      "dout_clkcmu_fsys_scan1",
> +				      "dout_clkcmu_fsys_bus",
> +				      "dout_clkcmu_fsys_ip";
> +			status = "disabled";
> +		};
> +
> +		cmu_imem: clock-controller@10010000 {

DTS coding style.



Best regards,
Krzysztof

