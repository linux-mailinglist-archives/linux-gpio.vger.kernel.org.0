Return-Path: <linux-gpio+bounces-10072-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7299F978084
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 14:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9158BB21604
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 12:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262021DA627;
	Fri, 13 Sep 2024 12:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I+ZgIEeG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDA41DA61B
	for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2024 12:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726231951; cv=none; b=eEW+zFcbKHRSE4ZsDtZ7fg0pXw/pGee71g1B1uQxMcH9JhWCMuyqxjhecOFeUsPAjpgV4+3SwSeBjm9//5m7G/98DB5Cx4dPsWgBK1DK3oGELAqE5R43Azx0N5MUt/tSul2Sv7g/QlR1Aff1QOI7cdv2RXlPoXAHOh0HJVRDREo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726231951; c=relaxed/simple;
	bh=InmcLJVGxQRnbxZW7WSOAZsO/nLv0XDRjt5TobLxhWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsAKiEGar/F2xcj1/gVnBSQ6uoTb+XWPwS53lS1zpAPkYg8uAFvG19wqW+TX6zxkHJRsO5CfvPdZLURPsh6MCBKs8/ZzVX4T49ah0Y6amOz7ODBpAr/Kbn/zgwSK5MjgDesiFaDPGx/slRFSqE0WVLroY9pIMUTk8ZbKdzW/rUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I+ZgIEeG; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53653ee23adso1926361e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2024 05:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726231948; x=1726836748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dfsHGYsyQ8o6DYwl/1dPx06pLpMTes7M/zHj5Ag9L2c=;
        b=I+ZgIEeGmCUYXkjiUgfibgs3ml+QjaFfxGNf3K8K9Ss9LKUsxlsio8mW2jhNY2LRZz
         lryGfs5ULtd2XFUalUmHU8cEsquaCTQiB+N+p9cKtVz2QGFOLorue/3pna1E3b39pp1U
         3Ehv7kGjVxkncgCjvlAUqt2pvrzONj9SJ5IU4iMjwCv775jcIWZfMNBVfUZ2D8eaakpE
         ypa/r53mPns2zmCKh+SxCIiOTlr03irpJX50WoK9aXlUppxytt3wNLyg+T4sSekteE3o
         1ZOUBkQX+B0423VGCLIOwUJHHpht1z2GWwS+T4/m3SXJvkd45Cti07a46R+Yv7imVtWI
         ET8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726231948; x=1726836748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfsHGYsyQ8o6DYwl/1dPx06pLpMTes7M/zHj5Ag9L2c=;
        b=n3NacU9r4zzST6ll5qkmfoWo54rrIzpGgbiT+wRREzG8sGjRie4CZ236+GS9T1iiQA
         l+g5yETkNr/BUH/DWRRb3RzkJD0SQvgwJIv4DBp4ElJKPEZAW7v/X4/R6RN0fH/r5Xlu
         Wp/f9tegHF0VjaI48vpi9n/QIaoc4ufclftNez3Qpy0SeQLDD9YoPY8ggtcWrw++R2xe
         OKebJfQDJRB2ydKt6I1GU4sv5k6AHcd4PKHG94FCD5SblGgSWyDXnSwzKkZGLcDQyZ4r
         L88GgPm32s+/nEXX4oLVGEiYYmzjXdzpqPgO44CyQvLwYXPpxEIVACJICzMHC/ivi+rt
         fakw==
X-Forwarded-Encrypted: i=1; AJvYcCVfE0l8s7EG7GBJtZPVkHk0bNso37mwk8Jh3KgHdsATFbTaxCFF2XMAr+XBpYbq2ovnhYeOPrG1hUBw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcne7RGBOqe0ug9d2MZR8u9XKEknuWp7JBHkOHkIsy41ERu7CL
	tVyGRAHFFzWoe9EzxCN845u14VikJSaqExzwmnmMg5hi18D7vZkRQSBeAdRj7e0=
X-Google-Smtp-Source: AGHT+IFZHpEGkLLJwdevguvnweP9iazHighjUx5MclCe4J7sJn6hkapWZpl1EO/Gkf6bJ8/rWfRtcg==
X-Received: by 2002:a05:6512:12c4:b0:52c:db0a:a550 with SMTP id 2adb3069b0e04-53678feb66dmr3929927e87.42.1726231947275;
        Fri, 13 Sep 2024 05:52:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f8cb67dsm2265791e87.129.2024.09.13.05.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 05:52:26 -0700 (PDT)
