Return-Path: <linux-gpio+bounces-38326-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fvGTAwWUKmp5swMAu9opvQ
	(envelope-from <linux-gpio+bounces-38326-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:55:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81627671136
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:55:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QEuT0ujs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Q/u/rHdx";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38326-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38326-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC3023050A76
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521493D8131;
	Thu, 11 Jun 2026 10:50:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B2A242D67
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 10:50:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175043; cv=none; b=oVrEY4KI9x/lkWZBHpK490AGrP2r0HIeEhvEU46/JQp8o+qUjY32t0dN8QKGjoMB3N+n12kSxCG/bIvvFZZLGxV8ftot2xVw0Cb3+0cTRt66I245/VO0+Ft9PTyff6BZu7XhuuVyjLxWfB18wNUc2ix0X+ct1omqZq1yjaRXLfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175043; c=relaxed/simple;
	bh=8ZWWOKTpAlEnSk2zG7CdZOz5PMMpg9lVIa4oHXZQlfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XclpMUgu3eq6+y6UapQwAMtHgDwyzqtD38iKX9CaeXlpNWxdzsKT5GVY5mrHm0yChzUVibGZYmvoR/oAAVKt4PIAnHbz0BkiUh77ACokjdjcsXy490ceXjdLll1zOFWbtka6GhY2+2Rg+r45DxQCUepmBBmF+pVIE/cY8tSmysg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEuT0ujs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/u/rHdx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA10Zg299638
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 10:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KZ/dU8Ix6ev3UMm7ySdSUm/kqyhRsf2+eLAI2/zCwiI=; b=QEuT0ujs5lGyDUK4
	22q/wYlbS5TK4iOx8WdigJPf5IcU3G5nAzI56/az6Lt5vvFBn9Qk3Mb9StCXTUIK
	S5tawApvciJGb68s3xIq70RSP3ebxgM3E484S/oFkiWTwafhy0F1Hg5gYo0P8XQ7
	uvt8A7Wi8h8nbETZ1x0df6I14lvS5OEh3WKhSYTYym9b5gQ8CpjswxMbX8N9AKQ3
	4IU92mjrq6+l9EHlZgPXsSKdwnu3+/hLYkZJzlNe35I5oNuRjLn4DVGhEzsFr1Wd
	up0uhyEr6FoZnDmMs0XnAnyoDICAmxOWyRuG/Q7ZGqDx78yFqXTWt7mgm887m6nd
	bJ9iXA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe703009-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 10:50:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178ac43d27so21879481cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781175040; x=1781779840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZ/dU8Ix6ev3UMm7ySdSUm/kqyhRsf2+eLAI2/zCwiI=;
        b=Q/u/rHdx3kxczXu5Rmi+xoPxTi5BMy1r/j26DaPx0Q/TgVoHYqagsuSH2IPPe/RXZy
         GIWaZicW+QIyXeNdBzufjXG3HCI83M6DzHXMwjhclK3OhSdYMycmNJBzsXUtVKDZA6ZL
         ANrZSY/yHtD8FUodKz056MpkYb0PmIo4vEGvgETHwAcK1seK4hBvS68e80zo0jgF67QB
         thADwG00DUVgj1Ri2CG+r4/DUeEgxzINPgpaZ74gQwxoAo/gbhNsHkEIeHVTAC8rtylX
         GEWKmWxfC2tBy0REmAX8e8OTweLt8fXpmy6Z23m94Hg+Ql1UnjlI7TYo3r1qCUZJNNi9
         wEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781175040; x=1781779840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZ/dU8Ix6ev3UMm7ySdSUm/kqyhRsf2+eLAI2/zCwiI=;
        b=QnhH0EhS7fv0FTWiitr8d0Mg+fDYREZby6CKsy75cXdDnvNsGMHB2tZnqqhuhFXw7+
         R+azEsHgESe1iU5AvjN4muTAFcUUBjI/WdKtyikh2c/dpAT1nzh5aKi9QHz2s49VZ6UN
         EABle2pVqsfVkYaO+GlbFGk9m/Ns7z5XLS+y7cjk+qMHhTKZYlLaXd5pUqaKwZTiR6u1
         c0eQ+clWzSByiqdrhIS2VdGWOj0ydL0bLqHeVOv4YUtRRz00U2hvkxrJVSNy3Ju2HaiJ
         qRKruTfBvTMKwxsTG8xcRZwsV9OWsYdzvgSHGXKnuRedJISCWftITnuly72y3SANn6WI
         d/JQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tMRhnS0OpoLqBDc6cU6Tlu0Wkkvt7kaQRbW2WPsN7Fv3ZrVW2g1/4ohYtmYo0RLS6YoE/iYsCivKW@vger.kernel.org
X-Gm-Message-State: AOJu0YxfdZ/sPT7MRHqWvrbhGvzzv5MtzSZdP9anHPkU0BTn8lewr2qL
	czX8/oabhQpJq/swtH3cQxL0eKIyBrtEaW34wcveSNsIljepUVt/U7BYPg9VhGI8TeigojPG+Tf
	8alz2a8VetpNZLqH5ceI8vxHC5z10DigPUmn9XK+YwC1f4N4B/DBSTxwf2IFjOnei
X-Gm-Gg: Acq92OEDbUTBiaY2Dn4kODfndZ0JCRiNPJm3Py0t4lsqT3fuMbM7AN792ZhQ8S9s8gH
	uUt9bKfYBmi/5asrAmu6XGVIjNWxa4HeyDsV4rGoVUVMjwW4YCY6CQeWnC0Go3VTyt9iUkep5rY
	Frvv4FwBFPp44FzBvr+iUOifbiiE3OXWg+LBWn3j8jddR21j1M9hV/C/T29tH+3RLyq/HQRGz2h
	XQkmNxW12+76pSwplI08hsHwZ8Ps9ifT3sj2lNRaBFsbRWSOECks9vf3DsY5tL3awJLU3iLiohP
	bBGnDcnMwEAoGiyx7Z9HEYFjj5HPWbw7E1wFkXPE2/G/homwm4KVtwgbmQLgZd3I3v8KrHlQWo7
	YSVl5Bh+r20zVii/eCvxNQBYIUOCMjeEa3Yl64GSQNqe20zDpJrDUGiQy
X-Received: by 2002:ac8:57c5:0:b0:517:8999:6c50 with SMTP id d75a77b69052e-517ee28c903mr21050811cf.8.1781175040381;
        Thu, 11 Jun 2026 03:50:40 -0700 (PDT)
X-Received: by 2002:ac8:57c5:0:b0:517:8999:6c50 with SMTP id d75a77b69052e-517ee28c903mr21050521cf.8.1781175039910;
        Thu, 11 Jun 2026 03:50:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb53c23c2sm48462166b.40.2026.06.11.03.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:50:39 -0700 (PDT)
Message-ID: <c036a07f-525d-4af1-9e87-d62e111cc908@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:50:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] irqchip/qcom-pdc: restructure version support
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
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7aocbI1TadBHXd0U88IccP2tT-Fl4vaB
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a9301 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KDmjLdlVZ6sBUA2Pg_0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwOCBTYWx0ZWRfX2a7THPezqUZu
 scqexOPpY2YxjNi0V0ACJCKBoryqCh1ULAAVTZp9Uba2guMfyBTZKBhvFo41T88haoF5rlReq4S
 Wt0+PA1NQYrihoLS0XLCmexrinuf3yip/5f4gCDjF/yz2xOqXUTRnj6cSjFqxJG43vNK7tB0hmI
 jmQmxKj2JNJBULwsRT0v5OHfnTMWczy6yOON+UOURA40dnNG6PGgT/o7xgOfBM5kmUoDz+0z6ew
 EeGEhuNKborsxiBmzNFtr2Np8ixWiYRHyf/0o0k5HWaC1KxPC3ggoXjVOxTWmV7MAmX9GVB4TG2
 y3Gbcq2033dZGEm/0WD7NHirAnZ11Oy4sgnr20g9AvE98EaxbR5KaREMOkqgX8ufcLFxqL7ASTY
 C9pTANzONrB3947gJRUJAoBAG/Wbiu7uOe7IYYrmFOaJsx954ID3bYy5INlqjS6wEp956kQShF/
 ezv3Hy+IIzU6iMIbHfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwOCBTYWx0ZWRfX2mzO9ndf/F5U
 ggaLkLZQTvr/vFyXk47FEZIago0mZJ5zeDMb+G044mvoksExA/fwX6kqd7EXhDFTjF+yF+WVLoX
 lwgxcRrRsySKpYz7yuEwIa2p9RRJBgk=
X-Proofpoint-ORIG-GUID: 7aocbI1TadBHXd0U88IccP2tT-Fl4vaB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38326-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81627671136

On 5/26/26 12:54 PM, Maulik Shah wrote:
> PDC irqchip updates IRQ_ENABLE and IRQ_CFG and for three different
> versions v2.7, v3.0 and v3.2. These registers are organized in H/W
> as below on various SoCs.

[...]

> +struct pdc_desc {
> +	void __iomem *base;
> +	void __iomem *prev_base;
> +	u32 version;
> +	const struct pdc_regs *regs;
> +	const struct pdc_cfg *cfg;

"cfg" is a bit vague, perhaps irq_cfg_fields or something similar?
That said, "irq_cfg_fields" isn't very catchy, so if you have a better
name, go ahead

Konrad

