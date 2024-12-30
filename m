Return-Path: <linux-gpio+bounces-14366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E4A9FE7A0
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 16:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9D1F1882B5A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 15:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000821AA792;
	Mon, 30 Dec 2024 15:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HaopGdYy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1726C382;
	Mon, 30 Dec 2024 15:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735572896; cv=none; b=qHOlVyP/Uj40TlYyO/2Kbt1ZE2MrViOecBX9Yb5D/dcQCipzPW7DDsfmOfVgA3z5s/h1ftfwjoAsxdmdC9ekn+I8UFqM8vEwRijnzV/Wqoo/OngEnSL7NOcTbrw5IL7ygjwWF25my4ZY4OLPkCFyAwaU4u9FVVW9kVOa24lxHHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735572896; c=relaxed/simple;
	bh=MnqpgIJvPf2f18Funx1vRuPFgNAaaXHJfnSXFE6HgxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IsIJCafvpSKCpMYM1zKWacCyilb+P1rasFQqlTaoSFqnFOZeKjwArQEQc4TbVWJPNKmBlHRdJl1D4HuW5X6UaaKBrjPnac5oRLy4kFtvWDqZxRDC48RECRWeZr6XofBezyVhAM+ujzrGt7hKZcA50F2kjfXSjNGusYzfQRXQJSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HaopGdYy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUF1V82031612;
	Mon, 30 Dec 2024 15:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44lPTkP5nhWSDOBePrt/19GdGfNbkl20PYjmjrmDTe8=; b=HaopGdYy/dbepnNJ
	OfbsmVbiZC/WjvmYfO9MQu7KioC4rsl4o+nyJ9K/r8SsJxbrVPMH0/Ub5PW/w15q
	gFqE9XBQh7SLWCJacmA1rlGuKl4r9kCNTl2l1UchBtrRCRVa3HCe5uBujzXU9Yj6
	MZztC/3QW7opgQ8cqcDuX/cFI8Ywxd5tzil0w1cYFJosi7avaOOs3cpIwBsktPYd
	SGcfpH5kpw6e6yIJr7lVLhudkq6Hjtbf8573pagjbOFedmwfJDeYRm3BlMxr7A8P
	V4H1tI96+FEElm/MKh+vs6EyRSPy+vF0myJ0aV60KhQp1MHfGwLM+gIiVCSVFFc3
	pnf+sw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uwt082av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 15:34:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BUFYota003333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 15:34:50 GMT
Received: from [10.216.11.39] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Dec
 2024 07:34:44 -0800
Message-ID: <52fa8219-0485-4fc6-8f3f-5759649057cf@quicinc.com>
Date: Mon, 30 Dec 2024 21:04:39 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add SPI4 support for IPQ5424
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manikanta Mylavarapu
	<quic_mmanikan@quicinc.com>,
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
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <fbf019aa-e8f9-4169-9543-f85d2a17ce7f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DNnucBrkW7-tz9nC8QslQbKX-CEvM4kB
X-Proofpoint-GUID: DNnucBrkW7-tz9nC8QslQbKX-CEvM4kB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 mlxlogscore=901
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300135



On 12/30/2024 7:28 PM, Konrad Dybcio wrote:
> On 30.12.2024 2:54 PM, Konrad Dybcio wrote:
>> On 30.12.2024 7:51 AM, Kathiravan Thirumoorthy wrote:
>>>
>>>
>>> On 12/27/2024 12:54 PM, Manikanta Mylavarapu wrote:
>>>> Add SPI4 node to the IPQ5424 device tree and update the relevant
>>>> bindings, GPIO pin mappings accordingly.
>>>>
>>>> Changes in V3:
>>>>      - Rename SPI0 to SPI4 because SPI protocol runs on serial engine 4
>>>
>>> Do we really need to do this? If so, it will not align with the HW documentation and will lead to the confusion down the line. IMHO, we should stick with the convention followed in the HW documentation.
>>
>> +1, the clocks are called SPI0/SPI1 internally
> 
> Ok, I looked at a bit more documentation and it looks like
> somebody just had fun naming things..
> 
> SPI0 is on SE4 and SPI1 is on something else, with no more
> clock provisions for that protocol.. Which is not usually the
> case.


IPQ5424 has one QUPV3 instance with 6 SEs. SE0-SE4 are Mini core and SE5 
is FW core.

SE0 and SE1 are for 4-wire UART and 2-wire UART respectively. SE2 and 
SE3 are for I2C protocol. SE4 is for SPI.

Since SE5 is FW based (some RDPs use this SE for I2C). In GCC block, 
clocks for this instance is named after SPI as SPI1.


> 
> Let's just go with what you guys use internally, as this is
> mighty spaghetti
> 
> Konrad