Date: Fri, 13 Sep 2024 15:52:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ulf.hansson@linaro.org, linus.walleij@linaro.org, catalin.marinas@arm.com, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, neil.armstrong@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_varada@quicinc.com
Subject: Re: [PATCH 7/8] arm64: dts: qcom: add IPQ5424 SoC and rdp466 board
 support
Message-ID: <fyoh72in62sfmsw3syqswr2p3pcv26zoce2tvlx53mu4lpoakx@ixyvy4oylms3>
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
 <20240913121250.2995351-8-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913121250.2995351-8-quic_srichara@quicinc.com>

On Fri, Sep 13, 2024 at 05:42:49PM GMT, Sricharan R wrote:
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

Drop

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

sleep comes between tlmm and uart1

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

I think Krzysztof lately suggested moving these clocks to board DT
files.

> +	};
> +
> +	cpus: cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		CPU0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_0>;
> +			L2_0: l2-cache {

lowercase all labels

> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-unified;
> +				next-level-cache = <&L3_0>;

empty line (here and afterwards, before new subnodes.

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
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;

I don't think you need CPU_MASK for GICv3 hosts.

> +	};
> +
> +	pmu-v7 {
> +		compatible = "arm,cortex-a7-pmu";
> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +
> +	dsu-pmu {
> +		compatible = "arm,dsu-pmu";
> +		interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
> +		cpus = <&CPU0>, <&CPU1>, <&CPU2>, <&CPU3>;
> +		status = "okay";
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
> +
> +			uart1: serial@1a84000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0 0x01a84000 0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_UART1_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "okay";
> +			};
> +		};
> +
> +		intc: interrupt-controller@f200000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0 0xf200000 0 0x10000>, /* GICD */
> +			      <0 0xf240000 0 0x80000>; /* GICR * 4 regions */
> +			#interrupt-cells = <0x3>;
> +			interrupt-controller;
> +			#redistributor-regions = <1>;
> +			redistributor-stride = <0x0 0x20000>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			mbi-ranges = <672 128>;
> +			msi-controller;

No ITS?

> +		};
> +
> +		sdhc: mmc@7804000 {
> +			compatible = "qcom,ipq5424-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0 0x07804000 0 0x1000>, <0 0x07805000 0 0x1000>;

Please sort all nodes following the device addresses.

> +			reg-names = "hc", "cqhci";
> +
> +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> +				 <&gcc GCC_SDCC1_APPS_CLK>,
> +				 <&xo_board>;
> +			clock-names = "iface", "core", "xo";
> +
> +			status = "disabled";
> +		};
> +
> +		timer@f420000 {
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0 0xf420000 0 0x1000>;
> +			ranges = <0 0 0 0x10000000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			frame@f421000 {
> +				reg = <0xf421000 0x1000>,
> +				      <0xf422000 0x1000>;
> +				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +				frame-number = <0>;
> +			};
> +
> +			frame@f423000 {
> +				reg = <0xf423000 0x1000>;
> +				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +				frame-number = <1>;
> +				status = "disabled";
> +			};
> +
> +			frame@f425000 {
> +				reg = <0xf425000 0x1000>,
> +				      <0xf426000 0x1000>;
> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +				frame-number = <2>;
> +				status = "disabled";
> +			};
> +
> +			frame@f427000 {
> +				reg = <0xf427000 0x1000>;
> +				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +				frame-number = <3>;
> +				status = "disabled";
> +			};
> +
> +			frame@f429000 {
> +				reg = <0xf429000 0x1000>;
> +				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +				frame-number = <4>;
> +				status = "disabled";
> +			};
> +
> +			frame@f42b000 {
> +				reg = <0xf42b000 0x1000>;
> +				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +				frame-number = <5>;
> +				status = "disabled";
> +			};
> +
> +			frame@f42d000 {
> +				reg = <0xf42d000 0x1000>;
> +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +				frame-number = <6>;
> +				status = "disabled";
> +			};
> +		};
> +
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

