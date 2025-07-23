Return-Path: <linux-gpio+bounces-23682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D058B0F001
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 12:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EC805833F3
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 10:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DAD2D3A89;
	Wed, 23 Jul 2025 10:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfHpLglp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF9B2BD58E
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 10:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267033; cv=none; b=HKsndkcgtEStbbAb77fJQmdxYsf/zx+Qj2WXuSsj6bB+giXGPOh6NfYKQTAQ3Gy6V2LNHQVQ5BIRh6z891cKQKfwg35hPsNn5q5O0bZz5OnUsDEjZdmH36TS9v8Ksr38OSM/Pm/SsLZnsrmmauWDOsmeRyxz2FLloBzJiztYCFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267033; c=relaxed/simple;
	bh=LVNg2Q2O+pFfknd8M9tmBYGR3cuA1JPNjB0AsEwAFhw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XoPlcrzYKQ1fkxA/ucb7W/jiynXWPWimm3NV5O7lvWyrGICBWaBPWRTfN/JbjX9uKCC6rUxjk7AZjL/0u0ErOotQMievJCkCi1KMNvjlG8QzvFoYzr1WAhJuXrPVqnyqkIJFlg5hZJ2BJvQg8iEUBNdyuAFTWicbm30dpk5RYtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GfHpLglp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9Ps4k031341
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 10:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FlrT8Y+9FXC
	vRqpO942xG/ERKUUQGwNuz/enNNd3ois=; b=GfHpLglpyrHWWgxGAGKP/5hgj65
	MLPMW1CuW/NQMCU4Kgqw5Tk+etDDobJwA5ggBYwp2nP0YUx5x925T7EOZs01Y5VN
	VVwWsmY65eLZU2OCQzChBHACGuaVJWNUYEIDn7LH5KCiEj8SOa5eciL498qunwJg
	JCjZ9ekJ95tsk7oaJwWpnxCX+xy7tyCs1mLxwiloH/FFmfl74fRdrOtTayqtvs12
	wEEcxqYKWuH5FanydArTRKmm5j5QZzIcjOkRVZd70HUOz25dInmqfKHkB2IxnKfa
	jh5owvqBX2r9WGWPwg8gwUDMMEB6mCwj3uqOc/BbzIeuNPx0DwZevVvCidw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s4u2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 10:37:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b38d8ee46a5so819701a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 03:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267026; x=1753871826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FlrT8Y+9FXCvRqpO942xG/ERKUUQGwNuz/enNNd3ois=;
        b=DqU2cgczQXPQiEqoFSw2xLrGSvdheSMkl9QKbWc3xsCdrZf7ICVIhA03Ct0+L0Qwsr
         eOJN3en8FJSyuDuDlFffZwWAxBuj14634c2eNi9FimZ+DZ9SHXyJlzvyzdVuQREo4YAa
         /R5Gf+30CXdu6OrH1G0v7HyFKN7MMrDapmLeYE7l/Akl2QV/TuVW7Xysc4twJUW40P6M
         wy4g8e9/Pkw9QPBdAB3+IeO//M4UXCqp/70OFSngcgpJ/c8RHY1HVoOQ0Uv88RDQjVXX
         MmI7FMniuHNCw+yt9y9qZiBGOqIJmLzZwQHqyhw5QY+DkRXIVOpPyYNoNkNiR9HqpguH
         RUkg==
X-Forwarded-Encrypted: i=1; AJvYcCVibNptx6HJOWviAnpuNniw2bnmWp9J0UrMC28bnslNkYZeTc8RjUbhTTx1SLRQbNVXYccJn1YxazF2@vger.kernel.org
X-Gm-Message-State: AOJu0YyjWky5du2/nbfwn+9ywfwFYP39KAHfbpR267V97peF3gBPDPhg
	iQIiIBzPfo8rF+GbRlYiyRRc3l8HDWR/+T60OL+GP+iUuNWBlgdeYcRXXQofLWNguuqJSOIqNcv
	F/ZHE8Cx5pINgV1v5oknacrFm9o4fSJIkyruGCUwqXR9b2DvcVz2aL7mPaFZey2XG
X-Gm-Gg: ASbGncv1MyhwDuuIZCRWokalZG1r23bXYi0FafPmTuSWjtDK1aXnsbycysVCP8CElyZ
	qnX6HW2f88KLvQg8bO2ILk1pobLMiwvfnuPo6c8e2m+4SspDsxDnoMA2d3WRzLrcahhgTZfeW3t
	zYkmZIzRjBr2X64du7YoqJa/n+7Ti9B1O7GLC0kF/uG9F1ibiVVNc6vRimAdKp0z5irsKoEJGSg
	Js83d2ZHVwsBdWkkLNWTzcPkkAtTsRD+mmCly2MPmAI5iAE06mDMBrpHMYEaXVvqswgqn+UHjoW
	NQCPvxPS7iVv05Cx9i4tuEsyCbDI8gXMuRTO/4wgziEACWIlHTD66bRwJKwUBbmYlJ74yZqedLf
	SnvAWq9e6kRREq9A3mxdFFjGjiiC0YingJzJWoTs85DGRiH9+tSDUyv1uZXa7
X-Received: by 2002:a05:6300:6141:b0:238:351a:f95f with SMTP id adf61e73a8af0-23d48ead3b8mr3594461637.22.1753267025620;
        Wed, 23 Jul 2025 03:37:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+STtEf2ZKozXNR0Q2hWZWs4URKYbpvEpcSQk8WkIj82o9SKmWQtKYke/Sx0wwkrPRzJMi+A==
