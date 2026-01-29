Return-Path: <linux-gpio+bounces-31293-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMAAEV1Ce2n6CwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31293-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 12:19:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9553FAF8D8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 12:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 561983016EEF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F46385EFE;
	Thu, 29 Jan 2026 11:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ez6vu1DW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVo++lRi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53243815EF
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 11:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769685553; cv=none; b=OpfyFYASf61rxjlh90J+EiGlQtLaBwpbfC9hrl1WXnD+KkpO7FRWkfbcAyK4G2/ETMIntgnsr9MvqEv0eOoxBamqj24ySmPYInDPoUjc1wC2wPIMR9AlHuOIiPff7OaEh98hVZOvTpN26srwyvo3oqgV7hEU9C3/CupKgZ+UHng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769685553; c=relaxed/simple;
	bh=XZUI+1dfgfMKqsltluvNOpJlTGT+hBConju38yjh73E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Esh+szrmaUvlXOZrsJJOswGVTo4jcsAKrvAcnNGPM38JOmdnyjx867R30VYt2WYzg6GTe3HobNKlkEtC1dmf09a2hQrJ0IIEIY7fb7+FadC8SR9kE75Mvb4ZhepXerfQRMLNU8jr1AAU4JC7mYjExS2CdC2J0UJHCw9YCjpoHNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ez6vu1DW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eVo++lRi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAlf8O2953174
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 11:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Gltcaw9+uco5jPE/rC649cVEXA47psnbqJDgxE3UkE=; b=ez6vu1DWTOlYSQZO
	i+Y1RkPnD9byy3UtGcg79ftZtzjRkfIv+M2aNTlvgcj9Xxo5JZp7AAdfOv/zi7LP
	8phFX48FYKxh+lv0SuCz3+La9d0H1e4DL/+U+HY0p0cpOHYLAG277bh3qI6lkTHE
	kuZQNrUZqb7/V3nl6Lm5kn3N96nCu+VwhUoeiup5T/62KXYUpeZczHiCUPQMX7dz
	dx3gy4FXJ2V3l7F5YxXJhMA6oD5vogal7n0zR5MQ4/45E7NZJoSOyl9/Ra4Y1yFU
	07J6J9g7LBIsBBaNZXX1Ogz2o+aUUxIqD71P6hyV1NUg0yFIBOR5aHl8k2h5Rtit
	MnHjQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0642034p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 11:19:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c533f07450so27477385a.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 03:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769685550; x=1770290350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Gltcaw9+uco5jPE/rC649cVEXA47psnbqJDgxE3UkE=;
        b=eVo++lRio76t/NMTuz/IFyDFKrkIVl0H4/JP51AcsqjWcFQUCLxHuK/0bcLrr8RXHQ
         YGLmvqVtWj3w2JW6dynnh0sCc7rpcT/DqraNw90ssnsf0LknTDxAO2OCGvZAVAQf9P0g
         CmhYlPZDYBT96Mh3/yBkhRPWWcG6wifRocPnq4TRsX3cFOaYbFV+DCrFX7rpFLEmSOEW
         RK7aux9rCB5/gyZ10LlAZfPRhRars9Z/cTDH9MSntpAVtjKk0/Kqif0wsss80NavjF9S
         vT+moTbPzgwUY865IScSQp5BqHBgznNMRCOYz1vvYqk4fzfU1QirTeYxbWF5lG1pxWry
         Akng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769685550; x=1770290350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Gltcaw9+uco5jPE/rC649cVEXA47psnbqJDgxE3UkE=;
        b=tXJySFbGlSIGtSx+skb8f2QUCRTt3c8XGkPNZ8VwMxVHPlE0KOESDwmMMXfeivr7jc
         x5NwORoQEiK8iCo3LWz2/9uOFoGjajQdDRbW9Ow1uS4zF4HrMnpZmLJrPOj2jqmw+KZA
         /eryaQJooDPzyczhr+25kHfmAetNJ/ksD8aJ/K3n9eLDrjGMPSKQZBnpRR8wzgsBNa2b
         imrOu+eWnKcTkNuTJrWDqE0hSqu8hUSGjDry7WyPalWwLKfM6dgYxZQMXtSgbxGfQtme
         ptLr6JXAKuPuOUO4bUZlHQWjFWhOJYLwOGOmArv0AG7ajJAYDmPuSvsXC57WsTo0chB6
         P6nQ==
X-Forwarded-Encrypted: i=1; AJvYcCV54cT4oiUnZ5UNj7OPK+YBGUfUybqaRIckR+UdHMJBPwHHlSItHFu4EVbK23twcu+lplAP+vafhJfs@vger.kernel.org
X-Gm-Message-State: AOJu0YyXrnFKi4um0SwfVNHXzWe86bJ9Ctc1SWwRFtI3vYy46b9FpXNy
	klg7NJo9aKYjqTIEV04J92aBu5hDH1kz6GRk1Pe3U/S+3XcUz0IU4Zxkd+BxZEgpSM3u1+ocYgj
	gB8ILymICmg41+1vKY0X13LLA+HlEa++OLTCyVqiXCrsn04+gjhuqlzi4WMcA3BLcInAifWWs
