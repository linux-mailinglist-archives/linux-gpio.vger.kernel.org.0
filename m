Return-Path: <linux-gpio+bounces-38844-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2PGADsR7Omop+AcAu9opvQ
	(envelope-from <linux-gpio+bounces-38844-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 14:27:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 840D76B7125
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 14:27:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Yl/1a2Uk";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DxmttBIx;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38844-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38844-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED7D0302B76C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 12:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53F23D5C2C;
	Tue, 23 Jun 2026 12:27:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6CC3D5C26
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 12:27:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217658; cv=none; b=CqzGRMe7ZrsALxXaYR+VanXtqgs0TCIP86QMT0TI0zBPYVZFeixq4rbetH+pSmCkkXCSUJUPtS1y66bSUr9IUCdFXXbMVm2AAFakZURBpbKsEUMGBBc/hYFS8pxNFL6y55PyX+lzYLK47QdvuNRmTuHzshzAz7c3KAXgy+OrHDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217658; c=relaxed/simple;
	bh=/SmvW9w6tnbRzDIODoZaVm1ZD8so6Q0P/+Moqpv8ZJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T9iu4UIdiSPUV/Fwqx5DHJ368YlgJ7oBVQWtvC0T9uQy7PwOl1/hDKbIcdmKp+HTZ9V4jUB3KgrxKGzp+HhtvzmRGWxNGWNP9s1/VRLXweC29X/J7LpHRY7wVtrZV8jiaDpwIQOxAl3Rs768VjRXAobd44w29g90iUhvepP3qSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yl/1a2Uk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxmttBIx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZZB7134196
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 12:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=a5blHvDk6Lsj5ebLbFqYDUTB6Iu7tnnUZGO
	lJ9Ly38s=; b=Yl/1a2UkeGWSX5mG3+B4BlDwQP0ei6QFn9cAhF9jqwLHdGkvTcJ
	y/6TY5z7ij3Pqk+2cpMmCcp19mvvWS3P/wsXuAyasgL/EMD5mmF8Nj9angwaCwrB
	tFD6NQpCG9cT50EJ9L7jk81YXv8Gi40luoQISoFvpcOt2E29eKTjksJI4p7U+bs5
	oqw2TBuFU6LCu4xCsfHcV/aHChaTnPRQE6r2Rbvlwa9xkR/ZcmjoG/F/cDAoN+cv
	eNhDt1aFZu2u7XXwbo4BKG8Dsbfq0QDa+f1pheWuKGc+tEDqscxSOBFkoFgO0SkR
	YxLAo7joOTos89YU3iKErw6xVfi96u/Nrqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr320g5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 12:27:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-922ff615c39so259647385a.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 05:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217655; x=1782822455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a5blHvDk6Lsj5ebLbFqYDUTB6Iu7tnnUZGOlJ9Ly38s=;
        b=DxmttBIxl+pizGrtsaaS0tQzLlXeyJRuva5IMiC+hHDnl5PyyRclXgRidCGqkowKE1
         i5vS51S81IdxUqmPkPMkSaO0acVpdAv/75PFAMLHeUvXkKoZsxjkmdRVQQSj48tcq/mH
         9Pms4ZnqNOe3ASBkiLl6wTgXENkaYxKpMoxg6hDP1KXAhHBe99/2+pyVEblEjsXLfa/t
         /UAAG4GzGPQBKAXNfGrQiQWeRp2ENT7tzcYxEh/OWZ1yyBBcH7jP8IW2/LL6jZ5rEDoL
         XCg31dXbmAMsJhLdV/Uo++0ytHxAR6yhp0QpgyqSvfqvE4TpyMdloNCsNDMGQzsEihn9
         Qh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217655; x=1782822455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5blHvDk6Lsj5ebLbFqYDUTB6Iu7tnnUZGOlJ9Ly38s=;
        b=kWOLq+nL0v7IeK9g1SFyo++ZRwuqUQWaOogNUVJlNotSVOQgSc+085xnW+5z/2PpnM
         lFMEXWywMcBWB4gpOrkz4fiEWH7O9OskMGcqzJ10kjanl78yckdELuaKIZPLs3+RS6cb
         zlrl7IRDiT9Hxo9hrQbTD23NeEOtUwISREyJyVep0Av0Q2k/TCnKDIRL8CCxdvye+5fH
         NI3gJd01IBR+kOp6VbITbp+03cOLkFJrk3BFV7CA1CRPb5w6tZiNSb7zyO9lIGljwnOf
         +cD2BTHD8PGClocqkwjbapW05TpoQN22cgXElIzYyWYcDIMNVLsc8Xg2LTL3DOb5vyyP
         2adg==
X-Forwarded-Encrypted: i=1; AFNElJ90CBZHgugk19HLOlaNmXyV+t550XKijffWQp4sHIk8ZSKCnElkunLVG/eRLbYmGD0Y6biYLQhlzy9/@vger.kernel.org
X-Gm-Message-State: AOJu0YzPr17YY7X+Ri0equZtodi3NODr5+7yxgaib1VFJCSpFA/nL4NV
	lSuzHKMbxSr6H5+sqwZ8iLjRj5rNa4ALHnpbgrydtwDqyyG6YZ9aZYhShM4mT6q059I6uHSl0fj
	Njqy8tvSCwsAJxeMmaPbpjSc4wlZabcNa+nK5ZFu1R53BRqxalT+YCBsbBIPUxiJH
X-Gm-Gg: AfdE7cmIRMDhCjI0Q4yj0lHA2RVEPvcgpBFpb5LnWYK61pa2HTUHyxamSVObgMY12uS
	5+54HYfHqHcwOw6KN70agru2mCfCkfVjYD+xq/21W+rRpafSWqAr4qc5g36VVyaHXf4kXjuIT2L
	2sayQTH9teLmBiG89btKp67si1MX3tFI4HaltbLD3RwDQA2GGzI2HCSlFnkupoX/dAIoZYSfy1m
	0mbDa6tcA+mG1Nqg0GzKEh69i7OgkCGJ+/EZ9xJrQ/RHNzvnKo61Lt0eTBkVcpOcLzr5LM2TWWI
	GK16QP3IcqsGC355vQIsG3jmrJH/JBe9Jy3Po6u41sO6gKEDj6p+Hbqmlj9RogEiKjmLwQqtcd6
	HlEsvlCcikkcYcnR+ObzND+oyiZYAxWDaOuXkmvs+RR2A3iogJ09N5wlHASrAaZKvCqxCS9AyzT
	HwatOpnKbp25wULQFEITTPrw==
X-Received: by 2002:a05:620a:6488:b0:8d8:697:1cf2 with SMTP id af79cd13be357-926029eecfbmr544898985a.30.1782217655119;
        Tue, 23 Jun 2026 05:27:35 -0700 (PDT)
X-Received: by 2002:a05:620a:6488:b0:8d8:697:1cf2 with SMTP id af79cd13be357-926029eecfbmr544893385a.30.1782217654653;
        Tue, 23 Jun 2026 05:27:34 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5eaa64c8sm514378266b.26.2026.06.23.05.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:27:33 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: qcom: Drop unnecessary bitmap_fill() call
Date: Tue, 23 Jun 2026 14:27:31 +0200
Message-ID: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX8mEv8EhZb1Ap
 qjdD2JMKk35yd8KxOF2P5LuTQXVH8YOeU/fUaVcbc68qJbMPuyjX+B4MZUDy/cxx1p/MAAL9SUr
 fDvdWGA5Zzma4JBnPthFJ4XQwGUs2IU=
X-Proofpoint-ORIG-GUID: EUAtZehw5j4U1_m9T1K32kWpfcN2OFLJ
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a7bb7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=767hmU14TJ576fLMJtQA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfXwUse2I7EhLNT
 8ppvIp1pPuiHDVI2bNuMaWT0ZOAFI4E226Wy1n32omByuznFcXldjbycao9EWiDSpd49ST0Qxz/
 467NH6pEKu7ag29i+7DQ5pjdN4TjBH7M1HPCl4f0fgNbFZYTDW2Kr1eAQJHmaMkcKSh+Hno7YKx
 Z4QXTXb8Dj5ZeuGsf5/Xdf/yMW2F8wcfnEO5KYUbWn393+aUQTSI6TsUg346pFsnudTGGPdq1Ua
 hnWmfDS3JjmvDaOm7Wm+k4iZjwegQi5LzpRv2g/4ulQ0H1UCBbRHkSHetAjHMNMb9MaqQ4l1ydc
 sRCcHSA/OSLlHxvIQF2L+r2R59EhKyvq21Olc7jbL4NvVipToxwj1ro948RUs6hSry8zNqbHCuL
 NfPZ6zwQ/mPJkptXmMRHjs0GP4wwwdhsN/TQMJSPPABZ+f/Bm8wrJOrEzMwaZtSaCZz3JKwzJ60
 ZH8PLYbXIKXbDgPbB8Q==
X-Proofpoint-GUID: EUAtZehw5j4U1_m9T1K32kWpfcN2OFLJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38844-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 840D76B7125

Drop an unnecessary bitmap_fill() call from msm_gpio_irq_init_valid_mask(),
this is unnecessary because gpiochip_allocate_mask() already does this.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index c2938494c6bb..419342ab45e1 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1047,8 +1047,6 @@ static void msm_gpio_irq_init_valid_mask(struct gpio_chip *gc,
 	const struct msm_pingroup *g;
 	int i;
 
-	bitmap_fill(valid_mask, ngpios);
-
 	for (i = 0; i < ngpios; i++) {
 		g = &pctrl->soc->groups[i];
 
-- 
2.54.0


