Return-Path: <linux-gpio+bounces-22703-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B98ADAF71F1
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 13:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE9F2188BD2D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 11:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0A82D46D8;
	Thu,  3 Jul 2025 11:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NAKY/Oky"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CBDB676;
	Thu,  3 Jul 2025 11:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751541541; cv=none; b=MIme2HImcLudRry7PjGJrbc0+L9wT91+vldkwCyxfEP5x6Dj+Mn1PkVsEzkcfOAT+RkBs30nKWn0qBzvKxJSXYp3lOnCxsg/Y7SDWWFi8mtZGa9z24JPDC+5gIFIocL+DjFElYGVP5XwPGAlcbk0JWIga6e/PUpucUeX+tmaS6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751541541; c=relaxed/simple;
	bh=z7X0q8jFoPphzjvlBjZKZs0EITjoJ8PXQd9MTFXxv4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qElBnNspFjuBHbibbyFiQcspiGvV7cWyRlgPBurN51LRVPMvnl7LYxswLsKoR8z5ACbDV+nbhbuUIeXM0Hmmw5czw5UkkaRoj5KZM+NdzCfc7RGhKpQwybOMJMXy9SBoj1IzTgP7FlVsRPF9Ck89Z4JjZNZCW43URUSl4Uw4K6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NAKY/Oky; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56394Xh9025165;
	Thu, 3 Jul 2025 11:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3DxMRWTKB5ztrCPcZsMM+0VWqfS35v2k7VDB6YTq+Cc=; b=NAKY/Oky9Oda5Lds
	PpWMX8Dcwz4KkK6sua9iyB7EmPZdf5Xt4ZLLBZI7VVeuiz2LAGxvZWyW/tZ5L6WA
	dm3HFe31P2wJb9/I2ozn2su9mjQGBoAuVYwo2uikqYAzUrYelgGNKHjoNt8f6nXg
	rkelGYuzzoLffmcY7Eh0s6NCRuLudU/EOcswCNyGuhNBW4KSFtFKZ3zJbuzsjgKG
	Y7hNiTNV3IY1GapbgeCohzfXtsuavOpJlxgB5U9U0XmUDS3wDXPYReq1U1LV/tPc
	RPmuw7eJgH1XLdwjGgbhMWFfmVGx3g1fJvTtuhGinVe7V6bp6X1Cr6GiSYeBxDv9
	1kKPYg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64wapu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 11:18:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563BIsWM025319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 11:18:54 GMT
Received: from [10.219.49.219] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 3 Jul
 2025 04:18:49 -0700
Message-ID: <8fa30d8f-8737-4bda-a5dd-d7deb8f0896c@quicinc.com>
Date: Thu, 3 Jul 2025 16:48:46 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] ASoC: qcom: dt-bindings: qcom,lpass-va-macro:
 Update bindings for clocks to support ADSP
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
 <20250625082927.31038-4-quic_pkumpatl@quicinc.com>
 <14e0e012-0283-4a17-8cb1-fe96785b11ac@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <14e0e012-0283-4a17-8cb1-fe96785b11ac@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6866671f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=vC_a7ZyuHw2JGkk7z40A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA5MyBTYWx0ZWRfX65gQ5Lcor+SJ
 8IWcGy2/u1n6deDqd6Tb33XtycKvxzwWxPMke3lDOEMdDR4MhKsvsxa54FzwSbmRBaODSvXwUIH
 JqjyjzJAL6/aKPKlA7L6t/H6s+F9ueolWkV5Ym6oYpkDRlu7tJs5UvJzFn8eU9bOCDVTnxpJJYO
 /p/px7VIxEslic92Qw7TRqvz6eT+Fqs4EmIM2AMscxIBO1htA1ZSwghH0pncYsY89iF6v+zw6j5
 YLh+r4QLhoAIQAjpwWkghk5FRbTxu9atlgzjXeg6B/rr9lzmcf1w+whb4X5WZtoQ9Ezw6eJtly3
 Gh1Dh80SJpm3QEwhGYKltqeaJNHHVOeKwuIsJe/zm1dy7T6//1jk4VftjDfn0Zcjmsd4JqWHpf/
 Cl+KCmykyvzx2YyMBfAVrz/QJbVkkeEep6g5oOllyWOqXHHYAPr2tp6rNJbjoOen91BOU5w7
X-Proofpoint-GUID: GpGKY_x1BwmzBKPSdc_7JmlpZSODAdZ8
X-Proofpoint-ORIG-GUID: GpGKY_x1BwmzBKPSdc_7JmlpZSODAdZ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030093



On 6/25/2025 2:14 PM, Krzysztof Kozlowski wrote:
> On 25/06/2025 10:29, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Manage clock settings for ADSP solution.
>>
>> On Existing ADSP bypass solutions, The macro and dcodec GDSCs are
> 
> s/The/the/

Ack.

> 
> OK, this has to be expressed in schema - oneOf in top-level for presence
> (required) power domains or clocks (contains for these names).

Will check and update.

> 
> 
>> enabled using power domains in lpass-va-macro which is not applicable
>> for ADSP based platform.
>>
>> Reference:
>>   - qcom,lpass-tx-macro.yaml
>>   - qcom,lpass-rx-macro.yaml
> 
> I don't understand this reference.

Please refer below link for more info. Which is similar kind of 
properties used.

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml#n72

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml#n77

> 
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   .../bindings/sound/qcom,lpass-va-macro.yaml        | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> index f41deaa6f4df..38679a4f21fa 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> @@ -75,14 +75,20 @@ allOf:
>>           compatible:
>>             contains:
>>               const: qcom,sc7280-lpass-va-macro
>> +
> 
> Why? It's a different style now. Don't introduce random whitespace changes.

Ack.

Thanks,
Prasad

> 
> 
> Best regards,
> Krzysztof


