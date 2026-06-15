Return-Path: <linux-gpio+bounces-38441-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sFntFIiPL2orCgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38441-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:37:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A826683862
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:37:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jFvlgwd2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AZtAzdoV;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38441-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38441-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A1A630013AE
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 05:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517763AB5DE;
	Mon, 15 Jun 2026 05:36:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF3E3ABD9D
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:36:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501805; cv=none; b=N9a9V3569xGSfYlp8p+iPWBnQmu/KyOnt9u/p6h6XRO/q6HzdrnYzV4Qjz3D9ZNls5K87qcILNh9ytav5HO2qRi3PjmEo6s5r5z7/5jCNEq2R5LTOvkRcyvu0VJ4D43wWA4jdR5PI4swQQvAJil0iVfUReZsFyNCfWK4FT0DIUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501805; c=relaxed/simple;
	bh=gATNM/iQUFyfjUYu7EvC47L3WwzSIq2ypxLBAmy07Wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ReGdOC3rELBAity4/z3gI+fzAJkLJkS0dZWVsB0vUx+huvzOnAF7x7e+TE0k4UDC4lipqinsr/OZpyYPl9CQ72USJdfM0XNn3Q3HE9FtP3YI51s65mrA7+vL3AzDbk3Orm1gJXnM5v73h7qadkYkdfVm+OLkNpx5ghaiKgxfKLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFvlgwd2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZtAzdoV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kAFi3307877
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nvzuTVgDKgi30e79iKlXGgVXA+rxq/L0lqt/SXPUfMo=; b=jFvlgwd2XTS/gC9+
	df/utlLHbwFUk9vDpmHJi4bqXpP6MGmwGpqj1Bo+WZZ8DgG98/caEhhbS65STgxc
	EJrt7RYwnRWRFXBywwtFo/w+5APZ0KiP/hk6dQCoDjOG1mZDXj7VT+dZCmXO9SnX
	8cXZ+S6LA3Cc7M68ZYwPPtK8kzcPwGs5a+CNXKnDIkV48HU3mje2T+nfjiyEqhGb
	O4xjeOAZwf+Ckk0F59nVpwuoOtVCDrLD0l/wgQWUf/a3bYaRwDFLHbphKuDaV8kE
	8Luk9oeMM7efOrdv9cAguTji67YD3uWqQd0nvMa4+rgaEHTZuvsg6UGlsNGOk+Aa
	8kKgUQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6wr31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:36:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c32faa62so47662935ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 22:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501800; x=1782106600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nvzuTVgDKgi30e79iKlXGgVXA+rxq/L0lqt/SXPUfMo=;
        b=AZtAzdoVZkA+ljGpxTsAywTasqW3Co/NrThfwISnOiQqY4xBru2gm5K4vAugy3KsrT
         uCtap+8vkQ2bNyfzkepemThanv6NH8xEiTctnE3xRTOlVMfwwA1U9yLnv+BvwSat+Azo
         UBOPwLPkqIcdcti6Bz59am+iqD/ADo50UCqf2UBHrLdUe540nkNSF/rvXsRwpgoSGYGF
         DJExQ1JpuA7xfBaVRMNKn9CPS1T836g9UsOYKji0dxl7lkKrXRR+ScViWfYCi5AiDL+i
         aujud+N/Zj1nVQlw64X2zV/1w7DFqxOxfefWbCa+L3lBn94kRiqcOwSN7Npm50IWMBpe
         MyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501800; x=1782106600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvzuTVgDKgi30e79iKlXGgVXA+rxq/L0lqt/SXPUfMo=;
        b=jocCLOWcHQcPddxvpX42yW0ZTs4Da/o6M7xnXndqbYhH/HMiHvuCI4ykM4qrybLT94
         urkQdIVGqnTrG99OVhseVB0NOfzOlDh41pes8OPwlNA+U0kR9v2gaPPUKfREfpOiEJo1
         k4rrIgwckhj+Ssk5QI05ZsLdG2t5b5QG2ixSAKzH2ku0tYJaM5wzM7VwAimVvN6nZaPY
         fZshk8EDrnIjnufzB2/Cvi9TRan7MDLHL5lRz4yKmPjfPmNpjV1cugOMomgASzZL+vEx
         CD+0RsM3Hyudt4UvVSn2+DNtYB9z/HLUa/rD2PfWRWeigETzXcwN73+X30HfOX4fgviv
         qjwg==
X-Forwarded-Encrypted: i=1; AFNElJ9tZHRZKBAgFAWLeEysVNUftnxhZ8GSk8y+1immC57o1iB2XaeyxUEv5qAOUrlaXUMfEu+OKchQDH/b@vger.kernel.org
X-Gm-Message-State: AOJu0YzYaRe+HxpNL5h0rAWZ0r3pYtL4OODiYdUZZoIF6YZRIul5syJc
	ujdbVmdwiBb/H6B1CKRcUWkzeojohe+5pB9qVgrFWC75pIWV1RxvdErhd/CiYQnpY8Tq/6pP92p
	eNyhcPDzZ16f4qbUpYogogMD8ZZnntEdTr260Yl1RS41yLxHVaicuRieUYek5Oa/q
