Return-Path: <linux-gpio+bounces-11031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FBC994431
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 11:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90BE01F24F4F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 09:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838B718C02A;
	Tue,  8 Oct 2024 09:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hxwAFAAj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26532566;
	Tue,  8 Oct 2024 09:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728379536; cv=none; b=L1SUchZkfdpt0tOc4NU+7dxrYkJstAUGa0YXra8xkbhKngxUc6VR/vxY+WSb2O+gJ3KBP1ls8h+57zj9SuC88fSPVIZwBi1z37lcKRbZlwWPcjA7rPSpayM3beN8q1n+Fkr7W5OfDLTMpH9eN1dH8DPcXw/LvnTZwEvd+eR1faw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728379536; c=relaxed/simple;
	bh=mtDO5KLeQFZJka3qU4g1xnMPPJGUuF7fdFmVF7afYvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D8RULyjpeAbRoG4aiN19Ujowa8+7RBhR8B1xI3GukRK+g4jd1ByBwZSxKsEv8Azc0dtmqfyf88IbHg1BG637iWzYXJhJh04MNbuSto4sGv0SBEgMeQ4/DLLDOn7WScTCKD0UwUXJz18THQd66JaQuh514IBtXFDCBv+EOr7nTWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hxwAFAAj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49851aRr010551;
	Tue, 8 Oct 2024 09:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+jm2UaIPcPi/2+yD1APcHC2pHVqzqD8ZVYpAYPtrKA=; b=hxwAFAAjURIXTP7f
	QvxQUV4ULhc/HN4M0N1jnUHfH14FAtOFfiT+RJacAXzso3hQk0LZcPs8kIhvC4Dx
	O41hLG11JjpZbh9Dhabn9fCXA27Rf1eH+HTUekDR4qCIoGP+cBYvfRFlxyGEsug+
	8YIqi2S1x42o6lx0k/S5uaJWZB63rrHBz4l8IijNRY3fow72uryu8pibyzQ2P73q
	unXRYKC3woCrRU1j1s/5vKXG4lVCYNIRyXUOIMv3pinZJTZiQdjDZ0r3bT9wCy1f
	wtbeSCunEeArDp7wo6ApEcgkUdMjw8CuLRx7/s9YD4n1OXnLlLta96eJNhc3SOq2
	RQTKjQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424x7rrmt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 09:25:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4989P9dC017414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 09:25:09 GMT
Received: from [10.50.47.90] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 02:25:02 -0700
Message-ID: <f95da02e-11b4-4037-a6dc-d73eb481c69a@quicinc.com>
Date: Tue, 8 Oct 2024 14:54:59 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/7] dt-bindings: clock: Add Qualcomm IPQ5424 GCC
 binding
To: Rob Herring <robh@kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulf.hansson@linaro.org>, <linus.walleij@linaro.org>,
        <catalin.marinas@arm.com>, <p.zabel@pengutronix.de>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <neil.armstrong@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_varada@quicinc.com>
References: <20241004102342.2414317-1-quic_srichara@quicinc.com>
 <20241004102342.2414317-3-quic_srichara@quicinc.com>
 <20241005182345.GA482031-robh@kernel.org>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <20241005182345.GA482031-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T44Fz8J2z-M1GA5_5nVayamXjaRQ99da
X-Proofpoint-ORIG-GUID: T44Fz8J2z-M1GA5_5nVayamXjaRQ99da
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080061



On 10/5/2024 11:53 PM, Rob Herring wrote:
> On Fri, Oct 04, 2024 at 03:53:37PM +0530, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> Add binding for the Qualcomm IPQ5424 Global Clock Controller
>>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> ---
>>   [V3] Added only new clocks for IPQ5424 and ordered for both
>>        IPQ5332 and IPQ5424 based on min/max items
>>
>>   .../bindings/clock/qcom,ipq5332-gcc.yaml      |  40 ++-
>>   include/dt-bindings/clock/qcom,ipq5424-gcc.h  | 156 +++++++++
>>   include/dt-bindings/reset/qcom,ipq5424-gcc.h  | 310 ++++++++++++++++++
>>   3 files changed, 499 insertions(+), 7 deletions(-)
>>   create mode 100644 include/dt-bindings/clock/qcom,ipq5424-gcc.h
>>   create mode 100644 include/dt-bindings/reset/qcom,ipq5424-gcc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>> index 9193de681de2..1b6d64385116 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>> @@ -4,30 +4,34 @@
>>   $id: http://devicetree.org/schemas/clock/qcom,ipq5332-gcc.yaml#
>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>   
>> -title: Qualcomm Global Clock & Reset Controller on IPQ5332
>> +title: Qualcomm Global Clock & Reset Controller on IPQ5332 and IPQ5424
>>   
>>   maintainers:
>>     - Bjorn Andersson <andersson@kernel.org>
>>   
>>   description: |
>>     Qualcomm global clock control module provides the clocks, resets and power
>> -  domains on IPQ5332.
>> +  domains on IPQ5332 and IPQ5424.
>>   
>> -  See also:: include/dt-bindings/clock/qcom,gcc-ipq5332.h
>> -
>> -allOf:
>> -  - $ref: qcom,gcc.yaml#
>> +  See also::
>> +    include/dt-bindings/clock/qcom,gcc-ipq5332.h
>> +    include/dt-bindings/clock/qcom,gcc-ipq5424.h
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,ipq5332-gcc
>> +    enum:
>> +      - qcom,ipq5332-gcc
>> +      - qcom,ipq5424-gcc
>>   
>>     clocks:
>> +    minItems: 5
>>       items:
>>         - description: Board XO clock source
>>         - description: Sleep clock source
>>         - description: PCIE 2lane PHY pipe clock source
>>         - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
>> +      - description: PCIE 2-lane PHY2 pipe clock source
>> +      - description: PCIE 2-lane PHY3 pipe clock source
>>         - description: USB PCIE wrapper pipe clock source
> 
> New clocks go on the end of the list. Otherwise, it is an ABI break (or
> the descriptions are wrong in one case).

ok got it. Had a similar comment from Krzysztof for this.
Will fix in V4.

Regards,
  Sricharan



