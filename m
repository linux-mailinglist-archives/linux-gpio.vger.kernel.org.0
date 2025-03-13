Return-Path: <linux-gpio+bounces-17562-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E347A6035A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 22:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53BEC42102E
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 21:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A081F4E39;
	Thu, 13 Mar 2025 21:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hy9mTsMI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6704C1F3B92
	for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 21:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741900904; cv=none; b=BqsdZH2nclWdQzpTEjsu+oXvzXI0BdF3pDgYJu3OuRrVzJjvsCjABN5f95HgQVU0alxcUy9B6FhZKQ8kFliWThLlP92DlZyeligr2vXsjBBy9/KE55mHy9EecxnhltFJuoQEdFM4UAmkLefwGuyeL1zPCQsqcyhvK75SBCD9m0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741900904; c=relaxed/simple;
	bh=bxwRGhp1n0pI0/lcXsC1uFENkA1yhmJSWsvPZhEto9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=esow/ItvEnOuf6Dny1fRlHHfgZ/LzNZwQHRg0MFYooBcERiq/0wKmFiUDXeWRt7913iPbtJMw5r/fnZev8ES1rwvgNBnsCY79hnfj2LKkEfvRjUhDFrJWD+LSajitg/Xt0MNTpATy9K7cyo/GGtyY90pFSuQOoWytMHNENn+iFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hy9mTsMI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DBmobo008735
	for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 21:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sc2tdTqGtA5fEOw5t3e1Qi
	cFcw5LIwEMfE0xdIoaMts=; b=Hy9mTsMI0ApadFr/gtOT8wGCpEQspH9O1Phqqk
	R6DlGp9a0t1vudbh2u9TlItieYDKOVY1YWuGm1dC6MItWi/CBIn6AogLvnjUlIl7
	5G0sZRtLVUKA6aSx1cjMN8oHVzOnAwShyHJQM7b7fChSKPXjxLpopukMDkbnx7Aj
	PB+DW2SuXtmGTD8MjstFbLOQQipOJbAxWIaWzz0+IlRApBGd4ajzk8xx/qObiWWT
	sLXp9o5ESfJ0okaswAtw4wNLtW2i6b367kAH9vwLW2q/k1/afUj6C/TnOTR2aRTm
	p+70npb03WJtt912BCAWb99L0BePBrMa/i216FczDmreOGwg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bpg8awxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 21:21:40 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-72b87bd96a9so500246a34.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 14:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741900899; x=1742505699;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sc2tdTqGtA5fEOw5t3e1QicFcw5LIwEMfE0xdIoaMts=;
        b=SR84xd7KHP+SNX3P66CjXJLeDYYrlCERO7RXZ/FPBjMZNvWjlVRBU8cZVmaVKYkgUG
         WVJIMbG40XCuc8Wnw4XxIeMIFnjvxqn4I++ACCgvP1D93cxEAut9MAqqF+a5EkvRqdbY
         ato3/Wf7uy0xr14uyfi9Z+r9c9c4CuBIkGXkuGbumSSFc08Nxt59x5iE4od6i+vpx2kP
         LrzigPNkEr0cG+smZ5hvJC0o7SVfU6AlgbwsbywtbIDMgNjiqTmhqadYuYwG0eZ57boY
         FcNNiCgtQH6e5Kob1FeNWZW5LIkMUgZVBkKYmL64cLrp/Aqy+aUi4e1z/CPo4WrtgXI4
         pzXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV06tepzU9IyvqD9cPYjyjvb3NBnOdZ1w8pYmRZjUZCEho8IHKQ9h34DJlHCRTXNtL/7UVOKxvqrZJC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi7FkBToOr7/W3DrqZS6FZfgvA2IvnHa/QMWHXNpTXMYAKBy30
	7bqG7UYozAVhi5ouaK3NXxuplGmTuMLjSe1ZO0S2JxAqdlczlvNXOYd5XJGitern0p4FAeExC8o
	miaBgPT4sSbpPNZgv9f3fh+wV6R6bLWXrn1cSJ9Tk3yF8n6k/j9LqjL2gXutj
