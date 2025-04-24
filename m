Return-Path: <linux-gpio+bounces-19228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3172A9A03C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 06:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 372F7445E5E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 04:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100291A4F12;
	Thu, 24 Apr 2025 04:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ii0SDCVw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538C91624DE
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 04:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745470060; cv=none; b=DwcFk5xl+UQ2ZqyJsm3c12qAGu/4OVuECh5t3w9Hmn9N/IJVI8mPaw0yGOmMckwbzaBzF2i0bZXD7jCHaa6NmUVHrkMvj6WBGcZo0VbLb9eHX8K5pDD5237EjOeHMx8Wv5wAcR/UDkr6SRbPszR3+qLMH2rNUswpQ4+kxZoD+lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745470060; c=relaxed/simple;
	bh=ptuipwHUDCgZKqYL6e0NkqtYwtJGVubt2616v9gIpm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qwVP4nCImOLYmnkzlzI4P6GzrjYHLarK0ckltDCSmNMWSD2PUjIA1XcGHuHuwLIA0KOhf+kcC4bEtQz3ymqGvktoAp6Q8VfYcwZkzRfym2xiPxIu8XmCJYzonIsYyjrti39PUMRY9nmqrl+Lo3l99VKtfEk/TJIwH/lmdlo12dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ii0SDCVw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FDrL000771
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 04:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EOpmjHuWdoyxtbl0lXVyHn
	PEnYkVQY0jb3AUJtDtsSI=; b=ii0SDCVwQ09Myqek9hu7mOMmEeUahRsfY1YJCM
	TMxDembBNPFtL6PIg/Y7J13KDvAbgirWPswJwt9NHS6sQPIQP1thbRkq6ZPbbMf2
	b+E4RhbvsDSWmZj6m1w+/zeAmbEOPWateyDXbWKNVDej3jI1E3PGbGrPKzr0xlAu
	MLt1xpS3tITrkLH0dA1cTXGSriNOYPW1whFXookNE6+lIekvyLYJt72aP4vsGy3u
	CeS5tJf8JnGp7LzlapqXgm56+YqO9JE45nvc6av6eCaeFGAPPFP8s0BWDvV//4HT
	LXEfZP9tJGd8dlGmqtcWzNNtHfLJq3JqyDxeWlDDTTyt798Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3c7q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 04:47:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2264e5b2b7cso5410425ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 21:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745470057; x=1746074857;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOpmjHuWdoyxtbl0lXVyHnPEnYkVQY0jb3AUJtDtsSI=;
        b=lx+MLFXs15ijaeDLJMPb6LH7+Fa2XuEDCTqOwL5uSUPeNYvO8wsRDVHpcFTWcaue7G
         +89QqMfQn0RrLF5sCbDPGSG5hT3HQKYaX8EjZREY0LRsStXleHwI30LELV9JFDx/+iah
         0c7vt5TIgUzjGaPabqIVdIXPDG2QdSIvWw3M/NRS3TTVM2ipMKW+sbh/SfPk1rcUp9lN
         RnI2S5/L3sWfGKHHtJ7FjWubVbwNvf1QX0XS0Qt53AOmSIFg8DYvsfRs5jePbylL8o9N
         1wo4QhBsIQiCJ6mXJB3Dme1S0k2YIxrqDLecEh1uxi8dWz4YB9N2LlqoBvUCIRzV5Q5v
         GmQA==
X-Forwarded-Encrypted: i=1; AJvYcCVbU3Rr5IPwZMylpf9QIMN6Y40azlpDepSsqfvhrVRZ8dsz4Ty9E985cQRvwPrDBo++qY2bskfv0b6g@vger.kernel.org
X-Gm-Message-State: AOJu0YyLP29R37CIuyz5Re6ezg5gZFxJUUDbzYD0cDpe27GZ6Pak4fch
	YYk4087BIWZV7mtGNbMvYjyo1aBHLp+losSouWM5x8If1WXtORSU30Vit3ClEr8sA/drwcmt4XT
	u8fEnqIK8QHOynMKTPOAA7wTtfNVolfj3jPWMZ+7zdDFTo32FLRc47haF/gNN
