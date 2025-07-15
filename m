Return-Path: <linux-gpio+bounces-23317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC910B065C5
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 20:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 370365663A6
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 18:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B60B2BE642;
	Tue, 15 Jul 2025 18:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J23pjq8U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285F22BD005;
	Tue, 15 Jul 2025 18:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752602839; cv=none; b=HKvwZhgYqXm88SmOgJvvLCDfch3kdhgcJnqSOr013Mq+A3LAc4YD5j5C3tyQ/IwUcnUXUr5MGQSPhF0vhDnZBeW0AkJh0eAFvugBzUOClNkdFfi+q9fcvBfxi7yyH+BSqBnQuaJ8BcJOBWVzc0ugaobL3Miww0mqIrPyLCuGiXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752602839; c=relaxed/simple;
	bh=P8NQgXwVcdeGFJa0FehcD0/fsBSp/QqCpXsRFPV33Eg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pjML+gyivUqK33ZJZFcZSE9T2cmI8K+c/M3bkqvleBCUxUkLdifJuIYIjsSvxglRhraqU4Gwn7DWSm/jHvGIJS8LxjiqSca7JozlB5hqBlyGRuGCUpFXzmNoA6QA7RRhTLyUidi/TuSiLU3XqgwIQpmZQ4/Bl/V+OKElQJtEnW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J23pjq8U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGD9Gw022700;
	Tue, 15 Jul 2025 18:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=W6oPjJ4zSKE
	TcnaxJhSU5F12KHawMLdElntnBB/j5PQ=; b=J23pjq8Uj/PYv16twA9SfE4AmvX
	vHu19B8/TiZjtgbcvUmVWO5cKJ/n4HrqSkokigl8pS1kzeXHLlnsQday3FpJuz/m
	oGydiV7mfgzlZrXieN48iPzv2jMPAXI6DkNY1uCV5UxKhlDEc7S38XenUHmlS4Di
	1QOFWeVDHtrWT/ZphrEqk9iqPrYFGjxGE/Kad0w4wdvAwG4AYaN/HJCVylmYiaLE
	JJjWgKBgxbtpb0Y2gjX/ShrFjqwvNZtUYd4aWM4EF4zvWikmkQ69nWYZz0z79N5P
	vOKfy54eyRj6SHMu71/81vTIxbWz7Ku8Q1yxxTj0WQQs4GVXPkue42kqZLg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkruhumf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 18:07:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56FI764E028737;
	Tue, 15 Jul 2025 18:07:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47ugskwyxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 18:07:06 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56FI75LU028673;
	Tue, 15 Jul 2025 18:07:06 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 56FI769p028712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 18:07:06 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id A510B542; Tue, 15 Jul 2025 23:30:52 +0530 (+0530)
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
Subject: [PATCH v6 1/9] arm64: dts: qcom: qcs6490-audioreach: Add gpr node
Date: Tue, 15 Jul 2025 23:30:42 +0530
Message-Id: <20250715180050.3920019-2-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715180050.3920019-1-quic_pkumpatl@quicinc.com>
References: <20250715180050.3920019-1-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-GUID: TBb1uGGo4qcNMv-7LFU3Abke395FaDa2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE2NiBTYWx0ZWRfXxIGPY2thelRq
 H53VELaaODJNLmOFb+Yyr3dWzO3rwqBk9P6MuA51rTJMhoeQ9c/se5WCUn40k3YmGOxbQQt5VGG
 p4KYf+PFcnFpy1AxYxbGOq9qmrk99Ras/Wz456byg5AB7ZE4rhPzsq7EbwKRJOJBUOCYP8YTPfo
 H+Qh+XrZE+dxDYouR2uy5hIliiNBG4ZDKOfzl1I1otF4MDLx/EqT29CkqSMmWxpFioKcNn2ntK/
 y2bq8U9UwftGB2o2wwzstlGOy08LnHTIqyaU7Zk/8pu/VbjRAQDB1H0i+3/ngpIzsFsL1CnpsVV
 lRVbEWrPE8Q3m4m8rTGO21ujTs/6Qm1id5JLglQwq8V2QQzAmGEIy76R4+5hg4pZGmLOnIdF6Um
 hfQPFecLuxx4agto3DO0kpCfASggtT90pG1LfEJgsvl3Bk06nQSrc1VF2jL2zgvyBwChQxoc
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=687698ce cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=qNQE7zv6AEFRdB29RtQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TBb1uGGo4qcNMv-7LFU3Abke395FaDa2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150166

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


