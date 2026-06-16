Return-Path: <linux-gpio+bounces-38592-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aT1VHGNUMWqsgwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38592-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 15:49:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DEB69018A
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 15:49:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gnraOnxa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Q/g0NmK+";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38592-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38592-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F8FB306BECD
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 13:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD11349CD6;
	Tue, 16 Jun 2026 13:45:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0F333FE09
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 13:45:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617520; cv=none; b=q0tDOHHyp0QOJ2bV4k9z4B8SMZFAM2/uZlN7ripfAZcZdiQGqsyyAF1jdOc/G9+TulH5zYxdGkgZSogOf3SiW/DsowebqV8Nx4d7C1YenyazFDeU6gAS9zaM+9CCRy4RkqOcA59tyKWrsdWfMkktjd51UTDF6Fg314juSzplqx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617520; c=relaxed/simple;
	bh=LRIaBWeDz9XvpY2K2lqiFjzIrt3vcupGzjCDyTLA+Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDhCU4KASwmOZVdBtwT2UqWytdjk/h8AUzy9HHjENzHgbELFIUlDXUWyhLOm4r91uZSub1hmXtwCp/0G/8QLq26FgiufCQZuEpeV6lby+oXa/khnX1iqM9ZpKjfjLx5b/TKkaiVtIsGNm+kWd50lwrrDv5+HE3MDrtS/g9FnlPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnraOnxa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/g0NmK+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACIHE3411110
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 13:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5aQq+OBiFig4xLHyd388PD+FYEO2x2H2mwQ33Hqq+sY=; b=gnraOnxaePe0uwcW
	fMNONOWu2c8T4AgkeRo1zRe5TdLRDXTRSZdLr3jk8Cvk1lopmGQcy7u84GpSrmqC
	hqvenMoYYtBA7vkowH6OiNBH3gm56yayy/JJk/zy3/07pRnKEVphQJ0/ctm8Dj17
	+p2FvB3O1i8vCI32FgngExrvMhbAp5wyDXPyId/wnYco+ArDmwEHyab6HSDzmZSY
	bBJNwqZIMGLNDDJgHOjHhio5fz5pnd0BPPbW9l3elLq5NFYnxvPNPPB5Oh0k5HbZ
	vzJG6yudQphewCrWROzarE41HuRBoIMwJ9CjDnbsNQIAJxOi+g+vGPfWqYMBF5K6
	KNZtew==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09ga419-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 13:45:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ce9ddfa7ccso11044456d6.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 06:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781617517; x=1782222317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5aQq+OBiFig4xLHyd388PD+FYEO2x2H2mwQ33Hqq+sY=;
        b=Q/g0NmK+pCWeiAu2CuzhteNDeEHvaihYXK3lnz0kXyHJv3l8EpXHSaSJBt/ggmhTsd
         HBil8OzTN/35UO2PbSVQbXEwyjXV2LW8ymGFCvvyrvIdhPPfUynZEXgL004zhYO3gVBi
         WNMzJnBeGQSkT04axQ+Ir9cp00qJhuvSkSnVtY+HvjhSF+cfRVut9nIVC0Kl6CAI5TiJ
         xCzHgFGujHC37knASJcVuj9dMhlFjZRDme6y933bBeuUCKicCtAV3kega/hi9vB1QhOn
         0u2SGuh4b1bBJIlpdoRYk9F61BG6THOzBvNnH+q2mlGLWUrrx/VAFNX6IPMhs5FeEV5R
         xX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617517; x=1782222317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5aQq+OBiFig4xLHyd388PD+FYEO2x2H2mwQ33Hqq+sY=;
        b=HoN/A3+YBFbI9yzAZr5EDrv6Wq9XJiFhEM7K32q0MI1fEmNM5e03xRC06+3pDMp8Qq
         /Dyz24vxEdxd1kQl2GgKNke4xOyhINhksNoOYlK95ZYV4TwRvFQrbKZauYB6Stn3OHhj
         1F/x9m9BPx96HKHdFNpAmIttCbylHPgb2cxxBKsFro8RWxas8W7UQ7/KU9SVcYUJIh4Z
         dabjsJlCjGUfgdrKnCBc2UuINywY/Yqi8VibGsGFosBdCjkK2sBF8g/4AE8GFJM+wue/
         2FNp3o4cCVlJRfxGhUnzUvhH7huhrDxpm5oGhViTjSk0djLuiqGBKieZXwiNegSonxsg
         xVAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+OC+1JR/4sTjmOO21DCIHWFRJPqA+wMRkwIAPVqTQ7qdL1LgZsPnM42uEll63ZKdtf2H/k5VkhMSJY@vger.kernel.org
