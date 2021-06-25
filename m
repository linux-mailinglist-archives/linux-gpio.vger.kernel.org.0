Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782C63B4186
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jun 2021 12:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhFYKYU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 06:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbhFYKYT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jun 2021 06:24:19 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD28C061766;
        Fri, 25 Jun 2021 03:21:58 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id hz1so14341928ejc.1;
        Fri, 25 Jun 2021 03:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mvdWN3o8WrFbd2nEzSJB3DS4HjiTzpNz+M0fmCMB3PM=;
        b=LBSKGaFjtMzc7nax4q5/Mo7m64PzRHIorcjX2tqBSglCb40QO3JRRrCbdbDJlXR5FS
         dKkLu01hy29xr5QJ4c2qeZ6gyzhzOCMccsBiqrZe674YzWLpd79zOjhPHpkAbBIejR6Y
         wm3vzpGffjVR+m5c3X2E9aify1kyFRahybqIHOlhR445LCnkG6sJ3Xd3jAr7d8+kdCE3
         4hNRcHJjYWTZPE+tgCy/f15RvA5FKmMd2bGEYzlEvWuzCPggZOo01MJ/Ygvzn3tNLzDV
         qIFMErdKyhnZT3//ozbq9D/UVKE+XQ9HpYNMU2GAi1dbGS/Myu9QQKyX4ZvYRiwbFU6Q
         Tmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mvdWN3o8WrFbd2nEzSJB3DS4HjiTzpNz+M0fmCMB3PM=;
        b=nZVTr98Oxb/nsO4Fw/R6dT6+o3bZ4KonDMTkoYMah5nV7lnn7yKohDCT89TF/nOagk
         YEB/4W3WWsLneLHoFO+opWZiuanjIS0wxnSl/g0Tq1HuRsaxQBydhkDHgSKKS4M9d/Fj
         wOHP11cZoyM/v/csSP0OqbEd1b99+iGGGp7mdoRJOrrs7662zzgQA0AEvFM+HGrjfccq
         dA8/Yt/Gamj84ghVdFX6HJOI2R5YN3x5yl+Iodfkp/U+jNeyx61XuKJS7FjaSO0A3CDu
         K8UiUtWjmVWSvj8d0k5lDZiJ6GTVeB+EmI2QQIZ0WUrfyVTHSSvkeM3KibP4igONvQm5
         Cm9Q==
X-Gm-Message-State: AOAM530Iv7n1DQUiLozIWiwo0u8VFqxCI7qBDmnmmtP1eMEpS0Eu9+6t
        Mt9HhtQDnMAEgEqpn+eqWOM=
X-Google-Smtp-Source: ABdhPJwa9j7nTGClZ0B+diqP6hHDK3zthHH0qMboW2BNb8MJFPZlhFMnBzolEooi+1IXCPMOfA6aQQ==
X-Received: by 2002:a17:907:1107:: with SMTP id qu7mr9969990ejb.40.1624616516891;
        Fri, 25 Jun 2021 03:21:56 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id du7sm3512663edb.1.2021.06.25.03.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 03:21:56 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add SM6115 pinctrl bindings
Date:   Fri, 25 Jun 2021 13:21:46 +0300
Message-Id: <20210625102147.51162-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625102147.51162-1-iskren.chernev@gmail.com>
References: <20210625102147.51162-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding Documentation details for Qualcomm SM6115 and
SM4250 pinctrl.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml | 182 ++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
new file mode 100644
index 000000000000..34d57a5c5f75
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
@@ -0,0 +1,182 @@
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
+  SM6115 and SM4250 platforms.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm4250-tlmm
+      - qcom,sm6115-tlmm
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-3])$"
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
+                compatible = "qcom,sm4250-tlmm";
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

