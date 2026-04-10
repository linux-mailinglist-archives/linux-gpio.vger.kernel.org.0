Return-Path: <linux-gpio+bounces-34996-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPJyKSHU2GmuiwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34996-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 12:42:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3943D5C58
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 12:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F7C43058E38
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 10:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F0738736A;
	Fri, 10 Apr 2026 10:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nag8hC+i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UBrVFlzW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83AF38837F
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 10:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775817378; cv=none; b=fZx8ytSjTuNxUlm1VPjoccNUHhjHnzWjvoXGOL3D6+Uvl7zDSizJKcMppBBRNvQeO/ejGlWeo8C4VXrLqq1FPXWSdiPUOngTI6WvKK8JZ8fX3FWB7Nn5vWqiYPikAxQK6TIOoSB7+MCNSD9oa16talthb7eRswXCdmw+mswViJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775817378; c=relaxed/simple;
	bh=w6re5Io0CJ7B07Xe/0cTaVsJ5qgW8GorXQNdVxXngbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aMThxcGnZbR4s3KFc285Jrh9z09vLxmVJJxYPcme9vxdmaokc8PVU06++cUDblqT/Sb/s6vpuC08AkNykihpcoteCJYWrLNH6tJm1BixB0KyUqmlhTpx73lyaccgp6VyfbL2yd6uxHo53DJvRzf7yKFkfPGj0SUakb1DIveVJrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nag8hC+i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UBrVFlzW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA65oc017527
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 10:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=y/zn9OP0pM7QKnHUQl0owACDKie0UcQRIpy
	LdhullFI=; b=nag8hC+iDBqFC0JkASg8cCXDk7NhuvVfCbMuZIoWbpGc7hyfDa/
	+I++JmL2tFNFZXQTcyycKGvE1L9JvdzX5lax1ZwNjRKECa/+6p+gwlVohCyiT8iP
	wjywleZt+VQxCXFaw9/VMPF5w1ptjaARhs8aG9yALdU9hiO2tf08WALfOBar6tf6
	fyBbmFXO63G4PN9/artm6LdlLXCF4m1C1ta0RL//ULEKBrHaMZ6NTdwe+MA3kzTN
	I6dr7jub5fNq9nqQlvs3A/ap9ivv1ivRLMLZH0/pTyncnvS8wY/JZMMVvVvKzdaY
	qHMC4fXD0Z3IQk2PE0YQRZvs8yAC0MnyQug==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5j03eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 10:36:15 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-42394108a90so3352687fac.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 03:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775817374; x=1776422174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y/zn9OP0pM7QKnHUQl0owACDKie0UcQRIpyLdhullFI=;
        b=UBrVFlzWbNdRsrhfBcq8pMb99l5ckZtPKQCHo8HPxcDOUmSNhHzAb/BBCjVIZobHa5
         HmhWGTqF58vkhRTMcmCFmR1eVamcmYk69E5ZvX+PK8u8zfswLSqpUQAAwnYEy5kqwnfN
         IB8HribnWQ2FdFkqoYcsiIdqO+p+bF25Wpjn7GnPQ7V+pMEdPpYC+FXPIAUbUVtGJQ0Z
         fPEUoWYNwS1v13Z4NzbgVszHT7SwwGK0KFpanBHomVm3RzPdsvIUpUtgGxkbqSW0M7BK
         f6BBGFWOwiIc+xHpi7pSw+R6p7WVkSRuvh/CCm23HKyCVdF5YzDzWzHcDH0kABSYvAm0
         IS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817374; x=1776422174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/zn9OP0pM7QKnHUQl0owACDKie0UcQRIpyLdhullFI=;
        b=WoOqdEJICk/a9oaSU1yFYobDGtq2bAGcukCdRHzSiF2jCF/93mvLfCAm9KXik8+KAD
         EGj3pJUuyNNGFb9NYd/Ie8QrLeISrevIWfTJY1bq7rzraAEciJlg8S8rpRMtMOjj+XQc
         TB2KGPkpBBUOwh7WSG+mcVrQclei98HU/5oLIwqpR8AJH//+dNZvoaYaf51MH1VRbnEi
         6cPPsOKHdrjB3o+seZNbIuHWTr6IfdTfpjWHyQx/Fy+ZQRTkvKJUvXGlywKjzz45bR04
         ed8+FE2e9j4+XddDzNgRiZ7vEaWWr2mjHOQcFybsQdWTzpwqzwmF70YkrNpN4rpxkZYI
         8fcg==
