Return-Path: <linux-gpio+bounces-10308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BDE97D517
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 13:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 281771F23DD7
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 11:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C75514A4C9;
	Fri, 20 Sep 2024 11:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T3B0ksfo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DCD13AA46;
	Fri, 20 Sep 2024 11:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726833472; cv=none; b=LHip3JoGed0HE6jejo/nLEKiLrSDnuzH4jYILjDeUHeqmFeXW3w6eYLW1YGViDGG5WNwpG8kwoQ34kwhe7H4ekPe3fkkGou463EjBP1Wzsb3EodrFdvppSXGvJnZo5+tFx7kD7JmEyVMXzBpbzBCBDrBrm5UrU973BjxVSrLAxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726833472; c=relaxed/simple;
	bh=Xgoqt4T6Rvhg3D5gsR6AQVCwcxnN7k3CI1faUWzAr+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XtflDY7FjFwmS+7JZ4KrU7qQsR+e+VJIkH9tFfq1JR0lDzJwCXeVgGESmabAoVtvxclEiu7a6KpcOy7/4MHUYJFgMdmCLA75dcl/GjrOXY8ByGIfouNOzvgYvYAuicixduouEcRGV2yNQctY7NVW2xyoVhhHR8FS7Za27iueRhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T3B0ksfo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K83AJM018307;
	Fri, 20 Sep 2024 11:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/aX8b7MYpLeTeOv78QUQCtIuuYtPEXDIGwte/C4laHg=; b=T3B0ksfoehoIsoHO
	CLNnc7J+ii0zqfR6zR6aJtrL8k5aI7ZhpBPRReXQrnsX7t2xs8vZKKGByO/xZ8gN
	af5HdP8vy7/xg7BmDbsgwYWRa4X0sgiAz6BmdbsZLVEiCqo1cwabhJR3vDQBVKEe
	xXf8L+OyZtWRP7HhfLXcQ1eeMgiMirEaFufOBoaIX6+KSjUp+V7FDLXYgXMLuvvI
	1rODb+adtRYk6qU409p+bsGfwqqxJqusRbdK7mr7CcCycIdDAYO80gNj7CPmW1Pz
	IVgiEzdsyZ0sdKoziJs4cIDVyXJIgUPmwEA5UgLjaWC0xQNr2Bno8h/u7/Y+V+RX
	kO/RAA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hhgwrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 11:57:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KBvY4u017539
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 11:57:34 GMT
Received: from [10.50.45.132] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Sep
 2024 04:57:28 -0700
Message-ID: <aa4adf36-c7ad-40f6-b581-8add03a6a68d@quicinc.com>
Date: Fri, 20 Sep 2024 17:27:25 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: pinctrl: qcom: add IPQ5332 pinctrl
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
 <20240913121250.2995351-3-quic_srichara@quicinc.com>
 <5c61af2f-9f7f-4351-a973-7d08612c50c3@kernel.org>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <5c61af2f-9f7f-4351-a973-7d08612c50c3@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z_LGTuJ46fnWmpZgF6thnzjziWvaL_S3
X-Proofpoint-ORIG-GUID: z_LGTuJ46fnWmpZgF6thnzjziWvaL_S3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=784 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409200086

[..]

>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml
>> @@ -0,0 +1,115 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/qcom,ipq5424-tlmm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm IPQ5424 TLMM pin controller
>> +
>> +maintainers:
>> +  - Bjorn Andersson <andersson@kernel.org>
>> +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Sorry, not me. I don't have this hardware.
> 
ok, will remove
>> +
>> +description: |
> 
> Drop |
> 
ok
>> +  Top Level Mode Multiplexer pin controller in Qualcomm IPQ5424 SoC.
>> +
>> +allOf:
>> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,ipq5424-tlmm
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  gpio-reserved-ranges:
>> +    minItems: 1
>> +    maxItems: 26
> 
> 25, I believe is the max in such case
> 
ok
>> +
>> +  gpio-line-names:
>> +    maxItems: 50
>> +
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
Thanks

Regards,
  Sricharan