X-Received: by 2002:a05:6300:6141:b0:238:351a:f95f with SMTP id adf61e73a8af0-23d48ead3b8mr3594422637.22.1753267025113;
        Wed, 23 Jul 2025 03:37:05 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb678f21sm9458954b3a.104.2025.07.23.03.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 03:37:04 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl bindings
Date: Wed, 23 Jul 2025 16:06:43 +0530
Message-Id: <20250723103644.4058213-2-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723103644.4058213-1-pankaj.patil@oss.qualcomm.com>
References: <20250723103644.4058213-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OSBTYWx0ZWRfX78fyss2F3IyF
 gLkdXgz6vGSQ8sT59BNHgs0X/zR9Zn9lFJHjBDqUFUbNWxpMoU63ff5eB4c4zJGxFXr3PXMfnZI
 r8/cqBbfWvYBC3KCoKNIX4kwrbnxr1lvRCixXJGERj1IswCfVdN1QEeRjN/w6eAII17em/L8faa
 FFVVC5Gg5WWnuzqgzSZju8rtDMkGmZDfCr4qyuBlSgpJG9CW44JXYzWZOkK0m9z9aSWJMH9eeco
 eFAbNGiLkkaoWbMQI/2FJXubt8HhO4hNrQfJsidqulU6jzvgCujdehH1fV8fFAjTzy7vi8LDBQ0
 /AeZJjTZH8FCYnt5WI/xfuV0D7jvNf1fbMGogkkqj4R6UuUDUsO2FCmIj61ZZMw8RcW77ghIL/V
 4PfiTSU73BKR9SsMC/iRKF1oRnZGdwBGo65gxqCGPmSWKB6VbPJ1fsS5t7LhdoCNoWBqsPNR
X-Proofpoint-ORIG-GUID: cbN_oUBOakhldjNNKUUB_RywaV8Xa7tM
X-Proofpoint-GUID: cbN_oUBOakhldjNNKUUB_RywaV8Xa7tM
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=6880bb52 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=MZc3Y3F7moGl6OQG0A0A:9
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230089

Add DeviceTree binding for Glymur SoC TLMM block

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Changes in v4:
Updated enum in bindings to line length of 80 char

Changes in v3:
Fixed indentation for example tlmm node

Changes in v2:
Updated gpio-line-names maxItems to 250
Fixed example node reg property
 .../bindings/pinctrl/qcom,glymur-tlmm.yaml    | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
new file mode 100644
index 000000000000..38c360e77fa3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
@@ -0,0 +1,133 @@
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
+        enum: [ gpio, RESOUT_GPIO_N, aoss_cti, asc_cci, atest_char, atest_usb,
+                audio_ext_mclk0, audio_ext_mclk1, audio_ref_clk, cam_asc_mclk4,
+                cam_mclk, cci_async_in, cci_i2c_scl, cci_i2c_sda, cci_timer,
+                cmu_rng, cri_trng, dbg_out_clk, ddr_bist_complete,
+                ddr_bist_fail, ddr_bist_start, ddr_bist_stop, ddr_pxi,
+                edp0_hot, edp0_lcd, edp1_lcd, egpio, eusb0_ac_en, eusb1_ac_en,
+                eusb2_ac_en, eusb3_ac_en, eusb5_ac_en, eusb6_ac_en, gcc_gp1,
+                gcc_gp2, gcc_gp3, host2wlan_sol, i2c0_s_scl, i2c0_s_sda,
+                i2s0_data, i2s0_sck, i2s0_ws, i2s1_data, i2s1_sck, i2s1_ws,
+                ibi_i3c, jitter_bist, mdp_vsync_out, mdp_vsync_e, mdp_vsync_p,
+                mdp_vsync_s, pcie3a_clk, pcie3a_rst_n, pcie3b_clk,
+                pcie4_clk_req_n, pcie5_clk_req_n, pcie6_clk_req_n, phase_flag,
+                pll_bist_sync, pll_clk_aux, pmc_oca_n, pmc_uva_n, prng_rosc,
+                qdss_cti, qdss_gpio, qspi, qup0_se0, qup0_se1, qup0_se2,
+                qup0_se3_l0, qup0_se3, qup0_se4, qup0_se5, qup0_se6, qup0_se7,
+                qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4, qup1_se5,
+                qup1_se6, qup1_se7, qup2_se0, qup2_se1, qup2_se2, qup2_se3,
+                qup2_se4, qup2_se5, qup2_se6, qup2_se7, qup3_se0, qup3_se1,
+                sd_write_protect, sdc4_clk, sdc4_cmd, sdc4_data, smb_acok_n,
+                sys_throttle, tb_trig_sdc2, tb_trig_sdc4, tmess_prng,
+                tsense_pwm, tsense_therm, usb0_dp, usb0_phy_ps, usb0_sbrx,
+                usb0_sbtx, usb0_tmu, usb1_dbg, usb1_dp, usb1_phy_ps, usb1_sbrx,
+                usb1_sbtx, usb1_tmu, usb2_dp, usb2_phy_ps, usb2_sbrx, usb2_sbtx,
+                usb2_tmu, vsense_trigger_mirnat, wcn_sw, wcn_sw_ctrl ]
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


