Return-Path: <linux-gpio+bounces-38855-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OZJCAUCKO2rjZQgAu9opvQ
	(envelope-from <linux-gpio+bounces-38855-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 09:41:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 947F36BC434
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 09:41:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="XyMfC/Zo";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hVBJVD4a;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38855-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38855-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0ED7B3009F53
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 07:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BCA3876CF;
	Wed, 24 Jun 2026 07:41:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEE71ADC97
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 07:41:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286907; cv=none; b=XPEhs5AmlIrLTmZWHPkUjo0gCruO3X9rDT43lvpSu99dG9ceT1nKzCQSBK/d5jSXxfWsW7wEtmCOh2fWMt1dcQkMFpCn8dmU0DYRnFK9CG2nGBrdcduVIFR9FzI4jhRrtq6jeZOeW8B92dZaanytaR6cZdllttCTyk16IJom6G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286907; c=relaxed/simple;
	bh=nJ0hVoTyNaZQ4ssRz9kOi3Yl0GCbZws9FSZkrvgNyJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AoUmLleNEOwK3qBhmV2MQJQYHp0zl6IMn1tbTeKL7dgoEm9Boop2ucGl3rxiZTlnjB0Nr0Xr+gvgfuRDoouaBeIDPdxoxcpNU4IpYnNxqMNLe9uJouIYLw5ej44NALcqYXz710ToQ4AQiHDJ3ZMh/CVisk4NcRGuhHv/rHuRtQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XyMfC/Zo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVBJVD4a; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5txdT2237379
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 07:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKBpQCSd8mxuUPTYNquN2obvr8dkIWwKpWOlKURGIVE=; b=XyMfC/ZoWrXlgDzJ
	Kn56nOubOXXR1Leoz8vyUc0gt82lU0IVl7vByKQ3TB+cT7pJisAeRV3zK0Jnv2hb
	BL7Dshe89l627ss4meCaReT1ZMcgCqWqJaGM0GcM4V2go/zSaXAb/n7H0PEqkMWk
	/27Ro/GqhoYdrSn2qisQmn94noDvCajaL0h+K1pxRPYJXIvy/kWTR9m3sDCWvtfR
	qc8c+w3aP2/VHxJ3V1YzV52/feCJo5raxlxWroMmjHPUtxKgAdyKbpmi8qIZ+avP
	/+X6IVpLos6UJugdaP20h2k2oO2u+jVe6e5wyhJokiCNJS0Kusgrr2cGs/cpQdGt
	4Ubw7A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p22gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 07:41:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-922548a7b0eso7703985a.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 00:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782286903; x=1782891703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wKBpQCSd8mxuUPTYNquN2obvr8dkIWwKpWOlKURGIVE=;
        b=hVBJVD4aEfAlBWxOVqWQ+Pz6wy6yBIod3eZdLw7QfiVXJg/VoSnMe22VhwZtLgJMJr
         4oDQF2hceuwzDtu51qf/BKNucmuvioSzL5JAAjlA5jSSsI1B03HDtKGJe9MiYoOLOuSs
         Uui9jfoSBbvftyqGsoDOk1l/WssaCrW7U8FSh8+CgjiiawkRHpK3ne6Uug+0AnxU/NSb
         PiQj4+8K/+u0o1KFZWdgJiJDGWnx4AFj30x3KExnD87yqdvmx8ENmAXrwam3M1XJuS9a
         jra5v8p9jYBW2QUtecBSrrUIkaB59cT6SGdBYMcjcTM1Bgw6U46SeLXIsERrENBdbgMe
         xRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782286903; x=1782891703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKBpQCSd8mxuUPTYNquN2obvr8dkIWwKpWOlKURGIVE=;
        b=aWRZ4qqz23DaDTGS3APDDFBwoqq4UExng5iUHpVXyhsCI8iHuC1nspd2ymmToIbv7Z
         Mdu4hbyUzC3R9jcA3sp+5ugfAx3CNOO0ywwLg+1OYZrAYIz6SdIS9nPoBiW/b5eB4lkk
         uAgdL6bE28cR12F1f8dqYni3H4hu9tPdqfMDBMAc5B1c0NH0i9sl1/3RYH4t2Qp2iZHn
         ROOaqArJoq5HiuqSFXdBUKOLidzNGXURKj5juRfog7IH3dMH2EnOgzj2x2J1fz1tnk2P
         FjELfDOTw5Z/B0TKjyv17pT0zJZGbkWo+hsG+DsvpJ7laFqfjQHgJ/fURCoybh/GIsCd
         +DtA==
X-Forwarded-Encrypted: i=1; AFNElJ8P9JE7KmbRpWsfEi2PfP2VHTjxgLWCogrYO/0EGis4/UCiw8/qKMIz4yckzEc7eNBsM3Jc7Vzlbhbn@vger.kernel.org
X-Gm-Message-State: AOJu0YwRAqqO6+V+xohUaErYs7ekl5190kFcu6vg7k6lha/5bBTg03gn
	x1FNh6Xqg2e+KWHbB2a4ZS2B7EGeJYrQQFGPbzdTb54xY6QKVfQZrOubzD3XL0+UmWfw2ZyJ1zZ
	iS61Sr0FQwjbgKSYyaDDHyVPDV5Ihn109qqNlYhy/ZTg+YK/KKtetB5GsQNblZAIa
X-Gm-Gg: AfdE7clfybdMWCHazQiQArasS/8zxGO3Kz6P2hyufyI+aWMfgnu03jmLIp1bLWmZvwS
	7VJaRfhUpQgpOkqJxwyvAa2xsdSBLvJLYQ/+MXm6rGMZWlkFKKAFcGxy0Wblg4cu9Isy6Vb6AIX
	098f+Np2odMxVzjjkAflhNo4/yEjLcTcgfeCrRv7s5nHlKibcphUy6zNGhI4O7F/R4jL7oM/M/W
	OGXBq4KJUEQP4veWpa58TU7hptMn3nIerMFfMq9mWzn5LmG2vBXkCm/oSKBzs0LOlzZoK6s7cop
	tRqkABHt9SnvffQ0BMJHAHkWN+yoczkVQ38GLRs3fsfiLrG2/YDF4W3m7cKZPVnjOp0ugZJvzvj
	s8a+xNvH+8RYTQzYVvT6jknCj0BfiLE8HnCY=
X-Received: by 2002:a05:620a:1791:b0:915:79da:a898 with SMTP id af79cd13be357-925cbff2a89mr791905985a.8.1782286903421;
        Wed, 24 Jun 2026 00:41:43 -0700 (PDT)
X-Received: by 2002:a05:620a:1791:b0:915:79da:a898 with SMTP id af79cd13be357-925cbff2a89mr791905185a.8.1782286902887;
        Wed, 24 Jun 2026 00:41:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c6161f195sm626727866b.63.2026.06.24.00.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:41:41 -0700 (PDT)
Message-ID: <72faff67-83d5-495c-a8c1-0b4c0e2758f9@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 09:41:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: qcom: Drop unnecessary bitmap_fill() call
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2MiBTYWx0ZWRfX+hzJB2g14OgF
 sqgivXA6tjvdAOstJaKmsest9RBfueIY1xP0gONZRUqb4qQ4YIssNMlZs7JLSqiYc/MYojge+Jt
 8CAd+4hdkO013bZ0DU0E+UXhTrDevc4=
X-Proofpoint-ORIG-GUID: u94Ggqp19CnSXOVtOwyf8-5EYZF2rlLf
X-Proofpoint-GUID: u94Ggqp19CnSXOVtOwyf8-5EYZF2rlLf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2MiBTYWx0ZWRfX+9N2gSO6mYE1
 FL+h+W//GNw+tZyBSHjO+tt2CU1f8wm2CSeJ16gmVOUYZ9QH8eqRyjDFgJ+wDWlpe5bx8MVtv18
 tv3+ocD5JTYkuV1m3aWO86OFF8Yri/jsVOZz/19c8JVgcZgbYwUiD2SiHM0DrW/wUtEGBoHKddp
 R4Q9vksBcO593s0G7Qi2jEdvfTXNMbPRAqXBm8L8utYV4GI9/3PTRMMtwSNhnBmS+BGJiIlGZO/
 RjLo+O812hwA7SVYHXSFolQLsWjY0eF+ipHDS8y1zo/LlK9sBkKNAXnTe6pCRzTY2A3Sv3MxzsW
 +IRrsceo0jJFVF3Gd/bbeExmVo5G2wfPvGF0ilvSKJ/GtypMCoFFqN3zPUFSJT+mcM2E3em8kHK
 HxP7VzIA/aET3HWCupSiJwEg2Zx1WA==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3b8a37 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CudRCQxTT4vl8MJ7sxAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38855-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 947F36BC434

On 6/23/26 2:27 PM, Hans de Goede wrote:
> Drop an unnecessary bitmap_fill() call from msm_gpio_irq_init_valid_mask(),
> this is unnecessary because gpiochip_allocate_mask() already does this.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

