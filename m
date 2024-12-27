Return-Path: <linux-gpio+bounces-14254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 813EF9FD11F
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 08:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CE691883015
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 07:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7227514F9EE;
	Fri, 27 Dec 2024 07:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oEi0G8hf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951AF14831D;
	Fri, 27 Dec 2024 07:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735284333; cv=none; b=b0kS972XPd4IMame+zKRQnOt5zgupbaJ6t3tmvQ/ON7wsebX9xI9LPhSNyzrW4rL0SnECuTfpk/ceVWyRcb77ikc4c8max0r03qzbVOG+XbCgZLmsp4Wfc8fZw+mnayPPuvMLwVneeml1vBI06qhBs917FTnPy+Gl4LX4QZorxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735284333; c=relaxed/simple;
	bh=sHD52yL2eBqz9UYzuxt2YbcGTwawJnFmRudC3e+35IY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jkPrCNRIrfYCC+GY6wX+Y2kF6xCMkCwAgVpgrsFfSPTgJrRbXFryMK+aCc4K2iSDYXqYra1M0g2OU+SYfX5gDSvDIYSl7MYkoGiJzql53XlZ7fAeIAN9d2Q/wqbdN6443gpJekEllqoALqcbmafZU1ULEj7tmKbZo1+LqikZcIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oEi0G8hf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR5RYlF029178;
	Fri, 27 Dec 2024 07:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	82IUhN7KgfzIIE5sgbZcnRLyPsqXgu9NS/QNY5CYpMk=; b=oEi0G8hfeqWBBhEo
	yyJ0a/6uhEcDOgxiVKX5tEOVR33c41zNen/K2934a04Y8mV8E8aVhYH9OarQE8p3
	1vfVq/37fkD2A5IJryQYDl/5RZHlYFmlfMNxai3AZEwju8HxXz6xIF0Oz77JXwZj
	0mFiAMz5LjUxLzcCdk9TZ3Mz0A2w0WAukVjyL8jI0PWuoRraw5zdB6B0AFarB3VA
	O372EBDUM7HXF2pQRCUAXsZySr7MueDPsyzizDcPidxydPX5L3SADYtNW/Rgq2Nj
	9/aQm0rOdoI6GZ36IUZ0wH0QOAE5atU5+9919LomVi8i8TKkOdBVA89VRI2t6SDm
	aFm8vQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43sp410ntf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:25:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BR7PQP5026469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:25:26 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 23:25:21 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH v3 4/6] clk: qcom: ipq5424: rename spi0 clocks
Date: Fri, 27 Dec 2024 12:54:44 +0530
Message-ID: <20241227072446.2545148-5-quic_mmanikan@quicinc.com>
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
X-Proofpoint-GUID: fNQyMOD_HX6bL1g8EX8QKyXG-L5oWRE4
X-Proofpoint-ORIG-GUID: fNQyMOD_HX6bL1g8EX8QKyXG-L5oWRE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 mlxlogscore=853
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412270062

SPI protocol runs on serial engine 4. Hence rename spi0
clocks to spi4 like GCC_QUPV3_SPI0_CLK to GCC_QUPV3_SPI4_CLK.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 drivers/clk/qcom/gcc-ipq5424.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 88a7d5b2e751..5fcf7d9ca390 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -531,7 +531,7 @@ static struct clk_rcg2 gcc_qupv3_i2c1_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_qupv3_spi0_clk_src[] = {
+static const struct freq_tbl ftbl_gcc_qupv3_spi4_clk_src[] = {
 	F(960000, P_XO, 10, 2, 5),
 	F(4800000, P_XO, 5, 0, 0),
 	F(9600000, P_XO, 2, 4, 5),
@@ -543,14 +543,14 @@ static const struct freq_tbl ftbl_gcc_qupv3_spi0_clk_src[] = {
 	{ }
 };
 
-static struct clk_rcg2 gcc_qupv3_spi0_clk_src = {
+static struct clk_rcg2 gcc_qupv3_spi4_clk_src = {
 	.cmd_rcgr = 0x4004,
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
-	.freq_tbl = ftbl_gcc_qupv3_spi0_clk_src,
+	.freq_tbl = ftbl_gcc_qupv3_spi4_clk_src,
 	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "gcc_qupv3_spi0_clk_src",
+		.name = "gcc_qupv3_spi4_clk_src",
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
@@ -562,7 +562,7 @@ static struct clk_rcg2 gcc_qupv3_spi1_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
-	.freq_tbl = ftbl_gcc_qupv3_spi0_clk_src,
+	.freq_tbl = ftbl_gcc_qupv3_spi4_clk_src,
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "gcc_qupv3_spi1_clk_src",
 		.parent_data = gcc_parent_data_0,
@@ -2072,16 +2072,16 @@ static struct clk_branch gcc_qupv3_i2c1_clk = {
 	},
 };
 
-static struct clk_branch gcc_qupv3_spi0_clk = {
+static struct clk_branch gcc_qupv3_spi4_clk = {
 	.halt_reg = 0x4020,
 	.halt_check = BRANCH_HALT,
 	.clkr = {
 		.enable_reg = 0x4020,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_qupv3_spi0_clk",
+			.name = "gcc_qupv3_spi4_clk",
 			.parent_hws = (const struct clk_hw*[]) {
-				&gcc_qupv3_spi0_clk_src.clkr.hw,
+				&gcc_qupv3_spi4_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2862,8 +2862,8 @@ static struct clk_regmap *gcc_ipq5424_clocks[] = {
 	[GCC_QUPV3_I2C1_CLK] = &gcc_qupv3_i2c1_clk.clkr,
 	[GCC_QUPV3_I2C1_CLK_SRC] = &gcc_qupv3_i2c1_clk_src.clkr,
 	[GCC_QUPV3_I2C1_DIV_CLK_SRC] = &gcc_qupv3_i2c1_div_clk_src.clkr,
-	[GCC_QUPV3_SPI0_CLK] = &gcc_qupv3_spi0_clk.clkr,
-	[GCC_QUPV3_SPI0_CLK_SRC] = &gcc_qupv3_spi0_clk_src.clkr,
+	[GCC_QUPV3_SPI4_CLK] = &gcc_qupv3_spi4_clk.clkr,
+	[GCC_QUPV3_SPI4_CLK_SRC] = &gcc_qupv3_spi4_clk_src.clkr,
 	[GCC_QUPV3_SPI1_CLK] = &gcc_qupv3_spi1_clk.clkr,
 	[GCC_QUPV3_SPI1_CLK_SRC] = &gcc_qupv3_spi1_clk_src.clkr,
 	[GCC_QUPV3_UART0_CLK] = &gcc_qupv3_uart0_clk.clkr,
-- 
2.34.1


