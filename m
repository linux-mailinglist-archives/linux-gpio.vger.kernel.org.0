Return-Path: <linux-gpio+bounces-37778-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIIkHemDHmqhkQkAu9opvQ
	(envelope-from <linux-gpio+bounces-37778-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:19:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD187629801
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 798A03097EA0
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 07:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849123A9861;
	Tue,  2 Jun 2026 07:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="POZ9TU+b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jR4r1p8d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8087B3AA195
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 07:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384489; cv=none; b=uAKpAC328U2/B+PWaPzJ9DM3RqFM/wAR05TjsBtijp4gpcbgbcbOQDD6Crp88tvBA710I+qeMH1pPsBzWeRXXHBiBa2i+S3sYweXpM++qitrsLJqMl8z/LcjIlcMNjIU7y6KDEHNUPaogUfoLlr3gQivJrgvzDit+3y6O8Itin8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384489; c=relaxed/simple;
	bh=/j3tUE96SWNcssK1W0+tgZ3yAQFjlQnsP+UqszEXnBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuQOg8cMmhdbjVpD2KoadpPiThGPmYvHf1ul8KcgPQWMmgfEQU2lwNW5jk2/yrnKvHLZJz9MQG+zT0jyuKizWhgZsnVxgNENWdvPEBeqeMGteRdNjQVPi1GxJGHz/urPjt89HO2FTLR9TJbQV0KHFUqeihRXF9ZlfzihcZws5JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=POZ9TU+b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jR4r1p8d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tYCa4012459
	for <linux-gpio@vger.kernel.org>; Tue, 2 Jun 2026 07:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qvCpwazJQ2nTUZ1sqyJxYIEvDZyEIgujJHDTUjeRRd4=; b=POZ9TU+bSG7DH6qN
	Bx/hryOXvWFFiU4vS7/jC7v3mAYKIl6csb3Vu4MOTmosABCXLuEtcYgZWKWejJpG
	4ygErMorQiLbXmtd7Z7oU+TnfJBn5bochf2RJLp7KMj6Pu0VN9S9TdP5yjQPI5/g
	dNbfobI9I+BdMFNiW7YMN1UfEQzm9mta1nb9sCpjKOeCVPeTW3OLFXomDD/DTwm0
	PnZFA+7ryGl8FFbD8oEjSIazHMn73+FSwqK71vL+5OQeWHzbwGLvQZo5Og/XANrU
	TCW47cuE0EdnnrfDDK8ZOyNPnAcZsbDK5/Z1obRiu5437DpOc9Xqn5gmhU4P4c6L
	VzEhYg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4ga4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 07:14:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b9d265308so3877801a91.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 00:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780384483; x=1780989283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qvCpwazJQ2nTUZ1sqyJxYIEvDZyEIgujJHDTUjeRRd4=;
        b=jR4r1p8dHqvrRXARvCya/U1QwKkJEcAcPoCQ3/RdosKO6+I97SIUEsC2w84RgP5+bq
         A617gqDi7uwmXq8AUDsMCtoDwxChgzH8KFhhls03xHfDb8ZGikSQ2pHn5FbVoh4War0i
         9UwDEbVl/UDCp06mgrggPOIrD7k4l618ojPOBsZjlft95WfDCP7FQ8R9icRZ/wvkee9O
         vCL/yhHNFnyZucOa8uwevctCUmvZO8W+PHNbbvjRGC8x4IP40fLDUu0Y/cw5nF/xvlWs
         tswnMVMCEQS/I0R1HpiAmiTRCeSFu2iPtVD1Sq9TGaVvgwLB4gkh7nOzLJmBp/zlkwpr
         ciXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384483; x=1780989283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qvCpwazJQ2nTUZ1sqyJxYIEvDZyEIgujJHDTUjeRRd4=;
        b=R9xPCw+aC3z+qZ9mMlT2fiyJWEHOurQLlb8hkstlOQpTEBmwrbfDneMpDOwIYaogpP
         6Tdel+vy9fls3t0NV7zwpVl49lJc6EkpkNrSH/JnxeVs7q9jV90lhinJ+UHWtBsebpmg
         yyrb3bOPjWgK3VsHUl8uzroOovMfEFnYWm225eYlIxbRImZJQVkzCZYr5+xqtmVoupG7
         uBewioO6v9Ws9Q+mHfj3R/nJw4HkIjQCHY0dUkPwmKAoT/krzpITKXqwhu+S5aM5s/Kl
         MYja8v+ezvTHGM3ukW2hB5ntA9FyssgkcNSeI6dAxyU7rvr8zKujQi7U2Cu2UOT5lgpJ
         kDYg==
X-Forwarded-Encrypted: i=1; AFNElJ8L7KJPLUAXCpMOP5s/FKkX1qtQSzYCOkVusXkx9Jkbb/6hU/2EKRLeF66emkFpkG6I1psdlsN+99WS@vger.kernel.org
X-Gm-Message-State: AOJu0YxnjODRShz8UXh8RwnjM4YY7HCuHT3BbGSSSNU2JrIBL5uJwHGL
	gmbFDSRQe5kdSPw3EMhRgoCjzxJ+J7hh9hXHLkRskemd/ROcPaiQdENquK4Zx9WqNEFzxCyMUII
	7PBrVKRyK72X9A3vQPNQ69KqsVsXxw04U4KgslvOth4OUVyXoZQVGF4SjB1KZDn2X
X-Gm-Gg: Acq92OEAlSZgLjhexBP6qjtRmGWCgNQcIRuw+XPC1wC6sj/R3uYovhfHckhXEVJ4J/C
	H5gTJ79fXbBA55LP02UqcYDOqxaA7z3dZrn1jdhqj9lRbf+8DpEwISlaJKGhmwUiCPX2rgBFQap
	/IHT5thiWP+no1qh7by6DBBKlpCF04ZDcfK4oINt/E3a1feGzPsF1exiNRPeEpcX4baZU3ECE+O
	R7fUfjWdRxXRaa0rj3FK2jZd+5KexDJgJB1W4R5zLNWyxMA+bd1jwtBmEMLkIgTA1kzVX9//UQd
	rB6dao0jzhtF6rbEEpe8tgivRBrN5LZHfxGT76YTj7LOZIt16g+6XHnJBRAh8k+KLnHb+/FAKu/
	LFLkSJ4XxkT5lGPMybfE+V17u+rD/WI3dgjAkXZUbrWhepHhk6aWgCb+FGQ==
X-Received: by 2002:a17:90b:5286:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-36c59abd658mr14694345a91.19.1780384482762;
        Tue, 02 Jun 2026 00:14:42 -0700 (PDT)
X-Received: by 2002:a17:90b:5286:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-36c59abd658mr14694298a91.19.1780384482243;
        Tue, 02 Jun 2026 00:14:42 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm1892437a91.1.2026.06.02.00.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 00:14:41 -0700 (PDT)
Message-ID: <1972e522-018b-4a14-ad7f-53c5dfdc860a@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 15:14:34 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 level-shifter function
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-2-3a6a025392bf@oss.qualcomm.com>
 <20260530-thankful-maroon-boar-be86f8@quoll>
 <158920bf-3b52-4772-9305-18afcd5807e3@oss.qualcomm.com>
 <d764694f-0cb6-4488-8ee8-ec4ce658ebd4@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <d764694f-0cb6-4488-8ee8-ec4ce658ebd4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2NSBTYWx0ZWRfX1k2U6e62SDsb
 NRvFSivboWh0a7+wbCgp0c6/gTXkGQSI/ecZEnllJXANjlsTSrGUDvAB7k/FBli/KjxFZktGi+5
 tr5Uz/C6x9yvlcws4Wm/8nb7UFNu2ZFJR5u5lerFJpnqiP368F2kAbgO8w8vB98M61LfqgtNSKY
 Bm/isjVrwQzATJ0pRIGyVEHwp9mv0OZlVMLGs4+TmcnciVlu7SDZL6kzKTcBbmOywQE02nbUJWM
 wlfEFQSgV81dpu7I3YBMUHeN6MOC+0QFxLOQFAzirvcup0Ud5S/8QfmP0HRdZompFUi0/E5d8kr
 FEKIKg788cjWnYc4ZaNYAt4FOVUZfy+vL4JXg56zF+97YV+dB+5q0BpKpEmFcfB0BRe4unaeavc
 pkqll/MawoaMJWx16M7DV34hqf9UykletHb7utyVbA0nqZJSvK4cnQfa6uMwrXxwDz9caX3jrP1
 9UjwOW0hoNE+6LBENOg==
X-Proofpoint-GUID: QYVnRKuyzNV0bDkOis3325t0_lfsZwk3
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1e82e3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w2ocTiTeffrdLUDDFYsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: QYVnRKuyzNV0bDkOis3325t0_lfsZwk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020065
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-37778-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD187629801
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 6/1/2026 7:30 PM, Krzysztof Kozlowski wrote:
> On 01/06/2026 07:00, Fenglin Wu wrote:
>> On 5/30/2026 6:29 PM, Krzysztof Kozlowski wrote:
>>> On Thu, May 28, 2026 at 06:05:36PM -0700, Fenglin Wu wrote:
>>>> Add the "level-shifter" function and add the required DT properties to
>>>> allow RPMh firmware to control the level-shifter. Introduce a custom
>>>> pinconf parameter "qcom,1p2v-1p8v-ls-en" for enabling or disabling the
>>>> level-shifter function.
>>> I don't get how PMIC, which is not a child of RPMh at all or not
>>> talking with RPMh RSC, needs to configure its pin via RPMh. It feels it
>>> is misrepresented.
>> The control for enabling or disabling the bi-directional level shifter
>> has been centralized in AOP, similar to how regulator resources are
>> managed. This allows it to be used on a serial bus shared by multiple
>> clients from different subsystems. Each subsystem can vote for its
>> enable state through RPMh commands, and AOP determines the final status
>> to turn the BIDIR_LVL_SHIFTER PMIC modules on or off. Additionally, each
>> bi-directional level shifter shares its physical pins with a pair of
>> PMIC GPIO modules and is mutually exclusive with other PMIC GPIO
>> functions, which means those PMIC GPIO functions must be disabled.
> So two completely independent hardware devices - PMIC and RPMh -
> configure the same hardware - level shifter and pin function?

Yes if we consider level shifter as a mux function of the GPIO pairs.

>
>> For these reasons, adding bi-directional level shifter software support
>> to the pinctrl-spmi-gpio driver is considered the best approach. Let me
>> know if you have a better suggestion.
>>
>>>> Additionally, add the "groups" property with the allowed group names
>>>> that can be used to control the level-shifter function on pmh0101.
>>>>
>>>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 66 +++++++++++++++++++++-
>>>>    include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  1 +
>>>>    2 files changed, 64 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>>> index b8109e6c2a10..19dc61ddff2d 100644
>>>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>>> @@ -119,6 +119,21 @@ properties:
>>>>          The first cell will be used to define gpio number and the
>>>>          second denotes the flags for this gpio
>>>>    
>>>> +  qcom,rpmh:
>>>> +    description:
>>>> +      Phandle to the RPMh controller device. Required for PMICs when the
>>>> +      bidirectional level shifters is used (e.g., pmh0101), to enable
>>>> +      communication with RPMh firmware for level shifter control.
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +
>>>> +  qcom,pmic-id:
>>>> +    description:
>>>> +      The ID of the PMIC which supports bidirectional level shifter function.
>>>> +      It is used as the RPMh resource name suffix to request control of the
>>>> +      level shifter to the RPMh firmware.
>>>> +    $ref: /schemas/types.yaml#/definitions/string
>>>> +    pattern: "^[A-N]_E[0-3]+$"
>>> You do not get instance IDs (it's explcitly documented in docs).
>> Okay. This is primarily for creating the resource names used to obtain
>> the rpmh addresses from the cmd-db for the level-shifter.
>>
>> I can change it to a different name if you still agree to add the
>> support in the pinctrl driver.
> ID or name, same thing. Still not allowed.

Okay. Then I don't know how could the driver be able to get the rpmh 
address from the cmd-db.

Maybe just like what Dmitry suggested, register a separate, RPMh-based 
GPIO driver for those GPIOs associated with the level shifter function, 
would be a better approach?

Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue 
write commands - Dmitry Baryshkov 
<https://lore.kernel.org/linux-arm-msm/4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt/>

>
>>>> +
>>>>    additionalProperties: false
>>>>    
>>>>    required:
>>>> @@ -330,6 +345,22 @@ allOf:
>>>>              contains:
>>>>                enum:
>>>>                  - qcom,pmh0101-gpio
>>>> +    then:
>>>> +      properties:
>>>> +        gpio-line-names:
>>>> +          minItems: 18
>>>> +          maxItems: 18
>>>> +        gpio-reserved-ranges:
>>>> +          minItems: 1
>>>> +          maxItems: 9
>>>> +        qcom,rpmh: true
>>>> +        qcom,pmic-id: true
>>>> +
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>>                  - qcom,pmih0108-gpio
>>>>        then:
>>>>          properties:
>>>> @@ -523,6 +554,19 @@ $defs:
>>>>            items:
>>>>              pattern: '^gpio([0-9]+)$'
>>>>    
>>>> +      groups:
>>>> +        $ref: /schemas/types.yaml#/definitions/string-array
>>>> +        description:
>>>> +          List of GPIO groups to apply properties to. Only valid for
>>>> +          function "level-shifter" on pmh0101. Valid groups are
>>>> +          gpio11, gpio12; gpio13, gpio14; gpio15, gpio16; gpio17, gpio18.
>>>> +        items:
>>>> +          enum:
>>>> +            - gpio11, gpio12
>>>> +            - gpio13, gpio14
>>>> +            - gpio15, gpio16
>>>> +            - gpio17, gpio18
>>>> +
>>>>          function:
>>>>            items:
>>>>              - enum:
>>>> @@ -536,6 +580,7 @@ $defs:
>>>>                  - dtest4
>>>>                  - func3  # supported by LV/MV GPIO subtypes
>>>>                  - func4  # supported by LV/MV GPIO subtypes
>>>> +              - level-shifter  # supported only by pmh0101
>>>>    
>>>>          bias-disable: true
>>>>          bias-pull-down: true
>>>> @@ -592,9 +637,24 @@ $defs:
>>>>              configured as digital input.
>>>>            enum: [1, 2, 3, 4]
>>>>    
>>>> -    required:
>>>> -      - pins
>>>> -      - function
>>>> +      qcom,1p2v-1p8v-ls-en:
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>> +        description:
>>>> +          Enable or disable the bidirectional 1.2V/1.8V level shifter
>>>> +          associated with the specified GPIO group. When set to 1, an RPMh
>>>> +          vote is sent to AOP to enable the level shifter. When set to 0,
>>>> +          the vote is withdrawn. Only valid when function is "level-shifter"
>>>> +          and groups is a level-shifter GPIO pair (e.g., "gpio11, gpio12"
>>>> +          on pmh0101).
>>> And there are no generic pinconf properties defining the voltage?
>> The 1.2V and 1.8V voltages on each side of the bidirectional level
>> shifter are not configurable. They are fixed in the hardware with
>> built-in reference voltages at each side of the pins. I am adding this
>> custom pinconf parameter mainly to control its enabling status. Also, I
>> am adding "1p2v-1p8v" in the parameter name to provide additional
>> clarity for users about the "level-shifter" function.
> So there are or there are not?

There is not such generic pinconf parameter based what I saw here:

https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/tree/drivers/pinctrl/pinconf-generic.c#n173

>
> Best regards,
> Krzysztof

