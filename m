Return-Path: <linux-gpio+bounces-38079-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7Gq+J+aAJmp/XgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38079-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 10:44:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3BA6542C7
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 10:44:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j2DnW1uW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=feTZgGbM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38079-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38079-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E785B3039B57
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 08:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341783B6360;
	Mon,  8 Jun 2026 08:38:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983C63B7742
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 08:38:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907920; cv=none; b=Oy1w1s15r6stC/NxiAqd9QMRe3nooTXVAXLnld1/yijr9s7Bce/79QICd3Uxi1fHTs9aKDtPWkz3/4vAY4HUdUkeIvwMVRY53Twi/RCvXJO3x4iYIKBHdKrFoCRFW8AOaqnvRirXcinK8bazrW8NjDXXpx5uhlVZk8VI8mzIM9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907920; c=relaxed/simple;
	bh=6n4Qb4GEqDjlYV2pyKoJ9ZSPLj3a0G7DVvtMLoymnpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OAtxkoIDqto/gIHwqLMuSMK9hwDDovlf3j6vs2ek7RpyPdkrqfTPv22WJ287ilV5hi6LhV4xkMUTh9Rr/EwuEt7yxgwDu4LYxHbKlVX2LxkC4U5YCHQDYbWjZONGebROWMCLILyD3rcPcc9RR/Uaz6i3WoKA0pOkMiKYr/Y2Ut4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2DnW1uW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=feTZgGbM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ra8A2833828
	for <linux-gpio@vger.kernel.org>; Mon, 8 Jun 2026 08:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VQFU4ysl+xcr7f2GGoVtCp3ziSn6wU2JjOZ0xdRb2LM=; b=j2DnW1uWvh/I8O6y
	OFnGkZAIjLuAIw5qdTa2rTv15jN2XWu1pR9pmfDSJL4syin3lxE+dLQ3Wy9xE2qV
	yvtoC/735ZiMXioTVDgnH3sl7oPcVWr+Z77+ISzUwkaCMAOBXxF7Fn+HdEkq70Qh
	YxKKLXyHih29QetwaFPoY+5ZeBsyxua/RHq2XkpwAoRPYUkguQPVRmI/XyhFFrEh
	0koKc6GCBJPptuSm3DC7IHL0Pm/N2sU+nQkbiC4v/wYadv6Ae8owxbXnvUczmTn5
	T45/zVPIoYTIdp4alUqN1sew8xXPEuD94Dm3W4anz2T5MWiz7WbaMhpvfz9t/pw6
	+oY3Dg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4y4tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 08:38:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51758177935so34314251cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 01:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780907914; x=1781512714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQFU4ysl+xcr7f2GGoVtCp3ziSn6wU2JjOZ0xdRb2LM=;
        b=feTZgGbMbY6+BHIMsQ426trLurQFnPK+Wdivg65easpwdt3Ak4qnNd3xMfcdb3704y
         fKT2RovEQJtscykgi55zFyrqqgeG0jBufXrnVT0lKeqL/DNIy1/N64pYpMLIFONFqvjB
         N/Zn4iFHioN3jXgc1Ro0MnHSDmh72nOK4aHKaqiKRcjAR+XUpk1rAcyFOd0LyxcElAVo
         zvwVyF5mzR54Bc2kYOMpCREFZZUquLPIdYMbHPflDZbTjW5l39+tUfC/eCn469JNnjE1
         2rv0USt1v+3cEYBUhGVf4ikX+PDZJajsjPoyaFxmxenw1k4okQVGQCQe25KbQVdQUvlL
         M+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780907914; x=1781512714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VQFU4ysl+xcr7f2GGoVtCp3ziSn6wU2JjOZ0xdRb2LM=;
        b=qATVannFNGCX/IYP0Upn10bFPFfszXQXi+ateIkECAKw/MHK8r+yjFauRpQ6wuMZcD
         mfU9Ry5b2RL3PX8s8bd5v1dntkFya4k6Qka8xSPmSehDC2sNpBZ16geevz+HsWCa06mp
         p2bzO9RjG/j9+oQ7aVd6neQ+69qFnZ77s/ZAolcA1YgHcoDaC+HeXbwGiGNzpbvBcqh0
         qBinp3BmFEqt5TddC6bEcpa142bgpzTmYbYGr83SZNxBCNvLL/Vns34UN/k4F+Bc6Vbz
         KLebYPyAtDwxWPonALY2ti9eZeqc9GhCdKDM2b+hLwFw8luvFIkW+3ofZcgWLgjjS+bV
         FH+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/FDyGj9FByFTAlrfNYYcxmIH1MIfmLfhJJtlx/Qd12dXHG7W4LF7pmlmgMO02ePZNQpWuahAeeeqSI@vger.kernel.org
