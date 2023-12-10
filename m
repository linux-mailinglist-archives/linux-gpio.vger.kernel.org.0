Return-Path: <linux-gpio+bounces-1195-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881680BBC2
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 15:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30BEB1C20928
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 14:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72D2156DF;
	Sun, 10 Dec 2023 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JpT2rf5Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9CBFC
	for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 06:38:43 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a00c200782dso481202766b.1
        for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 06:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702219122; x=1702823922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9rj3u8Yy/EreftvWNnUMWPW+sdikD5j4wuv5v1LFbfg=;
        b=JpT2rf5ZNHDBk9UHoAl+btnfijx8NdFwLzYsCzeFIXJxPqpRtu6tkZltPmE2HTojRl
         uV+8qT1lgNCxJX26G8wpKQoMIxJ1VNVOmpEXgj6h0HFnFiKej+xN5wrxNYq6R318ygfm
         2WssTZhqM9nQaO4IY0lUgN2svi8PHvGktexwoQ6yl055qSpIXuOe+WFw+JnFrXtplwzy
         G0vRWyFe+UQKPgrdmv6KC6zIqh3MnDrHKL4fJrQluO7QUbYwGZmLH/6oqZpinxbw/oBA
         ZjiDZrAozt0myGJhKGl1ZzxByueBQBWM1utmjonoAXClS/U9jxY3l3fGHaWgzU+uhd4o
         QXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702219122; x=1702823922;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9rj3u8Yy/EreftvWNnUMWPW+sdikD5j4wuv5v1LFbfg=;
        b=uSYKlbN/vmJo2nWUTb70YBg4NK9oEmr0+7HSKbzJieHF7iE1y9yMjpzIuM+QrjOFon
         K1X60vngPzO2g7ovH1OHK/2AldTxgNLwTrFmjCfeXz9lQF4g0FbsKZo0wkyrZVDYyFEP
         glGctFbFLeMYw9Bft+/F9Kb/1PeYBzfs16YctgZ/sJBmuEIq3yfAtXTbeyyJWby5YNL/
         FC+XM74wCZBpsK3RznfM1y2p67h1isBBRZip45TKZu5wqOvBcILEFmfLYQHjyAn53UfS
         fiM5/IDC9JU5wnrkuxQf+Hpt72zcO5XOpEfD8YmK+C3CHGUv897RDhBTdrUmfP8WF0LH
         KwYQ==
X-Gm-Message-State: AOJu0YzBT0C/6WEs6wiP3pSEzpxW3C/3p5l3SefomnUaByycCguHPJHE
	ylChPPyRo28qH0+Nbj0f/AJNyQ==
X-Google-Smtp-Source: AGHT+IH5SSJfRxt9rexPWoB8DJcsL1qC84BW0o7F0g+RZT+9+3KGokWi2xSyUrMWdZfU947O+c5WQg==
X-Received: by 2002:a17:906:bcf3:b0:a1c:c3c3:73eb with SMTP id op19-20020a170906bcf300b00a1cc3c373ebmr747973ejb.250.1702219121991;
        Sun, 10 Dec 2023 06:38:41 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id fm14-20020a05600c0c0e00b00407b93d8085sm12119612wmb.27.2023.12.10.06.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Dec 2023 06:38:41 -0800 (PST)
Message-ID: <8400d76b-2a04-4d60-ad6c-954dca07562f@linaro.org>
Date: Sun, 10 Dec 2023 15:38:38 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/20] arm64: dts: exynos: google: Add initial Google
 gs101 SoC support
Content-Language: en-US
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 olof@lixom.net, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 cw00.choi@samsung.com, alim.akhtar@samsung.com
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel-team@android.com,
 linux-serial@vger.kernel.org
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-19-peter.griffin@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231209233106.147416-19-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/12/2023 00:31, Peter Griffin wrote:
> Google gs101 SoC is a ARMv8 mobile SoC found in the Pixel 6
> (oriole), Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
> phones.
> 
> It features:
> * 4xA55 Little cluster
> * 2xA76 Mid cluster
> * 2xX1 Big cluster
> 

...

> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h b/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h
> new file mode 100644
> index 000000000000..68b7bc47c91b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Pinctrl binding constants for GS101
> + *
> + * Copyright 2020-2023 Google LLC
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_GS101_H__
> +#define __DT_BINDINGS_PINCTRL_GS101_H__

Header guards don't really match location.

