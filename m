Return-Path: <linux-gpio+bounces-38637-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Cee2L+2hMmoK3AUAu9opvQ
	(envelope-from <linux-gpio+bounces-38637-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 15:32:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C01CE69A220
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 15:32:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NEXglQqI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OWFAxz49;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38637-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38637-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A288E3208657
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 13:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E23840BCA4;
	Wed, 17 Jun 2026 13:26:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C70F405C30
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 13:26:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702785; cv=none; b=Ei8ddA8rK2uGjcV1FQPMd6VxB9tzTFwAdiJsNWUv0cqwDivyTGkuFXX0VNbsM7/eMcPB2ocF1lZVRTbvVD8qUXnv9SyqkoCrYOzB5xdZU+63mF+wMD5SG+X+MkVUkIOuWq74Ayu8v3gJtUQ9csAtbTzjbgDW2j+ZXUKLE12wApU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702785; c=relaxed/simple;
	bh=inIcFos/x0jKX2o4+YkzqWsmsZsjP37LAPvUVyviBhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYv27IcJ+VUcxqgaPNudaXSDstc8y76d8mEHcOggJkCInjqNu4rqY+aGZHOgrDGot/rTQKpKoQHkWp3fJqe2AKAfOFDLIxiFtd0e8GM6pLj4v+RPSkvr2cb97fvdQbzmbFnivvpnGWWaTjIr2XQeUHHb1nGIlr3fi9Z1XrhnDMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEXglQqI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWFAxz49; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UEZI1734987
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 13:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9L8d92QIfTFBohwf+5AnyF8y9DpzmN6NgGQoafr83o=; b=NEXglQqIlMtqgrma
	PHQUKfyUIotdvE8l3OThso2pEag+QOXl1vPMOkYhE+1+q6EJlOP7Zw/LeHo9+6cN
	CdPkgLfjmpKYpW3BgXx/c55Xa+qv5gRrY1ozJfILgs9XisOenPf2WWvBMqcwPuyg
	4PYPUeVkE3ej8fSwEPXrQ7MuUnnOPO2y0yTqiX5gfSh1hdSsLGDkQyhn4IqPfv7S
	M1s/nBUfY9CwCCZJxwwbDUnyEn9MMRbU/laP8+QVWTL911PQyKKBtVkXDrCPjFSV
	UC6NanZGe0D78dRVvIuRjCTDdI/7yBCZjwbC/WxDX11FrmfH6tiTfyR33fZwoxee
	RqLnnA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemkb75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 13:26:22 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-966ca0f25a4so112655241.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 06:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781702782; x=1782307582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d9L8d92QIfTFBohwf+5AnyF8y9DpzmN6NgGQoafr83o=;
        b=OWFAxz49qZMMi+904yowz1cbhbf2d/Mw5N3cDN383lvDqgGDMB5rvjRgKuo1NuC6bs
         BkbucN00F7mh7Z4c8p0g7uWS6CZFzYhesbFDghnLM14FmsXgIgFI8mRccLAXVLhYfg8n
         qRd5/qTeHJbSMjb0e1cONSe5jdBJjGlqZAkxRNU9SQ5lkmHec+g6JyvH5BhzVM1w9zFN
         Jc2a4UTPvXaYWaffH84I1kwOV7CzTeUc/EaM20uSdQBSWiZzsPfrCtHvMn4rCs8+s0a5
         Xlx//Et8G/w58CMfaFI6KxngpSgbE+nSdlARoo6d6XXuRIX0GUYBk2quOsAoIhljHvhn
         rZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781702782; x=1782307582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9L8d92QIfTFBohwf+5AnyF8y9DpzmN6NgGQoafr83o=;
        b=YkROMoZ0b92V2EBA3usZTgEpkH8v4/pNniyWvIAnzh2BQGtikusw23Yy1B/ZRFZLJk
         HsKHKrueNBCaUmASRTUO9Qq7zGMGYTobWZNbRPKg0XcAohA7k/lKrRAiertpHs/RTxNw
         CNxdOjXcbwIZmBqW17vi+IjZTXuSTdtrCVKvVOOrrz/5WV3c4n0crnCggnMY5wO50VO0
         QV0bq3w5H+JItdCYWsucC8snVwnHMwvb4WCRQznqeqt74byRKlMbwZ6R6sj6v3OEl53O
         EYCyYX4x2GKvIWBZjaC0L/y3aZ95h+T+yukJnbf6XepqXXs1zchyjfPbQfoQsl/8UG1F
         diFg==
X-Forwarded-Encrypted: i=1; AFNElJ/bcUMc8q1m6BoPaENwsKj7A3Yx2AdVXb87Nm9iAnOpaqSiWDeUJRZeOyoR3F7nbgfUITf0fIlTKMLY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmc8FHN4eKE23Dk5ItHv7IVUmynImn0QWMgKLBMLsHpdgNLehd
	VYS9ni9yKnOwUo1fC/G6q+3Gf0v9e60iW03XLlraGoW9WEwN34z/5JjPiWXb44C6nQ2i66M0ISg
	MgzDevJLB+kUyg04mZx3eZpFxpigbFk3CYHCcSQXEpQXyS1hyst/CoZMv4E/9tM8z
X-Gm-Gg: AfdE7ckZySFb+ebOsMW9bSvJyiCKsZsFeslBWEha5ZajtkM8rn3Fj4nZ6SXocovITH5
	Xh2GmS1ki3pxZCa3mP9M4U7WVg9DWmoHZcVn03EbFb+IsXfo8ZJgf070NTVVWNJig5TeKU25UfF
	b4yLG7e9GPc/2qETDlom1BEZp69gnJac1sfO012JwssvGHrs3S39jxMROC1BghiBJVGJRXIlFKg
	HxvIHSizwvuOSGsckWRD8iIjT4G95RECU1Gk6RS7QjScfDXarncaQFBoNk9F4wFwiVP+8wJRHNh
	H6E0JcIpkDbW1Z4PMI5AU5OFZF7XpaQ6L+fBz2B10evrCO+tbR4Wuy/+ElDCJMFVMLH59ucMpQU
	YvigPLadJVfRfvJsBn3qaOOGOFhXF9Ui0tLs=
X-Received: by 2002:a05:6102:3f0c:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-7245d1f4fa6mr841358137.1.1781702781701;
        Wed, 17 Jun 2026 06:26:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3f0c:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-7245d1f4fa6mr841342137.1.1781702781292;
        Wed, 17 Jun 2026 06:26:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d934sm799439166b.40.2026.06.17.06.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:26:20 -0700 (PDT)
Message-ID: <8754de51-bfbe-42f2-84bf-36cc000afa3f@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 15:26:18 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-2-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-2-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyOCBTYWx0ZWRfX/SK99M94jb3n
 RzhAdYYu9Y3uLLGuFVutI7aAGqPxPoVvLlUL8ttz2tXuyaYx9tybtkzmGVgrpsSZVWHnPVio0Wi
 RCI2UJwEm0r1PxWP96R+6ttNudMI9+Y=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a32a07e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YnNygKpUfyAIgCZGubgA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: GuBdAzahz-xy7g2LjG1IWWS-_VjkmoVr
X-Proofpoint-ORIG-GUID: GuBdAzahz-xy7g2LjG1IWWS-_VjkmoVr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyOCBTYWx0ZWRfX8+lY9IgM2pi7
 J9a7Pj9YMIeSpoVZZ9XOfEtLy6RImlH35EKg0P0hzvBKnHJiPdFS5ahbs0zK1SpJNwNVeAWoo82
 g3Q6i9qhvmgjJ7WuXFCS0e7YswY1UpuZFtXLW5xsToAovc/yn7x3LsQr48og/w7ZYov61JsXV7c
 Gmql1N83OkHtDaGCyZSdaT2SlsQNzdAyAldvFbTCNYo5y8yFT2+bNHzXVO18rrLSKKvFx4eobk+
 7mhCWQnWT8FxuY/9x/uJgmgSQAQqkRPh3CWJYRr5hf3Ri8NN+S2vHRujKXKdheIwpA58LUXNS0O
 t9IeRsL8lQZVrBIbXs9O/Wu3hhU1U7SxIjEoRBcYQbr0kcDA7sfFuHFhMfhbfwCb8DaBWM1Zl0Z
 yJydajyF0dbsfoFt2OtRnBYq2mieQA9AyNps4HNSnowUQQedNU0+J/VqfN4Zc2kYsppZM53axZI
 1/woEXVotFPQQMEncLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38637-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,sea.lore.kernel.org:server fail,oss.qualcomm.com:server fail,qualcomm.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C01CE69A220

On 6/16/26 11:25 AM, Maulik Shah wrote:
> There are multiple statics used. Move all to struct pdc_desc to better
> align with versioning support. Document them.
> 
> No functional impact.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

[...]

>  static void pdc_enable_intr(struct irq_data *d, bool on)
>  {
> -	unsigned long flags;
> +	guard(raw_spinlock)(&pdc->lock);

tglx suggested to use guard(irq) around "the other callsite"..
which I'm not sure where it'd be - maybe around __pdc_enable_intr()
in pdc_setup_pin_mapping()?

Otherwise this patch looks good to me

Konrad

