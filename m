Return-Path: <linux-gpio+bounces-17475-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DD0A5D746
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 08:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B4C5189DC94
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 07:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7E41EB199;
	Wed, 12 Mar 2025 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f5IJ4gs8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEE51E9B07;
	Wed, 12 Mar 2025 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741764322; cv=none; b=agg1BQphMJTg9qJiJI+plFZym5OEmISYEDAiKyJf7BLwo61tIgA6L5cN3kV9MxNksVVIl+s2fg7fYS+Hq8ZHZI2Pjyo4YW6flcc12XvIuYPpxHS6gRLq6mjHF9NlLamjWipuZDePnsMUdRYdoZZhBojvU32IrztngeznzhyJsQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741764322; c=relaxed/simple;
	bh=2c0+JHwi+qY6or2xq9N1fNnvpdrvJrseUPM3R3/nFJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvCNdpkxqW3ELFjTJN8T7/8VfJUaJSE4bYg0m007QoO9hsh1T8cS8FJvrbw//9Oo4RoPfzmT9aTjEZE7+GR93m3dOPSOG7KMit467TgtG5H+6hlaLb1T6qQe032XCQjnuBXLR6kJInR4JuO2Ba5NBJGYsiX2OxhdXDrIYDrztgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f5IJ4gs8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMHBMk027307;
	Wed, 12 Mar 2025 07:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6EWfZDdHFy/
	7OqI1IzcsJqufQJ5B25RCLzOxbZxhIHM=; b=f5IJ4gs8e3CrZbUeQ7FKZpbDn2I
	YqK0MD0KL9H8wBSwr/DdNIURZmt5NCYB3EMzQXIbFiicr9Wss47+B+AMYnETbm/Q
	MjaSGqhznNHcmiHlA05APvbIDcUlacIu+e5ZL7iO5h0UEqB6a8NIuEyhVAvBAwZX
	HZ343+kfmMDKPx/3VQJf9AwaaZEYymT2fm52wmu9H5NGOYQxR4hqOfcqfqjWHNdy
	M1AdNqkcW7ewzYTybaYL8NqQIe1GRphD6COjsnLxH9aJQXO1X5sVBo+EkjIV9BX0
	Z3urc96nxbHaEdWr6QhuSgIqPxMTQu3j40j0I0x8KvD7xPdQtFXyO0mC5NA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2psfsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:25:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52C7PCkP032140;
	Wed, 12 Mar 2025 07:25:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 458yn3ehmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:25:12 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52C7KJRA026186;
	Wed, 12 Mar 2025 07:25:12 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 52C7PBF8032119
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:25:12 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 37D95B36; Wed, 12 Mar 2025 12:55:11 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v2 2/2] pinctrl: qcom: sa8775p: Enable egpio function
Date: Wed, 12 Mar 2025 12:55:09 +0530
Message-ID: <20250312072509.3247885-3-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312072509.3247885-1-quic_wasimn@quicinc.com>
References: <20250312072509.3247885-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P506hjAu c=1 sm=1 tr=0 ts=67d136dd cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=usWrcR5wvQOp3e3uLQkA:9 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: T5Ytnp1sdlyHYMbep0Qft8yxvCeC8SlU
X-Proofpoint-ORIG-GUID: T5Ytnp1sdlyHYMbep0Qft8yxvCeC8SlU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120049

Egpio feature allows IsLand Domain IOs to be reused as TLMM GPIOs.
sa8775p supports egpio feature for GPIOs ranging from 126 to 148.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 drivers/pinctrl/qcom/pinctrl-sa8775p.c | 58 +++++++++++++++-----------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 8fdea25d8d67..a5b38221aea8 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022,2025, Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2023, Linaro Limited
  */

