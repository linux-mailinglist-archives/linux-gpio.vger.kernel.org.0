Return-Path: <linux-gpio+bounces-31284-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DXuGnU7e2mNCgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31284-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:50:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E240FAF215
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 857CF301682A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B8B3816E5;
	Thu, 29 Jan 2026 10:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3Md2GeY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NVV/fQ/0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7912635293C
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769683566; cv=none; b=sW2BDPvHSiwuYap/gt+XvTsq0qGl46F574Z+q/yiSdTX8gWhBjufnCC/iKNCzzadxyIyacmGmlqiogfw6BY/cnowJDPY+T98ZXoPndzySFs2023iLBzAUyKv78OE5itFa+ADTbn62DoHfC1IDElwEDs55pNOKexv9Fv7Yy86FfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769683566; c=relaxed/simple;
	bh=M9hwD51DRua13tgBisovfBN5o+Q6Oz87oGUYwYeztLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bEXy9FIPSwUue/a2MrNFBX9lGryX2JkEaRFdGXtTdR1VkcaK0Umt9UhkS2eDuIY9PLRIEb/FuL5arhjpz/E+QhG9ly3k/1kONoBBJYoduwey/bhHTOHlMxpB5HPp6vbQif78G/6E/ijaphtpZ5UkfiP2Kc6CGdNJIoBPFvPaFqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3Md2GeY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVV/fQ/0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAaTkC1432572
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zEYbQxbNEs9Sxv6KsfqTMdDDr+rSJv9laSrcEDWZbmk=; b=l3Md2GeYYQLJKPv9
	Kiv9XtHOCIzZz4qL90yI29eTy0SWpgiKqznmiD3TIFIovUak/FyaGljrt6jBW5bd
	Jz8WrewoCLkp1HyD5XPha3cPYC2MfPAEP837yAK/lKFtGKbNK9+WC7x0HdIMqS27
	CSmvm1mi/HTFeGjR35ZWys8dhiM9/KyKAp3AqAABdO1WBnlqx9uKoYhrE2Mz9uNJ
	MK/c0ejbZHBXENCu4RUSQkj8Y3+VtwgB5UtQftFwyuYB6T2wCna5nK1VHuBQtyQN
	Zna8QdvChJ8ryUUF+RaV8Eknsoo7Qq1hLNwmNGkSRw5SMqVAENegsf52NabCZgjC
	LqElJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byydh1abs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:46:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c536c9d2f7so27037185a.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 02:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769683564; x=1770288364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zEYbQxbNEs9Sxv6KsfqTMdDDr+rSJv9laSrcEDWZbmk=;
        b=NVV/fQ/0juhdAQFAk5TXYewhXIV6hyQWgImbghLF94FmTnzltFB+/awhLkpp/vawK8
         /DdJ7wactwZgVPn5OCPpV0V7taFR6ieLm3HiMIsGjuFBYOAUJRR5NXvcA9jihrwef29e
         rs5mPcTrWBgh75xxf1Z7UZdEDLoF2lRf1luOOc2Xph3nL4+/YjLOdM5OnM/MebURHG81
         yIyZng1xIOVFdzKbGwf2CYBeUlsP/u8WVnF+FC2W71nlKlNjDrYEKMVS6v3NtSQlOKSk
         Xxa1bGFtWu/skCCQ0XleAe9FU8IHnh3DXpekQ2tyXVlFsGOTol9Nw0iwSy0UafdWgquL
         4g+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769683564; x=1770288364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEYbQxbNEs9Sxv6KsfqTMdDDr+rSJv9laSrcEDWZbmk=;
        b=nOSWQxqHDh4ocWaA+fxJD5iUKZBziQPieIgbrNh9vzu3m/X//f+QCF/OTf26Asp3Q0
         U5a0gM6a6mNumL2ATF8P0J7+uPbY3moVYSTp2EC0NpRzAOOZySkQjAQJbb3eiOdhN5wx
         oZXSy5yxJ3OSwKm8tpXqEHSLEJaem8VuYcx4QtFS5iPxMgPAG7/JASXyMQzulIfkqgek
         sbMhp30MnVJE21JcQHEpVukL4zU+EpKvMeRXmKmVbpzzoHeXzSiEbLHe63GNNbPAqBzt
         bcAT6sZals8VcQmgCxmCajAu+ncOz/1uV4ormXVdULv0XXUFQLCFnT3rnOA/EK1th7d5
         wf2A==
X-Forwarded-Encrypted: i=1; AJvYcCUK0ZrsBluj6KYQQrct+RZkMgvjZrx9QD6FRrXqnWGIimGOfv5FVPbPbipz1W9QAzwYNIIrwwgOccvk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/2BwOWYg5vq4QHtENGY5tN+k7Zq2FhK+0sNR7CX6+7zennLhP
	ebLSZoEcUkR8XOQF/7ZGW6CF9pmd6/UIvhfZW9UUqGdYs3xY/oWoKiaLzvWiHEJhrNdp6ILcEzR
	E9XLayMljw2eS9NnoHrc+30e/dAL8huhis4trMy5mx4LLfM/OgHgZWaT+QOSXvgtz
