Return-Path: <linux-gpio+bounces-37332-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOSABJMiEGqsUAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37332-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:32:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA4D5B13C2
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BF0A30DBF32
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314583CB2DC;
	Fri, 22 May 2026 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCre33nr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0W4YdYj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1523CAA49
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441774; cv=none; b=Q9hVMa6HfkhYMaL2MkKN4FuVVyV7WRHnUOFdDRW7qraiTnJMBPuXkTR3StdxSxDLNz4FCIh3eDgWKy8Z55GEZb9PVhhcwKotZB6t8eRPoujIYzAfAa7H1+9L+S10FstrMNcacQThAzvma5YmR4nZ78HlLvVTPkqA/7QYRmNMBSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441774; c=relaxed/simple;
	bh=88BDVV/FL8yOUO9iW30evt6DNYWf8WWsDtgXsbtNGf8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aVAGl8f9fs+zGo+pcEusC8zqvKDHNLzpT9RtZnTLFpa9Xtfaa44wHNAChaBx3lC/S+776wu6EB73YEjlZeDyOhXwrtDFPGlBzGUjeJxwFMTCfME4NXNDsMUoEQl28BEFWgzg/gYM6GEclRF/lk2ywj9TvZDoCU/3X8n7TJKWnXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCre33nr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0W4YdYj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8h2b4399166
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EGQzsRHMUGEP3OuVmMr8JVJyXDsuNK+Mhko8e8FKK8E=; b=WCre33nr5+stCrkf
	VGzAquYPwIr2eDss0rHxibWG3RtGGinGCrv4nWLP0H6m5N5SXbaN7hUstO6QxRjO
	1/awkJS8nUhbWoRgZhERMEF8qtjIJ4R69bHelOjd8BcBl+qnjfwS3/EhfIHUkckH
	jgoiypYdrqCQyq2aV7qmHH8e0KDG6g4tQ4Bv4RyPID6tZZZ+aqKTaMzlt6L6rmO2
	oL/1zTCuwlJd53QItaViI5oqPM9gSig6AYuqyoT2lUWEBPfkXIN9rTsQZYRwIKPA
	znj2NtVP4Nhmak0UXq2Xmh0eQYonWUdc3DD0TFRI0PA10pLYXuFq/1EKxLrdKRK2
	bbMbYw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9umdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:22:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baf7748d0aso70638475ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779441771; x=1780046571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EGQzsRHMUGEP3OuVmMr8JVJyXDsuNK+Mhko8e8FKK8E=;
        b=K0W4YdYjYPPKYUHje/kn+A45Z56ONml7AgJAEeZHsL1p7T6UFKEd9Lagpy8G5Z+XuS
         JwkJU8AbLaWLBEu7E2vAaAAwkiIVCAo4UKkgce1qaM8VZuf8J7FS+CV0VuKCRIBHnxIV
         9LkkXfJ4JzZgKSTrDu3FegDDTCxVFVSQkf5yuNL0/wNhEDaAyLEPKDbRaVpdUCIgkuXt
         9jAJcZpnR79ch8T4hsK2k9WUFzZ7CcYkF5pKqQDZZ62ZnJ6MagpcxkgoX7zugyL91sfx
         IpZglQp5MXIBjSjhwWfV8fhypNTLDIV2e/dgZG8U2aWpC5TUs3RKbQA2F8VMYuGxJ78t
         i0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441771; x=1780046571;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EGQzsRHMUGEP3OuVmMr8JVJyXDsuNK+Mhko8e8FKK8E=;
        b=YY+euf1HGW0wWfjlKNf5IclEHMVu7ML6Wv6zSz2Cu8zZ4OlIDG29LwrjzJG94IuSXJ
         9n7xr2iMaM6NpLhUjfqMFPnetnw/5JHHHHa1Lctq45wUcVzzgAxOedxJX29nnBt88T5S
         BNmRaQzTr76CJiBLP4QKmS2lnlMwlSlkHMXaBBNI45SpKSws0h3ORFwwYstw2JSqElLE
         /QSXBhBhzQaxLOREB05iLGmTldM2ha3EB8ydNawSqVV4xnaGk1jm1vNzuhteqSM9qqTI
         TGh0GaPMLQvXzc8RxLqLUvgOKI/bnv028XjDk7uYPOqPTSUR7tecnhDSfV91fwR5/0k+
         gfSg==
X-Forwarded-Encrypted: i=1; AFNElJ8cdvWFcd5Qcl8fPqijcQKCd7e9f/D92ZPqcyuP87mCtp8IGExVVAwq8n+qQsnBUJt2Wzmpz6YN7xRi@vger.kernel.org
X-Gm-Message-State: AOJu0YxRvoCtW6x5ZQHVvfD0B1Ho9QmwftesD64yP0XiMwS55qpQotgp
	Mo3pptXboojgtHCdVzE+tY2SivcyY0OBROFGU9PQRr1B+D6FL1jCXJy6asHtjAUj3krZgB3Lvpe
	NgnuhHMl7acAFFrtrXnrJOdH8Y08nTTFhYwwI3FhNtadEOPioMsFeibj4QBfVevJ7
