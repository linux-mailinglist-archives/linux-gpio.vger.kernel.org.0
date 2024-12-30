Return-Path: <linux-gpio+bounces-14342-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A77B9FE30D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 07:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD2833A0F74
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 06:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA8719E992;
	Mon, 30 Dec 2024 06:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="patvKnbP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B770A335BA;
	Mon, 30 Dec 2024 06:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735541523; cv=none; b=Y5jwRxdZWxNdIRG/ObkDJxuS3OCKCKQ7Q0syKueniAj0FaLygaLKTYtx3SnpbuVCiT4Z3OsPzITqaYQN6pSkNKNZaOPeQBIaKRLbhq7vX2yUYgYS3PRotpQmLkvj2UBsYe+q/j47WcR8HTyFYieXelcbU4Sm0E0bv5iQCSBKjtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735541523; c=relaxed/simple;
	bh=vkCraO+Ig7stjn5gvKeunHMQ+Wj73HfpI3V4dSWqzzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qtSRdPgDOJpv/T8mIgjvHLbzFDUYgvzl6CQCZh6yQor1atBQ4ISp22Q8uF+bWNPjhfPyBOuni1kyLADzEZXijMvNPQWAZ626LNkCEwMLuhdfQxdhcsmkEEQdEU1xFGcz60FyA661XuyXqM1Tvdvc/COj+TVBvO6T2kEl7/ZnLPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=patvKnbP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU2kDJB027066;
	Mon, 30 Dec 2024 06:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WWXtJULQGiJJVIBh3B7lfeJ0krwDnFaYhJyLvuXbwcg=; b=patvKnbPaB3XpjUV
	8JQ5uy0L7tyoo28NyCbLksRN2T4MtKak3bg6R6yBXliMlIH9AntUYDSaQmjACCdJ
	VBsqBsRvhy+O1z/tPmFQjprkNQY5f3sixkYHa+ljka4W1SJ2amWffeSlnfYj3Y7r
	OMUfXw/MfMmeG72qWX9Dg/IW+IaY+ZMOieqUwsNJ8+ZXQSGpYmU0sjJEaSqBRHio
	TnS+x7CD01B3DJjFXSioaO+2iZxWxeUosXtcJwFbarJK/ZdbPqWNnaeRk3XMJtqF
	dOUKqGpMWwH9yIlJQAXuKxNL8RABY1/oHBJQMcWOQvsqtycCnweFtXgsXLyNgFUN
	KP9v7g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uk120d61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 06:51:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BU6pubi028470
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 06:51:56 GMT
Received: from [10.216.11.39] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 29 Dec
 2024 22:51:50 -0800
Message-ID: <e673dbdf-9b16-4c64-a3e0-cf5bb31e2b82@quicinc.com>
Date: Mon, 30 Dec 2024 12:21:41 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add SPI4 support for IPQ5424
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, <andersson@kernel.org>,
        <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
References: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0dPMx3QJzgiWtWZZzi7drn84RGXK9dFn
X-Proofpoint-GUID: 0dPMx3QJzgiWtWZZzi7drn84RGXK9dFn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 suspectscore=0 mlxlogscore=865
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300056



On 12/27/2024 12:54 PM, Manikanta Mylavarapu wrote:
> Add SPI4 node to the IPQ5424 device tree and update the relevant
> bindings, GPIO pin mappings accordingly.
> 
> Changes in V3:
> 	- Rename SPI0 to SPI4 because SPI protocol runs on serial engine 4

Do we really need to do this? If so, it will not align with the HW 
documentation and will lead to the confusion down the line. IMHO, we 
should stick with the convention followed in the HW documentation.

Thanks,
Kathiravan T.

