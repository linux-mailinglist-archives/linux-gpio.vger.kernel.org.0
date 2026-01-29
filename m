Return-Path: <linux-gpio+bounces-31297-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC32B9NMe2n9DgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31297-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 13:04:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C798AFDC3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 13:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A505C3019FDC
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 12:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2D93876B1;
	Thu, 29 Jan 2026 12:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hg0gYMoP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S793OF0A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC7537FF72
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 12:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769688271; cv=none; b=LudlCuDRWJ6bpQb+x7Cq5D/UzkW4ujEWdpGP3t10N48s7Jc36XOTW9ZhUWV43jCz/cN/pkyXC6SvSWXEXVwfNFh/TNlr3PaYo1ChGop9CYY6YkNzydKq3JzczpVDDsUQ2y3tqIP8fnS4aBcphT5ZelKL2aAQ7MpS1U4bo1W+o2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769688271; c=relaxed/simple;
	bh=ohEkPql219VZK8RP+2tL4A6dFsp190JpCnuMrfygOwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JiJO7aVx+MM50blKA41N3mvhqyCRFwjaGjdAwshL8RmcJTa0quR06wk0cpdiBxIeCufKAIkMHcn0bIM+ul1rtxDi1iXrvDyfDNVgZB0Yei8LPJKHFfDanpXYm3Pk5WaluT5K/Uy0vfODJPYVg/7deOQqEQamJa1fhsw838k4Wuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hg0gYMoP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S793OF0A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TA2tfr2033395
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 12:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SL2nkAcLlmCCqZuSLSLfneU0UEPMFxPYDUsIHnqOJto=; b=Hg0gYMoPPhsVsPkZ
	5oU+PW9jBKO6uV+5wNus/VGr91lFrTzzZyPj8PTbhOjsMutHEMNk0o9Wt4dZWfQU
	1zO/UYhYCoL+F5CMIIlljgFSvYv67Yr8c2F40TgtFJar9Uhyr1AfsBQ4GI+ilInX
	nIohyAwq2k8ZFrJBTzi9WE966bmCkQ+JLsdYdY+zCoBAWNj8GzI83kZ7vylewVI7
	VgOINDUegI+x/MdN7Rzw1gUZFpaENGHNH2Nsg3o8ZkKeakduG09MXjUi2wLPBaho
	pgzEgFZtDRPDAENmzsudD8yepYl30f0gNJ4hJiHGUyJbvHOADO1dFD6zaklJ5J2R
	pfpgvw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byna7kgub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 12:04:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8946ebb51a0so3133186d6.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 04:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769688268; x=1770293068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SL2nkAcLlmCCqZuSLSLfneU0UEPMFxPYDUsIHnqOJto=;
        b=S793OF0A1UHrLc/a2/yv/97yl00DKbK7IMYWdzJ/AYOhKCPx3tC8aX5+ZNRIdsxQwt
         YTnXiNICCUijxi6h+jqGKtmr3fBR2IYKkZCtD5Y16PTQ7WvsQGtq54xtOLxbDZtn8AS3
         nGO7pNqGtjG78wzym2vMrPuocq54gDbPNKFjrtFRM8ohC8qf+QNqjuHkXrjrKcOJJc0E
         9oDUo/Kj3H0Mt/w2sfI1VmDTlv5sXSEortZ0O5YuIGo4KYiOQkfqZc2vnxIQtI2NOv0G
         X+cYO+u7vRW/V6ItAOdCFFl9pNYhZYISzp7yR4H0FISTGny5dFSb+QQXjqP9GJSEmRQ5
         pQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769688268; x=1770293068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SL2nkAcLlmCCqZuSLSLfneU0UEPMFxPYDUsIHnqOJto=;
        b=fzfgwRr3lP1QUDsjnjvEwRjwDB5XjNWTx6ZzVwfzO4j/byXWgNYc68BhBmSSzpi8MA
         JkJ8OGvl2OA3Sll8DBdEp/spJUtLx2gsOKlx30SEgSwu0Ame9v+ufewNivHaxmTcm4ca
         JPUuqecXVOjIqEKcVoXFHAJOtYmSVsDY1+ayG/EG6l2LjBHI3dNSQd63GQiWif0RoEzD
         B90E/TNJ/JUz3KQknW3aoan8OBRn89WxSFxV6TOvDiILxnP754tWigL9ArdRYXhDmHoh
         RL2HOpL5LSnA3jkcyICW/kMpRMunAyCLSlE2UrNVU9kMik+SPA7EAkmXMMCjwX56tBq5
         YAaA==
X-Forwarded-Encrypted: i=1; AJvYcCXPeqsyd6x/AhtJys5IW6MuXXC0hcx0T8LE3YIgpLeqywMHKP8HBDGJL7OT9Uir302pcPkzYp5aiUfp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6uQgF6P3/3cpT503/Xc6HjummfXFA6m60zcf4zbKZc4xTrX36
	OYqHHk6yBSo9lFR5ugYF7V5TnZqopAyQAMtX40zM0rk3pqmQSdxxCiAU/iZZ0cEGbnyHSg+2yer
	5H4bdXv0O2JuUUnoRSw1a4iB8RAy4oVmHUTtYTqcjv9nKT53mc8QNxxerWJr9p+z4
