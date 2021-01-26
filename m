Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE469304985
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 21:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbhAZF1X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 00:27:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730062AbhAZE2W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 23:28:22 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD38C061788
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 20:26:50 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id d1so15056753otl.13
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 20:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sxs612cpeWk15s9IRsZQmGfQWRxEVp1NyNx2VAk5PQg=;
        b=pLxjBRSUifb+FQNiC5QIELRNYUDee8Q/998g8Xz+9uTbKm2/PeB+SMw5G3wj/othVN
         0RmH6L36rIVwRog1w3xBrSZGaNVb9FDdyxIoj3lTKMhRt/3Pz2NVq0Y3TpHFAAttq5cf
         Bxib/8d6lZZhIWBBmvLy2EF3LHzo6PLEq/2eYFC7OkbPQc+CKFb3ZeF8U+w2UDef1Je9
         VZoGkAvWiXFLH8GwiFKkLyqdkAuSJp7MKufFB3P4cVaH/VMnpSg7HSZSjTqfrh7vbCix
         aYpkgpgQg2iR/C42fH6ktfxQ2+MlUIWf1f4Aybic7pqDGZ1hsjtJ0ZHzStuAzfjFaJPN
         VC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sxs612cpeWk15s9IRsZQmGfQWRxEVp1NyNx2VAk5PQg=;
        b=EC/zs9n6CzlkvhMzFDuBWfIvtKb+947Wk84F4sGrJXwNHeAm5kbN5n6CkY4Zb1uU0Q
         Fl7EBvHUby/LzWkwGE7W/W1MgYIiZB2XVQT9M71jlessYiffqA+pZzjjT/qPjp85DEws
         S+T5KMmprEc34RfLj3Uue6gYecCsAnmBI77/5gyinc56XbUOLZkisWfX/0xDTbKh0jaW
         79Pw5kiau0HIJrIfaXdIS3GfYOi4LHWaHvPveeHfstR8DyooI/9YON+zXsbCAerFl/CL
         R+XtR2zVXDO1rTA1n6PRvZaPPfq5BHUprH3STP68oW4sWAJ/uZZ2v/FmQkVFSi2VCsIu
         bQ9Q==
X-Gm-Message-State: AOAM5320ziNJKQxIMjODHqNYmy75A6nUth/P23lLVSiav3xwj/Np5x0I
        uMd1XoDnVdjoVzyPV0Z/VGSsCw==
X-Google-Smtp-Source: ABdhPJwIgqPvhOuEMX2vL3suWxRX/QP8lNokACHAx9Lh9I02IwyKl4hFXECw0s1y7YEUUVS0/hgCPA==
X-Received: by 2002:a9d:3985:: with SMTP id y5mr2700391otb.202.1611635209827;
        Mon, 25 Jan 2021 20:26:49 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w129sm3930638oig.23.2021.01.25.20.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 20:26:49 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: qcom: Add sc8180x binding
Date:   Mon, 25 Jan 2021 20:26:49 -0800
Message-Id: <20210126042650.1725176-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126042650.1725176-1-bjorn.andersson@linaro.org>
References: <20210126042650.1725176-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding for the TLMM block in the Qualcomm SC8180X platform.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../pinctrl/qcom,sc8180x-pinctrl.yaml         | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
new file mode 100644
index 000000000000..a82dab898395
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sc8180x-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SC8180X TLMM block
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: |
+  This binding describes the Top Level Mode Multiplexer block found in the
+  SC8180X platform.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sc8180x-tlmm
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: "west"
+      - const: "east"
+      - const: "south"
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
+  - reg-names
+
+additionalProperties: false
+
+patternProperties:
+  '-state$':
+    oneOf:
+      - $ref: "#/$defs/qcom-sc8180x-tlmm-state"
+      - patternProperties:
+          ".*":
+            $ref: "#/$defs/qcom-sc8180x-tlmm-state"
+
+'$defs':
+  qcom-sc8180x-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-8][0-9])$"
+            - enum: [ sdc2_clk, sdc2_cmd, sdc2_data, ufs_reset ]
+        minItems: 1
+        maxItems: 16
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ adsp_ext, agera_pll, aoss_cti, atest_char, atest_tsens,
+                atest_tsens2, atest_usb0, atest_usb1, atest_usb2, atest_usb3,
+                atest_usb4, audio_ref, btfm_slimbus, cam_mclk, cci_async,
+                cci_i2c, cci_timer0, cci_timer1, cci_timer2, cci_timer3,
+                cci_timer4, cci_timer5, cci_timer6, cci_timer7, cci_timer8,
+                cci_timer9, cri_trng, dbg_out, ddr_bist, ddr_pxi, debug_hot,
+                dp_hot, edp_hot, edp_lcd, emac_phy, emac_pps, gcc_gp1, gcc_gp2,
+                gcc_gp3, gcc_gp4, gcc_gp5, gpio, gps, grfc, hs1_mi2s, hs2_mi2s,
+                hs3_mi2s, jitter_bist, lpass_slimbus, m_voc, mdp_vsync,
+                mdp_vsync0, mdp_vsync1, mdp_vsync2, mdp_vsync3, mdp_vsync4,
+                mdp_vsync5, mss_lte, nav_pps, pa_indicator, pci_e0, pci_e1,
+                pci_e2, pci_e3, phase_flag, pll_bist, pll_bypassnl, pll_reset,
+                pri_mi2s, pri_mi2s_ws, prng_rosc, qdss_cti, qdss_gpio, qlink,
+                qspi0, qspi0_clk, qspi0_cs, qspi1, qspi1_clk, qspi1_cs,
+                qua_mi2s, qup0, qup1, qup2, qup3, qup4, qup5, qup6, qup7, qup8,
+                qup9, qup10, qup11, qup12, qup13, qup14, qup15, qup16, qup17,
+                qup18, qup19, qup_l4, qup_l5, qup_l6, rgmii, sd_write, sdc4,
+                sdc4_clk, sdc4_cmd, sec_mi2s, sp_cmu, spkr_i2s, ter_mi2s, tgu,
+                tsense_pwm1, tsense_pwm2, tsif1, tsif2, uim1, uim2, uim_batt,
+                usb0_phy, usb1_phy, usb2phy_ac, vfr_1, vsense_trigger,
+                wlan1_adc, wlan2_adc, wmss_reset ]
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
+        pinctrl@3100000 {
+                compatible = "qcom,sc8180x-tlmm";
+                reg = <0x03100000 0x300000>,
+                      <0x03500000 0x700000>,
+                      <0x03d00000 0x300000>;
+                reg-names = "west", "east", "south";
+                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+                gpio-ranges = <&tlmm 0 0 190>;
+
+                gpio-wo-subnode-state {
+                        pins = "gpio1";
+                        function = "gpio";
+                };
+
+                uart-w-subnodes-state {
+                        rx {
+                                pins = "gpio4";
+                                function = "qup6";
+                                bias-pull-up;
+                        };
+
+                        tx {
+                                pins = "gpio5";
+                                function = "qup6";
+                                bias-disable;
+                        };
+                };
+        };
+...
-- 
2.29.2

