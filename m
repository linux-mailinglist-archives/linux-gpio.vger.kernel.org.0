Return-Path: <linux-gpio+bounces-10205-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF6E97AB6E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 08:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C1DC1C21A6D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 06:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43446130E27;
	Tue, 17 Sep 2024 06:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Aw6ntRnI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBE92EAEA;
	Tue, 17 Sep 2024 06:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726554545; cv=none; b=e8Z7IUgI3RtT5j2PqxLbKS0OXzRnw+Jw5TlTUdi69K68IrIvkulPcK7WxzUwem6qZwEHXe7kuvN7eoskkMpaugwuzEHvs2Iu56oBIc42vc4/8/AFAJs3k1A1GKKplO32h8UXPCuTsHQwzf8FL5/dW6vhMfjKY0UWvMEGBWvtzOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726554545; c=relaxed/simple;
	bh=Vq39x4LJULj35XTRgoka1n1JEnTibrea10NF8L2/hro=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pztDqRLIz38UpUA14eh7nzGw/Qy7c3y7KrePjdhWhaGhzEMawYNm94U7dCKcUtpV8b9bge37BSbrUaaExOS0jmtfJVesLMiHzm5TzETeG9p7V2UCtVklOL6h3NP7ley2i3HPQhVPjxczAjvyKpLIS6G8OGM+lDnfI9+qCfAlIFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Aw6ntRnI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H5NB3G021957;
	Tue, 17 Sep 2024 06:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IwMyQuPMpLmePR2w5SgkVe995DdtCCGHFmDTTIYJk5Y=; b=Aw6ntRnIvc4cuQDo
	nhxm8muzycq8KPCn6Pt6+PCWCn8u7EFb68o3GpRi7BOX5PRMDAq7/e06z3hUEaBm
	OQq6M9L+3jGjVdIa14bdGK15MGxh0WgpP6zQAH+6zIHKfU6x1r7JQpFfcZZ3sA0X
	LTTOh/sVgYAHmQok2DAkELGrDUphU8U6ghJvmceUiLIJzv9tza3CdO4D/dV87/db
	T6fs25FVUOlXehgd/bvXKgfFatyPCS6fThUzSmm1dBw5Hc8xUiPfywE3z3ATcJpv
	3/u2cY/AoByjIL7QdF6NE9ukcqWvqo+ZBsFF4RyfAox+JrJqF7BnexGLtMATb04H
	vd5EqQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gcx0u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 06:28:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48H6ScaG029139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 06:28:38 GMT
Received: from [10.151.37.100] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Sep
 2024 23:28:32 -0700
Message-ID: <ed57cffb-147f-4f5b-a9a3-6b9048b4756b@quicinc.com>
Date: Tue, 17 Sep 2024 11:58:29 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: add IPQ5424 SoC and rdp466 board
 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <ulf.hansson@linaro.org>,
        <linus.walleij@linaro.org>, <catalin.marinas@arm.com>,
        <p.zabel@pengutronix.de>, <geert+renesas@glider.be>,
        <neil.armstrong@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_varada@quicinc.com>
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
 <20240913121250.2995351-8-quic_srichara@quicinc.com>
 <fyoh72in62sfmsw3syqswr2p3pcv26zoce2tvlx53mu4lpoakx@ixyvy4oylms3>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <fyoh72in62sfmsw3syqswr2p3pcv26zoce2tvlx53mu4lpoakx@ixyvy4oylms3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zaEf9AB6OSwm27Y0_l6aE9FAiZv7qSpI
X-Proofpoint-GUID: zaEf9AB6OSwm27Y0_l6aE9FAiZv7qSpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409170047



