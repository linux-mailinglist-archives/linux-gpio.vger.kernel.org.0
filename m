Return-Path: <linux-gpio+bounces-8163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF1692CF33
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 12:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D5541C2398A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 10:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78F3190460;
	Wed, 10 Jul 2024 10:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nykAWGN5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C50F190068;
	Wed, 10 Jul 2024 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607199; cv=none; b=J/FZBVnsbY3YOHRVqdunn2BkojHjefS7YZcOVMayD/CxmJ3wtfSk7eIkr8rU9cNKPI+pApZAkBsqxPkfoJQHldx8a5Ybd0ykOmVM4m0RihaCzpTfK6M4E32YcYjO7/jGKz6qXaXU8sT0wePG06R9VrT0OItNeyUZ1mfM9EDE+dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607199; c=relaxed/simple;
	bh=u97rYeUjchKaCKTVKQru5rzX9hbGOoIh61zXNDjCYIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=py1TVXxPYmZML6o9tb6v8ScQQEEynxRTVkjmV0UvWxi7U2KroqG5KFchPuKEFDh0Oh3krmBsFHg9+8OH1Jp0nuzYbjFs7xlh37mYkBc821xSohgTdHWSCS67LHHL3E8mkmvPiAfyovQu6dbs4ysjxOV/d/BQJFKwNtvakVxMgrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nykAWGN5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A7E4LR026771;
	Wed, 10 Jul 2024 10:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5FMNn2jFPQzv9jsNISMUwvcbpmzjCI0Ard70E7jNRoQ=; b=nykAWGN5/Z2QTG+X
	t+j+K/eKe98mistcfBfIYH/pKFTTTyQdmXD+1qQEntLDApOzPK10VrsOhGDbzguv
	Rj1uPvqk3cbY9/c7n+Dm39Db14WzTRZRN0nnPvdwgaECVNQ+He+EJivYAR8YkWOK
	7947Z98KYeAem1dmimLUCnROseC68oneh0kacUs756aUD8RNC3PcZESMFKjuVKB2
	hMFjwMB4ENpV7F0Vao2gBqkCE8BOwQZAveHEfeeuqsHJKOk88Sfb6BLS+qe/xJAb
	mbvLGi3lckIMuzvjHyQJHxdc4NtcDuGz+L0fe8+iCOu6uMb19mADaPzKbFFR+plu
	xUecKw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4091jdka4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 10:26:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46AAQYuQ030367
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 10:26:34 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 03:26:28 -0700
Message-ID: <03a18462-335f-43ec-81e3-4d08ba3b6434@quicinc.com>
Date: Wed, 10 Jul 2024 18:26:25 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: add qcs9100-tlmm compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240709-add_qcs9100_tlmm_compatible-v2-0-d025b58ea196@quicinc.com>
 <20240709-add_qcs9100_tlmm_compatible-v2-1-d025b58ea196@quicinc.com>
 <1b6e63fe-cbd2-4d59-a863-c246267a0e89@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <1b6e63fe-cbd2-4d59-a863-c246267a0e89@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JxMX5qJ4_dfL_lp_0TwtG3ke2OuiCc1k
X-Proofpoint-ORIG-GUID: JxMX5qJ4_dfL_lp_0TwtG3ke2OuiCc1k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_06,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407100071



On 7/10/2024 6:14 PM, Krzysztof Kozlowski wrote:
> On 09/07/2024 15:04, Tengfei Fan wrote:
>> Add qcs9100-tlmm compatible for QCS9100 SoC.
>> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
>> platform use non-SCMI resource. In the future, the SA8775p platform will
>> move to use SCMI resources and it will have new sa8775p-related device
>> tree. Consequently, introduce "qcs9100-tlmm" to describe non-SCMI based
>> pinctrl.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
>> index e9abbf2c0689..1bdec08efc4a 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
>> @@ -17,7 +17,10 @@ allOf:
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,sa8775p-tlmm
>> +    items:
> 
> Same comment as in other patchset, so apparently you made all of patches
> in similar way. No need to add items.
> 
> Best regards,
> Krzysztof
> 

I will use an enum directly in all the patches with similar 
modifications in the next patch series.

-- 
Thx and BRs,
Tengfei Fan

