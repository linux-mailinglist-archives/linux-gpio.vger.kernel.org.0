Return-Path: <linux-gpio+bounces-14253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1AD9FD11D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 08:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 582633A06F7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 07:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DC5146D6E;
	Fri, 27 Dec 2024 07:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mtttOI2y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B02146593;
	Fri, 27 Dec 2024 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735284329; cv=none; b=VyCsxUfPokxc5nEwfuuAiCK+AIhD5uMkvarMJsr+OUjiUvHIXFA1VwUuU2HyVNOK4Qyz8AdS+LvA83E6+Fc0Iy7Kqbqp0feGk5QWfsupWo9s8l0hBNkJal18GXGu8cnBqxi4UnkKuvlXguxE1W+hRmo00uVHZjjp9jn2fJQemQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735284329; c=relaxed/simple;
	bh=CJy06DNviaWg4O588IxOHHQVjTPD/LjEZRfoNyONKyQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xe2dQ+d59rEE/sPWL5BezvsT6zUgZWq//MN8vFM6CKtW5dzhhA6wzVG0IeMjfDdy9Hva/4xeWM2bQIgIS2Z4bC4LPpNrEtFftaUeez1v98ujpy+GPfNTjFzlhDW9WRisNOjX8RP8pj9Uc4EkmejZnsb26Zm69CE9kRtzYJRzbho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mtttOI2y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQLeFCG015236;
	Fri, 27 Dec 2024 07:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+crJDo5sJg/Yo8dCCpO004q02gFjlSunUhGJb0tM6Qo=; b=mtttOI2yYDoLDeax
	ox9NqBSWmhBIvCy16ngmtVxwXcLNjsNMOrUuFb4csCVfIxC7v2FNmD1J2e/yjgsZ
	nOnrI9Nu293fYu55rYk1Zd3wAH5EHHJfe5u1ddLLYmC5drpGHT5PTXXW/oyTrJeo
	ixbAqh8EvQPTki+vQ/Y9JkCJwIKIojkzqCpZI18jGDQF0dnNmgvWMV3optRIzI8V
	KYxghez7V64HH7MNQ3sEcOtYfFYRplMUVntBF4uaCyZGRIYBtNzv3RsNi0Kyb1rN
	v5skjiHQDp9uQB4mXvTLaryeOcJ9o+JofzDQVx/IGcc/hGP5l6sjDarYL6udHh2J
	W9piuA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43sdpr3b1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:25:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BR7PLtS026462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:25:21 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 23:25:15 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH v3 3/6] pinctrl: qcom: ipq5424: rename spi0 pins
Date: Fri, 27 Dec 2024 12:54:43 +0530
Message-ID: <20241227072446.2545148-4-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
References: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8yPIeeUBv9TskZhHHeV6r04nfHdGWgvt
X-Proofpoint-ORIG-GUID: 8yPIeeUBv9TskZhHHeV6r04nfHdGWgvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412270062