X-Gm-Gg: AZuq6aKKH27BkkWw3zGnU/TQoiGJdTVn/EBnhWzE5mqvUzEtYDmEv9NMyCk8i9wtvaM
	fqnTnS2L/7z4AoF8Ykyui47Rw0q6bnGVuA+XXpwyl+U+Ju90vG7ctmJQ90haRb4KlF0DrDF/ivF
	eoWcADLSwCBWhSXOdLNBXWJQpPIHyyxoF81KUEsKcKSOskZ5scYvy8nmC6uoWPgKSL65HA+gjaV
	Z8SXJBOuqYTzflGG4e5L3CyQ277PRC4PhnIX9wtxfm6WmiSlUj3fw75yhJDayocZfb/0eY1/Tzo
	oi0wa/mzaxF7IBCgLrVyCwjZX9Lz5e27a9wsW5g7OGOcb1a8eQQQMDDS5jhE8h/eyNaC0VmtiIH
	halMLCJQQkjzAyLakN4EEUmRTdhLGtiFXtfTZDTtrQxIfMaOtCdexhFP5xJpWARVQYEs=
X-Received: by 2002:a05:620a:470a:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8c71ad44a08mr341316585a.8.1769683563763;
        Thu, 29 Jan 2026 02:46:03 -0800 (PST)
X-Received: by 2002:a05:620a:470a:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8c71ad44a08mr341313285a.8.1769683563196;
        Thu, 29 Jan 2026 02:46:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8de46abf6fsm69085966b.52.2026.01.29.02.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 02:46:02 -0800 (PST)
Message-ID: <8360708d-5d82-4cbe-bf0c-31107ab07bac@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 11:45:59 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <pdxrotmxjiebyj2gqx6buwupkydngxki6jgv4e6l6fmodzc5v2@yxky3civt3yz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wDYgLodlKMSm8RaZcpjSF89I_R5zDNBU
X-Proofpoint-ORIG-GUID: wDYgLodlKMSm8RaZcpjSF89I_R5zDNBU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3MSBTYWx0ZWRfX/p+MQV35FK7b
 fWGKb8D0p8klFlmGAKVzZHeNMyUZTkaD5cOXuj3sFCvKvrP0HNqqgShT2GOCkGGFvFWHhsCPO+O
 I+DuZGoZJDJom8+pXRgb0/r76mjpkfP7rT/zB1ZOKWR53G9oz1deOydBvyGm2PZHfLiNllY4LMv
 sPTPBP3P+NwEbPrpWv6UAq1K6NeDH3Tv22b/vqvksO5EYZ/w8MK8Gsv5jfFHCRQG6l877OhC7VB
 7Bz3gFwrK5BzXGcpGafOfZgXzZEfMgppwUWX+GCParpkdOfOZlP1+2K+n1IrxzuC2x6u+vChSNR
 10p2VmMfONiYC0tGlU/SnqviV6HT/MnbQ8xssKNmS0VWVWy7enpGTS46mJ654ew0CdsGCsPxogE
 WDKQHIy/G3WF7vo3etrA19MOEGncB8yJyTAIf6MwwTl54LiZx4lCtr8yxDiIi9pDFvG+I5BKgkR
 q06yZas9MNM5vwlyHHw==
X-Authority-Analysis: v=2.4 cv=Cs6ys34D c=1 sm=1 tr=0 ts=697b3a6c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GLEDbIXeUMAGdpgsvS0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31284-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E240FAF215
X-Rspamd-Action: no action

On 1/29/26 11:41 AM, Abel Vesa wrote:
> On 26-01-29 11:34:07, Konrad Dybcio wrote:
>> On 1/28/26 6:22 PM, Abel Vesa wrote:
>>> On 26-01-28 12:38:32, Krzysztof Kozlowski wrote:
>>>> On Tue, Jan 27, 2026 at 05:47:36PM +0200, Abel Vesa wrote:
>>>>> Document the Top Level Mode Multiplexer on the Eliza Platform.
>>>>>
>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>> ---
>>
>> [...]
>>
>>>>> +
>>>>> +  gpio-line-names:
>>>>> +    maxItems: 185
>>>>
>>>> 186, your first GPIO is 0 and last is 185.
>>>
>>> Actually it is 0 through 184. The 185 is ufs reset.
>>
>> The UFS reset also happens to be a GPIO..
> 
> So the gpio-line-names should include the ufs reset,
> but the pattern not.

Why not?

Do you see a reference to ufs_reset anywhere in DT?

Konrad

