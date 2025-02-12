Return-Path: <linux-gpio+bounces-15847-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E3FA3268B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 670261882B5E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 13:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7991720E018;
	Wed, 12 Feb 2025 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcDhl7r8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B0C20ADE6
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739365647; cv=none; b=cBVXBRuCo/CN2rrDE7K1GaTJb4dLqk/htQ4SNg8Qozkd6u7ZTwG/MTWpk0EJE+9QD3emDA05I3zK+FHYf1xBOkMBSWxaGB2JHpmpqr9iw+I5LtZBGTb7F5L2QZnWq5vRkPgUOvNEusrg289BVLxSaOk7OOYjr3jR4eH8HWL62rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739365647; c=relaxed/simple;
	bh=UoAO9GjW2doCYGuRGY8Y8bf14wyHQN29mYKG8IS0QyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3Fy6vAIrH0E1PEytr0Ts7VH17PvCr5tlSnQOBrtZEtGrdGvlgPR6oB1+pu+DwgeLDsX3qY/EcsB/2vdBbsmWg/3NXruRldiHgRaCySqB015W0DFDMQQ0XGVT0ZQfTSoHZ4w+wNxu4OAACu0DVCzZ2EE4DMN6Cyz+7rzovhKWAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcDhl7r8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CBMcBt031552
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 13:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gRuPU5MLz6UvJIh9FeNXTscDgCKFwAX6i3T1Y2CbOg8=; b=dcDhl7r8v560eZxp
	Cym9zu8gp6OvQcSAE6DpHGAmiWEnn3ssZR2Tpm7WdYLQ0TqYdr2JPGvB6tDpcNJt
	EmvYx8dtrL40UhKEG0Nka9M6X9YDcByIOHFiF8KAQP9qFEvp3GMEHslE4QzBLfks
	g/2Ps4oxO6mREh3VRiirHF60qu7uohzY1dhBgh5TUE3L9GGquAqtpToIOcGKUpkl
	6Lra6incRkkcMbK1chA0SJ25akNXkGOqWk6hcI81leZrKOY/o3f7JjAO7T0LpQ4Y
	wT4S7MDOqbpba1xk5ssH3JpOAuNUsrITCqg3/VsjrI1XUbTu5GE/YyCUEeguLbJf
	0dvOZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5fwh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 13:07:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-471b9ad3f10so27531cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 05:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739365644; x=1739970444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gRuPU5MLz6UvJIh9FeNXTscDgCKFwAX6i3T1Y2CbOg8=;
        b=R//XAL8U1kuBGKEu0DXUBpTcMDaJmvSfuVY3D1Ri1bOrk/RFKven4czLlZjkptyUXP
         ntsOD8yzQqkqdXO/j3CvZ3OwhlWWmH2he6xArnu+7Fb/0zIQbjmbS4CXlMdkO3xUUN66
         4fqxKHUKVygW2YXZt4WKLGVFDqoT0KwDNkUIOoIBEBkEEYB5mDzjOTLWryNgiBNuHRj+
         3dx2wPPtjL+nravRCBJwf5FYxBDTafQfWb+De6UdA/lCTZ+1Utmkmym3qPWDftyCKBwD
         Kp5B8quH1Nxa4UC0AcVMlEAYcM4abTl/SFMGLLBokhlGpAffirn2XgcXiRVyDWhksi4W
         5SNg==
X-Forwarded-Encrypted: i=1; AJvYcCVNktpH7ArEO2nrr0HaUtDAWXlj+RhM20hd99Uvk8IG0uWkXhz5FOYKV+UKgy/OaMVXMXMIzgF+oRlt@vger.kernel.org
X-Gm-Message-State: AOJu0YxjbsdXV6XvjFCi+bZwD4xkuBLnyJxzEJ2uYOmJoIujhkwdugnA
	y2FObkLkF5MAIra1dikDZFuzbW8U/kcoBcBF/01dBtpCe/sVqPMQjFyC4oH1aEeeHUzfVKr2c44
	t1L5g9nas/6oYcrApmy0e6OKEM53ivW5zfkvZ84NdiEj99xqH8nMqPkAk9Np3
