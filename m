Return-Path: <linux-gpio+bounces-20765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54080AC8189
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 19:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 719163AB0A0
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 17:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C21922E414;
	Thu, 29 May 2025 17:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQDMahUK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A751222DF97
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 17:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748538769; cv=none; b=XpAsWwAFFG8jaPVRaTt6A0F1zaUdsBP+PRfF/0+mOToG/PFv25ckO13/4S2trkjEU1qGlqxwCJ2oCJB8LX2MVJ4CWtiLjSuK0yk4P7yfmk5gWjgxzlNle8qNRJoU7vQjMTMvpi4M54FnlXSAwnwTwJJptc0cmOOGJteOdmXcl24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748538769; c=relaxed/simple;
	bh=Ug2jIoRzLCA5oUM8D+OSRBMvv7WFUOA/cp+F1k5Cq4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhaLj3P69MYoVN2xyrtpbAQvyspTz5zcZFXICgmpwXVIvtMPIDX5Vgaa4/mrHHk268pEWAsBehnc7LomvDI0tdfH5K3eaWb2mZ71EkW8wd376gK8PvckbrZpRXduyK+L2JYeLSwEkS8+CFrUn5yCM5U9+HsLVNtknOvg6d1yjrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQDMahUK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1N0u008006
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 17:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ys2JmP4bbvIcdLdQv1yBN6mYrOG0ArjDO9LWrdrX7ns=; b=lQDMahUKRG5MwAU8
	TalKAq/XrTZrRm4pLM8EGdHxgqUDTVUsMXkJsuUtPHKbvF3/bhnmOb719H9KJbxJ
	2L8ihzNBBM4NEKk/4bNw1b4Z5bD4w3zc8oEaEuaOiLYumQt4/1Ac1iKqjqevXv/k
	Yimik3EVKrO9BQ7edxg1+sT1WuSWGZGRGHiCmqHF9GqAdy0GnG5rMqLFosFvpx3R
	eJBNpLpqL/00atL2+VMk9YcnvTXTIY9tH3PjSZb8n69aXAHrEpf/lpFyh6hVf4Va
	pEhk+e7SP7iUx7Fk4luYLWEPfD1qAAci5HFyjUH4aDcm06W+RmDZhHHVRMpT1ImD
	tyBmsw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf6tt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 17:12:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ad42d6bcso22450785a.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 10:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748538765; x=1749143565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ys2JmP4bbvIcdLdQv1yBN6mYrOG0ArjDO9LWrdrX7ns=;
        b=Le6NabXC1XWxB4U18f4L5mf2d3GZpDRcZOLjd1EV3MHHdYfj6nL2zMOMbtMvrSBNqx
         vMSvmjTiSw9QusF/TGBpRCdlDvk0j31SfrgC7N1TiGPEZiVsmJEJ5tbCXJRCQADfNrvs
         lEBtwwePWajf/mojOYenxFrpH6tdAPF3dd6reD3QihkNlKv7cytsz/tU17qmrg3JJ/Wh
         kXQJyGDjBF9XlQaX0Um5AL3wjxQSaffrAIts6rfD9GOFrH+JmuafkkpEO03LiNgmqTjI
         k9xPop/fHC0hNUn2CgLR5b5z5Vz7j9iP6FYxTPt1ivzPyD+PETa7NFo/qf2S31GalVnb
         0o1g==
X-Forwarded-Encrypted: i=1; AJvYcCUeHdFB0PptJ3nDLfqlKj0Ajl5oT00sglEeXfj1BVKdR0zJHyk6/xUvWHMgaipcm814Oxf6RC8tagZN@vger.kernel.org
X-Gm-Message-State: AOJu0YzbHDru+dI13IPic4ly24xC7lwjerG/l1mf7W6ccLdWFNYfAayX
	wNpJkpTDrvAS5vZRYZXuO41CTVxbwYURJ/wZrC0BflQoSk/WZFJ20UO/+iKOm6tf4wFeoMdJMvf
	+Bi/zcO9eDKROi/ech0jSK/Q2SB8JccoyF7fkQybMs+qKze3cixtEE8W+7+zzQMmv
X-Gm-Gg: ASbGncsdQWxZI2qgGiEidOtrIhobr40Wkwve4ZsUVz5U3tHSsIbWEP53NxA4NwjEL+k
	qf/cyeRzlf2UVQM55NzZK5/It0OsJU5y2Lx4njSBG3nrMcVem5tOthYBVrRLL0tgK8JhMUMWtCs
	QjJdVM1cYSr1w9DL11DxO4TycyDOtyPa1nEwO8mV6yo2jQhQK2sWMnb9OVQTjU0pFl/mM9pOJ0A
	cXTqx9m/f0S2/i3Tl38LQd2+yOWFuS9v1YhDqduciTekjkGR3+wpnORMr2HI5sFOQ57haYGBBw/
	MjobvZfb1ch0+tsfIpQ6GMhgnyYjuy+RWZ/Ot8k/loKuXlmwxP1VF03tUIMaIa0HAg==
X-Received: by 2002:a05:620a:2908:b0:7ce:e72d:8d34 with SMTP id af79cd13be357-7d0a1fa6ee7mr16074285a.3.1748538765284;
        Thu, 29 May 2025 10:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnHYWW2OFnp9a7ve3itNdjg5U8YXwmFgEwtPb5z3CzLgcPkiN+vLMT8pOGqxmuto+sCPYqkQ==
