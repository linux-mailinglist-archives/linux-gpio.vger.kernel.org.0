Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9EB28FEBF
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 08:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394531AbgJPG7m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 02:59:42 -0400
Received: from z5.mailgun.us ([104.130.96.5]:24699 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394520AbgJPG7l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Oct 2020 02:59:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602831580; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=xcxsmxCIUvsJlF//IDWUoNfp3dAUx1VoQAyhaIngGw0=; b=S09VwH2P8k9USxtsWu8owZiDZpVwor7qrMhblOF4ko7XkQrjl83A8CT4Lj1VYbRBTfE4vfOS
 H6hhLJ6e7FXvQaC6TvhAmARcO1hGZwTgZV3C4lxf6JQkfvXT1Yt9i72XHe5Cdhn+ZC8+suyQ
 ke2GSFQrysP8ICZgDPhpBlNlTmU=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f8944d0588858a3043824f6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Oct 2020 06:59:27
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2628EC43382; Fri, 16 Oct 2020 06:59:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7AAA8C433F1;
        Fri, 16 Oct 2020 06:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7AAA8C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sc7280 pinctrl bindings
Date:   Fri, 16 Oct 2020 12:28:51 +0530
Message-Id: <1602831532-24818-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding Documentation details for Qualcomm SC7280
TLMM block.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 .../bindings/pinctrl/qcom,sc7280-pinctrl.yaml      | 170 +++++++++++++++++++++
 1 file changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
new file mode 100644
index 0000000..971cfaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SC7280 TLMM block
+
+maintainers:
+  - Rajendra Nayak <rnayak@codeaurora.org>
+
+description: |
+  This binding describes the Top Level Mode Multiplexer block found in the
+  SC7280 platform.
+
+properties:
+  compatible:
+    const: qcom,sc7280-pinctrl
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
+  '-pins$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-4])$"
+            - enum: [ sdc1_rclk, sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk,
+                      sdc2_cmd, sdc2_data, ufs_reset ]
+        minItems: 1
+        maxItems: 16
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ atest_char, atest_char0, atest_char1, atest_char2,
+                atest_char3, atest_usb0, atest_usb00, atest_usb01,
+                atest_usb02, atest_usb03, atest_usb1, atest_usb10,
+                atest_usb11, atest_usb12, atest_usb13, audio_ref,
+                cam_mclk, cci_async, cci_i2c, cci_timer0, cci_timer1,
+                cci_timer2, cci_timer3, cci_timer4, cmu_rng0, cmu_rng1,
+                cmu_rng2, cmu_rng3, coex_uart1, cri_trng, cri_trng0,
+                cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1, dp_hot,
+                dp_lcd, edp_hot, edp_lcd, gcc_gp1, gcc_gp2, gcc_gp3,
+                gpio, host2wlan_sol, ibi_i3c, jitter_bist, lpass_slimbus,
+                mdp_vsync, mdp_vsync0, mdp_vsync1, mdp_vsync2, mdp_vsync3,
+                mdp_vsync4, mdp_vsync5, mi2s0_data0, mi2s0_data1, mi2s0_sck,
+                mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
+                mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws, mss_grfc0,
+                mss_grfc1, mss_grfc10, mss_grfc11, mss_grfc12, mss_grfc2,
+                mss_grfc3, mss_grfc4, mss_grfc5, mss_grfc6, mss_grfc7,
+                mss_grfc8, mss_grfc9, nav_gpio0, nav_gpio1, nav_gpio2,
+                pa_indicator, pcie0_clkreqn, pcie1_clkreqn, phase_flag0,
+                phase_flag1, phase_flag10, phase_flag11, phase_flag12,
+                phase_flag13, phase_flag14, phase_flag15, phase_flag16,
+                phase_flag17, phase_flag18, phase_flag19, phase_flag2,
+                phase_flag20, phase_flag21, phase_flag22, phase_flag23,
+                phase_flag24, phase_flag25, phase_flag26, phase_flag27,
+                phase_flag28, phase_flag29, phase_flag3, phase_flag30,
+                phase_flag31, phase_flag4, phase_flag5, phase_flag6,
+                phase_flag7, phase_flag8, phase_flag9, pll_bist,
+                pll_bypassnl, pll_clk, pll_reset, pri_mi2s, prng_rosc,
+                qdss_cti, qdss_gpio, qdss_gpio0, qdss_gpio1, qdss_gpio10,
+                qdss_gpio11, qdss_gpio12, qdss_gpio13, qdss_gpio14,
+                qdss_gpio15, qdss_gpio2, qdss_gpio3, qdss_gpio4, qdss_gpio5,
+                qdss_gpio6, qdss_gpio7, qdss_gpio8, qdss_gpio9,
+                qlink0_enable, qlink0_request, qlink0_wmss, qlink1_enable,
+                qlink1_request, qlink1_wmss, qspi_clk, qspi_cs, qspi_data,
+                qup00, qup01, qup02, qup03, qup04, qup05, qup06, qup07,
+                qup10, qup11, qup12, qup13, qup14, qup15, qup16, qup17,
+                sdc40, sdc41, sdc42, sdc43, sdc4_clk, sdc4_cmd, sd_write,
+                sec_mi2s, tb_trig, tgu_ch0, tgu_ch1, tsense_pwm1,
+                tsense_pwm2, uim0_clk, uim0_data, uim0_present, uim0_reset,
+                uim1_clk, uim1_data, uim1_present, uim1_reset, usb2phy_ac,
+                usb_phy, vfr_0, vfr_1, vsense_trigger ]
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
+                compatible = "qcom,sc7280-pinctrl";
+                reg = <0xf000000 0x1000000>;
+                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+                gpio-ranges = <&tlmm 0 0 175>;
+                wakeup-parent = <&pdc>;
+
+                qup_uart5_default: qup-uart5-pins {
+                        pins = "gpio46", "gpio47";
+                        function = "qup13";
+                        drive-strength = <2>;
+                        bias-disable;
+                };
+        };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

