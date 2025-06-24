Return-Path: <linux-gpio+bounces-22042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14707AE5D0B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 08:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59D607A8922
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 06:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772CA2472B0;
	Tue, 24 Jun 2025 06:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i52efISc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E8124887C;
	Tue, 24 Jun 2025 06:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747511; cv=none; b=A1+XYCl7Q7CxRMQ062Ww5g1dLAVgLi26mU1C6le9bJ/l66sgLh/IyTiqwVZTz0wsIwT76UPob3/HlvzIQTWp36OnToBOx1uNbkct/zh/6Hne437azdvcM+60DV61KEQpP6ORs6FGguZzfcZ06oN76yuH1azoXtdY4ZrD50xwLZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747511; c=relaxed/simple;
	bh=0aEgBJ7K4EG2KbyGGGCzAAIHLOxCA6RrZA2/1lUeBQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3NmeSiuaT115pie0vrY+DZf4Ho3ylgMLF6VXt05zClkut+PmqZaEPW+IcqXacw4sKSa0B9126QZ/gP9jSi17XVH+1Y8HaMqu1q693o73v1+DJkt+PudiNrS7hHqqh6bSJMF8ulnJNC66W54lz5jOfeH5tU1wKCuBvwRaGFkhvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i52efISc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2343C4CEE3;
	Tue, 24 Jun 2025 06:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750747509;
	bh=0aEgBJ7K4EG2KbyGGGCzAAIHLOxCA6RrZA2/1lUeBQ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i52efIScbSrpoSvqmPzxSIe3k5yZM73VrLEZ5NBFEx7m74MXImfEaAx/Y1wUIgLQX
	 asnCiiu/PllDeGk0H6/oxYQRv2shnfuH9BRprrOdaZkZPXYVLsQBZc3vg/JcLzhvj4
	 89JjESn8P4hNlccConlzhsuc6cNtQBsKpsoxcQRy2wzyX/uxSwRol2+ZlSW3iZbDi6
	 oLhVjzoODyr3FypwuBNY5YvVPXQulrf4itR6zyBIYcssHpYbENdHz91ztbpeZHbbpk
	 ekhYV5bcQ6aKwNT+02nGt5/CouHw6oLYpKgYnDn+XU4jWPAOP9WDHuACFdvr8QZbsI
	 h/bw8aZzXhw6g==
Message-ID: <0709a0a6-1313-452c-85e7-2926a6a03741@kernel.org>
Date: Tue, 24 Jun 2025 08:45:04 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
To: Harshit Shah <hshah@axiado.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jan Kotas <jank@cadence.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 soc@lists.linux.dev
References: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-5-b3e66a7491f5@axiado.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-5-b3e66a7491f5@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/06/2025 19:28, Harshit Shah wrote:
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
>  arch/arm64/boot/dts/axiado/ax3000-evk.dts |  79 +++++
>  arch/arm64/boot/dts/axiado/ax3000.dtsi    | 488 ++++++++++++++++++++++++++++++
>  4 files changed, 570 insertions(+)
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
> index 0000000000000000000000000000000000000000..6676ad07db6129f8b333b0feffee705d272517c2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axiado/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_AXIADO) += ax3000-evk.dtb
> diff --git a/arch/arm64/boot/dts/axiado/ax3000-evk.dts b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..cc3bcf681c32430d251f20f6d52905423c182f3b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
> @@ -0,0 +1,79 @@
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
> +	compatible = "axiado,ax3000-evk", "axiado,ax3000";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial3 = &uart3;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial3:115200";
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		/* Cortex-A53 will use following memory map */
> +		reg = <0x00000000 0x3D000000 0x00000000 0x23000000>,

Lowercase hex, see DTS coding style.

> +		      <0x00000004 0x00000000 0x00000000 0x80000000>;
> +	};
> +};
> +
> +/* GPIO bank 0 - 7 */
> +&gpio0 {
> +	status = "okay";
> +};
> +
> +&gpio1 {
> +	status = "okay";
> +};
> +
> +&gpio2 {
> +	status = "okay";
> +};
> +
> +&gpio3 {
> +	status = "okay";
> +};
> +
> +&gpio4 {
> +	status = "okay";
> +};
> +
> +&gpio5 {
> +	status = "okay";
> +};
> +
> +&gpio6 {
> +	status = "okay";
> +};
> +
> +&gpio7 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts/axiado/ax3000.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..ea85ae8ca5dea5ab3288a2770b18d7aeb66cad03
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
> @@ -0,0 +1,488 @@
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
> +	model = "Axiado AX3000";
> +	interrupt-parent = <&gic500>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
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

