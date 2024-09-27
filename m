Return-Path: <linux-gpio+bounces-10477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E30EF987ED3
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 08:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EDFF1F216B0
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 06:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3DB185955;
	Fri, 27 Sep 2024 06:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hXBAW3Z4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2F6183CAB;
	Fri, 27 Sep 2024 06:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727420026; cv=none; b=P3kwq1eejGU9iE2fgWSz3nQ1cpkIfuhWHjNA8V0MJiAmMzMCpAy8X2/hXE9uFcyn1BYkPU7Vx0MMjCL/434e5dTllW7I/fn4ykkkoyLDyinYwYOdTpMU7C3ZMc/T3LV6kyWPkxKNDpjOjbBZbi6hYbRECiXCkZU5g+DwN4yQss8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727420026; c=relaxed/simple;
	bh=0mzCFLKo5PuESdsFphgBHrHCPKhZKAKBtGHLTY4PwdQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ii5cmAo7fFc41MVsO+PAdjDZtMyJeAvOVH+H9x8hjMYyh5MVNtUJiVZMtJ+ocC+xHIu7IZo48lgI1ImqjVPPyhK1kQwjP0o4pEgaLErc0o5XfkB3wYJnAddBotQB39b97ApyLqKqSgutGx6euMctK/+vgztt/j1eMkmEf/d3cnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hXBAW3Z4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48R6neLH000526;
	Fri, 27 Sep 2024 06:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNhIYeNEne/Rs4qB2YP0yfWPSpL/wx/z2pOh5KGHYGU=; b=hXBAW3Z4iaH95htp
	+iGGbk3vm1V8kgrfFstzoP9Tjx4TW7jycsf60t2GxCFQDvNImbG9DFtY4SX3kn0A
	T+4TTshMjPFi9cYeXyBfqRqJhhtmMy/dwucKgQQ5E+7ni12uBJAXRlmAfnKZUXqq
	5Amk53rjs2g85CTZUSkl2sI32cWN+ql8MxSFppHnycG5AYiDMu9YOZOom9XrTSg+
	zFKgUXjjKbMXSKZbI6XK2xJHKy95IjAbe1CWe6U0Bp8Qgk4hYVmYy6hAwlhbquVw
	vNrGQQEXigUkoRt57Don94HxmjxPq7m3KyRSp0s/NsAEJqFlao4p099GuKppu/jW
	Fm40Hg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqe9hub2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:53:31 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48R6rUfU029901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:53:30 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Sep 2024 23:53:23 -0700
From: Sricharan R <quic_srichara@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <ulf.hansson@linaro.org>,
        <linus.walleij@linaro.org>, <catalin.marinas@arm.com>,
        <p.zabel@pengutronix.de>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>, <neil.armstrong@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH V2 3/9] dt-bindings: pinctrl: qcom: add IPQ5424 pinctrl
Date: Fri, 27 Sep 2024 12:22:38 +0530
Message-ID: <20240927065244.3024604-4-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927065244.3024604-1-quic_srichara@quicinc.com>
References: <20240927065244.3024604-1-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DrJC1qsvgKF_zc88bblf0PpAEaBbkag3
X-Proofpoint-GUID: DrJC1qsvgKF_zc88bblf0PpAEaBbkag3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270046

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Add device tree bindings for IPQ5424 TLMM block.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
 [v2] Removed Krzysztof  from maintainer list, fixed maxitems,
      added Krzysztof reviewed-by tag.

 .../bindings/pinctrl/qcom,ipq5424-tlmm.yaml   | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml
new file mode 100644
index 000000000000..5e64a232fc7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,ipq5424-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ5424 TLMM pin controller
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm IPQ5424 SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,ipq5424-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 25
+
+  gpio-line-names:
+    maxItems: 50
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-ipq5424-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-ipq5424-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-ipq5424-tlmm-state:
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
+          pattern: "^gpio([0-9]|[1-4][0-9])$"
+        minItems: 1
+        maxItems: 50
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ atest_char, atest_char0, atest_char1, atest_char2, atest_char3,
+                atest_tic, audio_pri, audio_pri0, audio_pri1, audio_sec,
+                audio_sec0, audio_sec1, core_voltage, cri_trng0, cri_trng1,
+                cri_trng2, cri_trng3, cxc_clk, cxc_data, dbg_out, gcc_plltest,
+                gcc_tlmm, gpio, i2c0_scl, i2c0_sda, i2c1_scl, i2c1_sda, i2c11,
+                mac0, mac1, mdc_mst, mdc_slv, mdio_mst, mdio_slv, pcie0_clk,
+                pcie0_wake, pcie1_clk, pcie1_wake, pcie2_clk, pcie2_wake,
+                pcie3_clk, pcie3_wake, pll_test, prng_rosc0, prng_rosc1,
+                prng_rosc2, prng_rosc3, PTA0_0, PTA0_1, PTA0_2, PTA10, PTA11,
+                pwm0, pwm1, pwm2, qdss_cti_trig_in_a0, qdss_cti_trig_out_a0,
+                qdss_cti_trig_in_a1, qdss_cti_trig_out_a1, qdss_cti_trig_in_b0,
+                qdss_cti_trig_out_b0, qdss_cti_trig_in_b1, qdss_cti_trig_out_b1,
+                qdss_traceclk_a, qdss_tracectl_a, qdss_tracedata_a, qspi_clk,
+                qspi_cs, qspi_data, resout, rx0, rx1, rx2, sdc_clk, sdc_cmd,
+                sdc_data, spi0, spi1, spi10, spi11, tsens_max, uart0, uart1,
+                wci_txd, wci_rxd, wsi_clk, wsi_data ]
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
+    tlmm: pinctrl@1000000 {
+        compatible = "qcom,ipq5424-tlmm";
+        reg = <0x01000000 0x300000>;
+        gpio-controller;
+        #gpio-cells = <0x2>;
+        gpio-ranges = <&tlmm 0 0 50>;
+        interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <0x2>;
+
+        uart1_pins: uart1-state {
+            pins = "gpio43", "gpio44";
+            function = "uart1";
+            drive-strength = <8>;
+            bias-pull-up;
+        };
+    };
-- 
2.34.1


