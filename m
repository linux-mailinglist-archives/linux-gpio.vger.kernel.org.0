Return-Path: <linux-gpio+bounces-214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA117EEBB2
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Nov 2023 05:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46D431C20AC0
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Nov 2023 04:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC379CA6B;
	Fri, 17 Nov 2023 04:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PRVWwCCi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C46B95;
	Thu, 16 Nov 2023 20:27:26 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH3Dag9005816;
	Fri, 17 Nov 2023 04:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=W+aAVxf4RMfKlVetYhxSLP38sayVLob8GRO7wWVwucg=;
 b=PRVWwCCi6dFLwzCXh4B8w1QhFgrVmn7N2t5UmAzhmEK8RKRpJ0tIibQkyq2KomLQRMmk
 rOuLjbgSG+H+mNcSLdnbJI1qj+q6uRw4TW1+vKImA6VTQKmCdTf6kWv85XrQpMF0u9I4
 XjzYpiX+EDQQ9TTr4Mcgv0Frkabv7PAQb6SqlEMgNrSA5nJMRNK1bEfUApjwIGvSlZ1A
 3oQ2Mbpqq5vuXak0qlK5P1CZzB98bWh18KRGAWmW7b7++DPwADxs7zXAbU7UsRztMmGQ
 SmXQkSgqgUBbUCGd8DEYMVlW8O3nO90/uAgSnPsmQenh7A3eB70pDrPQfr2EZdBkZr/Z 7g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udrvs11j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 04:27:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AH4RLB4010591
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 04:27:21 GMT
Received: from [10.79.43.91] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 16 Nov
 2023 20:27:16 -0800
Message-ID: <3067f0bc-7479-380e-0528-b307c34a40cd@quicinc.com>
Date: Fri, 17 Nov 2023 09:57:13 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SC8380XP pinctrl
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <agross@kernel.org>, <conor+dt@kernel.org>, <quic_rjendra@quicinc.com>,
        <abel.vesa@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <quic_tsoni@quicinc.com>,
        <neil.armstrong@linaro.org>
References: <20231025135058.11268-1-quic_sibis@quicinc.com>
 <20231025135058.11268-2-quic_sibis@quicinc.com>
 <c987222a-9ce7-4adb-aae8-0ae016e7c7d3@linaro.org>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <c987222a-9ce7-4adb-aae8-0ae016e7c7d3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eN710RF3rcsgMSRnEYuEEhmJLWcYTQIK
X-Proofpoint-ORIG-GUID: eN710RF3rcsgMSRnEYuEEhmJLWcYTQIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_01,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=427
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170031

Hey Krzysztof,

On 10/27/23 13:55, Krzysztof Kozlowski wrote:
> On 25/10/2023 15:50, Sibi Sankar wrote:
>> From: Rajendra Nayak <quic_rjendra@quicinc.com>
>>
>> Add device tree binding Documentation details for Qualcomm SC8380XP TLMM
>> device
>>
> 
> 
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    tlmm: pinctrl@f100000 {
>> +        compatible = "qcom,sc8380xp-tlmm";
>> +        reg = <0x0f100000 0xf00000>;
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        gpio-ranges = <&tlmm 0 0 239>;
> 
> Is the 239 number a mistake or do you include here UFS reset?

We seem to be including UFS reset on all the previous Qaulcomm SoCs, so
continuing the same here.

-Sibi

> 
> Best regards,
> Krzysztof
> 

