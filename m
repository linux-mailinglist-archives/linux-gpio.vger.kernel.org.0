Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A42EA786D34
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 12:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240843AbjHXK5k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 06:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240899AbjHXK50 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 06:57:26 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 52146E51;
        Thu, 24 Aug 2023 03:57:24 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 37OAurXsB014250, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 37OAurXsB014250
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 24 Aug 2023 18:56:53 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Thu, 24 Aug 2023 18:57:10 +0800
Received: from RTEXH36506.realtek.com.tw (172.21.6.27) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 24 Aug 2023 18:57:10 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 24 Aug 2023 18:57:09 +0800
From:   Tzuyi Chang <tychang@realtek.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 7/7] dt-bindings: pinctrl: realtek: add RTD1619B pinctrl binding
Date:   Thu, 24 Aug 2023 18:57:03 +0800
Message-ID: <20230824105703.19612-8-tychang@realtek.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824105703.19612-1-tychang@realtek.com>
References: <20230824105703.19612-1-tychang@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-KSE-ServerInfo: RTEXDAG02.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree bindings for RTD1619B.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
---
v1 to v2 change:
1. Add a description for RTD1619B.
2. Rename realtek,pdrive, realtekmndrive and realtek,dcycle.
3. Add a description for PMOS and NMOS driving strength.
4. Remove the wildcard in the compatible strings.
5. Use '-pins$' to be node name pattern.
---
 .../pinctrl/realtek,rtd1619b-pinctrl.yaml     | 188 ++++++++++++++++++
 1 file changed, 188 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
