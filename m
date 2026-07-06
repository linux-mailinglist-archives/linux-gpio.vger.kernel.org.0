Return-Path: <linux-gpio+bounces-39502-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t/CJAuh8S2r5SAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39502-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:01:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D69F70EDAF
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:01:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XA45LfBC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X8Fq71hh;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39502-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39502-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D81B36AB932
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 09:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33EFF3C13E0;
	Mon,  6 Jul 2026 09:04:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CF84DB55B
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 09:04:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328652; cv=none; b=VqnyFHudVZglp5cGu5ZH1S9Q+guL/6fdO4BFbuesuVtHMcXgvHNQCnjCXZeK3vNF2zC4U9ORuMP49JWTlw+V0/alx7tGnk2+6OJA/K5fkq/7XWyuCoKV1/10PSBI1rSNTz6n2IVfxNadcvt6iCY2NdFhsS/w2PbGt+PHMqTYIoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328652; c=relaxed/simple;
	bh=sT5lFMV2RMY7vRSqwJD1AOKYGSl09riOc3ychpQZt8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qbfBCs/AtPIL8VfoH4hpM3/tn7N14EGWU2IA6deHtNWmFhA9OL542kciT7vK2WInojxhUeQwyYMvovxE8U0jsNW/jRtP1znpDpJQShEos20Jb3f5j0UHxiTqzYLB1N/3PA81UaNbJ3S2hlEpu40RxwpBu2zqqnwjbLMyl0N/2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XA45LfBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8Fq71hh; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693uM7103077
	for <linux-gpio@vger.kernel.org>; Mon, 6 Jul 2026 09:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t7g2NlMcR+OJ0pQlyVRLd2L2YHSIMDkKMc5JLil2y3U=; b=XA45LfBC53IPO1K7
	vk/+zV3d8feWJ1hpXmoeKJsxQFmqxpLiwsdiWbAOhefJ/eH6s7dlAM+z/T1dGY8O
	BthVqwvMSC/GRRxTyzyPYI3p4c8S28gvs34IZebYYK0Gb8In+tijNGSbDvvF0yWw
	AU4XfH6UC4ZUIQM/s5sgxknyqaPUrlCdbqahTiktg66o6715FBVfFaU3Jl9JyFee
	XoAjt71tkfe7x93BJXL1W43STyEjy6/O81d78M8fuKS5jGi/5kTLQ2EH4WIO50x7
	Xmgz/6f40zv2j/ZM2D7oqsYc13iyBIXVMcnbgRxdXEtOYZQzbm9RIFgffowZFvLT
	i/yKeQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h5082v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 09:04:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c33f48ee4so28364521cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 02:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328643; x=1783933443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7g2NlMcR+OJ0pQlyVRLd2L2YHSIMDkKMc5JLil2y3U=;
        b=X8Fq71hhwPZ/i0wzqV/6+OoXGSxOIPuqmrq3NC9AjtF75JMxl2Rtsqo2UVjhXz1W7U
         4dc9hdrqjod+bdjVgNSdgSKt6SGsSfXc5r++Lx7fbqxHP0ylEe+CFe3Xo5xt3MTchhrm
         FaDVtuuj9e35cjF+L+jMlwoo4oTcvAHIrN3mL9FLE3PWY2Nw8NM/S8a3SmOuKe2KxmeO
         5g8GJzZdPfuIUUQOmMFu3GhA+D6saXyxv5fXJB1XPsGdbkGeNx6IWfMX+18K72VKN6kL
         1MpwFVsxwubD+/uXDzWiRHbsRjVVa/tyDV6tD2VNhdCobvXS69e2li8Yeuxag8+fdGYP
         J7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328643; x=1783933443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t7g2NlMcR+OJ0pQlyVRLd2L2YHSIMDkKMc5JLil2y3U=;
        b=LFgNlPlvVdVX/aroyfgzzMv/N4FIUY7ViLeqPLlcHwBC6xfl4e6zbgeN6E/eM2Alwj
         mm81ekXKtQHhdoAtXDj9n3RNu7w/ppnKqr2yiUiX1DRKKLuVdNoljLbwx40amtH8zbxY
         4ZAQbpmFiGO+ymz0EF35agQIsH+Xr4bhxMDVOx6y0jCKCnKEgW0U5eERsxQwR6MnjR1s
         +OUbJevenIPNAtp/LJ//eVBEvNCSkgzprp/VjAol6MW9vmZFuD93duwGFqb9jN0hMNVL
         njan3bLSfWxUY5Da8dTm8P8RGARW3qDKoyqKc01dFr0cNefFKvIUc9c+8XTJIzfDU5SD
         l5gA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1gQ/SlH334cw3FlmSk600kZQs4w9JG1lbFgxUDBWpnL1NqRw/PcSoRM5BvrYttJ/zRvpF7UyW0rNC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1WwrS2es3a6THNMJCOfILoshIXTpOWqBokbyPBJrm7121kye3
	6anH6VGj/bTKpADTDyimXWiQ///0hlGh5YiEdWLkeI0kcV/ChMCHCt5CzRJ8uhqNPFzIksJUJq2
	7BT6k8R5llyrURn6bpnhoqs2aZTdLaXpKvcrnlSWT0Bon3eTHyiMWsK26J0WwHmCpnGc9R2hy
