Return-Path: <linux-gpio+bounces-8141-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C53392BFEC
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 18:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32586281842
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 16:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A411ACE84;
	Tue,  9 Jul 2024 16:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNGTmAyL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539641AC44C
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jul 2024 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542062; cv=none; b=Rl0ZcwI989jwBk95zuL7Tf7DLQ6L4zxIi/OiGoGiz4uEQ2C8sGjPuFB/mn/uvT0ESniaQDf4iRBcNH0NAj9FuIrORMskfu/DxI+W6rEXiOH6IN9Et+m1w2biVjXYjAOmxVHlFjQwcb1362ADmOhRWbke1uh2qaNoX5eNxyZEBlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542062; c=relaxed/simple;
	bh=K5IDHOGwur5M1wxz6gR+ee2Yecqq87yweHl0ice3ziY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGNB1wzf0Rb83jnfdRQlZhooxu+cU5EPtzSFQDA1eUFojTjEpB7fYp4xm5w1P4pysgiu61QatRncypxpbno0MF6oqcjkkD294pOXxT56wTtPwV+MXeds9WH3wLZ+JFm4PT1qeRSfFvSHkOJWzEgkuf09etFaW0Np6aGXMBUOCcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WNGTmAyL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-426717a2d12so7201535e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2024 09:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720542059; x=1721146859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZURG4DQ86OmYUEBMJ73gjiu+OgC68nhtpPKYr4JjTk=;
        b=WNGTmAyLKztkkcKDTtXHrg7WgBuD4WP/YUklpOIiFvCa4fU9/G8rP8vwzHIOvNjrpf
         n95Rf9eYxSc1hexXaSZAk1xc6lMI8D9a8bQEfuDSV2FGav8DsPnr3GXYcbtejLBdn8KT
         hD2tMcM/KO6W0ldJJdCdp4+oaPNxxvpHfyfdQC5xx2bF/GAwn4qreBx8ruG5lbDJu4nK
         OUgf90nXwW5NEysCdgziu3QL2qdrKNacavmVGsvYNzY5okSm3ETAuE4VgkavF09IaMjL
         LalontQ1CpQCqZ5RUrn+K3WdSodnFwpdvqiq49VvMIH0K3q9x3juQ0JCpDnPZ5X9TO7N
         z0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720542059; x=1721146859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZURG4DQ86OmYUEBMJ73gjiu+OgC68nhtpPKYr4JjTk=;
        b=ebwgbmD7OrTSO647CFn3EjSbvPWp3/JfvXLYVg27LJdt8XcZF722AEJk4esxsG0G43
         NPln847uuquzZjMxS97zOEgim3Eh930gtBmDK4Ae6fdARvpSBjIVTBMcKRui1kTM5eIh
         y4ZzUW1EjJlAQXL/Xh6wM5SbGC7wdy0ZzIHm/HfJvTl78uRVqSBaZtzP0Cu4JmWIAbfE
         s5b4SKdjm/W92hUDsZVsIUNIHu9cD3xlEAUiWUiHChZ+IzL8psgLnkRgVydPHh9sSVze
         gzAqdGS2WKatJwtuD1tHPZjUOMUZ5yw8irxu4zY6TtqOr+n6PjcNPQw3p+oUBwgCR7IO
         xZgg==
X-Forwarded-Encrypted: i=1; AJvYcCUc7sU39PP2CcRA7v5ZlVfHJT2ZHL13/rWmfoITjzU6kHzG3Q0DXKRjzQ4oYxWhCVnF5rAIiXUdWnomRskksVULvOebs1X1jc8m2g==
X-Gm-Message-State: AOJu0YxgvnpdzlqdHtiwHGsj411X6rOcYgYuX+sqZPllpaHOj6Oif8bd
	Ug1d4OKhZzmAJcz7lbFtP4SUv6UaCY7oYEyUD95LJIAWml8MwqlZW+KGP3KVRnk=
X-Google-Smtp-Source: AGHT+IHJe6Owzua4x6G16KkskCgOHlwfWxLCcRpIy7XL32/xCG893IE+O2YynuqUNB0HAJGA159CzA==
X-Received: by 2002:a05:600c:378d:b0:426:6981:1bd with SMTP id 5b1f17b1804b1-426722d4b4emr24632085e9.5.1720542058698;
        Tue, 09 Jul 2024 09:20:58 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7e07fsm2966955f8f.17.2024.07.09.09.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 09:20:58 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 4/4] dt-bindings: pinctrl: qcom,apq8084-pinctrl: convert to dtschema
Date: Tue,  9 Jul 2024 17:17:56 +0100
Message-ID: <20240709162009.5166-5-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709162009.5166-1-rayyan.ansari@linaro.org>
References: <20240709162009.5166-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Qualcomm APQ8084 TLMM block bindings from text to yaml dt
schema format.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 .../bindings/pinctrl/qcom,apq8084-pinctrl.txt | 188 ------------------
 .../pinctrl/qcom,apq8084-pinctrl.yaml         | 129 ++++++++++++
 2 files changed, 129 insertions(+), 188 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt
