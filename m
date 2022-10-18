Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75D50603045
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 17:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbiJRPzc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 11:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbiJRPzS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 11:55:18 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8794A2CDF5
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 08:55:14 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id f22so9912155qto.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 08:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGFeqn+zbKKUK91vNPRt9/8LQdipAE0TJCmeIfSdRW8=;
        b=MxEg2IANTdtl7TDemU3BQpCMDuQuv956XvhMfY5CCFKYWgzFQEwBPr81S9/VeZFRY3
         4cOLULqnOdGpf1HLhBfFAwIH5SxeS6h2JslD/mQcQHm239faGdxQrG9KlZwOxGdIJa/O
         orBSlIfIk6GvIwvS5OqiqmPPj0RH7arOyEwo8dRcUqUffEva0GmXNDzipllDhmVFshsb
         S2pOUg8R89PINncqFLQ6yoa2KjwweJ8qDrqJikdIxP2cO07DUBByBwtjlygOnzLg6xY8
         xdYKFRvZtr1b7jNPS4aCWAHb9CacEhT3v+LrDkwohYYg0hOv5pSVNu0uyxV4pVOhVgOv
         EE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGFeqn+zbKKUK91vNPRt9/8LQdipAE0TJCmeIfSdRW8=;
        b=bmTd6nP5NHqIUBsOS93HEj6O3IiMR3E3UTAGnqM5gg7PQNKzTL68WKRxCRftk5z7rD
         VtrSLwoS2A0BpbeacDxUktRRfzKpzOLoj+x811EAHVrus5ekK5/bHBJEwmdoeSjv0cva
         oAQp/u4yW4IDZGIIyaCHJ9ti1TrqABBW1inP1XRjhtn4Nr2IT7yKi/CfZ/TXf+JHNNL7
         laWsYhjrl3qH9IX57EL2Dpx+OL5Fo6fQkJfspR1KIrAok0PzSsAVvJs5mvVB7U1bFyLS
         5uyeNGB4iBw6unlcv6jpJyDZpySs7K3VjAJNt07z9RwrWEK0EKN7VnZk1lGou+qoCeV0
         PYKA==
X-Gm-Message-State: ACrzQf3D9CslZ5KdErrDAMUaav4dJCPlsADPXwn3jM4W3Kr1DvqD8Tm9
        xvHswS8YbRXZSAbZ+7oGBwzzbg==
X-Google-Smtp-Source: AMsMyM5V10Ykbw5BVWi9XexEqy0uuCuqOYTtajvdFSE1NTLPzbK5vbbOHXB6h3w1YmpQ5sWjZXSjhg==
X-Received: by 2002:a05:622a:43:b0:39c:eb15:c2ee with SMTP id y3-20020a05622a004300b0039ceb15c2eemr2649890qtw.331.1666108512889;
        Tue, 18 Oct 2022 08:55:12 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id do20-20020a05620a2b1400b006ec9f5e3396sm2694658qkb.72.2022.10.18.08.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:55:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 3/3] dt-bindings: pinctrl: qcom,msm8994: convert to dtschema
Date:   Tue, 18 Oct 2022 11:54:50 -0400
Message-Id: <20221018155450.39816-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018155450.39816-1-krzysztof.kozlowski@linaro.org>
References: <20221018155450.39816-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert Qualcomm MSM8994 pin controller bindings to DT schema.  Keep the
parsing of pin configuration subnodes consistent with other Qualcomm
schemas (children named with '-state' suffix, their children with
'-pins').

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v2:
1. Add Rb tag.
2. Drop entire drive-strength (not needed, brought by common TLMM
   schema).

Changes since v1:
1. Drop default:2 for drive strength
---
 .../bindings/pinctrl/qcom,msm8994-pinctrl.txt | 186 ------------------
 .../pinctrl/qcom,msm8994-pinctrl.yaml         | 162 +++++++++++++++
 2 files changed, 162 insertions(+), 186 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt
