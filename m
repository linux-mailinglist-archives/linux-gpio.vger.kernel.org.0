Return-Path: <linux-gpio+bounces-35393-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC8PGzHR6Wm9kgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35393-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 09:58:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E7E44E3E0
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 09:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AFF03016016
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 07:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F2134DB78;
	Thu, 23 Apr 2026 07:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iy2iGfzX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gw9u0AEI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9318B2EA731
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 07:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776931093; cv=none; b=l+DuXqUUmfgABI0AI1cSaaASjCo/g+TUlZ4U2PdCmdZb39HT0QpLb1Vk1H4vOrp/3bZOh/hYS4UNG6ncYKCMVbPuzqmEw6jqSi0LWJ+nXNaBgcRRUcfGfKPC7qzmdX5kiEpsSw2zz9ZCPGP3YBrqXu/dvmIfcfa6DNJBNVzNXOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776931093; c=relaxed/simple;
	bh=/iUss78XqzeBlh8nwQ6VHAXRooxe1ZUadfDXpvgAn7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B0l0WzdI/iWGK7ZL/1JII8OJmd2EWNVBbrC7uGiPBcDcktxH8MUU2tL6Dor0DNDu3M/xKvzZUQeiNdvSDc1yBcNd4yVUeFbaCO18Ku8WHpRpMRRZqKs2WOSPsyXBlb22mqBMPcg45wb87Towh7u5dFBBQ6hK9LWOHKZiDsrq+9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iy2iGfzX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gw9u0AEI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3007X3528466
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 07:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bm3gpLGG1WVdKGyk6YYfC1xM5OtQzI24IucuuVnynqQ=; b=Iy2iGfzXwSnsRZzq
	y/Mi4C0q+Yyg8IMXnvIxfu7MbY2Byfj7EEYG44Recy5C6yw0OnxT5c3RiPIAKPmS
	q7NxsK6GUZbOyI5XAz0LI0abF406xbYrqVZYBUoTyGWHiV2AlKEMb0xh7swSdzZh
	/+xoNSy9/LT0px7ldNlkn68ZkPfVJ6WYdY/8Wl3OaahHnwg9kWQr4dkcOHHKiFcO
	V4NeE4vzFeAWnZrE5A/2YYJe7nb2k97kEsr+IYxKXNyq9qaeJQGI8dzfEGl0n7hK
	FhDi7LnbMU2x8PdIrVYtzikT780YpJ4AAOvdkMe75/iQ0H00wQUUhCR+Jfscr7uv
	8f3/gg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wtwgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 07:58:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3c7b989so51620501cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 00:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776931089; x=1777535889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bm3gpLGG1WVdKGyk6YYfC1xM5OtQzI24IucuuVnynqQ=;
        b=gw9u0AEIjrXeobpU/FGV7kHi0R48GBs91rw1vCdWSNz+tX5sDfhFYLbbObsZk/IJpv
         QA4f82DzRirP7x1UZ8EIR85pDVf0GYBqAnTYxDvyaSntr3BxeTXXh3eDZr3u8iAi6UMO
         vaaIaQnTMPfQZU94OACLj1k9F6cPHK015+oo3XjQBdvNx3XfOUgSz68ssP2MeBTmBM/p
         tWaS8ePNQvOUPHybhD2gUHPieJhuVghUxsnXIBqFymjSzD0xm3wFdFWHXuOt1ol5r7Kj
         5eJWEBoHUCL6sLgYqGrsTsZ2lmqyO2B7tbguGGY1hrljHDc7L6vHrdZawJZ0DSAexSQ9
         iSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776931089; x=1777535889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bm3gpLGG1WVdKGyk6YYfC1xM5OtQzI24IucuuVnynqQ=;
        b=BHmKxFoAkbw2v8Zbr8785qF3+v4wKbYExCc24PAurapL+mBVVCIh8HaY39GhHY/ogW
         UuctnxO+/w/xKWCtwDkKbfxS8lFZ1Ajczz/SJaqqph/6E4yQEuQ+PCy8mryjrtk2BE9E
         O4MbXKvdSsKXNmbuaQIz/IoEX15LdMqCY4Row+eh5TXdulhpTdcfiJ+ugQw91wMgpvA4
         lAcuB1EU5iEqSS9RG8vP7p7qCK2ZtPNO9pZQ3vS3AD8qjoWabvh2JbiGzYyU2DuRaIBF
         8NTnDpP4abVvhYXzaFxw10x3EaAIDbJItoeXKsXWUxfeoJb6lGCwtnh3J4IKCuAteY2L
         V5MQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ypcRtPx3z3oWAfHb7GztaeR9Pfv++P36upFRI5vSCTcJkGlJF2ZyG7K+x8SQ7jJ2VlSJEOgjyZIJj@vger.kernel.org
