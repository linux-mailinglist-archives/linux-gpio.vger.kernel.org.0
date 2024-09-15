Return-Path: <linux-gpio+bounces-10134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C25D97949D
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 06:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E9F9282EE1
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 04:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6D5171AA;
	Sun, 15 Sep 2024 04:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="amkJhq5b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F74F11CA0;
	Sun, 15 Sep 2024 04:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726374314; cv=none; b=EiNQcQqZGpdTupblH69W00wjaRVVar8yhVJdr9tIsJVa0NaN3xxJfz24sdYkpwxR6UQ7NYFrquDwXtRpYzEFMR2txmZM+0TgVj2nYl1RjHhTj+/3lc5jb40MJHbv1teoWNlzcYJ/UF5HNJYCHBKj8KxNYTw2Y84V30dehj3R96E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726374314; c=relaxed/simple;
	bh=Hs3A/0NgMdrdsVPIXyw3hBiawKKXZLwpEf6kATB+HVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OXiMROAxODCBvTlydI1IP+iqx+mYLyEDJWIEAvoJBtgc66w0zZC+r3TgOWulT7ro1Uen7O9/c1NPSbDYT+9zb8fQi9qfviYV1bFR5lynOx9mZk3HIVB8IpgO9wWR52vUGj65evExJZjePd/up7vWCa5fdFILIhA+jZhn/zEkbtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=amkJhq5b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48F40F18024744;
	Sun, 15 Sep 2024 04:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Di0Oqdi4xGJgoL6vNrrVyWlC/CcTvosN/PQueUb9K8=; b=amkJhq5bbK41F5hj
	wCdJVIXbdBku5mFAUvKq1ZvjUBux2X0pTe1pHfQJnXNcNPArMnK8wk96Outuq4Rm
	9EahMgreag/zyAKNceMWspsWi+k5uI2QjLgChL2z4U/+NpIS1inwXvba67p3zBsh
	b9JIto8jvu0xCgWqY40urgdD/zneQi9fm3Ost00g8gmTabDSyFnzaEkWgCEnJ0El
	tWhXkrH0ZL0y9G39q5f++mD6dB5Zreq1fKN6ArzCUxJRv/b0zKb/pVYnsld/g5lK
	xmXX47ZAsPJ/1jOgcdP6s1kR/Q0VOTyutV9z2gelfqHnNqdVRfVYeYiWbzK1tNAQ
	Ir1OTw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hf9dd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 04:24:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48F4OdNG016839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 04:24:39 GMT
Received: from [10.50.62.96] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 14 Sep
 2024 21:24:28 -0700
Message-ID: <306acd78-cb7d-4fd2-9bdd-540426bac50d@quicinc.com>
Date: Sun, 15 Sep 2024 09:54:29 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] pinctrl: qcom: Introduce IPQ5424 TLMM driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <ulf.hansson@linaro.org>,
        <linus.walleij@linaro.org>, <catalin.marinas@arm.com>,
        <p.zabel@pengutronix.de>, <geert+renesas@glider.be>,
        <neil.armstrong@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_varada@quicinc.com>
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
 <20240913121250.2995351-5-quic_srichara@quicinc.com>
 <rp6hhamsqwtneyfrf6lwrchd4p35blaqzgiq66wfkn66xofbar@7dgexti4qs4u>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <rp6hhamsqwtneyfrf6lwrchd4p35blaqzgiq66wfkn66xofbar@7dgexti4qs4u>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vah4GJY3KHbLBr0dESlP-hYGzFbTr_1K
X-Proofpoint-ORIG-GUID: vah4GJY3KHbLBr0dESlP-hYGzFbTr_1K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=777 mlxscore=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409150030



On 9/13/2024 6:09 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 13, 2024 at 05:42:46PM GMT, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> The IPQ5424 SoC comes with a TLMM block, like all other Qualcomm
>> platforms, so add a driver for it.
>>
>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> The order of trailers is strange. It lists you as an author, but then
> Varadarajan's SoB comes first and yours (authors) comes afterwards. If
> it was a joing effort, please use Co-developed-by tag in addition to SoB.
> 
  ok, will add the co-developed.

>> ---
>>   drivers/pinctrl/qcom/Kconfig.msm       |   9 +
>>   drivers/pinctrl/qcom/Makefile          |   1 +
>>   drivers/pinctrl/qcom/pinctrl-ipq5424.c | 792 +++++++++++++++++++++++++
>>   3 files changed, 802 insertions(+)
>>   create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq5424.c
> 
> The rest LGTM
> 
Thanks

Regards,
  Sricharan

