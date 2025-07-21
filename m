Return-Path: <linux-gpio+bounces-23601-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9E5B0C8D8
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 18:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E9FA1891C30
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 16:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390482E11B5;
	Mon, 21 Jul 2025 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJVm6JNe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422532E0B5F
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753115560; cv=none; b=QDEVDmrAynz/u/2O2VC5PfEde9Bl+8A5oU7wL2PQNBGDcRmv/xTC3cZNewgY5Bhum86yXnjjpIQm0A63mW5PlozDxWwNhDPiWL6DiOzJPw5b7kQaYaiQpe2t1yCEwGE/Tp49IiDtKIHt6f9vCdmjIzyAw8bD1FFxEAUD+vZi+y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753115560; c=relaxed/simple;
	bh=BqdWN9ssfiRfJCTxAtZMsSqjnvf/Wx5f5WaRqFTRiLM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dWpAYHJ1X8OppiEOC4hXDxPdIYyy/QM/F1j+XFiLrhJiIFWOcV/ENJprD/mh5QjKxoohzekUgyhfvClbsAOZnCgyYGRMByWT9QyzH0XoX5P1v0b8hX45x9jYC39pZSX3kOu/a9H2jWt0f4mLn1Y6A29LEOFGLXnDwnAO//ZGyz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJVm6JNe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LAWBNu000994
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 16:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3wUHUZ/KbWp
	L1763kdFYdwgrLSezwF0Oqg9gzLjiu68=; b=ZJVm6JNeS46n4zFLEvqgdkoU19L
	VvogSYjc5Pq/Wkk5Y/q2+cWcu1H+xFULXZPLDExh4s+Y5vkCVi0KYON7oaF/7pe2
	dIxnohaccejY6/njaAavD4EUPb9X0PM7FJpDip1TOMzx0tyovILDoCJC5W0usM6g
	xEdV3KmIoEEvnJHJhLOY2t8M5uu3DUOu96Z7g/64zEM+7AXju/JJJd+Z7+S3/5zJ
	OfsKI6r36WfQL3BXlHTetACnJ3tmxsoBGXwQlmseSTGxIQVDazdOttmVYG/+KRNN
	4nlKvzKBLCi46M63xj5nmPCVTnM3k2JNN9k9+gV+1yYULVh1eZSe+dhX+RA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044de69q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 16:32:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2356ce66d7cso71726455ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 09:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753115555; x=1753720355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wUHUZ/KbWpL1763kdFYdwgrLSezwF0Oqg9gzLjiu68=;
        b=BAKXtWiRImP0zPu9f/skq3pLG15+iuq2r0XjSTXey40r5FYRwogWI+weVoaNyPciI9
         iHW7Oh/41CsOUe1Z99/8A6xWEEAA7ERw+hhz9V4bJ42Sn/9/a89bESFqpwwJ0F2yLH/A
         JeB8Cufgs2iTdcXDmSHCWrAmcHWxp/vbUXbFdEqSKr7q1nW72zISREpzFLViw4tsVGyx
         DU9rUNtrHP3TI/hhbQ/7KifsmUaPuCiFndU9YC3cWDwhiA6RnoIZx3XcL8QqLZkVL63b
         Z/5dA9iAeuN5v8ofJ3APZUpeoU6DW/BCl42znvkBl2IFALP5lIvBU5lsVgglfxgWYgzI
         GYPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBrzjgpG98uje6mzUSxgO8V0tVRnG3y4SzqDwDcvJv6Ej8A5CuTMSsHhqGfd+XxiVm7Gh11jPaO97n@vger.kernel.org
X-Gm-Message-State: AOJu0Yy727D9aqq30ssCHnErA3bLHGc50Bax12R6bFsxEAbygx/sa2CA
	tLEr5A36A9SeIQPgW2St7SMG4KA3dDupId6fdiYdrfDiittE8/KdanAoy/sT20B+xUcU50xH1FU
	JhuNCXBmxqKEDJtsDkDh/fHiwBghTEwVc1HzIj5GtDV0lPzcTBDFiX/or/Z1HfTbw
X-Gm-Gg: ASbGncvvm3nnQFqo89MSkJAI28yKWYBdekKsUgNE7lCN5s4UDT4d2cpy1XHFVwlqw9U
	eHOGlCkFM/dxIKo+7yMBczMwn4Pf+jgGMPF11Dcp5cfbrTh+dk9Rs46ngEVWnTiu+ddrsrpQGsT
	gGdHr0G29A/fei0qsCKaxh2tm+o4+Graz576kIhur5qrrb4bOWqpV3VOGN4g1/yiwcMrz1ogTCH
	/03T/R9+NZwEiJpoI1LdKd0W6G9BMmBhTtzm+DTlXn2XCnOXQ/55m81vOpIq3vJfbXp0lkGkFjs
	NXwsOpDOiGpsucwgYJUWPNJUHz34bGKDZEZsKF1F1DbczvKhDTVj+2rtD3BJQeoUP9/o9ihx5Mg
	Ev1UM81rYabcFJKXT909FWE3Cxz/dE5v5wSZXg+4ZlTDxIqyad/U9Fid+bAPt
X-Received: by 2002:a17:902:e78f:b0:235:f18f:2924 with SMTP id d9443c01a7336-23e256cb9cemr283268895ad.15.1753115555595;
        Mon, 21 Jul 2025 09:32:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3NQYYiVYoznbNv5JLCgaLLFtJn/nVCow8GXu2GSQlUcHv6MMF0TUT/ue4p1hHS3WNIS0yiA==
