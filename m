Return-Path: <linux-gpio+bounces-10268-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB6497C932
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 14:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E6D31F21C76
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 12:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EC919DF4B;
	Thu, 19 Sep 2024 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6toh/Ut"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A3719B5B4;
	Thu, 19 Sep 2024 12:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726749040; cv=none; b=SABW9bfVf/vOijgmzmWltLevN/pvn0ZkRMIqhU80wvu3AgV2kWazrx230ndo++RcdXlm/PWD5Vo6eT/kIJXqM+G6VWR9bxayAjNka25d9CsAZGW1MYyLHVwr2p7Rvz1P4qr1C+AI+kLvY6TPsrTrRMS1HO0d14a2zF3sqKby1NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726749040; c=relaxed/simple;
	bh=Nze3i2R8p5otX9bFy0eEqialwUExUTwG2vRVviBmgUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZo8RueqKGaEv6MG6XUTuBjX9B5UpMf7C8wv/nmfAgBhh7SsVOQKVwCmXP7Hvpo16C1fyUcHtlHlmIDiFvaYW5UJe1Aaoimw4YhD9kltWQIt9xSnqE1v4huFxziqmApEztT6IYcj88sZpeeLRiYzsMW5P9n9cm4IAxkmh0YVZek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6toh/Ut; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0CDC4CEC4;
	Thu, 19 Sep 2024 12:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726749039;
	bh=Nze3i2R8p5otX9bFy0eEqialwUExUTwG2vRVviBmgUE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e6toh/UtIzOojmEu2m7oUfwG7/AV06nhbm3zgpMryztuPQJEXN/FBH651BUBEARds
	 EuzyqXRPnvb2p6yrTAmsgmeSLrtjAyDjzu5Ic7NioeCqPjQE/PwjXo1WW8QwWSJLNT
	 8woqAkoJV6/r5XSEZE0/TeKULA4A+7ysS6DkGGtWgM2s1Ne5zCNaqsdbVdJ8CGbcp4
	 A9r8CaFDszikauBdTG88B98WglYqYGUrRh7lb/FVcizPG4M/rA9Jirpzc/yNTqtG9U
	 uJTUCr/m8mUHT9hou1ODWLaHUfwjgrNXvGqTXXH+1+uOvAKyk8E4TtjKc3XMPXF/P0
	 O+2eGUklfNJIQ==
Message-ID: <7492618d-4ace-40e2-960b-e10def4f5a17@kernel.org>
Date: Thu, 19 Sep 2024 14:30:30 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: add IPQ5424 SoC and rdp466 board
 support
To: Sricharan R <quic_srichara@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 ulf.hansson@linaro.org, linus.walleij@linaro.org, catalin.marinas@arm.com,
 p.zabel@pengutronix.de, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: quic_varada@quicinc.com
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
 <20240913121250.2995351-8-quic_srichara@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20240913121250.2995351-8-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/09/2024 14:12, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Add initial device tree support for the Qualcomm IPQ5424 SoC and
