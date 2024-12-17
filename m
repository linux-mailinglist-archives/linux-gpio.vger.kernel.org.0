Return-Path: <linux-gpio+bounces-13951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1AA9F4737
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 10:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E70EA1891485
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 09:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F9A1F543A;
	Tue, 17 Dec 2024 09:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QyoJA7xi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88201F541C;
	Tue, 17 Dec 2024 09:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734426842; cv=none; b=HESEzixfjIBuKufLE2EdfYmbPlw7Cl90sFsodOVdzI64C+c2ykYFndo1tKQIUuIsXdruIxezpcZHQAt12TaV9CUhmpoPKQ16FuzijNQcmxs3QBCIbWs3EOTKhtx6GSjDmVDLgHtQxXdQ4a9ahsh62HxUoMCK/r/Yx3oBMX5ywfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734426842; c=relaxed/simple;
	bh=JCfCjjqFAfxBvX8HjTgWfXVqvUIVgQO95oi2ROvCTSM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iDO7dX6ypX+IhE+u5tdwlIumAGwpGawzEQjVdVROFVuOGAWfmoJszGla7jrX/OwvE24/ORklgi7YQbtwxEUTsguf4ac4B1EI0tGSJXOxjGMLXvWW7AmkOctpKD2AcRmXZbNJvk5Amo0zTnSmmnEiioxZvy8ZltDOQTZw2NnB1ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QyoJA7xi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH4m7wh014512;
	Tue, 17 Dec 2024 09:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uMB9NXE5110SFFU8zFCTomsYpOisRzk65Exv9F8f2U8=; b=QyoJA7xiHdgNbBNK
	Jpr75L3KSYuQayLWSDBCQcIGaRjvE3AOPJ6QQfikUW3dZ2MPIaQNFrnpEG43NwLb
	8n/kdGOO674LH5lZS6ZjD0zGw5ResF30lvrnmPccUAIAog8YosLXW4w1of/aQRvV
	4jtfTwnPUdmmhwJecUHRGPVWmw+LxabYOy/XSwoN+m53FHzNwDA8F8q++tMjEGEJ
	lvC9rpf4WWHrvAeKNZLa7wjOv9xCYX8iEGlGC3IndsepKVOwtMq8JvAedz8pH0gW
	8Opt7ueZgem6eZ5qMrVypDbGuyHWJdGDyq0rgfiPgPETsxvqkOI4KtUxC6mGc+Qi
	nQHFfg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k2k7gmvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:13:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH9DutY025761
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:13:56 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 01:13:52 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <quic_srichara@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>
Subject: [PATCH v2 3/4] arm64: dts: qcom: ipq5424: add spi0 node
Date: Tue, 17 Dec 2024 14:43:07 +0530
Message-ID: <20241217091308.3253897-4-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 7HeKltALhziGjZNCM2CrNw8QErR12zlA
X-Proofpoint-GUID: 7HeKltALhziGjZNCM2CrNw8QErR12zlA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=798 spamscore=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412170075

Add SPI0 node for IPQ5424 SoC.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V2:
	- No change

 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5e219f900412..b4d736cd8610 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -201,6 +201,17 @@ uart1: serial@1a84000 {
 				clock-names = "se";
 				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
 			};
+
+			spi0: spi@1a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x01a90000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_SPI0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		sdhc: mmc@7804000 {
-- 
2.34.1


