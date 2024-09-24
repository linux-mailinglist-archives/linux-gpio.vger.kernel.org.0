Return-Path: <linux-gpio+bounces-10402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 089059845A2
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 14:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84D4EB23A76
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 12:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B931A7270;
	Tue, 24 Sep 2024 12:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PGQs6pD4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5741A7261;
	Tue, 24 Sep 2024 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727179884; cv=none; b=X1YCCxO2maMgF+e+4mTX66ft5CVVhFZrWNSY945jj9mQTwjvKvGsscRQy0ma8JzeueINRZnLdgi5/jqzZlAcOpiDXNM1lWDtWmGbEFrVVW5xnF7ePaZ4KiRoLPLCzIHSgJMuGjpkNxj8KSd4ktL7fRqT7ylpS4jUaTUARvYMPNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727179884; c=relaxed/simple;
	bh=S+5ZTdN1pPJa9IuFwdIuX2jtdc1wF/KYf3fatFFndeE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=PqKzPOBx3sLCW7WJOS3Sk4dCA/fW3q4TCri6bmba6y1NV0ItQezH9Wh25WZYKLiqkvjDMJqoZ/kPi7AanuyKlZEQ97G02vK6F0JhLdKRWiisSMwSthlyJHovjcu/0myrH3lI+ZTBHje1HOwHDNmepW125CZmMXoIZj9zJ7ifmDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PGQs6pD4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O9fAkp017406;
	Tue, 24 Sep 2024 12:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvNGpzffxQxSM2lHDEfUn4zL+xA1sFHMMkiqkZlU+qo=; b=PGQs6pD4D7IRQ4C8
	KhmnSJkukKR099RoCamN4s1/ox3gmKy9GjpOdKCNLPETVi08G73gOXwcer9ly6Zp
	38EfOuRIUreY9OCh39falA8hlZ+ZMeuXJa6ZcIZgwqJWVEf8HbTj/kaEhce6JBZv
	0MxcSWYSMjS3QWbyYPqmm7fI/WyjOAZ437q+LxMVpLv5SDJh7C4TYUJqMvj8xdaY
	VsFlhJoEhdPs4J97X5X46mCRybYUbQf4Wm+EGPOfRXIm21uafSjoVNxmg8J8E5aM
	xoh5IFTW7wGFBFmyj1xyF3cfE6FQZ8tROYvegA5Iu3CHcJYZP6jg2PJgLW2hn4PC
	zNFFIQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snqygjnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 12:11:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OCB22u011774
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 12:11:02 GMT
Received: from [10.151.37.100] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 05:10:55 -0700
Message-ID: <30fdcb3e-a7ff-4764-bed5-39494c3e3326@quicinc.com>
Date: Tue, 24 Sep 2024 17:40:52 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Subject: Re: [PATCH 1/8] dt-bindings: clock: Add Qualcomm IPQ5424 GCC
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
 <20240913121250.2995351-2-quic_srichara@quicinc.com>
 <4cd3d3f8-7d73-4171-bb35-aba975cdc11a@kernel.org>
 <9f2ccf3d-fa71-4784-b6d2-2b12ed50bdd2@quicinc.com>
 <91392141-af8b-4161-8e76-6f461aaba42a@kernel.org>
Content-Language: en-US
In-Reply-To: <91392141-af8b-4161-8e76-6f461aaba42a@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Njq9SLglo7LSV5tU12g90qC4kLC3UrBc
X-Proofpoint-ORIG-GUID: Njq9SLglo7LSV5tU12g90qC4kLC3UrBc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=949
 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240085



On 9/20/2024 6:14 PM, Krzysztof Kozlowski wrote:
> On 20/09/2024 13:56, Sricharan Ramabadhran wrote:
>>
>>>> +
>>>> +allOf:
>>>> +  - $ref: qcom,gcc.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,ipq5424-gcc
>>>
>>> So everything i sthe same as 5332? Why not adding it there?
>>>
>> infact, ipq5332 has 1 dual lane and 1 single lane pcie, whereas
>> ipq5424 has 2 dual lane and 2 single lane pcie. will update the
>> bindings in v2 accordingly.
> 
> Hm? What is the difference in the bindings? I don't see. Maybe some diff
> would help.
> 

For IPQ5424, clocks items is like this

       - description: Board XO clock source
       - description: Sleep clock source
       - description: PCIE 2lane PHY0 pipe clock source
       - description: PCIE 2lane PHY1 pipe clock source
       - description: PCIE 2lane PHY2 pipe clock source
       - description: PCIE 2lane PHY3 pipe clock source
       - description: USB PCIE wrapper pipe clock source


For IPQ5332, its like this,

       - description: Board XO clock source
       - description: Sleep clock source
       - description: PCIE 2lane PHY pipe clock source
       - description: PCIE 2lane x1 PHY pipe clock source
       - description: USB PCIE wrapper pipe clock source

So for IPQ5424, there are 2 additional PCI phy's.

So would it be fine to add the new IPQ5424 compatible to
IPQ5322 file itself with a 'if:' of compatibles ?

Regards,
  Sricharan



