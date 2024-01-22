Return-Path: <linux-gpio+bounces-2423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E77DF836E05
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 18:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EF7428814D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jan 2024 17:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206C8482DD;
	Mon, 22 Jan 2024 17:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iQYopB1j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BED93D990;
	Mon, 22 Jan 2024 17:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705943116; cv=none; b=a56ewaOFwt1BIlWXxHKt6Nx/xlXuRmVahDMdQmoOKGbNmQpRDhIe9L770gPNfu8w+WIuVTBiEPLUIodpKPXkfzNXcc1+VRY5QT74EtUS8/7GBQDPEFCyfIJsHRlmgGlp5hNq1T+KFURuQQ2aI06u8P6f4fRZOcC5jtRcQUDWj4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705943116; c=relaxed/simple;
	bh=8xWIV59LI2WPpxdJlA1amusaILQRvyy3HD+894TUW6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t3RUDCdZVYQlF4RlHrhDIMTozXVg3IS4ZyLdlUbGp/6A19w29cIrjFzr+mvw8B2OorH+cx1mRZ0TSIdu7+8YdidnA3UVS2GMMk6gDAykcuw5+DSEGryxFdP41QW6DTcnKQ+iWZiEDfvGYaP79MeFPURhy8r61yhn10C3SlNCZHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iQYopB1j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MDx3hA023315;
	Mon, 22 Jan 2024 17:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Ir2TH4bQ8UNy996Ok/fKDZNCHGxSrx9t4G+izCKVTkk=; b=iQ
	YopB1jEpidvbcQGOVDcjSLuxhCIkPasW3PhNt6zTOj3eL2V5nyNLGt71R8b1eBje
	zLQpIexGYHyugLzevF5owscrCXk/oJlMWAc/TANhC8L2x5ji43c2qSEIXbap7Dw8
	9UfbwPGrDxXD0PTF7obJe1G8o5UcrA2Besdqtz/xe36wrLLDfmUJKqOlx81tMavA
	qUVArjyqas4S/5sUwuIOWvl3WTDSmcU0dMOod+qZ+gwdx9c1Msl8dSZ3iduhdqtb
	0M7BXpi4UYcY7Cv6NqzAoSUIChUb1uDJd5bwoiqhWQ+ZbsP66wWSlGHhqqB6xyTh
	9FoEEEhnxSAmF1aas3hA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vsq7w0y1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 17:04:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40MH4tPk020019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 17:04:55 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 22 Jan
 2024 09:04:54 -0800
Message-ID: <8c9b157b-4698-70a3-57b7-c588998eeda7@quicinc.com>
Date: Mon, 22 Jan 2024 10:04:54 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/2] Remove QDF2xxx pinctrl drivers
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Marijn Suijten <marijn.suijten@somainline.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20240122-topic-qdf_cleanup_pinctrl-v1-0-0c619ea25091@linaro.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240122-topic-qdf_cleanup_pinctrl-v1-0-0c619ea25091@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AdxjN5akuBy3XCYN-ut4F8rIWpAcidnV
X-Proofpoint-ORIG-GUID: AdxjN5akuBy3XCYN-ut4F8rIWpAcidnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_07,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0
 mlxlogscore=427 phishscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401220118

On 1/22/2024 4:57 AM, Konrad Dybcio wrote:
> The SoC line was never productized, remove the maintenance burden.
> 
> Compile-tested only.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (2):
>        pinctrl: qcom: Remove QDF2xxx support
>        arm64: defconfig: Remove QDF24XX pinctrl
> 
>   arch/arm64/configs/defconfig           |   1 -
>   drivers/pinctrl/qcom/Kconfig.msm       |   7 --
>   drivers/pinctrl/qcom/Makefile          |   1 -
>   drivers/pinctrl/qcom/pinctrl-qdf2xxx.c | 164 ---------------------------------
>   4 files changed, 173 deletions(-)
> ---
> base-commit: 319fbd8fc6d339e0a1c7b067eed870c518a13a02
> change-id: 20240122-topic-qdf_cleanup_pinctrl-98e17cdb375b
> 
> Best regards,

NACK.

This was productized, there are some out in the wild, and the platform 
is still in (limited) use.

I'd like to see support hang around for a few more years yet.

