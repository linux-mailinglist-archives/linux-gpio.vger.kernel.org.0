Return-Path: <linux-gpio+bounces-8655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C1094A6CE
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 13:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 018E71F242A3
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EB61E4858;
	Wed,  7 Aug 2024 11:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cllk1xVi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2781E211D;
	Wed,  7 Aug 2024 11:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723029625; cv=none; b=Ru9VCNY3QiurqHFhcnxSC+GHFCLhhjmeKTwzRhTRDd/R4VYqaFYgZWtyvUQktGgQ0ObgchM5a3n92WuUFn42sFOVuGaG6REGPST8Khesi09UVTyZE51rGz3tSgVIkLvRUwGQGJ2m8rnPQ3gW8YdHcqppDp3VVdoyzDQnB3Nk6mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723029625; c=relaxed/simple;
	bh=ZCmhpmsLazhdxjlYZHpLcdaUTT1GPopHDcP/gDt8cuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pr8Zl1HZ1PFOJO1MEAKmqhYQPpFwaverG3DmQ56YFopwh6LdfKUP5mdqmmXgkbugER+SubZKXW4jrHb3hZ2UCMIGWloOwo6HJCKosgDuwy4m7sl3pZGV7APTXFTDn2tN4zk3M3pnagUb4qP0m9TTBMWzWoikA2y/aN7JDK2gcL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cllk1xVi; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f00ad303aso2513064e87.2;
        Wed, 07 Aug 2024 04:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723029621; x=1723634421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6SdX9elpwmR+9dA4zlJpVzZhgDrBRlEYA0P/uGF5Q18=;
        b=Cllk1xViiwuPG0Ltmm/TCIr2OjgLTSV1Q9dmpWU2iJ6KtxaTQzaYTih3UoVYZR7JNa
         poBgFI8RbRXippMNxRE9uGflWKdie8DeK6fxPBNi0zZS7CDqYBA41jEDvpSI2opNpIns
         KyMXazfxrGvvwIzFvP4/7x6fF7IqMk88yXjEgbgNoIEB/nVcjoKX5dCffvvx0TsdlVl1
         a+V9w6Cs7KigZ0F/b7jH2nsPVneNJoREx9U5266k/EgYTE4lF7W5LeF2op/GAUuThMZm
         YyD4V4m0eGoY9imlwaCHLUYk9ndy9Vf7AX7kO/ZoILpDM6Ud6cZzG9kBOQXqHG5qyGRE
         EEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723029621; x=1723634421;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6SdX9elpwmR+9dA4zlJpVzZhgDrBRlEYA0P/uGF5Q18=;
        b=lR4PKHgJNew1vnodnKfE29sTeEtgaUs5pc/RLIZtP38rptEe4mbgVFqYxjgToxCQjB
         Vd3PN4iofTE894DEtF3QRfiWeg7JsdfJHl4AWrOKhGr/WbgU2iqJ2a2BLQAPTshj2mtp
         4RRWxB7IQUy115Nn875Pa1uo9RiFjntvMUWmOIJMll2gAH1SDl1Zr5/5CRzfyF5FbOuo
         AnZgs/mzGk/VqYiIwy/siThN8NKpViHlS/ZhTTPESzxwD1knV//PHZ10fEfizMumLamq
         2IOZWk8aQmSSf+w/bHpqvS7BX7+TiQKTp7tugCvGCUpqgY0kXWYpdEDSuBDB7T85GEn3
         Vo7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcGbyX0dw76ro/nhGc5zVF7WYINyo/PT7lkiKdQbfOu3IeB0HP26e39PfRyff5uQqZbpT9WJAhmV0BT9xJgZwmkgJ6LC/unfGRTFjPApeSjlYTJ3LH4M+QuUpvzXCN2h0wvnsVPmYKmdA7GNh5llbQqC75EYAH75HRb9kKIn2TWpv/NWo=
X-Gm-Message-State: AOJu0YzV6P3z2Hc494nOQ39UJ9cuZBGWgssoX3anljiGx9U9zO56O/PE
	hKfK0nafX2pzLmUCgI6iVa6YiAVQqEpgHU+dn6rhT5XmTJ2G+60P
