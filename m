Return-Path: <linux-gpio+bounces-28551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F08E2C61A1D
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 19:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E7173B4D3C
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 18:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F78830FC34;
	Sun, 16 Nov 2025 18:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="byFohBZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P6MHOzv9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26C230C63A
	for <linux-gpio@vger.kernel.org>; Sun, 16 Nov 2025 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763316609; cv=none; b=eAZ814vUfo6ie61Cr7htxWLOS2dagFPZqtyx9G+aVeN5wwnjLNoqTmUM/4oMZMir4pMaiKp6M0FCzasOJFs1QPLgf41xhXZPCToK7BqMzjYUFKKj6vh2JciAglgZlwJasr4NdoizRW6f0Nm/BfdpP7IY6LywAQbrPmbht2/14y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763316609; c=relaxed/simple;
	bh=gtQCaa+YL3Rb2sSsLYceCTUBmA0UzM8vScQKA3MoiNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AcFVniJT/gokrZ5bdyf+w68+VvuJ1TQnt/KB1apjx03PXBhbOpEv9e3qqKXiN6AVIJZ5cnoXLIT5hKciMNa+AolZJPgphRlk4vkG1LeLpEEQzVt13++7uhr2QAOeWPMUI4XMs7jBrB4L6TShvQAiWmc+vi8mj759r2cfdgS+yms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=byFohBZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P6MHOzv9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGDUVIi1195559
	for <linux-gpio@vger.kernel.org>; Sun, 16 Nov 2025 18:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssdPD/pRCCYUvju2hSBh8g3CDRExeSqd56iLxlTVNu8=; b=byFohBZUKqPQA3hG
	D1DkU3kNULp+KsLPmf6GxtjSCEx+yfCAFAt0heV/Oddy0502NpQyDJUs5magM5A3
	aWB2HLNR87YffK9El5QelZCXMZMNobDDbAbjoX14qh8XIb1LpAG1fLxDgnYq3iih
	9iNehlapb23OyfLuMPU0aYMBb+QeESPHKUhwCdpesXwF3pfI8UZOhD3CbiQbWE75
	fqZ3SZ4Fq9vU/sGbP0Hbiq2/7dJT5GBwwqVop5owQnM4UpHUbpcTKnz5bEIYkFz9
	63NLShQeY5xohjmxWjXie30gj7RjgM68JVNzpxCrROP1ApTAkKKIlSFknt7+GMv2
	OIwZPw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh02fj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 16 Nov 2025 18:10:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-298389232c4so47443325ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Nov 2025 10:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763316606; x=1763921406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssdPD/pRCCYUvju2hSBh8g3CDRExeSqd56iLxlTVNu8=;
        b=P6MHOzv9C8oA1wIpSpdO/a35MtjLBxK2eRA3jhX/PqaWGHL1geAfay1BkwGurEPu9D
         o5dtY54MBVxpS5KWypKmEfWpiewSneVsGJEbvAMvJf6xJ1zgEDJcdilm+ZiMrkni+yIs
         8tFMBcJbEh6BZObQXMO/WDdVNjW2SHY0wpI3rhIXjsQ07WcOyxE3qoFo/Zc55v4SSt8M
         9MdtuE/rzNnqyA/0pfIpFOk2kbp9j6Y4pVRTwF/WY3PuLrXxVQugV06+NgIfqrVSMm2i
         kOixNYWUmw1OnXQjclH8Z2xX3n+5bsuVS3qs7FLkZbViijTY0yIzKzhgBYr4HvjHLz11
         QtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763316606; x=1763921406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssdPD/pRCCYUvju2hSBh8g3CDRExeSqd56iLxlTVNu8=;
        b=kAmDEqUL7c72kAIpWv87mxh0eugLzE3ZrhDtA+RexDQt5O6bBHp4g2tEFPSeHtt4ZR
         ytFmaIaJNzTeV3HGG2p5cHHrvtQePiUXuyWwiguQD6sY7sIOEc9kpFPpSZnsqkvOUqzX
         WljEgyn+nLTpi3so8Eiahl70wSaapbA129QF4PUqdhT5Yv5HHnmDh4Cps2FYRMkdlyD/
         KqeVMTU/nLsdPzovGZJ9sbxXHWsioCNjY1q9myPD0RV0HiGzr0SVo+Wl8IsDz3PlsLGB
         zLPcT3eE0AueulVydKJAyiZWScRHe3arKi7VKluw92huUHceDgenGvQb+hsJkdNytSx6
         iE2g==
X-Forwarded-Encrypted: i=1; AJvYcCW/xAXKVJkmrepu9rfPoB0KnCb6NhfE5IRNwtLFdAA7lTWYKQ1+sY3hApwfVeKnczKAGE9cnp4wjD8+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7I++aPpJhkwUqrjOMZPLbAsAHyZtGylEsNUbTnq/2qZJVS1D6
	E1gjje6aI1OJnKN3c8VJfBsAAo2KnWX30ODpLInrkmhUO8HLJ6eiNS49KODUPmiFCuG0KZp2Ail
	4p0cdjK+aRhJGrC5dWZH8Xr7m7SDia0++J13kGx9KnEp73+Fv82ahRnYogJOtoZid
