Return-Path: <linux-gpio+bounces-22128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3A6AE7A18
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C3691893A0B
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 08:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A85426D4C6;
	Wed, 25 Jun 2025 08:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FWfMHVk4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950E126C3A2;
	Wed, 25 Jun 2025 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840193; cv=none; b=M8BJ1K8DyCeKOe97m1UmKYILBaZvOiD4VdCqf2LWpE/l7WxpzFhwPdOs+4DB0C+nCnmT004uaaIgE8xbVuCNxzFJ1uDYoqFH1yLiuoFQBOtDj4mc3XKF4N42e8ca9aXWy7O9ZVZ4g0Bk/ppDgNUgxTRJrzB47mP/hNkMpee8FMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840193; c=relaxed/simple;
	bh=DYPhM6i+bhU+BYjmra+AoWbRvvAEwmYKWVx3mEgHAoA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gLtj2lZn6jmfQt9K0zl5q+G20FVp7mEx1kXJ3s5h4Ha0XS2RgZU8+NP/Gn6MnQECj8UJU2wLQmmV2eiGZJGc0XySzq4gvPnJt8K51McWXRdsiFHl1jSk4ypLcwOt6OAkspaxBViu1P7M4KJA3EhNNWJmyg4q0qmOlwwvpcp3os0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FWfMHVk4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1FgHX032301;
	Wed, 25 Jun 2025 08:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mtTAH0ZZzBv
	F9v0WrqfnezSF7zeEA4lg84d0eHXjSy0=; b=FWfMHVk4tVDG9VzHJsMfOSAv1t/
	kPVzUfARadHDmflhKi2QDDMotWSuz4Tm8e5n8Eeol1A3AcsoC6cd9YXjAtUn3xuM
	Ix+7BE36S3HBKXVWYqNZ2SVQxobRgEhbZO86sKbqrKfJ073Xln0QLCJ1INtzKkvc
	nqiaaNd+MYkYHQ91AVfZU3q80U+c6WawU+qSkgKca8uat3eAFVJNM6wWH6MLVF98
	kaIa0oCUwfrMHqzVRyfyivbjvW4PiISe1XYtsupHZXb8oT63PHr/hhKvO1apatpv
	QjRpRn+vJedjvmQEk4IeVq3lyPU5zQJnbPOdd1yh1RKrophTujsJOzXS8Gw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1wpuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55P8ThPq032600;
	Wed, 25 Jun 2025 08:29:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47dntm2epf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:43 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55P8Th9x032574;
	Wed, 25 Jun 2025 08:29:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55P8TgLY032566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:43 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 9EA524A0; Wed, 25 Jun 2025 13:59:41 +0530 (+0530)
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
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 1/9] arm64: dts: qcom: qcs6490-audioreach: Add gpr node
Date: Wed, 25 Jun 2025 13:59:19 +0530
Message-Id: <20250625082927.31038-2-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625082927.31038-1-quic_pkumpatl@quicinc.com>
References: <20250625082927.31038-1-quic_pkumpatl@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685bb37a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qNQE7zv6AEFRdB29RtQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Wlo86bvFn8zgGr6hKVmMdbjphuL1OSTJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2MiBTYWx0ZWRfX8oXkdWrFkgRA
 dK1u1MCov+2mGpAPjX2EQ29D/iVcAinXvgC5wZGwzGugWXe2DWLmDFU2Vj10NkzaMpE6k8/cXtG
 JsGPa85BqDApfJrZdPCvUPDHdhDVXNhsDj0PFjn65YTiZe6qeoiBwhojA+ewg0zjnDW9Mt43eJ3
 qrqEi99ew61E2KUFHNBgSm5h/n+igOuohmfyancg9aRsGVC5crOHBY8rOO42cMgMBS008Dt0XLG
 j/Lho1AELgFFVdlkiez52BcH5l+t8QKwAfXlvtIkc01RtxPWYbCdmv6a+j8lfsXOUEA7u+1M04V
 taOcH2qWLfEs+b1Ro6wN9cK8Q2Xa1geXdQMzhVmesvt2WcU6Zxhb7zzW1kGgOabeFiwIQ/QTrGD
 Vkx8AeeV0ly1ov5aHw6gqh7fquagWy7cuj8ejvdxUSH07h2GA47JqBj8ba650fd3XxDX+P9d
X-Proofpoint-ORIG-GUID: Wlo86bvFn8zgGr6hKVmMdbjphuL1OSTJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250062

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

A new qcs6490-audioreach.dtsi file has been added to
update AudioReach specific device tree configurations.
The existing audio nodes in sc7280.dtsi, which were designed
for the ADSP Bypass solution. The audio nodes now being updated
in qcs6490-audioreach.dtsi to support the ADSP-based AudioReach
architecture.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
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


