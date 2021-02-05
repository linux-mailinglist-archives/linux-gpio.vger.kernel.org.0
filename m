Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C5C3115B1
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 23:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbhBEWjE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 17:39:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:53154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231841AbhBEOCh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Feb 2021 09:02:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37DA664E50;
        Fri,  5 Feb 2021 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612533705;
        bh=AvwfeYIQNkS9iIytcCnuMp5YAfpkGsvWbiTQU4cBNMI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lze9sv2B60S224/MyQaLSlr+qb5ysIZlk+a85L+t6PiyyfZ6C6q8q9b90pMy8gZob
         RytP0CLQk7H3yUf6osEODo/y3P1MHZOcPChZ00HZmlTZXoL2qOOTE1l2aAZqANbWs4
         QnfmXDWLqzQTkrkknmxQl2fwbTz9ALrlcnd7I3qZpk3oLvI3yAQCcQ1JIMx11nG8DA
         Y09PWdzI4ramwMoCnKOxxE7zptrA41+MWHPfbav+YsYRweZfB7p1AY70BXRVO6qQ/F
         wlZ6nR009eMO41m55CenyqDuBnWP6HiOQdhXpoJzTJb3znLyc75n/SVG97RpMNoRdN
         0v68Z8mRqXm5Q==
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl bindings
Date:   Fri,  5 Feb 2021 19:31:31 +0530
Message-Id: <20210205140132.274242-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205140132.274242-1-vkoul@kernel.org>
References: <20210205140132.274242-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding Documentation details for Qualcomm SM8350
pinctrl driver.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../bindings/pinctrl/qcom,sm8350-pinctrl.yaml | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
new file mode 100644
index 000000000000..4f2667ea2805
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm8350-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SM8350 TLMM block
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description: |
+  This binding describes the Top Level Mode Multiplexer (TLMM) block found
+  in the SM8350 platform.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8350-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts: true
+  interrupt-controller: true
+  '#interrupt-cells': true
+  gpio-controller: true
+  gpio-reserved-ranges: true
+  '#gpio-cells': true
+  gpio-ranges: true
+  wakeup-parent: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+patternProperties:
+  '-state$':
+    oneOf:
+      - $ref: "#/$defs/qcom-sm8350-tlmm-state"
+      - patternProperties:
+          ".*":
+            $ref: "#/$defs/qcom-sm8350-tlmm-state"
+
+$defs:
+  qcom-sm8350-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
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
+          pins.
+
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
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+      drive-strength: true
+      input-enable: true
+      output-high: true
+      output-low: true
+
+    required:
+      - pins
+      - function
+
+    additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        pinctrl@f100000 {
+                compatible = "qcom,sm8350-tlmm";
+                reg = <0x0f100000 0x300000>;
+                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+                gpio-ranges = <&tlmm 0 0 203>;
+
+                gpio-wo-subnode-state {
+                        pins = "gpio1";
+                        function = "gpio";
+                };
+
+                uart-w-subnodes-state {
+                        rx {
+                                pins = "gpio18";
+                                function = "qup3";
+                                bias-pull-up;
+                        };
+
+                        tx {
+                                pins = "gpio19";
+                                function = "qup3";
+                                bias-disable;
+                        };
+                };
+        };
+...
-- 
2.26.2

