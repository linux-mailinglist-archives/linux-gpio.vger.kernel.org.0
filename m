Return-Path: <linux-gpio+bounces-23880-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E67BB14E7B
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 15:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8061218A062B
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 13:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC03919B5B1;
	Tue, 29 Jul 2025 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4vPjypW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E962814C588
	for <linux-gpio@vger.kernel.org>; Tue, 29 Jul 2025 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753796307; cv=none; b=q/KKWyPAxAGDRVbOZ60oaPqUqfeZNvmbO2bXSby1/2Rvw4LJv3ioJ+I10hKS+WsoyaXcgvh0o8VQnkuzTHTGs2KwLINmvd5z+6KR/Yuu8DPWJTMVVKfbTkDHFPvEr/pJ8Y4Yuzi/fHHJTER5JPvjPE+Ci6HhJoE7Ab+08vXkWxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753796307; c=relaxed/simple;
	bh=XRcQl2sDslI5kS3lvxmQW7gE08M2ZCXO65pFU+AsBIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLSLzxkGRwK0A7Jgv3UiHJL5gBgTFCatvnW0WwXEv7HRD/In8ll4KT3tWSt54d8C8ztxxWGeVjaN9kdEsdNfnT9iQAnLiMcqAqa2xML4jeFklb+JWFEevOatVUXTUwzgQ8wGlHIbrbxlBh7AWcoVAD01fDTIcPD/tyL8D/0L50A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4vPjypW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8csnu014609
	for <linux-gpio@vger.kernel.org>; Tue, 29 Jul 2025 13:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bYu4VBFFbTuFCWo4dZT/gRUtAZuQsCf/xjeyDn34aco=; b=b4vPjypWqJTqgH4P
	UkAzdJxmq309RE35JcxUN4f7z9UKS5AZymG4QCKK95wkKLAajLGpA4eNAkruhywF
	M5xoDhG/RPnKQLYAfRXbFfPBaFG4wpnQVunX75ymzt9nTYjSgBgE9h7YnLfaWtX+
	Uni3pALhrJLPgF+YdvmBXtDt6p0x4WBE4GsJwc2C4+B0QbZ0oZDReHI8SY5Azzgw
	QjkzVuhGImbccFiB3NYcqEI/UfdCH5u04h/IxnglSBSoDykOpCFCnx4yjG1VtBki
	KgQJJtxuZVogsI7O1YFoml87kWEOY9SkIExrR7tPlTzjbtTpMJI+ygePY+NFzAxc
	E6aCnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xr79m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 29 Jul 2025 13:38:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e34e28a640so38515485a.3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Jul 2025 06:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753796304; x=1754401104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bYu4VBFFbTuFCWo4dZT/gRUtAZuQsCf/xjeyDn34aco=;
        b=h0QmUvSPP4zC6bPMZBreoZl9aPdKoUuZR7ErTn1xS+oiw/CWk/3pAtHtXei6rTfj3c
         h6aIM/cFrZNSr1Il8LzlYLlj7HChUyUWJelzyT2NdNzjwbT169F63o+XEQeWwKnQH0cY
         YbVRRKNUH+I/R6qK64SuFf8+YNDm/D6g1urqP3CiH6SPPpCFFg3pTChRMXwMeudEnC52
         LkAa1w5pI1fiV7raIN43N0dN5jI7IM9jJ41STbpkqUoTzVejGJmqmNMhnTHk43PoefJW
         fR/YO7/lbEqDYxiqoqAKB965rYAUusjnww8ALO93DR/WV/cOba/q4BpzKpbsHJJ4ymDw
         HWHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQyixImmHsQOdwWckcnxGhcX+2L1gC1YYyrB7NuwgTmAE1ydwlvqTPpor7rK0me28Tt+usNMJv/IUq@vger.kernel.org
X-Gm-Message-State: AOJu0YzpdbBbfBK00EIt9c+oTYKMAATgBJYsgXYwma6p8Zoh8WG7cjAG
	6aX/TSY5zgaFcYranyelfckpc9Zz7inDvFc2hrHeglOs1DAVoaOIgc3EKB1gDppt7UVpJ0TQtQt
	Wl2PJMs8hfCq8kMIgnlwqPfvStoS/U4PGbl4GxqCyJrUKl3t+BD7kq2b8x5i3bsQ+
X-Gm-Gg: ASbGnct1sdSDQ8/lfejF9Jym+sofHBBplcz+3N/+KADgUDFSvKW4Hxx1wIZvKQ3DIL3
	4NQ9hP0E7zBXpNqcnrSYZBcfEUptK5zyG8NAalZJlWqR48Rs+85Ibo4AYJvThUJpAhZu8fO3AeE
	fZ2XzsyzrY9x6ePIvKpdwwyn+h5seEsE0ncrdQ5mFUVmUfTW6Sq1fm3ravRTvAdxEBduQBWpD9F
	M+TU6q1nh6o0snVvxoKSML7Da2ln/oaQDOiO5QxO41U5k6cISQ+kEHWn9jEKWazHVpZ+qbNP5OD
	MbopBO1M3D5CxJ7WzaThCCzne3ipUzEc5YHB79pAuaaVpl5hKvryczkurYL8ISXq8rLnXhVBmU6
	cLpRycYOQQjcsTeA6cw==
