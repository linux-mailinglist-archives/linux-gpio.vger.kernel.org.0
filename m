Return-Path: <linux-gpio+bounces-38636-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nbe6G1ydMmpM2wUAu9opvQ
	(envelope-from <linux-gpio+bounces-38636-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 15:13:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA39699FE6
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 15:12:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PQq5qqaW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cgj30RjP;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38636-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38636-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A2783301A05C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 13:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5673FB067;
	Wed, 17 Jun 2026 13:12:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CB123D7C2
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 13:12:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701969; cv=none; b=i1CWrpWNwaCSz/bVwHq37vp0Ry/v5zNpONvWYfgw0Tp38EOyaByLP/w8SrKOzSa2cfcryuJCk6fqwOq1mSmmtl+MFaaxy8MPhH5bq/EW/ZAk3u8JKnFVzV6EYuT4oTvdCFb1Pl5p/wFvZPMZuceCTc1EvwiPnZHj9H7zJpm76Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701969; c=relaxed/simple;
	bh=/xYSuDuApVlDwRl5mUUmCd+M8zOhVp0QHXRqk2UrHUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBegauGpoJaZx0BShqdBnyQ5ZpLOsd5Qk3pBq4SngUrgghPfexWIaU1WaapqzWkOhDq2EBSqvu4+2culyPBENNY/MlUhSa+9yi6VWtSupuYACXDnWGj+q5GAIERTKge1O30yJyJzXQnlc0jMm/0Ts96ymVK21QYh7hatC/+9nyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQq5qqaW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgj30RjP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UEl11735031
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 13:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bl7Cu9/Rb8h2gN+c/vf6cviy2rxKrYizQzQi6ZcXv4Y=; b=PQq5qqaWT6gifv18
	migQ05k3hZ43x0ykGskbXeD80/VilkA8dDLPyv7Spo4U44PVGXoQXbs2/B8CWvn/
	5q+0ncb/PcTNGRgXLJKUlH1FngDJpQlabMIVrJKHcALj5nrn/WYb+fpabdhA31SX
	j8LV2vjWmNqIruTpxh6Ctub98JgA5xuS9KlJ1i5ml2s7x1aqL9ovpLFjVC2tXDWs
	QMAhXnrrWmraODZqRggj7XBJN1sEwlbg10USIKoJoIE92sU4azyJYByLVs8n/6pV
	f/fVmDLQp408A77TLMKIjSHbFQOrOr/xi72sSwWPf+AY+u2epAy1aAda7/GGHznk
	h86uAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemk9f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 13:12:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9158ecbfbc2so45678285a.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 06:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781701966; x=1782306766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bl7Cu9/Rb8h2gN+c/vf6cviy2rxKrYizQzQi6ZcXv4Y=;
        b=cgj30RjPRCAYvKX192WDMTBbfd//Q3CGNMucT+zntmwUZwWESNd1j0FX64mfMwDqcx
         OImQwX8Ct8yk40kIRpHgUzF7bZQrBb4XwFEyUdwo49qX7fl5nBbBO9KNwSQ+icqWabra
         ottE11lK9/wqRnqarq/T37K8TL7SdoJH60V0YFA8tNTu9W6L4oeDo+2C7mlkpMIV4TcO
         jhT1Dgm3btJ20yULtqdvMQ5UGQCFK44XHtYISX6ns1wyi3q+UQy1Qqr7qNg20ah2t3Q0
         /Y72DBkmYA+FhgzbAoNDfiWHwIiBMLcHgCYGexwxtt2Tgchf9jYa4dx8IQt++N1YsLhN
         Au4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701966; x=1782306766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bl7Cu9/Rb8h2gN+c/vf6cviy2rxKrYizQzQi6ZcXv4Y=;
        b=PViw2WxCQ0TEH3YJ9Uu64cw+IvK2iI1GqvMdan/W+grYlasBUZbPawa+tgv06nZE6B
         n9ej0Vm96GwvufmuMeoDbG4fd8wn3v4GOZLfOlzNFbwgjV3qtnAXi+1jTz4qJaTkAD7E
         VBIrKfpTsXtYkkHyrbpzWIH7E57VpEsd79hdqF14bNmSo++bVbcxNKnqszVcoNZstOT2
         8pxuOiD9e6Mnq8F4Rmo12OmU2GtCdJNAUtpegLeXnZjj7bhtcg+TLbcJDv4iDOPsDMtf
         7R773OZZepVl96ql/vGpOosDyZXE2vDohcoR4cTHv/3hLRiKQ27kO8mkH2jpRp9+e0ur
         s9Iw==
X-Forwarded-Encrypted: i=1; AFNElJ+JSfVEki+NTABlL+dzbUsZNxw/tfjRwfv/9xWtGawWzrMIhDGIIr1DdJ8OebldbD1lehvaOSgF5DM6@vger.kernel.org
X-Gm-Message-State: AOJu0YweKiK7gnGLIqb7EPGwj8Kz2rq3qwnA8BG+Vq4ySiE7U17sT2Ea
	bCJxEXu5x2UZYQbf54WT/Uy6AFR1XdPKah0QdKv772e+6KOKUG60Q4sh8gwJP12cW5iWdywyQF3
	g7CfWjNt2MZEIZn+vjQ15xdYFoirmB+DvJDOBIlOVyVX1VGa0fyR7MTBLP/Iib2Pl
X-Gm-Gg: Acq92OF3qnzAu/OcJlqzPQ0C+q2W+p/Zx6qfh7HC2ysLDOfXtjIOicos3PfJoYSyLkP
	gTI9m2y7NJJnaH8cKAMql0J9JG+W8qCF/kkI5q8W+fBn091LhFP0LzuILcq5Fz13Br7s7Uv6aZD
	s8ItSITPHzKNGqChTGxu2UB3O6RBroIXC4+SPC5STgPDdeUnCdKzOsqLUWsrYeDG5e17NaE94Q4
	SO+NAKgAyoEXbYsiKIhHgpgIOx0b1P9R0a1Be9YELYB5ZYfIrxkxla02vSQT13YzP0z266ksKY0
	xuR2F3nkup2zZqpoA7kfgmiZDY3XvaXrTBCPsELn2yVqp9xDIi9mohCl8ZmWcgibwTfCeudiz1s
	FlEdH0YMqTuFvkI0zSOW9fXlDsKJLNdCw8H8=
X-Received: by 2002:a05:620a:4081:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-91d8d5b2aacmr404161385a.6.1781701966262;
        Wed, 17 Jun 2026 06:12:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4081:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-91d8d5b2aacmr404157785a.6.1781701965809;
        Wed, 17 Jun 2026 06:12:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948fc99sm6573561a12.23.2026.06.17.06.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:12:45 -0700 (PDT)
Message-ID: <0fcfe7c3-ff54-4a72-9529-8f55d77814ef@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 15:12:42 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] irqchip/qcom-pdc: restructure version support
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
 <20260616-hamoa_pdc_v3-v3-1-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-1-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyNSBTYWx0ZWRfX7zgypkrRJ+Lr
 y8BBMNQuQ5McesyncddTPTnkoN3yyCCOqfSxGseCpdh2vZW65d97WN1hDL9R51IMuddfX5ZdJsv
 hkH7euusUJOzCay6s5KUeKd9vUsHVz8=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a329d4f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=y--pFEGKUWMBhsBSRrIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 3PweqUc_abHPmHUDLRF-EF1e5dBeydiw
