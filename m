Return-Path: <linux-gpio+bounces-1046-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D589980647A
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 03:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12BC11C20DA2
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 02:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A98E538A;
	Wed,  6 Dec 2023 02:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d3elrOj2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89805D48;
	Tue,  5 Dec 2023 18:01:17 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B60FwUG022006;
	Wed, 6 Dec 2023 02:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QiyAq82n1HMQXZSg5nuqWRBI1Lqs/d7sg0e7q86QPo4=;
 b=d3elrOj2f22OwT0wYxdegsaqsWnAatKoilpoMT0pXGwJXtix1IyT5rfWFTBdus4p+Ct6
 +jplOlq7qw9CuunqQXfbqYCSNHg4q846NnlR/LnceZcRynD/E11gq1K6vKY/8nxiAEcj
 AfSxXmjVOBjKSOBiqq7+Vq0D6EcY8R5aoLebLrDzftOzycjdcJSXWsNXjCpnJYAHOLhk
 PSworA6WK6cApYm28pUe8GANLW5fZkKyORSmR0b/9+YmNQjBKPRAKLbD0lB1RdTuVGWi
 /GIOB2QW2uutztpDyczBeg+n6VqFfCkGPh7ydH5uRQMa+sphwI/eEzEuq8dZr4TuZxi0 BQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utd1n09kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 02:01:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B621Cr7024904
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Dec 2023 02:01:12 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Dec
 2023 18:01:06 -0800
Message-ID: <5e8fc470-7100-446a-b60e-f9fddf2f63ec@quicinc.com>
Date: Wed, 6 Dec 2023 10:01:04 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: pinctrl: qcom: Add SM4450 pinctrl
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <agross@kernel.org>, <konrad.dybcio@linaro.org>,
        <linus.walleij@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20231130024046.25938-1-quic_tengfan@quicinc.com>
 <20231130024046.25938-2-quic_tengfan@quicinc.com>
 <a41227df-9ceb-44d9-8d9a-eddfcf7d5fab@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <a41227df-9ceb-44d9-8d9a-eddfcf7d5fab@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ih7x1m7pOBmb0E7SP2PQRpIeH5E1Qw24
X-Proofpoint-GUID: ih7x1m7pOBmb0E7SP2PQRpIeH5E1Qw24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_01,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=375
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312060015



在 11/30/2023 7:56 PM, Krzysztof Kozlowski 写道:
> On 30/11/2023 03:40, Tengfei Fan wrote:
>> Add device tree binding Documentation details for Qualcomm SM4450
>> TLMM device.
>>
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time, thus I will skip this patch entirely till you follow
> the process allowing the patch to be tested.
> 
> Please kindly resend and include all necessary To/Cc entries.
Sure, I will ensure that next version patch series base on the latest 
code, and use scripts/get_maintainers.pl to get a list of all necessary 
people and lists.
> 
> 
>> ---
>>   .../bindings/pinctrl/qcom,sm4450-tlmm.yaml    | 151 ++++++++++++++++++
>>   1 file changed, 151 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
>>
> 
> ...
> 
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    tlmm: pinctrl@f100000 {
>> +      compatible = "qcom,sm4450-tlmm";
>> +      reg = <0x0f100000 0x300000>;
>> +      gpio-controller;
>> +      #gpio-cells = <2>;
>> +      gpio-ranges = <&tlmm 0 0 137>;
>> +      interrupt-controller;
>> +      #interrupt-cells = <2>;
>> +      interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +      gpio-wo-state {
>> +          pins = "gpio1";
> 
> Messed indentation.
I will update this indent issue in next version patch series.
> 
> 
> 
> Best regards,
> Krzysztof
> 

-- 
Thx and BRs,
Tengfei Fan