X-Gm-Gg: AZuq6aIEo9llQSnijeJL8wkoA1neytdEgBwtbtpiqChm3LgB69tMo68caQI3AFN77CJ
	zsRUBziWRj6s6zcW1AZTgdEDybqVOcycTofqBRWXludJs3mvVBMFwvAv/jd1gZeBozSNy7uv30Q
	ACF6yTeVSiCM4G1oirTt+/i093bm2OJIWsbRWkWljVHK5nfk6C6CbKo1EPAkHjVkSXjzBAn3nNf
	RbE7JhD0J/WbhB1HHWw3ZDwLqQjFA1r9dtYfAXrYe1+HcBYd2Z+32dBz7paz8YTpnfZ8GF8OFaV
	gAg9VKJXeOouzwxAzIo5p7fEh8e2L0N2b7ZZs67Y5iNDj2BhD0sWX/VkjWaz+BWZT7KLLI0EqAx
	z3Mbb99261CRcRHU2OIPcGPdbAYZLeUGMs9ssBZNXWqCacX/g093rnnzMtWsSgmEGUSU=
X-Received: by 2002:a05:6214:484a:b0:894:9d32:6160 with SMTP id 6a1803df08f44-894d7698176mr45530536d6.0.1769688267679;
        Thu, 29 Jan 2026 04:04:27 -0800 (PST)
X-Received: by 2002:a05:6214:484a:b0:894:9d32:6160 with SMTP id 6a1803df08f44-894d7698176mr45530206d6.0.1769688267159;
        Thu, 29 Jan 2026 04:04:27 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691d0asm2858193a12.18.2026.01.29.04.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 04:04:26 -0800 (PST)
Message-ID: <6244680d-f6c3-4aba-8e12-61093e51f76c@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 13:04:23 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Eliza Top Level
 Mode Multiplexer
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
 <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
 <20260128-hot-camel-of-acumen-eef9f2@quoll>
 <aizrc6xysfwzygdsfeuc2raccq7efmwg5bn6v33t2de6ugvzgi@z3ipf3i25ulf>
 <dc0b7245-de95-4db7-bf8f-815ba60d7adf@oss.qualcomm.com>
 <pdxrotmxjiebyj2gqx6buwupkydngxki6jgv4e6l6fmodzc5v2@yxky3civt3yz>
 <8360708d-5d82-4cbe-bf0c-31107ab07bac@oss.qualcomm.com>
 <p5rv7u5utnetlt2xvh6ixk2xvi74tdcurgwzrkxfuq7qa3m66u@m7u2ukr46n6j>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <p5rv7u5utnetlt2xvh6ixk2xvi74tdcurgwzrkxfuq7qa3m66u@m7u2ukr46n6j>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uQ9V80VfB5Mr2cKKki_1MXRHtzRCjysM
X-Authority-Analysis: v=2.4 cv=J72nLQnS c=1 sm=1 tr=0 ts=697b4ccc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3FHYLhF6MVEL7NXZVLYA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: uQ9V80VfB5Mr2cKKki_1MXRHtzRCjysM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA4MSBTYWx0ZWRfX1c9wdnDBYPfz
 lCCXcKW9WB2CpZ6lIWxZCK/xNpdfhYbxEkELQonJsSU4QiH/AV56FudAX0VABmIPZMDsKBl3K0u
 gOJndEtfEEhqMfbJdR95kd1UY2iez9OBM7jdvgwnm3o3vM2l7BQMYMqjsqiAKrTUyVKpazQqXNv
 xnOZsH94bfn1iJ2ygJqdRGPC8mgCtuYUlnWGQWRV+qVywAuyQApv5g4OxsZkx4LsLe3p2X5FSML
 C/4+uDF96126/ON0h8AoRPp8F8eyjGUZAiPkP/0h/UmUCOSqwfBiRjdWgCZw5Uxt0kFwwueqs/L
 JvKwQP0AeckDpDhpxXsKYPpbOAlImQOapk9czIlYQmlfuuqqPMRWVkq87YfvgiC9cDKXwisXI0m
 ooy1h4PYLg6qMB3R8jLaql4GExMtLnpQMSA08zR6iFLOYq0gRFj08p51VFxzYJEZPY7SBbn4b6W
 ejbeltFqvbORQuSQ8lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-31297-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C798AFDC3
X-Rspamd-Action: no action

On 1/29/26 12:12 PM, Abel Vesa wrote:
> On 26-01-29 11:45:59, Konrad Dybcio wrote:
>> On 1/29/26 11:41 AM, Abel Vesa wrote:
>>> On 26-01-29 11:34:07, Konrad Dybcio wrote:
>>>> On 1/28/26 6:22 PM, Abel Vesa wrote:
>>>>> On 26-01-28 12:38:32, Krzysztof Kozlowski wrote:
>>>>>> On Tue, Jan 27, 2026 at 05:47:36PM +0200, Abel Vesa wrote:
>>>>>>> Document the Top Level Mode Multiplexer on the Eliza Platform.
>>>>>>>
>>>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>>> +
>>>>>>> +  gpio-line-names:
>>>>>>> +    maxItems: 185
>>>>>>
>>>>>> 186, your first GPIO is 0 and last is 185.
>>>>>
>>>>> Actually it is 0 through 184. The 185 is ufs reset.
>>>>
>>>> The UFS reset also happens to be a GPIO..
>>>
>>> So the gpio-line-names should include the ufs reset,
>>> but the pattern not.
>>
>> Why not?
> 
> ufs reset cannot be configured as gpio, so why would it be part of the
> pattern?

It's certainly registered as a GPIO, as all users of UFSHC refer to it

> For the same reason, it cannot be part of the gpio-line-names either.

Since it's registered as a GPIO, why not?

Konrad