X-Gm-Gg: ASbGncv1dLL1CFttBxKuxLrO0E5xCk2oiZ0a9C5ofBGyrxJEfETa+qQP/ZRC/LJiNOS
	MCNXiXIPtDQRNI2gyNep6Fd8DhZT9khSTLp76i9TOtzCqet2ihXLh1rjRwgqxW+ukRyL+QERM5u
	ANiCKJKWSrVCzyxh/WHMrP5fKla6N31+1VGiE/I2kPSROJQKLzDB2pBhYzVVIDTDLFZ+CkZHURC
	NNPbTfDzBK3PXcCN2RfGDRJOTDDCji3QRZdc+A4yeJJqM/5WTiSSC/NwsCk1GPQYXnzJZylGjpn
	wLNiVXfzEBwYTxnC0RClo0A0sdh60kezEfTvVjUCSyuKa8xjX3dggNzbc1CTrHs8piWj/j1QoQG
	VqUKwAgQoxFlQGBs=
X-Received: by 2002:a05:6830:4905:b0:72a:1625:ef11 with SMTP id 46e09a7af769-72b9b593d8cmr7658937a34.27.1741900899378;
        Thu, 13 Mar 2025 14:21:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSJfSSomTC3SCdbcrgeOpL44R+cUJ/sgfFjrWaSF6qXtM2EgPsMKfh4s/9jEulvEPGOITeDg==
X-Received: by 2002:a05:6830:4905:b0:72a:1625:ef11 with SMTP id 46e09a7af769-72b9b593d8cmr7658927a34.27.1741900899001;
        Thu, 13 Mar 2025 14:21:39 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c670f86a17sm478881fac.6.2025.03.13.14.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 14:21:38 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 14:27:27 -0700
Subject: [PATCH] pinctrl: qcom: tlmm-test: Validate irq_enable delivers
 edge irqs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-tlmm-test-disabled-irq-delivered-v1-1-f0be903732ac@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL5N02cC/x3NQQ6CMBBG4auQWTtJCxKUqxgXrf2VSQroTENMC
 He3cflt3tvJoAKjsdlJsYnJulT4U0OPKSwvsKRqal3bu853XPI8c4EVTmIhZiQW/XBClg1aFdz
 QX6L353gF1cxb8ZTvf3G7H8cPwud4nnIAAAA=
X-Change-ID: 20250313-tlmm-test-disabled-irq-delivered-a0758b114b9e
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2379;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=bxwRGhp1n0pI0/lcXsC1uFENkA1yhmJSWsvPZhEto9M=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn003G2C9slR48Upk3nATcOyK7ugL3Dasv72Zrc
 Ggcd/i3JqKJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ9NNxhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVLTA/8CBpkKNPjbvMqFrVl/S2Oogv2nA49C9YOM9prNGh
 dhu9KoK73LDA7Oxn7nAGNigeEgvbpYq0wkT4c4ZYn+kF0zDiw+NwzNL7vXJOGk9YfFNdz+Z1ceo
 Klicq4sQM+yo2tOrThul7pxbNOITiRg9dUeA6vJDZr44nf3+Ej82x1EFSKGDJLEgfOGbeE0gL9L
 ClZhez2hmFXWrUWOPQzt0+vKOF3+B2yhgYswaeOogtT7b8LoWPff8mRrpWvaUH0Nw2tgwUCI+Cd
 4che8RE60va7HiY41JWhn2uUzkICEqqNyHvhLWmPcp1ba3Ur0u6XDLdL1OTW2R1/IYL9QM3/qEI
 4nN8JlVdBwfJHYUVylQL+3Jclx1F1ECBKKTX6Ur361ojmLJQkQUWzglrLHS7QJz62Lv+H94T486
 8ymFVLKrIJaM6ttQ054D96IL+S219QoIZ4D2+t91yPQj/PHe8bRl2wpceOggjpiOmzTxu31/7rd
 oMIZ+twN7dbC5JvcNXt9TKf+6Fo4ZSvFhyF0qq5m9+A1tGtvgMmIRwVNxYR8ZeyAY6Vs+a5duh2
 Zf5bnVC8XYYomIOKJUeLv818BH2Sf1Zif5fpz7V0VSGhCzbKuAEVCnMcsyltIPg7+9pueBV/wMP
 pezNPdwuPWymGDtyL00dbTTfrtVXiUMlYMjJclTxOSCY=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=PtWTbxM3 c=1 sm=1 tr=0 ts=67d34c64 cx=c_pps a=z9lCQkyTxNhZyzAvolXo/A==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=qPeax27BKI-lfaCsB2gA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: J16GhR7VFsPX1SImtHFlB0Msf7GbZXa-
