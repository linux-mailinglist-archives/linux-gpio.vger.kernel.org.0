Return-Path: <linux-gpio+bounces-14252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 636379FD116
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 08:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34C84163CA2
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 07:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C34314A4DF;
	Fri, 27 Dec 2024 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Mloxg8QV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCF01DA4E;
	Fri, 27 Dec 2024 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735284322; cv=none; b=u5FM6XkZ3YKh0jx5OmeNiuBdtk8eYl673MdOnPcuZhHwag8Aeygeb1WsKvIYk6SjJCf1888Ip+0bJUuH9g0hozqJCJa8bBDf89ONN//Kwij0Grti1tIdK9bXSLDpJbSJIYDlwwfs34RBD1cP6e8gK/uk62AkBFsCFDPJA+g+C6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735284322; c=relaxed/simple;
	bh=tftfKO0i2BdRBhzDdFuKGH3fxQ+aMDfDYJdawdr/+ZQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G4OvqdJA7cGRjdnEKX0Sxzht/HQ8HhrAe+foGUR3HjJjd8a+dJTsv2UNS5/+3JH8O6YasXfhAC12RmUDhpHCGKn7tdATwKccuQFbW+/exdsZMP9nJZmtO4+dPwOR0kUE3Rikkl6dTPoQFEfaCJ5mWLd0GRg2i9FG0ziqEZr5pcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Mloxg8QV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR6fvua010426;
	Fri, 27 Dec 2024 07:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2nPGXGtt4i5cRb7ee+Qgp6DoWjjCxrKdejS/8m6yfk0=; b=Mloxg8QVrS3DEZWa
	conJC1979EMysYZFgrMHRRe3376vZTvDhbyiRzjJZvsiU68oG84UizbxJbG0dHss
	c0fQx1EEHseZMzLj7DGwjYAQFBwJt/FEFEqNxpaRDS+AJgMJAYrKFbgKyBgLE4GA
	WrPYwOtasg6oFR/ZdCzoRFoP7MLlbl7VCrSOlMJs7wdQJAEuhbr0gDoFJ7Wx0Ltd
	A21BrneREmvaWLuW+i7r4EsDG/a4OcmPTtlY7DBuScxr8Gs83J8fmssB6i3ZF2lH
	yRorZ6NE/MbPYmaoHyB/RFmNnr9WGuWE7yvktmCSI5N/KJOOmXJq90F8bfJAne+Z
	Wp33IQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43sq6q05x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:25:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BR7PFpe027919
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:25:15 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 23:25:10 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH v3 2/6] dt-bindings: clock: qcom: gcc-ipq5424: add spi4 clocks
Date: Fri, 27 Dec 2024 12:54:42 +0530
Message-ID: <20241227072446.2545148-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
References: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a2q9sCaiaFNIXFeOP67svzLOs8atuciy
X-Proofpoint-GUID: a2q9sCaiaFNIXFeOP67svzLOs8atuciy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0
 mlxlogscore=693 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412270062

SPI protocol runs on serial engine 4. Hence we need to
rename the spi0 clocks to spi4 clocks.

However, renaming spi0 to spi4 will result in the following
compilation error's.
drivers/clk/qcom/gcc-ipq5424.c:2865:3: error: ‘GCC_QUPV3_SPI0_CLK’
undeclared here
drivers/clk/qcom/gcc-ipq5424.c:2866:3: error: ‘GCC_QUPV3_SPI0_CLK_SRC’
undeclared here

To add spi4 clocks without compilation error's, do not
rename the spi0 clocks. Instead, duplicate the spi0 clock
macros and rename them to spi4.

After switching to spi4 clocks in the gcc-ipq5424 driver,
remove the spi0 clock macros.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 include/dt-bindings/clock/qcom,ipq5424-gcc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,ipq5424-gcc.h b/include/dt-bindings/clock/qcom,ipq5424-gcc.h
index 755ce7a71c7c..5dad45a8f614 100644
--- a/include/dt-bindings/clock/qcom,ipq5424-gcc.h
+++ b/include/dt-bindings/clock/qcom,ipq5424-gcc.h
@@ -123,6 +123,7 @@
 #define GCC_QUPV3_I2C0_CLK			113
 #define GCC_QUPV3_I2C1_CLK			114
 #define GCC_QUPV3_SPI0_CLK			115
+#define GCC_QUPV3_SPI4_CLK			GCC_QUPV3_SPI0_CLK
 #define GCC_QUPV3_SPI1_CLK			116
 #define GCC_QUPV3_UART0_CLK			117
 #define GCC_QUPV3_UART1_CLK			118
@@ -132,6 +133,7 @@
 #define GCC_QUPV3_I2C0_DIV_CLK_SRC              122
 #define GCC_QUPV3_I2C1_DIV_CLK_SRC              123
 #define GCC_QUPV3_SPI0_CLK_SRC			124
+#define GCC_QUPV3_SPI4_CLK_SRC			GCC_QUPV3_SPI0_CLK_SRC
 #define GCC_QUPV3_SPI1_CLK_SRC			125
 #define GCC_QUPV3_UART0_CLK_SRC			126
 #define GCC_QUPV3_UART1_CLK_SRC			127
-- 
2.34.1


