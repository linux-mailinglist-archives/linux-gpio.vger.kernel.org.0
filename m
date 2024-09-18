Return-Path: <linux-gpio+bounces-10250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 715B497BFE9
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 19:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E83FA1F226C0
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 17:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D2B16D4E5;
	Wed, 18 Sep 2024 17:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LE3IpYln"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C141C9EB4;
	Wed, 18 Sep 2024 17:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726682060; cv=none; b=a/cnMwwh9pNB2Nb1egM5iFNEbrcMTp1zCWkqgZIuBS149kr2tRqzL/fH6Dq86aAvYil0oQiNbtgoABqVTPVA+2XyZVW1kiXTU9T2Ra8Oj7QY6sBSLaDLnzMn94NBg9BnH4/u7hX0gk3mTOSzWd7mYMSn1+ZFfKiSZt5QOgFZWc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726682060; c=relaxed/simple;
	bh=8g1ZyWNrJVy3mg588ybFXKX4m9TA5WDT4YyZap2W66Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFc/YI+Wr1yZHjK1/1JgDlvozjWTkZ2EZdZpB5xuqVinncYh4iEOxCv2gb3mkLvmI5ah7vvd+ZR4+TSi++2AC+iIOZ6v/8MWkxCr/mg87x69tZ8bO1kerrimh6MCfmY2x5q5b6RsrsAMDXmfAjwMfTHcaIE+hohr8DBT3CeVrTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LE3IpYln; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso61525305e9.1;
        Wed, 18 Sep 2024 10:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726682057; x=1727286857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YdeDfryno/+LkCXv1GZ4YNBzPvX86nNSKieqAhx+P8=;
        b=LE3IpYlnX64yp5R+uaCDgx817yIRAgCZuH7AMCyiHZeP3C1ju3FwHK7RAKUF7Tna5v
         g2I39BMc2XnvOUJuPH7+EdSKOgaQ2gC7zGQXu/Bm32u7tfTNyNeCI8KHYELeEZMxEqr2
         bep7JvhdCn1nJDEelC49VpxA1mCNOxyWYzZxZSa4HwCQPtq/LAAefeaJFNqJXHgeDOQt
         m0W2JVN+ZByP7En3715PXU0mHomDqOJ/nxuPKlK+nFgW3hccjMu4Mh3H3WwVDOivkUyc
         TM7aH5Sl4GUrIXQiFrmNqoKVKSxQa98ysxvTLP+h5psCmtka2DsBVLW5WlpTtcmL2MDW
         s8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726682057; x=1727286857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4YdeDfryno/+LkCXv1GZ4YNBzPvX86nNSKieqAhx+P8=;
        b=Uz3/ojhOjT1dOpLjz0rYsxGG87Eod2DpfaEs1JIKhOJdqTiimwKBDPXGA9NyHJe/ex
         zgZ84fisANyIt69vLvyH6umQ6rfhs85ozVeGj3WOGUexmGI172EyHgOYUDvNE1HKgtl5
         66N+1yKkIWxBwsBJwoOhpno2hhOgMaojjUfNd0jjDjreyP2LZK59k+9DHXELcp3Gobhs
         3vQNnkUIcxqUtdnYSyDzQSl0xgCOxyRr7E2yD2tFw7ERANfgBfSxZPaglX3h3ADBKsBJ
         z4Oix9+pnowOPmo/8mrf9coujVwuVk4Q+UwfArh8dkt3erixJ0/z4jHn5CjE0XgHnE9K
         +E0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU77MLCCNxnJECahI8qZIfKk7Hg2pTYLNhFGvr/vkrZbRGSQU2btqrbSmDUsY8QNeum4Dd1K5ln0fMBBA==@vger.kernel.org, AJvYcCWt5DsXpskP+bwjfsdShzsK6V9MRpwxJcDWDKBdP602w8KqKvgVoN1iJUwTzNsxeaua/X/Dg0/1bLaE@vger.kernel.org, AJvYcCWun4dKVcQa2uzTtMoD4r5Ykp0FDY+liU49pJOFovgRKLLMxl4ElXptP9t0lo90ct/TLLMrQUXr0SY5piL8jWpeNLI=@vger.kernel.org, AJvYcCXEOXrAkz7e0m4aKd8UMZLRSpmIw9YHNpi2Fxjx6nnY3aJDA3O2LiucrZH7Sm2Jd8oj4PyRVGPEwV8JUi+h@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4glQfg3fEMSLNMhjPG6yzqoLBBn59/ZoD0/yayDJSa14ht+G5
	GpWVjxbv1stwIynipRKPHxUfR6ZI00g5dAU3Jwr+0hYKNoA3nUZR
