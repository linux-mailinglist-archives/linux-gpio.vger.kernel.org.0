Return-Path: <linux-gpio+bounces-11168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBED2999C3A
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 07:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E2C9B22D3B
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 05:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF191F7068;
	Fri, 11 Oct 2024 05:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="giP3xilH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E8F1946C8;
	Fri, 11 Oct 2024 05:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728625624; cv=none; b=slPILBnZ+MDqsrh4AnuQixOUhgnCFmNLFRXGhn6xjaH4D2Y73yz+8ypevmkpTX995MkoG5IpsSlKCP5bNZ3ETXHAbrFsaZKJG+F3v81W1VJkEQyiJbnDPo/mzBwl4XEJFgpepfCZB67CxYba+ZwUgZKXGyPpGU+ey0PNx7MJe3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728625624; c=relaxed/simple;
	bh=sKRsXEyxaeRla+k2w1rKXz1PU3G9sKxCHTHbocZ7Nns=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=azD9d2k4BmcB3R4Jn5OhcB9AkBvwIOcKaAqQQ3nxqDklrgotDs72SxtehsE9KzAIhaVL7NEzHqFbjTY+dg1bwrAX+H5aW9gtIh+Q6nf+u7MeTnKFsBZrEG2ULj8G4aq41/T4q9X2sj1Oe3Cpcg5QB4+6eW8OAh/vcG3E0JRFzAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=giP3xilH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B1HfBX005437;
	Fri, 11 Oct 2024 05:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9fDGbw6pgOmDAjZ0nxSCghmAFvcpRpZ5c10egbYI1U=; b=giP3xilHNe8A/9r1
	aXUrUIhsX0oIohd35KFh7lgTpo0VMZ/QPqE1zKqgI6WazrblKtC/dtM6ZR9F8+ti
	JggNy5/NNdPMqa/AdYngu5eU/HMpkklR0ccgzaxn4rER9JqCT87qiWozO1wO3Rk6
	ezpeSCmzgiPqkfWgxTEnQ5Z5LICxJcBwX9BgNhxBCrdWCXP1dMHFSCHT6zAA2VAZ
	bnhF1W9MIcXvzosnh+FsCcWyUmemCtjNOkv8lVGYch3jI/66BlHpCLrPNX7v+7xV
	7Bq3MposIuNmvXQWrL+5RA1HN9LAplh1iWM25nAM9YbylpS5vaINtiWaz3ohsQSl
	FRFIWg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426t7srfqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 05:46:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B5kjxx010041
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 05:46:45 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 22:46:41 -0700
Message-ID: <abc3516e-2c12-4612-9035-146b280b36df@quicinc.com>
Date: Fri, 11 Oct 2024 13:46:38 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: add the tlmm driver for QCS8300
 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        <quic_tengfan@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
References: <20241009-qcs8300_tlmm-v2-0-9e40dee5e4f1@quicinc.com>
 <20241009-qcs8300_tlmm-v2-2-9e40dee5e4f1@quicinc.com>
 <yh5qzohy42r226a4e7yupimfdl6xccpntuffot7dnhrftagtae@4ruw5vmcknfq>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <yh5qzohy42r226a4e7yupimfdl6xccpntuffot7dnhrftagtae@4ruw5vmcknfq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h73tjxlGhzXyl6k7L_50HFMFUVaBB5rs
X-Proofpoint-ORIG-GUID: h73tjxlGhzXyl6k7L_50HFMFUVaBB5rs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110036



On 10/10/2024 8:56 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 09, 2024 at 03:13:34PM GMT, Jingyi Wang wrote:
>> Add support for QCS8300 TLMM configuration and control via the
>> pinctrl framework.
>>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>> ---
>>  drivers/pinctrl/qcom/Kconfig.msm       |    7 +
>>  drivers/pinctrl/qcom/Makefile          |    1 +
>>  drivers/pinctrl/qcom/pinctrl-qcs8300.c | 1246 ++++++++++++++++++++++++++++++++
>>  3 files changed, 1254 insertions(+)
>>
> 
> [...]
> 
>> +	[125] = PINGROUP(125, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
>> +	[126] = PINGROUP(126, _, _, _, _, _, _, _, _, _, _, egpio),
>> +	[127] = PINGROUP(127, _, _, _, _, _, _, _, _, _, _, egpio),
>> +	[128] = PINGROUP(128, _, _, _, _, _, _, _, _, _, _, egpio),
>> +	[129] = PINGROUP(129, _, _, _, _, _, _, _, _, _, _, egpio),
>> +	[130] = PINGROUP(130, _, _, _, _, _, _, _, _, _, _, egpio),
>> +	[131] = PINGROUP(131, _, _, _, _, _, _, _, _, _, _, egpio),
>> +	[132] = PINGROUP(132, _, _, _, _, _, _, _, _, _, _, egpio),
>> +	[133] = UFS_RESET(ufs_reset, 0x92000),
>> +	[134] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x89000, 15, 0),
>> +	[135] = SDC_QDSD_PINGROUP(sdc1_clk, 0x89000, 13, 6),
>> +	[136] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x89000, 11, 3),
>> +	[137] = SDC_QDSD_PINGROUP(sdc1_data, 0x89000, 9, 0),
>> +};
>> +
> 
> [...]
> 
>> +
>> +static const struct msm_pinctrl_soc_data qcs8300_pinctrl = {
>> +	.pins = qcs8300_pins,
>> +	.npins = ARRAY_SIZE(qcs8300_pins),
>> +	.functions = qcs8300_functions,
>> +	.nfunctions = ARRAY_SIZE(qcs8300_functions),
>> +	.groups = qcs8300_groups,
>> +	.ngroups = ARRAY_SIZE(qcs8300_groups),
>> +	.ngpios = 134,
> 
> I believe this should be 133.
> 
133 should be right, thanks for review, will fix that.
>> +	.wakeirq_map = qcs8300_pdc_map,
>> +	.nwakeirq_map = ARRAY_SIZE(qcs8300_pdc_map),
>> +	.egpio_func = 11,
>> +};
>> +
> 
Thanks,
Jingyi


