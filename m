Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEE63415619
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 05:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239081AbhIWDe0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 23:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239085AbhIWDeY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 23:34:24 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F14C061762
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 20:32:53 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id f129so4964640pgc.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 20:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AyW/5UqkKbj/laxIvLvwrK1s8Ju5HDTao9QP66liyh0=;
        b=WhXoXn9iKAL26M7Hl2kcorqi5BhFNSEPuJULIU3LKna597eklTArFs68U+xcujHnOH
         wr37QxeJrDUUU01t/iqQ/DheVl60VyATBkO47UuaXGohFC/N+Hcv90sgTImR3c2YZ7NX
         7l7zF7ZXJxv6ALukItSznKGE7AUGAotr46YV3k59kNee72ROaf/jUMtL7mqnIymLNWZg
         xKVEMGFpfAvBeUiNiDL/tHTbGOSG+JBUWNynDcySZ7op2GFus4qRCqNJCzVEZYSgbFyn
         40RKTWnLoJQuAo36WML5DYNc9JqEQZBbrKSIYksTpEZ1Nw7272iQw2tD/tQuZcN7LNOL
         gC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AyW/5UqkKbj/laxIvLvwrK1s8Ju5HDTao9QP66liyh0=;
        b=QSQw2ZaeWInAORfpvFgnqcWp6Zs4AJgjdqP7X38lrDQw8a+E0oFvbfqNaDYTH65fHX
         L81nFlxEcyw81UjDP5n/xeVU+kXQhhWhL/QJ6Q1jBrSd0H4L8w6IF8clZVV/WzKznPoJ
         xcVcU5PuSZfKp3gwqiHbYUfBS9QXGY8PitIY7kVYJJQ6qRadVDdiHwjEwMatq/aMR/H7
         0NCjRLPJqPL9sVT+z8SlvTgQ/DyCXPUjJWINaHLSlH5Kmyo2WZ1rlU8N5YkxUydJgsDE
         q5b2lbPg/oQ78VMSOtB967RO8Wkh1N1EiQ60CGPVv8l1fde97uJvcUEYEYckP5Aoh+TQ
         hESg==
X-Gm-Message-State: AOAM533kMPCrfWDTY3J/jiZbXTMLmrb8i3Xk/9M7+H7uBboUCucRk6Je
        Jhv+nlvhHfM+xzSE/UcrM8xkKQ==
X-Google-Smtp-Source: ABdhPJySrxI0dWibWAIlVIv6jOvGtSq/ILu3mWV0Vep/ExT8cqHy2nIkK5p+lh3xqANbI4Xod9wTew==
X-Received: by 2002:a62:7997:0:b0:43d:f9e1:939c with SMTP id u145-20020a627997000000b0043df9e1939cmr2076648pfc.2.1632367972830;
        Wed, 22 Sep 2021 20:32:52 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id h18sm3817168pfr.89.2021.09.22.20.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 20:32:52 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add QCM2290 pinctrl bindings
Date:   Thu, 23 Sep 2021 11:32:23 +0800
Message-Id: <20210923033224.29719-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210923033224.29719-1-shawn.guo@linaro.org>
References: <20210923033224.29719-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree bindings for QCM2290 pinctrl.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/qcom,qcm2290-pinctrl.yaml         | 165 ++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
new file mode 100644
index 000000000000..13f338619d77
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
@@ -0,0 +1,165 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,qcm2290-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. QCM2290 TLMM block
+
+maintainers:
+  - Shawn Guo <shawn.guo@linaro.org>
+
+description:
+  This binding describes the Top Level Mode Multiplexer block found in the
+  QCM2290 platform.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: Specifies the TLMM summary IRQ
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    description:
+      Specifies the PIN numbers and Flags, as defined in defined in
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
+  wakeup-parent:
+    maxItems: 1
+
+#PIN CONFIGURATION NODES
+patternProperties:
+  '-state$':
+    oneOf:
+      - $ref: "#/$defs/qcom-qcm2290-tlmm-state"
+      - patternProperties:
+          ".*":
+            $ref: "#/$defs/qcom-qcm2290-tlmm-state"
+
+'$defs':
+  qcom-qcm2290-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-9]|12[0-6])$"
+            - enum: [ sdc1_rclk, sdc1_clk, sdc1_cmd, sdc1_data,
+                      sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ adsp_ext, agera_pll, atest, cam_mclk, cci_async, cci_i2c,
+                cci_timer0, cci_timer1, cci_timer2, cci_timer3, char_exec,
+                cri_trng, cri_trng0, cri_trng1, dac_calib, dbg_out, ddr_bist,
+                ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, gcc_gp1, gcc_gp2,
+                gcc_gp3, gpio, gp_pdm0, gp_pdm1, gp_pdm2, gsm0_tx, gsm1_tx,
+                jitter_bist, mdp_vsync, mdp_vsync_out_0, mdp_vsync_out_1,
+                mpm_pwr, mss_lte, m_voc, nav_gpio, pa_indicator, pbs0, pbs1,
+                pbs2, pbs3, pbs4, pbs5, pbs6, pbs7, pbs8, pbs9, pbs10, pbs11,
+                pbs12, pbs13, pbs14, pbs15, pbs_out, phase_flag, pll_bist,
+                pll_bypassnl, pll_reset, prng_rosc, pwm_0, pwm_1, pwm_2, pwm_3,
+                pwm_4, pwm_5, pwm_6, pwm_7, pwm_8, pwm_9, qdss_cti, qdss_gpio,
+                qup0, qup1, qup2, qup3, qup4, qup5, sdc1_tb, sdc2_tb, sd_write,
+                ssbi_wtr1, tgu_ch0, tgu_ch1, tgu_ch2, tgu_ch3, tsense_pwm,
+                uim1_clk, uim1_data, uim1_present, uim1_reset, uim2_clk,
+                uim2_data, uim2_present, uim2_reset, usb_phy, vfr_1,
+                vsense_trigger, wlan1_adc0, wlan1_adc1 ]
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@500000 {
+        compatible = "qcom,qcm2290-tlmm";
+        reg = <0x500000 0x300000>;
+        interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 127>;
+
+        sdc2_on_state: sdc2-on-state {
+            clk {
+                pins = "sdc2_clk";
+                bias-disable;
+                drive-strength = <16>;
+            };
+
+            cmd {
+                pins = "sdc2_cmd";
+                bias-pull-up;
+                drive-strength = <10>;
+            };
+
+            data {
+                pins = "sdc2_data";
+                bias-pull-up;
+                drive-strength = <10>;
+            };
+        };
+    };
-- 
2.17.1

