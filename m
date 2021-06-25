Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599ED3B3C7A
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jun 2021 08:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233187AbhFYGLa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 02:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233180AbhFYGL1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jun 2021 02:11:27 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE9EC061574;
        Thu, 24 Jun 2021 23:09:06 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id hz1so13340079ejc.1;
        Thu, 24 Jun 2021 23:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mOjYWOH3BjgpL4lbxco8UX9iWMixXUecdkqKee63INs=;
        b=RimfqH7rUwmJ3kUDG3/Urkov9qM6kjW0RjNs1L+nYDv0CUs7DpVRlIse/trACrJiF/
         V5B2Ym2zCOUVTMFciG52xkNTHEccq3G+aqSJMVVZ19ZgB909VUY12QJrznUmysnBkSu2
         YTJeisd4gU9QmB4LmU94hvrRop5v+SsQMP5A3DTVqX9B9uyEHy8G0+Fu76nPfrWKGeFj
         EFgIbts3Yk0f/UrDKo7u6/zW4jT/G47C7SxIC5xXUHEZRg02ujOOKJE31rlJ/lqy6uiz
         vbESqWQru1CX4+84UdrjFM/gsx6G00JFOE4dDTzg2nU7Y6dv81AIcvsdgnr5VZIUqxLA
         Irbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mOjYWOH3BjgpL4lbxco8UX9iWMixXUecdkqKee63INs=;
        b=Q5uEI1Y7fD6HGrG7SsR4Ymss7rBp7DsFFgvWeT4izjiS4q8dj5bSB1wjXYWYSvQ+co
         ypgOBDFppfW2MyXmyyvjjLbNS5BL+kiUOvXOvRPGn+BlP0dlBtbenpsvCYtckghcArTt
         nDnCQSTYVMpbCkqKU5clziNMxrARBUkLOt4UDkEVauCKFlzIVceo04MHbsjqZnJSqSjp
         F5tnNfYaBAu41nUENvI28+FycMfALBOZq/a5FIbY8YN6g4709nJDYcXbmD5g4Iv6kA/A
         clyizlVOCHXvldjOTOwvERo8NTTYF9KxnStSMhXsNDcfGBczvw8umHWGAwS1ps7+bUfC
         ck3g==
X-Gm-Message-State: AOAM533f2GK6x/Weekc7j+a8xbLt7jTJFkou6tKGjwjCij3xtA9uz8en
        7wPm00XkVUvMK+kwji35/90=
X-Google-Smtp-Source: ABdhPJwujpOY/LiNthhFgT/pv72tbCfnE0hEa5RYh2LhNiAPWf1uVcZuqzb3k/LpayvVHd6ZLw+VOg==
X-Received: by 2002:a17:906:9148:: with SMTP id y8mr8973619ejw.57.1624601344638;
        Thu, 24 Jun 2021 23:09:04 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id c18sm3198732edt.18.2021.06.24.23.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 23:09:04 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add SM6115 pinctrl bindings
Date:   Fri, 25 Jun 2021 09:08:56 +0300
Message-Id: <20210625060857.3069255-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625060857.3069255-1-iskren.chernev@gmail.com>
References: <20210625060857.3069255-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding Documentation details for Qualcomm SM6115 and
SM4250 pinctrl.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml | 208 ++++++++++++++++++
 1 file changed, 208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
new file mode 100644
index 000000000000..92443a836e86
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
@@ -0,0 +1,208 @@
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
+        enum: [ qup0, gpio, ddr_bist, phase_flag0, qdss_gpio8, atest_tsens,
+                mpm_pwr, m_voc, phase_flag1, qdss_gpio9, atest_tsens2,
+                phase_flag2, qdss_gpio10, dac_calib0, atest_usb10,
+                phase_flag3, qdss_gpio11, dac_calib1, atest_usb11, qup1,
+                cri_trng0, phase_flag4, dac_calib2, atest_usb12, cri_trng1,
+                phase_flag5, dac_calib3, atest_usb13, qup2, phase_flag6,
+                dac_calib4, atest_usb1, qup3, pbs_out, pll_bist, qdss_gpio,
+                tsense_pwm, agera_pll, pbs0, qdss_gpio0, pbs1, qdss_gpio1,
+                qup4, tgu_ch0, tgu_ch1, qup5, tgu_ch2, phase_flag7,
+                qdss_gpio4, dac_calib5, tgu_ch3, phase_flag8, qdss_gpio5,
+                dac_calib6, phase_flag9, qdss_gpio6, dac_calib7,
+                phase_flag10, qdss_gpio7, dac_calib8, sdc2_tb, cri_trng,
+                pbs2, qdss_gpio2, sdc1_tb, pbs3, qdss_gpio3, cam_mclk, pbs4,
+                adsp_ext, pbs5, cci_i2c, prng_rosc, pbs6, phase_flag11,
+                dac_calib9, atest_usb20, pbs7, phase_flag12, dac_calib10,
+                atest_usb21, cci_timer1, gcc_gp1, pbs8, phase_flag13,
+                dac_calib11, atest_usb22, cci_async, cci_timer0, pbs9,
+                phase_flag14, dac_calib12, atest_usb23, pbs10, phase_flag15,
+                dac_calib13, atest_usb2, vsense_trigger, qdss_cti,
+                cci_timer2, phase_flag16, dac_calib14, atest_char,
+                phase_flag17, dac_calib15, atest_char0, gp_pdm0,
+                phase_flag18, dac_calib16, atest_char1, cci_timer3, gp_pdm1,
+                phase_flag19, dac_calib17, atest_char2, gp_pdm2,
+                phase_flag20, dac_calib18, atest_char3, phase_flag21,
+                phase_flag22, nav_gpio, phase_flag23, phase_flag24,
+                phase_flag25, pbs14, qdss_gpio14, vfr_1, pbs15, qdss_gpio15,
+                pa_indicator, gsm1_tx, ssbi_wtr1, pll_bypassnl, pll_reset,
+                phase_flag26, ddr_pxi0, gsm0_tx, phase_flag27, gcc_gp2,
+                qdss_gpio12, ddr_pxi1, gcc_gp3, qdss_gpio13, dbg_out,
+                uim2_data, uim2_clk, uim2_reset, uim2_present, uim1_data,
+                uim1_clk, uim1_reset, uim1_present, dac_calib19, mdp_vsync,
+                mdp_vsync_out_0, mdp_vsync_out_1, dac_calib20, dac_calib21,
+                atest_bbrx1, pbs11, usb_phy, atest_bbrx0, mss_lte, pbs12,
+                pbs13, wlan1_adc0, wlan1_adc1, sd_write, jitter_bist,
+                atest_gpsadc_dtest0_native, atest_gpsadc_dtest1_native,
+                phase_flag28, dac_calib22, ddr_pxi2, phase_flag29,
+                dac_calib23, phase_flag30, dac_calib24, ddr_pxi3,
+                phase_flag31, dac_calib25 ]
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