@@ -467,6 +467,7 @@ enum sa8775p_functions {
 	msm_mux_edp2_lcd,
 	msm_mux_edp3_hot,
 	msm_mux_edp3_lcd,
+	msm_mux_egpio,
 	msm_mux_emac0_mcg0,
 	msm_mux_emac0_mcg1,
 	msm_mux_emac0_mcg2,
@@ -744,6 +745,13 @@ static const char * const edp3_lcd_groups[] = {
 	"gpio49",
 };

+static const char *const egpio_groups[] = {
+	"gpio126", "gpio127", "gpio128", "gpio129", "gpio130", "gpio131",
+	"gpio132", "gpio133", "gpio134", "gpio135", "gpio136", "gpio137",
+	"gpio138", "gpio139", "gpio140", "gpio141", "gpio142", "gpio143",
+	"gpio144", "gpio145", "gpio146", "gpio147", "gpio148",
+};
+
 static const char * const emac0_mcg0_groups[] = {
 	"gpio12",
 };
@@ -1209,6 +1217,7 @@ static const struct pinfunction sa8775p_functions[] = {
 	MSM_PIN_FUNCTION(edp2_lcd),
 	MSM_PIN_FUNCTION(edp3_hot),
 	MSM_PIN_FUNCTION(edp3_lcd),
+	MSM_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(emac0_mcg0),
 	MSM_PIN_FUNCTION(emac0_mcg1),
 	MSM_PIN_FUNCTION(emac0_mcg2),
@@ -1454,29 +1463,29 @@ static const struct msm_pingroup sa8775p_groups[] = {
 	[123] = PINGROUP(123, hs2_mi2s, phase_flag, _, _, _, _, _, _, _),
 	[124] = PINGROUP(124, hs2_mi2s, phase_flag, _, _, _, _, _, _, _),
 	[125] = PINGROUP(125, hs2_mi2s, phase_flag, _, _, _, _, _, _, _),
-	[126] = PINGROUP(126, _, _, _, _, _, _, _, _, _),
-	[127] = PINGROUP(127, _, _, _, _, _, _, _, _, _),
-	[128] = PINGROUP(128, _, _, _, _, _, _, _, _, _),
-	[129] = PINGROUP(129, _, _, _, _, _, _, _, _, _),
-	[130] = PINGROUP(130, _, _, _, _, _, _, _, _, _),
-	[131] = PINGROUP(131, _, _, _, _, _, _, _, _, _),
-	[132] = PINGROUP(132, _, _, _, _, _, _, _, _, _),
-	[133] = PINGROUP(133, _, _, _, _, _, _, _, _, _),
-	[134] = PINGROUP(134, _, _, _, _, _, _, _, _, _),
-	[135] = PINGROUP(135, _, _, _, _, _, _, _, _, _),
-	[136] = PINGROUP(136, _, _, _, _, _, _, _, _, _),
-	[137] = PINGROUP(137, _, _, _, _, _, _, _, _, _),
-	[138] = PINGROUP(138, _, _, _, _, _, _, _, _, _),
-	[139] = PINGROUP(139, _, _, _, _, _, _, _, _, _),
-	[140] = PINGROUP(140, _, _, _, _, _, _, _, _, _),
-	[141] = PINGROUP(141, _, _, _, _, _, _, _, _, _),
-	[142] = PINGROUP(142, _, _, _, _, _, _, _, _, _),
-	[143] = PINGROUP(143, _, _, _, _, _, _, _, _, _),
-	[144] = PINGROUP(144, dbg_out, _, _, _, _, _, _, _, _),
-	[145] = PINGROUP(145, _, _, _, _, _, _, _, _, _),
-	[146] = PINGROUP(146, _, _, _, _, _, _, _, _, _),
-	[147] = PINGROUP(147, _, _, _, _, _, _, _, _, _),
-	[148] = PINGROUP(148, _, _, _, _, _, _, _, _, _),
+	[126] = PINGROUP(126, _, _, _, _, _, _, _, _, egpio),
+	[127] = PINGROUP(127, _, _, _, _, _, _, _, _, egpio),
+	[128] = PINGROUP(128, _, _, _, _, _, _, _, _, egpio),
+	[129] = PINGROUP(129, _, _, _, _, _, _, _, _, egpio),
+	[130] = PINGROUP(130, _, _, _, _, _, _, _, _, egpio),
+	[131] = PINGROUP(131, _, _, _, _, _, _, _, _, egpio),
+	[132] = PINGROUP(132, _, _, _, _, _, _, _, _, egpio),
+	[133] = PINGROUP(133, _, _, _, _, _, _, _, _, egpio),
+	[134] = PINGROUP(134, _, _, _, _, _, _, _, _, egpio),
+	[135] = PINGROUP(135, _, _, _, _, _, _, _, _, egpio),
+	[136] = PINGROUP(136, _, _, _, _, _, _, _, _, egpio),
+	[137] = PINGROUP(137, _, _, _, _, _, _, _, _, egpio),
+	[138] = PINGROUP(138, _, _, _, _, _, _, _, _, egpio),
+	[139] = PINGROUP(139, _, _, _, _, _, _, _, _, egpio),
+	[140] = PINGROUP(140, _, _, _, _, _, _, _, _, egpio),
+	[141] = PINGROUP(141, _, _, _, _, _, _, _, _, egpio),
+	[142] = PINGROUP(142, _, _, _, _, _, _, _, _, egpio),
+	[143] = PINGROUP(143, _, _, _, _, _, _, _, _, egpio),
+	[144] = PINGROUP(144, dbg_out, _, _, _, _, _, _, _, egpio),
+	[145] = PINGROUP(145, _, _, _, _, _, _, _, _, egpio),
+	[146] = PINGROUP(146, _, _, _, _, _, _, _, _, egpio),
+	[147] = PINGROUP(147, _, _, _, _, _, _, _, _, egpio),
+	[148] = PINGROUP(148, _, _, _, _, _, _, _, _, egpio),
 	[149] = UFS_RESET(ufs_reset, 0x1a2000),
 	[150] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x199000, 15, 0),
 	[151] = SDC_QDSD_PINGROUP(sdc1_clk, 0x199000, 13, 6),
@@ -1511,6 +1520,7 @@ static const struct msm_pinctrl_soc_data sa8775p_pinctrl = {
 	.ngpios = 150,
 	.wakeirq_map = sa8775p_pdc_map,
 	.nwakeirq_map = ARRAY_SIZE(sa8775p_pdc_map),
+	.egpio_func = 9,
 };

 static int sa8775p_pinctrl_probe(struct platform_device *pdev)
--
2.48.1


