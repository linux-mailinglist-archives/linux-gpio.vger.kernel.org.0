Return-Path: <linux-gpio+bounces-8427-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8301C93F251
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 12:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 297601F2218A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 10:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B35B1422A8;
	Mon, 29 Jul 2024 10:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UEV9NWfe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4F113E025;
	Mon, 29 Jul 2024 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722247960; cv=none; b=KWABsCgytXuZYBSxsgh+zp77F2a0SYUgg/OVx0Ht8PiEykebMEnwxp/4ZBcs2yKD7i47GCGLeBgdvdQR65sK1vhRlNxsGX2zgg7ejq+qsBBZJi20i63qtPDYw4DZC/x5IzibOzJ70X0EtZF4BCTv2Le0xAH++AqUmXTb5/ybWao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722247960; c=relaxed/simple;
	bh=Yk3GHZf0G7azNlox1tSEhKytG+tFV1wyUcsDZ2ujj7M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=YYMNddI9IneQC8Cf3p3ggTfOhSB36ecbi4j/ccyNEAHSPdEt6F08MVtgI3hJEMw6vx/g7Jt95i007kkIFQcr8NM+/Oym8yBXiAAZZAQkoYBTPF024ku1PoIYQpGiCzuey+N6AKpaSfdtOKcpzCQ1p4Auz1vJkyvUAEDVPLHaj/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UEV9NWfe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SNpZkI005417;
	Mon, 29 Jul 2024 10:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xRGWPcUeqckoc4JS4Kz2BiceZhiuhkRa0fsv675VB70=; b=UEV9NWfe+LcJ9kou
	iNUhn8IPCSCNw/uj8gmRG+KfgWjHJ3pvAyJVCrYynLWFq31BHJHONWCafYDvCMoo
	lvlAvkv79LxJmxtKdyPo7sDbVigCQu3y1LD6iYrxnW9o19e/XgkzN0E9PPnKbqs+
	Kw0PqgXwEXd/lDYfDJ38J+HYgSEiY9KFqdn2+ggJsXPCGGHcFGZ5FbGaWfkq1ckf
	PJxVIpkjWgMlHIs+NWl1ar8DEZM31D0E7su70iWU3TAZyW8uClh3zSOxktVfFybf
	0Qm4mUxqU76t6iZi+wtmaRTbV3DslndMjw8fDoMYfGfvxNWAKUgz6dpNXy4/u7sC
	FsfhUw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mrfxku59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:12:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TACYu6024762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:12:34 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:12:29 -0700
Message-ID: <9e92e7d6-f3d0-453d-bc33-2f13333767f8@quicinc.com>
Date: Mon, 29 Jul 2024 18:12:26 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: add qcs9100-tlmm compatible
From: Tengfei Fan <quic_tengfan@quicinc.com>
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
 <03a18462-335f-43ec-81e3-4d08ba3b6434@quicinc.com>
In-Reply-To: <03a18462-335f-43ec-81e3-4d08ba3b6434@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: whBtrBMsn12Rl6EPc1OGFw0KJE6ylR69
X-Proofpoint-ORIG-GUID: whBtrBMsn12Rl6EPc1OGFw0KJE6ylR69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_08,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 bulkscore=0 phishscore=0 clxscore=1011 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290069



On 7/10/2024 6:26 PM, Tengfei Fan wrote:
> 
> 
> On 7/10/2024 6:14 PM, Krzysztof Kozlowski wrote:
>> On 09/07/2024 15:04, Tengfei Fan wrote:
>>> Add qcs9100-tlmm compatible for QCS9100 SoC.
>>> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
>>> platform use non-SCMI resource. In the future, the SA8775p platform will
>>> move to use SCMI resources and it will have new sa8775p-related device
>>> tree. Consequently, introduce "qcs9100-tlmm" to describe non-SCMI based
>>> pinctrl.
>>>
>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>> ---
>>>   Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml | 
>>> 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml 
>>> b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
>>> index e9abbf2c0689..1bdec08efc4a 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
>>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
>>> @@ -17,7 +17,10 @@ allOf:
>>>   properties:
>>>     compatible:
>>> -    const: qcom,sa8775p-tlmm
>>> +    items:
>>
>> Same comment as in other patchset, so apparently you made all of patches
>> in similar way. No need to add items.
>>
>> Best regards,
>> Krzysztof
>>
> 
> I will use an enum directly in all the patches with similar 
> modifications in the next patch series.

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore all the current patches here.
Thank you for your input.

> 

-- 
Thx and BRs,
Tengfei Fan

