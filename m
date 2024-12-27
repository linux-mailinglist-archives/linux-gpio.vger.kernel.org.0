Return-Path: <linux-gpio+bounces-14260-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 162569FD281
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 10:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1A943A05F3
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 09:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440F8155CBF;
	Fri, 27 Dec 2024 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NwRgS3ap"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E56139597;
	Fri, 27 Dec 2024 09:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735291099; cv=none; b=sOHEShoO2Ho37VsUyhuNx5pK19aibsDu+WGkkt/yvKxW+RZ9y3iXnHpZlWZerQ0dVCAplTaBKTTt4Cjyt5d4yOwUlgS/WtN59NRzwoqT8nJJVd5NCbLQhqMa5gbqjrFZuIL/eevioshx9BT2XKtlnx5hyxm4OXjaiullSJMjyLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735291099; c=relaxed/simple;
	bh=oxE3ORJ8AH4rIEZuEVIzU5AGj31OC1HgdJ6BeY3tdS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QD/FTMIS5/E9v2A38ljSxJi+EvczmDRq31z19xujiJlSBuePWDW7n6zlJsLmLn7+XMgMI7k3wDcRTPzteKFpbJ/NHJimJE3rSjmI9EqoWz+WUHyPsjOED4lyRUnshKhSrvIg1J99ERfKcai32DyDKqq5sI2wict64Z6ineSxg4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NwRgS3ap; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR8958X013363;
	Fri, 27 Dec 2024 09:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mu00xLkrUdCBs8XEDuCgB0lbl1MTBEoFjytF1bmxo1E=; b=NwRgS3apM4+XkWaQ
	NGEKS2gT7qIEP/uCN9XZ56aJgOsiacB9clPIxxD9wx5pMofDRFFW5LC/zRHmyaPi
	6TdXHu51giSToWaVqbVt2u35mSRrdFxqIgfQOpOkoSP+/9ADTCfs95bxfueuEyuO
	wCZET3S2IoL8pKTYnpLg8wqdxf/ownFbYww83fO+SwryyGQAesUh1ZVsNYE8Fh/7
	FjM5JWi/3f4a131sHSIVF99MX3n9GuYviAV4BbHPFJZ1nXEpuCcL9FJL5buT9Pks
	oN4Po4p6LL992Yc4l/80EC7jq5uRDoHk5vGoIW8mcAlzaeQz0rL2D6zVa0mmD3c2
	nJ1Kdg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43srffgdmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 09:18:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BR9IBbo015427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 09:18:11 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Dec
 2024 01:18:05 -0800
Message-ID: <2234c9d5-f434-48cf-ba77-38e9109541eb@quicinc.com>
Date: Fri, 27 Dec 2024 14:48:02 +0530
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
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <fbdf716d-0c4c-4f51-9f54-0f38931e26cd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QNh-p59KEcOZJyfLChe5KF5qB_iTzvAS
X-Proofpoint-GUID: QNh-p59KEcOZJyfLChe5KF5qB_iTzvAS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412270077



On 12/27/2024 1:06 PM, Krzysztof Kozlowski wrote:
> On 27/12/2024 08:24, Manikanta Mylavarapu wrote:
>> SPI protocol runs on serial engine 4. Hence rename
>> spi0 pins to spi4 like spi0_cs to spi4_cs etc.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
> 
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
> of patchset, under or above your Signed-off-by tag, unless patch changed
> significantly (e.g. new properties added to the DT bindings). Tag is
> "received", when provided in a message replied to you on the mailing
> list. Tools like b4 can help here. However, there's no need to repost
> patches *only* to add the tags. The upstream maintainer will do that for
> tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 

Hi Krzysztof,

	Patches #1 to #4 are newly added in V3 (to rename SPI0 to SPI4). Hence, there are no A-b/R-b
	tags associated with these patches. I mentioned this information in the cover letter.
	
	I assume you are referring to Patch #1 from the V2 series.
	Patch #1 [1] and #2 [2] from the V2 series have been merged into linux-next.
	[1] https://lore.kernel.org/linux-arm-msm/20241217091308.3253897-2-quic_mmanikan@quicinc.com/
	[2] https://lore.kernel.org/linux-arm-msm/20241217091308.3253897-3-quic_mmanikan@quicinc.com/

	Please let me know if i missed anything.

Thanks & Regards,
Manikanta.

