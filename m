Return-Path: <linux-gpio+bounces-11333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED6C99DEFB
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 09:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 178971F2180B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 07:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D9B189BB4;
	Tue, 15 Oct 2024 07:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aCaU+Hmu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94104137930;
	Tue, 15 Oct 2024 07:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728975748; cv=none; b=IVXkroCDSwvpJnch8w97xlU7DZDtF8orjp0b84DuZtKXyAJO8wU1yoavboL/falggPMmmnQKethxaj26C5voUxIHo03hO294t/A1Six+SrXqBYsnUq1fVCmrA04BKgFObXZ6f2Cg+gRjji/A8HvFtN+PSPqQyQLlhe+/Ej68vqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728975748; c=relaxed/simple;
	bh=s4T8/jTVUn1rYhBlAL29+WbFoChCUfqqhBQWqGCSLJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huR0Q/X7VAfkC4n1mSU8VB8jPv1pIWodjSxwD668kxSAlyo6KdgTWCYeUtzfJHiIayZCHqpsZ0XV+J0w+T7U4wiHUZJ9VUkUcpxdop30gtUngOZYCUu+32ERCf230C5zx8HbY0xLZFS5ZhD80srNRK9eB3/ls5y+vIZ+tjiXUr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aCaU+Hmu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433B0C4CEC7;
	Tue, 15 Oct 2024 07:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728975747;
	bh=s4T8/jTVUn1rYhBlAL29+WbFoChCUfqqhBQWqGCSLJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aCaU+Hmuc0t9ltne6NYfLFP8tYu+c6t++i7X2olSmlxHwNdBH23O+WAcwWO6OBMdd
	 ATDFjE4wi4gAYGMFQqiKQO0K/3CuxJI28/br93Yl2fwdVwn/8x5G1/aqY9woltLGAi
	 G+/J8gEls0pc5BG0+HQGzsbVop0yGykxbve0HUiLcOlDYHstg1ACIGzEhFCdfJwEtr
	 xxbDfSMCTU9mbj/4Ftczqabbogk6qGv2FLGCj+HYmY1dnEyV1k9sXRB02l2gfkwUBf
	 qqOA4BrZSo2SWetAGEFlQuHdGyGWcs2Paav9Prr2p/ivVOtrtbLWZunvIrM9ILKtAI
	 XIsdTDxPxYuug==
Message-ID: <2edf63cd-66e2-4050-80dd-800ed77ef5e1@kernel.org>
Date: Tue, 15 Oct 2024 09:02:19 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] arm64: dts: exynos: Add initial support for the
 Exynos 990 SoC
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, david@mainlining.org
References: <20241015062746.713245-1-igor.belwon@mentallysanemainliners.org>
 <20241015062746.713245-7-igor.belwon@mentallysanemainliners.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241015062746.713245-7-igor.belwon@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/10/2024 08:27, Igor Belwon wrote:
> The Exynos 990 SoC is an ARMv8 mobile SoC found in Samsung Galaxy N/S20
> series phones (x1sxxx, c1sxxx). Add minimal support for this SoC,
> including:
> 

...

> +	/* There's no PMU model for cluster2, which are the Mongoose cores. */
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
> +
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu4>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu5>;
> +				};
> +			};
> +
> +			cluster2 {
> +				core0 {
> +					cpu = <&cpu6>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x1>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x2>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x3>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu4: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a76";
> +			reg = <0x4>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu5: cpu@101 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a76";
> +			reg = <0x5>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu6: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "samsung,mongoose-m5";
> +			reg = <0x6>;
> +			enable-method = "psci";
> +		};
> +
> +		cpu7: cpu@201 {
> +			device_type = "cpu";
> +			compatible = "samsung,mongoose-m5";
> +			reg = <0x7>;
> +			enable-method = "psci";
> +		};
> +

Stray blank line

> +	};
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "hvc";
> +	};
> +
> +	oscclk: osc-clock {

clock-osc and keep order by node name

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-output-names = "oscclk";
> +	};
> +
> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		ranges = <0x0 0x0 0x0 0x20000000>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		chipid@10000000 {
> +			compatible = "samsung,exynos990-chipid",
> +				     "samsung,exynos850-chipid";
> +			reg = <0x10000000 0x100>;
> +		};
> +
> +		gic: interrupt-controller@10101000 {
> +			compatible = "arm,gic-400";
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			reg = <0x10101000 0x1000>,
> +			      <0x10102000 0x1000>,
> +			      <0x10104000 0x2000>,
> +			      <0x10106000 0x2000>;

reg is the second property

> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
> +						 IRQ_TYPE_LEVEL_HIGH)>;
> +			#address-cells = <0>;
> +			#size-cells = <1>;
> +		};
> +
> +		pinctrl_cmgp: pinctrl@15c30000 {

Keep order by unit address.

> +			compatible = "samsung,exynos990-pinctrl";
> +			reg = <0x15c30000 0x1000>;
> +		};
> +
> +		pinctrl_hsi1: pinctrl@13040000 {
> +			compatible = "samsung,exynos990-pinctrl";
> +			reg = <0x13040000 0x1000>;
> +			interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pinctrl_hsi2: pinctrl@13c30000 {
> +			compatible = "samsung,exynos990-pinctrl";
> +			reg = <0x13c30000 0x1000>;
> +			interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pinctrl_peric0: pinctrl@10430000 {
> +			compatible = "samsung,exynos990-pinctrl";
> +			reg = <0x10430000 0x1000>;
> +			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pinctrl_peric1: pinctrl@10730000 {
> +			compatible = "samsung,exynos990-pinctrl";
> +			reg = <0x10730000 0x1000>;
> +			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pinctrl_vts: pinctrl@15580000 {
> +			compatible = "samsung,exynos990-pinctrl";
> +			reg = <0x15580000 0x1000>;
> +		};
> +
> +		pinctrl_alive: pinctrl@15850000 {
> +			compatible = "samsung,exynos990-pinctrl";
> +			reg = <0x15850000 0x1000>;
> +
> +			wakeup-interrupt-controller {
> +				compatible = "samsung,exynos990-wakeup-eint",
> +					     "samsung,exynos7-wakeup-eint";
> +			};
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +
> +		/*
> +		 * Non-updatable, broken stock Samsung bootloader does not
> +		 * configure CNTFRQ_EL0
> +		 */
> +		clock-frequency = <26000000>;
> +	};
> +};
> +
> +#include "exynos990-pinctrl.dtsi"

Best regards,
Krzysztof


