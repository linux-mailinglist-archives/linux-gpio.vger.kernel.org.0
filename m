Return-Path: <linux-gpio+bounces-23530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 433F9B0B757
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 19:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 827B67A826E
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 17:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130E3225419;
	Sun, 20 Jul 2025 17:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="csrQTfEn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476501F4622;
	Sun, 20 Jul 2025 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753032766; cv=none; b=iF3nAM9tJzG+43PtK+DnKvTU7B5TpGu6UY4qASdpuuFgDeK+Gyhe/AzM+co0lHUh/9qTVZoSXdO9LO+tzgAW1giBlWu/dfddaIscRfGaTlWxB3KxsGLn2bAwhxQINXLI0AGejoA84DDigz3/2rOEyeU4hf06ED2+Qv89Psdx0rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753032766; c=relaxed/simple;
	bh=P8NQgXwVcdeGFJa0FehcD0/fsBSp/QqCpXsRFPV33Eg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EyyD1c1O6++4VYcn+1ilQOeUZ4ziQA09MqChKgTPHUYIay/fN+B0FJLahLph8lcgA5g8RL+ndLHtcUyCkVO7d4YPjZCt+JZUQak+s+jZiVFlOxNGhJjkqbQ2ob5YRKIfi00m5oSDxznN1FqF7XcASJalK72BOvdw+YgnsQMvaI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=csrQTfEn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K9Uobg014246;
	Sun, 20 Jul 2025 17:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=W6oPjJ4zSKE
	TcnaxJhSU5F12KHawMLdElntnBB/j5PQ=; b=csrQTfEnLFMEQNRwJm7BhPT7JGb
	2N1qG6DRZeyEAFLgSerslboUxxh69MLPLfQxtoV1x8FYM8hlD6nnArbxoWUm+1oK
	1Nxu9kSmlOpkg2uOdg+rd+SAA7nt2/xy2T24nIl1B2VEQwnywBgqEkM9g6S5AgDt
	i5dsSIjEJky735lffevsGKTJEY89B0ibi0Ft1lQNf6vbLNk9fG5c6zqHsIUUR+9Z
	P6ok0+7ECBI4QWEqUm7unLl9UdRRbsV0VgixplPEu+yQqncTb0u6+JjW6DgTv41x
	qe7Zi29H76+9rMREvPfyjPDc82LSLipmI3ABCMY9sQVnnom4LUcTZodHY+g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804n9tebd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 17:32:39 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56KHUSPl024985;
	Sun, 20 Jul 2025 17:32:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4804ek9a44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 17:32:20 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56KHWK3o027034;
	Sun, 20 Jul 2025 17:32:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 56KHWI7v027025
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 17:32:20 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 0D2D93E3; Sun, 20 Jul 2025 23:02:18 +0530 (+0530)
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
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 1/9] arm64: dts: qcom: qcs6490-audioreach: Add gpr node
Date: Sun, 20 Jul 2025 23:02:07 +0530
Message-Id: <20250720173215.3075576-2-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250720173215.3075576-1-quic_pkumpatl@quicinc.com>
References: <20250720173215.3075576-1-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-GUID: 0ESUgrgrrxXdKYaNPDUwbqRIF8jXfSwe
X-Proofpoint-ORIG-GUID: 0ESUgrgrrxXdKYaNPDUwbqRIF8jXfSwe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDE2OSBTYWx0ZWRfX7h5hOczFuD0/
 d7iu3NcH+NxVBU/KieE1HL/xgjbk0MvX15QMCWrwXklvjbtPBh5mXRzsRkcNALD6VOetVBqSIMn
 FIU8yLncAvFzH8zDIpaVbBGQbOWIsVjGN+32xnqOxIkwTHFt3nZ5PxbO9mmGghe9KBw6iooAxq7
 SAPZMST/i5+HX0zByf7zEGR/tPgBt6HeQldxFPe3NFbry1vYf3voJci+8gAdFxaPzBvIua4gEqF
 4TtPAngya+Rr/JsBy/8/+nxekjamMFGPEXQapLeHGJht2ACqRyErtl8749Ms3p7lGsXGnNPryS8
 AdaytYOHRxbQ97rIsHX4dMezfqLGnWuPturYtmikQuHHsPUXhzOcX23ChbQl7FkYnlrDY/c8Q7M
 /vqC7IB+gnIHlQv1rv2gVlMFl47Q8RzrDXSLr7f/d6nDezzQv+JFwtg53cHOD6W7qh2z/GKG
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687d2837 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=qNQE7zv6AEFRdB29RtQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200169

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

A new qcs6490-audioreach.dtsi file has been added to
update AudioReach specific device tree configurations.
The existing audio nodes in sc7280.dtsi, which were designed
for the ADSP Bypass solution. The audio nodes now being updated
in qcs6490-audioreach.dtsi to support the ADSP-based AudioReach
architecture.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 54 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  2 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
new file mode 100644
index 000000000000..282938c042f7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * qcs6490 device tree source for Audioreach Solution.
+ * This file will configure and manage nodes from sc7280.dtsi to
+ * support the AudioReach solution.
+ *
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/clock/qcom,lpass-sc7280.h>
+#include <dt-bindings/soc/qcom,gpr.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+&remoteproc_adsp_glink {
+	/delete-node/ apr;
+
+	gpr {
+		compatible = "qcom,gpr";
+		qcom,glink-channels = "adsp_apps";
+		qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+		qcom,intents = <512 20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		q6apm: service@1 {
+			compatible = "qcom,q6apm";
+			reg = <GPR_APM_MODULE_IID>;
+			#sound-dai-cells = <0>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+			q6apmdai: dais {
+				compatible = "qcom,q6apm-dais";
+				iommus = <&apps_smmu 0x1801 0x0>;
+			};
+
+			q6apmbedai: bedais {
+				compatible = "qcom,q6apm-lpass-dais";
+				#sound-dai-cells = <1>;
+			};
+		};
+
+		q6prm: service@2 {
+			compatible = "qcom,q6prm";
+			reg = <GPR_PRM_MODULE_IID>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+			q6prmcc: clock-controller {
+				compatible = "qcom,q6prm-lpass-clocks";
+				#clock-cells = <2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 64a2abd30100..81dd1a0b6d42 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3822,7 +3822,7 @@ remoteproc_adsp: remoteproc@3700000 {
 
 			status = "disabled";
 
-			glink-edge {
+			remoteproc_adsp_glink: glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
-- 
2.34.1