X-Gm-Message-State: AOJu0YxJM0+rZs0TXzJQQcJzV+mxCqLmY9lX/pjmO9eUG3cKRIoWeTtU
	Ulsnl86BorVBZeJs4Q6B50a+mccaSkathrrXqhc6JbvZCsBJLgnjCh2lnOr0hilpRaIOdB/J3Db
	GSrYRMDs7NcK26h82yCeIZnZLe7uh3UdRWc6PO4/jQiX9rd4J3Kfi1Cswpk+KdqwF
X-Gm-Gg: Acq92OEhdtVOyBK2KxR3OgtOaRvm5F6HvR8bl98bRhVbjB1kevtSWrxO4lFMTcmcL6n
	bqLfsLy1qm6UkxryXTBjmHKj3Mf7KAwWAhYijJSBCaqPhtKhhYz8p02li3sscclCi4i9amAMnKg
	uqz1cRiPC2aveJvZSbVQx2/fOkZ+ME4AUysRGgfGxmoTlLCGMNRd4v8Mqqx49oV+Z4Fbj9nhA1S
	v/EvtVEg6AFs+bMpksU7aahDZ9jOGwpCMocPkHLEKrSILHjShiCYKuJBROjWVrQlAz0JqlCI5/l
	JpHV/t0iG6NnsMVkJ2gVAMllsTEnQEKXtd69cAfdKdBhKVlj0oHELQwNo6XXXmLlfVJkdrW7uVf
	gGfzqzYxstE9O76eBFiNl0j0ORAAa3+df78Jx9QvYAJhUMT2p7EKFWwBG4/o=
X-Received: by 2002:ac8:610f:0:b0:517:6804:3732 with SMTP id d75a77b69052e-51795cda4cdmr207815681cf.55.1780907913890;
        Mon, 08 Jun 2026 01:38:33 -0700 (PDT)
X-Received: by 2002:ac8:610f:0:b0:517:6804:3732 with SMTP id d75a77b69052e-51795cda4cdmr207815491cf.55.1780907913464;
        Mon, 08 Jun 2026 01:38:33 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4904:8660:26f:8b6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cbfe4sm383420465e9.7.2026.06.08.01.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:38:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org,
        Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, david.laight.linux@gmail.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH next] gpiolib: Replace strcpy() with memcpy()
Date: Mon,  8 Jun 2026 10:38:25 +0200
Message-ID: <178090789587.45152.16178139871564031828.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260606202633.5018-3-david.laight.linux@gmail.com>
References: <20260606202633.5018-3-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dwZ5SfJHQkoJqu99clAC1CpvMjn6Q9r2
X-Proofpoint-GUID: dwZ5SfJHQkoJqu99clAC1CpvMjn6Q9r2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MCBTYWx0ZWRfX83Q1hD2SGQSO
 EuTDjJMzKRNKcRwtUl54yq5B5OXrThs5ci/MYuCQorpYXIAEHhOeLIjxmlPXmvRPSOqpZ4zdQy7
 UKdm2ahbgGoaqodI8ukNrXpP0uQcZZNiP3kUpUmLycLzyf+zzV/q5PKIG1RoyhaVDHcp2NCsE4f
 D3ui03Z0fgDh4unVAqzn/zJI2UVBpOzTR1t9VIacDOFpVbYg9RhzsLUSMUNUCjSY2836ingB+5y
 g73l5qEpSFc4GyCuOdH32vWtQkhGb1psdWSxnVJhgBrDMWFqpMK54Ov0AAQRl9H173gm7CxkYSw
 SMuvIsXV8y9YwF0+AdUj6moIiT5FBbpBL5RHO9hoaEWskn6RAHFddzbOdgSUiXQ6g++N1g+GtHA
 CKU+JrchZ9cI4hl7F/PGpbYmslIlej/KM6Rdm61lOl7xw+O+g+HTOsAPbj9m9fm31AHtjtXuMMO
 yWtWYSN39YVZI2Gncfw==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a267f8a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FWiv5dHe_U33kd6G38IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38079-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:linux-hardening@vger.kernel.org,m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david.laight.linux@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:linusw@kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D3BA6542C7


On Sat, 06 Jun 2026 21:25:57 +0100, david.laight.linux@gmail.com wrote:
> The length of the string is calculated in order to allocate the correct
> sized memory block, use the same length to copy the string.
> 
> 

Applied, thanks!

[1/1] gpiolib: Replace strcpy() with memcpy()
      https://git.kernel.org/brgl/c/25afa211ae336569ddd0043f77e25e1b9b48c4d8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

