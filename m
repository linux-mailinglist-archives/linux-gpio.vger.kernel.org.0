Return-Path: <linux-gpio+bounces-17411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9060A5BCC3
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 10:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BDB13A75AF
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 09:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF7722D4D1;
	Tue, 11 Mar 2025 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cwzx5Hgb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF8022B5AB;
	Tue, 11 Mar 2025 09:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686724; cv=none; b=m0T4wXRhQhmF1EwfEoTS52wclWh4rpHf7Y92agGAYl0QYjLOTsDeGplS/iEPrHwijxqfDNaHYSnElqOucQRye1hcxnM0oyNjRzHWfhtxx8E4qiEizwuU6cZmFb79/3MSKEoCvTIFPq7QomSRDYXkR4fT8vOO83ngaf3idFJhPw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686724; c=relaxed/simple;
	bh=Pcre2SGq59+9b917Xz4fnsDLfIMcRjXdt3MWPcJLFk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dGInIyCSXc83l7CrolfMmF5eZbWLHPJQlycQ9dmOZlDa/Emph6ypRVEW53czCPW+Ndq8PVG8jz8gUDMdq6mKS7r2ixJDZ+Nxy8/uzoJL7cvJdelSu2vbXq76E/BiUouYnpBganHmllugNq1UhrEix9HtGaOpdPreJPizVltEq+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cwzx5Hgb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7jS3N022356;
	Tue, 11 Mar 2025 09:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WYyrqBzsKDbhcRh+8hUWT0zTAXYiX0agiFG
	KGJwEqBg=; b=Cwzx5HgbuedHwOt4BOafY5IwBQGlOTnbaG/wiwEWQXW+0w0PyEb
	u/nisvTAbZu3Z+co4djp76qKOEfyBfI4vrn7NeMQt8JfHBRr68eQEpxCalPl6muK
	8ZLXhFaGVc5/aHoowm67WZayMGir+NAczhJdjepx8FI/BTc8bga/Yjxd2JAbNedQ
	1kpSfPoNBvEG8jhCurJgDEJAFnuUbGoEyArxYFF1VnTwM/fZsTpIr5O4auLcOLOq
	6tf4YiCT7vmFjqYdnkTHA21KR/zVitrp4n02/6nbqFrRSpfD5iZOVmPEShT4PUEz
	ZH7DQBC3+U85KzRuw7/R6GaYasLaAaR+FrA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyug107-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 09:51:57 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52B9mssd010608;
	Tue, 11 Mar 2025 09:51:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 458yn3657g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 09:51:54 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52B9psPU012991;
	Tue, 11 Mar 2025 09:51:54 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 52B9pr6d012990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 09:51:54 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id EFA3B5A9; Tue, 11 Mar 2025 15:21:52 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH] pinctrl: qcom: sa8775p: Enable egpio function
Date: Tue, 11 Mar 2025 15:21:51 +0530
Message-ID: <20250311095151.1581239-1-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.48.1
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
X-Authority-Analysis: v=2.4 cv=cbIormDM c=1 sm=1 tr=0 ts=67d007bd cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=O5wfUiJPRMtOadb7F1oA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uhAz35iwqO1nHW4H3JbRvAXirCbvyBRB
X-Proofpoint-GUID: uhAz35iwqO1nHW4H3JbRvAXirCbvyBRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1011 spamscore=0 mlxlogscore=988
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110066

Egpio feature allows Island Domain IOs to be reused as TLMM GPIOs.
sa8775p supports egpio feature for GPIOs ranging from 126 to 148.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 drivers/pinctrl/qcom/pinctrl-sa8775p.c | 56 +++++++++++++++-----------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 8fdea25d8d67..e4a720eeee3b 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
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

base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
--
2.48.1


