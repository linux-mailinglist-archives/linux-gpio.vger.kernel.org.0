Return-Path: <linux-gpio+bounces-20843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A14BAC9E88
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 14:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44ED53AF4AC
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 12:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5FE1D54F7;
	Sun,  1 Jun 2025 12:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B22srpPX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74E5D299;
	Sun,  1 Jun 2025 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748782367; cv=none; b=LJ7xezoH7VIThJLEF7LdXkEJxe6wE3uQqgp/yg5tDmwqZhHaBWfbhJJslLIR88yizJcaTKpYD0E+5fKHD95e6uaISYrEp2f++f4zUmPUuKh4J7uDEbHaLUAEM0BHc7oyxz9ZfoA+nxStXk7IbBrtqnKZaSzO3QYmxAr8nnRZw4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748782367; c=relaxed/simple;
	bh=1LZ0RKAzz8Us68lWq2s/iHgyAAafmKRC+v60CMHRvHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h74n0Z/xVKZ50e2fDVoKZi/Xs3p3OSPIXuUeVhDhhNR9ChykvT1DZUMJEiJapx/DJqLWo1s2UlPGYPouFwp0KCQ7rSD1Q0X+unYek5K5z2yTlDAEzCgQ4yYCvLP2113O2GUNqVI1bHKsQI3lyqJXu1iP+CD80sgPlTMVIXThgKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B22srpPX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551CU2mr031111;
	Sun, 1 Jun 2025 12:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wDZqrHsr9WWZSu5dGlHFnZrdqcxMYiV2vXRL6phfGN4=; b=B22srpPXIHKJZYtM
	cCoQsmiUnYM5G16U6kuMbh/N3rdjWts7UwRIy3l47zsxirX+tanzAVY4sb4piC0W
	2Tqvxpr0PSQeTzf7+nyt3p/8ZvXLY7TXiL3KVc7cf7AtGrKGuwRRVp+CLpsmhEZo
	AwNMVfReRRNIizMvb/X6gI7XKmzWIZcz+z4X3ZRTTYqHbMaqe40WLYcON0PJAcLG
	FNb0AO5e8tJ8HMjnn2uoHGWfwUWT1siq1BnR4UUPEYPP3uLeZIvGB7fys2MZOXNf
	vk6jnGqj4kJ5jzA9fJAe6cVcrRdFpgME9TUiR4jcDmaFzmITrLJq4Jw3fJumHA15
	/+BxEw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkptaf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Jun 2025 12:52:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 551CqdwN031348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 1 Jun 2025 12:52:39 GMT
Received: from [10.216.12.79] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Jun 2025
 05:52:34 -0700
Message-ID: <319ab5a4-6e01-4d57-8df1-73af1d48eb93@quicinc.com>
Date: Sun, 1 Jun 2025 18:22:31 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
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
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-6-quic_pkumpatl@quicinc.com>
 <c54b2243-fa0b-4de9-a780-e0fab795da25@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <c54b2243-fa0b-4de9-a780-e0fab795da25@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uz9q2zKToDTvmAKTng7V8ObhkmQ61cQC
X-Authority-Analysis: v=2.4 cv=SPNCVPvH c=1 sm=1 tr=0 ts=683c4d18 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=p0kHB7VRyab2_TFW5tgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: uz9q2zKToDTvmAKTng7V8ObhkmQ61cQC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDEwOCBTYWx0ZWRfXxo5ltU7F+PgN
 0cDlWpce2abNYXqYQf4KCik8ZfQLk7GcTmJ255sSlnDBNl6ZJjHLSiyFl5MFqgHkdyLEoA2B1Eu
 CJgiHiArhnZzHYqRJAJLt91cNzXphW2eKrJZuhkqO5D4AMTkjRHmPmhPyOlzH6f24PSAxaPCYeJ
 EIx1ukoIa7MmspAoefsFuwAuaTenhWU1tdNaGiQK4SCArUcZgQn0GkoyhOfARIjvWgzsr1W0tMZ
 u0segoaZxqYraEyjZEu4xTtbMOY7Vj4J9MQ9eWD3dV/zN9Rik+FwoFU3QADJhMYljWn41c6X14c
 n7q0N31Bny/SNr2d0a+5N12sM/3pyggAV2z0gV1dTwMFGT6CYxda2kvhBL4THhLTNURMFIwY4Zp
 sq/ovjpqjEhQiKGK88GvsBznMPQUJySXdDQA70Jxnq06AlKawx0yiFde5g+LSd2XHO4EjTx0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=911 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2506010108



On 5/27/2025 5:29 PM, Krzysztof Kozlowski wrote:
> On 27/05/2025 13:12, Prasad Kumpatla wrote:
>> +	left_spkr: speaker@0,1 {
>> +		compatible = "sdw10217020200";
>> +		reg = <0 1>;
>> +		powerdown-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
>> +		#sound-dai-cells = <0>;
>> +		sound-name-prefix = "SpkrLeft";
>> +		#thermal-sensor-cells = <0>;
>> +		vdd-supply = <&vreg_l18b_1p8>;
>> +		qcom,port-mapping = <1 2 3 7>;
>> +	};
>> +
>> +	right_spkr: speaker@0,2 {
>> +		compatible = "sdw10217020200";
>> +		reg = <0 2>;
>> +		powerdown-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
> 
> 
> This will fail during runtime. You never booted your DTS.

No, its working fine, didn't seen any issues for far. Please help to 
provide at which point of line seen issue or provide more context to 
understand for me?

Thanks,
Prasad>
> Best regards,
> Krzysztof


