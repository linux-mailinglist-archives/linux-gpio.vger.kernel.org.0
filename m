Return-Path: <linux-gpio+bounces-11727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D37479A93D1
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 01:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A787B239A1
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 23:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F0F205AAE;
	Mon, 21 Oct 2024 23:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pm+f3FKX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5068B1FF61D;
	Mon, 21 Oct 2024 23:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729551874; cv=none; b=Yv5RZGIZXyJXvQpZ3IXUi8XSMpT8gCWubh8VMM7uE2GT93YHmmHcN2DWooO+NcLaMgBOCLrs5Z9xXJpNQzUyP+oyhcT1ZHjxzcRQ4gc+KSdZRIkNHeV6gWEfl6bvNr+R23cRFiHRJbeip20JaTInCihtdg+jlyeQDqwj4mMP4FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729551874; c=relaxed/simple;
	bh=6PK8HVXcUgDIBjAYrxIFIJZ7Nwc5m9VramQ75oSTbns=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PnAZYU1BChQZFwTJTtBH8MbRth8vINj/wZwo+Nxz3TOR2v4VRrOWBOIS51ixlXD1ziTxmvVOM/7Fv2bFdT/FfoJfzF7dm67cKhyrrI7V9IpAJdzPiIm993SbuFPBXw1002TnpiJb09DdRuby+Z79EuaHu2RCtvsMlZ+Jr2tgSAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pm+f3FKX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LK3NCK017808;
	Mon, 21 Oct 2024 23:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ciOs5BVnlK3DrFBOttf65wQzOHXR1O60nEvbfy6bqA=; b=Pm+f3FKX6k1NCiel
	hjVjfEJGKFm+jifd5H2CAYxKRR5hfpnsNubn02i9UsNaKtwqbLSQ/eV92RKQYDaR
	JefKSVCYvieyEqO/YcUY3Qt//OdJiWYuSPO6b1l7Qzz82tbJXxV7vVbQFuP+5dOR
	Xo5v2BxX752DCA+6px/G7CovFJIfZQRRE/XZQVFavskdMiTmCCtTXFXdOG0Hlugi
	Iw/HZhEe+VuZ+m8Ccf9qWknu37lJVf9mYYWVU/CbO0Fmu7P21sajcGbFCOtWeKPH
	oSRPhRpLMIce6XnZd7Izc/DOxqG1KgwZSF2hW6gCoq1DB0wp8zJjNZsNaKuluf5/
	cEKl+Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmdqa5ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:04:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LN4QCg001626
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:04:26 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Oct 2024 16:04:26 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Melody
 Olvera" <quic_molvera@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sm8750 pinctrl
Date: Mon, 21 Oct 2024 16:04:13 -0700
Message-ID: <20241021230414.2632428-2-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241021230414.2632428-1-quic_molvera@quicinc.com>
References: <20241021230414.2632428-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H28lL_mljIF5k3BF_eisVlCG49C8c9I1
X-Proofpoint-GUID: H28lL_mljIF5k3BF_eisVlCG49C8c9I1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410210163

Add documentation for the Qualcomm sm8750 tlmm.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 .../bindings/pinctrl/qcom,sm8750-tlmm.yaml    | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
new file mode 100644
index 000000000000..39627ef22d51
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm8750-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SM8750 TLMM block
+
+maintainers:
+  - Melody Olvera <quic_molvera@quicinc.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SM8750 SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8750-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 108
+
+  gpio-line-names:
+    maxItems: 215
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sm8750-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sm8750-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sm8750-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9]|21[0-4])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk0,
+                audio_ext_mclk1, audio_ref_clk, cam_aon_mclk2, cam_aon_mclk4,
+                cam_mclk, cci_async_in, cci_i2c_scl, cci_i2c_sda, cci_timer,
+                cmu_rng, coex_uart1_rx, coex_uart1_tx, coex_uart2_rx,
+                coex_uart2_tx, dbg_out_clk, ddr_bist_complete, ddr_bist_fail,
+                ddr_bist_start, ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2,
+                ddr_pxi3, dp_hot, egpio, gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0,
+                gnss_adc1, i2chub0_se0, i2chub0_se1, i2chub0_se2, i2chub0_se3,
+                i2chub0_se4, i2chub0_se5, i2chub0_se6, i2chub0_se7, i2chub0_se8,
+                i2chub0_se9, i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws,
+                i2s1_data0, i2s1_data1, i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist,
+                mdp_esync0_out, mdp_esync1_out, mdp_vsync, mdp_vsync0_out,
+                mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out, mdp_vsync5_out,
+                mdp_vsync_e, nav_gpio0, nav_gpio1, nav_gpio2, nav_gpio3,
+                pcie0_clk_req_n, phase_flag, pll_bist_sync, pll_clk_aux,
+                prng_rosc0, prng_rosc1, prng_rosc2, prng_rosc3, qdss_cti,
+                qlink_big_enable, qlink_big_request, qlink_little_enable,
+                qlink_little_request, qlink_wmss, qspi0, qspi1, qspi2, qspi3,
+                qspi_clk, qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se3,
+                qup1_se4, qup1_se5, qup1_se6, qup1_se7, qup2_se0, qup2_se1,
+                qup2_se2, qup2_se3, qup2_se4, qup2_se5, qup2_se6, qup2_se7,
+                sd_write_protect, sdc40, sdc41, sdc42, sdc43, sdc4_clk,
+                sdc4_cmd, tb_trig_sdc2, tb_trig_sdc4, tmess_prng0, tmess_prng1,
+                tmess_prng2, tmess_prng3, tsense_pwm1, tsense_pwm2, tsense_pwm3,
+                tsense_pwm4, uim0_clk, uim0_data, uim0_present, uim0_reset,
+                uim1_clk, uim1_data, uim1_present, uim1_reset, usb1_hs, usb_phy,
+                vfr_0, vfr_1, vsense_trigger_mirnat, wcn_sw, wcn_sw_ctrl ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,sm8750-tlmm";
+        reg = <0x0f100000 0x300000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 211>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-wo-state {
+            pins = "gpio1";
+            function = "gpio";
+        };
+
+        uart-w-state {
+            rx-pins {
+                pins = "gpio60";
+                function = "qup1_se7";
+                bias-pull-up;
+            };
+
+            tx-pins {
+                pins = "gpio61";
+                function = "qup1_se7";
+                bias-disable;
+            };
+        };
+    };
+...
-- 
2.46.1