X-Gm-Gg: Acq92OHjMnBHgeVvVHR+AmZkA7mHe4qzwJjsfKjIO6lQ6UEtcgRTGeNt0o+pL7EEFHz
	Z/ByjpI9sj/eXDsnCOlGc/9Gxto2lRC1eYnYtT9jlaUz+l2wgBjIgkjhhQKN8HQMfC94OkRQjW8
	7Bvpv8+OPdLJTggOjKmSVH0R/6P/daJ6+nO8ylqrkSDfjJbo5ygsUrkiG9WgxLke7KJV+FbuDUY
	XdAgg+doKWPDuaPHCl2h+nJcXvXgCP4vL/cK59zUJelMJALfotqLv4zDxDj4HBJbX29y9Y1HIH4
	gvMTeri20mEPfOviTvjWdBLdXNXLPNOOnIhPsnfs0rkxxUeoZFuIWwIg4TMOcXS37LFDQNwvEVp
	JJ71FLMKL0G05DQ+eDNsUJNLcF9qHHOy8XF52Rnj8HCmtEuZ5EO4=
X-Received: by 2002:a17:903:1a07:b0:2bd:8822:d8cb with SMTP id d9443c01a7336-2beb063193emr31328965ad.23.1779441771113;
        Fri, 22 May 2026 02:22:51 -0700 (PDT)
X-Received: by 2002:a17:903:1a07:b0:2bd:8822:d8cb with SMTP id d9443c01a7336-2beb063193emr31328745ad.23.1779441770665;
        Fri, 22 May 2026 02:22:50 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ca7fcsm11220795ad.27.2026.05.22.02.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:22:50 -0700 (PDT)
Message-ID: <6fd91379-4347-44b6-8514-3c1e66e12aca@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:52:45 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] irqchip/qcom-pdc: Configure PDC to pass through mode
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-3-760c8593ce50@oss.qualcomm.com>
 <acH7AJq6tcmemvU5@baldur>
Content-Language: en-US
In-Reply-To: <acH7AJq6tcmemvU5@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a10206b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=1v8zxqPQ2sg2QXuulHIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: bMx13TxzoFx9QKg9J6YMn0yiTHuUSJBh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MyBTYWx0ZWRfX/HCpbwvN0R1m
 KrQ9t47ei27HvO9FMihcM6d0VSZ0pjQ1JPWy8w56caaFM+IAR2b00D3zWXpBcYeU+e0NjHQon/r
 0w0KLYACJWGZ82Pxa5zjLcL5RNYvzTIjdQZImtwNmCUpHnxdqXAkHm4T25LisxguyngnkXI4por
 glVGzCJ8oy7F7qcmBlFXG1/ryA+Odu5rFhiEMFdfJyeKhIkoQuzlQueCZoOuddMq74bT2jFwP7V
 OlpuoCsVlMIB1QtcB/boG8sU3oNV1Dop5C0KbJDkyfGRPf9JEQaoTS5OhoRg8uQp1aopE3odjg+
 DeSv3hlcguI0qMbIvN7lqvyWXVAuLShjWmPAM4gqNT82i0dDwc37JB0VOWXJtqMgaWbNsJHUcux
 AA3qzm3kNzLNMZAHAWAqWR/Zv9hp8NdZ+3EZnpzzgxzmpUCKxcgU70JcK9qwcb54WqRvgHiSlaC
 hFxuqwSbrywbC1grRHw==
X-Proofpoint-ORIG-GUID: bMx13TxzoFx9QKg9J6YMn0yiTHuUSJBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-37332-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BA4D5B13C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/2026 8:22 AM, Bjorn Andersson wrote:
> On Thu, Mar 12, 2026 at 09:26:37PM +0530, Maulik Shah wrote:
>> There are two modes PDC irqchip supports pass through mode and secondary
>> controller mode.
>>
>> All PDC irqchip supports pass through mode in which both Direct SPIs and
>> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
>>
>> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
>> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
>> still works same as pass through mode without latching at PDC even in
>> secondary controller mode.
>>
>> All the SoCs so far default uses pass through mode with the exception of
>> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
>> boards whereas it may be set to pass through mode for IoT-EVK.
>>
>> There is no way to read which current mode it is set to and make PDC work
>> in respective mode as the read access is not opened up for non secure
>> world. There is though write access opened up via SCM write API to set the
>> mode.
>>
>> Configure PDC mode to pass through mode for all x1e based boards via SCM
>> write.
>>
> 
> You're failing to mention that the SCM interface was not present in
> initially shipping Windows firmware, which would result in you breaking
> those devices.

I will mention same in the v2 series commit message.

This series has also been tested on older firmware and the scm_write failure path is handled
properly, so existing devices will not be braked.

> 
> If you're certain that this change is available to all users, you can
> argue that this is acceptable - but omitting this from the commit
> message isn't.

Not certain. In v2 series adding the secondary mode support which allows to hit deepest low
power mode irrespective of the old/new firmware.

Thanks,
Maulik