X-Gm-Gg: ASbGnctRmAhwe6AZnGYOanPpKz2O0oi9pTxpbofZbQ2YTSDRDQzxtzk6vJSnuN6HBcd
	3uPi07VhIgo4jKgZB0kcQQ4u6M383DDrcOoFKBvdmkmrWz18qnrh5zDLKRjWBh/IMntHsI1aYn5
	zBnKonGQ3cOuxnA9Dg95/a6cnlWBJUcyBiwy+JHesh4S/EdJterisuWjLRrHnmBbMDl23vWwk6T
	SR1OHUAEorEgdbVjX3/EJY2jVSEnaq9rOvMfUUkyqMTXO5/v9WdBmXGzm/tFXxZ0DkG42NF4t6E
	m3ylDHqVPSkIVGpgsTkuvsr8DA==
X-Received: by 2002:a17:902:cccf:b0:22c:35c5:e30a with SMTP id d9443c01a7336-22db3bf1a0bmr15774445ad.16.1745470057583;
        Wed, 23 Apr 2025 21:47:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRXAusDnHxqVZy7R8LW483DslzGVuC/HbDJZqxIbATob8CnEvN8+j4rJ9x1uEc3kEzS5ppSA==
X-Received: by 2002:a17:902:cccf:b0:22c:35c5:e30a with SMTP id d9443c01a7336-22db3bf1a0bmr15773985ad.16.1745470056924;
        Wed, 23 Apr 2025 21:47:36 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76ee8sm3589345ad.50.2025.04.23.21.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 21:47:36 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 10:17:10 +0530
Subject: [PATCH] pinctrl: qcom: Fix PINGROUP defination for sm8750
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE3CCWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNj3YLMvOSSopz44lwLc1MDXfPEpBQDCxMDMzNzUyWgpoKi1LTMCrC
 B0bG1tQBIeyI8YAAAAA==
X-Change-ID: 20250423-pinctrl_sm8750-7abd08406675
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745470054; l=1529;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=ptuipwHUDCgZKqYL6e0NkqtYwtJGVubt2616v9gIpm0=;
 b=hbcY0ql0VRWNSWGKLs0BemjFuqtyHC3PLvTPFrDr5Kcg6ZUkOi9fHtbjOREi+3Iubk06FQDhM
 raADQQ9NeeoAYkwrk+6vhlRguAIqUXqJ14ovV9CA3rcbAzp0DQcvbeg
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAyOCBTYWx0ZWRfXwpuCT0saypqC TOkubjcwi80ctAQc9WyG+kSruDMjsPAGp1jxKBp9sLpnkYxN8P+glzlN8Zs1fX8wvvNEUneajBQ JVBhc1nzcH9DnZdkWAJ6ElJMMp89GJQfYQv/3rcKSQUGymigDgRMx7aJU8ec9DZtxl/UPNkZ8Di
 4l30BjlBKPM4XoIXPPVFaGWuX53Yihb/aJKFk8sUTA/++8DtBHuyVJ4Nl5ZEjt5m4oi7obqvPUq KgvxXiwcOf9qbH7QfobnT8Y/QhKZIFFhVaT/f5qxukZr9eGgaVegM78y9wj+/W+WIj4x+9/z0TD 7NbuafRuQe0diUL8AjLdggyAS7jMSjU72xS06uhJZjMWhHVqm9DT8UqV2J1y8nlR8PZrnZGtbBn
 DQpwmMbiTZX6Au+e4tTvzGPSbgfC/qUC0OyCcT7kD08AkAUBC0tDtvdg28klbzPfDpEwSOjS
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6809c26a cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=61JurpKn_mCFDXP9eHYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: lIzzX7IKSaGo9xi-VdLY_U3oelLKRrd1
X-Proofpoint-GUID: lIzzX7IKSaGo9xi-VdLY_U3oelLKRrd1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=614 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240028

On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.

Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
enables forwarding of GPIO interrupts to parent PDC interrupt controller.

Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8750.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
index 1af11cd95fb0e69fcc876fe069cc2cd6fd6679fd..b94fb4ee0ec38013d8cde7e45a7d6088a20e3b28 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8750.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8750.c
@@ -46,7 +46,9 @@
 		.out_bit = 1,                                         \
 		.intr_enable_bit = 0,                                 \
 		.intr_status_bit = 0,                                 \
-		.intr_target_bit = 5,                                 \
+		.intr_wakeup_present_bit = 6,                         \
+		.intr_wakeup_enable_bit = 7,                          \
+		.intr_target_bit = 8,                                 \
 		.intr_target_kpss_val = 3,                            \
 		.intr_raw_status_bit = 4,                             \
 		.intr_polarity_bit = 1,                               \

---
base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
change-id: 20250423-pinctrl_sm8750-7abd08406675

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


