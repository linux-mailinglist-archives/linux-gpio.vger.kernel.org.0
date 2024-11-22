Return-Path: <linux-gpio+bounces-13196-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8A69D5F08
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 13:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29614282FD7
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 12:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069021DF27F;
	Fri, 22 Nov 2024 12:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lnj1+YB3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA4A2309BF;
	Fri, 22 Nov 2024 12:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279538; cv=none; b=Yy5+HHzlyBEX03rmQV3kszF8GG78tlaWVnAKMsEJUYnKCRvN+ejGZCtm48sSjYGQRRL/fmIokB3mhpGKdiNhkpSj1pHcOcYJ9Zpcaja88Rg2EJO+u1oY6X+vtJmq90Hcd0qo4mOsSzcmLdTGc2uE2CIQoRRLZpARLollXYoFYlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279538; c=relaxed/simple;
	bh=QRXK1UHs7kPRcS6GEpsMnwDVHHkWVe9EGIUSohKTtsY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I2+QdEpIAr2eAyiBa6GQPX6KXR8K2IahINuxHQNuTqJV1n5ExMaBmkjKl6nAQqkr1JAWycViBvqUrg004ImBWLgnqKp24fVGnbw6NIJB0yDNaT2Uy0R6UNzPULwSWlL3O12xhBQwo+5f+mXvAQHCOLQqwnrVnveDrSO4VMZIHI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lnj1+YB3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM7TxYS021065;
	Fri, 22 Nov 2024 12:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kzhKaGx0X0FCQPhTyfWnLWf5TZo74yokrEO1aCeBBVI=; b=lnj1+YB3OK/S6COP
	CYpWjvS68qUum29PpaK/QUi8rdsBJLISFp7f80cYjUMQzRKPpN6zv6JnEl0r8f6J
	sobA/Ezy0j3t/masSbcneWwKE0SDZXc/u/WApQci/taJOuJbsrjXIpm1UJnXyO6Z
	aYVSvN/CmyokqtDq7irOeKiELtKdg2qqiaeg9FPn+iRquit63B6tR0OhHQ1SvSGt
	A1aj4y/WUZE/9z46S12Ji9eDV9e66xKDF0l7nSHAAzrqrn/e2WYy3972IhU212i4
	qJpM2n0wmAuf0ee/+GlKV3ONiwOvQpJUf+A0plkYYODl81anuiHGpo9pKv4Fg5mI
	brFfXg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320wk47q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 12:45:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMCjWp8011558
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 12:45:32 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 04:45:28 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 2/4] pinctrl: qcom: ipq5424: split spi0 pin group
Date: Fri, 22 Nov 2024 18:15:03 +0530
Message-ID: <20241122124505.1688436-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122124505.1688436-1-quic_mmanikan@quicinc.com>
References: <20241122124505.1688436-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: HFrBMsEHaLovZAz-K3e4N2NNfRxkSN9R
X-Proofpoint-GUID: HFrBMsEHaLovZAz-K3e4N2NNfRxkSN9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220108

The GPIO configuration differs for the spi0 clk, cs, miso, mosi pins.
Therefore, split the spi0 pin group and assign function to each pin
as per the specification.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
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


