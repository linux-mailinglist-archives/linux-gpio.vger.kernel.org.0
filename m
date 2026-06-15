Return-Path: <linux-gpio+bounces-38439-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w2WoF1GPL2obCgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38439-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:36:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 000D768383C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:36:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HZqeA4vE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ktLFP8h8;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38439-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38439-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91BD4300B9F8
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 05:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9C7382361;
	Mon, 15 Jun 2026 05:36:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DE53A961E
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:36:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501763; cv=none; b=jZ6ILaFSCzkUjvaDD4Yn3RSeLmPyCHlg7CuQF9GleDOKZcgmeN5lhTqEoQgIz1K6FNhaA9xotKdsJBkk8qw21524Xj/WCisRHhfQZw9cUtCrTymQhhWWDtaXi1Ja7+7HXFVkuwuZeeKgKEe6YtBN4K3p02T//b/pTObqPgkTAOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501763; c=relaxed/simple;
	bh=7ejzRRhHDCje1fWIH3my2ejpZu+LlmMXR7YrGYw6d+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SudiC4y1Cyk8uDw67ThiUOZMPcILD1d2OVy3S89PX/p2NfCx2EjhARhg37UmM5oWTEbVxV0E+YE6aDk1zvs+kaeeLlJ9xxr52sz0fB/SEWQuiMWbBZTmfnO+mHfBozndwl9RXi4oFrMwSyyPe7+h9Y+pie0auIwdSEuSuJgB4Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZqeA4vE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ktLFP8h8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kWKr3224660
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oGetSEqda/e2ie1FOipAsTCcvEQLf9TTw83Etm/9Fno=; b=HZqeA4vE+EItQks8
	VkD/qc1JtdyMKmltIZIfXuQwB0n9+VuaGRLFwvU3queV74k9lb410RG+UM2Ftlg9
	bYaeZxI4Gys4kSIOqHbcWzP+1gjBSvVVcuzkDQhy7wgx+tYp4zmd0DZzqiBofmQR
	BNVnteaPhow93/k43Pc60bylPeYafh2Fgt4SV6d4y8RmHh1SeWSZB8VhxQfTgqBp
	EGzOgXnATIvCG9M1yhLsMexCsH5i0X0CWpNv9QFo1jB3g/b0dtbavb4q1PiQ7rx8
	exuGrddhEai2jrex2ejOK7Dr78Ch8omhdlQPM6ik9YwwO95eqsyuCKVEa/SbOWK7
	iBsNAA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u5pns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:35:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36ba24fcd46so2176855a91.3
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 22:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501759; x=1782106559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGetSEqda/e2ie1FOipAsTCcvEQLf9TTw83Etm/9Fno=;
        b=ktLFP8h8TLwOYiC0dvOzrkLshN2OZXK3HwPpU/o6+34HQRRhB98ITMuZjYL3juSdDn
         WfEmDiT6PXH2wlOMNdaR/3x9m0+aOj8lM1XvDeR86rMQx1SIroi9Tz6u4HBPM0k3klzZ
         4P5wh943K0k0cXaj9L5E1CdZcZ3xK7n8zsTu9WNBuwQVVKBlrxzN93x/8mcLBjgqkNGY
         Co+3aePZy/2yTBze6D/wvHxg8nv9QbSkSKfYPfP4wDnFE1Vm1+0Kz1xiHiTP5RneDlAu
         gERkuJezRY7KXZA15IndbwVwsE9M2h1ho12d0uJL9Ganxb8oO7ES1l/5w7xnBRoGuPoa
         U9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501759; x=1782106559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGetSEqda/e2ie1FOipAsTCcvEQLf9TTw83Etm/9Fno=;
        b=ZdDcNdz/mc7E8kbpEKrY4+WYOycjCU0i6hxrAjfX4xCrfGuL5IFbIY95gbvKTMRppK
         wxZSBIB24o4nGn90Tce8LFOK2GJGEt6RoryphM+RtHp/bOlRcPN7Yvcy7i460DqbkElh
         bao9de4+TJT2PSfyCc6Lasqi0VeuewZBi5JSeXC80Zy68TIYX8LPsNIhuonnYA4hVHEI
         PV4lEj17qTnQJIW4HFkETZV/vRQwsjP3CXeXhxJTe4VtZBOlVN9cEfkwDDy8bCowVNa/
         XpYiCYXOQwbGdu75i2LLvgIuzCjhR7CaHIto6vbJDTvhhF0z2NnO2qCwHjHfGln5+Yca
         xUSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FmrraiIQ5E0GhmAydWJcYwYCgv9SeuUJ7wzRP4ochwTogvrZSZlCQOZkGNTlNe/wBALzy1ix6Ihp6@vger.kernel.org
