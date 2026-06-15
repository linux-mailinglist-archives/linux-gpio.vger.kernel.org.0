Return-Path: <linux-gpio+bounces-38442-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ESCuKo+PL2otCgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38442-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:37:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 499C168386A
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:37:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lvmeXDRl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ghG61zTf;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38442-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38442-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8126F3001FEF
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 05:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0F13ACA48;
	Mon, 15 Jun 2026 05:36:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A9F3A962E
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:36:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501812; cv=none; b=bHtDagcuPFVgmU134E8wuxJ/uBSwl+gIF0HX/e7tJD7R+JIArs+nGJ2Wrz0LiDoWtIqOMxLj9QPVKKN1bFUQ6Q0yYAJzSilmZOCxv0kgsRGw8q5koSVKg88gJpwzKfbZmkJt7ksn+fsbtjHATvHsJg8gBwpdwzlAJNHSgLlX5WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501812; c=relaxed/simple;
	bh=qYK+7l93uL0ldevPNHCeXcekblMkaafTeKpLCsf0SqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NnIshML5swaxJm2AE+Ht2iRIFNF1NKbH+jdtpGKiYeN+xR/an5aRCU/fQgjO9bm7Nvtbd/aw8j/07jhADB/FB40F+zUoWqXip1ztDNpDGN+9zr2AhVpDk4FDwbN/ivo5ikpZfK+RtWcdkDcbvihP3NXpbLsCiOmG6zJGzJ6xF5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvmeXDRl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghG61zTf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1jCCn3244256
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L5EGAAXepjhAnoVW1OslX4X2Oh4gOE97bCua8lUPgHU=; b=lvmeXDRlx2SV6MH+
	/kRZ6XZfENXNA7KpWZAat2NMSIWqCbDgLpoVQagcgITE3a7MbGHNjdl264apciCo
	54adl+YJ3Lrtxnr+CVGXOtCvihZ0ZhOCuKDBqQ8mYP3HukpXCg/LlJc7dOipDnyo
	Bhz4pLE0z6kfWR0AEY8fWoF254Pio6aU0yflw1JO12zhKbq2tZYIwUYzho8rhc3w
	NDNDXCG6UhLQOwxzlIRuSBQdJwnotcUDPEwyDNVAfy9ud0mailK+o+5gO35IU4H5
	vo4hDTaju+I67VEzd5T/Al6HvZqp+n3rTrQiVHsVXz0kcKH35FK6tI99PEjkFN2A
	yB2W8Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gwrdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:36:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso80740065ad.3
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 22:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501806; x=1782106606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L5EGAAXepjhAnoVW1OslX4X2Oh4gOE97bCua8lUPgHU=;
        b=ghG61zTfZKoYJFgHGYrJUsQKuYJrUgoOr9IkMAGWPy0sozpIZCt977UcifsOhUFkYm
         fGnW4qJCGtSrEaxTqAbLurrR2ykn4TV1vl7/aW3+IiQdl2Q6HjEZ19TWmU7Z/ac7FZYv
         ycKb3lE5W+tzfGSP2pBBeDCPrI294HAOuEMbil1K3JIWyXlaRfvdOQUvOq1k7ppcLoNV
         9Mkw9Bawbf0BtLBJtUdCrE8f70b2Eqaj2pNDgDThh7JinaZPWxxiCS1nwO2Mu+ggdEKl
         kVeBA+qRRzgviXvL6XPfBqORSwiN+JWPPu6jEMxFgYGwPfBRga87e+ZDk4U61CTzmIvM
         emDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501806; x=1782106606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5EGAAXepjhAnoVW1OslX4X2Oh4gOE97bCua8lUPgHU=;
        b=BNwvTw2daaSYxZXwk1quF9wO6AUeG6MuKC/zw7wZeDEZybcGN/mCepbIAmJw8oiWDW
         7qVr6l+ty34kSpzw/blFvh+t+2P0ccvGiWQ1X7xdMsanzaGaChdG61hB9IxQvaUrNvIh
         9rvWlYOF/Bk+60QyUxt9NTo2kriuy81cfq7cKiEfCzyI8gzH/WWrlnh5L4FKo9E3N+9o
         es+pUtgkW7y7SxJltGPpg4ky+8YHERSTvkJof1O3iWNgS+sBGF72xTumLJy9AfvfS6md
         iCbEH/FjKw4smYSTYQQ8/5dJpTVR6zmGVd2MPKmu0ReP+Q7PQKlkIQw6Fyult2rvZWrv
         zebQ==
X-Forwarded-Encrypted: i=1; AFNElJ9raROzGik3lRtl8gy8Fyo/4lg1rheFML9hLujV4gEndzblAGnFebtxDGGh6AH3LDjuMEckRf7BA3tz@vger.kernel.org
X-Gm-Message-State: AOJu0YzEEE7QcjIpBS7/uajmmGv24wuqFkCi0uL9wsVHvoX7KzXZ3fjr
	TZkZqDrFIYO3dcAnaTtxYdUBQ4io6/rKkacaq8OBkMTLFVihrm0re31K6GVP3wR34gQBfMzzBXf
	rL1lAXHmnKHYE262X43J+XWooRQv+/QF1/Loz+QWP+EZmJtQ1IxSbkfT4UbA4k47Y
