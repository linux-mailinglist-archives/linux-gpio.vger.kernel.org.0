Return-Path: <linux-gpio+bounces-10302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A96397D224
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 10:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE1DC1F2547C
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 08:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21447580C;
	Fri, 20 Sep 2024 08:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SvRHHFYv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207D161FCF;
	Fri, 20 Sep 2024 08:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726819239; cv=none; b=L8FsURq/Oqr5cY/OpxEt3CijJ1biqGc9T8tHa7ku6XT+zkhjaSQ7JK0kgDOW4OGLoHIH35SyEI/+KScouUZ+r+U1Kq743wTM9pj/WZuOo88W9M6BTCSSzwHxRODPXRNZhIzf1l9BDdaVz+mCVhzeBA+1hnGPXD5Ydhs0GjodDhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726819239; c=relaxed/simple;
	bh=N1bqWp78RulhjaF9tBKr41WQBs7m4eWaxYCbzpbdgdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=C4Bm6w6Ka5O6ywqBIODjPsOBURSI7gZYoODPB2zc0X1axOndRFGhhw++tn22e+vHJXfJFsj9aKAp0DWciH1r4jF3hJRgb3JAyt0157OXw6+vXriryQx9jYuC4Cd2ytK2JnmbN/QP7xu/B4bemq8mqrUo5zFZKTYwhBOu3YF5CKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SvRHHFYv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JJ3ujf017169;
	Fri, 20 Sep 2024 08:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSUPWjeqaEHk6ubzqtYx05bJjZT/ap3jDecJUfZIp7U=; b=SvRHHFYvXGcMKv21
	D+yJrZNO9bVPSQjaXWbojVtvgjPhcto73zHBVUs9v2ZLVkM3qSn9fK2cCG5IqS7v
	puEUqmlENhFXL5R26H9QTviPfuHfTc+FVFI4gK5kaxqIA/SbCMIr1irJPvLMm/7j
	bsEwDusAzhn5zADeixNajutMBt8WSr+RjKjuSg55PKnWFQ9+DOnapD/zch/K7f8a
	DGLRQKiW8UP4Ry+FSo93xU6mY2IFIRYOoeVjP2jfV/OS67qhcaKT5lz19cX9LLab
	KWiVXPtTW8HFCIffEILjnrqgFEogFK8ijjTBdqLH+YF6cUGDhlFHKmF9G9qJVpLo
	sFBazg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hhg89j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 08:00:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48K80T7B003854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 08:00:29 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 01:00:24 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Fri, 20 Sep 2024 16:00:09 +0800
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: document the QCS615 Top Level
 Mode Multiplexer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240920-add_qcs615_pinctrl_driver-v2-1-e03c42a9d055@quicinc.com>
References: <20240920-add_qcs615_pinctrl_driver-v2-0-e03c42a9d055@quicinc.com>
In-Reply-To: <20240920-add_qcs615_pinctrl_driver-v2-0-e03c42a9d055@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, lijuang <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726819221; l=4616;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=N1bqWp78RulhjaF9tBKr41WQBs7m4eWaxYCbzpbdgdA=;
 b=ybHhvdAyXELQZ6WtKPHo6YkAIfffVyU6FHE3+9eUsESzSJgmqyO/EVJf3GYFGFBYsapBgsfE5
 pCUCTVN7WokAIBnWXk8bQ4qkI3JpWI7C4pr9RKpruir+WCCLVCz1Wqk
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QkvFIOiECH9uTNbQvj-cmWZbO7gk7t-k
X-Proofpoint-ORIG-GUID: QkvFIOiECH9uTNbQvj-cmWZbO7gk7t-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409200055

Document the Top Level Mode Multiplexer on the QCS615 Platform.
It concisely explains the pin multiplexing and configuration in
the device tree, and includes simple examples of typical device
tree snippets, making it easier for designers to configure and
manage chip pins.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 .../bindings/pinctrl/qcom,qcs615-tlmm.yaml         | 124 +++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
new file mode 100644
index 000000000000..1ce4b5df584a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,qcs615-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. QCS615 TLMM block
+
+maintainers:
+  - Lijuan Gao <quic_lijuang@quicinc.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm QCS615 SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,qcs615-tlmm
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: east
+      - const: west
+      - const: south
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 62
+
+  gpio-line-names:
+    maxItems: 123
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-qcs615-tlmm-state"
+      - type: object
+        patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-qcs615-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-qcs615-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-9]|12[0-2])$"
+            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc1_rclk,
+                      sdc2_clk, sdc2_cmd, sdc2_data, ufs_reset ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, adsp_ext, agera_pll, aoss_cti, atest_char, atest_tsens,
+                atest_usb, cam_mclk, cci_async, cci_i2c, cci_timer, copy_gp,
+                copy_phase, cri_trng, dbg_out_clk, ddr_bist, ddr_pxi, dp_hot,
+                edp_hot, edp_lcd, emac_gcc, emac_phy_intr, forced_usb, gcc_gp,
+                gp_pdm, gps_tx, hs0_mi2s, hs1_mi2s, jitter_bist, ldo_en,
+                ldo_update, m_voc, mclk1, mclk2, mdp_vsync, mdp_vsync0_out,
+                mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out, mdp_vsync4_out,
+                mdp_vsync5_out, mi2s_1, mss_lte, nav_pps_in, nav_pps_out,
+                pa_indicator_or, pcie_clk_req, pcie_ep_rst, phase_flag, pll_bist,
+                pll_bypassnl, pll_reset_n, prng_rosc, qdss_cti, qdss_gpio,
+                qlink_enable, qlink_request, qspi, qup0, qup1, rgmii,
+                sd_write_protect, sp_cmu, ter_mi2s, tgu_ch, uim1, uim2, usb0_hs,
+                usb1_hs, usb_phy_ps, vfr_1, vsense_trigger_mirnat, wlan, wsa_clk,
+                wsa_data ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@3000000 {
+        compatible = "qcom,qcs615-tlmm";
+        reg = <0x03100000 0x300000>,
+              <0x03500000 0x300000>,
+              <0x03c00000 0x300000>;
+        reg-names = "east", "west", "south";
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-ranges = <&tlmm 0 0 123>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        qup3-uart2-state {
+            pins ="gpio16", "gpio17";
+            function = "qup0";
+        };
+    };
+...

-- 
2.46.0


