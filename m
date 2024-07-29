Return-Path: <linux-gpio+bounces-8428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6248393F256
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 12:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EE8B282ED1
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 10:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F3B1422D9;
	Mon, 29 Jul 2024 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hJ7ZvKE0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE90F1420D8;
	Mon, 29 Jul 2024 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722248017; cv=none; b=eCzOAop3wv/VJWOCtg2EaA6jS4X1m9MhCfoRE4XtiONRUF2wNEGS5X8iRuPn/LXwjp1gdB4roJvn/fnFKpOP/qPRSM20x+S5nCadSmPdnOfpXnPQmvZrx7l4EEXNJbvr+RKONzggzLQKrtCQrMZyoXOhX0FVjKoLQsq+2ObKUIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722248017; c=relaxed/simple;
	bh=uu4Ndu+dSnO0AKF4DXyDHytZPKsKTnjtBm1O4LGlIZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qoCpiOtL00dI/nURXU1Kim3NwV1pwP0IpsxDCw/UGnfaW8jTawTSyFa651nwmpWo0sqYUNIcaD0whStuqk5i5YvkRcT3IEe4ImZWOtMEwO/39vos2QA6h4R8BCe89GdQTkKmVpuyga3WSTCqYqGAJelNYiqiAZTtDPFlJhH2kaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hJ7ZvKE0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SNrqHx031449;
	Mon, 29 Jul 2024 10:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eFZszWFP/3fZ3P8WTHLQnK8a/nQ31EXl9Fet3fpHMrQ=; b=hJ7ZvKE0FO22mRMv
	Gz5OWuknk43xkTBbf3RQozGM66WpSlsM++UUAaI5umpCnS9XtM61EpDQxSJsomb0
	5MStc8gBgUPWMXwqSXFYu3v7kMohIPGGN/1v//GkKIio+8QytHgqMjPRgyJPvVdN
	hUu018RAvXbUghuEA5DB0XBRWn6V6HpYpv6Z3jmXudzlfWTwh/Uyd5uy9+gCoWFo
	wceq5bh61U3quXPAYXr+KoVsqKy0kZCBQn7TNky0qYwxeOeYBFlw0OUSzpRBbohX
	WvOvIgO7dZo+haOJhttDujKGwYZCMHkEhTXLq9i3huPwVMFlmSxLmPqPhohOd4qK
	GOMMEQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mt2kkpcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:13:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TADV6K022909
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:13:31 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:13:26 -0700
Message-ID: <c19dc3c8-8d29-46fc-9386-37e83b9217b5@quicinc.com>
Date: Mon, 29 Jul 2024 18:13:24 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: add the tlmm driver support for
 qcs9100 platform
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240709-add_qcs9100_tlmm_compatible-v2-0-d025b58ea196@quicinc.com>
 <20240709-add_qcs9100_tlmm_compatible-v2-2-d025b58ea196@quicinc.com>
 <CACMJSevpinkT+jFTK6ijpRF2ULEeAFiWLkWEmQ6bJfJdofyO8g@mail.gmail.com>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <CACMJSevpinkT+jFTK6ijpRF2ULEeAFiWLkWEmQ6bJfJdofyO8g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -bT-emD6QiEu28QK6kmCmQf3EKDjtktw
X-Proofpoint-GUID: -bT-emD6QiEu28QK6kmCmQf3EKDjtktw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_08,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290069



On 7/9/2024 11:39 PM, Bartosz Golaszewski wrote:
> On Tue, 9 Jul 2024 at 15:05, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
>>
>> Add the tlmm driver support for QCS9100 platform.
>> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
>> platform use non-SCMI resource. In the future, the SA8775p platform will
>> move to use SCMI resources and it will have new sa8775p-related device
>> tree. Consequently, introduce "qcom,qcs9100-tlmm" to the pinctrl device
>> match table.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-sa8775p.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
>> index 5459c0c681a2..4687e11dfe75 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
>> @@ -1519,6 +1519,7 @@ static int sa8775p_pinctrl_probe(struct platform_device *pdev)
>>   }
>>
>>   static const struct of_device_id sa8775p_pinctrl_of_match[] = {
>> +       { .compatible = "qcom,qcs9100-tlmm", },
>>          { .compatible = "qcom,sa8775p-tlmm", },
>>          { },
>>   };
>>
>> --
>> 2.25.1
>>
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore the current patche here.
Thank you for your input.

-- 
Thx and BRs,
Tengfei Fan