X-Proofpoint-ORIG-GUID: J16GhR7VFsPX1SImtHFlB0Msf7GbZXa-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_10,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130164

In commit 'cf9d052aa600 ("pinctrl: qcom: Don't clear pending interrupts
when enabling")' Doug establishes an expectation that edge interrupts
occurring while an interrupt is disabled should be delivered once the
interrupt is enabled again.

Implement a test to validate that this is the case.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/tlmm-test.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
index 9c31798b3c08b59ba9a77454a297ac6630cf829f..fd02bf3a76cbccd290735f77f19dfb26730be679 100644
--- a/drivers/pinctrl/qcom/tlmm-test.c
+++ b/drivers/pinctrl/qcom/tlmm-test.c
@@ -506,6 +506,42 @@ static void tlmm_test_thread_falling_in_handler(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, atomic_read(&priv->thread_count), 10);
 }
 
+/*
+ * Validate that edge interrupts occurring while irq is disabled is delivered
+ * once the interrupt is reenabled.
+ */
+static void tlmm_test_rising_while_disabled(struct kunit *test)
+{
+	struct tlmm_test_priv *priv = test->priv;
+	unsigned int after_edge;
+	unsigned int before_edge;
+
+	priv->intr_op = TLMM_TEST_COUNT;
+	atomic_set(&priv->thread_op_remain, 10);
+
+	tlmm_output_low();
+
+	tlmm_test_request_hard_irq(test, IRQF_TRIGGER_RISING);
+	msleep(20);
+
+	disable_irq(tlmm_suite.irq);
+	before_edge = atomic_read(&priv->intr_count);
+
+	tlmm_output_high();
+	msleep(20);
+	after_edge = atomic_read(&priv->intr_count);
+
+	msleep(20);
+	enable_irq(tlmm_suite.irq);
+	msleep(20);
+
+	free_irq(tlmm_suite.irq, priv);
+
+	KUNIT_ASSERT_EQ(test, before_edge, 0);
+	KUNIT_ASSERT_EQ(test, after_edge, 0);
+	KUNIT_ASSERT_EQ(test, atomic_read(&priv->intr_count), 1);
+}
+
 static int tlmm_test_init(struct kunit *test)
 {
 	struct tlmm_test_priv *priv;
@@ -609,6 +645,7 @@ static struct kunit_case tlmm_test_cases[] = {
 	KUNIT_CASE(tlmm_test_thread_low),
 	KUNIT_CASE(tlmm_test_thread_rising_in_handler),
 	KUNIT_CASE(tlmm_test_thread_falling_in_handler),
+	KUNIT_CASE(tlmm_test_rising_while_disabled),
 	{}
 };
 

---
base-commit: 9fbcd7b32bf7c0a5bda0f22c25df29d00a872017
change-id: 20250313-tlmm-test-disabled-irq-delivered-a0758b114b9e

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


