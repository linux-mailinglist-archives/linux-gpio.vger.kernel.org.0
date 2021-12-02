Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C738D465AEE
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 01:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354513AbhLBAgC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 19:36:02 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:5546 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234629AbhLBAgA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 19:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1638405159; x=1669941159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8ghn7GIsv78Jyc49KH0UIPLJisf3Hq7agbqHgATgk9M=;
  b=FJY3tXThXAwD/vUWjQeC2N9Tdsa7fQaW0yZOMY7vPwEGG/mjN0zNQUhO
   Rv3UTmSaEHNzDEaHSqTAWzkYJjjKvwhzgvw2/yp7ikfB/FseG7D+YL9xe
   xHv7iddjOEDOFxsANgkBvUs1pYAWcHjscVdtdEQbcBn635Je3AJ0RZGsH
   U=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 01 Dec 2021 16:32:38 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 16:32:38 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 1 Dec 2021 16:32:37 -0800
Received: from hu-vamslank-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 1 Dec 2021 16:32:37 -0800
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <linus.walleij@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Subject: [PATCH v5 1/2] dt-bindings: pinctrl: qcom: Add SDX65 pinctrl bindings
Date:   Wed, 1 Dec 2021 16:32:20 -0800
Message-ID: <829642d28acbe0f993b5b059cb984da9b5262fa0.1638404936.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638404936.git.quic_vamslank@quicinc.com>
References: <cover.1638404936.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Add device tree binding Documentation details for Qualcomm SDX65
pinctrl driver.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/pinctrl/qcom,sdx65-pinctrl.yaml  | 174 ++++++++++++++++++
 1 file changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
