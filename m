Return-Path: <linux-gpio+bounces-10192-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E8F97A404
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 16:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 352912899F2
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 14:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5216156C52;
	Mon, 16 Sep 2024 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMwVGes4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468745234;
	Mon, 16 Sep 2024 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726496588; cv=none; b=L37kxpsaL+2NQ9f17yNvVDvisQAcx5oeFi8TRfE9A0p3uxGgrwzCcfgRkL0aJD+HgYJ+SJvcI9BTJ6Uoi1iCdjpiarhPYPwQbs8aDW0MbHIvN7K8/Gyu6k9Hry3/aTPNsa3+AG25+h+wkNnH8i2LPRo4/+HKlmkhUJmz+Cl+nCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726496588; c=relaxed/simple;
	bh=rfJhMCF9a3YUQfTDBLtaUfITXfq+d2EH5scRnePebBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQOEkNcKb+jrwEC19FcwDjm+1xbtZBd12THCVYkZLFGpxCtX8FN1k0H112pJ2AxCFrSaFKsC/buyqSd+/7L72GFoFFvgSYzoDvTZsN4Ta+fGjBihwssLBoX4U3Pvkc65Y3LGM5ONltHwjmWgnFqPK4LuvrcFlfv1Mc/qonsLUUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMwVGes4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC0DC4CEC5;
	Mon, 16 Sep 2024 14:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726496587;
	bh=rfJhMCF9a3YUQfTDBLtaUfITXfq+d2EH5scRnePebBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tMwVGes4JQcdfQRUuZAGk5Y2ZETok45vAyjIdBy4xdctl1rAmh1Pq2lfhyYG9Asp5
	 HHmXsrMrruZ2hnQUXsednJlHkfRx6rX8M+pCeXTLcPBTzA+f3uQZ9V6id/t7aKX+Aj
	 wxHSx98uh3fxVGnqyL5IuoRMbLyFHvxk7mPjXQmd5y7rveIc3+TSgTI1EuofAPnR/M
	 VHQkzgYFSifxMsyvXXPrL7up4YRCuQGohckeVCTQsH6A3J/yFAoeW/3maOm3mKW/Wl
	 wbzoFtRnwt2o8Qhs3YdVqaN3jPKRJhzdZ19E35LNgb55QXJMOvMJrXb7ieFd7qda5l
	 JIcU2tcRl+nSw==
Date: Mon, 16 Sep 2024 16:23:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/10] arm64: dts: exynos: Add initial support for
 exynos8895 SoC
Message-ID: <ylxrbde4kafbos3qmx54w2d6hpv26ngxgkkpnbdynjj2wfce32@fyzr4jxzn6z4>
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
 <20240909110017.419960-9-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909110017.419960-9-ivo.ivanov.ivanov1@gmail.com>

On Mon, Sep 09, 2024 at 02:00:15PM +0300, Ivaylo Ivanov wrote:

> +&pinctrl_peric0 {
> +	gpd0: gpd0-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpd1: gpd1-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpd2: gpd2-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpd3: gpd3-gpio-bank {

These should be ordered by node name. Same in peric1.

> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb1: gpb1-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpe7: gpe7-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpf1: gpf1-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};


> diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> new file mode 100644
> index 000000000..59af33420
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
> @@ -0,0 +1,249 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
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
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>,
> +				     <&cpu1>,
> +				     <&cpu2>,
> +				     <&cpu3>;
> +	};
> +
> +	/* There's no PMU model for the Mongoose cores */
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

Why cpu@0 is cpu4 not cpu0? Anyway, these should be ordered by unit
address.

> +
> +	oscclk: osc-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-output-names = "oscclk";
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

Keep order by names, timer goes after soc.

> +		compatible = "arm,armv8-timer";
> +		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +		/*
> +		 * Non-updatable, broken stock Samsung bootloader does not
> +		 * configure CNTFRQ_EL0
> +		 */
> +		clock-frequency = <26000000>;
> +	};
> +
> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x0 0x20000000>;

ranges is the second property (see DTS coding style).

> +
> +		chipid@10000000 {
> +			compatible = "samsung,exynos8895-chipid",
> +				     "samsung,exynos850-chipid";
> +			reg = <0x10000000 0x24>;
> +		};
> +
> +		gic: interrupt-controller@10201000 {
> +			compatible = "arm,gic-400";
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +			interrupt-controller;
> +			reg = <0x10201000 0x1000>,

reg is second, please follow DTS coding style for new submissions.

> +			      <0x10202000 0x1000>,
> +			      <0x10204000 0x2000>,
> +			      <0x10206000 0x2000>;
> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
> +						 IRQ_TYPE_LEVEL_HIGH)>;
> +		};

Best regards,
Krzysztof


