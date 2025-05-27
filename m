Return-Path: <linux-gpio+bounces-20582-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5397AC4CD2
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 13:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF7B01748B8
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 11:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270AF25A344;
	Tue, 27 May 2025 11:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C87H5/MN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475A924887A;
	Tue, 27 May 2025 11:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344369; cv=none; b=r2Yee9ObsRGlxcE3kFJjMXyJu9bmsNF6mpZmmgF/6Z0iw+m6W4ntUZX4PHFCXqWySB15j2HR8TqQfotH2Z9QPukXmCzUkvtOVKL3gcjMtm7PNxg/uFGxGadnRKjADbSeG9AzmQggBgCV1nr2NisPBdkDi7GdkMpRX29m0Uoxchc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344369; c=relaxed/simple;
	bh=nqPc55hB1GQrg7mDhr6kPojKNVIjxArQHxvup5R3NAU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZPOjl8rGB9GgXXDxGOmIeEAVHiU15ZAiQ96WNk8LrcXQmk5dDe/+CBhLCmLN3Iddfr1Aza1hcwgqullMmrE+coByIDeEmU5b866a6qpMm9pznXsLOeUke8ZHA4x0Xn/dZOcEkywZGPnFzK77T7Sh8SliLLQ4AyAb+I9DpJXt7gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C87H5/MN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9ewnE022291;
	Tue, 27 May 2025 11:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B7lbn7xRT5f
	uFb9AmBt5kRQKYgLtyfgkbTvwbEoA6zo=; b=C87H5/MNYp8btoYlDHm+s2mn0l5
	SxEGDorhLpLuv/x2Vt6R/XNxbixKJNFQ8HPC4FjNVNZK7dOQ1O4uIrhuBHdFcF7a
	uAYdZoWTdse+hKtbYYAM/JFfnYp1gG1FYVx4vRJPxdK4bDOBVmECEvg0ndsHQ/5U
	EqBh/F7TcRIt8y3iMhJq/iRajeeH7k3XPZScZkwJjaZgYdsZ1GIT49om2VkiLP47
	62rVNzywBpPSYNX1HqExliW2Ev0Ll/wNoCqNR8uBB4t4NRzOUDBIE1en9Z/7ZBbJ
	lDe0t5+i5ovSq+i4TvshhWHw8USi9Euo/u1byGRre7iuBvtV+XFgRPg9Kzg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g8xkt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 11:12:43 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54RBCeED028138;
	Tue, 27 May 2025 11:12:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46u76kscbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 11:12:40 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54RBCdTQ028111;
	Tue, 27 May 2025 11:12:39 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 54RBCd7Y028097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 11:12:39 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id A1C895C7; Tue, 27 May 2025 16:42:38 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v4 4/8] arm64: dts: qcom: qcs6490-audioreach: Modify LPASS macros clock settings for audioreach
Date: Tue, 27 May 2025 16:42:23 +0530
Message-Id: <20250527111227.2318021-5-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=68359e2b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=ArhgNfssI8JOQl8lT-YA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mi4GZJsUaT9YM97wVmithomfAuAz66X8
X-Proofpoint-GUID: mi4GZJsUaT9YM97wVmithomfAuAz66X8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MiBTYWx0ZWRfX5ts03c4D7O60
 bseBoiJZ0IbuTg+9BdpGXAaXSkXmouZLDAaELdZVqP+9ckVGke1jG/HVw8vVkTTgxMp/Ls4FuJO
 1VuNd1vcSsMgZMxTsyVUo0o1ZfZ5x4O0obNKLooXT3Z/2jhHm06gRpxmTztgYqaeTcYPhBgILv+
 bGok02AXYftnDfhEuVxfAqE/N50dnGnn+uvjtBDPWC9B2su798ke7PMb/tRC+UzutgdUfdqWaaK
 yZK4VxB2o/l/RnyNRif2glSzX+laAPLc2rHeFWUdTWjCadqowRwuPk++U27LVeSNDLlgiIFwPB5
 lOp+bBjLgeh/gqCxoXinAnVaFwn+c56czvffpURR/E9Le2RykQP6fVmuC7vyfVEtaz8kwH3u2KL
 Wlr7e/0Z0HCf9kVV696fLlJsPN8e7jMpbxqeYsL4dexFdUWB1mISIO+d36w4XS15J1234Avi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1011
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270092

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Modify and enable WSA, VA, RX and TX lpass macros and lpass_tlmm clock
settings. For audioreach solution mclk, npl and fsgen clocks are enabled
through the q6prm clock driver.

For qcs6490 RX drives clk from TX CORE which is mandated from DSP side,
Unlike dedicated core clocks. Core TX clk is used for both RX and
WSA as per DSP recommendations.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
index 29d4a6a2db26..4111091f77b2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
@@ -11,6 +11,69 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
+&lpass_rx_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk",
+		      "npl",
+		      "macro",
+		      "dcodec",
+		      "fsgen";
+};
+
+&lpass_tlmm {
+	clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "core",
+		      "audio";
+};
+
+&lpass_tx_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk",
+		      "npl",
+		      "macro",
+		      "dcodec",
+		      "fsgen";
+};
+
+&lpass_va_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_VA_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk",
+		      "macro",
+		      "dcodec";
+};
+
+&lpass_wsa_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk",
+		      "npl",
+		      "macro",
+		      "dcodec",
+		      "fsgen";
+};
+
 &remoteproc_adsp_glink {
 	/delete-node/ apr;
 
-- 
2.34.1


