Return-Path: <linux-gpio+bounces-11489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC3A9A1899
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 04:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B14921F21C0C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 02:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AB54D8D0;
	Thu, 17 Oct 2024 02:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o0ez1MOt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518EE42056;
	Thu, 17 Oct 2024 02:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729131908; cv=none; b=Vv79tuB9ZkIrEyhQlgcBwqKYJZbcN2JoXtFmzRo+h25KrmwOgwkdYaR9AFM4CizmXoaDWVw8EQDShT0BPydOz+hqwiN6edK7cKbkEEPm/f5e7eg5FndaqPZHLcjPLFDNNP8MRPnXmJcS9pmpt+4myeNaHeZTA+SSEcb0x3TYTbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729131908; c=relaxed/simple;
	bh=5NMPDhf/E8i+g+gcq6+KuI94K+BxmbwJGEsewTDaCX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ca1+sMWS9ah/LVHl23Shk4paq5Vl3kg1XMJd35/Kj0XRNQgGPkvZndHwRKlF37tjE2UbnHZaH0b+q1L6LAOhEmpXl9ycA5SBlwU8uKEGC8Pnzn+ZZkrTL6Bh/SPePNA48wJRtT/Fe/VzWn8zXmUJ89H6qqOyDsiYrHqPnqF00NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o0ez1MOt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GIoW8h011837;
	Thu, 17 Oct 2024 02:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZXaIrOtNXKt+a6vGxy0OY8kvivjCsBaCy5jFUoU27Y=; b=o0ez1MOtSLAYysmB
	TSPiullrJZiNksKT1qDMyuX58DQMWv0z0jq9PDvi507j2Q08NXM0gkcXgvvDY2G8
	0vr0Qa/CKp8t7TpJNMdyMiM+JuKsV/0yKaoIvSqLV6HTv08tFhURhfrcLNbE2pHR
	IGRXBn+0lU50RLOCLVbVz60K8s1U8+9pz62GsULP5/q2XlHphuiBFPyDIRwvbjpp
	SahPU1zbBrAvY2oj5fgfw/AP9Dd5z/XrZW0XthJNIV4DNjzfnIssvK6Gzp8rf+Sd
	7KiOLOqQFSZTN4dHZrKEvcfyZhbpysfniRgGkBdl8dofmKDL5Fcg1M2AhG19Jmt7
	y/OlZQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abm5jeup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 02:25:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H2OxWD031600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 02:24:59 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 19:24:56 -0700
Message-ID: <abbea1df-4aaa-4012-95f9-ea1419a22414@quicinc.com>
Date: Thu, 17 Oct 2024 10:24:54 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: add the tlmm driver for QCS8300
 platforms
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
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
 <c7ahyrbo3bw6vgfwqaubricap52muhxyhsnb5cfhzvo3n67dsr@gp6vehlfwblo>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <c7ahyrbo3bw6vgfwqaubricap52muhxyhsnb5cfhzvo3n67dsr@gp6vehlfwblo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WdVh8HvXjf81gECUHt7qKc0aX9ynZ7nY
X-Proofpoint-GUID: WdVh8HvXjf81gECUHt7qKc0aX9ynZ7nY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1011 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=852 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170016



On 10/16/2024 5:25 PM, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Oct 09, 2024 at 03:13:34PM +0800, Jingyi Wang wrote:
>> +static struct platform_driver qcs8300_pinctrl_driver = {
>> +	.driver = {
>> +		.name = "qcs8300-tlmm",
>> +		.of_match_table = qcs8300_pinctrl_of_match,
>> +	},
>> +	.probe = qcs8300_pinctrl_probe,
>> +	.remove_new = msm_pinctrl_remove,
>> +};
> 
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers. Please just drop "_new".
> 
Will update that, thx!
> Best regards
> Uwe

Thanks,
Jingyi


