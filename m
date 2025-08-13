Return-Path: <linux-gpio+bounces-24332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D164DB241FE
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 08:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8A935820F9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 06:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624232D640E;
	Wed, 13 Aug 2025 06:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjWwb0n6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9601B2BF3DB
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 06:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755068147; cv=none; b=hI2rUNRjA+dgMtAOl2NCRaXYp3u2i/jql5lH9V0nWy2MoStfNaiRumi1vwR+q/xKO2XroffbjIUzqb00Vf5woFWNI6UNFeoKYcgJdiaUUQer3r+2KLFUtlRE61P3yP6bP+adaMV/cet7R71k/fu1BtV1NQ7oH9E9DwtcJzCATh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755068147; c=relaxed/simple;
	bh=fZRjkfryGLDhunCUT4Zm4JZR0xAp7bxFln/eaoRRZTE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fw3dnvwQ0++sAmL4qP7MdlPTCBkeloUzRjuN741ZhRXcJQA2b8OHai2XZVca7B20AiErMMDFQUSd2P9YMb9CTxtHazwz7uChKgi7qUco249a/5RX2mhnjhJRdHoslOvofgrNHHQCZ1yVtNL37BYQmFCfZUJ5Jvk4ZrNXBwysBUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjWwb0n6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mHGd029839
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 06:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O96nRpCTZB+
	fHvrTBkpEIpXYmLmfqZGI8qQehacpjpk=; b=KjWwb0n6RDZMN7CY8oDMgJnTWL5
	FU7Dyf80+nF0IWjXothLx3q1qKVNcJz1hM66eg1VWEf5crE3rb0Yk/BzjaN0g74B
	EKp6yfFH9l8XQPymOp+M3mZO7NgyljK4Y44cScBo5ctS8hdeNQt6UrwrJh7OMayw
	5peK7MwUEp7zQqJreaC9P9T/X2NMbnSQ4Q0EXTDadIZ3a85YWNuiS8EYAjAJ7Tio
	S2/Q82iCyDQY0VSC54TQKIM/Q7auiUzSHP2p/hNJAbWW1Ak1e4g99jg3E+WbE69s
	8a3GMT/Cq6vXi3EAqXLbVgL6sRMy5B3hkyyqTUysrHU/Vtji8f3fl29srUg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gasjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 06:55:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23fe984fe57so97195855ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 23:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755068144; x=1755672944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O96nRpCTZB+fHvrTBkpEIpXYmLmfqZGI8qQehacpjpk=;
        b=twvDyVzRZYOH56zhHJQ8skw4xhnc2dsaZqRaZBDCU6pr9xf/Fwx2QNZicndvmBe9bf
         5x7zqhQ/d65+5Tu2oPVt/+5qvy1R2mFeBs3XjnW1XVGvAiupdLmn+ngkzMFSi21mRlxB
         riCtBCKkN3ht5jt9YNM4DJ+uO+dp484mZFDaLDMi0mjt6ZluMPCsN1MXHXlT5Hp2ddHA
         7nE4MVg+8diJ2Jy7yUGbHV+bnT6962Vij9iUBERBLuzIuomAEjtz+gzp+aHJ/YoqMS4x
         baMxzs7AbnifHHGhK5g6MUruAXSTnVDbLWpcYOwlp1Y7BZDkYHbpRbT1Fku+I6gAgwL+
         DzVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp74b4v9wjhcEvaWGQjO4XsuIAaUS7+tiDfr25d9Y/CRHYU75H/ROCZY+UyRZ8z0/gMRjkq0qSNnp4@vger.kernel.org
X-Gm-Message-State: AOJu0YzXfy37cGBgJAfQOaXkhTvWEAaLMGhrahUSHdUuJzkTThLf2GTs
	G1rX5zvTTTX4BHerLanHwYEhCTfu3tcIAKaq9MsrB8KhAM9FZOqh9X2LjxenyOMEsfWc+UG9rlF
	jQQFLUrSbuIqatZAi/fE8JkQoPFOEcN7QIfL0kKmvxi+lEx5xlJQyHQqQj6rwQaQM
