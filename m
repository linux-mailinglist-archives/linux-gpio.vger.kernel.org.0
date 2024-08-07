Return-Path: <linux-gpio+bounces-8647-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0EE94A42E
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EA6B2812EF
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73691CCB4A;
	Wed,  7 Aug 2024 09:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrU+LAnu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C6B811E2;
	Wed,  7 Aug 2024 09:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723022424; cv=none; b=h2m0IF8PY83x7GXETpRHOQD+bMBM7RiCzg/W9aeznMyH4QD56FZO4G44IY/SD78cZU7gNCPn2e0wiqmldFa5Ryk2kAT2CInsoiKtlE2tyRzrdfsYBQJVFT9G/PFqS3ZI2WW2S2NxdAPhEjQhoM25DI50GCh5RcIHWtG2cLlGhC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723022424; c=relaxed/simple;
	bh=gD+BO8KCPo5FlDSkmYt3b0GRFkK77JUKqOMdtZw1Tmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=azmCgVh6iEj2ba4YYCt6w71TfwJkv4JUpXqTZB4jE/FbtzTGB2HukHAh8hL8siPMvnneZ4U4yG+flwkEPKaSynnvL+sr/NtLeSm0F4AqH4+VFlBxLgRIZqshewuGHOygOQDqLd8hvwxvK522PI2PWlienZGmVvQ5+/TCyl8TSfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrU+LAnu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3462AC4AF0B;
	Wed,  7 Aug 2024 09:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723022424;
	bh=gD+BO8KCPo5FlDSkmYt3b0GRFkK77JUKqOMdtZw1Tmo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BrU+LAnuq3IOtevecR/MWHV/YXBKF6+8tqfmtn/ieL+jdVvmEihaxzgYX4JB4E8Cp
	 LbFJfk2KVuDPAWChibfQpVZJdJWt2qYFq8TG7ntJEZB36aVvWeyKgTptciNwCvvHE+
	 90L3kqpbXsxWvLAtDKgRAXPJc6yCwwtexcZZYKIxdy/n9Y+5tCt0MwiCN3RDYsc1Ye
	 TQ3tnldpv5iYrhuoH4kTJF8fMA/Z/86ds64qLrfFbrIhlkWRZtrBim+qgrPD3XTNhj
	 oObNScA0mciiDFnF2toL4tmFJHU+8bOPjTQRAcMtsLlxP1kLAE8KhTIh1PvUYnZix8
	 3963bZDt2gkjg==
Message-ID: <e6b4e0d8-7183-4ff4-a373-cb1c0c98d993@kernel.org>
Date: Wed, 7 Aug 2024 11:20:17 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/10] arm64: dts: exynos: Add initial support for
 exynos8895 SoC
To: ivo.ivanov.ivanov1@gmail.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
 <20240807082843.352937-9-ivo.ivanov.ivanov1@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240807082843.352937-9-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2024 10:28, ivo.ivanov.ivanov1@gmail.com wrote:
> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> 
> Exynos 8895 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy
> S8 (dreamlte), S8 Plus (dream2lte), Note 8 (greatlte) and the Meizu
> 15 Plus (m1891). Add minimal support for that SoC, including:
> 
> - All 8 cores via PSCI
> - ChipID
> - Generic ARMV8 Timer
> - Enumarate all pinctrl nodes
> 
> Further platform support will be added over time.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../boot/dts/exynos/exynos8895-pinctrl.dtsi   | 1378 +++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos8895.dtsi    |  253 +++
>  2 files changed, 1631 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895.dtsi
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
> new file mode 100644
> index 000000000..1dcb61e2e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
> @@ -0,0 +1,1378 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Samsung's Exynos 8895 SoC pin-mux and pin-config device tree source
> + *
> + * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "exynos-pinctrl.h"
> +
> +&pinctrl_alive {
> +	gpa0: gpa0 {

I do not believe this was tested. See maintainer SoC profile for Samsung
Exynos.

Limited review follows due to lack of testing.


> +};
> diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> new file mode 100644
> index 000000000..3ed381ee5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> @@ -0,0 +1,253 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Samsung's Exynos 8895 SoC device tree source
> + *
> + * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible = "samsung,exynos8895";
> +	#address-cells = <2>;
> +	#size-cells = <1>;
> +
> +	interrupt-parent = <&gic>;
> +
> +	aliases {
> +		pinctrl0 = &pinctrl_alive;
> +		pinctrl1 = &pinctrl_abox;
> +		pinctrl2 = &pinctrl_vts;
> +		pinctrl3 = &pinctrl_fsys0;
> +		pinctrl4 = &pinctrl_fsys1;
> +		pinctrl5 = &pinctrl_busc;
> +		pinctrl6 = &pinctrl_peric0;
> +		pinctrl7 = &pinctrl_peric1;
> +	};
> +
> +	arm-a53-pmu {

Are there two pmus?

> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>,
> +				     <&cpu1>,
> +				     <&cpu2>,
> +				     <&cpu3>,
> +				     <&cpu4>,
> +				     <&cpu5>,
> +				     <&cpu6>,
> +				     <&cpu7>;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu4>;
> +				};
> +				core1 {
> +					cpu = <&cpu5>;
> +				};
> +				core2 {
> +					cpu = <&cpu6>;
> +				};
> +				core3 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		cpu0: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x100>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu1: cpu@101 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x101>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu2: cpu@102 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x102>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu3: cpu@103 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x103>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu4: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "samsung,mongoose-m2";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu5: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "samsung,mongoose-m2";
> +			reg = <0x1>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu6: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "samsung,mongoose-m2";
> +			reg = <0x2>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu7: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "samsung,mongoose-m2";
> +			reg = <0x3>;
> +			enable-method = "psci";
> +		};
> +	};
> +
> +	psci {
> +		compatible = "arm,psci";
> +		method = "smc";
> +		cpu_suspend = <0xc4000001>;
> +		cpu_off = <0x84000002>;
> +		cpu_on = <0xc4000003>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency = <26000000>;

Hm? I think this was explicitly disallowed.

> +	};
> +
> +	fixed-rate-clocks {

Keep order of properties, just like DTS coding style asks.

Anyway, fixed-rate-clocks wrapper is not needed, drop.

> +		oscclk: osc-clock {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-output-names = "oscclk";
> +		};
> +	};
> +
> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x0 0x20000000>;
> +
> +		chipid@10000000 {
> +			compatible = "samsung,exynos8895-chipid",
> +				     "samsung,exynos850-chipid";
> +			reg = <0x10000000 0x24>;
> +		};
> +
> +		gic: interrupt-controller@10200000 {
> +			compatible = "arm,gic-400";
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +			interrupt-controller;
> +			reg = <0x10201000 0x1000>,
> +			      <0x10202000 0x1000>,
> +			      <0x10204000 0x2000>,
> +			      <0x10206000 0x2000>;
> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
> +						 IRQ_TYPE_LEVEL_HIGH)>;
> +		};
> +
> +		pinctrl_alive: pinctrl@164b0000 {
> +			compatible = "samsung,exynos8895-pinctrl";
> +			reg = <0x164b0000 0x1000>;
> +
> +			wakeup-interrupt-controller {
> +				compatible = "samsung,exynos8895-wakeup-eint",
> +					     "samsung,exynos7-wakeup-eint";
> +				interrupt-parent = <&gic>;
> +				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +
> +		pinctrl_abox: pinctrl@13e60000 {

This does not look ordered. See DTS coding style.

Best regards,
Krzysztof


