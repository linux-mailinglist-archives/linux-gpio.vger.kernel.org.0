Return-Path: <linux-gpio+bounces-917-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56513802A01
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 02:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E354CB20851
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 01:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD9D17F0;
	Mon,  4 Dec 2023 01:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OHqR8SvF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6263DA8;
	Sun,  3 Dec 2023 17:57:28 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B41kavY025063;
	Mon, 4 Dec 2023 01:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Rah78uAY89ebyyX9kPALfkr8qngfwzR/N+ecXpvp8XI=;
 b=OHqR8SvFuKjxX3qJYsEnhGWqj3eK6f2FVS6zLD5k5hAls8/Kvgs8XN14vBkKVi0XcCXq
 lH58Ga8fqqIc6GQZXT+2arRxX29N8gOdtZtm7szvslrvf44l95i+uG0SThsd/6hBY2Mk
 HiXtNZzOX2njCK7Uc9AXZwhL05CGNyWV+2TFCEeeGSdiSOWBkZQeGo6lHMm49bjz0kxX
 dbcl6caE5bPA1my8VIpeyPZrAj5LmU5WLdgLPQHwiclZoYjjv3XEc0XfZckuk5y33UBo
 5cDXvBxq6ta+Abl5nEzhA9ncK7BdwsLLx7HGvLJ4z1hFm9Ldww9advWV/LMd2O6rfiDj fw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqwvhjhqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 01:57:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B41vOYi029235
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Dec 2023 01:57:24 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 3 Dec
 2023 17:57:19 -0800
Message-ID: <d192f32a-130f-4568-9622-d3465c709853@quicinc.com>
Date: Mon, 4 Dec 2023 09:57:17 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] pinctrl: qcom: Add SM4450 pinctrl driver
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <agross@kernel.org>, <konrad.dybcio@linaro.org>,
        <linus.walleij@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20231130024046.25938-1-quic_tengfan@quicinc.com>
 <20231130024046.25938-3-quic_tengfan@quicinc.com>
 <1d2fbb36-9476-4f32-8bcd-33fd5dcbd6e4@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <1d2fbb36-9476-4f32-8bcd-33fd5dcbd6e4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sn_QD7iqzOCb85zgbV_HuurzrWZ7KyTY
X-Proofpoint-ORIG-GUID: sn_QD7iqzOCb85zgbV_HuurzrWZ7KyTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-03_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 mlxscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=736 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040013



在 11/30/2023 7:57 PM, Krzysztof Kozlowski 写道:
> On 30/11/2023 03:40, Tengfei Fan wrote:
>> Add pinctrl driver for TLMM block found in SM4450 SoC.
>>
>> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   drivers/pinctrl/qcom/Kconfig.msm      |    8 +
>>   drivers/pinctrl/qcom/Makefile         |    1 +
>>   drivers/pinctrl/qcom/pinctrl-sm4450.c | 1013 +++++++++++++++++++++++++
>>   3 files changed, 1022 insertions(+)
>>   create mode 100644 drivers/pinctrl/qcom/pinctrl-sm4450.c
>>
> 
> Hm, was this patch ever built?
> 
> Best regards,
> Krzysztof
> 
This patch has been built before, I will check and compare if there are 
any errors and changes when I submitted this patch series.

-- 
Thx and BRs,
Tengfei Fan

