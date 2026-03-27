Return-Path: <linux-gpio+bounces-34284-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFLXH3W/xmnoNwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34284-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 18:33:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 860283486BF
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 18:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A4E430DAD13
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 17:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CC83BED6F;
	Fri, 27 Mar 2026 17:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebSdERS9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EfpnsUL9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C95378828
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 17:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631582; cv=none; b=gi5T5v667DidPTmRgM5crCyP0E8ihGwIIzqkiHeb52mkoy87xGc4OS8Bx42IxHtE+eBrxdHe0czN+hRsapOkTti6EXo1minkg0OgnKjXPTi9/A8CwUcGw6fvKUr7I1RQT76OHCWE6WH5NKBB+1YH+xoUmhFu1k7mw3ohNtVr+eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631582; c=relaxed/simple;
	bh=/88q1mBjtIUH3ikMUjzzgHW29LsNAOlut+Hvt3btdUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=utNqQXEiGvznrm6OlZwcRHTpOTkc65uyDPj6qQlHpi6+Fv57UKHuPaARsGPIl3GTS3arjv1p0KtJ2Wnly21BnFxooqnavE/lcLrg3S7CuYZU/27rmVibwnHpjnxRYEbF1BcNpKCAw4hYKYvhogcVy/m7q5gRwrQjcEAPsKkcr9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebSdERS9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EfpnsUL9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhDxf3084541
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 17:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5zMoHjLJU3cM1Hpjqd/5HAsL+E4+G1/iC0T
	UDeYx3Yw=; b=ebSdERS9w8kS+m1wOE7PgtzgJ1NqC5xoC6JeufhDbRWIcoVzVWQ
	ZhY3xYMiXmZG4rI+ETnxPE3lmSVX2pk2V0Qet1CNzpqQTgw/g6HYdalyjRxWSSML
	Vm75MS9QGlPY1jBj6GTiPlMgOKxTBDR3c+XwYp7xVd+kMxNBSuo/jGnRYBSJZoGF
	GX6OA9WwJYyEpOi43jzI/QPVO5P/QYCyZE6NIp5sVrMZD0qt1MQ8QSYUkErEvYQO
	eJMwSd2+9jQ6s5tCYFob5zqwUUBOSWdmUUZ+WrjnBzEreFVpgXM/5JTY2OhOXx0h
	ViLmvjTBaPJj5oo+gKnidVAP6jvDdJr0BAg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn129aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 17:12:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c741f038f7cso1618127a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774631579; x=1775236379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5zMoHjLJU3cM1Hpjqd/5HAsL+E4+G1/iC0TUDeYx3Yw=;
        b=EfpnsUL9ETzeJ+yaD6bFVP1CegfbBqDQBBM57bMKXpqUj+MPo099xMjIXaxxDo9R9F
         sH7XXVKiwIR5thgAjqElDluo8aFMBfmmvqgT1KXL1MjfyucEsQmmiQgSWjyqysRVPbEk
         UZElRQv0EmLJRKqFtdjDpyHfxVrYitUm+t8J3BsKYR+qcmAyJaQINbBgwDBhbOuq/Ykz
         Fn/WCmS0/xRCexS72Au74+ARnw4Qpu7y+9a4vMljbWANjJlb70op8nblvPOau50XiPdU
         twYdJ2nt9m/jlQlW7rLiQ9o5GWrknV8F++KDC0ZBHqlAV10FM+Cy6EHQ0NhMe1jwGsok
         Bm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631579; x=1775236379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zMoHjLJU3cM1Hpjqd/5HAsL+E4+G1/iC0TUDeYx3Yw=;
        b=oDNihjHEfhxh4icP0x3pqEGenG4dGgsNI9afonGDKmAqKjcVPSIbNDkPWFaSaFoNZ8
         6E0uYBcXQQaUoWqLNcm1JPbnSoS3osIf7ckCJtHjj+7shVavl5sz8FsudP9Ts+rXMn6W
         /M7tKqLOJp4xKQf3HiYSTE6qWIXGMXhLqqdlPdlDhL1gUia7Q6MpMbyCge4xgwzpi4Xb
         GgEMfZI9bRnNcW0MlmUbDUb97ITPyOey+6Y4/C5fWotRjOs0cCHc+fzTjXnmcllls4xf
         0AQ8LbnMHa4SsPYWZyzs5yNFHjMTXZi7ivA2G4j06Z8fR1ld6lAuyJDeBbskLCa2eIO+
         ejKw==
