Return-Path: <linux-gpio+bounces-10061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1891E977F6A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 14:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 449B91C215C1
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 12:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F4D1D9359;
	Fri, 13 Sep 2024 12:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dpCg4WU/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6EC1D9323;
	Fri, 13 Sep 2024 12:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229623; cv=none; b=hd29ovrSLMV5RW2BdSpsidersJDAB1nhqRCd3mHfL5dkjFJdbudqXJfXJ+7P4qeVmjdca0X0scvLU5VWruLxIb3rv/yZFtZe2ZxsYwXztP0vDT8bOue4tEMPotCO3UZ0PRLBGKVCKYBsmxYZTfQmuMefRaAQIIhrw/8EwOpnafw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229623; c=relaxed/simple;
	bh=ck5H4vtqkZ1NBe91pYpQKg1f5rQDMSVVFr7oYb3lHbo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sqGfNhnf7Qk9NKqx2Qw5x3/x8vHLnua7TnAsLE+9ivTVVJ1fRDOaLt2rBT7u+mnHUFAfyxGCgDP7TgiHvBHrsC3nqNsdUM5sBPT/G+Kig9Mf/HHKVCQ229nIeBRfQDsVErXNp+SvJFJ1yIUK+3lPxG5d+T8+rWLmfpL4JKquJOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dpCg4WU/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DAnPQ7002999;
	Fri, 13 Sep 2024 12:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SzeWiZhKLH7iSBoq7B+9kj4K06fTecZJwRirkM3hm8U=; b=dpCg4WU/abSQAKnc
	RWQsBR8tFYoSaerIm9ndG9CSkgzyUHvobNPnGApfryACNYMfpk4LZUfPlr1rcHtj
	VbjQZ/czakdNrmU0lOR7JKUm5RK13OlmZezvtbfiZD/0pP1gcOCG8ricCND250/f
	40LF/9i/S2Y+bcqW4zE45D6GAIx8v0TLykdlzmYBqQC+SzJIMk6k/s2JT3mf1/bZ
	pOOe6vdQNaKg5Ao2Z8V3Nh1e5XM0+2Xh+OmVQ7XGG2WtyLVd+CFv8QfOZA5Ccyyq
	Zj4krG8h//IEBIyBwctS4w6qavijUhCTwTIZ2M6yUR0h3MHRFaoCClpRESHd9C+p
	98H8hA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybq0j2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 12:13:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DCDQus002397
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 12:13:26 GMT
Received: from hu-srichara-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 05:13:19 -0700
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
Subject: [PATCH 2/8] dt-bindings: pinctrl: qcom: add IPQ5332 pinctrl
Date: Fri, 13 Sep 2024 17:42:44 +0530
Message-ID: <20240913121250.2995351-3-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240913121250.2995351-1-quic_srichara@quicinc.com>
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Pp406oMkvI-4rp6TcXnXcKQuZbpgpine
X-Proofpoint-GUID: Pp406oMkvI-4rp6TcXnXcKQuZbpgpine
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130085

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Add device tree bindings for IPQ5332 TLMM block.

Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
 .../bindings/pinctrl/qcom,ipq5424-tlmm.yaml   | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml
new file mode 100644
index 000000000000..a16d9725e368
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5424-tlmm.yaml
@@ -0,0 +1,115 @@
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
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description: |
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
+    maxItems: 26
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