X-Gm-Message-State: AOJu0YxlnRVY5w9rD7cJyjmeKmYR7oOMhW6CWU47GtlmDPbySn2nAgPq
	ngts4toIezJUxZ/rrrnb6UJB9QLlNXDa+50qVvEvutowAsUxb5YQUY0m6i00fSRa1uC95e/TIDp
	FdV0iNH9uhkU7GWI3BJR1AK3iobKWtn7Oa/Z77tIwh7VdWzGtoY26si9aRUv18pmN
X-Gm-Gg: AeBDiet/z3Ve1Czz4NVRNJwC8NZXevOEda0BkxcmgTKkByWk8xgYI+jsuGYwFhHcNuB
	Yi1XlGhhND5iT6hOzRcoslyDqcu0TqWXLlzCwtJNmeXLjUbf+EfhDuf/VIJed4XXHlIRGyCb86s
	l20u5r90rBjczFOmpeC7CLMSGcVAyRcIN1/mPQwb0nVz4ChSSbJtuVfuqcDI3DFcw0ay8yohxr+
	Gnmqsf5CakvkebLE0NRMWIEuhBIcrqc97uDaRijRCmzbvrOrzS0cgEQXzgTxsjyNJWpcCXMkfBt
	Mlpf80yNfJLqU2deSZ9Phi49SPunJotYzaVM992HJOs6vGcvslbNIjFIVI5WzAxAYRsNlr9eITA
	DgUIVc15W3TBOFHOFSLwco6cLd3dANz0/P9phlqwWbdmr9iKjfkAEhW0ljXEf
X-Received: by 2002:ac8:5856:0:b0:50f:ca25:fb48 with SMTP id d75a77b69052e-50fca26036fmr40843801cf.55.1776931088907;
        Thu, 23 Apr 2026 00:58:08 -0700 (PDT)
X-Received: by 2002:ac8:5856:0:b0:50f:ca25:fb48 with SMTP id d75a77b69052e-50fca26036fmr40843531cf.55.1776931088487;
        Thu, 23 Apr 2026 00:58:08 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:68de:a8a9:cd47:7f0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm79521295e9.6.2026.04.23.00.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:58:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: israel.a.cepeda.lopez@intel.com, hansg@kernel.org, linusw@kernel.org,
        brgl@kernel.org, Arun T <arun.t@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        sakari.ailus@linux.intel.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, miguel.vadillo@intel.com
Subject: Re: [PATCH v2 0/2] Add Nova Lake (NVL) ACPI device IDs to the usbio GPIO and I2C drivers.
Date: Thu, 23 Apr 2026 09:58:02 +0200
Message-ID: <177693091902.5151.11141950722814315876.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260410140858.585609-1-arun.t@intel.com>
References: <20260410140858.585609-1-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA3NiBTYWx0ZWRfX9r9+JA7RQAZd
 iwKUpwVH5dgZUAZ1XJCacmvcrCCSk/R/5m6UaCNps4praLkCeeImKRMq24kA4y+rtu21to4KOS/
 s8Q4OGigy+ubA8gQ3Rv40tQPrLGdQv/r3u84wgiF7QGD9VTtu5N5tlY54QDlq6qMZnqjReqklIc
 b1F27i6SbPsmJ2IyKaWO9/mqUbWiojskW0G8DFpMwKud12xReckMD+hLOGDWEXEGpSULX5dmkiW
 BG+WiC0CubUCWHyycN1d/yjlmFxfc6Trd6VksDKLX0v/Mu1M1RYptWhJmFWWcueSP3YoFv7emdd
 Os8Nnw6chUm8XjdWE8XvdGkY+2OhhhKuM8yI8skgaEgl/dzPpEDE6Sxw2bZ87/KnvJhj+E5J4g7
 PW0WRiFpOObW+cwP2B1NSGSzMTgkiwmBhcoj48V72onrP53Vysa9Dtp0SGXyUAEdU5TqBmQ8m00
 Vvc3JiXGJ7xtzOIH0eA==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69e9d111 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dJn-6adkBF5x8X4N3e4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: s3ikJRHx0I1_mVdyKxcaa3n3J5jsdPgD
X-Proofpoint-ORIG-GUID: s3ikJRHx0I1_mVdyKxcaa3n3J5jsdPgD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35393-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D2E7E44E3E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 10 Apr 2026 19:38:57 +0530, Arun T wrote:
> This patch series add NVL ACPI device ID to USBIO gpio and i2c drivers.
> 
> Changes in v2:
> 	- Updated commit message sentence end.
> 	- Added Reviewed-by tag from Sakari Ailus to patch 1/2
> 
> Suggested by Sakari:
> 	- Add sentences end in a period.
> 	- Add Reviewed-by tag.
> 
> [...]

Applied, thanks!

[1/2] gpio: usbio: Add ACPI device-id for NVL platforms
      https://git.kernel.org/brgl/c/5ccb19ae1cb3620a76254db5c60121d092d9a0f6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

