Return-Path: <linux-gpio+bounces-14392-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4549B9FF661
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 07:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18B733A2983
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 06:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D9D190067;
	Thu,  2 Jan 2025 06:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LwGnUVsJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084CC18BBB0;
	Thu,  2 Jan 2025 06:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735797650; cv=none; b=bjT95iG/CX0OmgAFHyf27XIA817lEYVVT5yvHTa3qeRinEbclKuH3WRE0vzI0C/PsFlTyXcElw6QgodckxUD7QYicveVInBDS+yrrTmkdLeNWUBPOnkfN+kEuv/KRNTjo5UVNqOGwujuKhcWXJ4Y7YKnvYnJPhK92+kXloeKENQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735797650; c=relaxed/simple;
	bh=1j+nQVCRBb0ZXcBR5aiDWLhAShxV+R8AkpGmpbArYFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TkbshyvjwPGU/VC9eu97S7kHu58i5uqy/Lyi54/CcO7QIsJaDBDp5Lv3DpQVkRDPA4ckSQg7ZSz+njZF0UeyFy+fkG00/aLs5o4JLp/ghD+fGyVCEde/lN9vPgx37bYr+uxXDJ+pfI/lNCA8YCsA83NYOviH3COXB1xjALdFfB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LwGnUVsJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 501NUAca024114;
	Thu, 2 Jan 2025 06:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TLlTj0pJpdNKsYrqYblAC2KBuxwDhA53hXofnmX3pis=; b=LwGnUVsJCx0B+rmt
	M+LGma0Jl1hv6oKd17jqgsgesLLdu7WCc/E+phFtYlSkL5kScRligi1Ya4aZID5X
	Fr0gF3ZzAg67aL6pyg9YqBrWP2ZfNd3q/VwF3LzfDhJPwNuqo3FHW68tYE0/7XDi
	qyU/ORH+GHIpSUa+DLPbqnJUlvHWY8SAalthDPI5Ac0Yas2W6sd4PoGRmzykp17r
	hTF2pLjx2FD5kSjkbqikioWUghxVg/AmEnr35OjqnI1yHBDd1cWjUPZZPH+eM+Cx
	mp/v3joJUWgbzt9c/jU18SCYV0vDig6bwdqyDk5yiEDJbw/EoD5SqQXikj+2RaR/
	74yF9Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43w1wyhfgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 06:00:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50260axn006540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Jan 2025 06:00:36 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 1 Jan 2025
 22:00:31 -0800
Message-ID: <dc0b0eef-dcdf-4ed2-a835-d9ca9c5b2c9d@quicinc.com>
Date: Thu, 2 Jan 2025 11:30:02 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add SPI4 support for IPQ5424
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kathiravan Thirumoorthy
	<quic_kathirav@quicinc.com>,
        <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
References: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
 <e673dbdf-9b16-4c64-a3e0-cf5bb31e2b82@quicinc.com>
 <d4875732-ec24-4e35-9a7b-af05c6ee7d4b@oss.qualcomm.com>
 <fbf019aa-e8f9-4169-9543-f85d2a17ce7f@oss.qualcomm.com>
 <52fa8219-0485-4fc6-8f3f-5759649057cf@quicinc.com>
 <34ab59a1-b735-44d1-918a-1b82954a4423@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <34ab59a1-b735-44d1-918a-1b82954a4423@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: surYKO7nS5ValIXdjJ76uyfZQuzd3pLy
X-Proofpoint-ORIG-GUID: surYKO7nS5ValIXdjJ76uyfZQuzd3pLy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 mlxscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501020051



On 12/30/2024 9:06 PM, Konrad Dybcio wrote:
> On 30.12.2024 4:34 PM, Kathiravan Thirumoorthy wrote:
>>
>>
>> On 12/30/2024 7:28 PM, Konrad Dybcio wrote:
>>> On 30.12.2024 2:54 PM, Konrad Dybcio wrote:
>>>> On 30.12.2024 7:51 AM, Kathiravan Thirumoorthy wrote:
>>>>>
>>>>>
>>>>> On 12/27/2024 12:54 PM, Manikanta Mylavarapu wrote:
>>>>>> Add SPI4 node to the IPQ5424 device tree and update the relevant
>>>>>> bindings, GPIO pin mappings accordingly.
>>>>>>
>>>>>> Changes in V3:
>>>>>>      - Rename SPI0 to SPI4 because SPI protocol runs on serial engine 4
>>>>>
>>>>> Do we really need to do this? If so, it will not align with the HW documentation and will lead to the confusion down the line. IMHO, we should stick with the convention followed in the HW documentation.
>>>>
>>>> +1, the clocks are called SPI0/SPI1 internally
>>>
>>> Ok, I looked at a bit more documentation and it looks like
>>> somebody just had fun naming things..
>>>
>>> SPI0 is on SE4 and SPI1 is on something else, with no more
>>> clock provisions for that protocol.. Which is not usually the
>>> case.
>>
>>
>> IPQ5424 has one QUPV3 instance with 6 SEs. SE0-SE4 are Mini core and SE5 is FW core.
>>
>> SE0 and SE1 are for 4-wire UART and 2-wire UART respectively. SE2 and SE3 are for I2C protocol. SE4 is for SPI.
>>
>> Since SE5 is FW based (some RDPs use this SE for I2C). In GCC block, clocks for this instance is named after SPI as SPI1.
> 
> Thanks for the explanation.
> 
> Manikanta, please refer to this in the commit message as well
> 


Thank you, Konrad and Kathiravan, for your valuable insights.
I will incorporate the aforementioned information into the commit message, revert the 'renaming spi0 to spi4',
and include both spi0 and spi1 in the next version.

Thanks & Regards,
Manikanta.

