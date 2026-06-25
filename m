Return-Path: <linux-gpio+bounces-38878-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YdaxH/rzPGq2uwgAu9opvQ
	(envelope-from <linux-gpio+bounces-38878-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 11:25:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 165F86C4320
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 11:25:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mPhOKPYY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DSQvy904;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38878-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38878-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EEB3E303320A
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 09:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5440E3822AF;
	Thu, 25 Jun 2026 09:25:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FA338238C
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 09:25:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379509; cv=none; b=jV+ipHOAzTB9inPaqI/41gAHZc0iXY1P9ayfzb8F7x1PjYLQxwf2Mdx+L+5h3VFtpcYUn8f6JaWsdOXRGFfzuCsWUBviHuG3U9gq532F24K3soSPj2SfhJOoF7tyo6kjwkqPymThY4cLH7k89NCvLTInzpxNHUTbK8IV11TDeeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379509; c=relaxed/simple;
	bh=S8A0MIsdoB9Z/bl+h5cGSw/0oJ1b71iteY6tOP0fHiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+GzNZ4Paz7FKyrP8w7mF+tnCvz0Gu3onFx7q0yvy4FoSyS7cPTA0Gg1wXVUL17a/Q/wu/h8fhub8RshSiOXeDSWS5+KbJ3S8smPs3F2LeyAYefIsEbxQcZ4hzCHDjBaOEXs0azQgM0BmpnCllQH+v/6fZGp5OSVLg/vXeDnvvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPhOKPYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSQvy904; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8q5Sp1601035
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 09:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wlNuT8OW5AbZRZ7zo4XpP7ZzYh3qaFOpGyK9QlIFi3o=; b=mPhOKPYYo7sZFSr5
	XTZGuZPsvhu69DYlKmxwyy5qidNe0ck28455KYP1eDHO0+1EffsJp3yKo/MjBWNf
	w71e7JGLRleyPkR4jJYehbB/6ytztBKsQOYouMQwkW61G0X1z7CAP7s739/3o5aO
	VTtHI2aMYlNluLDZ3jZXA1T9oK07hLSmNZFUElf5bcC+txPB8VDas82GLPId9XBO
	lWQL2jP8McJUdZ/ToFtRRyi1BIZSubcjvB4b/nSNsGN/PuT87YtInaMCeQTeVqaG
	6dz2dtA9qdnncx4/4XlRQFJeoqgHmIdFHHDeP15aE5zsMABnJx8MZrxPxi3cl08m
	mUixmQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7dukyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 09:25:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7ef3cc6d4so8255325ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 02:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782379506; x=1782984306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlNuT8OW5AbZRZ7zo4XpP7ZzYh3qaFOpGyK9QlIFi3o=;
        b=DSQvy904739pKXVNqk7EgADlvp0KpqEEzN+oMIAbZqRTLW77FT9ulZnZbWDYlz7dAm
         WsYpWuQuMkn5eUeWPWk2HfXyYiZHCLQ0drUAAQFsXjbp1JG0+/nXr1y21UJzrUp7Cs++
         rPvybZukSUC0Va/PUaOPXLV8MGWqqJYIwjNjZDdgbyZqgkMsaUhW8kH0UcO3sJr4BY4e
         9sWkmGtWPNPXTqx2Ie4qvtnC1/Tj6o4anyH02U0Ra8I/J+3sUia5fOB/87B8LhX8PBPZ
         /zw5MZOP51z7RUBStU71ZGOhNVb4jai4p5CB3dtAQ5HN5ISbAHRH+0gxriGy5QQJShLO
         HzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379506; x=1782984306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlNuT8OW5AbZRZ7zo4XpP7ZzYh3qaFOpGyK9QlIFi3o=;
        b=DCIgZAx5i4RLwS42mOM6sbeZaDq1vxQFFZZ5s/7II+8dmqa3kRdXfpzXNrCnADjqLc
         EucN78ExD+7wST6bj4bzHxn82gp1EzaqjCsjNfgB+FsGDdaAIM0Nsd0dfw7SHHx3uFJr
         ptTk+0GStcrlQdAfIGyVIxHYUIokP6DAcQc08ita3m71QixEDbBZcMSfeiS+Yohi4QXE
         IpsDeNnrJHFR0xBgzLBBg2LvSHADSboZMWlJfYz09tZ+4OmO76DX6Mb5WEqdZkXFNIAk
         UBPDtVcihuhchMV7r/o/6DTyN8SI46knwuUiRN+DZwUbH9P9TnRU7eVrBhxrQe7GgnvO
         d0rA==
X-Forwarded-Encrypted: i=1; AHgh+RqPYapb4dFIhyQU+pop6AgfQKq7aHBzymyvzQARTFhmE9ku37HEVlDcQdCvKngFTz9sUgD2wDk5bMGe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7JotMbbEOdrT2pFCSZF1UfXOIu4avP0V6vTEa8qC5g3M2v5uo
	dl84338DSMa0qARJTm1NGcTgkQUeyyRtRFcIGvPTZTpMNcZgR6GW0vHlK12EoEBkL7fGI8Ffbmu
	Ya6NJ3vE6S8+xOBq86gJVJaRWiuBJ3NosuEU624z0eL9+MtGOuwKlv5BoRoHev+SP
X-Gm-Gg: AfdE7clJwk0YteRsonlP7aZB+X8WYKrrylelmluDiQ7pNUmakCnequqg9CyTYIyisCZ
	FDJpa1Yt1CHKyFRFBXHuu8p3xfhKoc72uhvZpciMZYYlOzuNQgLsunRLvQvbqOb+sZEGVhByO+Q
	mDJ6RjXnXmKYl2iHGGomjIzDKXnU/2i3878Ga6EHgzS3pD903dHS3cr6FqaQ5OR7utOEnYCVWBt
	eL5U4UjOFojhHB1Cc1Oo6sx+CDXViLMQfBD1kzGaiHBi5FxX4GoTOZoH6gMaJ0NowFFoJ4n8cjA
	EKmcD/sfpLCRLqAQhG/fk+9gHLwQ8BB9r2NDD5lvn9Nl3AH6hOKB4D0NddJEVJw6OYQkg5oHp1k
	Jrm/vdR0V/EiBCv9xlyG+3jlVbarVtCZxewRWhg==
X-Received: by 2002:a17:902:fc4f:b0:2c6:6926:8968 with SMTP id d9443c01a7336-2c7fc7406d5mr19613945ad.20.1782379505616;
        Thu, 25 Jun 2026 02:25:05 -0700 (PDT)
X-Received: by 2002:a17:902:fc4f:b0:2c6:6926:8968 with SMTP id d9443c01a7336-2c7fc7406d5mr19613565ad.20.1782379505130;
        Thu, 25 Jun 2026 02:25:05 -0700 (PDT)
Received: from [10.218.48.36] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5afbbd9sm16716915ad.28.2026.06.25.02.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:25:04 -0700 (PDT)
Message-ID: <82bb1355-7ae5-4123-afe5-890c6a6cdd27@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:54:58 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
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
 <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
 <e513bc4c-ddeb-43b3-aa05-59051136ba4e@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <e513bc4c-ddeb-43b3-aa05-59051136ba4e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2yPTPn8G_QhP0zY7t9_mVf9Tg3jQ7vMm
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3cf3f2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VMtcQVj_OTphKyc3ifsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4MCBTYWx0ZWRfXy0s9GPlk4v1q
 H6betuuywTis3XTVAS8nZChI5P0wGkYYVL54rxyIUtItcT5GZgDT6x32PjN+90vQcUGFfVkyCrO
 h13SxC1QUOeSxwOOIAYFTsxI6nAmXdM=
X-Proofpoint-ORIG-GUID: 2yPTPn8G_QhP0zY7t9_mVf9Tg3jQ7vMm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4MCBTYWx0ZWRfX/sHInIw1z4SE
 XzmNDMpCTR//9VTY1wLsCusJ5v72omcolJ4nhJ/1xf2r90cliWaBNE4EbnvPQy4BXZEaAEf3aYb
 cqSf/02iFEuwjxW3H5bSB+kOnt3tb/jyPhbzuZFuQijO8aeQZfM388peCJL0xQMIem1sOhy36pA
 Eo6ew5G0OhPFflSintUB36HF6ilRMX1oZeUe3ZsnXo5pNhhmHcfPsRObkqxvKXIIn+jImEObj2X
 1Hy2sTus+JvlMhOt8QWefj/fQbxyg6nWAicBarYrsmjf6ZiyeuCoCilbH3RqVdF2Ek27+vaz7t6
 46a5kOsc95jpkosw8wqQHbO+I5VySXAUKfqhqo/BBjIWRBwoCx+SM6wg3vHNwOsP7oktlTSFpqD
 ztwP7qoW7y0NnzNvQppVNfCidonog+XqZhNAHMnXUW3UUBHWB0z2233a+SgiT9bDQ6KfYt9Feak
 opCyp1FuoPTx0QtUVsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38878-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 165F86C4320



On 6/18/2026 1:48 PM, Konrad Dybcio wrote:
> On 6/16/26 11:25 AM, Maulik Shah wrote:

[...]

>> +	type = IRQ_TYPE_LEVEL_HIGH;
> 
> 
> Please carry your comment from the previous revision:
> 
> /*
>  * PDC forwards GPIOs as level high to GIC in secondary
>  * mode. Update the type and clear any previously latched
>  * phantom interrupt at PDC.
>  */
> 

I will add back this comment in v4.

[...]


>> +	if (pdc->mode == PDC_PASS_THROUGH_MODE || !pdc_pin_is_gpio(hwirq)) {
>> +		ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
>> +						    &qcom_pdc_gic_chip,
>> +						    NULL);
>> +		if (ret)
>> +			return ret;
>>  
>> -	region = get_pin_region(hwirq);
>> -	if (!region)
>> -		return irq_domain_disconnect_hierarchy(domain->parent, virq);
>> +		if (type & IRQ_TYPE_EDGE_BOTH)
>> +			type = IRQ_TYPE_EDGE_RISING;
>>  
>> -	if (type & IRQ_TYPE_EDGE_BOTH)
>> -		type = IRQ_TYPE_EDGE_RISING;
>> +		if (type & IRQ_TYPE_LEVEL_MASK)
>> +			type = IRQ_TYPE_LEVEL_HIGH;
>> +	} else {
>> +		ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
>> +						    &qcom_pdc_gic_secondary_chip,
>> +						    NULL);
>> +		if (ret)
>> +			return ret;
>>  
>> -	if (type & IRQ_TYPE_LEVEL_MASK)
>> +		/* Secondary mode converts all interrupts to LEVEL HIGH type */
>>  		type = IRQ_TYPE_LEVEL_HIGH;
>> +	}
> 
> nit: (pdc->mode == PDC_SECONDARY_MODE && pdc_pin_is_gpio(hwirq))
> could be the primary case to better communicate intent
> 
> Konrad

Made primary case as (pdc->mode == PDC_SECONDARY_MODE && pdc_pin_is_gpio(hwirq) in v4.

Thanks,
Maulik

