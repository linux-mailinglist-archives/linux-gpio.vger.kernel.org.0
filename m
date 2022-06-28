Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2B155E94B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 18:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347490AbiF1Oz6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 10:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbiF1Ozx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 10:55:53 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33422D95;
        Tue, 28 Jun 2022 07:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZUKFetas46+aPd037CIZl7qiYG7efJ46uJDezpqRzWg=; b=jzuygwrCjCGPjqzwyfbtyyArom
        ksrcJtmwFDuUdIjSWnD1jUvX/U5StBoeYTSLlgfleMNPPr1ggJPcowuP5oJd1BO4xQz1gMz8WIrf1
        92QMCdAwdaQCfIF9AydAr8xmbsn+jndGOPhfM2PjdT6Yq9PXkVPqmNb62/IKyPjxEOQovWDR4hlig
        1ZqYdQxnK0E+CCWPJETVxNRz0D4ksZBOmrC79Sm9joER8uRO5DI0ROGKZiRVCzVwkDm5g7dRakGZW
        l2K5JNRPEWGweQ8fpTcpraZbBDVqZNrDbZ5XIkQob2I/yycw7L6YwfK7dUupLhqYJasfRnonLecw1
        mU9R8mEw==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o6Cd0-006LlH-Cp; Tue, 28 Jun 2022 16:55:46 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: Add DT schema for qcom,msm8909-tlmm
Date:   Tue, 28 Jun 2022 16:55:01 +0200
Message-Id: <20220628145502.4158234-2-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220628145502.4158234-1-stephan.gerhold@kernkonzept.com>
References: <20220628145502.4158234-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the "qcom,msm8909-tlmm" compatible for the TLMM/pin control
block in the MSM8909 SoC, together with the allowed GPIOs and functions.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 .../bindings/pinctrl/qcom,msm8909-tlmm.yaml   | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
new file mode 100644
index 000000000000..e03530091478
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,msm8909-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. MSM8909 TLMM block
+
+maintainers:
+  - Stephan Gerhold <stephan@gerhold.net>
+
+description: |
+  This binding describes the Top Level Mode Multiplexer (TLMM) block found
+  in the MSM8909 platform.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,msm8909-tlmm
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
+      - $ref: "#/$defs/qcom-msm8909-tlmm-state"
+      - patternProperties:
+          ".*":
+            $ref: "#/$defs/qcom-msm8909-tlmm-state"
+
+$defs:
+  qcom-msm8909-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-7])$"
+            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd,
+                      sdc2_data, qdsd_clk, qdsd_cmd, qdsd_data0, qdsd_data1,
+                      qdsd_data2, qdsd_data3 ]
+        minItems: 1
+        maxItems: 16
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ adsp_ext, atest_bbrx0, atest_bbrx1, atest_char, atest_char0,
+                atest_char1, atest_char2, atest_char3, atest_combodac,
+                atest_gpsadc0, atest_gpsadc1, atest_wlan0, atest_wlan1,
+                bimc_dte0, bimc_dte1, blsp_i2c1, blsp_i2c2, blsp_i2c3,
+                blsp_i2c4, blsp_i2c5, blsp_i2c6, blsp_spi1, blsp_spi1_cs1,
+                blsp_spi1_cs2, blsp_spi1_cs3, blsp_spi2, blsp_spi2_cs1,
+                blsp_spi2_cs2, blsp_spi2_cs3, blsp_spi3, blsp_spi3_cs1,
+                blsp_spi3_cs2, blsp_spi3_cs3, blsp_spi4, blsp_spi5, blsp_spi6,
+                blsp_uart1, blsp_uart2, blsp_uim1, blsp_uim2, cam_mclk,
+                cci_async, cci_timer0, cci_timer1, cci_timer2, cdc_pdm0,
+                dbg_out, dmic0_clk, dmic0_data, ebi0_wrcdc, ebi2_a, ebi2_lcd,
+                ext_lpass, gcc_gp1_clk_a, gcc_gp1_clk_b, gcc_gp2_clk_a,
+                gcc_gp2_clk_b, gcc_gp3_clk_a, gcc_gp3_clk_b, gcc_plltest, gpio,
+                gsm0_tx, ldo_en, ldo_update, m_voc, mdp_vsync, modem_tsync,
+                nav_pps, nav_tsync, pa_indicator, pbs0, pbs1, pbs2,
+                pri_mi2s_data0_a, pri_mi2s_data0_b, pri_mi2s_data1_a,
+                pri_mi2s_data1_b, pri_mi2s_mclk_a, pri_mi2s_mclk_b,
+                pri_mi2s_sck_a, pri_mi2s_sck_b, pri_mi2s_ws_a, pri_mi2s_ws_b,
+                prng_rosc, pwr_crypto_enabled_a, pwr_crypto_enabled_b,
+                pwr_modem_enabled_a, pwr_modem_enabled_b, pwr_nav_enabled_a,
+                pwr_nav_enabled_b, qdss_cti_trig_in_a0, qdss_cti_trig_in_a1,
+                qdss_cti_trig_in_b0, qdss_cti_trig_in_b1, qdss_cti_trig_out_a0,
+                qdss_cti_trig_out_a1, qdss_cti_trig_out_b0,
+                qdss_cti_trig_out_b1, qdss_traceclk_a, qdss_tracectl_a,
+                qdss_tracedata_a, qdss_tracedata_b, sd_write, sec_mi2s,
+                smb_int, ssbi0, ssbi1, uim1_clk, uim1_data, uim1_present,
+                uim1_reset, uim2_clk, uim2_data, uim2_present, uim2_reset,
+                uim3_clk, uim3_data, uim3_present, uim3_reset, uim_batt,
+                wcss_bt, wcss_fm, wcss_wlan ]
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
+
+        pinctrl@1000000 {
+                compatible = "qcom,msm8909-tlmm";
+                reg = <0x1000000 0x300000>;
+                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                gpio-ranges = <&tlmm 0 0 117>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+
+                gpio-wo-subnode-state {
+                        pins = "gpio1";
+                        function = "gpio";
+                };
+
+                uart-w-subnodes-state {
+                        rx {
+                                pins = "gpio4";
+                                function = "blsp_uart1";
+                                bias-pull-up;
+                        };
+
+                        tx {
+                                pins = "gpio5";
+                                function = "blsp_uart1";
+                                bias-disable;
+                        };
+                };
+        };
+...
-- 
2.30.2