X-Received: by 2002:a05:620a:c55:b0:7e6:2435:b6a4 with SMTP id af79cd13be357-7e66d755f00mr45985a.12.1753796303756;
        Tue, 29 Jul 2025 06:38:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKI4hIaiKAmbCU3iCvheBP2tvLlX/4n/EHL9QP1TiceX3J3baQPxmSmT4BEC5BFoqWNGF/sA==
X-Received: by 2002:a05:620a:c55:b0:7e6:2435:b6a4 with SMTP id af79cd13be357-7e66d755f00mr44585a.12.1753796303257;
        Tue, 29 Jul 2025 06:38:23 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af63586008dsm591768266b.16.2025.07.29.06.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 06:38:22 -0700 (PDT)
Message-ID: <3802c3a3-9774-4bcd-8819-41e5395df18e@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 15:38:20 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
 bindings
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723103644.4058213-1-pankaj.patil@oss.qualcomm.com>
 <20250723103644.4058213-2-pankaj.patil@oss.qualcomm.com>
 <70277682-94e7-4905-823d-25ae76f72ee2@oss.qualcomm.com>
 <790fd85b-fb24-4d44-bdb1-706c534d1da5@oss.qualcomm.com>
 <d37879af-a1fc-41d4-8e31-2abba6fd6d57@oss.qualcomm.com>
 <d31c5e0f-dc50-4e7b-bd81-256269c82ec3@oss.qualcomm.com>
 <0aa2b07d-8c66-456d-aacd-c554bfa7664f@oss.qualcomm.com>
 <e3d04cf8-6d9c-4514-9d8f-782e2d1505a7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e3d04cf8-6d9c-4514-9d8f-782e2d1505a7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6888ced0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=_xSS5P9aWiV-_plMCQ4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: eEylX6w_HHTgE1veVuU25ZnyrOZ3drLx
X-Proofpoint-GUID: eEylX6w_HHTgE1veVuU25ZnyrOZ3drLx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwNCBTYWx0ZWRfXy9tH85FP7LW3
 3ZbToQmKRCyEzD6G1xQYEdiAIlRoX6lBb/nWeZtgPygT4GzHYaiNEsDCj3S40FwCF2OH8Al91zs
 HNlUAGPJogmKYrL5MUUGLxTPzBkvufJpBgYrFlhRR+9RbvYc/wTzUGFVyX6tV8crmh8j/984EAi
 SWpuB8Ab393E3/HN2aiCaQl39fFacVQ8oQqZekDjTgh9zAd1I7UnBMbZp2X3kNHohhvKJ1Ru7e+
 f/zjWUA18CC4f09EbiRXNK0CNmYVjLzEXgOc/ILhTQ6gQUtzUNWkp4tM9Cl0uOY65PQ98tbkvKA
 Xg2da5HLuVHYUcavZ7E4X4g+NqPb7LwOkAqdiEoZc0KhE0fHJieYgoV6NI+ArakLHUVlZjrac85
 POvmOnxmgJeKh1dCRblW/Oi2XzrJo9GZqrrDQeb2/09ep6EvmnTlskIrgQg+V8ZVxHgSulC3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=916
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290104

On 7/23/25 3:06 PM, Pankaj Patil wrote:
> On 7/23/2025 6:23 PM, Konrad Dybcio wrote:
>> On 7/23/25 2:07 PM, Pankaj Patil wrote:
>>> On 7/23/2025 5:25 PM, Konrad Dybcio wrote:
>>>> On 7/23/25 1:48 PM, Pankaj Patil wrote:
>>>>> On 7/23/2025 5:10 PM, Konrad Dybcio wrote:
>>>>>> On 7/23/25 12:36 PM, Pankaj Patil wrote:
>>>>>>> Add DeviceTree binding for Glymur SoC TLMM block
>>>>>>>
>>>>>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>>>>>> ---
>>>>>> [...]
>>>>>>
>>>>>>> +      function:
>>>>>>> +        description:
>>>>>>> +          Specify the alternative function to be configured for the specified
>>>>>>> +          pins.
>>>>>>> +        enum: [ gpio, RESOUT_GPIO_N, aoss_cti, asc_cci, atest_char, atest_usb,
>>>>>> Any reason for           /\ to be uppercase?
>>>>>>
>>>>>> Konrad
>>>>>>
>>>>> glymur_functions enum members fetched from ipcat,
>>>>> this does not exist for sm8750.
>>>> I'll repeat my question
>>>>
>>>> Konrad
>>> It's in uppercase because of the way it's in the driver,
>>> I'll update only the bindings to lowercase and repost.
>> No, the driver must obey to bindings. That's what they're for.
>>
>> This value is only used between the OS and DT, so it doesn't matter if
>> the docs refer to it in uppercase, so long as you keep both in sync.
>>
>> Konrad
> Okay,
> Yes both driver and bindings are in sync.

Please make then synchronously lowercase then :)

Konrad