X-Google-Smtp-Source: AGHT+IFa9AgX8unKF88MadhcDPZ/jUepJlRmfLyQ0lvePZMIMoDyDMB0tqOi5A0+RBgdr38BzgZl0A==
X-Received: by 2002:a05:6512:131e:b0:52c:952a:67da with SMTP id 2adb3069b0e04-530bb4d6d4fmr12055574e87.55.1723029620773;
        Wed, 07 Aug 2024 04:20:20 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5baff14989fsm4376789a12.55.2024.08.07.04.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 04:20:20 -0700 (PDT)
Message-ID: <5274b8a1-b81c-3979-ed6c-3572f6a6cfc2@gmail.com>
Date: Wed, 7 Aug 2024 14:20:18 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 08/10] arm64: dts: exynos: Add initial support for
 exynos8895 SoC
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
 <20240807082843.352937-9-ivo.ivanov.ivanov1@gmail.com>
 <e6b4e0d8-7183-4ff4-a373-cb1c0c98d993@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <e6b4e0d8-7183-4ff4-a373-cb1c0c98d993@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/7/24 12:20, Krzysztof Kozlowski wrote:
> On 07/08/2024 10:28, ivo.ivanov.ivanov1@gmail.com wrote:
>> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>
>> Exynos 8895 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy
>> S8 (dreamlte), S8 Plus (dream2lte), Note 8 (greatlte) and the Meizu
>> 15 Plus (m1891). Add minimal support for that SoC, including:
>>
>> - All 8 cores via PSCI
>> - ChipID
>> - Generic ARMV8 Timer
>> - Enumarate all pinctrl nodes
>>
>> Further platform support will be added over time.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  .../boot/dts/exynos/exynos8895-pinctrl.dtsi   | 1378 +++++++++++++++++
>>  arch/arm64/boot/dts/exynos/exynos8895.dtsi    |  253 +++
>>  2 files changed, 1631 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
>> new file mode 100644
>> index 000000000..1dcb61e2e
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
>> @@ -0,0 +1,1378 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Samsung's Exynos 8895 SoC pin-mux and pin-config device tree source
>> + *
>> + * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include "exynos-pinctrl.h"
>> +
>> +&pinctrl_alive {
>> +	gpa0: gpa0 {
> I do not believe this was tested. See maintainer SoC profile for Samsung
> Exynos.
>
> Limited review follows due to lack of testing.
>
>
>> +};
>> diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
>> new file mode 100644
>> index 000000000..3ed381ee5
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
>> @@ -0,0 +1,253 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Samsung's Exynos 8895 SoC device tree source
>> + *
>> + * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +/ {
>> +	compatible = "samsung,exynos8895";
>> +	#address-cells = <2>;
>> +	#size-cells = <1>;
>> +
>> +	interrupt-parent = <&gic>;
>> +
>> +	aliases {
>> +		pinctrl0 = &pinctrl_alive;
>> +		pinctrl1 = &pinctrl_abox;
>> +		pinctrl2 = &pinctrl_vts;
>> +		pinctrl3 = &pinctrl_fsys0;
>> +		pinctrl4 = &pinctrl_fsys1;
>> +		pinctrl5 = &pinctrl_busc;
>> +		pinctrl6 = &pinctrl_peric0;
>> +		pinctrl7 = &pinctrl_peric1;
>> +	};
>> +
>> +	arm-a53-pmu {
> Are there two pmus?

Hm. The Downstream kernel has them all under one node with compatible

'arm,armv8-pmuv3', same as with Exynos 7885. So it should have two PMUs,

one for each cluster.


Considering the second cluster consists of Samsung's custom Mongoose M2

cores, what would be the most adequate thing to do? Keep the first PMU as

"arm,cortex-a53-pmu" and use the SW model "arm,armv8-pmuv3" for the

second PMU? I doubt guessing if these mongoose cores are based on already

existing cortex cores is a great idea.

>> +		compatible = "arm,cortex-a53-pmu";
>> +		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-affinity = <&cpu0>,
>> +				     <&cpu1>,
>> +				     <&cpu2>,
>> +				     <&cpu3>,
>> +				     <&cpu4>,
>> +				     <&cpu5>,
>> +				     <&cpu6>,
>> +				     <&cpu7>;
>> +	};
>> +
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu-map {
>> +			cluster0 {
>> +				core0 {
>> +					cpu = <&cpu0>;
>> +				};
>> +				core1 {
>> +					cpu = <&cpu1>;
>> +				};
>> +				core2 {
>> +					cpu = <&cpu2>;
>> +				};
>> +				core3 {
>> +					cpu = <&cpu3>;
>> +				};
>> +			};
>> +
>> +			cluster1 {
>> +				core0 {
>> +					cpu = <&cpu4>;
>> +				};
>> +				core1 {
>> +					cpu = <&cpu5>;
>> +				};
>> +				core2 {
>> +					cpu = <&cpu6>;
>> +				};
>> +				core3 {
>> +					cpu = <&cpu7>;
>> +				};
>> +			};
>> +		};
>> +
>> +		cpu0: cpu@100 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a53";
>> +			reg = <0x100>;
>> +			enable-method = "psci";
>> +		};
>> +
>> +		cpu1: cpu@101 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a53";
>> +			reg = <0x101>;
>> +			enable-method = "psci";
>> +		};
>> +
>> +		cpu2: cpu@102 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a53";
>> +			reg = <0x102>;
>> +			enable-method = "psci";
>> +		};
>> +
>> +		cpu3: cpu@103 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a53";
>> +			reg = <0x103>;
>> +			enable-method = "psci";
>> +		};
>> +
>> +		cpu4: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "samsung,mongoose-m2";
>> +			reg = <0x0>;
>> +			enable-method = "psci";
>> +		};
>> +
>> +		cpu5: cpu@1 {
>> +			device_type = "cpu";
>> +			compatible = "samsung,mongoose-m2";
>> +			reg = <0x1>;
>> +			enable-method = "psci";
>> +		};
>> +
>> +		cpu6: cpu@2 {
>> +			device_type = "cpu";
>> +			compatible = "samsung,mongoose-m2";
>> +			reg = <0x2>;
>> +			enable-method = "psci";
>> +		};
>> +
>> +		cpu7: cpu@3 {
>> +			device_type = "cpu";
>> +			compatible = "samsung,mongoose-m2";
>> +			reg = <0x3>;
>> +			enable-method = "psci";
>> +		};
>> +	};
>> +
>> +	psci {
>> +		compatible = "arm,psci";
>> +		method = "smc";
>> +		cpu_suspend = <0xc4000001>;
>> +		cpu_off = <0x84000002>;
>> +		cpu_on = <0xc4000003>;
>> +	};
>> +
>> +	timer {
>> +		compatible = "arm,armv8-timer";
>> +		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
>> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>> +		clock-frequency = <26000000>;
> Hm? I think this was explicitly disallowed.

It's weird. Without the clock-frequency property it fails early during the

boot process and I can't get any logs from pstore or simple-framebuffer.

Yet it's not set on similar platforms (exynos7885, autov9). Perhaps I

could alias the node and set it in the board device tree..? That doesn't

sound right.


Best regards,

Ivaylo

>> +	};
>> +
>> +	fixed-rate-clocks {
> Keep order of properties, just like DTS coding style asks.
>
> Anyway, fixed-rate-clocks wrapper is not needed, drop.
>
>> +		oscclk: osc-clock {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-output-names = "oscclk";
>> +		};
>> +	};
>> +
>> +	soc: soc@0 {
>> +		compatible = "simple-bus";
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0x0 0x0 0x0 0x20000000>;
>> +
>> +		chipid@10000000 {
>> +			compatible = "samsung,exynos8895-chipid",
>> +				     "samsung,exynos850-chipid";
>> +			reg = <0x10000000 0x24>;
>> +		};
>> +
>> +		gic: interrupt-controller@10200000 {
>> +			compatible = "arm,gic-400";
>> +			#interrupt-cells = <3>;
>> +			#address-cells = <0>;
>> +			interrupt-controller;
>> +			reg = <0x10201000 0x1000>,
>> +			      <0x10202000 0x1000>,
>> +			      <0x10204000 0x2000>,
>> +			      <0x10206000 0x2000>;
>> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
>> +						 IRQ_TYPE_LEVEL_HIGH)>;
>> +		};
>> +
>> +		pinctrl_alive: pinctrl@164b0000 {
>> +			compatible = "samsung,exynos8895-pinctrl";
>> +			reg = <0x164b0000 0x1000>;
>> +
>> +			wakeup-interrupt-controller {
>> +				compatible = "samsung,exynos8895-wakeup-eint",
>> +					     "samsung,exynos7-wakeup-eint";
>> +				interrupt-parent = <&gic>;
>> +				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>> +			};
>> +		};
>> +
>> +		pinctrl_abox: pinctrl@13e60000 {
> This does not look ordered. See DTS coding style.
>
> Best regards,
> Krzysztof
>

