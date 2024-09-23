Return-Path: <linux-gpio+bounces-10364-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEE497E89C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 11:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C87CA280A12
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 09:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0686194A70;
	Mon, 23 Sep 2024 09:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cChb127u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C481A1946B8;
	Mon, 23 Sep 2024 09:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727083674; cv=none; b=HfLBlk+6Bjdtm16C8KPf5gYk5qvXJKMpYZ34Mj3608d2IJVIKvtoYzPYfbEWrfL26g/rRDF5qqPO4JtSLQDmVlcsyHg0o2I0IWbeugFxw6Ofw7a5LRe9tVmjpEFs8YNZ/+WcqT0m5KfgLznRKXjZYjBC4iTDRAhnMmu9iLJbLlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727083674; c=relaxed/simple;
	bh=S1dpSX+iUq4tmuSiPGkTgc99mQ6bAXtnrX/93YEulHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eWAO0NBDgPeCwi01YXrsUNGHRID1BkYN6SVThgoDEJPBBSPnX2ytMUuO7wDr8i8dEDF6hs544EvMBuwnXMeAk0fB15pcvXCutpebAOP+QvBH+yfsybZs0J+12wdJzatgb3qCLfPobcAE3r9WOpXJUkgeRlN4wSjBqbP40XLGdzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cChb127u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48N0Nd6D002027;
	Mon, 23 Sep 2024 09:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROkQ9cm1z5Lngcfnv8PbbIVIIc+Lqas1Egz8LdtyO+A=; b=cChb127un9fKFM7b
	HbHjfmx5DV73PrcIRnG8qSqfdwLjzogW8dJrGrl+zb7SrBksw/NBn3jnucAcQ0zx
	E4rs0/cApz720nvurbd3SUudRoMDDzziDpd9xALyBYlojeIrDcoJ6+6P7pEn109F
	t4IGuE9gp3EBOuFGokXfBIva61Taqnw92z/PnpLcfWA45UXQCaA3TZ+P0OCg0VwM
	DxAtZVGnUSzlMJldzEfjr/udjnCfFv98RCBTXQJURaoJgBnln1m/5Xnx7Z5o7z9X
	iO66j0eR/SfY1x/15g61q66cKTtVxnk9fC0vlfJeohFZPcs47DTw3BwCIV3+EvW6
	eBCC4g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sph6mfsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 09:27:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48N9RX6e027851
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 09:27:33 GMT
Received: from [10.50.62.117] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Sep
 2024 02:27:27 -0700
Message-ID: <e5960412-e498-49be-a906-c29ee597344b@quicinc.com>
Date: Mon, 23 Sep 2024 14:57:24 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: add IPQ5424 SoC and rdp466 board
 support
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulf.hansson@linaro.org>, <linus.walleij@linaro.org>,
        <catalin.marinas@arm.com>, <p.zabel@pengutronix.de>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <neil.armstrong@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <quic_varada@quicinc.com>
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
 <20240913121250.2995351-8-quic_srichara@quicinc.com>
 <7492618d-4ace-40e2-960b-e10def4f5a17@kernel.org>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <7492618d-4ace-40e2-960b-e10def4f5a17@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yxI19aqE5O-7299szTyucSTZ0oI9cEto
X-Proofpoint-ORIG-GUID: yxI19aqE5O-7299szTyucSTZ0oI9cEto
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409230069



On 9/19/2024 6:00 PM, Krzysztof Kozlowski wrote:
[..]

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
>> +	};
>> +
>> +	cpus: cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		CPU0: cpu@0 {
> 
> Lowercase labels please.
> 
> I am in process of fixing it everywhere.
> 
ok

>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			reg = <0x0>;
>> +			enable-method = "psci";
>> +			next-level-cache = <&L2_0>;
>> +			L2_0: l2-cache {
>> +				compatible = "cache";
>> +				cache-level = <2>;
>> +				cache-unified;
>> +				next-level-cache = <&L3_0>;
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
> 
> pmu-a55
> 
ok

>> +		compatible = "arm,cortex-a55-pmu";
>> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>> +	};
>> +
>> +	pmu-v7 {
> 
> pmu-a7 but... where is the A7 CPU?
> 
oops, by mistake. Renamed to a55 above, but missed deleting here.

>> +		compatible = "arm,cortex-a7-pmu";
>> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> 
> Same interrupts? Huh?
> 
will be removed.

>> +	};
>> +
>> +	dsu-pmu {
> 
> pmu-dsu?
> 
ok

>> +		compatible = "arm,dsu-pmu";
>> +		interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
>> +		cpus = <&CPU0>, <&CPU1>, <&CPU2>, <&CPU3>;
>> +		status = "okay";
> 
> Drop
> 
ok

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
> 
> Please do not upstream your downstream code...
> 
Sure, will remove here and below place

Regards,
  Sricharan

>> +
>> +			uart1: serial@1a84000 {
>> +				compatible = "qcom,geni-debug-uart";
>> +				reg = <0 0x01a84000 0 0x4000>;
>> +				clocks = <&gcc GCC_QUPV3_UART1_CLK>;
>> +				clock-names = "se";
>> +				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
>> +				status = "okay";
> 
> Work on upstream instead.
> 
>> +			};
>> +		};
>> +
> 
> 
> Best regards,
> Krzysztof
> 