X-Proofpoint-ORIG-GUID: 3PweqUc_abHPmHUDLRF-EF1e5dBeydiw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyNSBTYWx0ZWRfX4p4BvLKHP2AG
 eVG8E0UTQQBI/xES6AGJzuzSHGKXD2sUFoDq9xycY7y57Jpjp3zIdXrSOblqa9Kcwmgi26tnclO
 T+ozOnilQYfw0HUfOKKfEeSebaspmfoOSwuZIvx+9HtO6GFj8hx1YOELlrg/pg+0dZrBPHaWrVi
 Ih6SfgAU977W1cj/EfJlMlcu8Rui8dlkdszwR8eFelBgttQ6i/EomSVv2/I9dp0kfdUAq4ft+EF
 j1Ye6iAd/tr3zyM5PhMwJafcisPatQe6mp80K8GDItOBP9DYKLoeJZHAIq3r1/XGI3AqysN/nmj
 AYdXispLDK8+y856dFRx20ERAZnQDA4VDcKTJWyGsT73N0OTVJ3FnlLnXg6GhBI8zL/kzDiYG/1
 mlc6T3FykVlX2W6qv6Cr/vVd13wnWqZpj1baLriuaHvnYgVniQ7Z+OeGb+Yz0mBWnG3LFvra61f
 6Idqud9A3jTFs4Eaucg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38636-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FA39699FE6

On 6/16/26 11:25 AM, Maulik Shah wrote:
> PDC irqchip updates IRQ_ENABLE and IRQ_CFG and for three different
> versions v2.7, v3.0 and v3.2. These registers are organized in H/W
> as below on various SoCs.

[...]

> -	ret = pdc_setup_pin_mapping(node);
> +	ret = pdc_setup_pin_mapping(dev, node);

dev is enough, we can get the np in that function from dev->of_node

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

