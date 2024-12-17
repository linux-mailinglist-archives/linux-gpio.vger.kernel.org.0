Return-Path: <linux-gpio+bounces-13952-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1111F9F4739
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 10:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 245B41891BBF
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 09:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0629C1F63DC;
	Tue, 17 Dec 2024 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FBOCHb3l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BDC1E0DF5;
	Tue, 17 Dec 2024 09:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734426847; cv=none; b=IsbLiYvNBwPpMHMZI7k/zlNfTdRUpiN/IbnBvGjX9GQCNTR3kpCTP8haLuJS8wOYDp4Ms5M9ZjXpkcy2m5CsruGdtkAs+lEoGzKexi87nxDPhYgduCQa9WLJVQdEj/P5NjpGrtQuU/qDb8ys550BTUvRay7zN8BtGCLxkuxzuLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734426847; c=relaxed/simple;
	bh=jCsb140CzGwGASf2IuIXWkPb+llJJV7lbXPjon9Hurc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NHOa/IKrFzMteuBLu2TwJzR/lW+CB/Rvsvlji2kazh/AJl2w+Ia2gqcMrUwANptZnshKYM5OZM+bv9MP7Wr6PKITB6tpGGmuOOFYhUFBKb3T36XxOn43TlwRBgwcL7QoPXBTURLPnI5Q2mP/c1E2b/i6KeIlxh0fBKjjNVw5Oj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FBOCHb3l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH622wh005852;
	Tue, 17 Dec 2024 09:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feiVVUdM79SH3Xh2pkJ2E95nIh4weyaC2PuWuefXv+8=; b=FBOCHb3lCSrt9FGW
	u/vsDRywPKBB9X06X5bYZIsCV3eAkc5jyk1EvKpLIM3m2fjZ8phLUGoLzbQFpxWy
	w2qubnrowuEi1ogJvKQTtABcR12M8oltiZpJjvOC78TKuvo2ZSkmESEwgAVm4rzm
	kxUKqK0O6bEjZrFDZKK62DLGv66PXTZkd67kRPuuUW+vkvJR3IIza3R2ZNvg8Xef
	y3PUNfPhNrwgI21BCqPSyTLPXu1GdngACgXJUQwBMc6EDzof3lqKyDIs0EO6TaPJ
	qgF1UYZ4UjnsqD/XU6kcgpCbK53+T9ZbRibzwG8XY/ch/Wgu4Bn9hchkgJODCXvJ
	cZrh/w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k3p48gc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:14:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH9E1YN022651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:14:01 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 01:13:56 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <quic_srichara@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: ipq5424: configure spi0 node for rdp466
Date: Tue, 17 Dec 2024 14:43:08 +0530
Message-ID: <20241217091308.3253897-5-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: JBejNos4vAnIDebTVf9Uh749J3N5zTYM
X-Proofpoint-GUID: JBejNos4vAnIDebTVf9Uh749J3N5zTYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=902 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170075

Enable the SPI0 node and configure the associated gpio pins.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V2:
	- Updated the hierarchy of spi0 node.
	- Removed the outer qupv3 node and
	  moved spi0 node to top level.

 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 43 +++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index d4d31026a026..60cfa8708eb4 100644
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
@@ -57,3 +87,16 @@ &xo_board {
 	clock-frequency = <24000000>;
 };
 
+&spi0 {
+	pinctrl-0 = <&spi0_default_state>;
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