X-Google-Smtp-Source: AGHT+IHzflAi+Tk6JXO6OnkT4gjSHrOOAjOa6jFD00Heydj2S+pRfz+9cYpMV5t0dwEaJfWoEJVIwQ==
X-Received: by 2002:a05:6000:c86:b0:374:b3a3:3f83 with SMTP id ffacd0b85a97d-378c2d617cemr11727764f8f.53.1726682056212;
        Wed, 18 Sep 2024 10:54:16 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e70537c71sm22762645e9.31.2024.09.18.10.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 10:54:15 -0700 (PDT)
Message-ID: <ddda4f98-2402-04ab-108d-a1ee4beb33bd@gmail.com>
Date: Wed, 18 Sep 2024 20:54:14 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 08/10] arm64: dts: exynos: Add initial support for
 exynos8895 SoC
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
 <20240909110017.419960-9-ivo.ivanov.ivanov1@gmail.com>
 <ylxrbde4kafbos3qmx54w2d6hpv26ngxgkkpnbdynjj2wfce32@fyzr4jxzn6z4>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <ylxrbde4kafbos3qmx54w2d6hpv26ngxgkkpnbdynjj2wfce32@fyzr4jxzn6z4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/16/24 17:23, Krzysztof Kozlowski wrote:
> On Mon, Sep 09, 2024 at 02:00:15PM +0300, Ivaylo Ivanov wrote:
>
>> +&pinctrl_peric0 {
>> +	gpd0: gpd0-gpio-bank {
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +	};
>> +
>> +	gpd1: gpd1-gpio-bank {
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +	};
>> +
>> +	gpd2: gpd2-gpio-bank {
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +	};
>> +
>> +	gpd3: gpd3-gpio-bank {
> These should be ordered by node name. Same in peric1.
Alright.
>
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +	};
>> +
>> +	gpb1: gpb1-gpio-bank {
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +	};
>> +
>> +	gpe7: gpe7-gpio-bank {
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +	};
>> +
>> +	gpf1: gpf1-gpio-bank {
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +	};
>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
>> new file mode 100644
>> index 000000000..59af33420
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
>> @@ -0,0 +1,249 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
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
>> +		compatible = "arm,cortex-a53-pmu";
>> +		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
>> +			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-affinity = <&cpu0>,
>> +				     <&cpu1>,
>> +				     <&cpu2>,
>> +				     <&cpu3>;
>> +	};
>> +
>> +	/* There's no PMU model for the Mongoose cores */
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
> Why cpu@0 is cpu4 not cpu0? Anyway, these should be ordered by unit
> address.

cpu@100 is the boot core of the first cluster consisting of cortex-a53

cores, hence why it's labelled as cpu0. The second cluster contains

the Mongoose cores, labelled and ordered after the first cluster.


It's ordered like so on a lot of SoCs for sanity's sake, hence why I

believe it should stay like that.


If you still think that they must be ordered by unit address, please

explicitly let me know so that I include that change in the v5.


Regards, Ivo.

>
>> +
>> +	oscclk: osc-clock {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +		clock-output-names = "oscclk";
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
> Keep order by names, timer goes after soc.
>
>> +		compatible = "arm,armv8-timer";
>> +		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
>> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>> +		/*
>> +		 * Non-updatable, broken stock Samsung bootloader does not
>> +		 * configure CNTFRQ_EL0
>> +		 */
>> +		clock-frequency = <26000000>;
>> +	};
>> +
>> +	soc: soc@0 {
>> +		compatible = "simple-bus";
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0x0 0x0 0x0 0x20000000>;
> ranges is the second property (see DTS coding style).
>
>> +
>> +		chipid@10000000 {
>> +			compatible = "samsung,exynos8895-chipid",
>> +				     "samsung,exynos850-chipid";
>> +			reg = <0x10000000 0x24>;
>> +		};
>> +
>> +		gic: interrupt-controller@10201000 {
>> +			compatible = "arm,gic-400";
>> +			#interrupt-cells = <3>;
>> +			#address-cells = <0>;
>> +			interrupt-controller;
>> +			reg = <0x10201000 0x1000>,
> reg is second, please follow DTS coding style for new submissions.
>
>> +			      <0x10202000 0x1000>,
>> +			      <0x10204000 0x2000>,
>> +			      <0x10206000 0x2000>;
>> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
>> +						 IRQ_TYPE_LEVEL_HIGH)>;
>> +		};
> Best regards,
> Krzysztof
>