Missing blank line between each new node. See DTS coding style.

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
> +	clocks {
> +		clk_xin: clock-200000000 {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <200000000>;
> +			clock-output-names = "clk_xin";
> +		};
> +		refclk: clock-125000000 {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <125000000>;
> +		};
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		ranges;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		interrupt-parent = <&gic500>;
> +
> +		gic500: interrupt-controller@80300000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x00 0x80300000 0x00 0x10000>,
> +				  <0x00 0x80380000 0x00 0x80000>;

Does not look aligned.

> +			ranges;
> +			#interrupt-cells = <3>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			interrupt-controller;
> +			#redistributor-regions = <1>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		/* GPIO Controller banks 0 - 7 */
> +		gpio0: gpio-controller@80500000 {
> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x00 0x80500000 0x00  0x400>;

Only one space, not double space.

> +			clocks = <&refclk>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};

Please follow DTS coding style.

> +		gpio1: gpio-controller@80580000 {
> +			compatible = "cdns,gpio-r1p02";

This should not be accepted without specific compatible, but that's some
old binding so maybe matters less. Anyway, if you ever need quirk or
custom properties they I will reject them based on what you claim here.


> +			reg = <0x00 0x80580000 0x00  0x400>;
> +			clocks = <&refclk>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +		gpio2: gpio-controller@80600000 {
> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x00 0x80600000 0x00  0x400>;
> +			clocks = <&refclk>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +		gpio3: gpio-controller@80680000 {
> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x00 0x80680000 0x00  0x400>;
> +			clocks = <&refclk>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +		gpio4: gpio-controller@80700000 {
> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x00 0x80700000 0x00  0x400>;
> +			clocks = <&refclk>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +		gpio5: gpio-controller@80780000 {
> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x00 0x80780000 0x00  0x400>;
> +			clocks = <&refclk>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +		gpio6: gpio-controller@80800000 {
> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x00 0x80800000 0x00  0x400>;
> +			clocks = <&refclk>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +		gpio7: gpio-controller@80880000 {
> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x00 0x80880000 0x00  0x400>;
> +			clocks = <&refclk>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			status = "disabled";
> +		};
> +
> +		/* I3C Controller 0 - 16 */
> +		i3c0: i3c@80500400 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80500400 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c1: i3c@80500800 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80500800 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c2: i3c@80580400 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80580400 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c3: i3c@80580800 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80580800 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c4: i3c@80600400 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80600400 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c5: i3c@80600800 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80600800 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c6: i3c@80680400 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80680400 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c7: i3c@80680800 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80680800 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c8: i3c@80700400 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80700400 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c9: i3c@80700800 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80700800 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c10: i3c@80780400 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80780400 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c11: i3c@80780800 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80780800 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c12: i3c@80800400 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80800400 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c13: i3c@80800800 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80800800 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c14: i3c@80880400 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80880400 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c15: i3c@80880800 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80880800 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		i3c16: i3c@80620400 {
> +			compatible = "cdns,i3c-master";
> +			reg = <0x00 0x80620400 0x00 0x400>;
> +			clocks = <&refclk &clk_xin>;
> +			clock-names = "pclk", "sysclk";
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +			i2c-scl-hz = <100000>;
> +			i3c-scl-hz = <400000>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +		uart0: serial@80520000 {

Looks like not ordered by unit address. What is the ordering rule you
are going to adopt for entire arch?

> +			compatible = "xlnx,zynqmp-uart", "cdns,uart-r1p12";

NAK, you do not have xlnx here. Look at your SoC: name of vendor is
axiado. Not xlnx. How is your SoC called? Also zynqmp? You cannot just
randomly pick any compatibles and stuff them around.

Please carefully read writing bindings from DT directory.


> +			reg = <0x00 0x80520000 0x00 0x100>;
> +			interrupt-parent = <&gic500>;
> +			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-names = "uart_clk", "pclk";
> +			clocks = <&refclk &refclk>;
> +			status = "disabled";
> +		};
Best regards,
Krzysztof

