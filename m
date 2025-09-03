Return-Path: <linux-gpio+bounces-25466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4CBB41A2B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 11:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D13B1890B96
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 09:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BDCE2E8B8A;
	Wed,  3 Sep 2025 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k2BVj6tG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B825832F756;
	Wed,  3 Sep 2025 09:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756892139; cv=none; b=lp46jX6olUD8q3M6xA6Dex7JHdkxqcK4+XMe3ghLR0qVZpqacFYEoTIMHlsbQmSQrEWXqyFZqtSoS5WNjHXj12EIs5u6pxTp5dQmMifMCjPCRGzn0AwAXdLdUMzN14OX8cpY/txhwmmYILxgskviwGnOTqMTcipWe8QookCMMkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756892139; c=relaxed/simple;
	bh=2SrX7pOVtwWBg7v4+rPRw01j2L4vqSei4qWXKjF/6zA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JlKXiUNUute2Kd+Pctr3+UG6117eYNpsdZ5heUY/Fdn1Huev7jz9uAQXYmpODH6FColrbbHWGuqyQQxgAFsPW0LxjmhcuI+uVnopZzMpYdFP5wT2hf0GnNSt1eqWTlLo/1hKCW/WGEQiPTiE5Tga1a4z/UC7PTw98RitHgF0r5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k2BVj6tG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5831lXlS001541;
	Wed, 3 Sep 2025 09:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGu6PSEI0fGfbBCrsSrp1LYrT19gh28LsxBXiPkBd/k=; b=k2BVj6tG+iD7/oKz
	GuCop1e5RFN32fgnxLkpurkA1lX+rPAzRJqsous8JncnapDF/4kswwOmO6Yz6xG1
	wHqqvEoyL0Wl4YGiUTQ2ZV9qXMQ6gRYbntG8SpPSfG5/cnW5D+xkXnH1Rj/iqUob
	kP3EeyrZl09oS0H66jajS+8J9TbpaIQGck5tVAryWwdW2RNmzdpv2Yz5SLbu54jm
	8H45Eyp1aFQBRgZVa3OHRC/yOwgsL8YNDPvggFi8oBF/0mKevEr/ECRZ5jfgSQ9s
	dqDxOEFuTvmRW1MwtqQ5iXmIf6CmGktVHXwOl1O0XA1qoUDb0L4PZSjgw6I6hZNX
	5FcBzA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy6wps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 09:35:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5839ZWQK003823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 09:35:32 GMT
Received: from [10.218.46.122] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 3 Sep
 2025 02:35:27 -0700
Message-ID: <0ae9fa03-d901-4142-b442-beabf50e69f2@quicinc.com>
Date: Wed, 3 Sep 2025 15:05:24 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/9] arm64: dts: qcom: qcs6490-audioreach: Modify LPASS
 macros clock settings for audioreach
To: Bjorn Andersson <andersson@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <kernel@oss.qualcomm.com>,
        Mohammad Rafi Shaik
	<mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
 <20250821044914.710044-6-quic_pkumpatl@quicinc.com>
 <fcdjq6mevt2d2oz2o43ityogugv5ahrwedkweyqe6qoxqmrfnv@y56wqkllssqu>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <fcdjq6mevt2d2oz2o43ityogugv5ahrwedkweyqe6qoxqmrfnv@y56wqkllssqu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b80be5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=rR_sNn0XFu5YYoDUyisA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LuoR7A48rCDVqOGKsdRhNn9GJVbMPMVa
X-Proofpoint-ORIG-GUID: LuoR7A48rCDVqOGKsdRhNn9GJVbMPMVa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX8rwzFU+DQnFx
 OxPnaYvBFfhSotwlFQfiCB70Ca67C55HpmUW07qHFhX+uc0vuAgzdf77VNAdBsmNJ6X7sK+pFHL
 iHn9+fCWCw+62gkXq0UHo1Uu4Wzl2/XqsOGa/zJoEzOJ8ZBmiGUzDZvW3o85ohPx0TtyuGAltwp
 Joxa2P9h07xQ3FRyC+VydYy1SuMI9OFfHRiJdobU+lIXYw+5xb/f79WVros6YjFYre9gLQ7FNMZ
 sJ+YcwtZ3kZZQQbIOmScnqW1Tp2M2Ap4UraMUeaoLjIfOQ6UKQl7ZNEQpJ7cnL7lsvKXKqcZ+Df
 rTMOr3VqWJWKy9lkF1MtzISRhQjJeLK38jE5Co68QiuKW+tEesNKKcDkNqFDiv9aexBkAbs01PM
 Lvis+Lyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101



On 9/2/2025 8:17 PM, Bjorn Andersson wrote:
> On Thu, Aug 21, 2025 at 10:19:10AM +0530, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>
>> Modify and enable WSA, VA, RX and TX lpass macros and lpass_tlmm clock
>> settings. For audioreach solution mclk, npl and fsgen clocks are enabled
>> through the q6prm clock driver.
>>
>> For qcs6490 RX drives clk from TX CORE which is mandated from DSP side,
>> Unlike dedicated core clocks. Core TX clk is used for both RX and
>> WSA as per DSP recommendations.
>>
> 
> This differs from all other platforms, so please make sure the commit
> message explains why.
> 
> As with patch 1, is this specific to qcs6490?

Sure, will update the commit text as per your recommendations.

Thanks,
Prasad

> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>   .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 61 +++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> index 282938c042f7..6d3a9e171066 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>> @@ -12,6 +12,67 @@
>>   #include <dt-bindings/sound/qcom,q6afe.h>
>>   #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>>   
>> +&lpass_rx_macro {
>> +	/delete-property/ power-domains;
>> +	/delete-property/ power-domain-names;
>> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&lpass_va_macro>;
>> +	clock-names = "mclk",
>> +		      "npl",
>> +		      "macro",
>> +		      "dcodec",
>> +		      "fsgen";
>> +};
>> +
>> +&lpass_tlmm {
>> +	clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>> +	clock-names = "core",
>> +		      "audio";
>> +};
>> +
>> +&lpass_tx_macro {
>> +	/delete-property/ power-domains;
>> +	/delete-property/ power-domain-names;
>> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&lpass_va_macro>;
>> +	clock-names = "mclk",
>> +		      "npl",
>> +		      "macro",
>> +		      "dcodec",
>> +		      "fsgen";
>> +};
>> +
>> +&lpass_va_macro {
>> +	/delete-property/ power-domains;
>> +	/delete-property/ power-domain-names;
>> +	clocks = <&q6prmcc LPASS_CLK_ID_VA_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>> +	clock-names = "mclk",
>> +		      "macro",
>> +		      "dcodec";
>> +};
>> +
>> +&lpass_wsa_macro {
>> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +		 <&lpass_va_macro>;
>> +	clock-names = "mclk",
>> +		      "npl",
>> +		      "macro",
>> +		      "dcodec",
>> +		      "fsgen";
>> +};
>> +
>>   &remoteproc_adsp_glink {
>>   	/delete-node/ apr;
>>   
>> -- 
>> 2.34.1
>>