X-Gm-Gg: ASbGnctSeeeCr0fYbfQSxyiJFbUgP/HujCoGPabfJX2zVtJXIbxM9f6IgSkjhHSZ+XJ
	sG5F1KTf5F1n6xbzoQ9WYlgHk1eosvJYiih1Gcok+kTDSh5kWUU1Hl9v0+upVMqv1mgXBGJaiNX
	/iSVLspaGM6AoBfn7/oCevKBrmDQ04/TWYKfLoFH+ZFZ4xlkZE49l+nc6hl859ofI6ZoHJiF0K/
	adG/t4e1EnlGPoucPOSpDcUlHITd4gGmbZx7cGEbMgtT0G1Bmk8sQuSFglCyhG5bRiwZ4KVr3Cw
	8a5Qg9jTROrPJHhcR42VcYXG8zfMoS6hBPen5wrdZ2NrRZW9dVp5lsa+PrXU6StVP+qFxSKPvK8
	gQBdLR0rA9xPo5C9FsLkzz7Hcr8wfqJ++jxai
X-Received: by 2002:a17:902:f689:b0:27e:f018:d2fb with SMTP id d9443c01a7336-2986a6abddbmr115736385ad.6.1763316605729;
        Sun, 16 Nov 2025 10:10:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERElmHrN3tbuB7WCbhsflqXegHPN5MCWNH2hRx/+rsV5gFlToIcgnXNLQx+7FORvo8XQKzEA==
X-Received: by 2002:a17:902:f689:b0:27e:f018:d2fb with SMTP id d9443c01a7336-2986a6abddbmr115736015ad.6.1763316605258;
        Sun, 16 Nov 2025 10:10:05 -0800 (PST)
Received: from [192.168.1.5] ([223.230.65.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c24a5fdsm115475935ad.43.2025.11.16.10.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 10:10:04 -0800 (PST)
Message-ID: <ab5cec4e-a990-460e-a4cf-605028f9ea77@oss.qualcomm.com>
Date: Sun, 16 Nov 2025 23:39:58 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl:
 qcom,sa8775p-lpass-lpi-pinctrl: Add SA8775P LPASS pinctrl
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        ravi.hothi@oss.qualcomm.com
References: <20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20251116171656.3105461-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <5e48ad7f-6de3-438f-8623-8f8a9c8dedbc@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <5e48ad7f-6de3-438f-8623-8f8a9c8dedbc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=691a137e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=kzaXOApHt4F6fez/6+LNzg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Ynku4ptAPTcfh0RwKpgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: pr41qtUd8qy9KXAHvegCQ9x82gXFZdFf
X-Proofpoint-ORIG-GUID: pr41qtUd8qy9KXAHvegCQ9x82gXFZdFf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDE1MSBTYWx0ZWRfX0sO2d01T9pxd
 g2teU8n/cbWW2c2Wu865sI92uQtRJAy5tzHLcGPgu/2KFdvpxuJqOu6Ycw2LbqXa+B9gTM2U3Xw
 jVI/5YGd6KuJzmKNokMNyI8FFPWUVYYJLWz/UJB3DnneJ2jLQvtzP0Di+0xqS3pRewlTFlg6zM6
 bKkT2TD2CaHvg981lKj4WAgdeUH/KHS8/23zKDbOCj9ood631h80X1ySATX/uLvuFYejEuLss6B
 ErF1/Nh4vWMf1GTXDkJ1hVEaq47k76U/jSAzHaLY7VdS1gsDOaCGiJOuu9rCKCjFJFE7+m1Q324
 s6DD0H5KwV228S87q6e/GZF9LyW4t0A1EHBxvOyRjzbqsjfTwTdne8N3EWvmL0oYCCe29K3i/xC
 /AQn1Ad2EUYyUTS5p2SBCDo2cFkA8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160151



On 11/16/2025 10:59 PM, Krzysztof Kozlowski wrote:
> On 16/11/2025 18:16, Mohammad Rafi Shaik wrote:
>> Add bindings for the pin controller in Low Power Audio SubSystem (LPASS)
>> of Qualcomm SA8775P SoC.
> 
> 
> ...
> 
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>> +
>> +    lpass_tlmm: pinctrl@3440000 {
>> +        compatible = "qcom,sa8775p-lpass-lpi-pinctrl";
>> +        reg = <0x0 0x03440000 0x0 0x20000>;
> 
> 
> Are you sure you tested this file? I think this should nicely fail.
> 

ACK,

You’re right — DT binding check is failing.

My DT binding check didn’t catch it because the schema wasn’t updated.

After updating the DT schema, I can see the error now.

I’ll fix this in the next version.

Thanks for pointing it out!

Regards,
Rafi.



> Best regards,
> Krzysztof


