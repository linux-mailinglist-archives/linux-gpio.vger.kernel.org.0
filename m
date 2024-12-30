Return-Path: <linux-gpio+bounces-14345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE569FE370
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 08:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58007188237C
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 07:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD191A00E7;
	Mon, 30 Dec 2024 07:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LqyjVTEn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C659B155345;
	Mon, 30 Dec 2024 07:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735545052; cv=none; b=jXd4OkPnWtP2e+QCNVkm8jpdKGfpg/PmM7lESKjVCeMMKdeuwt3/+Z8kcTbghWyz9hiaklGHQQUB1pTTgUv2+hz0q8VODEyToD89k6ZNVnj3znAyFgIQxbyT990WXEXN6gK1w3Eu4xOvo4LcNpRPA7U9KBpoTBrJrEgsp+mzbdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735545052; c=relaxed/simple;
	bh=gnI9nX+tGwonTRbDAHcvIM2xSVjUaJjLTFrHnTjAqJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Dx5OWcfEtX6bSLAqKmzoe8HMy0Bey/UQgnAkuwJAaqVsREkjpaJkptHD2tkHFQC/8yaHa6O12moPEfaM7qOb2o8kNMNhcKHB02tNaSThbys2YfbcLzyA7bTfmdu4bZbDBjXcto0xIosX4Tc2VhZUP5qZYA2pVMP8sqXtN2zl7S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LqyjVTEn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BTMd21s014531;
	Mon, 30 Dec 2024 07:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FBSe9XsWu5bcsf4UbEBMl0aEkgZHUnZCrNCXB26edL4=; b=LqyjVTEnYgj2SQys
	WL+a3P0/5ou/RP9PcMDY8o8KlyM1IQHeuKQlrpmNpoW09Pw2cp5i5x7mAZph02sN
	knKd7fGbSc7W7tWfIjXENT+TQ4ogCYiSRHNg13+zFx5UDVvm2m7yAXJr1ox32Xqw
	uHm7tWdSNTZpU5nRuJLTds0uWBWU2dvt2AQX/LLreEv7lXHMsk87MUAIhUeHZzm7
	agDkFEAdjkvmt+GYxY9f8pliPBuC9Ek6H95SnSNr1/eJl9Zpi22L89Hyeg6CqQ6t
	aFHUPqz7GrHeGZHadWZEgyKHoNCOUc9iB6XQGcgniUiAhpfcKNtZw4G95CrMAOQl
	wSwXDw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43u9tm95sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 07:50:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BU7ojYh013829
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 07:50:45 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 29 Dec
 2024 23:50:40 -0800
Message-ID: <ea31d59b-38da-4844-9ea5-32e51b8578fd@quicinc.com>
Date: Mon, 30 Dec 2024 13:20:36 +0530
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
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <88b6e7ec-0265-4507-9ce1-a72217563e32@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ccQWW536jdlqfc_Ljm3OfJNHKjwgtAzs
X-Proofpoint-ORIG-GUID: ccQWW536jdlqfc_Ljm3OfJNHKjwgtAzs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412300065



On 12/27/2024 3:00 PM, Krzysztof Kozlowski wrote:
> On 27/12/2024 10:18, Manikanta Mylavarapu wrote:
>>
>>
>> On 12/27/2024 1:06 PM, Krzysztof Kozlowski wrote:
>>> On 27/12/2024 08:24, Manikanta Mylavarapu wrote:
>>>> SPI protocol runs on serial engine 4. Hence rename
>>>> spi0 pins to spi4 like spi0_cs to spi4_cs etc.
>>>>
>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>> ---
>>>
>>>
>>> <form letter>
>>> This is a friendly reminder during the review process.
>>>
>>> It looks like you received a tag and forgot to add it.
>>>
>>> If you do not know the process, here is a short explanation:
>>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
>>> of patchset, under or above your Signed-off-by tag, unless patch changed
>>> significantly (e.g. new properties added to the DT bindings). Tag is
>>> "received", when provided in a message replied to you on the mailing
>>> list. Tools like b4 can help here. However, there's no need to repost
>>> patches *only* to add the tags. The upstream maintainer will do that for
>>> tags received on the version they apply.
>>>
>>> Please read:
>>> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>>>
>>> If a tag was not added on purpose, please state why and what changed.
>>> </form letter>
>>>
>>
>> Hi Krzysztof,
>>
>> 	Patches #1 to #4 are newly added in V3 (to rename SPI0 to SPI4). Hence, there are no A-b/R-b
>> 	tags associated with these patches. I mentioned this information in the cover letter.
>> 	
>> 	I assume you are referring to Patch #1 from the V2 series.
>> 	Patch #1 [1] and #2 [2] from the V2 series have been merged into linux-next.
>> 	[1] https://lore.kernel.org/linux-arm-msm/20241217091308.3253897-2-quic_mmanikan@quicinc.com/
>> 	[2] https://lore.kernel.org/linux-arm-msm/20241217091308.3253897-3-quic_mmanikan@quicinc.com/
>>
>> 	Please let me know if i missed anything.
> 
> v3 mislead me here and three different subsystems in one patchset.
> 
> Anyway, if this is different patch then review follows - there is no ABI
> impact explanation and this is an ABI break. What's more, entries are
> not sorted anymore and why there is a gap? spi4, spi1 and spi10? Where
> is spi3?
> 
> Not sure if this renaming is useful or correct, especially considering
> not many arguments in commit msg (e.g. datasheet?).
> 
> 

Hi Krzysztof,

	The IPQ5424 supports two SPI instances on serial engine 4 and 5.
	Previously, SPI clocks, gpio pins and DTS node names were named
	according to protocol instances like spi0 and spi1.

	As per the feedback received in
	https://lore.kernel.org/linux-arm-msm/ca0ecc07-fd45-4116-9927-8eb3e737505f@oss.qualcomm.com/,
	spi0 has been renamed to spi4 to align with the serial engine instance.

	Kindly advice if it's not acceptable.

Thanks & Regards,
Manikanta.

