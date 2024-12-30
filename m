Return-Path: <linux-gpio+bounces-14349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B488D9FE563
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 11:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66DC31614D1
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 10:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719FC1A725C;
	Mon, 30 Dec 2024 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dSdfJdV0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0205B19995D;
	Mon, 30 Dec 2024 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735555690; cv=none; b=Vx2YDBs8oiHcpHrdsvFSjKS/YwOD+gLLq9Fa6PjElktY481uOXEzW1AoS7HoElMF7DeOCcdg1PGArllevn+gzI9rjm8R3tcPiH+unK5vUNfohjySegZoQZ5KwM4FXmkP2/T6MHCcqv9prnQxwmeMWFK0hXcvUS3dhzaBJezBJeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735555690; c=relaxed/simple;
	bh=NobdQdHmCtuB/Sj+n4FPbxrPC8pPbvLMeiXofRRbiPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l43MzEvxdevREyw1zUfGuVQ5kfpglVwDEnWxB+c1AEMjzUmBqHRWmaXpimvoj891mQUfsk9L/hk2dql06RaTUumcxaI0XBExwzs8yhOJ1szcO+AKyegMhvkeuhIhIhRkdlZkFcwbQghHWGMydq6tcz6ov0P620iLz/8Us76+UIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dSdfJdV0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU1X420028167;
	Mon, 30 Dec 2024 10:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XKMA1gLm8gn+bP4UZIa5voLI71re8IgNZreD1JMKVCM=; b=dSdfJdV0fEUHahEO
	zz3Qju1tT1orLUyvy47tafNBObknYCt87R+605zO9Bs3He6WpCwSfUcji1oYM8IA
	1OylSftUQ6g4GtNqkSsUVlwAYRVydWVaKped9gQSRLeF4lScd/bgYziwWGwQbUIJ
	xRYSrqnsi6r7Di5N1e9C8hl3J2F7gpeo+O/olsITcivS14lql09IxMVPHhKKwRGF
	DmDeZvH9FL44TNwhkUzv5t8+HGtVfOHTNjAqDP2kvk8972o1VhfJwOzReG1WKr7g
	qY/dFylYuQQSjRER1DdRUIHaBBAtBncrYyQZ9o08hgJvsQrxl3GkA478d3CaQeGc
	wiQqJg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uhxvrym4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 10:48:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BUAlxW6003724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 10:47:59 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Dec
 2024 02:47:54 -0800
Message-ID: <2ed8afe0-4cf7-4d97-8de8-3c3119db3342@quicinc.com>
Date: Mon, 30 Dec 2024 16:17:50 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: pinctrl: qcom: rename spi0 pins on
 IPQ5424
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
References: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
 <20241227072446.2545148-2-quic_mmanikan@quicinc.com>
 <fbdf716d-0c4c-4f51-9f54-0f38931e26cd@kernel.org>
 <2234c9d5-f434-48cf-ba77-38e9109541eb@quicinc.com>
 <88b6e7ec-0265-4507-9ce1-a72217563e32@kernel.org>
 <ea31d59b-38da-4844-9ea5-32e51b8578fd@quicinc.com>
 <4adc7827-dc5f-41ca-b091-74e86bfdefb1@kernel.org>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <4adc7827-dc5f-41ca-b091-74e86bfdefb1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xOLZ3noFnUo4KdAUx_5_LiPzxggnDoK_
X-Proofpoint-GUID: xOLZ3noFnUo4KdAUx_5_LiPzxggnDoK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300093



On 12/30/2024 1:46 PM, Krzysztof Kozlowski wrote:
> On 30/12/2024 08:50, Manikanta Mylavarapu wrote:
>>
>>
>> On 12/27/2024 3:00 PM, Krzysztof Kozlowski wrote:
>>> On 27/12/2024 10:18, Manikanta Mylavarapu wrote:
>>>>
>>>>
>>>> On 12/27/2024 1:06 PM, Krzysztof Kozlowski wrote:
>>>>> On 27/12/2024 08:24, Manikanta Mylavarapu wrote:
>>>>>> SPI protocol runs on serial engine 4. Hence rename
>>>>>> spi0 pins to spi4 like spi0_cs to spi4_cs etc.
>>>>>>
>>>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>>>> ---
>>>>>
>>>>>
>>>>> <form letter>
>>>>> This is a friendly reminder during the review process.
>>>>>
>>>>> It looks like you received a tag and forgot to add it.
>>>>>
>>>>> If you do not know the process, here is a short explanation:
>>>>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
>>>>> of patchset, under or above your Signed-off-by tag, unless patch changed
>>>>> significantly (e.g. new properties added to the DT bindings). Tag is
>>>>> "received", when provided in a message replied to you on the mailing
>>>>> list. Tools like b4 can help here. However, there's no need to repost
>>>>> patches *only* to add the tags. The upstream maintainer will do that for
>>>>> tags received on the version they apply.
>>>>>
>>>>> Please read:
>>>>> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>>>>>
>>>>> If a tag was not added on purpose, please state why and what changed.
>>>>> </form letter>
>>>>>
>>>>
>>>> Hi Krzysztof,
>>>>
>>>> 	Patches #1 to #4 are newly added in V3 (to rename SPI0 to SPI4). Hence, there are no A-b/R-b
>>>> 	tags associated with these patches. I mentioned this information in the cover letter.
>>>> 	
>>>> 	I assume you are referring to Patch #1 from the V2 series.
>>>> 	Patch #1 [1] and #2 [2] from the V2 series have been merged into linux-next.
>>>> 	[1] https://lore.kernel.org/linux-arm-msm/20241217091308.3253897-2-quic_mmanikan@quicinc.com/
>>>> 	[2] https://lore.kernel.org/linux-arm-msm/20241217091308.3253897-3-quic_mmanikan@quicinc.com/
>>>>
>>>> 	Please let me know if i missed anything.
>>>
>>> v3 mislead me here and three different subsystems in one patchset.
>>>
>>> Anyway, if this is different patch then review follows - there is no ABI
>>> impact explanation and this is an ABI break. What's more, entries are
>>> not sorted anymore and why there is a gap? spi4, spi1 and spi10? Where
>>> is spi3?
>>>
>>> Not sure if this renaming is useful or correct, especially considering
>>> not many arguments in commit msg (e.g. datasheet?).
>>>
>>>
>>
>> Hi Krzysztof,
>>
>> 	The IPQ5424 supports two SPI instances on serial engine 4 and 5.
>> 	Previously, SPI clocks, gpio pins and DTS node names were named
>> 	according to protocol instances like spi0 and spi1.
>>
>> 	As per the feedback received in
>> 	https://lore.kernel.org/linux-arm-msm/ca0ecc07-fd45-4116-9927-8eb3e737505f@oss.qualcomm.com/,
>> 	spi0 has been renamed to spi4 to align with the serial engine instance.
>>
>> 	Kindly advice if it's not acceptable.
> 
> The advice was not about pins, though. My comments stands for commit
> msg. Nothing about ABI, nothing about datasheet...
> 

I will update the commit message in the next version.

Thanks & Regards,
Manikanta.

