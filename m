Return-Path: <linux-gpio+bounces-20842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 748BBAC9E83
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 14:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E92C3A73AB
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 12:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CD11CBA02;
	Sun,  1 Jun 2025 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C+xpPOMJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC172DCC17;
	Sun,  1 Jun 2025 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748781999; cv=none; b=YU0C1TqVaNs78Bp4/SgriEiWm1zP4zg3NOuohYQPLni2mV+EEjJENC7bwB5iEdHPKgx7DOSawcHU05wy/wrDscP98hdvUFcqR9EKpuEzEsllt1C32apC3hnSpn++zcHonUFR9QBD0QQAyzLF5EZhmfFUPvhXPCX5XS7BcAJWH2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748781999; c=relaxed/simple;
	bh=oxt0dRpZoMWY7/9yuEvcQFHFjOWxNYhOV7EHQiD0OjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bdilpViwJBt8Rs83fwfMVbZq4kX4eYf5H4ZVy4kT6o1imFafDs5B1ZkeMI/hqHZ/wM/2qNuuVoKmn0BOl3OEcSdNK/xRwjmBkYIhxOalJjhwAiVJXpTgvISCuuAOZSnveoMgWfYKvYSyFk0+2xL9Bgn+9I3t9OLOyAHlpkik2vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C+xpPOMJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5519icj9004887;
	Sun, 1 Jun 2025 12:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcUqOKL0vTuVkKBL/yc5p8RWXtlaMRnNnlV2XcmtCoM=; b=C+xpPOMJ8CqUcMn8
	+d1Sr9jokRUYtZZe7HbRq07bkqd1yLG4pDlrbm7kEJ+ZKvTtkiGzdbq9qDQw1rE0
	Oh/dnM6pjWTEiZget/X8GVfJGv4w7LWHZux5HKkmUhCg6dLHqri7IxbHKhEyub+l
	Jybv5Btg8CETzXS6CVKUT8rrmiw20JJCb2dKgXPYG2TgKgi8KZT48O1GO4zjdspC
	4jhzNO4AChQJ02VuQp3M24O0yP3soj2YhfO+YPkRzkBMnjUCjkxVtTdtFxInBBci
	l2rcejLhOag0HAW/+xh64M+jAGLKQQAKT7zvHTrsq4I2t8NZtBt3mAvEMTzulJVK
	OWN4Bg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkr2b7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Jun 2025 12:46:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 551CkJkR005405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 1 Jun 2025 12:46:19 GMT
Received: from [10.216.12.79] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Jun 2025
 05:46:14 -0700
Message-ID: <13b9cbec-3d7a-4deb-b356-685e73fdf2f1@quicinc.com>
Date: Sun, 1 Jun 2025 18:15:07 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] ASoC: dt-bindings: qcom: Manage clock settings for
 ADSP solution
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
 <20250527111227.2318021-3-quic_pkumpatl@quicinc.com>
 <171b980d-9c50-4891-86dc-e30d712f5384@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <171b980d-9c50-4891-86dc-e30d712f5384@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Y1H1mF8QSNj4b_7P1l_KZtn-MGRCmcmz
X-Authority-Analysis: v=2.4 cv=OMMn3TaB c=1 sm=1 tr=0 ts=683c4b9c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=DgfXYgLvbwjhQd-2fTUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Y1H1mF8QSNj4b_7P1l_KZtn-MGRCmcmz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDEwOCBTYWx0ZWRfX3xmqOMQJ+l4k
 kxI9d7HiplJmVFkBwmrtYCPB/Ug1UIwBQcxZOvc+IhSAs9jLwXXzDyMRyVF2vJkJqiwlFWqHzo0
 XZbpiw4aBIYTVy40MbP9KJX+kBMZK7WTAzHF0xyk2GIrpT1rwMkUMECuMmHU9idrUM/8+9jZiLk
 rWsGsBEtu9qbp34wagjnAZ24jsZ0qIHuBKmDOGosqQny1aBJYVbt9sCtc/oSltd8w6Hx7CYjCWG
 9S0PnmPBVu0m76iIfjlxAteUUpnQGPAkHEDi+4GBTdi2Levrdx4HNqgzVMXaSCrYrIkAg1xOf2a
 yZLmGNXWx0V6QA+HEewrEQ59B9phLt8ckCkmUtBCVzj6M8nV7cOLfy8RGl1sym9mKwif+RKQhKW
 15gAF5z/kj125WQ8xP6KdKwQnHTkzozx0QbHuakYasHvrUiQMJ72CG5VAsd5lqZKwu0kIr4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 clxscore=1011 priorityscore=1501 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2506010108



