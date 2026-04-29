Return-Path: <linux-gpio+bounces-35748-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO2RMTGi8WmwjAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35748-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 08:16:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E0548FAF2
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 08:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB7433032051
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 06:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7473C3750AC;
	Wed, 29 Apr 2026 06:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMOPTaYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jfQSXj3N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15503168EE
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 06:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777443358; cv=none; b=Cby4iU7nkwtyrFOoRy5nyJDWTwZYHCnUU8g6zTeUh9/Dqc1eO79qfnMusy8FSotudoWCTU9RNxOZQP4oGQprVWlU6+5G4Q4TrdHqUPoydHqt6pfhdL/hswTyeXcQViAI0blhyYAF0o1hkd7217u9V5SrOAhPUgnRpIYxgo/6V48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777443358; c=relaxed/simple;
	bh=e7zeGWMXkOw+MoY5DIcTASE/E7QHmk+Ob+lmuf1tucQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tz8Hn70BFsVDOhOLJ02lWXo9gf9Qb57LIx7U/vxi9q9LckYxmPsv2Df29qPqhAed2jpNC8ZjOFJMviBJZ2p0WoTq0V1YnA6fqiIBkhSWHxag/5Lg/nt3aHIYN2R5TLXMWAwX1xB7m5dK2ncM2p19f2EHqEmKRWeDYmoPLT87THA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMOPTaYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jfQSXj3N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T27b7J4070705
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 06:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mQI9HlZWs6GzOzl44yFNiB
	kIxqXXUO2Luqt6FeS3o58=; b=IMOPTaYkV5FHc1YcLKGWd8cCMQCJlgM4yqAyn9
	2E4eYTPq4llgxyCGwtKb5MWHbGf+nl8HvMbPy5yCk/gcig27ClpkPqfjmAVOFvq+
	66YBHig2aH+KSkuUF/crCLl/dIqswarZPJakyOeEcqC7x5jLRx5W8/gvVoNGfoVh
	A63LMorM3Foo+CJCgt51gKtVmCujX2K9DIyLdKDhEk/GD/R7Jkz6NrXzKT/YxFSI
	nm1t/01QkQ1RA72nD6a1uMQ8krK9BD2M5j6cuvRyikZXpBO5YjcWWD+5ARiWuG/o
	EAgkkcsBQ0X5xRRNbAlV91a1J+M/mWDXc+3FGLl5Xyd2xuvw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjm0kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 06:15:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3648018e142so3087723a91.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 23:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777443354; x=1778048154; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mQI9HlZWs6GzOzl44yFNiBkIxqXXUO2Luqt6FeS3o58=;
        b=jfQSXj3Nl9Xrbuu3jgUOlZKlv55sSDlD1SucfBRmeCD8WAZes/FV9bsHqzXVFPgkQM
         IymbWCIdU1jAvDCxYyukXlwoG31ZOJtqFsJy7ZoKS0AwALz1qzBxxOvVw0jzAg6aOrg0
         Gl+E5NwVra2FXyMudKm3xHiBkK6+Z5S5dKYTOpjOrDzMvEvvk+GeGM1JnQHOT47VJn19
         mqbSOfTS35E8zFGt24BdU1KUDuPvRGEJw8/lDRhGeZmU/lvfFkrhPfp3NpripipjA37E
         4NA+Haoqa9x5p3iMf7nIDWBSOjD5zP1OQcKrO7NgYGRkHqWr9GzdOAXM0e6rndtZPXUL
         wevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777443354; x=1778048154;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQI9HlZWs6GzOzl44yFNiBkIxqXXUO2Luqt6FeS3o58=;
        b=cLdQIawlHpeXOk040TAkrWOoV4kn+MvDFNI+FTYnIpqXHd1XhK2T6vQdVfUGbiLICq
         JHiaheT+UkOT7UfSX9WdxqmSx76dbUpDFJC/kqT4wqbNV93B+08GKoQAhQn18YyA6gMp
         45m4yYm2aOrb0ASds71ipRPc66Zg1RBVIT61pKp1H9fWP6DlFIHcCfpWsp6Y3kVqvWS/
         bxEHxP7VBOrur7D+YF8FeNXv8DZCC3Pov3XUBhauJgZIh71fRNw1tz15qyiytP9aDr3m
         0YogBfJo5Y2o0d3Ks0GBjEgBFngGFel1XOx0DCzZ8HHCaapDpoVI3p1osJow1fGDeAp3
         cgzg==
X-Forwarded-Encrypted: i=1; AFNElJ9hUv+LzBTRwXADjFAz4PKaneWf1tm/kOq8lDWmeZArvfcOKermH5FCwqvM72BGUZkzdUSVCEr5a3G7@vger.kernel.org
X-Gm-Message-State: AOJu0YxeZ6ySnZw7+8IfMfi9CWg5nVmymj0shrVavijNLBuAgVLTpG5C
	nBMMuzyzWEoTG5XUjYub9codDrGAbPq4DNj/V7/SIBoo3UQpTmduMFx2wAStwj2jzVeIo1NstPP
	nhfNknTejl+kF16YO0A/Y+tSYUWFehSKpnj5n0mL3eTj8cJxadqb84UXk49uqIWF0