> +
> +#define GS101_PIN_PULL_NONE		0
> +#define GS101_PIN_PULL_DOWN		1
> +#define GS101_PIN_PULL_UP		3
> +
> +/* Pin function in power down mode */
> +#define GS101_PIN_PDN_OUT0		0
> +#define GS101_PIN_PDN_OUT1		1
> +#define GS101_PIN_PDN_INPUT		2
> +#define GS101_PIN_PDN_PREV		3
> +
> +/* GS101 drive strengths */
> +#define GS101_PIN_DRV_2_5_MA		0
> +#define GS101_PIN_DRV_5_MA		1
> +#define GS101_PIN_DRV_7_5_MA		2
> +#define GS101_PIN_DRV_10_MA		3
> +
> +#define GS101_PIN_FUNC_INPUT		0
> +#define GS101_PIN_FUNC_OUTPUT		1
> +#define GS101_PIN_FUNC_2		2
> +#define GS101_PIN_FUNC_3		3
> +#define GS101_PIN_FUNC_EINT		0xf
> +
> +#endif /* __DT_BINDINGS_PINCTRL_GS101_H__ */
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> new file mode 100644
> index 000000000000..60e112d25246
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -0,0 +1,476 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * GS101 SoC
> + *
> + * Copyright 2019-2023 Google LLC
> + * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
> + */
> +
> +#include <dt-bindings/clock/google,gs101.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/samsung,exynos-usi.h>
> +
> +/ {
> +	compatible = "google,gs101";
> +	#address-cells = <2>;
> +	#size-cells = <1>;
> +
> +	interrupt-parent = <&gic>;
> +
> +	aliases {
> +		pinctrl0 = &pinctrl_gpio_alive;
> +		pinctrl1 = &pinctrl_far_alive;
> +		pinctrl2 = &pinctrl_gsacore;
> +		pinctrl3 = &pinctrl_gsactrl;
> +		pinctrl4 = &pinctrl_peric0;
> +		pinctrl5 = &pinctrl_peric1;
> +		pinctrl6 = &pinctrl_hsi1;
> +		pinctrl7 = &pinctrl_hsi2;
> +	};
> +
> +	pmu-0 {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
> +	};
> +
> +	pmu-1 {
> +		compatible = "arm,cortex-a76-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
> +	};
> +
> +	pmu-2 {
> +		compatible = "arm,cortex-x1-pmu";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster2>;
> +	};
> +
> +	pmu-3 {
> +		compatible = "arm,dsu-pmu";
> +		interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>;
> +		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
> +		       <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> +	};

Keep alphabetical order of top-level nodes. pmu should be before psci

> +
> +	/* TODO replace with CCF clock */
> +	dummy_clk: oscillator {

clock-3

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <12345>;
> +		clock-output-names = "pclk";
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
> +			};
> +
> +			cluster2 {
> +				core0 {
> +					cpu = <&cpu6>;
> +				};
> +				core1 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};

...

> +
> +	/* ect node is required to be present by bootloader */
> +	ect {
> +	};

alphabetical order

> +
> +	ext_24_5m: clock-1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-output-names = "oscclk";
> +	};
> +
> +	ext_200m: clock-2 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-output-names = "ext-200m";
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gsa_reserved_protected: gsa@90200000 {
> +			reg = <0x0 0x90200000 0x400000>;
> +			no-map;
> +		};
> +
> +		tpu_fw_reserved: tpu-fw@93000000 {
> +			reg = <0x0 0x93000000 0x1000000>;
> +			no-map;
> +		};
> +
> +		aoc_reserve: aoc@94000000 {
> +			reg = <0x0 0x94000000 0x03000000>;
> +			no-map;
> +		};
> +
> +		abl_reserved: abl@f8800000 {
> +			reg = <0x0 0xf8800000 0x02000000>;
> +			no-map;
> +		};
> +
> +		dss_log_reserved: dss-log-reserved@fd3f0000 {
> +			reg = <0x0 0xfd3f0000 0x0000e000>;
> +			no-map;
> +		};
> +
> +		debug_kinfo_reserved: debug-kinfo-reserved@fd3fe000 {
> +			reg = <0x0 0xfd3fe000 0x00001000>;
> +			no-map;
> +		};
> +
> +		bldr_log_reserved: bldr-log-reserved@fd800000 {
> +			reg = <0x0 0xfd800000 0x00100000>;
> +			no-map;
> +		};
> +
> +		bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
> +			reg = <0x0 0xfd900000 0x00002000>;
> +			no-map;
> +		};
> +	};
> +
> +	timer {

alphabetical order, so this goes to the end

> +		compatible = "arm,armv8-timer";
> +		interrupts =
> +		   <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> +		   <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> +		   <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> +		   <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
> +		clock-frequency = <24576000>;

I don't remember if you already got Marc's wrath, so just in case: are
you sure it is needed?

Anyway, this is board specific, not SoC.

> +	};
> +
> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x0 0x40000000>;
> +
> +		cmu_misc: clock-controller@10010000 {
> +			compatible = "google,gs101-cmu-misc";
> +			reg = <0x10010000 0x8000>;
> +			#clock-cells = <1>;
> +			clocks =  <&cmu_top CLK_DOUT_CMU_MISC_BUS>,

One space after =

> +				  <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
> +			clock-names = "dout_cmu_misc_bus", "dout_cmu_misc_sss";
> +		};
> +
> +		watchdog_cl0: watchdog@10060000 {
> +			compatible = "google,gs101-wdt";
> +			reg = <0x10060000 0x100>;
> +			interrupts = <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =
> +			  <&cmu_misc CLK_GOUT_MISC_WDT_CLUSTER0_PCLK>,

Join lines (clocks = <foo bar>). Same in other places.

> +			  <&ext_24_5m>;
> +			clock-names = "watchdog", "watchdog_src";
> +			samsung,syscon-phandle = <&pmu_system_controller>;
> +			samsung,cluster-index = <0>;
> +			status = "disabled";
> +		};
> +
> +		watchdog_cl1: watchdog@10070000 {
> +			compatible = "google,gs101-wdt";
> +			reg = <0x10070000 0x100>;
> +			interrupts = <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =
> +			  <&cmu_misc CLK_GOUT_MISC_WDT_CLUSTER1_PCLK>,
> +			  <&ext_24_5m>;
> +			clock-names = "watchdog", "watchdog_src";
> +			samsung,syscon-phandle = <&pmu_system_controller>;
> +			samsung,cluster-index = <1>;
> +			status = "disabled";
> +		};
> +
> +		gic: interrupt-controller@10400000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <4>;
> +			interrupt-controller;
> +			reg = <0x10400000 0x10000>, /* GICD */
> +			      <0x10440000 0x100000>;/* GICR * 8 */
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			ppi-partitions {
> +				ppi_cluster0: interrupt-partition-0 {
> +					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
> +				};
> +
> +				ppi_cluster1: interrupt-partition-1 {
> +					affinity = <&cpu4 &cpu5>;
> +				};
> +
> +				ppi_cluster2: interrupt-partition-2 {
> +					affinity = <&cpu6 &cpu7>;
> +				};
> +			};
> +		};
> +
> +		sysreg_peric0: syscon@10820000 {
> +			compatible = "google,gs101-peric0-sysreg", "syscon";
> +			reg = <0x10820000 0x10000>;
> +		};
> +
> +		pinctrl_peric0: pinctrl@10840000 {
> +			compatible = "google,gs101-pinctrl";
> +			reg = <0x10840000 0x00001000>;
> +			interrupts = <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0>;
> +		};
> +
> +		usi_uart: usi@10a000c0 {
> +			compatible = "google,gs101-usi",
> +				     "samsung,exynos850-usi";
> +			reg = <0x10a000c0 0x20>;
> +			samsung,sysreg = <&sysreg_peric0 0x1020>;
> +			samsung,mode = <USI_V2_UART>;

vendor properties go to the end, after standard properties, before status.

https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/tree/Documentation/devicetree/bindings/dts-coding-style.rst?h=dt/next&id=0d3a771610d0e155c9aa305f142f84dda5030fae#n122

> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			clocks = <&dummy_clk>, <&dummy_clk>;
> +			clock-names = "pclk", "ipclk";
> +			status = "disabled";
> +
> +			serial_0: serial@10a00000 {
> +				compatible = "google,gs101-uart";
> +				reg = <0x10a00000 0xc0>;
> +				reg-io-width = <4>;
> +				samsung,uart-fifosize = <256>;

Ditto

> +				interrupts = <GIC_SPI 634
> +					      IRQ_TYPE_LEVEL_HIGH 0>;
> +				clocks = <&dummy_clk 0>, <&dummy_clk 0>;
> +				clock-names = "uart", "clk_uart_baud0";
> +				status = "disabled";
> +			};
> +		};


Best regards,
Krzysztof