deleted file mode 100644
index c9782397ff14..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt
+++ /dev/null
@@ -1,188 +0,0 @@
-Qualcomm APQ8084 TLMM block
-
-This binding describes the Top Level Mode Multiplexer block found in the
-MSM8960 platform.
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be "qcom,apq8084-pinctrl"
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: the base address and size of the TLMM register space.
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: should specify the TLMM summary IRQ.
-
-- interrupt-controller:
-	Usage: required
-	Value type: <none>
-	Definition: identifies this node as an interrupt controller
-
-- #interrupt-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: must be 2. Specifying the pin number and flags, as defined
-		    in <dt-bindings/interrupt-controller/irq.h>
-
-- gpio-controller:
-	Usage: required
-	Value type: <none>
-	Definition: identifies this node as a gpio controller
-
-- #gpio-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: must be 2. Specifying the pin number and flags, as defined
-		    in <dt-bindings/gpio/gpio.h>
-
-- gpio-ranges:
-	Usage: required
-	Definition:  see ../gpio/gpio.txt
-
-- gpio-reserved-ranges:
-	Usage: optional
-	Definition: see ../gpio/gpio.txt
-
-Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
-a general description of GPIO and interrupt bindings.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-The pin configuration nodes act as a container for an arbitrary number of
-subnodes. Each of these subnodes represents some desired configuration for a
-pin, a group, or a list of pins or groups. This configuration can include the
-mux function to select on those pin(s)/group(s), and various pin configuration
-parameters, such as pull-up, drive strength, etc.
-
-
-PIN CONFIGURATION NODES:
-
-The name of each subnode is not important; all subnodes should be enumerated
-and processed purely based on their content.
-
-Each subnode only affects those parameters that are explicitly listed. In
-other words, a subnode that lists a mux function but no pin configuration
-parameters implies no information about any pin configuration parameters.
-Similarly, a pin subnode that describes a pullup parameter implies no
-information about e.g. the mux function.
-
-
-The following generic properties as defined in pinctrl-bindings.txt are valid
-to specify in a pin configuration subnode:
-
-- pins:
-	Usage: required
-	Value type: <string-array>
-	Definition: List of gpio pins affected by the properties specified in
-		    this subnode.  Valid pins are:
-		    gpio0-gpio146,
-		    sdc1_clk,
-		    sdc1_cmd,
-		    sdc1_data
-		    sdc2_clk,
-		    sdc2_cmd,
-		    sdc2_data
-
-- function:
-	Usage: required
-	Value type: <string>
-	Definition: Specify the alternative function to be configured for the
-		    specified pins. Functions are only valid for gpio pins.
-		    Valid values are:
-		    adsp_ext, audio_ref, blsp_i2c1, blsp_i2c2, blsp_i2c3,
-		    blsp_i2c4, blsp_i2c5, blsp_i2c6, blsp_i2c7, blsp_i2c8,
-		    blsp_i2c9, blsp_i2c10, blsp_i2c11, blsp_i2c12,
-		    blsp_spi1, blsp_spi2, blsp_spi3, blsp_spi4, blsp_spi5,
-		    blsp_spi6, blsp_spi7, blsp_spi8, blsp_spi9, blsp_spi10,
-		    blsp_spi11, blsp_spi12, blsp_uart1, blsp_uart2, blsp_uart3,
-		    blsp_uart4, blsp_uart5, blsp_uart6, blsp_uart7, blsp_uart8,
-		    blsp_uart9, blsp_uart10, blsp_uart11, blsp_uart12,
-		    blsp_uim1, blsp_uim2, blsp_uim3, blsp_uim4, blsp_uim5,
-		    blsp_uim6, blsp_uim7, blsp_uim8, blsp_uim9, blsp_uim10,
-		    blsp_uim11, blsp_uim12, cam_mclk0, cam_mclk1, cam_mclk2,
-		    cam_mclk3, cci_async, cci_async_in0, cci_i2c0, cci_i2c1,
-		    cci_timer0, cci_timer1, cci_timer2, cci_timer3, cci_timer4,
-		    edp_hpd, gcc_gp1, gcc_gp2, gcc_gp3, gcc_obt, gcc_vtt,i
-		    gp_mn, gp_pdm0, gp_pdm1, gp_pdm2, gp0_clk, gp1_clk, gpio,
-		    hdmi_cec, hdmi_ddc, hdmi_dtest, hdmi_hpd, hdmi_rcv, hsic,
-		    ldo_en, ldo_update, mdp_vsync, pci_e0, pci_e0_n, pci_e0_rst,
-		    pci_e1, pci_e1_rst, pci_e1_rst_n, pci_e1_clkreq_n, pri_mi2s,
-		    qua_mi2s, sata_act, sata_devsleep, sata_devsleep_n,
-		    sd_write, sdc_emmc_mode, sdc3, sdc4, sec_mi2s, slimbus,
-		    spdif_tx, spkr_i2s, spkr_i2s_ws, spss_geni, ter_mi2s, tsif1,
-		    tsif2, uim, uim_batt_alarm
-
-- bias-disable:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins should be configured as no pull.
-
-- bias-pull-down:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins should be configured as pull down.
-
-- bias-pull-up:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins should be configured as pull up.
-
-- output-high:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins are configured in output mode, driven
-		    high.
-		    Not valid for sdc pins.
-
-- output-low:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins are configured in output mode, driven
-		    low.
-		    Not valid for sdc pins.
-
-- drive-strength:
-	Usage: optional
-	Value type: <u32>
-	Definition: Selects the drive strength for the specified pins, in mA.
-		    Valid values are: 2, 4, 6, 8, 10, 12, 14 and 16
-
-Example:
-
-	tlmm: pinctrl@fd510000 {
-		compatible = "qcom,apq8084-pinctrl";
-		reg = <0xfd510000 0x4000>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-ranges = <&tlmm 0 0 147>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		interrupts = <0 208 0>;
-
-		uart2: uart2-default {
-			mux {
-				pins = "gpio4", "gpio5";
-				function = "blsp_uart2";
-			};
-
-			tx {
-				pins = "gpio4";
-				drive-strength = <4>;
-				bias-disable;
-			};
-
-			rx {
-				pins = "gpio5";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.yaml
new file mode 100644
index 000000000000..38877d8b97ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,apq8084-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. APQ8084 TLMM block
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: |
+  Top Level Mode Multiplexer pin controller in Qualcomm APQ8084 SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,apq8084-pinctrl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges: true
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-apq8084-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-apq8084-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-apq8084-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-3][0-9]|14[0-6])$"
+            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd,
+                      sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ adsp_ext, audio_ref, blsp_i2c1, blsp_i2c2, blsp_i2c3,
+                blsp_i2c4, blsp_i2c5, blsp_i2c6, blsp_i2c7, blsp_i2c8,
+                blsp_i2c9, blsp_i2c10, blsp_i2c11, blsp_i2c12,
+                blsp_spi1, blsp_spi1_cs1, blsp_spi1_cs2, blsp_spi1_cs3,
+                blsp_spi2, blsp_spi3, blsp_spi3_cs1, blsp_spi3_cs2,
+                blsp_spi3_cs3, blsp_spi4, blsp_spi5, blsp_spi6,
+                blsp_spi7, blsp_spi8, blsp_spi9, blsp_spi10,
+                blsp_spi10_cs1, blsp_spi10_cs2, blsp_spi10_cs3,
+                blsp_spi11, blsp_spi12, blsp_uart1, blsp_uart2,
+                blsp_uart3, blsp_uart4, blsp_uart5, blsp_uart6,
+                blsp_uart7, blsp_uart8, blsp_uart9, blsp_uart10,
+                blsp_uart11, blsp_uart12, blsp_uim1, blsp_uim2,
+                blsp_uim3, blsp_uim4, blsp_uim5, blsp_uim6, blsp_uim7,
+                blsp_uim8, blsp_uim9, blsp_uim10, blsp_uim11,
+                blsp_uim12, cam_mclk0, cam_mclk1, cam_mclk2, cam_mclk3,
+                cci_async, cci_async_in0, cci_i2c0, cci_i2c1,
+                cci_timer0, cci_timer1, cci_timer2, cci_timer3,
+                cci_timer4, edp_hpd, gcc_gp1, gcc_gp2, gcc_gp3,
+                gcc_obt, gcc_vtt, gp_mn, gp_pdm0, gp_pdm1, gp_pdm2,
+                gp0_clk, gp1_clk, gpio, hdmi_cec, hdmi_ddc, hdmi_dtest,
+                hdmi_hpd, hdmi_rcv, hsic, ldo_en, ldo_update,
+                mdp_vsync, pci_e0, pci_e0_n, pci_e0_rst, pci_e1,
+                pci_e1_rst, pci_e1_rst_n, pci_e1_clkreq_n, pri_mi2s,
+                qua_mi2s, sata_act, sata_devsleep, sata_devsleep_n,
+                sd_write, sdc_emmc_mode, sdc3, sdc4, sec_mi2s, slimbus,
+                spdif_tx, spkr_i2s, spkr_i2s_ws, spss_geni, ter_mi2s,
+                tsif1, tsif2, uim, uim_batt_alarm ]
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
+    tlmm: pinctrl@fd510000 {
+        compatible = "qcom,apq8084-pinctrl";
+        reg = <0xfd510000 0x4000>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 147>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        uart-state {
+            rx-pins {
+                pins = "gpio5";
+                function = "blsp_uart2";
+                bias-pull-up;
+            };
+
+            tx-pins {
+                pins = "gpio4";
+                function = "blsp_uart2";
+                bias-disable;
+            };
+        };
+    };
-- 
2.45.2