X-Gm-Gg: ASbGncst8Zt0LAGu2FNgpva09rF+hFHTAw6PCpfunxn3t/tJl7sWdaypFkwem8VHHLY
	5Q//eXxmQhEmmusmGZQWtkFeYJl/RPiCueq6x4ItP8+eYYrlBNw1Svz3jxG1XbpUPKUZpL2K52a
	aMtsXieb5nAo6K4eIRWNoBIjXD4574dtKiZ0KZH61qO3aV3s8j5bBkp11laXrYdHwpWS2IRYYIw
	2dZMrSspzjQeQbjzO5Vk/2sh4pj/JaE9F3cN1y9otkoW1G0hAEyI3xeJDDJh8kGK/iN7KWz5SIL
	IPsycXo/QR2i/PxzRGBJxStNyu2wIfTTIp2tdU0i5GRJgPS1taHbJBsKPnS90qEvaMo0pi1ck5p
	tFxOoADuTODm1ci6f58TU55D/92NJMsSRm22tVKllSPsOqHRhhk3ME0+HSwTu
X-Received: by 2002:a17:902:e542:b0:240:2bb6:d4ae with SMTP id d9443c01a7336-2430d1a1154mr25320235ad.30.1755068143751;
        Tue, 12 Aug 2025 23:55:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFByh8s6wGqnmZ4DTELrCUwP7wwp9NTsvOVewRWRxJMawj3doZwZWp5ApV+EJhQM+WIPz+xwg==
X-Received: by 2002:a17:902:e542:b0:240:2bb6:d4ae with SMTP id d9443c01a7336-2430d1a1154mr25319925ad.30.1755068143275;
        Tue, 12 Aug 2025 23:55:43 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899aa1asm315958875ad.122.2025.08.12.23.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:55:42 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        rajendra.nayak@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl bindings
Date: Wed, 13 Aug 2025 12:25:32 +0530
Message-Id: <20250813065533.3959018-2-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813065533.3959018-1-pankaj.patil@oss.qualcomm.com>
References: <20250813065533.3959018-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689c36f0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=MZc3Y3F7moGl6OQG0A0A:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX5rdZhm/rc1TK
 /d+BUnUhDIF0TNY9WTfrlvAJbCWNJ40tBdX4MJFTawJROudAQBidt4Px/WJvhn0NBCsrpLLR/eo
 tS50/CotcXCClcGZwaaAlqsPc1yQOX71nlMg+AEJNp14v4XBLxZU3cURbHZsGi+ppdbrMLtOBzy
 6wr1dYXRrwq/vRwWIJVMVYJowBmAH/ciovlPGvM9B7UYTqmSU7iHMM3DiC/m1L1ZZVqk8t/RpGe
 YQW3QY8Kk0w0JYKa+YLGNJWmVYqpvgJj4All17K2B4jG+dIwSmV8FCXRxkTmB+6Ec4Un0oRn77F
 0dLPXqyBUt4WHUqazVMF4YGVM4/Y3zIvORgLD7Jc+TBsgWHQRnTzD9etr6C3KXcu0AI23xWUI+7
 Va1iEdHj
X-Proofpoint-GUID: h6vbqEVYpeZPXbTNs1tDVcMKnZWs--gN
X-Proofpoint-ORIG-GUID: h6vbqEVYpeZPXbTNs1tDVcMKnZWs--gN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

Add DeviceTree binding for Glymur SoC TLMM block

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Changes in v5:
Rebased on top of v6.17-rc1
Updated RESOUT_GPIO_N function in enum to lowercase

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
index 000000000000..daa5e94fc3fd
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
+        enum: [ gpio, resout_gpio_n, aoss_cti, asc_cci, atest_char, atest_usb,
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