> rdp466 board.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts |  63 +++++
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 294 ++++++++++++++++++++
>  3 files changed, 358 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq5424.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 197ab325c0b9..46c4eb758799 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp474.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq5424-rdp466.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> new file mode 100644
> index 000000000000..c8597a9ba175
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * IPQ5018 MP03.1-C2 board device tree source
> + *
> + * Copyright (c) 2023 The Linux Foundation. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "ipq5424.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. IPQ5424 RDP466";
> +	compatible = "qcom,ipq5424-rdp466", "qcom,ipq5424";
> +
> +	aliases {
> +		serial0 = &uart1;
> +	};
> +
> +	chosen	{
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&tlmm {
> +	sdc_default_state: sdc-default-state {
> +		clk-pins {
> +			pins = "gpio5";
> +			function = "sdc_clk";
> +			drive-strength = <8>;
> +			bias-disable;
> +		};
> +
> +		cmd-pins {
> +			pins = "gpio4";
> +			function = "sdc_cmd";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +
> +		data-pins {
> +			pins = "gpio0", "gpio1", "gpio2", "gpio3";
> +			function = "sdc_data";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +	};
> +};
> +
> +&uart1 {
> +	pinctrl-0 = <&uart1_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&sleep_clk {
> +	clock-frequency = <32000>;
> +};
> +
> +&xo_board {
> +	clock-frequency = <24000000>;
> +};
> +
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> new file mode 100644
> index 000000000000..b6c08fac9482
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -0,0 +1,294 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * IPQ5424 device tree source
> + *
> + * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,ipq5424-gcc.h>
> +#include <dt-bindings/reset/qcom,ipq5424-gcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	interrupt-parent = <&intc>;
> +
> +	clocks {
> +		xo_board: xo-board-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	cpus: cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		CPU0: cpu@0 {

Lowercase labels please.

I am in process of fixing it everywhere.

> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_0>;
> +			L2_0: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-unified;
> +				next-level-cache = <&L3_0>;
> +				L3_0: l3-cache {
> +					compatible = "cache";
> +					cache-level = <3>;
> +					cache-unified;
> +				};
> +			};
> +		};
> +
> +		CPU1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			enable-method = "psci";
> +			reg = <0x100>;
> +			next-level-cache = <&L2_100>;
> +			L2_100: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-unified;
> +				next-level-cache = <&L3_0>;
> +			};
> +		};
> +
> +		CPU2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			enable-method = "psci";
> +			reg = <0x200>;
> +			next-level-cache = <&L2_200>;
> +			L2_200: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-unified;
> +				next-level-cache = <&L3_0>;
> +			};
> +		};
> +
> +		CPU3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			enable-method = "psci";
> +			reg = <0x300>;
> +			next-level-cache = <&L2_300>;
> +			L2_300: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-unified;
> +				next-level-cache = <&L3_0>;
> +			};
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		/* We expect the bootloader to fill in the size */
> +		reg = <0x0 0x80000000 0x0 0x0>;
> +	};
> +
> +	pmu {

pmu-a55

> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +
> +	pmu-v7 {

pmu-a7 but... where is the A7 CPU?

> +		compatible = "arm,cortex-a7-pmu";
> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;

Same interrupts? Huh?

> +	};
> +
> +	dsu-pmu {

pmu-dsu?

> +		compatible = "arm,dsu-pmu";
> +		interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
> +		cpus = <&CPU0>, <&CPU1>, <&CPU2>, <&CPU3>;
> +		status = "okay";

Drop

> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		tz@8a600000 {
> +			reg = <0x0 0x8a600000 0x0 0x200000>;
> +			no-map;
> +		};
> +	};
> +
> +	soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0 0 0 0 0x10 0>;
> +
> +		tlmm: pinctrl@1000000 {
> +			compatible = "qcom,ipq5424-tlmm";
> +			reg = <0 0x01000000 0 0x300000>;
> +			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&tlmm 0 0 50>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +
> +			uart1_pins: uart1-state {
> +				pins = "gpio43", "gpio44";
> +				function = "uart1";
> +				drive-strength = <8>;
> +				bias-pull-up;
> +			};
> +		};
> +
> +		gcc: clock-controller@1800000 {
> +			compatible = "qcom,ipq5424-gcc";
> +			reg = <0 0x01800000 0 0x40000>;
> +			clocks = <&xo_board>,
> +				 <&sleep_clk>,
> +				 <0>,
> +				 <0>,
> +				 <0>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#interconnect-cells = <1>;
> +		};
> +
> +		qupv3: geniqup@1ac0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0 0x01ac0000 0 0x2000>;
> +			clocks = <&gcc GCC_QUPV3_AHB_MST_CLK>,
> +				 <&gcc GCC_QUPV3_AHB_SLV_CLK>;
> +			clock-names = "m-ahb", "s-ahb";
> +			ranges;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +
> +			status = "okay";

Please do not upstream your downstream code...

> +
> +			uart1: serial@1a84000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0 0x01a84000 0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_UART1_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "okay";

Work on upstream instead.

> +			};
> +		};
> +


Best regards,
Krzysztof


