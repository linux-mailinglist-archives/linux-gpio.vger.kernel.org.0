Return-Path: <linux-gpio+bounces-25686-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD1EB45BD9
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 17:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 570817A1B0A
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 15:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC9331B81C;
	Fri,  5 Sep 2025 15:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="He9so3ob"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0201531B821
	for <linux-gpio@vger.kernel.org>; Fri,  5 Sep 2025 15:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757085065; cv=none; b=unKH2XlhsHl1Nw14uQx7UBzwBr69re/PnrfxuZj4aXncHfmO7nuI6EHa4m1u82IWhceRknK+v/pxjV3SOQMgyxCYOf1tZCznIeznUGjT7/DdRPQZvyiM66WJfTZxlRBjuZ3dM4BRQpUyVfKiYysUQcp6m/lv73enJvm7P0hgCyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757085065; c=relaxed/simple;
	bh=ziDnWoycYd1qxQD9/2fyvxl+OlWCnDcd+2Qkw8aGVVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rmM4kog5W9h6D6/r3GcCqYt+333Mv6qNlJq1WrcFWzYeoH+BGmaKxsQOAzN8uy4fmrq6KZQo+rU3UKqTI2wKWVRf82YXYvXrMiBXvDoRikWCN/hoJuV/Azr0NLvsc200hp7GCRFeicO3L+ulqpwApqSTj9pi3kIqptRCQ51shv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=He9so3ob; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58591OCv022479
	for <linux-gpio@vger.kernel.org>; Fri, 5 Sep 2025 15:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hQgI8oejIfeOTP8ExFldKXK3j+KseUYehUnwe2t70qo=; b=He9so3obLRgG/E4O
	RAjgOpx+fskCVgh9PhtJuaexxPE8wRJ08DUOf294RJrkgXZrry/mLj/fmlyNbga5
	O5fJC1nTCupobtsvm9kXJSvzv8g30/2cGJhiGLJHYOwOkrV2q3GHSZzzHewIwSNn
	remhg0ljcGXsQcloz2dwzkB/xAPUBxJkAEH3xIL45qtD5q8+3lmGJDcFxB1ELYKP
	9ujFk8dceu1RDVln1Kh2PdlCuS0JEbCHEN3U61CaydX8YeHJ3G5PmiY/tm2Iu5gg
	3hnjvWFOBcn4vdBqgR7k7Y7+NzF3oB6zwQeSvN7evvCxLjAwstkH3mi7L/+zXyUg
	QpQtgQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj7u1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2025 15:11:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4f738792b0so3202765a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2025 08:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757085062; x=1757689862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQgI8oejIfeOTP8ExFldKXK3j+KseUYehUnwe2t70qo=;
        b=QV+o/YA2zUCEggZTTw0KeplIN/O1gvVzNsYMrovFzKrJNv/Rwt/FbCI2WqdFzOl6r5
         yGoRYyvPwdHgVZ9f8gbk7sE0ZmFfr1otD02kxxfQ28hunNMTowbe7r5dS68j7HHEVMCj
         Xz/jRFYzjTsqpPau7Q9aZO4+iyRrFyNpLihdjksVGjByN4X0Y+UsTIpf8ZAHYyy3b1+n
         Ksdd/RGk1449TTv7Vi/9DH3AuthfUL6S7vQ5Lu/CWgv7gD4XS/PAP5HybF+TQpslKXOM
         s1QbA2uU+Ql0utdofLYM0lZss+Mgv1CQJYnDZkBLzgmAchW9/dRrEU2hgEJUQOlKtXkA
         0msw==
X-Forwarded-Encrypted: i=1; AJvYcCUwVrnRLyqaqr0PLM+cf4FkLgwzUV67OaxzLsyBKNg/t0akhzzdVOfXMgPM8HpWMveAhMRGnUAUnobS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Vr1R67tu+8sAl6uHjNnxFMnlHIAMVAZ42F1LoVVe+7xBSPUx
	N5GCZyIXgZiPzDqSnPIt1/E6pYT0Ep2wtF5m10Uva3eRhR2gOCd/ll0q4sqBVsVsvqFZ96PhiRp
	iCq0KIOM5JUIgup8y9s19gXQvz2H3iOyvusJBkfCvdkzpBwfL15eJVCSkg1ws0euu
