Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 657893D40A8
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 21:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhGWSng (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 14:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbhGWSnd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 14:43:33 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808F6C061575;
        Fri, 23 Jul 2021 12:24:05 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id h15so1414020wmq.0;
        Fri, 23 Jul 2021 12:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iDmHss3MAWKv4e1CK9pGfZV1YIJG+5QwQSiJS3qW6S4=;
        b=nTPQqN37NWQhcz6Y3vZWPKRVBXhm7jcBbZYnq7P2b18zg+8p4cN1tP30Cqskt/qmD/
         zJZWshELtq3AvXkiDAAnGmjB2gj+MhvyfuVZYV/9J1q7a640hjTX/iJjD50E3g3AX1Ku
         llGnKUwqrdQqCqcN8jZkQzE2CpstQREH5n9aKKPGDOD4OiuRhTKOK2aBDrGttGGxPXmp
         JdBFEk8UJrsaimrE5JWVMMoig5yrW36CCiZzBQRzziC+cYyrGkzhgmufwygXo5w+vJN+
         3drzQ5NT8C2L0SL7qNpQA2iOFSkxjHH4wZOKa2+erzulJjkdgbBejiYJbFp+JLDXyAM+
         F9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iDmHss3MAWKv4e1CK9pGfZV1YIJG+5QwQSiJS3qW6S4=;
        b=g8zHcVwZn10DGH1NsmZjO16VU+qxAgO1cHfntSQxwT/4AUdSoNUSWJGbIfbxvhYRzu
         +utHxQvao6JF+b4ubYBk1HHc46S9hZSDmOdqfi1HyRpJCC/2XmRqjnqIqqpi/BRzD3GM
         D6KnFePqTKyj6cHurLuiwBoejTQZFPGLcNEsCvw+/gcleOjxYJIqyccI/audZjpyUzWI
         DXNPOs3dPqyPgWjm0oBewZVfj0DqKJBFzoiFX/2flmKfHypz31K6369qqYOoJjCxK5lm
         9PP5CKDX9SXkXeZFFob1qAm7q9pTS9riZjGWvWSTVn+uKCjc7V9cHCFu1a8QcYrhFYAw
         DsFA==
X-Gm-Message-State: AOAM532gSOmcQHiZ0aU7DxzaDk78+gU5SMrBTRi6L6Hq0K86iVhsq0kU
        M/7SbSwef+rY4F7rv4fml2o=
X-Google-Smtp-Source: ABdhPJwykUFnPDlJic6TfMWrD5iRzb++O6nbES74E8bKbdrmq6gDGg4MCpkVfHl22raMwC22wmczQg==
X-Received: by 2002:a1c:7919:: with SMTP id l25mr13321635wme.160.1627068244097;
        Fri, 23 Jul 2021 12:24:04 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id e11sm41650707wrt.0.2021.07.23.12.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 12:24:03 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/2] dt-bindings: pinctrl: qcom: Add SM6115 pinctrl bindings
Date:   Fri, 23 Jul 2021 22:23:51 +0300
Message-Id: <20210723192352.546902-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210723192352.546902-1-iskren.chernev@gmail.com>
References: <20210723192352.546902-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding Documentation details for Qualcomm SM6115 and
SM4250 pinctrl.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml | 180 ++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
new file mode 100644
index 000000000000..2f79add4117a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
@@ -0,0 +1,180 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm6115-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SM6115, SM4250 TLMM block
+
+maintainers:
+  - Iskren Chernev <iskren.chernev@gmail.com>
+
+description:
+  This binding describes the Top Level Mode Multiplexer block found in the
+  SM4250/6115 platforms.
+
+properties:
+  compatible:
+    const: qcom,sm6115-tlmm
+
+  reg:
+    minItems: 3
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: west
+      - const: south
+      - const: east
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
+      - $ref: "#/$defs/qcom-sm6115-tlmm-state"
+      - patternProperties:
+          ".*":
+            $ref: "#/$defs/qcom-sm6115-tlmm-state"
+
+'$defs':
+  qcom-sm6115-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-2])$"
+            - enum: [ sdc1_rclk, sdc1_clk, sdc1_cmd, sdc1_data,
+                      sdc2_clk, sdc2_cmd, sdc2_data, ufs_reset ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ adsp_ext, agera_pll, atest, cam_mclk, cci_async, cci_i2c,
+                cci_timer, cri_trng, dac_calib, dbg_out, ddr_bist, ddr_pxi0,
+                ddr_pxi1, ddr_pxi2, ddr_pxi3, gcc_gp1, gcc_gp2, gcc_gp3, gpio,
+                gp_pdm0, gp_pdm1, gp_pdm2, gsm0_tx, gsm1_tx, jitter_bist,
+                mdp_vsync, mdp_vsync_out_0, mdp_vsync_out_1, mpm_pwr, mss_lte,
+                m_voc, nav_gpio, pa_indicator, pbs, pbs_out, phase_flag,
+                pll_bist, pll_bypassnl, pll_reset, prng_rosc, qdss_cti,
+                qdss_gpio, qup0, qup1, qup2, qup3, qup4, qup5, sdc1_tb,
+                sdc2_tb, sd_write, ssbi_wtr1, tgu, tsense_pwm, uim1_clk,
+                uim1_data, uim1_present, uim1_reset, uim2_clk, uim2_data,
+                uim2_present, uim2_reset, usb_phy, vfr_1, vsense_trigger,
+                wlan1_adc0, elan1_adc1 ]
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
+  - reg-names
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
+        tlmm: pinctrl@500000 {
+                compatible = "qcom,sm6115-tlmm";
+                reg = <0x500000 0x400000>,
+                        <0x900000 0x400000>,
+                        <0xd00000 0x400000>;
+                reg-names = "west", "south", "east";
+                interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+                gpio-ranges = <&tlmm 0 0 114>;
+
+                sdc2_on_state: sdc2-on-state {
+                        clk {
+                                pins = "sdc2_clk";
+                                bias-disable;
+                                drive-strength = <16>;
+                        };
+
+                        cmd {
+                                pins = "sdc2_cmd";
+                                bias-pull-up;
+                                drive-strength = <10>;
+                        };
+
+                        data {
+                                pins = "sdc2_data";
+                                bias-pull-up;
+                                drive-strength = <10>;
+                        };
+
+                        sd-cd {
+                                pins = "gpio88";
+                                function = "gpio";
+                                bias-pull-up;
+                                drive-strength = <2>;
+                        };
+                };
+        };
+
-- 
2.32.0