X-Gm-Gg: ASbGnctxiZk37mgSDqFv9ly/UQjS21GifjaE/cAPBtn3AjkIAD+1tIQUO1o8+aFa3Xi
	ZTAd+1+O7S2Ixh3naMitdTc/NbSVsSE1U2avF1EtanwAdKldS1DgCW2wACFOmuu+Ze9V3Zvl8AW
	C/Cn2gmSORs7J3JZCKpry/Uoj5DuKOFzgt9NmPuVkQYeqZ/VnI0pCAoCWhuYZwGYQtXFIRN34Y1
	qIm80+3UsF59XwV3p3XWfm+cus6Oc5qKgpDxnj7tIsvyfhgCh4ZVyCj33pU026YDUlQ2jvEG7oJ
	NShr+80Eya+eCp3rFnpg5PrOEj01Fd3CHC3gbdtMW/rh9D5E2e04lsVkkow=
X-Received: by 2002:ac8:5e12:0:b0:461:6599:b9a with SMTP id d75a77b69052e-471afed742emr16227321cf.11.1739365643681;
        Wed, 12 Feb 2025 05:07:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCA7giG/gMWBnfeZO8qNqAYL1V7WqLfjH9to4onOJOTmpMIsvYAtGlEa5pxRnxYvlkUj5Q3Q==
X-Received: by 2002:ac8:5e12:0:b0:461:6599:b9a with SMTP id d75a77b69052e-471afed742emr16227051cf.11.1739365642987;
        Wed, 12 Feb 2025 05:07:22 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7dca728fcsm350960766b.166.2025.02.12.05.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 05:07:22 -0800 (PST)
Message-ID: <7664b71c-ed47-4765-9ac4-5dbe3ec80d3c@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 14:07:19 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] arm64: dts: qcom: Add initial support for MSM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
        Dang Huynh <danct12@riseup.net>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
 <20250211-msm8937-v1-8-7d27ed67f708@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250211-msm8937-v1-8-7d27ed67f708@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rwICV1VI77QSePkuvL7UiG2xmu63xUiN
X-Proofpoint-GUID: rwICV1VI77QSePkuvL7UiG2xmu63xUiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502120101

On 11.02.2025 11:37 PM, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

So the computer tells me 8917 and 8937 are *very* similar. Have you
tried assessing how making 8937.dtsi an overlay atop 8917.dtsi would
work out?


>  arch/arm64/boot/dts/qcom/msm8937.dtsi | 2145 +++++++++++++++++++++++++++++++++
>  1 file changed, 2145 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..ef633c1694ad98165e58130cbeb186d2f0e2dcaa
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
> @@ -0,0 +1,2145 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023, Dang Huynh <danct12@riseup.net>
> + */
> +
> +#include <dt-bindings/clock/qcom,gcc-msm8917.h>
> +#include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/thermal/thermal.h>
> +
> +/ {
> +	interrupt-parent = <&intc>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	clocks {
> +		xo_board: xo-board {
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
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu4: cpu@0 {

I'm pretty sure a CPU with a MPIDR of 0 should be called CPU0

> +			compatible = "arm,cortex-a53";
> +			reg = <0x0>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			operating-points-v2 = <&cpu_opp_table_c0>;
> +			next-level-cache = <&l2_0>;
> +			#cooling-cells = <2>;
> +			l2_0: l2-cache {

Please add a newline between the last property and the subnode

> +				compatible = "cache";
> +				cache-level = <2>;

cache-size = <0x80000>;

[...]

> +		cpu0: cpu@100 {
> +			compatible = "arm,cortex-a53";
> +			reg = <0x100>;
> +			device_type = "cpu";
> +			next-level-cache = <&l2_1>;
> +			enable-method = "psci";
> +			operating-points-v2 = <&cpu_opp_table_c1>;
> +			#cooling-cells = <2>;
> +			power-domains = <&cpu_pd0>;
> +			power-domain-names = "psci";
> +			l2_1: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;

cache-size = <0x100000>;

I'll do further review if you decide it makes sense to keep this
separate from 8917

Konrad