new file mode 100644
index 000000000000..e0c38f714a0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
@@ -0,0 +1,188 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2023 Realtek Semiconductor Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/realtek,rtd1619b-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek DHC RTD1619B Pin Controller
+
+maintainers:
+  - TY Chang <tychang@realtek.com>
+
+description:
+  The Realtek DHC RTD1619B is a high-definition media processor SoC. The
+  RTD1619B pin controller is used to control pin function, pull up/down
+  resistor, drive strength, schmitt trigger and power source.
+
+properties:
+  compatible:
+    const: realtek,rtd1619b-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '^.*$':
+    if:
+      type: object
+    then:
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+
+      properties:
+        pins:
+          items:
+            enum: [ gpio_0, gpio_1, gpio_2, gpio_3, gpio_4, gpio_5, gpio_6, gpio_7,
+                    gpio_8, gpio_9, gpio_10, gpio_11, gpio_12, gpio_13, gpio_14,
+                    gpio_15, gpio_16, gpio_17, gpio_18, gpio_19, gpio_20, gpio_21,
+                    gpio_22, gpio_23, usb_cc2, gpio_25, gpio_26, gpio_27, gpio_28,
+                    gpio_29, gpio_30, gpio_31, gpio_32, gpio_33, gpio_34, gpio_35,
+                    hif_data, hif_en, hif_rdy, hif_clk, gpio_40, gpio_41, gpio_42,
+                    gpio_43, gpio_44, gpio_45, gpio_46, gpio_47, gpio_48, gpio_49,
+                    gpio_50, usb_cc1, gpio_52, gpio_53, ir_rx, ur0_rx, ur0_tx,
+                    gpio_57, gpio_58, gpio_59, gpio_60, gpio_61, gpio_62, gpio_63,
+                    gpio_64, gpio_65, gpio_66, gpio_67, gpio_68, gpio_69, gpio_70,
+                    gpio_71, gpio_72, gpio_73, gpio_74, gpio_75, gpio_76, emmc_cmd,
+                    spi_ce_n, spi_sck, spi_so, spi_si, emmc_rst_n, emmc_dd_sb,
+                    emmc_clk, emmc_data_0, emmc_data_1, emmc_data_2, emmc_data_3,
+                    emmc_data_4, emmc_data_5, emmc_data_6, emmc_data_7, ur2_loc,
+                    gspi_loc, sdio_loc, hi_loc, hi_width, sf_en, arm_trace_dbg_en,
+                    pwm_01_open_drain_en_loc0, pwm_23_open_drain_en_loc0,
+                    pwm_01_open_drain_en_loc1, pwm_23_open_drain_en_loc1,
+                    ejtag_acpu_loc, ejtag_vcpu_loc, ejtag_scpu_loc, dmic_loc,
+                    iso_gspi_loc, ejtag_ve3_loc, ejtag_aucpu0_loc, ejtag_aucpu1_loc ]
+
+        function:
+          enum: [ gpio, nf, nf_spi, spi, pmic, spdif, spdif_coaxial, spdif_optical_loc0,
+                  spdif_optical_loc1, emmc_spi, emmc, sc1, uart0, uart1, uart2_loc0, uart2_loc1,
+                  gspi_loc1, iso_gspi_loc1, i2c0, i2c1, i2c3, i2c4, i2c5, pwm0, pwm1, pwm2,
+                  pwm3, etn_led, etn_phy, etn_clk, sc0, vfd, gspi_loc0, iso_gspi_loc0, pcie1,
+                  pcie2, sd, sdio_loc0, sdio_loc1, hi, hi_m, dc_fan, pll_test_loc0, pll_test_loc1,
+                  usb_cc1, usb_cc2, ir_rx, tdm_ai_loc0, tdm_ai_loc1, dmic_loc0, dmic_loc1,
+                  ai_loc0, ai_loc1, tp0, tp1, ao, uart2_disable, gspi_disable, sdio_disable,
+                  hi_loc_disable, hi_loc0, hi_width_disable, hi_width_1bit, vtc_i2si_loc0,
+                  vtc_tdm_loc0, vtc_dmic_loc0, vtc_i2si_loc1, vtc_tdm_loc1, vtc_dmic_loc1,
+                  vtc_i2so, ve3_ejtag_loc0, aucpu0_ejtag_loc0, aucpu1_ejtag_loc0, ve3_ejtag_loc1,
+                  aucpu0_ejtag_loc1, aucpu1_ejtag_loc1, ve3_ejtag_loc2, aucpu0_ejtag_loc2,
+                  aucpu1_ejtag_loc2, scpu_ejtag_loc0, acpu_ejtag_loc0, vcpu_ejtag_loc0,
+                  scpu_ejtag_loc1, acpu_ejtag_loc1, vcpu_ejtag_loc1, scpu_ejtag_loc2,
+                  acpu_ejtag_loc2, vcpu_ejtag_loc2, ve3_ejtag_disable, aucpu0_ejtag_disable,
+                  aucpu1_ejtag_disable, acpu_ejtag_disable, vcpu_ejtag_disable,
+                  scpu_ejtag_disable, iso_gspi_disable, sf_disable, sf_enable,
+                  arm_trace_debug_disable, arm_trace_debug_enable, pwm_normal, pwm_open_drain,
+                  standby_dbg, test_loop_dis ]
+
+        drive-strength:
+          enum: [4, 8]
+
+        bias-pull-down: true
+
+        bias-pull-up: true
+
+        bias-disable: true
+
+        input-schmitt-enable: true
+
+        input-schmitt-disable: true
+
+        drive-push-pull: true
+
+        power-source:
+          description: |
+            Valid arguments are described as below:
+            0: power supply of 1.8V
+            1: power supply of 3.3V
+          enum: [0, 1]
+
+        realtek,drive-strength-p:
+          description: |
+            Some of pins can be driven using the P-MOS and N-MOS transistor to
+            achieve finer adjustments. The block-diagram representation is as
+            follows:
+                           VDD
+                            |
+                        ||--+
+                 +-----o||     P-MOS-FET
+                 |      ||--+
+            IN --+          +----- out
+                 |      ||--+
+                 +------||     N-MOS-FET
+                        ||--+
+                            |
+                           GND
+            The driving strength of the P-MOS/N-MOS transistors impacts the
+            waveform's rise/fall times. Greater driving strength results in
+            shorter rise/fall times. Each P-MOS and N-MOS transistor offers
+            8 configurable levels (0 to 7), with higher values indicating
+            greater driving strength, contributing to achieving the desired
+            speed.
+
+            The realtek,drive-strength-p is used to control the driving strength
+            of the P-MOS output.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          minimum: 0
+          maximum: 7
+
+        realtek,drive-strength-n:
+          description: |
+            Similar to the realtek,drive-strength-p, the realtek,drive-strength-n
+            is used to control the driving strength of the N-MOS output.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          minimum: 0
+          maximum: 7
+
+        realtek,duty-cycle:
+          description: |
+            An integer describing the level to adjust output duty cycle, controlling
+            the proportion of positive and negative waveforms in nanoseconds.
+            Valid arguments are described as below:
+            0: 0ns
+            2: + 0.25ns
+            3: + 0.5ns
+            4: -0.25ns
+            5: -0.5ns
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [ 0, 2, 3, 4, 5 ]
+
+      required:
+        - pins
+
+      additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+     pinctrl@4e000 {
+         compatible = "realtek,rtd1619b-pinctrl";
+         reg = <0x4e000 0x130>;
+
+         emmc-hs200-pins {
+             pins = "emmc_clk",
+                    "emmc_cmd",
+                    "emmc_data_0",
+                    "emmc_data_1",
+                    "emmc_data_2",
+                    "emmc_data_3",
+                    "emmc_data_4",
+                    "emmc_data_5",
+                    "emmc_data_6",
+                    "emmc_data_7";
+             function = "emmc";
+             realtek,drive-strength-p = <0x2>;
+             realtek,drive-strength-n = <0x2>;
+         };
+
+         i2c-0-pins {
+             pins = "gpio_12",
+                    "gpio_13";
+             function = "i2c0";
+             drive-strength = <4>;
+         };
+     };
-- 
2.41.0