X-Forwarded-Encrypted: i=1; AJvYcCVqkrRVS5ElycpyDIBaTyLWHgiPxJ7ROvpn3yPISoCnZpRmMdFvdpLeyOMdtxtTnHmbmauGi4Qw75ct@vger.kernel.org
X-Gm-Message-State: AOJu0YyEOmZ3OAf6/JG4pO3lkO7sp6eHc9aHb/DhayDxPyUBdzny8L3W
	BSVfSSPaA63JB3r7ObIGvlRk3bAWL+bCRvdCCG/BDc/VQngGZUMC63pRVPg4vm9qkmMIkb49cbF
	WHcKLP6x5ANN4UCaJfsaqr5XBReT4gENjDOnVxeIRyWxT00yPEJrD5UhcH/qa7qxA
X-Gm-Gg: ATEYQzyiUtCdBMZETVgcbLq0Xrt42WGpVd9STT/4S4un1elDM5iRmJKLG+zgXYZEAKn
	xu1lxygqtbL/h38Hb+wV+7yHoV9gwor/OuvjbZdqbiT/lr44H7/uvbyBDdW3pe8QkJqxl9N+bSG
	8G1X76gcKO5Jbrdm6FX4KKSOkDrcb/7fhxVZ8lYE09dJ1X2NoDqurgK4DouyZiY5qsAFtRX2iHZ
	XHJGQuPApjRhWS7I7p3JlIcfSc3wb99J3WgLFdoLR+6ta3buU74bMY+6jJyVqeYziByTkOX+fRC
	H4/SMeoocDueLKTvusoXZUgjtxDmIuDrLUzQu/aE1kS4rhjrQQEc7Ls4XBZkAluldezEb634wSy
	fTAwFilNVc/bAWiUnam0IMrd0RcUNn8aOlBjZ4lLcYV6IlzWp
X-Received: by 2002:a05:6a00:438a:b0:82c:7f08:8826 with SMTP id d2e1a72fcca58-82c95e915fdmr3259551b3a.17.1774631578719;
        Fri, 27 Mar 2026 10:12:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:438a:b0:82c:7f08:8826 with SMTP id d2e1a72fcca58-82c95e915fdmr3259515b3a.17.1774631578130;
        Fri, 27 Mar 2026 10:12:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c964f9e9bsm2531517b3a.49.2026.03.27.10.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:12:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: qcom: eliza: Fix interrupt target bit
Date: Fri, 27 Mar 2026 22:42:39 +0530
Message-ID: <20260327171240.3222755-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDExOSBTYWx0ZWRfXyAyVDZQCWs/h
 5OtswVVrz+IuR9Y9pON9jFI1qcK2Al5LM23e/z1lROkdsqsdxeyIxaW1BEho2GElmU9aAgQFPht
 lKaVRFYwowPGoG8Ir2gZdqhTuoqOSgRMS6Jv8JSZaNlTvgvyv6YmCef/bDmNiJCFGmhes3qm1H8
 ipUzA/KdtNGEzzCSw/AfiBm4bbgQyhFUyR7yPEHcblzHeexdSm5GLQzsiOY1D165u6XpsoXVIlq
 5n3CZXKqp3Nh47wQ7k9d2B72HfSGOD+nscr5UEJvInE7y+G4O+uHxajGb0QY5Fgs680ZOi1h/xV
 dvXsz8ielKg2sfBua26H1yvUkZaOFSOnssdQ0yTKdZ1H9XFaSJ8fMBTaE43KBYnSwZ2hzPmKBVp
 5EDz6WkxMWodCW8byB6D3W7sL7E7uuhnwnmT3yiMwBiOOzLzZlTi8oLP5zV+1A5xsoUnct1GKHn
 9DwZGLkp55S2xhfPsvQ==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c6ba9c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_UdXETfmjGnjTIlQpucA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: hBXefB8GhgyOMHq3dM2d01BLPKhlRdJM
X-Proofpoint-GUID: hBXefB8GhgyOMHq3dM2d01BLPKhlRdJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270119
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34284-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 860283486BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The intr_target_bit for Eliza was incorrectly set to 5, which is the
value used by older Qualcomm SoCs (e.g. SM8250, MSM8996, X1E80100).
Newer SoCs such as SM8650, SM8750, Milos, and Kaanapali all use
bit 8 for the interrupt target field in the TLMM interrupt configuration
register.

Eliza belongs to the newer generation and should use bit 8 to correctly
route interrupts to the KPSS (Applications Processor). Using the wrong
bit position means the interrupt target routing is silently misconfigured,
which can result in GPIO interrupts not being delivered to the expected
processor.

Fix this by aligning Eliza with the correct value used by its peer SoCs.

Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-eliza.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pinctrl-eliza.c
index 1a2e6461a69b..19c706137f81 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -47,7 +47,7 @@
 		.intr_status_bit = 0,		\
 		.intr_wakeup_present_bit = 6,	\
 		.intr_wakeup_enable_bit = 7,	\
-		.intr_target_bit = 5,		\
+		.intr_target_bit = 8,		\
 		.intr_target_kpss_val = 3,	\
 		.intr_raw_status_bit = 4,	\
 		.intr_polarity_bit = 1,		\
-- 
2.53.0


