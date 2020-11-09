Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B782AB13D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 07:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729568AbgKIG0g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 01:26:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:33364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729561AbgKIG0g (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 01:26:36 -0500
Received: from localhost.localdomain (unknown [122.171.147.34])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 42343206E5;
        Mon,  9 Nov 2020 06:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604903194;
        bh=Dazq1m38JSr4fzbVjXrSuwf6X2T/qSo+SXyemXJichw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RNOmKnvGbNkBBjx2WtYrngpfYUhxVilg/TZHRKcSjLFqfkzg5X2sVkCVAfO5yEYA6
         Oo/tTMnB1HvXBmCyblQe7fmhnLuRY33CaslJ6rmkPjLAn9hGrtHK7LzQ5RRcmRuKxd
         M5NbFvmpaYRUbOoEyuGSmS4srR/Rl2CuSrNpE0g4=
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add SDX55 pinctrl bindings
Date:   Mon,  9 Nov 2020 11:56:19 +0530
Message-Id: <20201109062620.14566-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201109062620.14566-1-vkoul@kernel.org>
References: <20201109062620.14566-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding Documentation details for Qualcomm SDX55
pinctrl driver.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml  | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
new file mode 100644
index 000000000000..112dd59ce7ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sdx55-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SDX55 TLMM block
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description: |
+  This binding describes the Top Level Mode Multiplexer block found in the
+  SDX55 platform.
+
+properties:
+  compatible:
+    const: qcom,sdx55-pinctrl
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-6])$"
+            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins. Functions are only valid for gpio pins.
+        enum: [ adsp_ext, atest, audio_ref, bimc_dte0, bimc_dte1, blsp_i2c1,
+                blsp_i2c2, blsp_i2c3, blsp_i2c4, blsp_spi1, blsp_spi2,
+                blsp_spi3, blsp_spi4, blsp_uart1, blsp_uart2, blsp_uart3,
+                blsp_uart4, char_exec, coex_uart, coex_uart2, cri_trng,
+                cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0,
+                ebi0_wrcdc, ebi2_a, ebi2_lcd, emac_gcc0, emac_gcc1,
+                emac_pps0, emac_pps1, ext_dbg, gcc_gp1, gcc_gp2, gcc_gp3,
+                gcc_plltest, gpio, i2s_mclk, jitter_bist, ldo_en, ldo_update,
+                mgpi_clk, m_voc, native_char, native_char0, native_char1,
+                native_char2, native_char3, native_tsens, native_tsense,
+                nav_gpio, pa_indicator, pcie_clkreq, pci_e, pll_bist, pll_ref,
+                pll_test, pri_mi2s, prng_rosc, qdss_cti, qdss_gpio,
+                qdss_gpio0, qdss_gpio1, qdss_gpio2, qdss_gpio3, qdss_gpio4,
+                qdss_gpio5, qdss_gpio6, qdss_gpio7, qdss_gpio8, qdss_gpio9,
+                qdss_gpio10, qdss_gpio11, qdss_gpio12, qdss_gpio13,
+                qdss_gpio14, qdss_gpio15, qdss_stm0, qdss_stm1, qdss_stm2,
+                qdss_stm3, qdss_stm4, qdss_stm5, qdss_stm6, qdss_stm7,
+                qdss_stm8, qdss_stm9, qdss_stm10, qdss_stm11, qdss_stm12,
+                qdss_stm13, qdss_stm14, qdss_stm15, qdss_stm16, qdss_stm17,
+                qdss_stm18, qdss_stm19, qdss_stm20, qdss_stm21, qdss_stm22,
+                qdss_stm23, qdss_stm24, qdss_stm25, qdss_stm26, qdss_stm27,
+                qdss_stm28, qdss_stm29, qdss_stm30, qdss_stm31, qlink0_en,
+                qlink0_req, qlink0_wmss, qlink1_en, qlink1_req, qlink1_wmss,
+                spmi_coex, sec_mi2s, spmi_vgi, tgu_ch0, uim1_clk, uim1_data,
+                uim1_present, uim1_reset, uim2_clk, uim2_data, uim2_present,
+                uim2_reset, usb2phy_ac, vsense_trigger ]
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
+        tlmm: pinctrl@1f00000 {
+                compatible = "qcom,sdx55-pinctrl";
+                reg = <0x0f100000 0x300000>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                gpio-ranges = <&tlmm 0 0 108>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+                interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+
+                serial-pins {
+                        pins = "gpio8", "gpio9";
+                        function = "blsp_uart3";
+                        drive-strength = <8>;
+                        bias-disable;
+                };
+        };
+
+...
-- 
2.26.2

