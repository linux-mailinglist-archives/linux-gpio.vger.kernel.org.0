Return-Path: <linux-gpio+bounces-22702-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C23A9AF71D3
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 13:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 440DF1C26727
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 11:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821172E175F;
	Thu,  3 Jul 2025 11:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dR86CbiP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97962D12F1;
	Thu,  3 Jul 2025 11:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751541151; cv=none; b=e6zCIIsxg8GUSMElAYiDUKFmcYVc5+n2WfvfaqcuYRfdFfosE+KHKaFenIRvLGvd9cF+sJRPyhhmCrhiWC87/WbffxXnLaFAyX0CEeK38+xTqlFCGEOmYW7Bb0PauHbnVXXvyQcH/qSVkKZSUoVLTxVlPL277EWzDyvyo+VurUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751541151; c=relaxed/simple;
	bh=H2eJWmCk2lXnWMtMkSOrRf2uJVt39KVC0MJOU0u/Lng=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V8ucGNWF84DB3ecfahtT/obmdqaYpdxbZCDGyQkJN8k0irD5H3emD6c5YpSdqkZkYgeHVlCC83MVxFdDUO5kxEFHlnm8Uu8TR4zYXOSCEmsHC1zzRZO2XRaPhJcMYnnQnRJACDGs/UFtMb93jxA9M5sJmyQn0jPEwJczY9e4638=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dR86CbiP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5638LES7032540;
	Thu, 3 Jul 2025 11:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/pXxxWAE4uu6DN1xz7bTHYkOJ7kt/M1Gthz7B060FP0=; b=dR86CbiPX8S7kMno
	iTPWIH+FbvUBdxpc/WJdM/4juos7ftZCNLJ9fPbzzaupUd8UElRf/8T0IqZJXKDX
	j/tvKakUzfoKexhiho35pK0hwL3pOzDtRebf56n2AjbZjK5dSI8HF8uUVlqsro0S
	TZXOORlLaU+K1J9F8oLPo3p51KsNbHVEopZTXPpuLjXxEKuyQ1kckJ0yeTI0IJ6x
	srsgCRpDy0m22gNi+mHhmv9JEtFaW5IaE2hNt7sf0p0jYGI7FYNBgD8GcX07kfRS
	3amj6Pw3WvClF/Kti5E8meR5p3Wvd07uMlCTv8XJaJUL0jv0iCUFwiT7HtOw0cV3
	ZrphOg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kgf4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 11:12:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563BCMtW027979
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 11:12:22 GMT
Received: from [10.219.49.219] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 3 Jul
 2025 04:12:17 -0700
Message-ID: <e924a97b-02d4-4f99-833c-3f3297bbfc5e@quicinc.com>
Date: Thu, 3 Jul 2025 16:42:15 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] dt-bindings: pinctrl:
 qcom,sc7280-lpass-lpi-pinctrl: Document the clock property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250625082927.31038-1-quic_pkumpatl@quicinc.com>
 <20250625082927.31038-3-quic_pkumpatl@quicinc.com>
 <46f3ca15-b638-4a05-ad61-88e8bb025915@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <46f3ca15-b638-4a05-ad61-88e8bb025915@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68666597 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=_2Pm6FfrxIRCaX_8azEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA5MiBTYWx0ZWRfXwy6Gcke2NU+T
 PUipZlSlvIIvfqL+FA2wjxoUTGzzbSHYJ8yuH8uV++MTZHZ69vndvuk2JxGAWWkJPDdSK8pFPIY
 cJwGN7hYVccu6l7ckB/0VO+67ULk4BlQpw4bfkmp0E2iFCG+cY65IPvliTULzIWxgRhdtQ0nInz
 xr/mGnAJNSjQ22uUpNBkoxk+eBXZYvLLAMBd3DvqLMsMAl6C4IFPKihHm71Cs1RxwJ0WyYZSofs
 8TFgXGMwKjv+i6d2E+A34f0OVW8irJYGWaBlm1HeR3LWAIZ6U1PAkzUvd6AkfSfE8rkF2kI6pGE
 s5VdWQDEE7ZRRlI08aC5wPnMZH1Y4bHSW6w1p5wVqOPlcorB/bWgD7E/1QuYKwosrYPuKfOV5cq
 q4KbMhqxRkW83LgXoHE1fwkFaDyH8kb4427RCvYFymTTHTmYKm9IoZ07DIPMQqW9ENqx/6F/
X-Proofpoint-ORIG-GUID: 9lfPPEPyLMRxkwz3nyKYz2k3aSKw5HRj
X-Proofpoint-GUID: 9lfPPEPyLMRxkwz3nyKYz2k3aSKw5HRj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=986 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030092



On 6/25/2025 2:16 PM, Krzysztof Kozlowski wrote:
> On 25/06/2025 10:29, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Document the clock property for sc7280-lpass-lpi-pinctrl driver.
> 
> Describe the hardware, not drivers.

Ack, Will update commit message.

Thanks,
Prasad

> 
>> Clock settings required for Audioreach solution.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml   | 16 ++++++++++++++++
> 
> 
> Best regards,
> Krzysztof


