Return-Path: <linux-gpio+bounces-13950-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B109F472D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 10:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07C137A6267
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 09:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522C51F5412;
	Tue, 17 Dec 2024 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mqm86y2C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9911D1DFE2B;
	Tue, 17 Dec 2024 09:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734426838; cv=none; b=nt7JgIL5VxhMfWPwSkWH6ZNaAsR9Qm+weHO6WqRWMx0Ms2JWU8Lfw3NLR81hULpZqUW1nWKsCd2IJrFHIEcyCH+z3RD6A7Q0DSPcx2wkoJuPZGlBoW32NMNujL5JMA5/cgUOfx4oPKIBqLW4XrGRiGcFGqh8oWXAo8P2Jo6ACo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734426838; c=relaxed/simple;
	bh=dc8NV3zMZwT65UhfUEUk7Bp+37+Tr2R/ieMxtog495U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UYA/19SZu/DwFu/YIJGIWhnrJoFEnZPmDLu00AyTGmjVPtYgAgr7OzwcZ29z1xuJfgj63AO4Kn0zMlU3VHmlGG310dFNfspxE2cPXCOXtR00TrN0OeEB1UVO6Dpebg0+DihkU6M0vQR8MUaitji2OFRoecSHBjo/EO5WNBZKPV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mqm86y2C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH96rDf010375;
	Tue, 17 Dec 2024 09:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UBspPo4+OEgF6bOPfE996n02ohhPrHTDFnu9WeUaiek=; b=mqm86y2C+9km3Mgy
	vGMnNyDAOjirV1QlVM5bMPtspz7bBIMq+S454BzQdrxth4+zbSmdPX8lcLAu36iQ
	qSNKyEal/9uHiAci8YsuPfww3+9S/HW4Bn/RZj303l0ypotH3GSpsbN/gYT5ou8M
	XNV0NAuWpF3YQXMGFo27O87cuDbx5qSytDZDZ+OcmDGXQ1NpcfBpezPyGS6r6d/D
	NpS8ub/pOavTdgeEXcDerHr6puaFLtJnr9cUMJpacVnVaJ7fRFlTpPmlHGR6eKYk
	sNE47dInwqBfHxndnldpQa4SXKsF+63yeCdxIBYpQxOxs+s1u8u8lvspKRwbarMh
	czs0bg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k6cqg0hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:13:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH9Dq93013985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:13:52 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 01:13:48 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <quic_srichara@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>
Subject: [PATCH v2 2/4] pinctrl: qcom: ipq5424: split spi0 pin group
Date: Tue, 17 Dec 2024 14:43:06 +0530
Message-ID: <20241217091308.3253897-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217091308.3253897-1-quic_mmanikan@quicinc.com>
References: <20241217091308.3253897-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3I3fcyIY-wQBvD9LYGES1Ybew6rOp_aj
X-Proofpoint-GUID: 3I3fcyIY-wQBvD9LYGES1Ybew6rOp_aj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170075

The GPIO configuration differs for the spi0 clk, cs, miso, mosi pins.
Therefore, split the spi0 pin group and assign function to each pin
as per the specification.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V2:
	- No change

 drivers/pinctrl/qcom/pinctrl-ipq5424.c | 34 ++++++++++++++++++++------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5424.c b/drivers/pinctrl/qcom/pinctrl-ipq5424.c
index 796299cd2e4e..0d610b076da3 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5424.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5424.c
@@ -233,7 +233,10 @@ enum ipq5424_functions {
 	msm_mux_sdc_clk,
 	msm_mux_sdc_cmd,
 	msm_mux_sdc_data,
-	msm_mux_spi0,
+	msm_mux_spi0_clk,
+	msm_mux_spi0_cs,
+	msm_mux_spi0_miso,
+	msm_mux_spi0_mosi,
 	msm_mux_spi1,
 	msm_mux_spi10,
 	msm_mux_spi11,
@@ -297,8 +300,8 @@ static const char * const qspi_clk_groups[] = {
 	"gpio5",
 };
 
-static const char * const spi0_groups[] = {
-	"gpio6", "gpio7", "gpio8", "gpio9",
+static const char * const spi0_clk_groups[] = {
+	"gpio6",
 };
 
 static const char * const pwm1_groups[] = {
@@ -315,14 +318,26 @@ static const char * const qdss_tracedata_a_groups[] = {
 	"gpio38", "gpio39",
 };
 
+static const char * const spi0_cs_groups[] = {
+	"gpio7",
+};
+
 static const char * const cri_trng1_groups[] = {
 	"gpio7",
 };
 
+static const char * const spi0_miso_groups[] = {
+	"gpio8",
+};
+
 static const char * const cri_trng2_groups[] = {
 	"gpio8",
 };
 
+static const char * const spi0_mosi_groups[] = {
+	"gpio9",
+};
+
 static const char * const cri_trng3_groups[] = {
 	"gpio9",
 };
@@ -680,7 +695,10 @@ static const struct pinfunction ipq5424_functions[] = {
 	MSM_PIN_FUNCTION(sdc_clk),
 	MSM_PIN_FUNCTION(sdc_cmd),
 	MSM_PIN_FUNCTION(sdc_data),
-	MSM_PIN_FUNCTION(spi0),
+	MSM_PIN_FUNCTION(spi0_clk),
+	MSM_PIN_FUNCTION(spi0_cs),
+	MSM_PIN_FUNCTION(spi0_miso),
+	MSM_PIN_FUNCTION(spi0_mosi),
 	MSM_PIN_FUNCTION(spi1),
 	MSM_PIN_FUNCTION(spi10),
 	MSM_PIN_FUNCTION(spi11),
@@ -700,10 +718,10 @@ static const struct msm_pingroup ipq5424_groups[] = {
 	PINGROUP(3, sdc_data, qspi_data, pwm2, _, _, _, _, _, _),
 	PINGROUP(4, sdc_cmd, qspi_cs, _, _, _, _, _, _, _),
 	PINGROUP(5, sdc_clk, qspi_clk, _, _, _, _, _, _, _),
-	PINGROUP(6, spi0, pwm1, _, cri_trng0, qdss_tracedata_a, _, _, _, _),
-	PINGROUP(7, spi0, pwm1, _, cri_trng1, qdss_tracedata_a, _, _, _, _),
-	PINGROUP(8, spi0, pwm1, wci_txd, wci_rxd, _, cri_trng2, qdss_tracedata_a, _, _),
-	PINGROUP(9, spi0, pwm1, _, cri_trng3, qdss_tracedata_a, _, _, _, _),
+	PINGROUP(6, spi0_clk, pwm1, _, cri_trng0, qdss_tracedata_a, _, _, _, _),
+	PINGROUP(7, spi0_cs, pwm1, _, cri_trng1, qdss_tracedata_a, _, _, _, _),
+	PINGROUP(8, spi0_miso, pwm1, wci_txd, wci_rxd, _, cri_trng2, qdss_tracedata_a, _, _),
+	PINGROUP(9, spi0_mosi, pwm1, _, cri_trng3, qdss_tracedata_a, _, _, _, _),
 	PINGROUP(10, uart0, pwm0, spi11, _, wci_txd, wci_rxd, _, qdss_tracedata_a, _),
 	PINGROUP(11, uart0, pwm0, spi1, _, wci_txd, wci_rxd, _, qdss_tracedata_a, _),
 	PINGROUP(12, uart0, pwm0, spi11, _, prng_rosc0, qdss_tracedata_a, _, _, _),
-- 
2.34.1