new file mode 100644
index 000000000000..f3487717da83
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sdx65-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SDX65 TLMM block
+
+maintainers:
+  - Vamsi krishna Lanka <quic_vamslank@quicinc.com>
+
+description:
+  This binding describes the Top Level Mode Multiplexer block found in the
+  SDX65 platform.
+
+properties:
+  compatible:
+    const: qcom,sdx65-tlmm
+
+  reg:
+    description: Specifies the base address and size of the TLMM register space
+    maxItems: 1
+
+  interrupts:
+    description: Specifies the TLMM summary IRQ
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
+          List of gpio pins affected by the properties specified in this subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9])$"
+            - enum: [ ufs_reset, sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data, sdc1_rclk ]
+        minItems: 1
+        maxItems: 150
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins. Functions are only valid for gpio pins.
+        enum: [ blsp_uart1, blsp_spi1, blsp_i2c1, blsp_uim1, atest_tsens,
+                bimc_dte1, dac_calib0, blsp_spi8, blsp_uart8, blsp_uim8,
+                qdss_cti_trig_out_b, bimc_dte0, dac_calib1, qdss_cti_trig_in_b,
+                dac_calib2, atest_tsens2, atest_usb1, blsp_spi10, blsp_uart10,
+                blsp_uim10, atest_bbrx1, atest_usb13, atest_bbrx0, atest_usb12,
+                mdp_vsync, edp_lcd, blsp_i2c10, atest_gpsadc1, atest_usb11,
+                atest_gpsadc0, edp_hot, atest_usb10, m_voc, dac_gpio, atest_char,
+                cam_mclk, pll_bypassnl, qdss_stm7, blsp_i2c8, qdss_tracedata_b,
+                pll_reset, qdss_stm6, qdss_stm5, qdss_stm4, atest_usb2, cci_i2c,
+                qdss_stm3, dac_calib3, atest_usb23, atest_char3, dac_calib4,
+                qdss_stm2, atest_usb22, atest_char2, qdss_stm1, dac_calib5,
+                atest_usb21, atest_char1, dbg_out, qdss_stm0, dac_calib6,
+                atest_usb20, atest_char0, dac_calib10, qdss_stm10,
+                qdss_cti_trig_in_a, cci_timer4, blsp_spi6, blsp_uart6, blsp_uim6,
+                blsp2_spi, qdss_stm9, qdss_cti_trig_out_a, dac_calib11,
+                qdss_stm8, cci_timer0, qdss_stm13, dac_calib7, cci_timer1,
+                qdss_stm12, dac_calib8, cci_timer2, blsp1_spi, qdss_stm11,
+                dac_calib9, cci_timer3, cci_async, dac_calib12, blsp_i2c6,
+                qdss_tracectl_a, dac_calib13, qdss_traceclk_a, dac_calib14,
+                dac_calib15, hdmi_rcv, dac_calib16, hdmi_cec, pwr_modem,
+                dac_calib17, hdmi_ddc, pwr_nav, dac_calib18, pwr_crypto,
+                dac_calib19, hdmi_hot, dac_calib20, dac_calib21, pci_e0,
+                dac_calib22, dac_calib23, dac_calib24, tsif1_sync, dac_calib25,
+                sd_write, tsif1_error, blsp_spi2, blsp_uart2, blsp_uim2,
+                qdss_cti, blsp_i2c2, blsp_spi3, blsp_uart3, blsp_uim3, blsp_i2c3,
+                uim3, blsp_spi9, blsp_uart9, blsp_uim9, blsp10_spi, blsp_i2c9,
+                blsp_spi7, blsp_uart7, blsp_uim7, qdss_tracedata_a, blsp_i2c7,
+                qua_mi2s, gcc_gp1_clk_a, ssc_irq, uim4, blsp_spi11, blsp_uart11,
+                blsp_uim11, gcc_gp2_clk_a, gcc_gp3_clk_a, blsp_i2c11, cri_trng0,
+                cri_trng1, cri_trng, qdss_stm18, pri_mi2s, qdss_stm17, blsp_spi4,
+                blsp_uart4, blsp_uim4, qdss_stm16, qdss_stm15, blsp_i2c4,
+                qdss_stm14, dac_calib26, spkr_i2s, audio_ref, lpass_slimbus,
+                isense_dbg, tsense_pwm1, tsense_pwm2, btfm_slimbus, ter_mi2s,
+                qdss_stm22, qdss_stm21, qdss_stm20, qdss_stm19, gcc_gp1_clk_b,
+                sec_mi2s, blsp_spi5, blsp_uart5, blsp_uim5, gcc_gp2_clk_b,
+                gcc_gp3_clk_b, blsp_i2c5, blsp_spi12, blsp_uart12, blsp_uim12,
+                qdss_stm25, qdss_stm31, blsp_i2c12, qdss_stm30, qdss_stm29,
+                tsif1_clk, qdss_stm28, tsif1_en, tsif1_data, sdc4_cmd, qdss_stm27,
+                qdss_traceclk_b, tsif2_error, sdc43, vfr_1, qdss_stm26, tsif2_clk,
+                sdc4_clk, qdss_stm24, tsif2_en, sdc42, qdss_stm23, qdss_tracectl_b,
+                sd_card, tsif2_data, sdc41, tsif2_sync, sdc40, mdp_vsync_p_b,
+                ldo_en, mdp_vsync_s_b, ldo_update, blsp11_uart_tx_b, blsp11_uart_rx_b,
+                blsp11_i2c_sda_b, prng_rosc, blsp11_i2c_scl_b, uim2, uim1, uim_batt,
+                pci_e2, pa_indicator, adsp_ext, ddr_bist, qdss_tracedata_11,
+                qdss_tracedata_12, modem_tsync, nav_dr, nav_pps, pci_e1, gsm_tx,
+                qspi_cs, ssbi2, ssbi1, mss_lte, qspi_clk, qspi0, qspi1, qspi2, qspi3,
+                gpio ]
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
+        tlmm: pinctrl@f100000 {
+                compatible = "qcom,sdx65-tlmm";
+                reg = <0x03000000 0xdc2000>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                gpio-ranges = <&tlmm 0 0 109>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+                interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+
+                serial-pins {
+                    pins = "gpio8", "gpio9";
+                    function = "blsp_uart3";
+                    drive-strength = <2>;
+                    bias-disable;
+                };
+         };
+...
-- 
2.33.1