X-Gm-Message-State: AOJu0YztE2F1E3A1+FKhav6OFJAW/B/BUc8PZQioXKFusJVtg0RjgY0Z
	cDWHmSehTzBMEPM+6QazgON0AyyzotGjpuLaMWZx+K53diUL/sa0DJk/gnoq3H9Nr7hJOdJYCAP
	zClq9YiVP/wMkomFxRqfQeSbv3F5DrLq9uTwskEUoNvvH2KN9OOv3XhEhDouxKnkF
X-Gm-Gg: Acq92OGR50J+kluHX3jhvpV24o1UdJvXNfNu8yqCYsx2YhHbXDNx8gFrA/dtTAXcPKg
	/mW66AyEI1S5P5uPhdWYL2YlgFDNZQdxuxzlkCsSFdHSJJO5OKnXnAogrWts0HgEc6IMSgRiJtg
	UA9EBIENsaiD2DfrpZJP5iFPRaNEOAFkrYmprvVueqWO+1i8sWZEkNJ8v/EM4s6igP1qwhXGaHL
	PWihQgyovZmIJNgbMsdllo58q4Wj039+sZtycjV9/AdMujEFPfpKeYq/tCohuxz6SYid2+67UEO
	npXoKbgooKJnm1xnPcubhwncyMhAngSdWPXd7jgfWfiMSIlTHZP3TBxaO05CwuuH5t/Dn8aOZ4K
	T5jkMR2gcmO/mQq+s+NXC7o2MJ8bPHZA2zBMjbdLtUlDYbdnOqqk=
X-Received: by 2002:a17:90b:2541:b0:36b:b4a1:2939 with SMTP id 98e67ed59e1d1-37a034f72efmr12639712a91.15.1781501758833;
        Sun, 14 Jun 2026 22:35:58 -0700 (PDT)
X-Received: by 2002:a17:90b:2541:b0:36b:b4a1:2939 with SMTP id 98e67ed59e1d1-37a034f72efmr12639683a91.15.1781501758394;
        Sun, 14 Jun 2026 22:35:58 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1f07bbfdsm11133492a91.5.2026.06.14.22.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:35:58 -0700 (PDT)
Message-ID: <d5b81cfc-bfcc-4c44-a67f-8147c255c890@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:05:53 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-3-f6857af1ce91@oss.qualcomm.com> <878q8v7ij8.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <878q8v7ij8.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2f8f3f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=LOz6dEoz8Lk_-hOeqa8A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: IFN5wVBELOxPMotv4oLVgL4MhQdIZ5QB
X-Proofpoint-ORIG-GUID: IFN5wVBELOxPMotv4oLVgL4MhQdIZ5QB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX3meqBTVtgRT5
 s6jRLUxZl9XBDNCugfEBCZKXfnoc9OuiCgeJLFbQNYvDtdoBLPCLij5CsdQIj987tkAmZrGEksM
 HDWujVnMYDD14GfX8mF77anK9j/Q81BgjodCR7rQ871Cq3B5eH3m6NPUQIhr4C3bCKQUimOrZ5f
 M0HvSWzHllZh70FafGveYuNtsUxIRewKdNk05gWucOTtHF8jKGdH2zPripIk4ohkCZvjKLb6GNg
 qgYPfpsBINjhxcvv7cgim/WQvvZHSxqmdbJ6b29Bo6pVZ5K4wVC7Bp9RUVAlg13af8cWh7fPcUc
 otUKTEWSFI8O3RK2gcOuJzA66ECgZ94ptLRwU1ebfmdespeWeyTLJ2XMtqjVg0lPo1FoPWzvtHs
 7haARBsM0l6ZoDvvo7B9ZeHtMzo0xjuXH6+7msgwF30odqqMTJ4oHBlE2L5vKxgtdufzBmbXq6h
 nInrQLsI2HzDDiynlqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfXxCQqkBH1AZXD
 poqAMjPpjlubvD4ENfkAGA0Q6gYpNdZLGbW7jK5oSuIbHuNdOQK+oJKsOsh1kRPssgoJClDoXK6
 DWfolsjhHtAnr/UtI4gBScU6Cd6jXK8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38439-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 000D768383C



On 6/3/2026 8:55 PM, Thomas Gleixner wrote:
> On Tue, May 26 2026 at 16:24, Maulik Shah wrote:
> 

[...]

>>  
>>  	index = FIELD_GET(GENMASK(31, 5), pin_out);
>>  	mask = FIELD_GET(GENMASK(4, 0), pin_out);
>>  
>> +	raw_spin_lock_irqsave(&pdc->lock, flags);
> 
> guard()

Ack. Will update in v3.

Thanks,
Maulik