On 9/13/2024 6:22 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 13, 2024 at 05:42:49PM GMT, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> Add initial device tree support for the Qualcomm IPQ5424 SoC and
>> rdp466 board.
>>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile           |   1 +
>>   arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts |  63 +++++
>>   arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 294 ++++++++++++++++++++
>>   3 files changed, 358 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>   create mode 100644 arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 197ab325c0b9..46c4eb758799 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp474.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq5424-rdp466.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> new file mode 100644
>> index 000000000000..c8597a9ba175
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> @@ -0,0 +1,63 @@
>> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
>> +/*
>> + * IPQ5018 MP03.1-C2 board device tree source
>> + *
>> + * Copyright (c) 2023 The Linux Foundation. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "ipq5424.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. IPQ5424 RDP466";
>> +	compatible = "qcom,ipq5424-rdp466", "qcom,ipq5424";
>> +
>> +	aliases {
>> +		serial0 = &uart1;
>> +	};
>> +
>> +	chosen	{
>> +		stdout-path = "serial0:115200n8";
>> +	};
> 
> Drop
> 
ok
>> +};
>> +
>> +&tlmm {
>> +	sdc_default_state: sdc-default-state {
>> +		clk-pins {
>> +			pins = "gpio5";
>> +			function = "sdc_clk";
>> +			drive-strength = <8>;
>> +			bias-disable;
>> +		};
>> +
>> +		cmd-pins {
>> +			pins = "gpio4";
>> +			function = "sdc_cmd";
>> +			drive-strength = <8>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		data-pins {
>> +			pins = "gpio0", "gpio1", "gpio2", "gpio3";
>> +			function = "sdc_data";
>> +			drive-strength = <8>;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +};
>> +
>> +&uart1 {
>> +	pinctrl-0 = <&uart1_pins>;
>> +	pinctrl-names = "default";
>> +	status = "okay";
>> +};
>> +
>> +&sleep_clk {
> 
> sleep comes between tlmm and uart1
> 
ok
>> +	clock-frequency = <32000>;
>> +};
>> +
>> +&xo_board {
>> +	clock-frequency = <24000000>;
>> +};
>> +
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> new file mode 100644
>> index 000000000000..b6c08fac9482
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> @@ -0,0 +1,294 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>> +/*
>> + * IPQ5424 device tree source
>> + *
>> + * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/clock/qcom,ipq5424-gcc.h>
>> +#include <dt-bindings/reset/qcom,ipq5424-gcc.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +/ {
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +	interrupt-parent = <&intc>;
>> +
>> +	clocks {
>> +		xo_board: xo-board-clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		sleep_clk: sleep-clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
> 
> I think Krzysztof lately suggested moving these clocks to board DT
> files.
> 
ok will move
>> +	};
>> +
>> +	cpus: cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		CPU0: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			reg = <0x0>;
>> +			enable-method = "psci";
>> +			next-level-cache = <&L2_0>;
>> +			L2_0: l2-cache {
> 
> lowercase all labels
> 
ok
>> +				compatible = "cache";
>> +				cache-level = <2>;
>> +				cache-unified;
>> +				next-level-cache = <&L3_0>;
> 
> empty line (here and afterwards, before new subnodes.
> 
ok will add
>> +				L3_0: l3-cache {
>> +					compatible = "cache";
>> +					cache-level = <3>;
>> +					cache-unified;
>> +				};
>> +			};
>> +		};
>> +
>> +		CPU1: cpu@100 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			enable-method = "psci";
>> +			reg = <0x100>;
>> +			next-level-cache = <&L2_100>;
>> +			L2_100: l2-cache {
>> +				compatible = "cache";
>> +				cache-level = <2>;
>> +				cache-unified;
>> +				next-level-cache = <&L3_0>;
>> +			};
>> +		};
>> +
>> +		CPU2: cpu@200 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			enable-method = "psci";
>> +			reg = <0x200>;
>> +			next-level-cache = <&L2_200>;
>> +			L2_200: l2-cache {
>> +				compatible = "cache";
>> +				cache-level = <2>;
>> +				cache-unified;
>> +				next-level-cache = <&L3_0>;
>> +			};
>> +		};
>> +
>> +		CPU3: cpu@300 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			enable-method = "psci";
>> +			reg = <0x300>;
>> +			next-level-cache = <&L2_300>;
>> +			L2_300: l2-cache {
>> +				compatible = "cache";
>> +				cache-level = <2>;
>> +				cache-unified;
>> +				next-level-cache = <&L3_0>;
>> +			};
>> +		};
>> +	};
>> +
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		/* We expect the bootloader to fill in the size */
>> +		reg = <0x0 0x80000000 0x0 0x0>;
>> +	};
>> +
>> +	pmu {
>> +		compatible = "arm,cortex-a55-pmu";
>> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> 
> I don't think you need CPU_MASK for GICv3 hosts.
> 
ok
>> +	};
>> +
>> +	pmu-v7 {
>> +		compatible = "arm,cortex-a7-pmu";
>> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>> +	};
>> +
>> +	dsu-pmu {
>> +		compatible = "arm,dsu-pmu";
>> +		interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
>> +		cpus = <&CPU0>, <&CPU1>, <&CPU2>, <&CPU3>;
>> +		status = "okay";
>> +	};
>> +
>> +	psci {
>> +		compatible = "arm,psci-1.0";
>> +		method = "smc";
>> +	};
>> +
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		tz@8a600000 {
>> +			reg = <0x0 0x8a600000 0x0 0x200000>;
>> +			no-map;
>> +		};
>> +	};
>> +
>> +	soc@0 {
>> +		compatible = "simple-bus";
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges = <0 0 0 0 0x10 0>;
>> +
>> +		tlmm: pinctrl@1000000 {
>> +			compatible = "qcom,ipq5424-tlmm";
>> +			reg = <0 0x01000000 0 0x300000>;
>> +			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			gpio-ranges = <&tlmm 0 0 50>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +
>> +			uart1_pins: uart1-state {
>> +				pins = "gpio43", "gpio44";
>> +				function = "uart1";
>> +				drive-strength = <8>;
>> +				bias-pull-up;
>> +			};
>> +		};
>> +
>> +		gcc: clock-controller@1800000 {
>> +			compatible = "qcom,ipq5424-gcc";
>> +			reg = <0 0x01800000 0 0x40000>;
>> +			clocks = <&xo_board>,
>> +				 <&sleep_clk>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#interconnect-cells = <1>;
>> +		};
>> +
>> +		qupv3: geniqup@1ac0000 {
>> +			compatible = "qcom,geni-se-qup";
>> +			reg = <0 0x01ac0000 0 0x2000>;
>> +			clocks = <&gcc GCC_QUPV3_AHB_MST_CLK>,
>> +				 <&gcc GCC_QUPV3_AHB_SLV_CLK>;
>> +			clock-names = "m-ahb", "s-ahb";
>> +			ranges;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +
>> +			status = "okay";
>> +
>> +			uart1: serial@1a84000 {
>> +				compatible = "qcom,geni-debug-uart";
>> +				reg = <0 0x01a84000 0 0x4000>;
>> +				clocks = <&gcc GCC_QUPV3_UART1_CLK>;
>> +				clock-names = "se";
>> +				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
>> +				status = "okay";
>> +			};
>> +		};
>> +
>> +		intc: interrupt-controller@f200000 {
>> +			compatible = "arm,gic-v3";
>> +			reg = <0 0xf200000 0 0x10000>, /* GICD */
>> +			      <0 0xf240000 0 0x80000>; /* GICR * 4 regions */
>> +			#interrupt-cells = <0x3>;
>> +			interrupt-controller;
>> +			#redistributor-regions = <1>;
>> +			redistributor-stride = <0x0 0x20000>;
>> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>> +			mbi-ranges = <672 128>;
>> +			msi-controller;
> 
> No ITS?
  ITS/LPI is not supported.
> 
>> +		};
>> +
>> +		sdhc: mmc@7804000 {
>> +			compatible = "qcom,ipq5424-sdhci", "qcom,sdhci-msm-v5";
>> +			reg = <0 0x07804000 0 0x1000>, <0 0x07805000 0 0x1000>;
> 
> Please sort all nodes following the device addresses.
> 
ok

Regards,
  Sricharan