X-Gm-Gg: Acq92OGJPJxl4OkBI6sqs/lAKMTzOHTe4IEecNVTpoYIj5pICF/MWEMTTpxYE7eZRCw
	Nk7vkvbr0dgl9EgsoT3VtFUBTa2rXMTALKlg/q8yrHiY8hM9883Z+MgV8EJGvGRlZpcJrQOTIMN
	dulcR6RQxxaotPN4nB1+X4SgrK2xb2IHWFXbzxhghyN3KbM+GQ+APz30/fbPjyEbIkbvpiiAr5p
	rDaWFLW+J3wXsDS6sNxctH8bvWrODJNVDSt7/QWpBO7bKPH7XpDTmkix58F8Jr2L3JEnuEaWTju
	yloRJ2fCB36/xjU6avzaHCRX3VrrZ5qzV5MyOzYQjkT82ieKzCEAwea5WZNaqcNsajM2X0qXnE/
	1QivoAD7XDNw+CLUa7BxcxeylSY9SbCwCfzjcFqfLlxEi/B0BH+k=
X-Received: by 2002:a17:903:2cc:b0:2c1:1a22:7c43 with SMTP id d9443c01a7336-2c412360000mr140474575ad.24.1781501806507;
        Sun, 14 Jun 2026 22:36:46 -0700 (PDT)
X-Received: by 2002:a17:903:2cc:b0:2c1:1a22:7c43 with SMTP id d9443c01a7336-2c412360000mr140474275ad.24.1781501806100;
        Sun, 14 Jun 2026 22:36:46 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c5dd0sm111774125ad.20.2026.06.14.22.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:36:45 -0700 (PDT)
Message-ID: <743080a3-c693-4a9c-b12f-b1e46a4893f6@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:06:42 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-4-f6857af1ce91@oss.qualcomm.com> <875x3z7igr.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <875x3z7igr.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX03cNUbzUn/qk
 JcOcU9qXPbUghS3JtM7NtqXOjFYJgSHHi1Hp6xogVOsIO1ilNQlnlaOWp7a6uh1Wjr4GHSoH5BG
 GWg8AD+qI0KN//u2mWW7xE2nVbZAMAM=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2f8f6f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Sssc6dVpwyjkiyZbIosA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX2H1hbWunMO1x
 mRwwfJH1lgpbaStNZzNYOQwf8cbkFulQqh+Sn2bBsjDF4Zh9p98anqJ6tybj76Xggl2AFY7p1TX
 gbroxkuKtIc/26+46fwJucHqqqxbCGz99mCKVTnQbdaTZI6gUMEpRN244SVp8Nmwq8PfRUWE8rw
 C9/sH4JkZonwB068Xxu1eMkdwJw09ApB0QQ/3KwBGGcKcNOXqK/nOEZyePjj10ZyFz1js1iqiLY
 0khBAcKXi3sYQ75KvWByKMM5cOuCOUNvaIr0gY8Q8Ljwe4GHnOBQS7yIwE2p8fEg9Q1bxxv8Fem
 sdal2gjwVWzXVt+KzPuFxQQ+xcLjeUSucUL9cALA26cqQuHFNiEUCEhNDDv0p0IQTF+0i4hhy2a
 B5KYkqLEdFCeyEaDmd5xE2on8xZgzLu7EqkaMpjziY6fPMDeVZque4UbTDP9wKLsH3mjWiarKWg
 MJIc9tPFC5jM+TBnrTA==
X-Proofpoint-GUID: 5L26q0YoSzDYKUyzCkDiPW6EkDAHHDN9
X-Proofpoint-ORIG-GUID: 5L26q0YoSzDYKUyzCkDiPW6EkDAHHDN9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38442-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: 499C168386A



On 6/3/2026 8:57 PM, Thomas Gleixner wrote:
> On Tue, May 26 2026 at 16:24, Maulik Shah wrote:
>>  /**
>> @@ -92,6 +99,8 @@ struct pdc_cfg {
>>   * @base:           PDC base register for DRV2 / HLOS
>>   * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
>>   * @version:        PDC version
>> + * @num_spis:       Total number of direct SPI interrupts
>> + * @num_gpios:      Total number of GPIOs forwarded as SPI interrupts
>>   * @region:         PDC interrupt continuous range
>>   * @region_cnt:     Total PDC ranges
>>   * @x1e_quirk:      x1e H/W Bug handling
>> @@ -104,6 +113,8 @@ struct pdc_desc {
>>  	void __iomem *base;
>>  	void __iomem *prev_base;
>>  	u32 version;
>> +	u32 num_spis;
>> +	u32 num_gpios;
> 
> Please fix up the struct definition coding style.
>   

Ack. Will update in v3.

Thanks,
Maulik