SPI protocol runs on serial engine 4. Hence rename
spi0 pins to spi4 like spi0_cs to spi4_cs etc.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 drivers/pinctrl/qcom/pinctrl-ipq5424.c | 32 +++++++++++++-------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5424.c b/drivers/pinctrl/qcom/pinctrl-ipq5424.c
index 0d610b076da3..05c45a115d7a 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5424.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5424.c
@@ -233,10 +233,10 @@ enum ipq5424_functions {
 	msm_mux_sdc_clk,
 	msm_mux_sdc_cmd,
 	msm_mux_sdc_data,
-	msm_mux_spi0_clk,
-	msm_mux_spi0_cs,
-	msm_mux_spi0_miso,
-	msm_mux_spi0_mosi,
+	msm_mux_spi4_clk,
+	msm_mux_spi4_cs,
+	msm_mux_spi4_miso,
+	msm_mux_spi4_mosi,
 	msm_mux_spi1,
 	msm_mux_spi10,
 	msm_mux_spi11,
@@ -300,7 +300,7 @@ static const char * const qspi_clk_groups[] = {
 	"gpio5",
 };
 
-static const char * const spi0_clk_groups[] = {
+static const char * const spi4_clk_groups[] = {
 	"gpio6",
 };
 
@@ -318,7 +318,7 @@ static const char * const qdss_tracedata_a_groups[] = {
 	"gpio38", "gpio39",
 };
 
-static const char * const spi0_cs_groups[] = {
+static const char * const spi4_cs_groups[] = {
 	"gpio7",
 };
 
@@ -326,7 +326,7 @@ static const char * const cri_trng1_groups[] = {
 	"gpio7",
 };
 
-static const char * const spi0_miso_groups[] = {
+static const char * const spi4_miso_groups[] = {
 	"gpio8",
 };
 
@@ -334,7 +334,7 @@ static const char * const cri_trng2_groups[] = {
 	"gpio8",
 };
 
-static const char * const spi0_mosi_groups[] = {
+static const char * const spi4_mosi_groups[] = {
 	"gpio9",
 };
 
@@ -695,10 +695,10 @@ static const struct pinfunction ipq5424_functions[] = {
 	MSM_PIN_FUNCTION(sdc_clk),
 	MSM_PIN_FUNCTION(sdc_cmd),
 	MSM_PIN_FUNCTION(sdc_data),
-	MSM_PIN_FUNCTION(spi0_clk),
-	MSM_PIN_FUNCTION(spi0_cs),
-	MSM_PIN_FUNCTION(spi0_miso),
-	MSM_PIN_FUNCTION(spi0_mosi),
+	MSM_PIN_FUNCTION(spi4_clk),
+	MSM_PIN_FUNCTION(spi4_cs),
+	MSM_PIN_FUNCTION(spi4_miso),
+	MSM_PIN_FUNCTION(spi4_mosi),
 	MSM_PIN_FUNCTION(spi1),
 	MSM_PIN_FUNCTION(spi10),
 	MSM_PIN_FUNCTION(spi11),
@@ -718,10 +718,10 @@ static const struct msm_pingroup ipq5424_groups[] = {
 	PINGROUP(3, sdc_data, qspi_data, pwm2, _, _, _, _, _, _),
 	PINGROUP(4, sdc_cmd, qspi_cs, _, _, _, _, _, _, _),
 	PINGROUP(5, sdc_clk, qspi_clk, _, _, _, _, _, _, _),
-	PINGROUP(6, spi0_clk, pwm1, _, cri_trng0, qdss_tracedata_a, _, _, _, _),
-	PINGROUP(7, spi0_cs, pwm1, _, cri_trng1, qdss_tracedata_a, _, _, _, _),
-	PINGROUP(8, spi0_miso, pwm1, wci_txd, wci_rxd, _, cri_trng2, qdss_tracedata_a, _, _),
-	PINGROUP(9, spi0_mosi, pwm1, _, cri_trng3, qdss_tracedata_a, _, _, _, _),
+	PINGROUP(6, spi4_clk, pwm1, _, cri_trng0, qdss_tracedata_a, _, _, _, _),
+	PINGROUP(7, spi4_cs, pwm1, _, cri_trng1, qdss_tracedata_a, _, _, _, _),
+	PINGROUP(8, spi4_miso, pwm1, wci_txd, wci_rxd, _, cri_trng2, qdss_tracedata_a, _, _),
+	PINGROUP(9, spi4_mosi, pwm1, _, cri_trng3, qdss_tracedata_a, _, _, _, _),
 	PINGROUP(10, uart0, pwm0, spi11, _, wci_txd, wci_rxd, _, qdss_tracedata_a, _),
 	PINGROUP(11, uart0, pwm0, spi1, _, wci_txd, wci_rxd, _, qdss_tracedata_a, _),
 	PINGROUP(12, uart0, pwm0, spi11, _, prng_rosc0, qdss_tracedata_a, _, _, _),
-- 
2.34.1