X-Forwarded-Encrypted: i=1; AJvYcCXn1JV90ta21P06VSb4Qj4xZfmfIDHQ4icD7o6r5mIqOdR9dA5xorhsQVSm6VGPcnmM1FAhuiAQjEC2@vger.kernel.org
X-Gm-Message-State: AOJu0YzgDO5An5ZXSBOasydMgjJzcGG42IAbcUWsrj6C6mfW1QZ+YKvS
	d5YSMd5pqpR6tJMi/h+bXnNQuT3CyG7tNlNL2INTfj5twN8vpu4TpKMaSC3cw+b/b2LLgX/TT0K
	g2drQkkFNKvNSB0Kc2gMeY0dwExkuIZqJ9MCk47+Cy3AMpV86IRpIGC1c+wIIZIV6A/s+MIr3
X-Gm-Gg: AeBDievIV9Uw/0B6laQI5PSQLLFrC+DlqOf683r3jIwyBMv1l7EGAf+Xp+sQP5XwDjF
	uDQlK85vP0FJ2Aj+2tuMuAtK2uwAv7L9lUjUeu/gD3MLcah10d5z5SK+RPV/hKkJCtDU678yvsT
	TAWpUl8xLn9qXhtHxaijwnDWQnkz/aISKNE25BIhbYSVXBW92Pze/hjWLL/he1X8MgcujSyiALK
	CHJ1uZM/Bl7Ad0FwpUO9V2rcBW4mAXNvUndVzguyoP7cMCTrfSDek9Clhvt1toqer/ijUgVhHHp
	iWqQX09kEOjaFM5ZpAiVpvI3WxbJdfYAPGyezKnhSmMOku8PSwy5CTvjAfb+h4G9LpqR9YFWrpi
	QPfiFkryrDvfxBl90V08bYkmABoaYntxWnfSD
X-Received: by 2002:a05:6871:14f:b0:409:5560:72f8 with SMTP id 586e51a60fabf-423e0a83ffbmr1348009fac.0.1775817374335;
        Fri, 10 Apr 2026 03:36:14 -0700 (PDT)
X-Received: by 2002:a05:622a:998:b0:50d:830a:4213 with SMTP id d75a77b69052e-50dd5b2ef3dmr40856531cf.6.1775817017244;
        Fri, 10 Apr 2026 03:30:17 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm6485997f8f.33.2026.04.10.03.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:30:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] pinctrl: tegra: Enable easier compile testing
