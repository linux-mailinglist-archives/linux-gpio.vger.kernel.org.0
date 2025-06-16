Return-Path: <linux-gpio+bounces-21623-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 453C8ADA7F9
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 08:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8EFD16D999
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 06:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3CB1D90DF;
	Mon, 16 Jun 2025 06:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ml/wFPZX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED72175A5;
	Mon, 16 Jun 2025 06:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750054182; cv=none; b=meOfSRRcpcbXLMHhUNmroMHE5wWFFCPI1eTSciTvWynTptlmP1dLXVsSsJoyydt1P/SuQ63fXTGpChKLOMujoTv0FiKZ19/aVHLkoLnewxNXtKM0HJrhQs4aZPtylqOCatGhZDxJEEAH3az/B6caLvry217aHtLicArdMpVtMyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750054182; c=relaxed/simple;
	bh=/hnA6GerLfYA5cJiCIVLxg5aZwLx+2Jz17zeqylDbQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QcNXMIBW+FpYDdRScCsqkUeOqNwV4eQ9VnKaiSaVqJuWlcb27RK6iE/GW+emOcRcTEd45pSCmUuOuzH9x8jQIieDnYHYDUNInugegmbnZXP/X94FvXHa3Yq5vz9oXXVsNu9JFXBJUk8EFL5jPwGCtfgqB6RGM1nL7YZYEDcnZYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ml/wFPZX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958E4C4CEEA;
	Mon, 16 Jun 2025 06:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750054181;
	bh=/hnA6GerLfYA5cJiCIVLxg5aZwLx+2Jz17zeqylDbQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ml/wFPZXHhIC6PSmaM5Z89Qg5qHFTxO22d0IAO13f9FZHI11EseRvXhO8GU0RebIq
	 1fTaUkfaqxFKngufnOgNAt/PRaHg3S5Nwzk6VFhRKaqGS8fSCsKTc8LfYFSUSHrGql
	 6opYeJWZg3N02OTvwoP919neHD0IxYpZh/XuC+rT3fkOAMV68ymT0OsP81v4PVoikI
	 LZ/I2yWbS8gl6y4+267Yg7ocaPbfVt2oQ5jmNNmn8PGzfi7embRi9XAW5qiDMIAwXZ
	 NNsoSfN/qpK+guK9MCKh9/DMH0gKIppWxFwsKt2EPl3YG1gITKBF8xHlZ1Fu4Upnia
	 TfsGhIayBo3hw==
