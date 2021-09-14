Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDB2240A897
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 09:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbhINHvQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Sep 2021 03:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbhINHvJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Sep 2021 03:51:09 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637D9C0610CC
        for <linux-gpio@vger.kernel.org>; Tue, 14 Sep 2021 00:46:08 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id v19so5580238pjh.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Sep 2021 00:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lmq/3p8b6gCdy0LwTEfTOflVwMubDTocWYQCzP1Wrts=;
        b=o4lt0sKWMVzszIIlMUkjlFatK59Yagsc6USTlJf707SJgnf9pTzwofTB5EjxDm9Elz
         PsIoVVgkIQ/IHWFdSOGdJxbuQ36Um+dZIUYnA9MQ7JwlUr8Ne6chiC56IwiJr7rTcty4
         ubf/yWitvYVI/UzweSPVyL7RlRAkJU2CjnGNhCil6SH7bKi63Sxa8/phiz4zDI/QrXg/
         qp4eqkCrgjqdpuQoGdNNbobqhVuTRzgMbq6wUnP0BQ2r5xrSoLMFsPM/oE7rdcOGEZZa
         H7GFpQBAdKG8+E+Qsy4+LNDVdk5cMbxlnI5AqNwu5o+KqflzLu52Nl/vtPz4RSfqGQt3
         kOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lmq/3p8b6gCdy0LwTEfTOflVwMubDTocWYQCzP1Wrts=;
        b=jGAxHFuRYwqZoUuxj89CKwJFmVxd0U/xNc6cHN8kU11e74LuIlkup+L36hSuCyYqx/
         ZjjP2HX1B3Cca5PYk/PRZw0wHhbxLLWYutHmVle7WqkNrKntpYmQvBLtmnY3FbqRs/Uj
         gPXXuXFrOmwxEK7otMqS/nmiK/XV7D9x0Y8y4RRCVhb4c7AYsyxky82iavDQK+QUwl0k
         GAt2WrN+DjrKMrlkz3HDNtUc2Rq4eO0Hd/bTHLlJfgus3o5vKtKr2OAxO8c1sV3dYN+E
         N1ZCR7PExItkaoqLZycsx2nFbnGm2VS3BGZnMPKLQmNqb1z/zJsx76MUxdHBx/ZxvYpo
         VXwQ==
X-Gm-Message-State: AOAM533gPfGPV24xMerf2p/VIZ18NetxBe9NxZA+s9etLGPI4q/ko0yv
        ZuGHcbsxaMkUGzAqimIkNR4eMQ==
X-Google-Smtp-Source: ABdhPJxNKZnMu+JDgHY6/QeHg94qAsA/uytqLpHvYG7dIC7Nzviz/juKVkCIxOLMGzDq7SJJlrToJQ==
X-Received: by 2002:a17:902:6e02:b0:137:b47e:d779 with SMTP id u2-20020a1709026e0200b00137b47ed779mr13929231plk.50.1631605567911;
        Tue, 14 Sep 2021 00:46:07 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id u16sm6696923pfn.68.2021.09.14.00.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 00:46:07 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add QCM2290 pinctrl bindings
Date:   Tue, 14 Sep 2021 15:45:41 +0800
Message-Id: <20210914074542.12957-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914074542.12957-1-shawn.guo@linaro.org>
References: <20210914074542.12957-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree bindings for QCM2290 pinctrl.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../pinctrl/qcom,qcm2290-pinctrl.yaml         | 186 ++++++++++++++++++
 1 file changed, 186 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
new file mode 100644
index 000000000000..487f91462bfe
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
@@ -0,0 +1,186 @@
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-2])$"
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
+        enum: [ qup0, gpio, ddr_bist, phase_flag0, qdss_gpio8, atest_tsens,
+                mpm_pwr, m_voc, phase_flag1, qdss_gpio9, atest_tsens2,
+                phase_flag2, qdss_gpio10, dac_calib0, atest_usb10, phase_flag3,
+                qdss_gpio11, dac_calib1, atest_usb11, qup1, CRI_TRNG0,
+                phase_flag4, dac_calib2, atest_usb12, CRI_TRNG1, phase_flag5,
+                dac_calib3, atest_usb13, qup2, phase_flag6, dac_calib4,
+                atest_usb1, qup3, pbs_out, PLL_BIST, qdss_gpio, tsense_pwm,
+                AGERA_PLL, pbs0, qdss_gpio0, pbs1, qdss_gpio1, qup4, tgu_ch0,
+                tgu_ch1, qup5, tgu_ch2, phase_flag7, qdss_gpio4, dac_calib5,
+                tgu_ch3, phase_flag8, qdss_gpio5, dac_calib6, phase_flag9,
+                qdss_gpio6, dac_calib7, phase_flag10, qdss_gpio7, dac_calib8,
+                SDC2_TB, CRI_TRNG, pbs2, qdss_gpio2, pwm_0, SDC1_TB, pbs3,
+                qdss_gpio3, cam_mclk, pbs4, adsp_ext, pbs5, cci_i2c, prng_rosc,
+                pbs6, phase_flag11, dac_calib9, atest_usb20, pbs7, phase_flag12,
+                dac_calib10, atest_usb21, CCI_TIMER1, GCC_GP1, pbs8,
+                phase_flag13, dac_calib11, atest_usb22, cci_async, CCI_TIMER0,
+                pbs9, phase_flag14, dac_calib12, atest_usb23, pbs10,
+                phase_flag15, dac_calib13, atest_usb2, vsense_trigger, qdss_cti,
+                CCI_TIMER2, pwm_1, phase_flag16, dac_calib14, atest_char,
+                phase_flag17, dac_calib15, atest_char0, GP_PDM0, phase_flag18,
+                dac_calib16, atest_char1, CCI_TIMER3, GP_PDM1, phase_flag19,
+                dac_calib17, atest_char2, GP_PDM2, phase_flag20, dac_calib18,
+                atest_char3, phase_flag21, phase_flag22, char_exec, NAV_GPIO,
+                phase_flag23, phase_flag24, phase_flag25, pbs14, qdss_gpio14,
+                vfr_1, pbs15, qdss_gpio15, PA_INDICATOR, pwm_2, gsm1_tx,
+                SSBI_WTR1, pll_bypassnl, pll_reset, phase_flag26, ddr_pxi0,
+                gsm0_tx, phase_flag27, GCC_GP2, qdss_gpio12, ddr_pxi1, GCC_GP3,
+                qdss_gpio13, dbg_out, uim2_data, pwm_3, uim2_clk, uim2_reset,
+                pwm_4, uim2_present, pwm_5, uim1_data, uim1_clk, uim1_reset,
+                uim1_present, dac_calib19, mdp_vsync, mdp_vsync_out_0,
+                mdp_vsync_out_1, dac_calib20, dac_calib21, pwm_6, atest_bbrx1,
+                pbs11, usb_phy, atest_bbrx0, pwm_7, mss_lte, pbs12, pbs13,
+                wlan1_adc0, wlan1_adc1, sd_write, JITTER_BIST,
+                atest_gpsadc_dtest0_native, atest_gpsadc_dtest1_native,
+                phase_flag28, dac_calib22, ddr_pxi2, phase_flag29, dac_calib23,
+                phase_flag30, dac_calib24, ddr_pxi3, pwm_8, phase_flag31,
+                dac_calib25, pwm_9 ]
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