deleted file mode 100644
index da52df6273bc..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt
+++ /dev/null
@@ -1,186 +0,0 @@
-Qualcomm MSM8994 TLMM block
-
-This binding describes the Top Level Mode Multiplexer block found in the
-MSM8994 platform.
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: Should contain one of:
-		    "qcom,msm8992-pinctrl",
-		    "qcom,msm8994-pinctrl".
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
-		    this subnode.
-
-		    Valid pins are:
-		      gpio0-gpio145
-		        Supports mux, bias and drive-strength
-
-		      sdc1_clk, sdc1_cmd, sdc1_data sdc1_rclk, sdc2_clk,
-		      sdc2_cmd, sdc2_data
-		        Supports bias and drive-strength
-
-- function:
-	Usage: required
-	Value type: <string>
-	Definition: Specify the alternative function to be configured for the
-		    specified pins. Functions are only valid for gpio pins.
-		    Valid values are:
-
-		    audio_ref_clk,  blsp_i2c1, blsp_i2c2, blsp_i2c3, blsp_i2c4, blsp_i2c5,
-		    blsp_i2c6, blsp_i2c7, blsp_i2c8, blsp_i2c9, blsp_i2c10, blsp_i2c11,
-		    blsp_i2c12, blsp_spi1, blsp_spi1_cs1, blsp_spi1_cs2, blsp_spi1_cs3,
-		    blsp_spi2, blsp_spi2_cs1, blsp_spi2_cs2, blsp_spi2_cs3, blsp_spi3,
-		    blsp_spi4, blsp_spi5, blsp_spi6, blsp_spi7, blsp_spi8, blsp_spi9,
-		    blsp_spi10, blsp_spi10_cs1, blsp_spi10_cs2, blsp_spi10_cs3, blsp_spi11,
-		    blsp_spi12, blsp_uart1, blsp_uart2, blsp_uart3, blsp_uart4, blsp_uart5,
-		    blsp_uart6, blsp_uart7, blsp_uart8, blsp_uart9, blsp_uart10, blsp_uart11,
-		    blsp_uart12, blsp_uim1, blsp_uim2, blsp_uim3, blsp_uim4, blsp_uim5,
-		    blsp_uim6, blsp_uim7, blsp_uim8, blsp_uim9, blsp_uim10, blsp_uim11,
-		    blsp_uim12, blsp11_i2c_scl_b, blsp11_i2c_sda_b, blsp11_uart_rx_b,
-		    blsp11_uart_tx_b, cam_mclk0, cam_mclk1, cam_mclk2, cam_mclk3,
-		    cci_async_in0, cci_async_in1, cci_async_in2, cci_i2c0, cci_i2c1,
-		    cci_timer0, cci_timer1, cci_timer2, cci_timer3, cci_timer4,
-		    gcc_gp1_clk_a, gcc_gp1_clk_b, gcc_gp2_clk_a, gcc_gp2_clk_b, gcc_gp3_clk_a,
-		    gcc_gp3_clk_b, gp_mn, gp_pdm0, gp_pdm1, gp_pdm2, gp0_clk,
-		    gp1_clk, gps_tx, gsm_tx, hdmi_cec, hdmi_ddc, hdmi_hpd, hdmi_rcv,
-		    mdp_vsync, mss_lte, nav_pps, nav_tsync, qdss_cti_trig_in_a,
-		    qdss_cti_trig_in_b, qdss_cti_trig_in_c, qdss_cti_trig_in_d,
-		    qdss_cti_trig_out_a, qdss_cti_trig_out_b, qdss_cti_trig_out_c,
-		    qdss_cti_trig_out_d, qdss_traceclk_a, qdss_traceclk_b, qdss_tracectl_a,
-		    qdss_tracectl_b, qdss_tracedata_a, qdss_tracedata_b, qua_mi2s, pci_e0,
-		    pci_e1, pri_mi2s, sdc4, sec_mi2s, slimbus, spkr_i2s, ter_mi2s, tsif1,
-		    tsif2, uim_batt_alarm, uim1, uim2, uim3, uim4, gpio
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
-	msmgpio: pinctrl@fd510000 {
-		compatible = "qcom,msm8994-pinctrl";
-		reg = <0xfd510000 0x4000>;
-		interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-ranges = <&msmgpio 0 0 146>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-
-		blsp1_uart2_default: blsp1_uart2_default {
-			pinmux {
-				pins = "gpio4", "gpio5";
-				function = "blsp_uart2";
-			};
-			pinconf {
-				pins = "gpio4", "gpio5";
-				drive-strength = <16>;
-				bias-disable;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.yaml
new file mode 100644
index 000000000000..55d5439c6c24
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,msm8994-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8994 TLMM pin controller
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm MSM8994 SoC.
+
+properties:
+  compatible:
+    enum:
+      - qcom,msm8992-pinctrl
+      - qcom,msm8994-pinctrl
+
+  reg:
+    maxItems: 1
+
+  interrupts: true
+  interrupt-controller: true
+  "#interrupt-cells": true
+  gpio-controller: true
+  "#gpio-cells": true
+  gpio-ranges: true
+  wakeup-parent: true
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 75
+
+  gpio-line-names:
+    maxItems: 150
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-msm8994-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-msm8994-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-msm8994-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-4][0-9])$"
+            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc1_rclk, sdc2_clk,
+                      sdc2_cmd, sdc2_data, sdc3_clk, sdc3_cmd, sdc3_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ gpio, audio_ref_clk, blsp_i2c1, blsp_i2c2, blsp_i2c3,
+                blsp_i2c4, blsp_i2c5, blsp_i2c6, blsp_i2c7, blsp_i2c8,
+                blsp_i2c9, blsp_i2c10, blsp_i2c11, blsp_i2c12, blsp_spi1,
+                blsp_spi1_cs1, blsp_spi1_cs2, blsp_spi1_cs3, blsp_spi2,
+                blsp_spi2_cs1, blsp_spi2_cs2, blsp_spi2_cs3, blsp_spi3,
+                blsp_spi4, blsp_spi5, blsp_spi6, blsp_spi7, blsp_spi8,
+                blsp_spi9, blsp_spi10, blsp_spi10_cs1, blsp_spi10_cs2,
+                blsp_spi10_cs3, blsp_spi11, blsp_spi12, blsp_uart1, blsp_uart2,
+                blsp_uart3, blsp_uart4, blsp_uart5, blsp_uart6, blsp_uart7,
+                blsp_uart8, blsp_uart9, blsp_uart10, blsp_uart11, blsp_uart12,
+                blsp_uim1, blsp_uim2, blsp_uim3, blsp_uim4, blsp_uim5,
+                blsp_uim6, blsp_uim7, blsp_uim8, blsp_uim9, blsp_uim10,
+                blsp_uim11, blsp_uim12, blsp11_i2c_scl_b, blsp11_i2c_sda_b,
+                blsp11_uart_rx_b, blsp11_uart_tx_b, cam_mclk0, cam_mclk1,
+                cam_mclk2, cam_mclk3, cci_async_in0, cci_async_in1,
+                cci_async_in2, cci_i2c0, cci_i2c1, cci_timer0, cci_timer1,
+                cci_timer2, cci_timer3, cci_timer4, gcc_gp1_clk_a,
+                gcc_gp1_clk_b, gcc_gp2_clk_a, gcc_gp2_clk_b, gcc_gp3_clk_a,
+                gcc_gp3_clk_b, gp_mn, gp_pdm0, gp_pdm1, gp_pdm2, gp0_clk,
+                gp1_clk, gps_tx, gsm_tx, hdmi_cec, hdmi_ddc, hdmi_hpd,
+                hdmi_rcv, mdp_vsync, mss_lte, nav_pps, nav_tsync,
+                qdss_cti_trig_in_a, qdss_cti_trig_in_b, qdss_cti_trig_in_c,
+                qdss_cti_trig_in_d, qdss_cti_trig_out_a, qdss_cti_trig_out_b,
+                qdss_cti_trig_out_c, qdss_cti_trig_out_d, qdss_traceclk_a,
+                qdss_traceclk_b, qdss_tracectl_a, qdss_tracectl_b,
+                qdss_tracedata_a, qdss_tracedata_b, qua_mi2s, pci_e0, pci_e1,
+                pri_mi2s, sdc4, sec_mi2s, slimbus, spkr_i2s, ter_mi2s, tsif1,
+                tsif2, uim_batt_alarm, uim1, uim2, uim3, uim4 ]
+
+      bias-pull-down: true
+      bias-pull-up: true
+      bias-disable: true
+      drive-strength: true
+      input-enable: true
+      output-high: true
+      output-low: true
+
+    required:
+      - pins
+
+    additionalProperties: false
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@fd510000 {
+        compatible = "qcom,msm8994-pinctrl";
+        reg = <0xfd510000 0x4000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        gpio-ranges = <&tlmm 0 0 146>;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        blsp1-uart2-default-state {
+            function = "blsp_uart2";
+            pins = "gpio4", "gpio5";
+            drive-strength = <16>;
+            bias-disable;
+        };
+
+        blsp1-spi1-default-state {
+            default-pins {
+                pins = "gpio0", "gpio1", "gpio3";
+                function = "blsp_spi1";
+                drive-strength = <10>;
+                bias-pull-down;
+            };
+
+            cs-pins {
+                pins = "gpio8";
+                function = "gpio";
+                drive-strength = <2>;
+                bias-disable;
+            };
+        };
+    };
-- 
2.34.1