X-Received: by 2002:a17:902:e78f:b0:235:f18f:2924 with SMTP id d9443c01a7336-23e256cb9cemr283268455ad.15.1753115555128;
        Mon, 21 Jul 2025 09:32:35 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3c3b2c4esm59893255ad.189.2025.07.21.09.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 09:32:34 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl bindings
Date: Mon, 21 Jul 2025 22:02:20 +0530
Message-Id: <20250721163221.310746-2-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250721163221.310746-1-pankaj.patil@oss.qualcomm.com>
References: <20250721163221.310746-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687e6ba4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=u--hiq7dTte3EtGYD-cA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: uPk0GxQUO7w8yqNxFbJ-2d6vuleoDnJ2
X-Proofpoint-ORIG-GUID: uPk0GxQUO7w8yqNxFbJ-2d6vuleoDnJ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE0NiBTYWx0ZWRfX9bGqYAuID0PI
 tUffqLhgtjZIUja6e4LIALd82UOramvH62H2gLTn31rUVUZER8d5GKfrNC874GJwdbuX36Wcdca
 ybE05DNOT7sUZE3cwf7IX1iIVRDmbM8Ukzb6YE2gPJGj0b3ToGz6V+X/cY1Fr2KW+uqbf0lGz+7
 PWdgGDAk6DaSZqkzj0FxHscbE+A5ls84A7vTJxSTwuKF8Pl1UC6WRKpyuTE5XNx/l6yJ4pmbXWD
 Tywui6QrgafCr12oRbYxveve8I4v7s6k3qycsXAFzWySfSFaErdnoxdTMyXi6MHIJl6+ROLUD5j
 MVn3FRggLfIesh4FxvTYtlCc1CPAJpMgmzUlbiDgwbuOJc3E5ju97gws97VS1f7cZu2HXolY2il
 kdeBJH4fDmg8RA6aip168RFFO9CivIiGsTuhsMRI86vKTrtDjjPohGF5A9Uqfb2XF7Mv+eXg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210146

Add DeviceTree binding for Glymur SoC TLMM block

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Changes in v3:
Fixed indentation for example tlmm node

Changes in v2:
Updated gpio-line-names maxItems to 250
Fixed example node reg property

.../bindings/pinctrl/qcom,glymur-tlmm.yaml    | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
new file mode 100644
index 000000000000..25ec99bde59d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,glymur-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Glymur TLMM block
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Glymur SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,glymur-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 119
+
+  gpio-line-names:
+    maxItems: 250
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-glymur-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-glymur-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-glymur-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, RESOUT_GPIO_N, aoss_cti, asc_cci, atest_char, atest_usb, audio_ext_mclk0,
+                audio_ext_mclk1, audio_ref_clk, cam_asc_mclk4, cam_mclk, cci_async_in, cci_i2c_scl,
+                cci_i2c_sda, cci_timer, cmu_rng, cri_trng, dbg_out_clk, ddr_bist_complete,
+                ddr_bist_fail, ddr_bist_start, ddr_bist_stop, ddr_pxi, edp0_hot, edp0_lcd,
+                edp1_lcd, egpio, eusb0_ac_en, eusb1_ac_en, eusb2_ac_en, eusb3_ac_en, eusb5_ac_en,
+                eusb6_ac_en, gcc_gp1, gcc_gp2, gcc_gp3, host2wlan_sol, i2c0_s_scl, i2c0_s_sda,
+                i2s0_data, i2s0_sck, i2s0_ws, i2s1_data, i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist,
+                mdp_vsync_out, mdp_vsync_e, mdp_vsync_p, mdp_vsync_s, pcie3a_clk, pcie3a_rst_n,
+                pcie3b_clk, pcie4_clk_req_n, pcie5_clk_req_n, pcie6_clk_req_n, phase_flag,
+                pll_bist_sync, pll_clk_aux, pmc_oca_n, pmc_uva_n, prng_rosc, qdss_cti, qdss_gpio,
+                qspi, qup0_se0, qup0_se1, qup0_se2, qup0_se3_l0, qup0_se3, qup0_se4, qup0_se5,
+                qup0_se6, qup0_se7, qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4, qup1_se5,
+                qup1_se6, qup1_se7, qup2_se0, qup2_se1, qup2_se2, qup2_se3, qup2_se4, qup2_se5,
+                qup2_se6, qup2_se7, qup3_se0, qup3_se1, sd_write_protect, sdc4_clk,
+                sdc4_cmd, sdc4_data, smb_acok_n, sys_throttle, tb_trig_sdc2, tb_trig_sdc4,
+                tmess_prng, tsense_pwm, tsense_therm, usb0_dp, usb0_phy_ps, usb0_sbrx, usb0_sbtx,
+                usb0_tmu, usb1_dbg, usb1_dp, usb1_phy_ps, usb1_sbrx, usb1_sbtx, usb1_tmu, usb2_dp,
+                usb2_phy_ps, usb2_sbrx, usb2_sbtx, usb2_tmu, vsense_trigger_mirnat, wcn_sw,
+                wcn_sw_ctrl ]
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
+        compatible = "qcom,glymur-tlmm";
+        reg = <0x0f100000 0xf00000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 249>;
+        wakeup-parent = <&pdc>;
+        gpio-reserved-ranges = <4 4>, <10 2>, <33 3>, <44 4>;
+        qup_uart21_default: qup-uart21-default-state {
+            tx-pins {
+                pins = "gpio86";
+                function = "qup2_se5";
+                drive-strength = <2>;
+                bias-disable;
+            };
+
+            rx-pins {
+                pins = "gpio87";
+                function = "qup2_se5";
+                drive-strength = <2>;
+                bias-disable;
+            };
+        };
+    };
+...
-- 
2.34.1


