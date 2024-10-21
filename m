Return-Path: <linux-gpio+bounces-11701-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 706BA9A5985
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 06:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F6891C20B6F
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 04:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4917A1CEEBB;
	Mon, 21 Oct 2024 04:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VZuJvR8W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BBE64A;
	Mon, 21 Oct 2024 04:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729484874; cv=none; b=OGj/U5qMCXv3FFgKPDVRJ7C0bq+DaPKlZRETfruZ+oGKnUKOmMjTrF+fT2042Yd4TSTy2GIu/+fGKLMO3ncvjLC6uOCKeLuuSNwoirlXFgkHX4E9hpkYaaNbO9utkATmng6lj8s+Y5/Kc2sTw+O5GLe3vE4RwwsGp/oF74ZVAz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729484874; c=relaxed/simple;
	bh=DYrcd0vE13PYKuuSM0ei+tcojD6SfQl6vxfpJcWv7MM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=QfLx2lscbUGmfZnZWpCpkH+V9Y2WRP8XzeFDgx22igpB4McKaw2EVU0IoUIWl/h9QW0PxdJOI61xbook0X2FgIw8TzPxzTfN5ozYCePwg/OnypN4ezaezJvMMJFgLvQNxRlUxZKrdHH9VzazP7uuUlJTMGJZeCTuX04Tsqh7rvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VZuJvR8W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49KNgeFJ010479;
	Mon, 21 Oct 2024 04:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+9YUTqdQfY38VeLdv6M4q/B8BOqDJe/tP1eA67Ej1L4=; b=VZuJvR8WzPlqjQ7W
	L/RRCUGOzd2gEC26yuXgtMWg4aifRx+RULGpL0sgghC4gG+Rm62k5P7UZtsdqHTu
	vDPY3yo3AmJcXlpvTFUSEM1SwU+cTpBl6qX6JlKStUBtMYi91vra8yR8WF1IkTiz
	yctw4SwC3VoPnh1LGOA9eGQ62lYt4NlZ3jdKovd/YKHnnQGzY2ujtbL8n3jetbsM
	jNweWhgeefp3SGC73mhCMWztqt9R7ZPMlx2yb+lVOhQ6mEXiGE99BRSGth/Wg/GR
	l2SiKOrp1lRbiGrZW8UT0iwd4LCtab1U85iDYx1TDFzAHTWCK5Dz3YJFhoSwSWJw
	B9+6cA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6w1k4eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 04:27:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49L4RhxY026392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 04:27:43 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 20 Oct
 2024 21:27:39 -0700
Message-ID: <145d9036-6cd8-4aeb-80d0-b3d86b84f2cf@quicinc.com>
Date: Mon, 21 Oct 2024 12:27:36 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Introduce Pinctrl for QCS8300
From: Jingyi Wang <quic_jingyw@quicinc.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20241018-qcs8300_tlmm-v3-0-8b8d3957cf1a@quicinc.com>
 <f9dace93-f6c7-40c2-a6d2-60ce8043aa72@lunn.ch>
 <5fa2080a-f59e-405e-ba52-69d7293e2739@quicinc.com>
Content-Language: en-US
In-Reply-To: <5fa2080a-f59e-405e-ba52-69d7293e2739@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8j1e8-Xs14l_QuLxRBl9YA-VKLOcQQgK
X-Proofpoint-ORIG-GUID: 8j1e8-Xs14l_QuLxRBl9YA-VKLOcQQgK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=357 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210028



On 10/21/2024 10:32 AM, Jingyi Wang wrote:
> 
> 
> On 10/19/2024 2:08 AM, Andrew Lunn wrote:
>> On Fri, Oct 18, 2024 at 11:19:30AM +0800, Jingyi Wang wrote:
>>> Introduce Top Level Mode Multiplexer dt-binding and driver for Qualcomm
>>> QCS8300 SoC.
>>>
>>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>>
>> I'm curious why you are Cc: netdev for a pin controller patch?  Did
>> ./scripts/get_maintainer.pl say you should?
>>
> The cc list was generated by the b4 tools.

double checked with ./scripts/get_maintainer.pl, also get the list:
netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_))

I think the list should be added for keyword match in the driver.

>>     Andrew
>>
>> ---
>> pw-bot: cr
> 
> Thanks,
> Jingyi
> 
Thanks,
Jingyi