X-Gm-Gg: AeBDietpOOnJmd+5g16w/ulYUy9tELo/0/5WU9sZ2ymc8sxzYpvdh2qOGbKw0n4yB4/
	Tf/23oWFvese21FDITNtEasEQRm0/D+/YjvglnVhbeHb1NeSeKF8OWFBj1uwfZHO3t6I/dp0TJ8
	AAeMAlIgQ5KNAR/Apu3h2Sli8XFqsY/lUEDlna3pHu1mjUYsldD54Qvup5FWRZKp42Rc6VuutDA
	80i1r+/s40bdvuXBkJ9l1dVc0BCyhHkSABDzfu8+G5sik0yB7iF6HG2ooIB5oLXYLajmAouStLO
	briqqZCo1zPVujzk62ymc1P13Mq52TzLY4y8EoR1kO8zRLlqJ4HdKVdRlzzbShQ0p0X54zeDyvG
	nZx7cb9C7hBTleuM8ZrpjpzpkavCEsyWKPQIJICV27Nr3y8DNa1aHGN/KEdif
X-Received: by 2002:a17:90b:562c:b0:35f:c5cd:cc5 with SMTP id 98e67ed59e1d1-364a0f59ff8mr2546859a91.24.1777443353604;
        Tue, 28 Apr 2026 23:15:53 -0700 (PDT)
X-Received: by 2002:a17:90b:562c:b0:35f:c5cd:cc5 with SMTP id 98e67ed59e1d1-364a0f59ff8mr2546832a91.24.1777443353063;
        Tue, 28 Apr 2026 23:15:53 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98895c613sm9879475ad.56.2026.04.28.23.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:15:52 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:45:45 +0530
Subject: [PATCH v2] pinctrl: qcom: Remove unused macro definitions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-eliza_pinctrl-v2-1-feff875e8137@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABCi8WkC/13M0QqCMBTG8VeRc91km21EV71HSMx5lgfU6WZSy
 d69JXTTzYH/ge+3QcRAGOFcbBBwpUh+zCEPBdjOjHdk1OYGyaXmR64Y9vQ2t4lGu4SeVSfZtJW
 wFaKDvJkCOnru3rXO3VFcfHjt/Cq+35+k/6RVMMGUdI3j2Fil7cXHWM4P01s/DGU+UKeUPv3qT
 UexAAAA
X-Change-ID: 20260405-eliza_pinctrl-382bd31c3eef
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777443350; l=4243;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=e7zeGWMXkOw+MoY5DIcTASE/E7QHmk+Ob+lmuf1tucQ=;
 b=R8ireRA3WnFLHvUezaHRI+HOQBUJJ6RnA24Mod5Uzewfj0W7m8VVX+jC2K9rnu8PUbUYTSiOr
 p5JU07htNgBAdZ8GlK8neGV3/ZmqACLFS9nkLylxtM4zerLnI16F6ZE
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA1OSBTYWx0ZWRfXy3KqIy+8sQLV
 17+Me5B+5wfQQi5YhobSkelWJnSOSHXprysBCCc0xTWk77Zok1PiJHLfggTOcO18hE8J528qJQb
 RM2Inmjg1432Z/zWtmqowUCSbpT7FvqOT+yroGHdNGiVH3npNyw0ZS8NhWJx+h9gdVGU2pi+W24
 hEHGXytGcGVucCtFYqXkOXos74YlSUEPZaVH8itLd6iKVQZWi8KR1rc5d9R2J8bRejYWE6zgY4b
 Cml03y46lwS8Tl7c7XD+6fE/iHjz9G6OHlufFnMQ+zL7SKrGxFz4mlpbmPh1BlHikDGd/2fsdgD
 Abc6rbAxX/GSSQJ8pOPxZvbMrfoNj4myd9E1hpwG2U1QOh6ROkM/Lr5B1JKHo9j2pTn98/itwfW
 s+RGGA+Gv/EE+XKzHL2GkyC1FokX0PyBwFp3eIj95NINT1iW8xg/lnrYFtWwFiKJ9uhiDOtyNuZ
 hclkRjFvq+OUYkxEo0w==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f1a21a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d3BPJbV3xAIa76psgLIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: wJi2nzOh3A0TK1yXJWPJDtgnWqVc6hV9
X-Proofpoint-ORIG-GUID: wJi2nzOh3A0TK1yXJWPJDtgnWqVc6hV9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290059
X-Rspamd-Queue-Id: 42E0548FAF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35748-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]

Remove SDC_QDSD_PINGROUP, QUP_I3C and UFS_RESET macros as on some
platforms they are unused.

No functional impact.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v2:
- Rebased on linux next-20260428 tag
- Link to v1: https://lore.kernel.org/r/20260406-eliza_pinctrl-v1-1-52fbf0ebc56c@oss.qualcomm.com
---
 drivers/pinctrl/qcom/pinctrl-eliza.c   | 24 ------------------------
 drivers/pinctrl/qcom/pinctrl-qcm2290.c | 23 -----------------------
 drivers/pinctrl/qcom/pinctrl-qdu1000.c |  6 ------
 drivers/pinctrl/qcom/pinctrl-sm4450.c  |  7 -------
 4 files changed, 60 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pinctrl-eliza.c
index c1f756cbcdeba3fac95364f5d7dde2c24de3acbd..c395ca7e6081b752c51a924a3bcfddbfabfdb403 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -54,30 +54,6 @@
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
index 3b28ac4988859238417d0c4f483e718065ccf48f..844d3dc9e72cdc4b77a58ce8c11a0ff85cb8d6fa 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcm2290.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
@@ -75,29 +75,6 @@
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
index 5125df7eb12722912ecf0a14d65d6da4f77f9933..77da87aa72aa2b631fdc24def7d651b6c8a8ffff 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdu1000.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
@@ -99,12 +99,6 @@
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
index 83650f173b0132e7f96f6c558868f57f63d7158a..51a66a20dc6635fb74e083c8fb1012491a8cb055 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4450.c
@@ -99,13 +99,6 @@
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
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260405-eliza_pinctrl-382bd31c3eef

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