X-Gm-Message-State: AOJu0YyfREFzz5RWA+5li0zQLgbuLO5+gSj0W1J/yvVJo24TFQHZv2at
	IIndzb152Zs/owYDM9DNVeAIgycPopa4tO7sWMPMZP3qQjT6CK47LP9Sz7VvwMdYSOQ6lYtPArj
	bSsAKaEsEGfYc+S12bTsC+BrMJ5PvH+M76pD3Dckuv/LIRUCGwI9a92CjREsQMkrz
X-Gm-Gg: Acq92OGLYAKwkgo3KnW8oCg5F8sYb/bOAkqm1rGygGdlXxYjgqyWtl8i1WQKb4gJaRV
	ZllhmUfmA2ysKsmZuTiyK7UI44VPxgZfwdCQ11bc3znRcN8Rc9h3LZcFrraU9DLFYSEellEQZ44
	TvCtE879utQp/CYlyh9QsTVX2K6eMnwv54/vthK7TEiuq2l+Q1KoOHPMjNt9C3q1EUiEgCgqm10
	rLCshGZSjnWVydm7hBnJERUwHb73NOUL1vFHI0Ne9+AfYxJdVvB08SENz/ddYkrtjqofy0IkkUX
	TnlirFovHA174N0SpRAIvtIxW4pqLq8KGYGF4Va1gR9Jq02TzLMwRf23N7OWxHoH51SUbjqJuo6
	g4rLvte6h9TPWKRbIGwUSew6QifCvRaCtGSxbiNwnwOcpzQ==
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr393885885a.3.1781617517242;
        Tue, 16 Jun 2026 06:45:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr393878585a.3.1781617516736;
        Tue, 16 Jun 2026 06:45:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44208c9sm667680466b.13.2026.06.16.06.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:45:15 -0700 (PDT)
Message-ID: <46bc1a3d-37e0-4b8d-967a-950cb3a48200@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:45:12 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] ARM: dts: qcom: Add Samsung Galaxy S4
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr>
 <20260609-mainline-send-v1-sending-v4-6-83768fbf404d@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-mainline-send-v1-sending-v4-6-83768fbf404d@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfXxWMCxonUuBNQ
 yOOBRQgbdqjEOUPjtrzxOFwNkE0mYUap5o9NjFni2tc/2lkUGvMbJb2GsQt24mdahHFIpuyG/R7
 EsVb2iIz7PB/vSm+8LnSt6p5lzWJukjfLpfNI/Jt2UCbrfrH4qon2xdaIv8YYzlvVvnJJdVhISR
 PXTb/D5mErud+bcHwODocF62YeOCndSTKJc345pIU0O+3Z52YPplRptvRMeiRU5ROxeco9evXix
 Cd1ye6NF4kWqc3Ns+QtKdla8zYjNFr58ptL7dA1p3LAIQoXWDpiXtUn/zY4Vbu7cwrDNIlkVQBx
 dURJydVzMYXTx4SNObqWzx0SysgLDFPw0KvHHQYA7SjulDSlHSdh1ETRxkzzFVgAC3pn22hbP2g
 7KnjdBHNstAf0KgHO5JnV8Xy/55raB+aPX2981btsi2NMYkF+sLOk6eYZK1tVTELuqum8YZfjxk
 a33tynJO+lCDaunuNjQ==
X-Proofpoint-ORIG-GUID: yzOGyb1jTcLfKgL0dBuFb2Sme-vMsn5z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX2c3TWSyZ/Nx4
 7THDYc+bd9bpaGm9qJ35Shw8tZ9I/V80hFchPhcvIRIe/X2/czYtSTsds4kiJaVuRsqquig5cSg
 Wxm1QI8dSPPOLcozKM2fEMb0h8Fy7vk=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a31536d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tLzcpL6T6jtHObjfa64A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: yzOGyb1jTcLfKgL0dBuFb2Sme-vMsn5z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38592-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,alex-min.fr:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:contact@alex-min.fr,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@gurudas.dev,m:linusw@kernel.org,m:robin.clark@oss.qualcomm.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 10DEB69018A

On 6/9/26 10:13 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
> 
> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
> covers UART, USB peripheral mode with USB networking, the front LED and
> the physical buttons.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