X-Received: by 2002:a05:620a:2908:b0:7ce:e72d:8d34 with SMTP id af79cd13be357-7d0a1fa6ee7mr16071485a.3.1748538764700;
        Thu, 29 May 2025 10:12:44 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2bf051sm172255866b.122.2025.05.29.10.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 10:12:44 -0700 (PDT)
Message-ID: <d02dc31f-1031-4950-b8e4-5df38b8806f4@oss.qualcomm.com>
Date: Thu, 29 May 2025 19:12:41 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] dt-bindings: arm: qcom-soc: ignore "wsa" from
 being selected as SoC component
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-2-9eeb08cab9dc@linaro.org>
 <20250523-fancy-upbeat-stoat-e9ecbd@kuoka>
 <DA7VC87A0OMF.1X5XEWVCHFLE5@linaro.org>
 <7938374e-85fb-42b9-893c-ec3f7274f9c0@oss.qualcomm.com>
 <9c8fe115-97e8-4966-b332-6de94015f832@kernel.org>
 <b4235317-97c0-4225-b6af-f79358cbf508@oss.qualcomm.com>
 <a0b381ac-3280-42df-bff1-1998e0b9c154@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a0b381ac-3280-42df-bff1-1998e0b9c154@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=6838958e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=nd4FsyV9s3kkAaokxrwA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bhhC760dMxE_d45PTjv_k_IFVbh9xCCa
X-Proofpoint-GUID: bhhC760dMxE_d45PTjv_k_IFVbh9xCCa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDE2NyBTYWx0ZWRfXwOLmgbUIr5kD
 +8JP0E+4Q239I2KWWXgfjtKmJjrPRXu/RRNiT2tcgk9QJktQXZY9M8//LWB4fi/qQEaxH0riKYP
 Wce7teYIjf6wSC83Tc4lp/jE8VDwJfx1qoZGVjTDcYc+TocfUdTgEJ8Nhp56WfmzODsL5GPqMHF
 nOH2L3oZ7oFk8S8GIrM31LC/o+XeYOVMB57LRpQ2RjwiViMqZyBL9LlFDf8J6r9EDi6gKuuUTsZ
 Vb2Hw4ju3QoGvnOBmislouRDCGD+HvXsBDxRkVY/3mHcmj7HP7Kce35aoo4Wa3gZNG3NtvxBbGT
 fXmAfMmtuOJoMSQ1ZC+/PlM6D5qj/0TsyhnRNkbUyDvjmbCyAWdaoHn/t9PWrgixGih5kjb4h/V
 ZH4fxDr9h0DbfrS94Qxt2Qt+4u5ZuxXnmlgp+ya3LMHSrDyJ2kevMZxvMdoWRGyWu88HkICm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_08,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290167

On 5/29/25 6:58 PM, Krzysztof Kozlowski wrote:
> On 29/05/2025 18:34, Konrad Dybcio wrote:
>> On 5/29/25 8:58 AM, Krzysztof Kozlowski wrote:
>>> On 28/05/2025 18:58, Konrad Dybcio wrote:
>>>> On 5/28/25 4:37 PM, Alexey Klimov wrote:
>>>>> On Fri May 23, 2025 at 9:12 AM BST, Krzysztof Kozlowski wrote:
>>>>>> On Thu, May 22, 2025 at 06:40:52PM GMT, Alexey Klimov wrote:
>>>>>>> The pattern matching incorrectly selects "wsa" because of "sa" substring
>>>>>>> and evaluates it as a SoC component or block.
>>>>>>>
>>>>>>> Wsa88xx are family of amplifiers and should not be evaluated here.
>>>>>>>
>>>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>>> ---
>>>>>>>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 2 +-
>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>>>>>> index a77d68dcad4e52e4fee43729ac8dc1caf957262e..99521813a04ca416fe90454a811c4a13143efce3 100644
>>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>>>>>> @@ -23,7 +23,7 @@ description: |
>>>>>>>  select:
>>>>>>>    properties:
>>>>>>>      compatible:
>>>>>>> -      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
>>>>>>> +      pattern: "^qcom,(?!.*wsa)(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|smx1[ep])[0-9]+.*$"
>>>>>>
>>>>>> Why dropping front .*? Are you sure this matches what we want - so
>>>>>> incorrect compatibles? To me it breaks the entire point of this select,
>>>>>> so I am sure you did not test whether it still works. To remind: this is
>>>>>> to select incorrect compatibles.
>>>>>
>>>>> Thanks, great point. I tested it with regular dtbs checks with different
>>>>> dtb files but I didn't check if it selects incorrect compatibles.
>>>>
>>>> Maybe we can introduce a '-' before or after the socname, to also officially
>>>> disallow using other connecting characters
>>>
>>> It is already there.
>>
>> Pardon, but I don't see it, only in the 0-9 group
> 
> Then maybe we talk about different things? Because the one to fulfill
> your request - to officially disallow using other characters, which is
> part of the goal of this binding - is here:
> 
> "^qcom,(apq| <snip>  |sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$
>                                             -----------^
> 
> That's the hyphen after soc name.

Aaaah ok it simply wasn't in the email context

Konrad

