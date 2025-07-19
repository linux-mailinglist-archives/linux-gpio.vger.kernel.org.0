Return-Path: <linux-gpio+bounces-23517-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EF0B0B13E
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 20:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3199AA6451
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 18:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1144E2236F2;
	Sat, 19 Jul 2025 18:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WblB879O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DEA42AA4;
	Sat, 19 Jul 2025 18:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752948533; cv=none; b=Au5BffJwBJQcm3eD45/OIJl77sXQHpo5GweVqZJ5vM/wXn3kBrmCqBdRvmBP9PvuHy/d2F+lWzaAw7idltoQXKdp5TB0o6hJ/yx10tLKUJjvAAwtJj4U2ieJYYlLT3prxcl8XbuCCL+8Z7w3TOTO0IR4dk6HGNPuERPS9Ht8toY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752948533; c=relaxed/simple;
	bh=5GpsMRdyrK2RzrIyTvO0RbrD1wDBMKXPGZZHDGuHEiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aZufQEaBiUVmnnhHQWpqWURhASIL5iL/nUbplWmjiPS3DK5EfjpATOPfztzu7f9OQJi8VSRhrd/9QFYfTfNA4sJNBayyUFNYx3j8H4sMqnxqiGBJiEKXmaxMoPA2aZkbl9obYJOtXHQ10OqVH6dcapZQp5PZX+bd6BcgB3zqrCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WblB879O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56JFnsIM005737;
	Sat, 19 Jul 2025 18:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZ/tCuE9CuTWsikn6YA5ljEysek5Hs3V2swgrnmVlro=; b=WblB879O1G3jCvdb
	lL1VZ8x0sTxaAxAZe0xnFp27oZq6bzWJGeS15l4NxlGcuSNjmadt8ewsDGUZLmNt
	r8myZlPZRAZsGOL+MtI8ASNo7RoZ5gvs+ei6fFta1l1GpK8ssVV8QXxqNJU4IE3+
	R/BNEToSmRUefoaiw1PtFqHI5IXQO5xcCxLB93hVi7KY8U5nMxLEdUMJVfFrKINi
	bbzHSFor/6DMZfHrKkdFfr42rAudPLQSg9sjZL3+rJjpJuIgRLyt74y1jXCT78nZ
	Tqm6LtAu/SvYkvKgmWFVEgVy0ky0iNkXXzILu4H7tC9lSudwHNptYzLL+qiMxYFz
	mCwzxw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804519162-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Jul 2025 18:08:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56JI8j97000325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Jul 2025 18:08:45 GMT
Received: from [10.216.11.131] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sat, 19 Jul
 2025 11:08:32 -0700
Message-ID: <9560a7d2-d54a-45de-a3ac-f752cd0d92f2@quicinc.com>
Date: Sat, 19 Jul 2025 23:38:27 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] ASoC: dt-bindings: qcom,lpass-va-macro: Update
 bindings for clocks to support ADSP
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Srinivas Kandagatla" <srini@kernel.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>,
        "Mark Brown" <broonie@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <kernel@oss.qualcomm.com>,
        Mohammad Rafi Shaik
	<mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250715180050.3920019-1-quic_pkumpatl@quicinc.com>
 <20250715180050.3920019-4-quic_pkumpatl@quicinc.com>
 <20250716-spirited-sage-ibis-dcfeb1@krzk-bin>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <20250716-spirited-sage-ibis-dcfeb1@krzk-bin>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687bdf2e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=QW-sMX8yjbW2LPJj644A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YbxCvnYrjqTcOvrALOQPJRXK0aUVK5BO
X-Proofpoint-GUID: YbxCvnYrjqTcOvrALOQPJRXK0aUVK5BO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDE4MSBTYWx0ZWRfX6AOeeRtpNK1c
 IIkmQgQjPZ4pSeWacy6UWsa2LNx7AnCelB2SzIDAOPBFKUgiRUQkWJC8CWpX4WcfCsc6CJRm5XH
 tspG9fzOnwLw0oqdvJ4C+K5BlbfrBwBaj29jwEvb+xGPr9EANfNDJ2pIz30Jkp4RnEtM69dcfIX
 dA+RaH0p5LyM9tIKFCsaQZxgBfZEt1zisev+O1E4SkR3GWv2ETsVq+u7i7CcL1quZ5icKLvmpZz
 rtTGCVhHWEhaV34BPoIT8p01vhu1H9YHxmyvk0ZIBIcyP5nSAEBIsXq1kRmvYMYN5mT3HtCrnVe
 CbsfYjzxVM1DYyst7YB/7OKAMIuloeTXj2+fawdk6j/ssQlD/vRi1UQ2qwjfbJB5CXQwiuFLJ62
 S/zBYPNUsLdloyVcUZszsBU1rdMZsh+G82vVq0xw/xGESWm9ePW8CIrsn2zodvouEcCaX+n8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190181



On 7/16/2025 1:21 PM, Krzysztof Kozlowski wrote:
> On Tue, Jul 15, 2025 at 11:30:44PM +0530, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>
>> Manage clock settings for ADSP solution. On Existing ADSP bypass
>> solutions, the macro and dcodec GDSCs are enabled using power domains
>> in lpass-va-macro which is not applicable for ADSP based platform.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   .../bindings/sound/qcom,lpass-va-macro.yaml   | 29 +++++++++++++++----
>>   1 file changed, 23 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> index f41deaa6f4df..aec654e6567e 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> @@ -76,12 +76,29 @@ allOf:
>>             contains:
>>               const: qcom,sc7280-lpass-va-macro
>>       then:
>> -      properties:
>> -        clocks:
>> -          maxItems: 1
>> -        clock-names:
>> -          items:
>> -            - const: mclk
>> +      if:
>> +        required:
>> +          - power-domains
>> +      then:
>> +        properties:
>> +          clocks:
>> +            minItems: 1
> 
> Drop minItems

Ack,

> 
>> +            maxItems: 1
>> +          clock-names:
>> +            oneOf:
> 
> Drop oneOf

Ack,

> 
>> +              - items:  # for ADSP based platforms
>> +                  - const: mclk
>> +      else:
>> +        properties:
>> +          clocks:
>> +            minItems: 1
> 
> minItems: 3
> 
>> +            maxItems: 3
>> +          clock-names:
>> +            oneOf:
> 
> Drop oneOf
> 
> ...  or rebase on top of my change and make it only min/maxItems:
> 
> lore.kernel.org/r/20250716074957.102402-2-krzysztof.kozlowski@linaro.org
> 
> (or whatever gets merged first, I can also rebase my patch later).

ACK, will make the changes and update.
Thanks,
Prasad

> 
>> +              - items:  # for ADSP bypass based platforms
>> +                  - const: mclk
>> +                  - const: macro
>> +                  - const: dcodec
> 
> Best regards,
> Krzysztof
> 


