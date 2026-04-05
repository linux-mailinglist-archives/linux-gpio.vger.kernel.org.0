Return-Path: <linux-gpio+bounces-34690-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hwdlDiqr0mlnZgcAu9opvQ
	(envelope-from <linux-gpio+bounces-34690-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 20:34:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD5C39F4AD
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 20:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6096030053BD
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2026 18:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA0A2DCBF4;
	Sun,  5 Apr 2026 18:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEsUHJrp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RykwAGam"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C4E2494D8
	for <linux-gpio@vger.kernel.org>; Sun,  5 Apr 2026 18:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775414054; cv=none; b=IPTkOqUceWoSHRydBJhDGMb1V1rQMsEUzwCqdNG7FlRumyLC1RxfuCYaGonAT45gjQ+jzEYEh46ohdORtgIg2I7xjbIgupVaeevuy9mA5b7OSOGwPpbS6If7EutIzssZN0AWeyWoW9pNwnnC3IOiWfYenK7ph/RapxLnm5lipag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775414054; c=relaxed/simple;
	bh=rIHQYFQaf7Z31vVenFUwFs+dg0T61WDiFEUzAaHA7GI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GEvZYFyCx2sTMhxPRfaclf7xi8HSg4Je9U09DOM6BYEMyVp60XZQfK8ATyqA9oqz7W42cWy2F9KVEjqYQSHGHqPfykvJgf2+evpo/goad/LbNwTkghQ6kvnyIC72AAuH3rky4kmTkWdKXg0+EMqWoCHHwNvvevdByQK3FPoBXEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEsUHJrp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RykwAGam; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6355bqmX2752731
	for <linux-gpio@vger.kernel.org>; Sun, 5 Apr 2026 18:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v+AeVjPxl1GLotUz/UVGgs
	9oc8hGdD/fRuAHzr1OtAc=; b=cEsUHJrpFopmprn9PCrFKVIvW479gojEIz3Ju6
	/JWs7kLjQXxs+M0F1hFBUdHXMLwOHddX3G70hy30lsK4EeWGZgL0Fc5QqDf9Tm9i
	fLgrPgbDKGRtiWnMrWREOH4Jv28XjFo62ecBIua+2vgIdqUGDy7QUjn6JLoEiK69
	9IAesTilKhlwZdoJtBFXAaCP0vJF3os/M3S/rx/ktZZrK81BTNUdKeSUPA5umYPz
	DPs1EeS06LQFmaXdqY6I9lPiZulqvi9BPLZDAZTc5yiA9wrjZkAIu9gZOkt6d0vu
	H3lLkjRju5ELjWqqqz9pgQUNqajn0ivL9ln98fBlxBZk3FFA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd2vhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 05 Apr 2026 18:34:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d9467e85aso2935944a91.0
        for <linux-gpio@vger.kernel.org>; Sun, 05 Apr 2026 11:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775414052; x=1776018852; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v+AeVjPxl1GLotUz/UVGgs9oc8hGdD/fRuAHzr1OtAc=;
        b=RykwAGambwTnrRnlRKVmfR/rh6dHysD2LkwjJcUr51X9+32bVEKJYl8rJ6vuoV+ja7
         kqHKzybiYMsm1JQmIpe17zjPFbVdkgS0T9g14FWMtf2FS9Rtw3GoPqMFqEC0GbVRz9cx
         0UjRYBSbjnASlUSBY45CX6ItmNR1BWDdPCBCh/gtcGa65mPniMIJkUxDm243hVbCoQfa
         47E8hgwH8AjDEwsPL/Wy5Da5f8I1KkpysIrf+/c0Q+SOis7EHP2kofcRBxk9Z4hoQitS
         mf0/6l/MbYsKvRpHPxBCerLfGEYpNgzGRhKEwpfCuW2Pa1eksv8vxluiCkQp9li/NWJR
         Ld0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775414052; x=1776018852;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+AeVjPxl1GLotUz/UVGgs9oc8hGdD/fRuAHzr1OtAc=;
        b=JCP7V7fBve1XaHzVc2keY9fbeCWgT83S5H8r4LWKDqatt6NtO27+l93JecoqPJMB4y
         EQ5Dj+/bvv1Rcfgr/dOBJ/xwRQ6V99gBcEunri+BINnn/5ewVTMsCeMK17FU6eT8tRE4
         83ZwAOAvm+xUGk5J5PmlP1XEmZKjlEALIIs5py8ltkpGBITCNFVPnNtQEaRNVSkQBdYZ
         AeQVfGHzZSBhbaq0AzpN0Alv0OF0Bi+3VRx/wAgMu26CJTLlvr+BX5Cj5jz6QFyYw/Bz
         GdswFL6fYaeBTAJGlj+baa5z8dS2zRTgAKLBJqXh9v9kawFhJBf4+uwbCWfy8i+5cTbh
         qqIw==
X-Forwarded-Encrypted: i=1; AJvYcCUM8cn+fAxyzO0AjQ9+/eMzT8Eelfq7pd3F94PU83Bdbs2bgjZfY59QlSsZgJ/0synHDyhqNQdHJALZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxthgDqd/1xiBlIvz4gPuMPqYYR9qhE9gwAWy23WBo/flXpyobR
	+j3dnWFDepptv8Zzk3pm0XMGkIjQKMZhw6Bi6mBVQzOt4Gr0wbTo6jGu8Mi2VwaZYnp1awa3iSh
	77+f3WcO1H0PsEyExLlnirg0R+6jCP5z+ycpyUIkD8Md9jMWDTU0hx064UQpP124K
X-Gm-Gg: AeBDieuX6Kg+gRGERNsPLQMbfLY4QsG1RPA1zNCSz9ku++zd0tNXzmCGrpC30uBz4IY
	A+AWStusppDxSQWTGIOA45WXYmDQtAGUacbYgcYxj1+EvqIw/bmtoYXn5DPp74K8gOsctShcmyT
	+QwEEhkZwfAvneOqH5IN2CvPrKcvzbS2ncPAcNqndY75FTArnlXg/VkoA1YfdNTmnuPdMjRrA6C
	yahi+hqxvjydkyLN8077rib1hCi3DxgR/n3slgXBKALARUqMeZdPYMmbLWK2bzLZ/NLptEKaXp3
	dbrIcqbkHTm9YB0SCQdaktSU+c0a3wiLt4mLfWFJGR/updpuoJfzdqRGzgjVOl5jBcuzVU9MkNO
	FYaNydxTU65mGtpFCIP0MLlWw2ozosxCh6Gye1cP2tGoGJ2viqQ==
X-Received: by 2002:a17:90b:510d:b0:35b:a3be:f1b6 with SMTP id 98e67ed59e1d1-35de68f7c0amr9250062a91.16.1775414051911;
        Sun, 05 Apr 2026 11:34:11 -0700 (PDT)
X-Received: by 2002:a17:90b:510d:b0:35b:a3be:f1b6 with SMTP id 98e67ed59e1d1-35de68f7c0amr9250042a91.16.1775414051382;
        Sun, 05 Apr 2026 11:34:11 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe5e1b9esm17556788a91.3.2026.04.05.11.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 11:34:11 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 06 Apr 2026 00:04:04 +0530
Subject: [PATCH] pinctrl: qcom: Remove unused macro definitions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-eliza_pinctrl-v1-1-52fbf0ebc56c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABur0mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNT3dSczKrE+ILMvOSSohxdYwujpBRjw2Tj1NQ0JaCegqLUtMwKsHn
 RsbW1AAM/zGFfAAAA
X-Change-ID: 20260405-eliza_pinctrl-382bd31c3eef
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775414048; l=4084;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=rIHQYFQaf7Z31vVenFUwFs+dg0T61WDiFEUzAaHA7GI=;
 b=QSMJt00zX1aFeziyuKMEVucMSkhPmMbziYVqU7O+MP5fC6AhPtm5CH1EPck2xpAT4UJMhet6H
 LboySXNusz6AqQmmUqPSGJ09MnSOBeyIGx1gxAorUDYvOCnmsy7jroz
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: 2YbYx6VDQrlc47GzT6WdHk4LSeo9abfB
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d2ab24 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Xb04hPqHog99820oH2IA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE5MyBTYWx0ZWRfX/MVnZb/X0m/c
 uHw4cj4FnmnROORdoq31wr31GtHWOkSaPCc54sogttDvEHMTRs8NEhMV0i6k1gLXp5UTv1txX8+
 ZKPhRHmdAwc45V12AAJYCP1HIPNshHoR6VP0AhdYtzlK4YzCiaMvAb2MqAjmtUP5Tgl0efLBX2N
 bHobfDL1TTCdR8PtlPFvYQ6fN+Rb2F0Dbckd/zEM4eOvZa56zpkcnsN3+qvt0k8W2u/HevYlawI
 haNyXUuODofGWq5+qF1JfO6FHFweTzvPIOVQ8F27EeQ7wWd4HuXphPKVCpmucanMbpHf2R8v8Pz
 VRPpXMfoMVhLRVZbrOsby4QAUKbp3OvWutzwO0YlJWFACJXlzGVlgZDpHP5aC0m72n1cudjaIkd
 9OojVEcP7TxN+k7kiQfMwLXXX/Pc1c4dquuqCPYtPAUQSPKIFvXWy9uh2+TMg/SAC2i6xgeLzdI
 D9vICAfO1wovN6wt3dw==
X-Proofpoint-GUID: 2YbYx6VDQrlc47GzT6WdHk4LSeo9abfB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050193
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34690-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.105.105.114:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[209.85.216.69:received,205.220.168.131:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8BD5C39F4AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove SDC_QDSD_PINGROUP, QUP_I3C and UFS_RESET macros as on some
platforms they are unused.

No functional impact.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-eliza.c   | 25 -------------------------
 drivers/pinctrl/qcom/pinctrl-qcm2290.c | 24 ------------------------
 drivers/pinctrl/qcom/pinctrl-qdu1000.c |  6 ------
 drivers/pinctrl/qcom/pinctrl-sm4450.c  |  7 -------
 4 files changed, 62 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pinctrl-eliza.c
index 1a2e6461a69b8e7c0ffaeb15b0c20bccffc51410..4c941cbd4a12736e3ec135066a229227875f16b2 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -55,31 +55,6 @@
 		.intr_detection_width = 2,	\
 	}
 
-#define SDC_QDSD_PINGROUP(pg_name, ctl, pull, drv)	\
-	{					        \
-		.grp = PINCTRL_PINGROUP(#pg_name,	\
-			pg_name##_pins,			\
-			ARRAY_SIZE(pg_name##_pins)),	\
-		.ctl_reg = ctl,				\
-		.io_reg = 0,				\
-		.intr_cfg_reg = 0,			\
-		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
-		.mux_bit = -1,				\
-		.pull_bit = pull,			\
-		.drv_bit = drv,				\
-		.oe_bit = -1,				\
-		.in_bit = -1,				\
-		.out_bit = -1,				\
-		.intr_enable_bit = -1,			\
-		.intr_status_bit = -1,			\
-		.intr_target_bit = -1,			\
-		.intr_raw_status_bit = -1,		\
-		.intr_polarity_bit = -1,		\
-		.intr_detection_bit = -1,		\
-		.intr_detection_width = -1,		\
-	}
-
 #define UFS_RESET(pg_name, ctl, io)			\
 	{					        \
 		.grp = PINCTRL_PINGROUP(#pg_name,	\
diff --git a/drivers/pinctrl/qcom/pinctrl-qcm2290.c b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
index 38200957451e1975b7215eae6a2d10329a30a57d..1c6d0e0b7ddb785b36febc4efdecbc84a27408ec 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcm2290.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
@@ -77,30 +77,6 @@
 		.intr_detection_width = -1,		\
 	}
 
-#define UFS_RESET(pg_name, offset)				\
-	{					        \
-		.grp = PINCTRL_PINGROUP(#pg_name, 	\
-			pg_name##_pins, 		\
-			ARRAY_SIZE(pg_name##_pins)),	\
-		.ctl_reg = offset,			\
-		.io_reg = offset + 0x4,			\
-		.intr_cfg_reg = 0,			\
-		.intr_status_reg = 0,			\
-		.intr_target_reg = 0,			\
-		.mux_bit = -1,				\
-		.pull_bit = 3,				\
-		.drv_bit = 0,				\
-		.oe_bit = -1,				\
-		.in_bit = -1,				\
-		.out_bit = 0,				\
-		.intr_enable_bit = -1,			\
-		.intr_status_bit = -1,			\
-		.intr_target_bit = -1,			\
-		.intr_raw_status_bit = -1,		\
-		.intr_polarity_bit = -1,		\
-		.intr_detection_bit = -1,		\
-		.intr_detection_width = -1,		\
-	}
 static const struct pinctrl_pin_desc qcm2290_pins[] = {
 	PINCTRL_PIN(0, "GPIO_0"),
 	PINCTRL_PIN(1, "GPIO_1"),
diff --git a/drivers/pinctrl/qcom/pinctrl-qdu1000.c b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
index 7c535698a780041c2660c08d22146c8d700ce081..c9431bcdd4b499e035f48498e822fe20ecc98d0e 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdu1000.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
@@ -102,12 +102,6 @@
 		.intr_detection_width = -1,		\
 	}
 
-#define QUP_I3C(qup_mode, qup_offset)			\
-	{						\
-		.mode = qup_mode,			\
-		.offset = qup_offset,			\
-	}
-
 static const struct pinctrl_pin_desc qdu1000_pins[] = {
 	PINCTRL_PIN(0, "GPIO_0"),
 	PINCTRL_PIN(1, "GPIO_1"),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm4450.c b/drivers/pinctrl/qcom/pinctrl-sm4450.c
index d51e271e336101796b75d64e56f573f3547f1121..bb4e2c7714e3fefbd47a9dbfaaef542d19555675 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4450.c
@@ -102,13 +102,6 @@
 		.intr_detection_width = -1,		\
 	}
 
-#define QUP_I3C(qup_mode, qup_offset)			\
-	{						\
-		.mode = qup_mode,			\
-		.offset = qup_offset,			\
-	}
-
-
 static const struct pinctrl_pin_desc sm4450_pins[] = {
 	PINCTRL_PIN(0, "GPIO_0"),
 	PINCTRL_PIN(1, "GPIO_1"),

---
base-commit: 2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
change-id: 20260405-eliza_pinctrl-382bd31c3eef

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


