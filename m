Return-Path: <linux-gpio+bounces-14255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE769FD125
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 08:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3F56163C3E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 07:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E37D153835;
	Fri, 27 Dec 2024 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lUg1gz0K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E7714B07E;
	Fri, 27 Dec 2024 07:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735284336; cv=none; b=SAImzjMRhH/65+ncYHNshdLaxQrvOPCeWnfC0i5Exw1diWTEsdY7FGBKwfCuMn6JkQYBXts25HEetUq+bFyxKMQa7BKXp8mr1DRsXoEfM553yxVTofVXXiXlin9+B7voK0oByRfpDSy6xPTX7wZFUTjs5IUjRF+4UsK8Kr96Qd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735284336; c=relaxed/simple;
	bh=2oGk/VMqj9VskBCKKdyaOSHU2Lteh603427duxcbjFI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M/U1KeBB8+3nlcf+fItqc4bgpcy6PiER4jyNKbLc6x8gyn2A6xZ8b/qcsMiJWsLJFIHqZLilzBijGR9BfSj7iBHAYOcaqPgNNZpaLtePzwZCW6pDzPK15La2cot0mhVjEfLfM+CoUc9jgnVWsxw9yp0ZjC+dthmZds0q7eK7Zzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lUg1gz0K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR6fZ0A009740;
	Fri, 27 Dec 2024 07:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wtbcd/LH7ZFNQL6r5Y9ijwlIMcR2zCXYi0L8t9Mgec4=; b=lUg1gz0K98E87aAX
	B0Zbzj3boAH9av46WYiBe2uX28yqQUCEnFLkV3c0N0+ReeZS9vIOr1OPIoyN1YW2
	30NVq75HcPnpIYhIwNNNxXk3HNs2dirUsFmTA4MShcUPZbuuVNSLIEMZCfpvt3eL
	elRh9UM7Zky5DG9luUlyVGyvv42G6xSt8BvyYFlGCX3KDrRwtvnclFdhHGJIQCZ3
	hoWXXDFbscy8Dbrz6qz+pBFFohWwUHxvgyLvJwIl8Sks32KsRJ9kO9hR+dibj2qU
	yBYmJ4TjEp6EtSR+FVZ/6BC8PfmO9fzUidSpgOqJHjOAyJ8AG4hkmyT5r8n9EG9Y
	6GWu3g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43sq6q05yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:25:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BR7PVMu015230
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:25:31 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 23:25:26 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH v3 5/6] arm64: dts: qcom: ipq5424: add spi4 node
Date: Fri, 27 Dec 2024 12:54:45 +0530
Message-ID: <20241227072446.2545148-6-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: okOdeY87nlJhqecJF40lcMIvW60yO1Wz
X-Proofpoint-GUID: okOdeY87nlJhqecJF40lcMIvW60yO1Wz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0
 mlxlogscore=925 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412270062

Add SPI4 node for IPQ5424 SoC.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V3:
	- Replace spi0 with spi4 in all applicable places such as
	  clocks, commit message, heading and dt node name.

 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5e219f900412..d425298d0471 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -201,6 +201,17 @@ uart1: serial@1a84000 {
 				clock-names = "se";
 				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
 			};
+
+			spi4: spi@1a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x01a90000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_SPI4_CLK>;
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