Message-ID: <6ef92d1a-39cc-409f-8ebe-d28ad2006988@kernel.org>
Date: Mon, 16 Jun 2025 08:09:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
To: Harshit Shah <hshah@axiado.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 soc@lists.linux.dev
References: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-4-341502d38618@axiado.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-4-341502d38618@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/06/2025 06:31, Harshit Shah wrote:
> Add initial device tree support for the AX3000 SoC and its evaluation
> platform. The AX3000 is a multi-core SoC featuring 4 Cortex-A53 cores,
> Secure Vault, AI Engine and Firewall.
> 
> This commit adds support for Cortex-A53 CPUs, timer, UARTs, and I3C
> controllers on the AX3000 evaluation board.
> 
> Signed-off-by: Harshit Shah <hshah@axiado.com>
> ---
>  arch/arm64/boot/dts/Makefile              |   1 +
>  arch/arm64/boot/dts/axiado/Makefile       |   2 +
>  arch/arm64/boot/dts/axiado/ax3000.dtsi    | 584 ++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/axiado/ax3000_evk.dts |  72 ++++
>  4 files changed, 659 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 79b73a21ddc22b17308554e502f8207392935b45..47dd8a1a7960d179ee28969a1d6750bfa0d73da1 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -9,6 +9,7 @@ subdir-y += amlogic
>  subdir-y += apm
>  subdir-y += apple
>  subdir-y += arm
> +subdir-y += axiado
>  subdir-y += bitmain
>  subdir-y += blaize
>  subdir-y += broadcom
> diff --git a/arch/arm64/boot/dts/axiado/Makefile b/arch/arm64/boot/dts/axiado/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..eb5e08ba0f39c32cdbfd586d982849a80da30160
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axiado/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_AXIADO) += ax3000_evk.dtb
> diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts/axiado/ax3000.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..d5d84986d18efe9dfbb446ceee42fc4e4dbf95d0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
> @@ -0,0 +1,584 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2021-25 Axiado Corporation (or its affiliates). All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/memreserve/ 0x3c0013a0 0x00000008;	/* cpu-release-addr */
> +/ {
> +	compatible = "axiado,ax3000";
> +	interrupt-parent = <&gic500>;
> +
> +	aliases {
> +		i3c0 = &i3c0;
> +		i3c1 = &i3c1;
> +		i3c2 = &i3c2;
> +		i3c3 = &i3c3;
> +		i3c4 = &i3c4;
> +		i3c5 = &i3c5;
> +		i3c6 = &i3c6;
> +		i3c7 = &i3c7;
> +		i3c8 = &i3c8;
> +		i3c9 = &i3c9;
> +		i3c10 = &i3c10;
> +		i3c11 = &i3c11;
> +		i3c12 = &i3c12;
> +		i3c13 = &i3c13;
> +		i3c14 = &i3c14;
> +		i3c15 = &i3c15;
> +		i3c16 = &i3c16;
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;

None of these are properties of SoC, but board. Move respective aliases
to the board files.

> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x0>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x3c0013a0>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			i-cache-size = <0x8000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x1>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x3c0013a0>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			i-cache-size = <0x8000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
> +		};
> +
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x2>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x3c0013a0>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			i-cache-size = <0x8000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
> +		};
> +
> +		cpu3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x3>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0x3c0013a0>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			i-cache-size = <0x8000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
> +		};
> +
> +		l2: l2-cache0 {
> +			compatible = "cache";
> +			cache-size = <0x100000>;
> +			cache-unified;
> +			cache-line-size = <64>;
> +			cache-sets = <1024>;
> +			cache-level = <2>;
> +		};
> +	};
> +
> +	timer:timer {

Missing space before node name, but anyway label is unused.

> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic500>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +			   <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +			   <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +			   <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +		arm,cpu-registers-not-fw-configured;
> +	};
> +
> +	clocks {

Keep proper sorting of nodes, see DTS coding style.

> +		refclk: refclk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <125000000>;
> +		};
> +
> +		ref_clk: ref_clk {

This makes no sense. You have refclk and ref_clk. These ARE THE SAME.
Please use name for all fixed clocks which matches current format
recommendation: 'clock-<freq>' (see also the pattern in the binding for
any other options).

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml?h=v6.11-rc1

> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <1>;
> +		};
> +
> +		clk_ahb: clk_ahb {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <200000000>;
> +			clock-output-names = "clk_ahb";
> +		};
> +
> +		clk_xin: clk_xin {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <200000000>;
> +			clock-output-names = "clk_xin";
> +		};
> +
> +		clk_mali: clk_mali {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <500000000>;
> +			clock-output-names = "clk_mali";
> +		};
> +
> +		clk_pclk: clk_pclk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <74250000>;
> +			clock-output-names = "clk_pclk";
> +		};
> +
> +		spi_clk: spi_clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <25000000>;
> +		};
> +
> +		apb_pclk: apb_pclk {

No underscores in node names, but all these look incorrect - don't you
have clock controller?

> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <25000000>;
> +		};
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		interrupt-parent = <&gic500>;
> +		ranges;
> +
> +		gic500: interrupt-controller@80300000 {
> +			compatible = "arm,gic-v3";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			#redistributor-regions = <1>;
> +			reg = <0x00 0x80300000 0x00 0x10000>,
> +				  <0x00 0x80380000 0x00 0x80000>;

DTS coding style, incorrect order.

> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		};
> +
> +		uart0: serial@80520000 {
> +			compatible = "xlnx,zynqmp-uart", "cdns,uart-r1p12";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +			reg = <0x00 0x80520000 0x00 0x100>;

DTS coding style.

> +			clock-names = "uart_clk", "pclk";
> +			clocks = <&refclk &refclk>;
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@805a0000 {
> +			compatible = "xlnx,zynqmp-uart", "cdns,uart-r1p12";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
> +			reg = <0x00 0x805A0000 0x00 0x100>;
> +			clock-names = "uart_clk", "pclk";
> +			clocks = <&refclk &refclk>;
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@80620000 {
> +			compatible = "xlnx,zynqmp-uart", "cdns,uart-r1p12";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +			reg = <0x00 0x80620000 0x00 0x100>;
> +			clock-names = "uart_clk", "pclk";
> +			clocks = <&refclk &refclk>;
> +			status = "disabled";
> +		};
> +
> +		uart3: serial@80520800 {
> +			compatible = "xlnx,zynqmp-uart", "cdns,uart-r1p12";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
> +			reg = <0x00 0x80520800 0x00 0x100>;
> +			clock-names = "uart_clk", "pclk";
> +			clocks = <&refclk &refclk>;
> +			status = "disabled";
> +		};
> +
> +		/* GPIO Controller banks 0 - 7 */
> +		gpio0: gpio-controller@80500000 {
> +			compatible = "cdns,gpio-r1p02";
> +			clocks = <&refclk>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
> +			reg = <0x00 0x80500000 0x00  0x400>;

DTS coding style.


> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +


...

> +		i3c14: i3c@80880400 {
> +			compatible = "cdns,i3c-master";
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			reg = <0x00 0x80880400 0x00 0x400>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i3c15: i3c@80880800 {
> +			compatible = "cdns,i3c-master";
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			reg = <0x00 0x80880800 0x00 0x400>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i3c16: i3c@80620400 {
> +			compatible = "cdns,i3c-master";
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			reg = <0x00 0x80620400 0x00 0x400>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +

Drop stray blank lines.

> +	};
> +};
> diff --git a/arch/arm64/boot/dts/axiado/ax3000_evk.dts b/arch/arm64/boot/dts/axiado/ax3000_evk.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..0a183695e857a3a1e722ea6b7bee388bf650f0a3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axiado/ax3000_evk.dts
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2021-25 Axiado Corporation (or its affiliates). All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "ax3000.dtsi"
> +
> +/ {
> +	model = "Axiado AX3000 EVK";
> +	compatible = "axiado,ax3000_evk", "axiado,ax3000";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen {
> +		bootargs = "console=ttyPS3,115200 earlyprintk nr_cpus=4 earlycon";

Drop bootargs. Not needed and not suitable for mainline. earlycon (not
earlyprintk!) is debugging tool, not wide mainline usage.


Best regards,
Krzysztof

