Return-Path: <linux-gpio+bounces-11871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 229E49AD3CC
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 20:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7C272851B1
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 18:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4581D0B82;
	Wed, 23 Oct 2024 18:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ppU+qTX2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184E91E51D;
	Wed, 23 Oct 2024 18:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707493; cv=none; b=MM+ns60OfdIU4R6uApuGNxDJoXuy5LMhTOaVi4rm9E2csKecYBbwkTOaHIxCJiIHl2XXXI3tRZN0bGF9MzTAc+3XLvINHRbWnWDFCZ9y3DOxiHjZY8fQgV/YusLxzwR+DWEYM3dcVHBGtVui+9oVrxGW6+xFOuwlSCK/LFTeivk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707493; c=relaxed/simple;
	bh=M/kSmOeA39YpTXR+8DZw+uVHpJe47fw1SucUPYxDGSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VeJeSw+VYVqiVlzHNPjyIrob6uVEMxnCP2ScRFBNgQx7PqRKfZIvDp5ghlEzUonom2ReuDxwubwhRcxVfP0CFCsRVMx2LKHbDSI3Co+v5f3F8iVsmhhSVFwjSzohTq0ECkbpt6Pjj8J5xxXz/I2Fiq1T1TWt5xK67Xhsy5KsmEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ppU+qTX2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9UAmc015999;
	Wed, 23 Oct 2024 18:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YxWbVvgf9huYpnZJ7nW479CnES31sQmwldJhyMs1CSs=; b=ppU+qTX2XE/eZ8ag
	dGo/lprhzmNQGEyDIcPOt4dOYJbVHtMdDj7ldsczrT+RWQl20IuuJKgl3NKdvAgx
	AeYUEfgXqNwJA/QUCZXz7D4M/K4IJZIUWDoKXVnGGXNKiWyDWsLOgZSF/dLMbTub
	nUQRt6bTkzYHytwKwaIyUVQ9DIa/L7NjJltNB95nnYFdCA8aPzYFo9rSAPET0xmC
	9iBL2jkY+I9bj3xPVjHaJlvUY010bAi7wGxBhsONHpHpz5SyYWQFtBHiGoz7Z+2u
	nvG/hk1gKPrUuVkImlBYvgUrdW1xHqO2rCwtQg2iy+KpWsADgkXif6ibKcSG5wbT
	dgJ75A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3xk5g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 18:18:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NII7Wi019932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 18:18:07 GMT
Received: from [10.71.108.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 11:18:07 -0700
Message-ID: <d21b259a-1f04-4108-a201-254b44f07529@quicinc.com>
Date: Wed, 23 Oct 2024 11:18:06 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add sm8750 pinctrl driver
To: Bjorn Andersson <andersson@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241021230414.2632428-1-quic_molvera@quicinc.com>
 <20241021230414.2632428-3-quic_molvera@quicinc.com>
 <dnri3nqq2una3atjwl437ujzrl2txl2zdyb2ima5qeeudqotxn@5zdxizip6mhb>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <dnri3nqq2una3atjwl437ujzrl2txl2zdyb2ima5qeeudqotxn@5zdxizip6mhb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4UTRpji6gaMT4pBI_pBbKaKyIuLgQ2eU
X-Proofpoint-ORIG-GUID: 4UTRpji6gaMT4pBI_pBbKaKyIuLgQ2eU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230116



On 10/22/2024 8:27 PM, Bjorn Andersson wrote:
> On Mon, Oct 21, 2024 at 04:04:14PM GMT, Melody Olvera wrote:
>> Add initial pinctrl driver to support pin configuration with pinctrl
> I think you should drop the word "initial", and perhaps insert "TLMM" in
> its place.

Ack.

>
>> framework for sm8750 SoC.
>>
> [..]
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
> [..]
>> +static const struct msm_pingroup sm8750_groups[] = {
> [..]
>> +	[215] = UFS_RESET(ufs_reset, 0xE2004, 0xE3000),
> It would be nice if these digits where lower case...

Ack.

>
>> +	[216] = SDC_QDSD_PINGROUP(sdc2_clk, 0xDB000, 14, 6),
>> +	[217] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xDB000, 11, 3),
>> +	[218] = SDC_QDSD_PINGROUP(sdc2_data, 0xDB000, 9, 0),
>> +};
>> +
> [..]
>> +static const int sm8750_reserved_gpios[] = {
>> +	36, 37, 38, 39, 74, -1
> Any particular reason why these are not gpio-reserved-ranges in
> DeviceTree?
>

Not particularly; I wasn't sure whether or not to include in the initial 
dt patch.
Will add.

>
>> +};
>> +


