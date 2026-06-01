Return-Path: <linux-gpio+bounces-37739-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KpMLAQSHWrLVQkAu9opvQ
	(envelope-from <linux-gpio+bounces-37739-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 07:00:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 463336198E1
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 07:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79A6D301DBAC
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 05:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5750A2737E0;
	Mon,  1 Jun 2026 05:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVMXca/g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xp1JFEsB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD04E30677D
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2026 05:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780290028; cv=none; b=WvNiGueATIk5PkWu4Qy7icWAiq01oQP/NuzjvVyV9bsWaYsmRBPxEDDTsxxHrViPrAj7IZFER8HRGqlSzwGIhqYLefu6WXTpzrmqjokLOMtsMAPirBJWk3lOJAEjmdi18wLPG9HQd+rmu1ojgHQbUE8gRowmwgtHgb8U8N3qQIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780290028; c=relaxed/simple;
	bh=ug4iZG3DBQRIsEmP09XeLOwfiOfE4JIhtUb0GN3srg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HN0tgkqVxnITlNb8dOe7oAj4n9dJnXLp6i4MdBZ/fy165wTJn+8QIrBidUeV+FUwLSNlN8khSpxVGwGxS3NkH1JHwl0FwRZKJlg54I3SfpfEKVwOhFyNSxuMD+ZKHgsiBpV1gR+RvF6ogCIZHYkcLavbVpskWKyqr7F/F+jvNEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVMXca/g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xp1JFEsB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VHJ6Hb2173952
	for <linux-gpio@vger.kernel.org>; Mon, 1 Jun 2026 05:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L+ECELM/2EfAespls9MjkwYM/yAnjOkOfePZc4bASiM=; b=bVMXca/gSjeC2d/m
	Yq62wyC6vUDiRo0zHlnx+JfIQL4Hf9AE9bxbOZaTLAK++3mFfEfVj9EzxKpr3fod
	bA6Ta3LhUDCI+3VTRrpoNZXENsIpfXyfIo2Cj+CWh8ZLLk+6MW8Wj1I6/Rr75kDC
	te+f0h3o+M/zF75g+D9pVstldGe1VqLzSxukPxPXF0q1Gl+ciCrkpHcGlmsZ7TGy
	52vqVihyD3yHbcTOVFtTgAMPmoqMCtMOjO5g31kSaTnWxlebH4QpSP125BIVPhlb
	s/VpXSrrhiKuapPsKdYR9N6SZyXX6HvnVb0aRiEzvJdCR7NC0HMAuQwPmLl/GDQb
	BKCE+w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efxy7vypv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 05:00:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b9106b0fbso2586040a91.0
        for <linux-gpio@vger.kernel.org>; Sun, 31 May 2026 22:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780290025; x=1780894825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L+ECELM/2EfAespls9MjkwYM/yAnjOkOfePZc4bASiM=;
        b=Xp1JFEsB2R8SrrY2bJ0As8aejhRAo8CZeuooaQ11zDujXU0YEeLejThgOiNkqaRO2D
         GaMlg61k3iQMip2uCsXZ4ZEgVIgfgfV0Xnko596MwlrtIG7H/FJi0y5tOv9BHxUwPGcx
         oLWibOnyfIO0EgD5woahr/96+F2Wfr6gpr1lTuLtBpK8OqMcDqEavmu450YkmY4BDd1R
         /fcD2obYccoNbwrqCWS1qwA+BuP/qSc9mEdjN+ztToMDimSDojZ5+ZHW+LFBzBB1NU9k
         1rCmzQIx6rbudWgprf0yP0k2UVKGOX7GxnNBpBjs68wWr2SqbFj1voyANnR6OKr0iaTO
         dSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780290025; x=1780894825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+ECELM/2EfAespls9MjkwYM/yAnjOkOfePZc4bASiM=;
        b=pOMHMo72KQeiRhlIWC4lkPcYcZK7PyStJwyU1J50vcnq7JBl8fVyjAWotVOV7RYOtf
         USFjxWzd79Kj2dI9H7IqxzOL8MjfDsg3G/2cT4pB31ey76Pdd3HJOYIYnCs20NByoHmZ
         y0Kz2UaRbDjvWToe21afXiIHrYXrQ1ehMztErLC/7OZ+RPMTTEgpUdUik2QnqCNEx+Mc
         /YxlxJaAvCD0d3jgzrT2kKPtplWriGYZmdy/i0MTG/WAxK8tC1k/iDz/pl6dplBBjxEl
         7wr5Gwf+qJ/ZY9Yc48iv37o8JI4cA31oZknR5yPReVP/lU5mD9BqBlkyEPSiAYhMy5YH
         Vb3g==
X-Forwarded-Encrypted: i=1; AFNElJ9cqHAkF0Rn6NRsouoJDGsdpkghdgfIu9m97olA7uR2/o7LO0maY8aKhsz/roWuGZ5TCrzuC08NdzLV@vger.kernel.org
X-Gm-Message-State: AOJu0YyrBg5Qane/sJc+gaGewxRZgVhk44om2D3tKBIiSLDqier8qExo
	/WUo2meAwFzD7m87zklYFisjowD9EQ6Qfd90IFBlr0LpORJ1VFsBC7c/Jts47Bplsp/WbgrGLyD
	AZRdDoJSWZfAHSUpw7iiCO4QWi4Ht6a/jC14sPHZeb65kUE6YzJl68A7jkqPu9hPG
X-Gm-Gg: Acq92OH5ezE+tm0tttW6UOgA3h12gtZpZzbayY7w9ocmuLqf0xWDRl+k7kmij1wrotN
	lROR01XgsE8+kFoSGbXTMEjs6FyhawcrxRCEVnPAvS24vvF7ZkZozEGIKetSqcuRnZtqZL1bjoa
	64YrNEtnxJH3CI1S2UfGaLtrUFe8lybPyhci6Iyoi7/9xNEhwz0uYBcWXa8jGcT5i3r+T7yC8jN
	ZgAsaRm9I0M338uFAq+HHCEI2n+c6L+J93tSkmIMaUdDo5ruFcchu83jjwd3PG/TyToqVLKD2x/
	muh442Rs1imCXhGTLjQOMWQIY78zkZsWMPQzKVv32jldWdYgu/78GbuDnwfQMFzAt3kGkEywhA0
	ENqmMzWAo76rXMrTE3BFRDtfFd70gLeQIa8KfkOv++hhqGjuPDQDvYr4J1w==
X-Received: by 2002:a17:90b:1d51:b0:368:3830:a8bd with SMTP id 98e67ed59e1d1-36bbe0b5b21mr10537332a91.7.1780290020464;
        Sun, 31 May 2026 22:00:20 -0700 (PDT)
X-Received: by 2002:a17:90b:1d51:b0:368:3830:a8bd with SMTP id 98e67ed59e1d1-36bbe0b5b21mr10537229a91.7.1780290019308;
        Sun, 31 May 2026 22:00:19 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c857729930esm8606486a12.16.2026.05.31.22.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:00:18 -0700 (PDT)
Message-ID: <158920bf-3b52-4772-9305-18afcd5807e3@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 13:00:12 +0800
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
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260530-thankful-maroon-boar-be86f8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POg/P/qC c=1 sm=1 tr=0 ts=6a1d11ea cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gdqNYIvkPTOCW3xLoh8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA0NiBTYWx0ZWRfX307sjkrh1V4F
 BUGUMEmzeKs86cOW9fXR5u0I+EPyz6kbnnlK8M7SDGD2CfHdB+KZRB/xvwOjBlQh4OreLPrv3lb
 abBJ/20UZ8pkWTVg16ISXJOQfPV8/QrN8c5GyK8voZd3GXQLiX8BqpYRz3aXBOpV4RxP2q/LQHq
 ppoV9gSUD6Dp9weuiPlM+v1E4hfNjIVXNlwjGY8bJl2Jh5XHrGHq/Q76bVrC2pDXVUXhTHj+Vkk
 nHtOJ7oQUb+vFrYkityDKS+DWPcE27BdaSFD9QBJPJq1RhghINe3XMztqHPuUJbuDMqYhLqT2Xi
 rUiMEb8osKzFMgoVRRGbC74Esou21skEAKHGq0QNIOw5YBm81cb3i/mzhCQCmdIIh+KYgW4bRAr
 H1Y4L+COCbVH774gx50WNKeMhjsnmQ2akPDegHjDev9Tk7a1alMXLEQsA+GiVHYUsD0F/4SAv8E
 Ayb8pAfKrxY7Xs0zvtA==
X-Proofpoint-ORIG-GUID: I91cK6DxXPxho4vgiKq1spuHZCD_Xj2h
X-Proofpoint-GUID: I91cK6DxXPxho4vgiKq1spuHZCD_Xj2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010046
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-37739-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 463336198E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/30/2026 6:29 PM, Krzysztof Kozlowski wrote:
> On Thu, May 28, 2026 at 06:05:36PM -0700, Fenglin Wu wrote:
>> Add the "level-shifter" function and add the required DT properties to
>> allow RPMh firmware to control the level-shifter. Introduce a custom
>> pinconf parameter "qcom,1p2v-1p8v-ls-en" for enabling or disabling the
>> level-shifter function.
> I don't get how PMIC, which is not a child of RPMh at all or not
> talking with RPMh RSC, needs to configure its pin via RPMh. It feels it
> is misrepresented.

The control for enabling or disabling the bi-directional level shifter 
has been centralized in AOP, similar to how regulator resources are 
managed. This allows it to be used on a serial bus shared by multiple 
clients from different subsystems. Each subsystem can vote for its 
enable state through RPMh commands, and AOP determines the final status 
to turn the BIDIR_LVL_SHIFTER PMIC modules on or off. Additionally, each 
bi-directional level shifter shares its physical pins with a pair of 
PMIC GPIO modules and is mutually exclusive with other PMIC GPIO 
functions, which means those PMIC GPIO functions must be disabled.

For these reasons, adding bi-directional level shifter software support 
to the pinctrl-spmi-gpio driver is considered the best approach. Let me 
know if you have a better suggestion.

>> Additionally, add the "groups" property with the allowed group names
>> that can be used to control the level-shifter function on pmh0101.
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 66 +++++++++++++++++++++-
>>   include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  1 +
>>   2 files changed, 64 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>> index b8109e6c2a10..19dc61ddff2d 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>> @@ -119,6 +119,21 @@ properties:
>>         The first cell will be used to define gpio number and the
>>         second denotes the flags for this gpio
>>   
>> +  qcom,rpmh:
>> +    description:
>> +      Phandle to the RPMh controller device. Required for PMICs when the
>> +      bidirectional level shifters is used (e.g., pmh0101), to enable
>> +      communication with RPMh firmware for level shifter control.
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  qcom,pmic-id:
>> +    description:
>> +      The ID of the PMIC which supports bidirectional level shifter function.
>> +      It is used as the RPMh resource name suffix to request control of the
>> +      level shifter to the RPMh firmware.
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    pattern: "^[A-N]_E[0-3]+$"
> You do not get instance IDs (it's explcitly documented in docs).

Okay. This is primarily for creating the resource names used to obtain 
the rpmh addresses from the cmd-db for the level-shifter.

I can change it to a different name if you still agree to add the 
support in the pinctrl driver.

>> +
>>   additionalProperties: false
>>   
>>   required:
>> @@ -330,6 +345,22 @@ allOf:
>>             contains:
>>               enum:
>>                 - qcom,pmh0101-gpio
>> +    then:
>> +      properties:
>> +        gpio-line-names:
>> +          minItems: 18
>> +          maxItems: 18
>> +        gpio-reserved-ranges:
>> +          minItems: 1
>> +          maxItems: 9
>> +        qcom,rpmh: true
>> +        qcom,pmic-id: true
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>>                 - qcom,pmih0108-gpio
>>       then:
>>         properties:
>> @@ -523,6 +554,19 @@ $defs:
>>           items:
>>             pattern: '^gpio([0-9]+)$'
>>   
>> +      groups:
>> +        $ref: /schemas/types.yaml#/definitions/string-array
>> +        description:
>> +          List of GPIO groups to apply properties to. Only valid for
>> +          function "level-shifter" on pmh0101. Valid groups are
>> +          gpio11, gpio12; gpio13, gpio14; gpio15, gpio16; gpio17, gpio18.
>> +        items:
>> +          enum:
>> +            - gpio11, gpio12
>> +            - gpio13, gpio14
>> +            - gpio15, gpio16
>> +            - gpio17, gpio18
>> +
>>         function:
>>           items:
>>             - enum:
>> @@ -536,6 +580,7 @@ $defs:
>>                 - dtest4
>>                 - func3  # supported by LV/MV GPIO subtypes
>>                 - func4  # supported by LV/MV GPIO subtypes
>> +              - level-shifter  # supported only by pmh0101
>>   
>>         bias-disable: true
>>         bias-pull-down: true
>> @@ -592,9 +637,24 @@ $defs:
>>             configured as digital input.
>>           enum: [1, 2, 3, 4]
>>   
>> -    required:
>> -      - pins
>> -      - function
>> +      qcom,1p2v-1p8v-ls-en:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          Enable or disable the bidirectional 1.2V/1.8V level shifter
>> +          associated with the specified GPIO group. When set to 1, an RPMh
>> +          vote is sent to AOP to enable the level shifter. When set to 0,
>> +          the vote is withdrawn. Only valid when function is "level-shifter"
>> +          and groups is a level-shifter GPIO pair (e.g., "gpio11, gpio12"
>> +          on pmh0101).
> And there are no generic pinconf properties defining the voltage?

The 1.2V and 1.8V voltages on each side of the bidirectional level 
shifter are not configurable. They are fixed in the hardware with 
built-in reference voltages at each side of the pins. I am adding this 
custom pinconf parameter mainly to control its enabling status. Also, I 
am adding "1p2v-1p8v" in the parameter name to provide additional 
clarity for users about the "level-shifter" function.

>
> Best regards,
> Krzysztof
>