X-Gm-Gg: Acq92OEwiZZMzuUSEEz4xnKxa6Pk9r5hfjDApm0LhtEAN/Iq8+wRN6ASEFgkquA0X6U
	8dNDsrORTTplS95Wf9ngUW7jbrHvg4eutI7cLqavQUhP2fMnLEAQ0QyjSCl4/HcA/bhHfWleBPq
	VDMNtntBw05UHst0zY7POfl0824lwc3OQK3ajcW5NK4VXoe/pImn4lKY+OIwTll2NCRXHx/sssv
	q4nqnCdXWO/r82qCeuLbQzQRJlx/JcWFzAxKonotklt02uA7C5BA1H38ylPo5NfLu7OTNlRNOQr
	E9YSXBQqpDR2kAwOk+lEgPBDW4qAC5hJp9MmeZFh/4bcMzV8WxG1kupXXXXHGfYXSvPsPud364Y
	gBJr6fO2VB/wip4Y1WLodYOk0FfpYRdTh7p9o2pvy8rLrkbdrIow=
X-Received: by 2002:a17:902:e786:b0:2c0:d4a8:85d0 with SMTP id d9443c01a7336-2c412840747mr134605965ad.32.1781501799956;
        Sun, 14 Jun 2026 22:36:39 -0700 (PDT)
X-Received: by 2002:a17:902:e786:b0:2c0:d4a8:85d0 with SMTP id d9443c01a7336-2c412840747mr134605665ad.32.1781501799316;
        Sun, 14 Jun 2026 22:36:39 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c5dd0sm111774125ad.20.2026.06.14.22.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:36:38 -0700 (PDT)
Message-ID: <5a5acc8a-80d3-429d-9bd5-93b72cf4e768@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:06:35 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-2-f6857af1ce91@oss.qualcomm.com> <87bjdr7ikt.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <87bjdr7ikt.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX96Kh91PlZDSD
 7p5rcWhURmcbtXa9v7WNHig8F4zsUxlhoM8rL6UMfKUkMwe6Ox49D+z66tbwI1TGfN+3NoAjH/V
 /WqDj4r4/HrndgZ/isWkUUJuRsA3bQg=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2f8f68 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=lRqjTDc659lOLNP7f6MA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: -csMWBcpbyRFPgrC_FQsY46qr7sW0Pjh
X-Proofpoint-ORIG-GUID: -csMWBcpbyRFPgrC_FQsY46qr7sW0Pjh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX+R2z9QKqZ0Z+
 U+7cXQhHQuWnBkRmXd8H7dT4liZVacVMaWqzzh6MJubu3LF64LP5hlMGzMu9TbahykgIDJknzrZ
 O2wGNUSN++iu38bCbviMwd8gXkRA6jmld9XkAn4txmGv0OyGQQamG8QtJ90xdipk/EHFmXaYkQM
 IofWVVLp9KdgW/ZAl251O4bOGjaJIwH0ouisfbB4Ur1/LDtX9xK5nqXQJVbrwTv4T3cVBHluQEl
 i4jiK97asWAWUHYu080vGz7BiB7HsM9GWpDyikR+4IONpPjHJEB7A8yOXqJxEoV5QFtuI8xOzfD
 OdfPV0thyDzcDXKz1F5n6shvaHgABlh1hyCKWBVysOCPUsHyRHMYYDr1lDn65PbUchzMXRSovsB
 4TKhAt2nk5T2Bq3a55kjUieJuBTqzUEfJ8hxEdxFXHAt5EGm0u/4Gm9JXBRqdy/mdVqCD3OeZdu
 +iEUiR6FyFLJr9Isxpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38441-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A826683862



On 6/3/2026 8:54 PM, Thomas Gleixner wrote:
> On Tue, May 26 2026 at 16:24, Maulik Shah wrote:
>> @@ -221,9 +231,9 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
>>  {
>>  	unsigned long flags;
>>  
>> -	raw_spin_lock_irqsave(&pdc_lock, flags);
>> -	__pdc_enable_intr(d->hwirq, on);
>> -	raw_spin_unlock_irqrestore(&pdc_lock, flags);
>> +	raw_spin_lock_irqsave(&pdc->lock, flags);
> 
> While at it please convert this to:
> 
>       guard(raw_spinlock_irqsave)(...);
> 
> The _irqsave is not really required when invoked from the irqchip
> callbacks with irq desc lock held and interrupts disabled, but that's
> also magically invoked from other contexts. So you could spare that
> irqsave by wrapping the other callsite into:
> 
>         guard(irq)() or scoped_guard(irq)

Ack. Will update in v3.

> 

>> +	for (i = 0; i < pdc->region_cnt; i++) {
> 
> for (int i = 0; ....

Ack. Will update in v3.

> 
>> +		if (pin >= pdc->region[i].pin_base &&
>> +		    pin < pdc->region[i].pin_base + pdc->region[i].cnt)
>> +			return &pdc->region[i];
>>  
>> +	raw_spin_lock_init(&pdc->lock);
>> +
>>  	pdc_domain = irq_domain_create_hierarchy(parent_domain,
>>  					IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
>>  					PDC_MAX_IRQS,
> 
> Please fix up the coding style here according to
> 
> https://docs.kernel.org/process/maintainer-tip.html


Ack. Will update in v3.

Thanks,
Maulik


