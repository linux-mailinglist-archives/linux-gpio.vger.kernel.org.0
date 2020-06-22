Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14F5A203E75
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 19:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730038AbgFVRwN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 13:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730039AbgFVRwH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 13:52:07 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 337C7C061796
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 10:52:07 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id k4so16426507oik.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 10:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gyStxgnpSqifZ8c3HBqYc5J8pnKIVYH35U8lmYMJ7jk=;
        b=fbwA4J9wfXF95PPt3w9A096GauYkF0/XlfGCDFkeJunPtkQaapGJvjjDvEoJwF/qG/
         PMEmMNX+K/R7aRhuz4KC8t0fwc5L/AAM3apR+lxU2tzU1dQtL93VfY8d/hT2FnHhQH7C
         lWziA4ll00ds/HrTULDG+AP+ZDs5DNRaXGKE2buPBdEJdLvM8ZhhlZ/ApJXRyaLvOb4S
         S9UiCsKqx9Q6J2LA5AdZXnjut1PRdJwF5EaMfplpYEv+8hULFphTKn7fFBV0M2aBq7D0
         dz3Nk4S9uZjPTP3oF9KYzYI7fqYPExL9jcWa6nmcARuouud2/KYRQNkFIJGT5RXJ8nVk
         x+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gyStxgnpSqifZ8c3HBqYc5J8pnKIVYH35U8lmYMJ7jk=;
        b=F1OzLE0qlAmo9yIwGrOXRtOWTeJvt7OJnhisBz3rsZFZIU+QDU+DZWb8MoLMQnZP1i
         04a5ZYSo0DGJHp/CnzZR9B0wgeLHnfR5IKfKcX6T+NJXlAn6RLQ8dtExZCbyv5Do+wlc
         3itld49prAiLJQwCwrlcBkEFbweK2CdgdDDOvNFa9HniWJL4KXnRq+EQHuclKfFCL176
         xlaY2apNsSzO75dsNNvyZFX9u0R8vSczvt9B5Ouam3E9mMT41qK2jZt3K1vUokYIoW6g
         R4Sb0VLzykntuNtDp2r2UuT1n4VlfduW9C1vw1L+SyzvyxczTVNTa+wVsGBONua2vjMg
         wu2g==
X-Gm-Message-State: AOAM530/zcqI8oLxP6tYBiWZISppky2N3nHH7+AjZX+0Mxuq0OOf9x4j
        14SX5692OVd9wNXIjckH2o3sZg==
X-Google-Smtp-Source: ABdhPJyfltPBhu3eaC9kM9p80xwYU9I1q64okMJong+bG17ksEZrRUM85sMszQ24jhcf+oIHRkmTew==
X-Received: by 2002:a05:6808:6c9:: with SMTP id m9mr13638525oih.137.1592848326285;
        Mon, 22 Jun 2020 10:52:06 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 1sm3421302otr.30.2020.06.22.10.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:52:05 -0700 (PDT)
Date:   Mon, 22 Jun 2020 10:49:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: sdm630: Add sdm630 dts file
Message-ID: <20200622174920.GS128451@builder.lan>
References: <20200622075749.21925-1-konradybcio@gmail.com>
 <20200622075749.21925-7-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622075749.21925-7-konradybcio@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 22 Jun 00:57 PDT 2020, Konrad Dybcio wrote:

> Add devicetree files for SDM630 SoC and its pin configuration.
> This commit adds basic nodes like cpu, psci and other required
> configuration for booting up from eMMC to the serial console.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm630-pins.dtsi | 268 ++++++
>  arch/arm64/boot/dts/qcom/sdm630.dtsi      | 991 ++++++++++++++++++++++
>  2 files changed, 1259 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm630-pins.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm630.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-pins.dtsi b/arch/arm64/boot/dts/qcom/sdm630-pins.dtsi
> new file mode 100644
> index 000000000000..55d80458f447
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm630-pins.dtsi

Please just add these to the tlmm node directly in sdm630.dtsi. We used
to do it like this but are moving away from it.

> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, Konrad Dybcio
> + */
> +
> + &tlmm {
> +	blsp1_uart1_default: blsp1_uart1_default {

Please don't use '_' in the node name, i.e. this needs to be:
	blsp1_uart1_default: blsp1-uart1-default {

> +		config {

You can flatten this by skipping the "config" node and just put the
properties directly in the blsp1_uart1_default node.

[..]
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> new file mode 100644
> index 000000000000..4bf84c44068c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -0,0 +1,991 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, Konrad Dybcio
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-sdm660.h>
> +#include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/gpio/gpio.h>

Please sort these alphabetically.

> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. SDM630";
> +	compatible = "qcom,sdm630";

These are expected to be overridden by the .dts anyways, so you
can/should omit them from here.

> +
> +	interrupt-parent = <&intc>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen { };
> +
> +	memory {
> +		device_type = "memory";
> +		/* We expect the bootloader to fill in the reg */
> +		reg = <0 0 0 0>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		wlan_msa_guard: wlan_msa_guard@85600000 {

As above, no '_' in node names.

> +			reg = <0x0 0x85600000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		wlan_msa_mem: wlan_msa_mem@85700000 {
> +			reg = <0x0 0x85700000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		qhee_code: qhee_code@85800000 {
> +			reg = <0x0 0x85800000 0x0 0x3700000>;
> +			no-map;
> +		};
> +
> +		smem_region: smem-mem@86000000 {
> +			reg = <0 0x86000000 0 0x200000>;
> +			no-map;
> +		};
> +
> +		tz_mem: memory@86200000 {
> +			reg = <0x0 0x86200000 0x0 0x3300000>;
> +			no-map;
> +		};
> +
> +		modem_fw_mem: modem_fw_region@8ac00000 {
> +			reg = <0x0 0x8ac00000 0x0 0x7e00000>;
> +			no-map;
> +		};
> +
> +		adsp_fw_mem: adsp_fw_region@92a00000 {
> +			reg = <0x0 0x92a00000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		pil_mba_mem: pil_mba_region@94800000 {
> +			reg = <0x0 0x94800000 0x0 0x200000>;
> +			no-map;
> +		};
> +
> +		buffer_mem: buffer_region@94a00000 {
> +			reg = <0x0 0x94a00000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		venus_fw_mem: venus_fw_region@9f800000 {
> +			reg = <0x0 0x9f800000 0x0 0x800000>;
> +			no-map;
> +		};
> +
> +		secure_region2: secure_region2@f7c00000 {
> +			reg = <0x0 0xf7c00000 0x0 0x5c00000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: adsp_region@f6000000 {
> +			reg = <0x0 0xf6000000 0x0 0x800000>;
> +			no-map;
> +		};
> +
> +		qseecom_ta_mem: qseecom_ta_region@fec00000 {
> +			reg = <0x0 0xfec00000 0x0 0x1000000>;
> +			no-map;
> +		};
> +
> +		qseecom_mem: qseecom_region@f6800000 {
> +			reg = <0x0 0xf6800000 0x0 0x1400000>;
> +			no-map;
> +		};
> +
> +		secure_display_memory: secure_region@f5c00000 {
> +			reg = <0x0 0xf5c00000 0x0 0x5c00000>;
> +			no-map;
> +		};
> +
> +		cont_splash_mem: cont_splash_region@9d400000 {
> +			reg = <0x0 0x9d400000 0x0 0x23ff000>;
> +			no-map;
> +		};
> +	};
> +
> +	clocks {
> +		xo_board: xo_board {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <19200000>;
> +			clock-output-names = "xo_board";
> +		};
> +
> +		sleep_clk: sleep_clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32764>;
> +			clock-output-names = "sleep_clk";
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		CPU0: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x100>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&PERF_CPU_SLEEP_0
> +						&PERF_CPU_SLEEP_1
> +						&PERF_CLUSTER_SLEEP_0
> +						&PERF_CLUSTER_SLEEP_1
> +						&PERF_CLUSTER_SLEEP_2>;
> +			capacity-dmips-mhz = <1126>;
> +			#cooling-cells = <2>;
> +			next-level-cache = <&L2_1>;
> +			L2_1: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +			};
> +		};
> +
> +		CPU1: cpu@101 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x101>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&PERF_CPU_SLEEP_0
> +						&PERF_CPU_SLEEP_1
> +						&PERF_CLUSTER_SLEEP_0
> +						&PERF_CLUSTER_SLEEP_1
> +						&PERF_CLUSTER_SLEEP_2>;
> +			capacity-dmips-mhz = <1126>;
> +			#cooling-cells = <2>;
> +			next-level-cache = <&L2_1>;
> +		};
> +
> +		CPU2: cpu@102 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x102>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&PERF_CPU_SLEEP_0
> +						&PERF_CPU_SLEEP_1
> +						&PERF_CLUSTER_SLEEP_0
> +						&PERF_CLUSTER_SLEEP_1
> +						&PERF_CLUSTER_SLEEP_2>;
> +			capacity-dmips-mhz = <1126>;
> +			#cooling-cells = <2>;
> +			next-level-cache = <&L2_1>;
> +		};
> +
> +		CPU3: cpu@103 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x103>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&PERF_CPU_SLEEP_0
> +						&PERF_CPU_SLEEP_1
> +						&PERF_CLUSTER_SLEEP_0
> +						&PERF_CLUSTER_SLEEP_1
> +						&PERF_CLUSTER_SLEEP_2>;
> +			capacity-dmips-mhz = <1126>;
> +			#cooling-cells = <2>;
> +			next-level-cache = <&L2_1>;
> +		};
> +
> +		CPU4: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&PWR_CPU_SLEEP_0
> +						&PWR_CPU_SLEEP_1
> +						&PWR_CLUSTER_SLEEP_0
> +						&PWR_CLUSTER_SLEEP_1
> +						&PWR_CLUSTER_SLEEP_2>;
> +			capacity-dmips-mhz = <1024>;
> +			#cooling-cells = <2>;
> +			next-level-cache = <&L2_0>;
> +			L2_0: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +			};
> +		};
> +
> +		CPU5: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x1>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&PWR_CPU_SLEEP_0
> +						&PWR_CPU_SLEEP_1
> +						&PWR_CLUSTER_SLEEP_0
> +						&PWR_CLUSTER_SLEEP_1
> +						&PWR_CLUSTER_SLEEP_2>;
> +			capacity-dmips-mhz = <1024>;
> +			#cooling-cells = <2>;
> +			next-level-cache = <&L2_0>;
> +		};
> +
> +		CPU6: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x2>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&PWR_CPU_SLEEP_0
> +						&PWR_CPU_SLEEP_1
> +						&PWR_CLUSTER_SLEEP_0
> +						&PWR_CLUSTER_SLEEP_1
> +						&PWR_CLUSTER_SLEEP_2>;
> +			capacity-dmips-mhz = <1024>;
> +			#cooling-cells = <2>;
> +			next-level-cache = <&L2_0>;
> +		};
> +
> +		CPU7: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0 0x3>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&PWR_CPU_SLEEP_0
> +						&PWR_CPU_SLEEP_1
> +						&PWR_CLUSTER_SLEEP_0
> +						&PWR_CLUSTER_SLEEP_1
> +						&PWR_CLUSTER_SLEEP_2>;
> +			capacity-dmips-mhz = <1024>;
> +			#cooling-cells = <2>;
> +			next-level-cache = <&L2_0>;
> +		};
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&CPU4>;
> +				};
> +
> +				core1 {
> +					cpu = <&CPU5>;
> +				};
> +
> +				core2 {
> +					cpu = <&CPU6>;
> +				};
> +
> +				core3 {
> +					cpu = <&CPU7>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&CPU0>;
> +				};
> +
> +				core1 {
> +					cpu = <&CPU1>;
> +				};
> +
> +				core2 {
> +					cpu = <&CPU2>;
> +				};
> +
> +				core3 {
> +					cpu = <&CPU3>;
> +				};
> +			};
> +		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			PWR_CPU_SLEEP_0: cpu-sleep-0-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "pwr-retention";
> +				arm,psci-suspend-param = <0x40000002>;
> +				entry-latency-us = <338>;
> +				exit-latency-us = <423>;
> +				min-residency-us = <200>;
> +			};
> +
> +			PWR_CPU_SLEEP_1: cpu-sleep-0-1 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "pwr-power-collapse";
> +				arm,psci-suspend-param = <0x40000003>;
> +				entry-latency-us = <515>;
> +				exit-latency-us = <1821>;
> +				min-residency-us = <1000>;
> +				local-timer-stop;
> +			};
> +
> +			PERF_CPU_SLEEP_0: cpu-sleep-1-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "perf-retention";
> +				arm,psci-suspend-param = <0x40000002>;
> +				entry-latency-us = <154>;
> +				exit-latency-us = <87>;
> +				min-residency-us = <200>;
> +			};
> +
> +			PERF_CPU_SLEEP_1: cpu-sleep-1-1 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "perf-power-collapse";
> +				arm,psci-suspend-param = <0x40000003>;
> +				entry-latency-us = <262>;
> +				exit-latency-us = <301>;
> +				min-residency-us = <1000>;
> +				local-timer-stop;
> +			};
> +
> +			PWR_CLUSTER_SLEEP_0: cluster-sleep-0-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "pwr-cluster-dynamic-retention";
> +				arm,psci-suspend-param = <0x400000F2>;
> +				entry-latency-us = <284>;
> +				exit-latency-us = <384>;
> +				min-residency-us = <9987>;
> +				local-timer-stop;
> +			};
> +
> +			PWR_CLUSTER_SLEEP_1: cluster-sleep-0-1 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "pwr-cluster-retention";
> +				arm,psci-suspend-param = <0x400000F3>;
> +				entry-latency-us = <338>;
> +				exit-latency-us = <423>;
> +				min-residency-us = <9987>;
> +				local-timer-stop;
> +			};
> +
> +			PWR_CLUSTER_SLEEP_2: cluster-sleep-0-2 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "pwr-cluster-retention";
> +				arm,psci-suspend-param = <0x400000F4>;
> +				entry-latency-us = <515>;
> +				exit-latency-us = <1821>;
> +				min-residency-us = <9987>;
> +				local-timer-stop;
> +			};
> +
> +			PERF_CLUSTER_SLEEP_0: cluster-sleep-1-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "perf-cluster-dynamic-retention";
> +				arm,psci-suspend-param = <0x400000F2>;
> +				entry-latency-us = <272>;
> +				exit-latency-us = <329>;
> +				min-residency-us = <9987>;
> +				local-timer-stop;
> +			};
> +
> +			PERF_CLUSTER_SLEEP_1: cluster-sleep-1-1 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "perf-cluster-retention";
> +				arm,psci-suspend-param = <0x400000F3>;
> +				entry-latency-us = <332>;
> +				exit-latency-us = <368>;
> +				min-residency-us = <9987>;
> +				local-timer-stop;
> +			};
> +
> +			PERF_CLUSTER_SLEEP_2: cluster-sleep-1-2 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "perf-cluster-retention";
> +				arm,psci-suspend-param = <0x400000F4>;
> +				entry-latency-us = <545>;
> +				exit-latency-us = <1609>;
> +				min-residency-us = <9987>;
> +				local-timer-stop;
> +			};
> +		};
> +	};
> +
> +	firmware {
> +		scm {
> +			compatible = "qcom,scm-msm8998", "qcom,scm";
> +		};
> +	};
> +
> +	tcsr_mutex: hwlock {
> +		compatible = "qcom,tcsr-mutex";
> +		syscon = <&tcsr_mutex_block 0 0x1000>;
> +		#hwlock-cells = <1>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	rpm-glink {
> +		compatible = "qcom,glink-rpm";
> +
> +		interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +		qcom,rpm-msg-ram = <&rpm_msg_ram>;
> +		mboxes = <&apcs_glb 0>;
> +
> +		rpm_requests: rpm-requests {
> +			compatible = "qcom,rpm-sdm660";
> +			qcom,glink-channels = "rpm_requests";
> +
> +			rpmcc: clock-controller {
> +				compatible = "qcom,rpmcc-sdm660", "qcom,rpmcc";
> +				#clock-cells = <1>;
> +			};
> +		};
> +	};
> +
> +	smem: smem {
> +		compatible = "qcom,smem";
> +		memory-region = <&smem_region>;
> +		hwlocks = <&tcsr_mutex 3>;
> +	};
> +
> +	tcsr_mutex_block: syscon@1f40000 {
> +		compatible = "syscon";
> +		reg = <0 0x1f40000 0 0x20000>;
> +	};
> +
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 1 0xf08>,
> +				 <GIC_PPI 2 0xf08>,
> +				 <GIC_PPI 3 0xf08>,
> +				 <GIC_PPI 0 0xf08>;
> +	};
> +
> +	soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0 0xffffffff>;
> +		compatible = "simple-bus";
> +
> +		gcc: clock-controller@100000 {
> +			compatible = "qcom,gcc-sdm630";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +			reg = <0x100000 0x94000>;

Please pad the address to 8 digits to make it faster to check the sort
order of these.

And then please sort your nodes based on address (and then name for
nodes without reg).

> +
> +			clock-names = "xo", "sleep_clk";
> +			clocks = <&xo_board>,
> +					<&sleep_clk>;
> +		};
> +
> +		rng: rng@793000 {
> +			compatible = "qcom,prng-ee";
> +			reg = <0x793000 0x1000>;
> +			clocks = <&gcc GCC_PRNG_AHB_CLK>;
> +			clock-names = "core";
> +		};
> +
> +		intc: interrupt-controller@17a00000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x17a00000 0x10000>,	   /* GICD */
> +				  <0x17b00000 0x100000>;	  /* GICR * 8 */
> +			#interrupt-cells = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			interrupt-controller;
> +			#redistributor-regions = <1>;
> +			redistributor-stride = <0x0 0x20000>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		restart@10ac000 {
> +			compatible = "qcom,pshold";
> +			reg = <0x10ac000 0x4>;
> +		};
> +
> +		tcsr_mutex_regs: syscon@1f40000 {
> +			compatible = "syscon";
> +			reg = <0x01f40000 0x20000>;
> +		};
> +
> +		rpm_msg_ram: memory@778000 {
> +			compatible = "qcom,rpm-msg-ram";
> +			reg = <0x778000 0x7000>;
> +		};
> +
> +		qfprom: qfprom@780000 {
> +			compatible = "qcom,qfprom";
> +			reg = <0x780000 0x621c>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
> +		apcs_glb: mailbox@17911000 {
> +			compatible = "qcom,msm8998-apcs-hmss-global";

Please make sure there's a proper compatible for this.

> +			reg = <0x17911000 0x1000>;
> +
> +			#mbox-cells = <1>;
> +		};
> +
> +		tlmm: pinctrl@3000000 {
> +			compatible = "qcom,sdm630-pinctrl";
> +			reg = <0x3000000 0xc00000>;
> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <0x2>;
> +			interrupt-controller;
> +			#interrupt-cells = <0x2>;
> +		};
> +
> +		spmi_bus: spmi@800f000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg =	<0x0800f000 0x1000>,
> +				<0x08400000 0x1000000>,
> +				<0x09400000 0x1000000>,
> +				<0x0a400000 0x220000>,
> +				<0x0800a000 0x3000>;
> +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> +			interrupt-names = "periph_irq";
> +			interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,ee = <0>;
> +			qcom,channel = <0>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +			interrupt-controller;
> +			#interrupt-cells = <4>;
> +			cell-index = <0>;
> +		};
> +
> +		timer@17920000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0x17920000 0x1000>;
> +			clock-frequency = <19200000>;
> +
> +			frame@17921000 {
> +				frame-number = <0>;
> +				interrupts = <0 8 0x4>,
> +						<0 7 0x4>;
> +				reg = <0x17921000 0x1000>,
> +					<0x17922000 0x1000>;
> +			};
> +
> +			frame@17923000 {
> +				frame-number = <1>;
> +				interrupts = <0 9 0x4>;
> +				reg = <0x17923000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17924000 {
> +				frame-number = <2>;
> +				interrupts = <0 10 0x4>;
> +				reg = <0x17924000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17925000 {
> +				frame-number = <3>;
> +				interrupts = <0 11 0x4>;
> +				reg = <0x17925000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17926000 {
> +				frame-number = <4>;
> +				interrupts = <0 12 0x4>;
> +				reg = <0x17926000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17927000 {
> +				frame-number = <5>;
> +				interrupts = <0 13 0x4>;
> +				reg = <0x17927000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@17928000 {
> +				frame-number = <6>;
> +				interrupts = <0 14 0x4>;
> +				reg = <0x17928000 0x1000>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		sdhc_1: sdhci@c0c4000 {
> +			compatible = "qcom,sdm630-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0xc0c4000 0x1000>,
> +				<0xc0c5000 0x1000>;
> +			reg-names = "hc", "cqhci";
> +
> +			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
> +					<&gcc GCC_SDCC1_AHB_CLK>,
> +					<&xo_board>;
> +			clock-names = "core", "iface", "xo";
> +
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on &sdc1_rclk_on>;
> +			pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off &sdc1_rclk_off>;
> +
> +			bus-width = <8>;
> +			non-removable;
> +
> +			mmc-ddr-1_8v;
> +			mmc-hs200-1_8v;
> +			mmc-hs400-1_8v;

These are board properties, consider pushing them out to the individual
.dts files.

> +
> +			status = "disabled";
> +		};
> +

Regards,
Bjorn
