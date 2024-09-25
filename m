Return-Path: <linux-gpio+bounces-10417-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF7A9852F2
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 08:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A71EC2822F1
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 06:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92ACA155385;
	Wed, 25 Sep 2024 06:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dEGxYpLD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AC7146D6D;
	Wed, 25 Sep 2024 06:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727245837; cv=none; b=RgvZvMwKnKMAvzmx9zQfj1xgr0JGilh83Z8kNrEYKX766aH0DKwHKKA1JGeOhS6VR8trlZPe00oxZRqmtNIZJBa31fU2jdZOJcLsIqurL8iZS5/lMnDFgooOLiD1GGKGDJRgb3Y0V4dWEJcLwa5R5JPL0jyqSNXz8IpZvDlUrDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727245837; c=relaxed/simple;
	bh=wjphIDvrAwAtBoSsWPWOJBcUlHt8tGB/oz86BF4TP8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VQ9k+tsh9SLcM3+ZZq1IFPh/o+kqLi6AbSR+5Nr/8ACkf8y8RgXF8L5V6j0XX8Mz6bk8bI+YkU9xROPwOlLOOTRfrRj0+3UgXqZSd7niqDJCzTbRsk0Bt6W/WDyDtujulPKAlOjTSbrpk9LMiE4mFOD1Qqw2l6n55OgPvPq2oy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dEGxYpLD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHbalX004309;
	Wed, 25 Sep 2024 06:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wNTZXVclLHJXjkD3qw9H+DrfG6SxHUeL4C6Wqx7CWY=; b=dEGxYpLDMJpdVBy9
	sP9peXd1CHcX6Du6gcds0HBisSe+NSW7gDFBV191l5f/7ZQvT1qkcvAY9PNQubbZ
	+LXt6oxtV1MnEBYpDWPsQ0pGtbb/aIzifxcllrNnLzA+8dBIz16PDDnQ97+kXZyj
	pi+7w8IB87D8hq/Oa9++p5cZTaGXE6lnb1qn9kERjfF5QTSK5qyIHQfKYfser8k2
	xlPCcui0vnpy6XybAA51gAfE4EBGuQY5A9nzp0kSCNVzjGoC3yKarcliH/Cj25a8
	ku/TC2BKlWg+TVN7t2dthD5xJpvRBQ7mU+yAkKdy+AC5JIy7Z4fPd8mJcktFkZ+8
	TK2GUA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snfh398c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 06:30:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P6UGNW017043
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 06:30:16 GMT
Received: from [10.151.37.100] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 23:30:10 -0700
Message-ID: <4d812be2-5dfc-4e33-bbd1-bf1ae3601991@quicinc.com>
Date: Wed, 25 Sep 2024 12:00:07 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <30fdcb3e-a7ff-4764-bed5-39494c3e3326@quicinc.com>
 <823fe98e-eb80-4b6d-8c35-3c14cbb52dda@kernel.org>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <823fe98e-eb80-4b6d-8c35-3c14cbb52dda@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7QDEpP3anhKXL5bR8r0MXPwe__aOginp
X-Proofpoint-GUID: 7QDEpP3anhKXL5bR8r0MXPwe__aOginp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250044



On 9/25/2024 12:08 AM, Krzysztof Kozlowski wrote:
> On 24/09/2024 14:10, Sricharan Ramabadhran wrote:
>>
>>
>> On 9/20/2024 6:14 PM, Krzysztof Kozlowski wrote:
>>> On 20/09/2024 13:56, Sricharan Ramabadhran wrote:
>>>>
>>>>>> +
>>>>>> +allOf:
>>>>>> +  - $ref: qcom,gcc.yaml#
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: qcom,ipq5424-gcc
>>>>>
>>>>> So everything i sthe same as 5332? Why not adding it there?
>>>>>
>>>> infact, ipq5332 has 1 dual lane and 1 single lane pcie, whereas
>>>> ipq5424 has 2 dual lane and 2 single lane pcie. will update the
>>>> bindings in v2 accordingly.
>>>
>>> Hm? What is the difference in the bindings? I don't see. Maybe some diff
>>> would help.
>>>
>>
>> For IPQ5424, clocks items is like this
>>
>>         - description: Board XO clock source
>>         - description: Sleep clock source
>>         - description: PCIE 2lane PHY0 pipe clock source
>>         - description: PCIE 2lane PHY1 pipe clock source
>>         - description: PCIE 2lane PHY2 pipe clock source
>>         - description: PCIE 2lane PHY3 pipe clock source
>>         - description: USB PCIE wrapper pipe clock source
> 
> But that's not true. Open your patch and look:
> 
> +  clocks:
> +    items:
> +      - description: Board XO clock source
> +      - description: Sleep clock source
> +      - description: PCIE 2lane PHY pipe clock source
> +      - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
> +      - description: USB PCIE wrapper pipe clock source
> 
> Either you sent incomplete binding or we talk about different things.
Sorry for the confusion, the 2 additional PHY bindings needs to be
appended here, as well as to DTS. Will add that.

> Looks like first case, so the binding is just not ready. I am not going
> to review it.

Sorry yeah, i missed the 2 instances in V1. In that case, would it be
fine to go with the approach of adding the compatible to 
ipq5332-gcc.yaml with a 'if:' of compatibles ?


Regards,
  Sricharan