X-Gm-Gg: AfdE7ckP8fzJqjOEWlFTn0JFTjw9bDmwPP0pHMuLfRVt0xn/LNECkJls9x77ujsnpt6
	AsVpSaT4D9tyGrqEgTygAkaAu/ILJplG3jSVA87+G1a+Cbt9Ls3GjUMA00I1/mzFKWS+o5oz9Yy
	E2bvr17V6neqshxyAhwbbnQkXvJ5tgul1VpAZcxReIRxHOyLy3VMpPVJvZgHn7TXTCrPj78j/4A
	3TkfhgqLJP5r1M+eTgSePH/vRc3gDOAGauToj6cCiOccaqzcjRR39l817sx/04S2a2x+uQnhmCd
	cNxcujVGRMA3fw/YESPDLEVC+mvfE2nGSmIn5PvPwcOOlmFj57a53hxPiKq1iBosYIaYrB1myPI
	9EiRMwIyAaLauHN/uAXbRnlP9itwsdLFXBmzjyKw=
X-Received: by 2002:a05:622a:180c:b0:51c:f3:34de with SMTP id d75a77b69052e-51c4c21a5c9mr124047581cf.20.1783328643226;
        Mon, 06 Jul 2026 02:04:03 -0700 (PDT)
X-Received: by 2002:a05:622a:180c:b0:51c:f3:34de with SMTP id d75a77b69052e-51c4c21a5c9mr124047341cf.20.1783328642807;
        Mon, 06 Jul 2026 02:04:02 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636ea60sm315243765e9.3.2026.07.06.02.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:04:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, stable@vger.kernel.org,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH v2] gpios: palmas: add get_direction op
Date: Mon,  6 Jul 2026 11:04:00 +0200
Message-ID: <178332863765.18977.12844804130835773641.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260704-palmas-getdirection-v2-1-2fd85fee3832@kemnade.info>
References: <20260704-palmas-getdirection-v2-1-2fd85fee3832@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5dQi2_TdD96HlKGLeMHFirNI_GmrvIEf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MSBTYWx0ZWRfX7BMJ1gxSngoM
 B4nioFlM5KW5zaKYL18zQ0mUpoaJJ5DA1sITMEHElynXsW5nn8VVZBCHkNKSx5lW9mYzs0MvqJz
 5CefxEzkHSR5upw3EwEWHEv8qjdg+cQ=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4b6f83 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Xj82jd3BsPfj_FevrHIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MSBTYWx0ZWRfX1IqjXifEbL6P
 KtJJ9O8EJ2AoqfpG/0PTpa4ovwGqQRtI9mU5EaJMJj5+N7HVS0wRygB2bIHKpbRa08ApacFRrZl
 nqn91s0Lllwqv3pM/0OMsR+kGFKcuPysVjiC2l308pdsjbkYSNwHCpieVNMy2V9X8eV1mNRKt0F
 ZF97D5gj/CMOPA9T699hrACyfrttJzy7tTPPsmm3DsTLmywA9GXsZFdlDToMuoxEMC/86dvxxwL
 O2Bulq+GYHjOE5Ysc/2C7eaAIQiLN+CAjpSUDBqw01VgZN7vmC2CAWKUOFT5HylMNghZJVxsdRN
 jxpF5EBVOSkN5zfoKH7vwOeHsW2MJMVdZq9OuX03BKLlV5Yb7ma3cXTWo7j0S6qWmYlALfV4XPb
 5opemYuyfldn4bypBRMOTqhn4y6lHxap453TuWPBwD4aWburK0j8lHCYReXn/pDYCdIijxEgrvz
 kO+GLJxzRiNyBxDON8w==
X-Proofpoint-ORIG-GUID: 5dQi2_TdD96HlKGLeMHFirNI_GmrvIEf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39502-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:andreas@kemnade.info,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:stable@vger.kernel.org,m:ldewangan@nvidia.com,m:sameo@linux.intel.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D69F70EDAF


On Sat, 04 Jul 2026 10:40:54 +0200, Andreas Kemnade wrote:
> Accessing debug/gpio is quite noisy without a get_direction()
> implementation.  To calm that down add an implementation.
> 
> 

Applied, thanks!

[1/1] gpios: palmas: add get_direction op
      https://git.kernel.org/brgl/c/0c001f9c0d96cbb533559cfa6177a1daea89a21d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