X-Gm-Gg: ASbGncvFIpIzu+mOH2nwvUloT5GEsG7NyFil2XUqfmiWl03hrvodjnLQniU6zUwAktQ
	DUhkvXffSc0lE6meAjvmGHRz+Xl3d6Pzmml5tjkNCLPorQfaTv0pX2C7JcAaFTTYVR45GpUxx9p
	dTSZu1mxxjwobw8WMS00GDlL2HSKsabxnUxammrmNyF82v/uPoFGza9hyhvvwWn8G6yXKTj11m/
	yAUCi9giBXKSx492S9oY1qqFb7Gxp3NMho0M/Uma0lnkgJi5gqEseG94nDOdRoXKzCoUwSuafL0
	JTJKtZtov6DE8G+VGOhO8D/5uKMiaOEJyyI5fuqnPkmakfbChGE9N/svMRAOY/YJ5A0j0V0DNE0
	s3cGeAQAeKAyZ4kwWyP0oPFbXvY1A+sGPA0Z2uUZ29lmJZ2vGeIwKDeJdo0PV
X-Received: by 2002:a17:903:1a0e:b0:246:cf6a:f00f with SMTP id d9443c01a7336-24944a9b4b4mr341698005ad.31.1757085062286;
        Fri, 05 Sep 2025 08:11:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG94V3mKWvpf4i8JK87uKEbMYMX3NLPqJTttOkJh4d/8dbmvUu+0qi2eu+IQPWQ9DPLPKYFAw==
X-Received: by 2002:a17:903:1a0e:b0:246:cf6a:f00f with SMTP id d9443c01a7336-24944a9b4b4mr341697365ad.31.1757085061796;
        Fri, 05 Sep 2025 08:11:01 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f5a0bf9sm29279908a91.13.2025.09.05.08.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:11:01 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 20:40:19 +0530
Subject: [PATCH v6 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-v6_tlmm-v6-1-1720e5080415@oss.qualcomm.com>
References: <20250905-v6_tlmm-v6-0-1720e5080415@oss.qualcomm.com>
In-Reply-To: <20250905-v6_tlmm-v6-0-1720e5080415@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, rajendra.nayak@oss.qualcomm.com
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX3QwZBYrfM4jS
 VW5LWs89SimGiBMw4fQ0mwznPAVYnP+N4qX5HshHotiGn4yJKXKku2rac+0EiV/cx8VJAxapiCP
 +qN79/K4yP8i1ClPWhSbVSdSuzhvjCON9xBXwyU00SBegsTwxu0Gon51bcm7fzn3B/0ytqJ5aoN
 GbyA5X9eCLKa9+GRVsDIu8AK7E1fsVlh/WGN8UZk6ovE+7bdNkinZld8ZAV2u/02AI+SHclezxd
 OWif/ftplYpcWsRP+TK57OXW3moDrhK9ot9sOrLhaEn6t75NCnYFS2MZsHBOJBg6fbyOQpLj9ch
 5RKXSu6vN7sUZ/hCzlPGzTz3Dk79LcJnpPhe9lKBo98GujAL7LF31Hd4Jgzsuzu8Yn3HGAbOtFj
 3fWxPdpv
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68bafd87 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=u--hiq7dTte3EtGYD-cA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7tvirwC9JV6BlZ4HJ39GjKIAGL2Svk8Q
X-Proofpoint-ORIG-GUID: 7tvirwC9JV6BlZ4HJ39GjKIAGL2Svk8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

Add DeviceTree binding for Glymur SoC TLMM block

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,glymur-tlmm.yaml         | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d2b0cfeffb501e0b22c616e5debf52c960afcbd5
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
+    maxItems: 125
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


