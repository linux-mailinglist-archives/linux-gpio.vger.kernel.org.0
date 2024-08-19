Return-Path: <linux-gpio+bounces-8790-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FE69563FB
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 08:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D0701F2152E
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 06:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81362156F57;
	Mon, 19 Aug 2024 06:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YBJ2JuI9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5BA156879;
	Mon, 19 Aug 2024 06:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724050231; cv=none; b=IZmIX8Nf4NMUMITAwSW++OLfOAsIdFKA1X4vkeEzCZXudlLUSa0pTLpvWSQle2Qtk3WuTI/LeSLygFC+AfKUSJdYTZQhP227+xd7pgxaYGco+a7hWb0EdKaSoyuQl5AbdgnX7l9HS+DbwKdWz/7S2gEn/m680VNvwKOm/SHO3mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724050231; c=relaxed/simple;
	bh=E7dM8IomZhTZZMJKMK1LDfowl4xjcStnQhx57UdYfPY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GmlLpF50pml8LUoRMyB+fRBaJTk5sYKYQrjOshptAkP48ZDXCemIvvJ9juw3/OS4nEVPhhH/DDhK/l6HfUWG1ABe3v/r+y871H+knQtF5auzqlEkUoznlv9BJeNv884WEDjGOIH0UnEqq0Ztb5wakzosZ42Bigk/BsPr3RjfjV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YBJ2JuI9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47INtaE4021043;
	Mon, 19 Aug 2024 06:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KkWYy5wD88aLcUF+gC/VSugsy7c9zmVCS0+9ALdDmQo=; b=YBJ2JuI90CT5I5EH
	Ayqy4K8wbq0b6/vZKChZ8bRHfDDmTl0vA18wTcq9ZpqLdC/UAMWIYLhm+mRNHL99
	Fb4Ct7w1oR1FoFUhpOHoMWfYqEtvNbdhLAMdF3ONN3WeJvcIn0d19ks4UXg5TZbq
	wMftmScF/2PbpB0D36ZapHtB6PLrOrVtWnhzEuVITSyWskuChkdlvDprdAt0wWkt
	cjhemWUnWku3SFldsH9zXXIB3lwhKxrIc9k6JPWwI3xmUA/pykhmncD8LC+97sPi
	m5QE+VUim3giq5NojoTmsilzoD9X/oNxhYTLxJw4jCw+9hGU33wLEuf7+h6zVegU
	pr+Otw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412k6gb8vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 06:50:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47J6oNdq019135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 06:50:23 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 18 Aug 2024 23:50:19 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <konradybcio@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linus.walleij@linaro.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tengfan@quicinc.com>
CC: <quic_jingyw@quicinc.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: describe qcs8300-tlmm
Date: Mon, 19 Aug 2024 14:49:32 +0800
Message-ID: <20240819064933.1778204-2-quic_jingyw@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819064933.1778204-1-quic_jingyw@quicinc.com>
References: <20240819064933.1778204-1-quic_jingyw@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TneO3E8lTrEQ_lVWWAzNra8gUdIOkxmS
X-Proofpoint-GUID: TneO3E8lTrEQ_lVWWAzNra8gUdIOkxmS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_04,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190049

Add DT bindings for the TLMM controller on QCS8300 platforms.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 .../bindings/pinctrl/qcom,qcs8300-tlmm.yaml   | 118 ++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
new file mode 100644
index 000000000000..bb0d7132886a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,qcs8300-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. QCS8300 TLMM block
+
+maintainers:
+  - Jingyi Wang <quic_jingyw@quicinc.com>
+
+description: |
+  Top Level Mode Multiplexer pin controller in Qualcomm QCS8300 SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,qcs8300-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 67
+
+  gpio-line-names:
+    maxItems: 133
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-qcs8300-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-qcs8300-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-qcs8300-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-2][0-9]|13[0-2])$"
+            - enum: [ ufs_reset, sdc1_rclk, sdc1_clk, sdc1_cmd, sdc1_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ aoss_cti, atest_char, atest_usb2, audio_ref, cam_mclk,
+                cci_async, cci_i2c_scl, cci_i2c_sda, cci_timer, cri_trng,
+                dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3,
+                edp0_hot, edp0_lcd, edp1_lcd, egpio, emac0_mcg0, emac0_mcg1,
+                emac0_mcg2, emac0_mcg3, emac0_mdc, emac0_mdio, emac0_ptp_aux,
+                emac0_ptp_pps, gcc_gp1, gcc_gp2, gcc_gp3, gcc_gp4, gcc_gp5,
+                gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s, ibi_i3c, jitter_bist,
+                mdp0_vsync0, mdp0_vsync1, mdp0_vsync3, mdp0_vsync6, mdp0_vsync7,
+                mdp_vsync, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
+                mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws, mi2s_mclk0,
+                mi2s_mclk1, pcie0_clkreq, pcie1_clkreq, phase_flag, pll_bist,
+                pll_clk, prng_rosc0, prng_rosc1, prng_rosc2, prng_rosc3,
+                qdss_cti, qdss_gpio, qup0_se0, qup0_se1, qup0_se2, qup0_se3,
+                qup0_se4, qup0_se5, qup0_se6, qup0_se7, qup1_se0, qup1_se1,
+                qup1_se2, qup1_se3, qup1_se4, qup1_se5, qup1_se6, qup1_se7,
+                qup2_se0, sailss_emac0, sailss_ospi, sail_top, sgmii_phy,
+                tb_trig, tgu_ch0, tgu_ch1, tgu_ch2, tgu_ch3, tsense_pwm1,
+                tsense_pwm2, tsense_pwm3, tsense_pwm4, usb2phy_ac,
+                vsense_trigger ]
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
+
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,qcs8300-tlmm";
+        reg = <0x0f100000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 133>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        qup-uart7-state {
+            pins = "gpio43", "gpio44";
+            function = "qup0_se7";
+        };
+    };
+...
-- 
2.25.1


