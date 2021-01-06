Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6572EB99E
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 06:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbhAFFuz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 00:50:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:42806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725808AbhAFFuy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Jan 2021 00:50:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 371CB22CA2;
        Wed,  6 Jan 2021 05:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609912213;
        bh=bAmEEmwY1o6b95qFViI/TzoMAcpGD3fFLMK/NDWVPco=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DHUFE/XbwWY1HC78PwyCq2GAmRs4zb14stAud7n6DUT/4kaF6BFXqGbXoGmVLyGww
         ctaEHOLKLrVx8y4Q/0VxgOaiTxy18AHkYmnta4EqQjtVakUjaxGV+sEgmXLmBXTRY6
         FUq6m9muYJbVo8OJbpKJkY+TiVNGnlMRWrQYiTsw9+/SAiljG/ZoLFGDGvseIbMJed
         NH3linCge91sBC4v7MiQRqgcYMDyDkEc94bk1gH7VlVAUVFpr+T1S6cbKRWU+40sR0
         OgJNYwaE5SSvFo8qduTJjVZw4kKrOZRxTm50n2ZjK4A4YTDUWcU3kAocZc6FP0JzCN
         rQdQkh3XH0dgw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl bindings
Date:   Wed,  6 Jan 2021 11:19:49 +0530
Message-Id: <20210106054950.303244-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106054950.303244-1-vkoul@kernel.org>
References: <20210106054950.303244-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding Documentation details for Qualcomm SM8350
pinctrl driver.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../bindings/pinctrl/qcom,sm8350-tlmm.yaml    | 149 ++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
new file mode 100644
index 000000000000..abdafd25bfc2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm8350-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SM8350 TLMM block
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description: |
+  This binding describes the Top Level Mode Multiplexer block found in the
+  SM8350 platform.
+
+properties:
+  compatible:
+    const: qcom,sm8350-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    description: Specifies the PIN numbers and Flags, as defined in
+      include/dt-bindings/interrupt-controller/irq.h
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description: Specifying the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    maxItems: 1
+
+#PIN CONFIGURATION NODES
+patternProperties:
+  '-pinmux$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-3])$"
+            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins. Functions are only valid for gpio pins.
+        enum: [ atest_char, atest_usb, audio_ref, cam_mclk, cci_async,
+                cci_i2c, cci_timer, cmu_rng, coex_uart1, coex_uart2, cri_trng,
+                cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1,
+                ddr_pxi2, ddr_pxi3, dp_hot, dp_lcd, gcc_gp1, gcc_gp2, gcc_gp3,
+                gpio, ibi_i3c, jitter_bist, lpass_slimbus, mdp_vsync, mdp_vsync0,
+                mdp_vsync1, mdp_vsync2, mdp_vsync3, mi2s0_data0, mi2s0_data1,
+                mi2s0_sck, mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck,
+                mi2s1_ws, mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws,
+                mss_grfc0, mss_grfc1, mss_grfc10, mss_grfc11, mss_grfc12,
+                mss_grfc2, mss_grfc3, mss_grfc4, mss_grfc5, mss_grfc6,
+                mss_grfc7, mss_grfc8, mss_grfc9, nav_gpio, pa_indicator,
+                pcie0_clkreqn, pcie1_clkreqn, phase_flag, pll_bist, pll_clk,
+                pri_mi2s, prng_rosc, qdss_cti, qdss_gpio, qlink0_enable,
+                qlink0_request, qlink0_wmss, qlink1_enable, qlink1_request,
+                qlink1_wmss, qlink2_enable, qlink2_request, qlink2_wmss, qspi0,
+                qspi1, qspi2, qspi3, qspi_clk, qspi_cs, qup0, qup1, qup10,
+                qup11, qup12, qup13, qup14, qup15, qup16, qup17, qup18, qup19,
+                qup2, qup3, qup4, qup5, qup6, qup7, qup8, qup9, qup_l4, qup_l5,
+                qup_l6, sd_write, sdc40, sdc41, sdc42, sdc43, sdc4_clk,
+                sdc4_cmd, sec_mi2s, tb_trig, tgu_ch0, tgu_ch1, tgu_ch2,
+                tgu_ch3, tsense_pwm1, tsense_pwm2, uim0_clk, uim0_data,
+                uim0_present, uim0_reset, uim1_clk, uim1_data, uim1_present,
+                uim1_reset, usb2phy_ac, usb_phy, vfr_0, vfr_1, vsense_trigger ]
+
+
+      drive-strength:
+        enum: [2, 4, 6, 8, 10, 12, 14, 16]
+        default: 2
+        description:
+          Selects the drive strength for the specified pins, in mA.
+
+      bias-pull-down: true
+
+      bias-pull-up: true
+
+      bias-disable: true
+
+      output-high: true
+
+      output-low: true
+
+    required:
+      - pins
+      - function
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        tlmm: pinctrl@f000000 {
+          compatible = "qcom,sm8350-tlmm";
+          reg = <0x0f100000 0x300000>;
+          interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+          gpio-controller;
+          #gpio-cells = <2>;
+          interrupt-controller;
+          #interrupt-cells = <2>;
+          gpio-ranges = <&tlmm 0 0 203>;
+          serial-pinmux {
+            pins = "gpio18", "gpio19";
+            function = "qup3";
+            drive-strength = <8>;
+            bias-disable;
+          };
+        };
+
+...
-- 
2.26.2