Date: Fri, 10 Apr 2026 12:30:06 +0200
Message-ID: <20260410103005.163128-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=w6re5Io0CJ7B07Xe/0cTaVsJ5qgW8GorXQNdVxXngbI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2NEtH9Vy05UJltYixEn2oehTQXIphYaeGfA+r
 +5Ipt0Nzw6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadjRLQAKCRDBN2bmhouD
 1yiZD/43no+PrepP6PmvDUOietGLjwkW8PONa9GLnMLyQChbfFhWAhHtpSDg2nKddb6cM2b3qgg
 Qy+6pf+T8rjNSNASw2vGq4wORGeInI6GI4Kwc7TPq8ZRAFuqg+XDIT1xPrh8hWIQPUTCV4Y/Ib6
 RcUOnW9X7lY1HpC8eMNODyMHvdFE46jHmkYaOlg8NcOQinJos386mSAg2f5btCm+t1s9mzwaD7S
 oyZi4RV7BgGkhLypO1gv4Q5Erbn06aPlD5k3+5gxPmSRRlw9sSvkzWqb4WBelKqpefNRkjagz27
 MP47mFG/mhaYkoS+1bWJ1wU61AR/Pbfst0dWSXFncSQVcpEarYPRWl623m0JVQrnBQUx4SCZRis
 3g0DolT9ahcUikElLFFhssLETfW3410A80IyVtnHnQDZkaFxVuOHVN8vPHaDvf6goeJfYy6hoxJ
 9o6SMUuyrp1RhH2GDF/Fq48T+Aaka38cNnaw9dybUFaqnJNpDR/7QG4VVYotuhexqK9JRtdkdea
 mErzgzypJnCMUI4UH9i4Vpdi1LtqlvypsCZizd71H1OL1iVl4KMB8eONj8SNqw8/Di1s9zs8L2G
 ar1xWgU0n/IW0Quido9mHmVK7Xz1JiW0dcWcKJejZpa1VksujjAsZkco0GVhHcdJXTpYUNGCSr1 ZKnfKn/KOf4/opw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 29_GSztwnzDjFQVqj2Nrk6smpX42J1fY
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=69d8d29f cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=0Y4yGymzkYLnMTyDTW8A:9 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: 29_GSztwnzDjFQVqj2Nrk6smpX42J1fY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA5OCBTYWx0ZWRfXzAPK69eqJxTe
 wEVVtQcxoTFIEOPrZ+0ZMPvEhsaIOQeP0fs1yofOKiv15OZu8hTGbyLNQF0yRgbnaYpF6o4KgY0
 SswphBPAu//XtzJJmv05aKET6MzGGHTcscumW/wov1W8AP3qv6HndqizvBV0Kj+mN70i/DSlCL7
 exzzpgORVekyEPArmvwPBRWQ7j2JWkZYqYnBTV3wI3bIVtV9BVn3Q4R0XlPBEX5s7MpIf/lONt3
 /pXgndU3WeOlEFK/E+Bzi2cAHUw+L0gbHZNpZu8nLHOIvTdE/Ow02GCXDUhRFpS0Jbe1A+zh1RG
 VF9/YOpDyg2xjC6ZWon/aPJlO1mlFuyJFHUNjggrgr2X1YjZ9meNCkTGNfA0QTQmu9CT7LSU+hO
 AsFINYixwSjctRB7cmBoDswON4YxDlED92KxQGZDBKxuk+Ylq9bmX9OPXZ1KDHWYKZb+A2Ysdbb
 TQRZApJl3RDjis9v11g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100098
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34996-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C3943D5C58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently NVIDIA Tegra pin controller drivers cannot be compile tested,
unless ARCH_TEGRA is selected.  That partially defeats the purpose of
compile testing, since ARCH_TEGRA is pulled when building platform
kernels.  Solve it and allow compile testing independently of ARCH_TEGRA
choice which requires few less usual changes:

1. Descent in Makefile in to drivers/pinctrl/tegra/ unconditionally,
   because there is no menu option.

2. Depend on COMMON_CLK for PINCTRL_TEGRA20, because it uses
   clk_register_mux().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Not extensively compile tested yet. Pushing so LKP will pick it up. My
build tests are still in progress.
---
 drivers/pinctrl/Makefile      |  2 +-
 drivers/pinctrl/tegra/Kconfig | 22 ++++++++++++----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f7d5d5f76d0c..9d33fa28a096 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -93,7 +93,7 @@ obj-y				+= starfive/
 obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
 obj-y				+= sunplus/
 obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
-obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
+obj-y				+= tegra/
 obj-y				+= ti/
 obj-$(CONFIG_PINCTRL_UNIPHIER)	+= uniphier/
 obj-$(CONFIG_PINCTRL_VISCONTI)	+= visconti/
diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
index 660d101ea367..3e8789871f0f 100644
--- a/drivers/pinctrl/tegra/Kconfig
+++ b/drivers/pinctrl/tegra/Kconfig
@@ -1,43 +1,45 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config PINCTRL_TEGRA
-	bool
+	bool "NVIDIA Tegra pin controllers common" if COMPILE_TEST && !ARCH_TEGRA
 	select PINMUX
 	select PINCONF
 
 config PINCTRL_TEGRA20
-	bool
+	bool "NVIDIA Tegra20 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
+	depends on COMMON_CLK
 
 config PINCTRL_TEGRA30
-	bool
+	bool "NVIDIA Tegra30 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA114
-	bool
+	bool "NVIDIA Tegra114 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA124
-	bool
+	bool "NVIDIA Tegra124 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA210
-	bool
+	bool "NVIDIA Tegra210 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA186
-	bool
+	bool "NVIDIA Tegra186 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA194
-	bool
+	bool "NVIDIA Tegra194 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA234
-	bool
+	bool "NVIDIA Tegra234 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA_XUSB
-	def_bool y if ARCH_TEGRA
+	bool "NVIDIA Tegra XUSB pin controller" if COMPILE_TEST && !ARCH_TEGRA
+	default y if ARCH_TEGRA
 	select GENERIC_PHY
 	select PINCONF
 	select PINMUX
-- 
2.51.0


