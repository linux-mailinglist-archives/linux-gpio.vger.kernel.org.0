Return-Path: <linux-gpio+bounces-13198-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A29879D5F10
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 13:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F3D11F237B2
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 12:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974421DF969;
	Fri, 22 Nov 2024 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o47lvyrb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7A91E52D;
	Fri, 22 Nov 2024 12:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279546; cv=none; b=DMu551kWUuJNEaZIe8B2LNWH+cDK4sE5dQKLnVSZ2pPYqbsWCPjw9WZUBN4bI8MZ9jZRlWXJQ9AKODCx6PCE6dvFmDNS/Iwt3I6T9YP4F0fQlMPkIoEj5Q2sSBkQeqQPirQ4kL0lT15r8Yi2UUxBPJ0puQo8AxP4654tkY+sXsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279546; c=relaxed/simple;
	bh=Bm4WRksVmD7sFXxYAq19D3ZgtZ11SpKaEs2hcjauaeE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fdiL12mthyvJP+pylKLQrfVCJQ1bweZK0PudHCtI4RzHk9UJFd/5I1guho/IUhtsVPgf9erU/AOshS0Z+W8Te/HPFMGiob+LcsTTtSxWZq3GkZxWo+sI10r6mgjae5gjhGP6+LQtNeQ6K6Wl+BuVuPSvMDoDsxOEe0CgBgLUbhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o47lvyrb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM7FNGn020915;
	Fri, 22 Nov 2024 12:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	42j83bS2JYE8Us/GYuAe6PoNrQZYsucJiuGsc4BcDmc=; b=o47lvyrbPJA1LkUp
	nBGVG6w98t5BmJt0At9E2+cZ3533tueryNDjrNyoHfN3NKJIiG6WpKXp18WteUZL
	yHEtADgSreyuTzNvXx5dlyndqUSebwzoONl7lGVEFj2xs12ATOuqq1rgez8ddSkI
	irI+1+Mw96lpKvMcJHhRvVQvsYqKxGqtf3x36khaDHy766WAcfmpTBsNZ0FpG0oI
	oIkZM9y3bfMBKzuVF1Wv6iKwoQ4Vh5sX6ztSWCNpPHtFt3ZPXu4GJE+J3RyGUn5x
	x8N06kLQVZD8zkkhprM/5xKjzXBHYzg1Ztzkx/tBcOuwetIYktLz5XGTAveVkHq4
	60Ov4Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320wk47qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 12:45:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMCjeWZ005097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 12:45:40 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 04:45:36 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 4/4] arm64: dts: qcom: ipq5424: configure spi0 node for rdp466
Date: Fri, 22 Nov 2024 18:15:05 +0530
Message-ID: <20241122124505.1688436-5-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Z8MRihk9J0XKbZAElDvwjQRjoQcBkncU
X-Proofpoint-GUID: Z8MRihk9J0XKbZAElDvwjQRjoQcBkncU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=830
 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220108

Enable the SPI0 node and configure the associated gpio pins.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 45 +++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index d4d31026a026..6256216ca764 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -23,6 +23,36 @@ &sleep_clk {
 };
 
 &tlmm {
+	spi0_default_state: spi0-default-state {
+		clk-pins {
+			pins = "gpio6";
+			function = "spi0_clk";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		cs-pins {
+			pins = "gpio7";
+			function = "spi0_cs";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		miso-pins {
+			pins = "gpio8";
+			function = "spi0_miso";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		mosi-pins {
+			pins = "gpio9";
+			function = "spi0_mosi";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+	};
+
 	sdc_default_state: sdc-default-state {
 		clk-pins {
 			pins = "gpio5";
@@ -57,3 +87,18 @@ &xo_board {
 	clock-frequency = <24000000>;
 };
 
+&qupv3 {
+	spi0: spi@1a90000 {
+		pinctrl-0 = <&spi0_default_state>;
+		pinctrl-names = "default";
+		status = "okay";
+
+		flash@0 {
+			compatible = "micron,n25q128a11", "jedec,spi-nor";
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			spi-max-frequency = <50000000>;
+		};
+	};
+};
-- 
2.34.1


