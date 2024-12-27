Return-Path: <linux-gpio+bounces-14256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 138589FD12C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 08:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F3153A075E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 07:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7713C1448DC;
	Fri, 27 Dec 2024 07:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PzqvxVlk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBFC149C6A;
	Fri, 27 Dec 2024 07:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735284342; cv=none; b=cQ3aFlp565ud2EpjQ569BM1113pbl9uGus15iHp94nDYMevksJV/4Ik/hFDE9vnj0N6OIl9oBq7JP+ghFUpoyB9TVFwMeVjX3/bts2XU25Ugi6tr3VffK1vk9TsmoZLHZozVBv/DgovolYqR4IFxxVJnXmHFBn4bD7gF7XFIS+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735284342; c=relaxed/simple;
	bh=oKy+vdlNueNKDvyQuUaonp3rPjGBkVFZb2zhCOjeZps=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k11P4stLqU3aqMfWmQbl7zLzPuagvxLu9rXn7r4NH389YCFgXg/eaP0HbhqRnXJOjoAhdfbgNBllZiKMgvZHu1JRTyScGVkkfdOrSdWD/vb80DeT5+wEmo+CDeSDAJRBmnQhO4XUhOWBElHnTMct82/fZ0K+It3sba5HzWpQQXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PzqvxVlk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQDqtHG030839;
	Fri, 27 Dec 2024 07:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oPCk/W9v6Y7yPcxR1lGK9WTC7WRtf/ZqtQ8qKXF5rac=; b=PzqvxVlk1vMpy4R0
	d6XjLYm+s4gyAZfqjAK6RkZHyt7R1BVSdP+aqZ6mMLSyfKXqmFUUDwt+uEwQhDaQ
	mxCUab2UhbPXLYIGWGpf6+lTENyuRSwKfd/VWogZCe6yt/EsRFNAgWic/kYLUpRb
	HQitAV4PWYXvk65dbDRlEcxRMICVJt3qSkDN1VdAuqSOhUgLo/nO94FvpeuwavZu
	OMwllATTTQ3kyfotyE3YKCwDFp+U/1SLWaOydFDZBe2xdhDo4U8n6n15bqJELX8a
	6k0bkjA7gJsKlrsbnNga+ZoadWA/mzGggvZvo3Ls0rcCTLANpR8gLkbU7dUrG4PO
	UfbfeQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43s8dnkh6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:25:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BR7PanX026941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 07:25:36 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 23:25:31 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH v3 6/6] arm64: dts: qcom: ipq5424: configure spi4 node for rdp466
Date: Fri, 27 Dec 2024 12:54:46 +0530
Message-ID: <20241227072446.2545148-7-quic_mmanikan@quicinc.com>
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
X-Proofpoint-GUID: GdsVZfKM7bxqkiTTIZNPxdGAaVILOvgV
X-Proofpoint-ORIG-GUID: GdsVZfKM7bxqkiTTIZNPxdGAaVILOvgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 mlxlogscore=945 mlxscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412270062

Enable the SPI4 node and configure the associated gpio pins.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V3:
	- Replace spi0 with spi4 in all applicable places such as
	  tlmm pin names, commit message, heading and dt node name.

 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 43 +++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index d4d31026a026..1e7c7f73b21e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -23,6 +23,36 @@ &sleep_clk {
 };
 
 &tlmm {
+	spi4_default_state: spi4-default-state {
+		clk-pins {
+			pins = "gpio6";
+			function = "spi4_clk";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		cs-pins {
+			pins = "gpio7";
+			function = "spi4_cs";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		miso-pins {
+			pins = "gpio8";
+			function = "spi4_miso";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		mosi-pins {
+			pins = "gpio9";
+			function = "spi4_mosi";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+	};
+
 	sdc_default_state: sdc-default-state {
 		clk-pins {
 			pins = "gpio5";
@@ -57,3 +87,16 @@ &xo_board {
 	clock-frequency = <24000000>;
 };
 
+&spi4 {
+	pinctrl-0 = <&spi4_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "micron,n25q128a11", "jedec,spi-nor";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <50000000>;
+	};
+};
-- 
2.34.1