On 5/27/2025 5:28 PM, Krzysztof Kozlowski wrote:
> On 27/05/2025 13:12, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Manage clock settings for ADSP solution and document the clock properties
>> on sc7280 lpass pincontrol node which is required for ADSP based
>> solution.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
> 
> Nothing in cover letter explained what was happening with this patch.
> Provide changelog under --- in such case.

Ack, Will provide more info on commit text.

> 
>>   .../qcom,sc7280-lpass-lpi-pinctrl.yaml        | 10 ++++++++
>>   .../bindings/sound/qcom,lpass-va-macro.yaml   | 12 +++++++---
>>   .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 24 ++++++++++++++++---
> 
> Split patches per subsystem. Pinctrl is not ASoC.

Ack

> 
>>   3 files changed, 40 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
>> index 08801cc4e476..b1270124bfe3 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
>> @@ -20,6 +20,16 @@ properties:
>>     reg:
>>       maxItems: 2
>>   
>> +  clocks:
>> +    items:
>> +      - description: LPASS Core voting clock
>> +      - description: LPASS Audio voting clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: audio
>> +
>>   patternProperties:
>>     "-state$":
>>       oneOf:
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> index f41deaa6f4df..92b97c214060 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> @@ -78,10 +78,16 @@ allOf:
>>       then:
>>         properties:
>>           clocks:
>> -          maxItems: 1
>> +          minItems: 1
>> +          maxItems: 3
>>           clock-names:
>> -          items:
>> -            - const: mclk
>> +          oneOf:
>> +            - items:   # for ADSP based platforms
>> +                - const: mclk
>> +                - const: macro
>> +                - const: dcodec
>> +            - items:   # for ADSP bypass based platforms
>> +                - const: mclk
> 
> This device always receives same amount of clocks. Hardware is not
> different if you decide to not use ADSP.
for sc7280 clock handling only supports non-DSP based solution, macro
and dcodec votes are placed using CPU-Powerdomains. Which are not under
clocking properties. In ADSP based platforms macro and dcodec votes 
should be placed from ADSP.>
>>   
>>     - if:
>>         properties:
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
>> index 9082e363c709..6a999ed484e7 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
>> @@ -35,11 +35,11 @@ properties:
>>       const: 0
>>   
>>     clocks:
>> -    minItems: 4
>> +    minItems: 3
>>       maxItems: 6
>>   
>>     clock-names:
>> -    minItems: 4
>> +    minItems: 3
>>       maxItems: 6
>>   
>>     clock-output-names:
>> @@ -59,12 +59,30 @@ required:
>>   
>>   allOf:
>>     - $ref: dai-common.yaml#
>> -
>>     - if:
>>         properties:
>>           compatible:
>>             enum:
>>               - qcom,sc7280-lpass-wsa-macro
>> +    then:
>> +      properties:
>> +        clock-names:
>> +          oneOf:
>> +            - items:   # for ADSP based platforms
>> +                - const: mclk
>> +                - const: npl
>> +                - const: macro
>> +                - const: dcodec
>> +                - const: fsgen
>> +            - items:   # for ADSP bypass based platforms
>> +                - const: mclk
>> +                - const: npl
>> +                - const: fsgen
> 
> This silently breaks ABI. Third clock is macro.

Ack, will check and update.

Thanks,
Prasad>
> 
> Best regards,
> Krzysztof


