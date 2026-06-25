Return-Path: <linux-gpio+bounces-38876-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 43tuAcryPGphuwgAu9opvQ
	(envelope-from <linux-gpio+bounces-38876-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 11:20:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EEB6C4273
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 11:20:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E8lFmxtk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Zrl5u3gC;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38876-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38876-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3EB63029613
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 09:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F59A276050;
	Thu, 25 Jun 2026 09:19:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5663803FD
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 09:19:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379198; cv=none; b=Y3HAgWOhVzWnF5DoQqkD7UC32tyXWFBonYXx2u/NO/7x7XOMjOdY+fitC9lR4jDfPFYytwuki90dq8DjlOgCWMQFkB8mP7COAxn8Pd0qqiR7b6MvMNfxzjkOKDrMyONUTxDo5sMMh8BmmAwA1fDBD5qTbRsYICfnB6+JvGPLyXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379198; c=relaxed/simple;
	bh=hdGdTRwXZUAHBYrQRCnjjNIUVi+Ph8bQ985QztC12M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dIw3Frx3FM3h3Utu5feYqfy+YWzZYFv3IJxsh8fI+hmlkWwW51EfENrYTjegZ5WwUSchbFrqTXsEw83LvumkiF2iAqtFS42J6ydZtH6M1+R0yWwg0Vl6acRwsBw8+ebMX9khMwWkpahO8Cdg9i3AM7m1nJ4g3uw3GUKu0Vj/yiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8lFmxtk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zrl5u3gC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pRuo1331836
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 09:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fSocHQi8UJHt7mzffHvcYPaCm4f3C2k+N/a+e3OZkfE=; b=E8lFmxtkP0QwWi3O
	SxHrdHhmhnR8bT4JkAwenCDZqYqT2VtLWUByME56CWZQ0b0oqJJ7Urnx0kt6DfKN
	QsbJOYwSPIkiuFtXJifSyAVPDgw44Zn9YmnLymPFrdUZidv4qZWqlrK9DrYbsclB
	qaDQKVAMFoTilIUGvZIxAqPkg80HOReoM5YCCfxRWtoBc1xMy92bgcmiOi4Dop+2
	1aaA1TKiQpcg6JzU85z6xVDrA5YQKPkACxFVlc3nWz2fLbl0aSdHSJIYuNk7Gvi4
	srnf6GA1JlfuQxrKFm3AQOeGf6jFBXET1Ue4LvZU97+ihRJQD+HA9M1lcBMrZp9N
	+7eMCg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbtx60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 09:19:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37d125687b6so2510947a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 02:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782379195; x=1782983995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fSocHQi8UJHt7mzffHvcYPaCm4f3C2k+N/a+e3OZkfE=;
        b=Zrl5u3gCDAGtfH2OiZKGOlQiMgiJzcAWVufDiFlro0E3E84//xIyvZVlwGr6TkNb3Y
         nENm25jHMvf3pcO0gNhX13k1V0g50gLvc73vD5s6TK3GXJOffzbc9suWveIU3PmObq+c
         C9PB4k0hwUkYM0NauX1V9irzob937sB7h1AJjmH910SltgmbnnRPmkmlZnXAj1i4ri1f
         lCO6P4SBEPTJj89gj1LuoXalmz77UVA+y2EyLtPmpUzTP+wvYhi2obh9uSblbF+Cxfq6
         GOA2nhrAz6ukFnTgTLa0htm5Il1N7pEtyRcZkDs6sRBJr7brIfjK0dsDQ6fS3uvd9MK+
         n72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379195; x=1782983995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSocHQi8UJHt7mzffHvcYPaCm4f3C2k+N/a+e3OZkfE=;
        b=YMLaRUNjKKjq/vgWL4Djre+qA1Upac8wVfUaXU1tnpi8U9GifrWv4K64wZmW7kPLYj
         zbeHxzKwOglaYiL00V+i04CuPgAFv6V1qVqtAYf0pol9ViqRsoYldT4F5J+Hl0eNGXb3
         +bscQ5OeUyvFxXafqiYoQFFrU4AUWLsMbNvHrMq5O7EpNBxZnJvcyLwrGOMnjHn9lSMH
         9OKrc03sjx7W0H9rNRamOsEvXl4HIhWcq1K07XXSC87L/lqVjMg8yINSyPFLYUWHZSzJ
         EasbEzGI8EOBabEsWs94bAbgLIg4ctmOGBQJkUoQOgrVPdQA18KntOLzzQ3McXwWKqzF
         DN7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqXvteERQ1bmutpzM82Qn1AQ9TwjlK4YkjjExNaSZHpMOkngkaff/50LwUaw6uILqGlDovQzPsftSqN@vger.kernel.org
X-Gm-Message-State: AOJu0YxgbehCp4WlZnoyxdu+tA4wrCWWLEDPJCdO2hJtCZMjGacxdHcq
	+Hc+DiJZM53GkCq/yMS3GUyTPB/4bfbXTpbSGMv/WlMrvWOcmx43+gxsb7toA40vY0ng/lb9A8s
	Y5HbhD7FaGuztEBCPEiBK872+pFRYl/pPcF9a/ug2Hwk6WvKHtiWehSZbkNmOrNpE
X-Gm-Gg: AfdE7cmEUXxv8L6YgSpOBYmT1g0B8/FB11T0BGcQKt9SNrRoH+Te1JWooi8YGEWmwNd
	sE2wTcNbJyMAicM4m25v7AjYyQvDDn+1AnUFrKj+KDxJL4IYCSMlqN60+kLfJfLr15XgBJcdNok
	ZhYtc2Fa3MABoRtyRLWG06cETNLF4JRjv+dM/0/IC0sVzKH7y+r3qfeImsKig4pG1IGl6qWqGj/
	JG4S2SgPKRoyhke8Ez6xu0TRXHxj2koOx0jph0+MSINIYOfXJzTLHWSunouiAklTy2h6vRnrNjC
	X4eHPpVK98Ua2DVc0gSoZUTd8aLVWGg0Fj7fXUILjadFIZytbHz7L07bSWBTHvkq4zAiSuAOCxL
	qxGTavzb+grCQ55uw0R9eGMAbY0eXDjvryVy5oQ==
X-Received: by 2002:a17:90b:17cb:b0:36b:936e:73c8 with SMTP id 98e67ed59e1d1-37dfa2551damr1806964a91.19.1782379195067;
        Thu, 25 Jun 2026 02:19:55 -0700 (PDT)
X-Received: by 2002:a17:90b:17cb:b0:36b:936e:73c8 with SMTP id 98e67ed59e1d1-37dfa2551damr1806947a91.19.1782379194631;
        Thu, 25 Jun 2026 02:19:54 -0700 (PDT)
Received: from [10.218.48.36] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3dfdba5sm1559548a91.9.2026.06.25.02.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:19:54 -0700 (PDT)
Message-ID: <91fa4b98-d99e-401c-bb1f-f235034f3aab@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:49:49 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <8754de51-bfbe-42f2-84bf-36cc000afa3f@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <8754de51-bfbe-42f2-84bf-36cc000afa3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfXzwpR8Qw1PTos
 lZoeUD0LTrZw1zgC+iGaQG7kiFDTnkblnmHaBF+UMekdp1tOXsjmjzl7Z2HzYzXfNCOMNIOrves
 OwC6O2YT1tv8xtyJLG6w+pHWkRKtqME=
X-Proofpoint-ORIG-GUID: sLA86iiKuh1pdsC_pzAtMIN1pNKXtUSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX6ykkaFISydIV
 zeY9nIj5kkK8CgpWx7g9ajdzrdOmWBluPOdPmT1LgUnCfX9a7ZOTR7hO3oDT+R5KNWZTemScevA
 JkIKi4I3QUpZaj/pyI8g6LCFrVBrw8EjkRNAjnGRiTQhg/aYnQka/H+EGjZJg0lbVnahaWRtR0W
 biBDn9+TKuL1TIEpEIPGuejI0aCuSeeza+okTVdAZCUQJsrY754fIsv2PCgZpF1+n2jvb+h6YQE
 lFKjCNurg2VgEFRVqmkxGKRcnpAkgua8GRPQcPSJeDp3GfHXFQvmy7h7tpPYfjN4GaHZWwvfIKh
 sDBlSVsJB0L27g2VE348LbNu8irrjkRgdbx3fWfmJ2cLD5xLgwA2/3UK/j2m9U3NCJz0tfWTnWh
 NGnAvHl68XWub8nu8NjG2ABFJtSr0aW/Hs66Y6VR6hHPFrU1qP1zCcdYxCRTDUBDvY5RyCMBBLH
 pZMzCm2nj9AuNk808Nw==
X-Proofpoint-GUID: sLA86iiKuh1pdsC_pzAtMIN1pNKXtUSQ
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3cf2bb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Bm-T1vp_5s09-KWsw-sA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38876-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67EEB6C4273



On 6/17/2026 6:56 PM, Konrad Dybcio wrote:
> On 6/16/26 11:25 AM, Maulik Shah wrote:
>> There are multiple statics used. Move all to struct pdc_desc to better
>> align with versioning support. Document them.
>>
>> No functional impact.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  static void pdc_enable_intr(struct irq_data *d, bool on)
>>  {
>> -	unsigned long flags;
>> +	guard(raw_spinlock)(&pdc->lock);
> 
> tglx suggested to use guard(irq) around "the other callsite"..
> which I'm not sure where it'd be - maybe around __pdc_enable_intr()
> in pdc_setup_pin_mapping()?
> 
> Otherwise this patch looks good to me
> 
> Konrad

All callers will be from irqchip except pdc_setup_pin_mapping() which was
invoking lock-less because at that time irqchip is not setup and as such
can stay lock less.

Once the patch-3 of this series is applied pdc_setup_pin_mapping() too
will use the lock as it makes direct use of pdc->enable_intr() where the new lock
is kept (only for v2.7 version specific enable function).

Thanks,
Maulik