X-Gm-Gg: AZuq6aLRk9NoJY3hdQOwyAQWF6h9JjI33IJlClQNCSs/b6GI0AwxRgTab8fkV0BQmie
	lm/o45WDecESCeV9wChRvnM8Sgrnp/izbnPDpS2qhQIyQl4fGDlNM+M7T+g461HmFu+venvgHJH
	jzvAioQ+ht2/QGRpIfwYFTzQTf7t/Ofc9GLdb1YddeeTNNQ/UkvlUx0yKZuLKIULlS2dSU1+rBL
	zwWhQSV+O9TK/w6wSyWgVgjLQ9wut9cB2h3w8KJoYVz+cr/agbsDzScmYszij9QZuCVJ1ALEh5b
	UE+TNxiLEaMniaVGTEHtZ7yLPKBVoJP8VK2frcv7YJ8tJB477G+VKCbR64ZdPBPyy4aJtsbGvO9
	4bcruoRt0uqHz1xczQgED7Zv+jCvCpM928OMZVw74wOI86cG1DlAu27wR+Mn/RlO2zGU=
X-Received: by 2002:a05:620a:191e:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c71ad22c32mr324006485a.6.1769685550005;
        Thu, 29 Jan 2026 03:19:10 -0800 (PST)
X-Received: by 2002:a05:620a:191e:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c71ad22c32mr324004985a.6.1769685549534;
        Thu, 29 Jan 2026 03:19:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46ac0e8sm2677629a12.34.2026.01.29.03.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 03:19:08 -0800 (PST)
Message-ID: <91812db8-9774-468e-8a8b-10699a63310c@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 12:19:06 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin
 controller
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
 <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>
 <DG0XMT4TZKCH.HPXGS9YTG9FA@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DG0XMT4TZKCH.HPXGS9YTG9FA@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3NiBTYWx0ZWRfX4nRyFkWUPUhR
 rYUp9XwE/0p8bjpzSi/UJSG0Mw3Y19bTfW8M93yU+gYYwbYKqT2x+7w3UbnfevUw/JHEhZTgLfg
 iMFEidWlmDdw4X2B2fFDHpYfbqcd15Ou0fHF6SNSMEmqd1CJr7dz/vX7vR9sjiVJPN3X9iczYet
 zwE/voxtg9W6b09u1yxNxPeQA/Q4qV/7SOmvo2XztDAOBsDPsCleoC71J1ProvxVOaoEGkMmWPQ
 wXvdfIOvkSw+mMJNth4pWsN9yAOWTjFp9p6T+WfjjQb91MttlEn4eoJrGBrCMO8m6AjYSsn2B+m
 vYFkK2yAh8+YXW+PDmGLJmepuEiPNXqydmq1YQSZwPqH/d3tCEXP2oNVeR+z3Kx+B0yTZ4kxLYt
 iHCHFsl8f7LMemfDP7+uiFEpAjobBHYu4H2mfZxoTb6Txsdd76FAe/Rzdzci8LQeGu4mAAksqpO
 f1VHbqdvXV1yQSn2hKw==
X-Proofpoint-GUID: etG_u6DFHDu8KVUR4x-JwLnPYkHeHTxR
X-Proofpoint-ORIG-GUID: etG_u6DFHDu8KVUR4x-JwLnPYkHeHTxR
X-Authority-Analysis: v=2.4 cv=dpTWylg4 c=1 sm=1 tr=0 ts=697b422f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=8gWlQ0A84ExjddM39AAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31293-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.5:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9553FAF8D8
X-Rspamd-Action: no action

On 1/29/26 9:32 AM, Luca Weiss wrote:
> On Wed Jan 28, 2026 at 11:16 PM CET, Dmitry Baryshkov wrote:
>> On Wed, Jan 28, 2026 at 01:26:52PM +0100, Luca Weiss wrote:
>>> Add LPASS LPI pinctrl node required for audio functionality on SM6350.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 66 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> index 9f9b9f9af0da..b1fb6c812da7 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> @@ -1448,6 +1448,72 @@ compute-cb@5 {
>>>  			};
>>>  		};
>>>  
>>> +		lpass_tlmm: pinctrl@33c0000 {
>>> +			compatible = "qcom,sm6350-lpass-lpi-pinctrl";
>>> +			reg = <0x0 0x033c0000 0x0 0x20000>,
>>> +			      <0x0 0x03550000 0x0 0x10000>;
>>> +			gpio-controller;
>>> +			#gpio-cells = <2>;
>>> +			gpio-ranges = <&lpass_tlmm 0 0 15>;
>>> +
>>> +			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>>> +				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>> +			clock-names = "core",
>>> +				      "audio";
>>> +
>>> +			i2s1_active: i2s1-active-state {
>>> +				clk-pins {
>>> +					pins = "gpio6";
>>> +					function = "i2s1_clk";
>>> +					drive-strength = <8>;
>>> +					bias-disable;
>>> +					output-high;
>>
>> This looks suspicious for the clock pin.
>>
>>> +				};
>>> +
>>> +				ws-pins {
>>> +					pins = "gpio7";
>>> +					function = "i2s1_ws";
>>> +					drive-strength = <8>;
>>> +					bias-disable;
>>> +					output-high;
>>
>> The same
>>
>>> +				};
>>> +
>>> +				data-pins {
>>> +					pins = "gpio8", "gpio9";
>>> +					function = "i2s1_data";
>>> +					drive-strength = <8>;
>>> +					bias-disable;
>>> +					output-high;
>>
>> And here.
> 
> I've taken this pinctrl from downstream lagoon-lpi.dtsi. There the
> active config for these pins have "output-high;" set.
> 
> And fwiw this pinctrl works fine at runtime for driving the speaker.

I tried to find an answer.

A doc for this SoC says that i2s clock pins should be at output-low
(2 mA) when muxed to the i2s_xxx function, with no information about
bias settings (perhaps bias-disable), and in sleep they should be the
same (minus the drive strength note, but 2mA is the lowest setting)

I am further confused because the output-enable bit in the cfg
register specifically says "when in GPIO mode"

Konrad

