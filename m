Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41B9251BAAB
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 10:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349606AbiEEIlw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 May 2022 04:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231853AbiEEIlv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 04:41:51 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5729D47AC2;
        Thu,  5 May 2022 01:38:04 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 6FE1B1F44D8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1651739883;
        bh=bQm58KefXrbmICcAqbuM9Y6DdLYnE6G+9A2ds3maBHQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Jb7wjf29fiQN5GLVhX0yh8Jq+Er895ROeaz2NEv0docppUV+KPQGADifYuqA7hGyB
         iyI9iwpLR2YjVymbt8AeFMscBww5OedyhGRFhFU5mwGdlXmaP7uJAeIFnND1wbzpA4
         sE5mooRZG1uBrQVtxMtRx1mZ+a9sBlPuJnZdh6lo4b1m51YGRAg/T8n4KCaj3VOQiq
         krQzLwuSoTmSRJm6DgPAjgjIHyIJz+o3Y1QRXZAJB4dyoiupA64kF7I9EJdYq0BVpq
         ouV05bq/IZT3ftfJPqwh+V8Md2AO09mXuyRN87i72pA1RjD2sO/oyAfxUwUXStDfms
         PjmDUI+x4a0dQ==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, sean.wang@kernel.org,
        angelogioacchino.delregno@collabora.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, nfraprado@collabora.com
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl bindings
Date:   Thu,  5 May 2022 10:37:56 +0200
Message-Id: <20220505083757.11288-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505083757.11288-1-angelogioacchino.delregno@collabora.com>
References: <20220505083757.11288-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,UPPERCASE_50_75 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add devicetree and pinfunc bindings for MediaTek Helio X10 MT6795.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../pinctrl/mediatek,pinctrl-mt6795.yaml      | 224 +++++
 include/dt-bindings/pinctrl/mt6795-pinfunc.h  | 908 ++++++++++++++++++
 2 files changed, 1132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
 create mode 100644 include/dt-bindings/pinctrl/mt6795-pinfunc.h

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
new file mode 100644
index 000000000000..d84f6a118f20
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
@@ -0,0 +1,224 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,pinctrl-mt6795.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6795 Pin Controller
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - Sean Wang <sean.wang@kernel.org>
+
+description: |
+  The Mediatek's Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt6795-pinctrl
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description: |
+      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
+      the amount of cells must be specified as 2. See the below
+      mentioned gpio binding representation for description of particular cells.
+    const: 2
+
+  gpio-ranges:
+    description: GPIO valid number range.
+    maxItems: 1
+
+  reg:
+    description:
+      Physical address base for gpio base and eint registers.
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: base
+      - const: eint
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupts:
+    description: The interrupt outputs to sysirq.
+    maxItems: 1
+
+# PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '^pins':
+        type: object
+        additionalProperties: false
+        description: |
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and
+          input schmitt.
+          An example of using macro:
+          pincontroller {
+            /* GPIO0 set as multifunction GPIO0 */
+            gpio-pins {
+              pins {
+                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+              }
+            };
+            /* GPIO45 set as multifunction SDA0 */
+            i2c0-pins {
+              pins {
+                pinmux = <PINMUX_GPIO45__FUNC_SDA0>;
+              }
+            };
+          };
+        $ref: "pinmux-node.yaml"
+
+        properties:
+          pinmux:
+            description: |
+              Integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux varies for different SoCs, and are
+              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h
+              directly.
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: mt6795 pull down PUPD/R0/R1 type define value.
+            description: |
+               For normal pull down type, it is not necessary to specify R1R0
+               values; When pull down type is PUPD/R0/R1, adding R1R0 defines
+               will set different resistance values.
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: mt6795 pull up PUPD/R0/R1 type define value.
+            description: |
+               For normal pull up type, it is not necessary to specify R1R0
+               values; When pull up type is PUPD/R0/R1, adding R1R0 defines
+               will set different resistance values.
+
+          bias-disable: true
+
+          output-high: true
+
+          output-low: true
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          mediatek,pull-up-adv:
+            description: |
+              Pull up setings for 2 pull resistors, R0 and R1. User can
+              configure those special pins. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+          mediatek,pull-down-adv:
+            description: |
+              Pull down settings for 2 pull resistors, R0 and R1. User can
+              configure those special pins. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+        required:
+          - pinmux
+
+allOf:
+  - $ref: "pinctrl.yaml#"
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/pinctrl/mt6795-pinfunc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pio: pinctrl@10005000 {
+            compatible = "mediatek,mt6795-pinctrl";
+            reg = <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
+            reg-names = "base", "eint";
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pio 0 0 196>;
+            interrupt-controller;
+            interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+            #interrupt-cells = <2>;
+
+            i2c0-pins {
+                pins-sda-scl {
+                    pinmux = <PINMUX_GPIO45__FUNC_SDA0>,
+                             <PINMUX_GPIO46__FUNC_SCL0>;
+                };
+            };
+
+            mmc0-pins {
+                pins-cmd-dat {
+                    pinmux = <PINMUX_GPIO154__FUNC_MSDC0_DAT0>,
+                             <PINMUX_GPIO155__FUNC_MSDC0_DAT1>,
+                             <PINMUX_GPIO156__FUNC_MSDC0_DAT2>,
+                             <PINMUX_GPIO157__FUNC_MSDC0_DAT3>,
+                             <PINMUX_GPIO158__FUNC_MSDC0_DAT4>,
+                             <PINMUX_GPIO159__FUNC_MSDC0_DAT5>,
+                             <PINMUX_GPIO160__FUNC_MSDC0_DAT6>,
+                             <PINMUX_GPIO161__FUNC_MSDC0_DAT7>,
+                             <PINMUX_GPIO162__FUNC_MSDC0_CMD>;
+                    input-enable;
+                    bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+                };
+
+                pins-clk {
+                    pinmux = <PINMUX_GPIO163__FUNC_MSDC0_CLK>;
+                    bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+                };
+
+                pins-rst {
+                    pinmux = <PINMUX_GPIO165__FUNC_MSDC0_RSTB>;
+                    bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
+                };
+            };
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/mt6795-pinfunc.h b/include/dt-bindings/pinctrl/mt6795-pinfunc.h
new file mode 100644
index 000000000000..4888bb7fb9cf
--- /dev/null
+++ b/include/dt-bindings/pinctrl/mt6795-pinfunc.h
@@ -0,0 +1,908 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 Collabora Ltd.
+ * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#ifndef __DTS_MT8173_PINFUNC_H
+#define __DTS_MT8173_PINFUNC_H
+
+#include <dt-bindings/pinctrl/mt65xx.h>
+
+#define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
+#define PINMUX_GPIO0__FUNC_IRDA_PDN (MTK_PIN_NO(0) | 1)
+#define PINMUX_GPIO0__FUNC_I2S1_WS (MTK_PIN_NO(0) | 2)
+#define PINMUX_GPIO0__FUNC_TDD_TMS (MTK_PIN_NO(0) | 4)
+#define PINMUX_GPIO0__FUNC_UTXD0 (MTK_PIN_NO(0) | 5)
+
+#define PINMUX_GPIO1__FUNC_GPIO1 (MTK_PIN_NO(1) | 0)
+#define PINMUX_GPIO1__FUNC_IRDA_RXD (MTK_PIN_NO(1) | 1)
+#define PINMUX_GPIO1__FUNC_I2S1_BCK (MTK_PIN_NO(1) | 2)
+#define PINMUX_GPIO1__FUNC_SDA4 (MTK_PIN_NO(1) | 3)
+#define PINMUX_GPIO1__FUNC_TDD_TCK (MTK_PIN_NO(1) | 4)
+#define PINMUX_GPIO1__FUNC_URXD0 (MTK_PIN_NO(1) | 5)
+
+#define PINMUX_GPIO2__FUNC_GPIO2 (MTK_PIN_NO(2) | 0)
+#define PINMUX_GPIO2__FUNC_IRDA_TXD (MTK_PIN_NO(2) | 1)
+#define PINMUX_GPIO2__FUNC_I2S1_MCK (MTK_PIN_NO(2) | 2)
+#define PINMUX_GPIO2__FUNC_SCL4 (MTK_PIN_NO(2) | 3)
+#define PINMUX_GPIO2__FUNC_TDD_TDI (MTK_PIN_NO(2) | 4)
+#define PINMUX_GPIO2__FUNC_UTXD3 (MTK_PIN_NO(2) | 5)
+
+#define PINMUX_GPIO3__FUNC_GPIO3 (MTK_PIN_NO(3) | 0)
+#define PINMUX_GPIO3__FUNC_DSI1_TE (MTK_PIN_NO(3) | 1)
+#define PINMUX_GPIO3__FUNC_I2S1_DO_1 (MTK_PIN_NO(3) | 2)
+#define PINMUX_GPIO3__FUNC_SDA3 (MTK_PIN_NO(3) | 3)
+#define PINMUX_GPIO3__FUNC_TDD_TDO (MTK_PIN_NO(3) | 4)
+#define PINMUX_GPIO3__FUNC_URXD3 (MTK_PIN_NO(3) | 5)
+
+#define PINMUX_GPIO4__FUNC_GPIO4 (MTK_PIN_NO(4) | 0)
+#define PINMUX_GPIO4__FUNC_DISP_PWM1 (MTK_PIN_NO(4) | 1)
+#define PINMUX_GPIO4__FUNC_I2S1_DO_2 (MTK_PIN_NO(4) | 2)
+#define PINMUX_GPIO4__FUNC_SCL3 (MTK_PIN_NO(4) | 3)
+#define PINMUX_GPIO4__FUNC_TDD_TRSTN (MTK_PIN_NO(4) | 4)
+
+#define PINMUX_GPIO5__FUNC_GPIO5 (MTK_PIN_NO(5) | 0)
+#define PINMUX_GPIO5__FUNC_PCM1_CLK (MTK_PIN_NO(5) | 1)
+#define PINMUX_GPIO5__FUNC_I2S2_WS (MTK_PIN_NO(5) | 2)
+#define PINMUX_GPIO5__FUNC_SPI_CK_3 (MTK_PIN_NO(5) | 3)
+#define PINMUX_GPIO5__FUNC_LTE_MD32_JTAG_TMS (MTK_PIN_NO(5) | 4)
+#define PINMUX_GPIO5__FUNC_AP_MD32_JTAG_TMS (MTK_PIN_NO(5) | 5)
+
+#define PINMUX_GPIO6__FUNC_GPIO6 (MTK_PIN_NO(6) | 0)
+#define PINMUX_GPIO6__FUNC_PCM1_SYNC (MTK_PIN_NO(6) | 1)
+#define PINMUX_GPIO6__FUNC_I2S2_BCK (MTK_PIN_NO(6) | 2)
+#define PINMUX_GPIO6__FUNC_SPI_MI_3 (MTK_PIN_NO(6) | 3)
+#define PINMUX_GPIO6__FUNC_LTE_MD32_JTAG_TCK (MTK_PIN_NO(6) | 4)
+#define PINMUX_GPIO6__FUNC_AP_MD32_JTAG_TCK (MTK_PIN_NO(6) | 5)
+
+#define PINMUX_GPIO7__FUNC_GPIO7 (MTK_PIN_NO(7) | 0)
+#define PINMUX_GPIO7__FUNC_PCM1_DI (MTK_PIN_NO(7) | 1)
+#define PINMUX_GPIO7__FUNC_I2S2_DI_1 (MTK_PIN_NO(7) | 2)
+#define PINMUX_GPIO7__FUNC_SPI_MO_3 (MTK_PIN_NO(7) | 3)
+#define PINMUX_GPIO7__FUNC_LTE_MD32_JTAG_TDI (MTK_PIN_NO(7) | 4)
+#define PINMUX_GPIO7__FUNC_AP_MD32_JTAG_TDI (MTK_PIN_NO(7) | 5)
+
+#define PINMUX_GPIO8__FUNC_GPIO8 (MTK_PIN_NO(8) | 0)
+#define PINMUX_GPIO8__FUNC_PCM1_DO (MTK_PIN_NO(8) | 1)
+#define PINMUX_GPIO8__FUNC_I2S2_DI_2 (MTK_PIN_NO(8) | 2)
+#define PINMUX_GPIO8__FUNC_SPI_CS_3 (MTK_PIN_NO(8) | 3)
+#define PINMUX_GPIO8__FUNC_LTE_MD32_JTAG_TDO (MTK_PIN_NO(8) | 4)
+#define PINMUX_GPIO8__FUNC_AP_MD32_JTAG_TDO (MTK_PIN_NO(8) | 5)
+
+#define PINMUX_GPIO9__FUNC_GPIO9 (MTK_PIN_NO(9) | 0)
+#define PINMUX_GPIO9__FUNC_USB_DRVVBUS (MTK_PIN_NO(9) | 1)
+#define PINMUX_GPIO9__FUNC_I2S2_MCK (MTK_PIN_NO(9) | 2)
+#define PINMUX_GPIO9__FUNC_LTE_MD32_JTAG_TRST (MTK_PIN_NO(9) | 4)
+#define PINMUX_GPIO9__FUNC_AP_MD32_JTAG_TRST (MTK_PIN_NO(9) | 5)
+
+#define PINMUX_GPIO10__FUNC_GPIO10 (MTK_PIN_NO(10) | 0)
+#define PINMUX_GPIO10__FUNC_I2S0_WS (MTK_PIN_NO(10) | 2)
+
+#define PINMUX_GPIO11__FUNC_GPIO11 (MTK_PIN_NO(11) | 0)
+#define PINMUX_GPIO11__FUNC_I2S0_BCK (MTK_PIN_NO(11) | 2)
+
+#define PINMUX_GPIO12__FUNC_GPIO12 (MTK_PIN_NO(12) | 0)
+#define PINMUX_GPIO12__FUNC_I2S0_MCK (MTK_PIN_NO(12) | 2)
+
+#define PINMUX_GPIO13__FUNC_GPIO13 (MTK_PIN_NO(13) | 0)
+#define PINMUX_GPIO13__FUNC_I2S0_DO (MTK_PIN_NO(13) | 2)
+
+#define PINMUX_GPIO14__FUNC_GPIO14 (MTK_PIN_NO(14) | 0)
+#define PINMUX_GPIO14__FUNC_I2S0_DI (MTK_PIN_NO(14) | 2)
+#define PINMUX_GPIO14__FUNC_DISP_PWM1 (MTK_PIN_NO(14) | 3)
+#define PINMUX_GPIO14__FUNC_PWM4 (MTK_PIN_NO(14) | 4)
+#define PINMUX_GPIO14__FUNC_IRDA_RXD (MTK_PIN_NO(14) | 5)
+#define PINMUX_GPIO14__FUNC_I2S1_BCK (MTK_PIN_NO(14) | 6)
+
+#define PINMUX_GPIO15__FUNC_GPIO15 (MTK_PIN_NO(15) | 0)
+#define PINMUX_GPIO15__FUNC_DSI1_TE (MTK_PIN_NO(15) | 2)
+#define PINMUX_GPIO15__FUNC_USB_DRVVBUS (MTK_PIN_NO(15) | 3)
+#define PINMUX_GPIO15__FUNC_PWM5 (MTK_PIN_NO(15) | 4)
+#define PINMUX_GPIO15__FUNC_IRDA_TXD (MTK_PIN_NO(15) | 5)
+#define PINMUX_GPIO15__FUNC_I2S1_MCK (MTK_PIN_NO(15) | 6)
+
+#define PINMUX_GPIO16__FUNC_GPIO16 (MTK_PIN_NO(16) | 0)
+#define PINMUX_GPIO16__FUNC_IDDIG (MTK_PIN_NO(16) | 1)
+#define PINMUX_GPIO16__FUNC_FLASH (MTK_PIN_NO(16) | 2)
+#define PINMUX_GPIO16__FUNC_EXT_FRAME_SYNC (MTK_PIN_NO(16) | 3)
+#define PINMUX_GPIO16__FUNC_PWM5 (MTK_PIN_NO(16) | 4)
+
+#define PINMUX_GPIO17__FUNC_GPIO17 (MTK_PIN_NO(17) | 0)
+#define PINMUX_GPIO17__FUNC_SIM1_SCLK (MTK_PIN_NO(17) | 1)
+#define PINMUX_GPIO17__FUNC_SIM2_SCLK (MTK_PIN_NO(17) | 2)
+
+#define PINMUX_GPIO18__FUNC_GPIO18 (MTK_PIN_NO(18) | 0)
+#define PINMUX_GPIO18__FUNC_SIM1_SRST (MTK_PIN_NO(18) | 1)
+#define PINMUX_GPIO18__FUNC_SIM2_SRST (MTK_PIN_NO(18) | 2)
+
+#define PINMUX_GPIO19__FUNC_GPIO19 (MTK_PIN_NO(19) | 0)
+#define PINMUX_GPIO19__FUNC_SIM1_SDAT (MTK_PIN_NO(19) | 1)
+#define PINMUX_GPIO19__FUNC_SIM2_SDAT (MTK_PIN_NO(19) | 2)
+
+#define PINMUX_GPIO20__FUNC_GPIO20 (MTK_PIN_NO(20) | 0)
+#define PINMUX_GPIO20__FUNC_SIM2_SCLK (MTK_PIN_NO(20) | 1)
+#define PINMUX_GPIO20__FUNC_SIM1_SCLK (MTK_PIN_NO(20) | 2)
+
+#define PINMUX_GPIO21__FUNC_GPIO21 (MTK_PIN_NO(21) | 0)
+#define PINMUX_GPIO21__FUNC_SIM2_SRST (MTK_PIN_NO(21) | 1)
+#define PINMUX_GPIO21__FUNC_SIM1_SRST (MTK_PIN_NO(21) | 2)
+
+#define PINMUX_GPIO22__FUNC_GPIO22 (MTK_PIN_NO(22) | 0)
+#define PINMUX_GPIO22__FUNC_SIM2_SDAT (MTK_PIN_NO(22) | 1)
+#define PINMUX_GPIO22__FUNC_SIM1_SDAT (MTK_PIN_NO(22) | 2)
+
+#define PINMUX_GPIO23__FUNC_GPIO23 (MTK_PIN_NO(23) | 0)
+#define PINMUX_GPIO23__FUNC_MSDC3_DAT0 (MTK_PIN_NO(23) | 1)
+
+#define PINMUX_GPIO24__FUNC_GPIO24 (MTK_PIN_NO(24) | 0)
+#define PINMUX_GPIO24__FUNC_MSDC3_DAT1 (MTK_PIN_NO(24) | 1)
+
+#define PINMUX_GPIO25__FUNC_GPIO25 (MTK_PIN_NO(25) | 0)
+#define PINMUX_GPIO25__FUNC_MSDC3_DAT2 (MTK_PIN_NO(25) | 1)
+
+#define PINMUX_GPIO26__FUNC_GPIO26 (MTK_PIN_NO(26) | 0)
+#define PINMUX_GPIO26__FUNC_MSDC3_DAT3 (MTK_PIN_NO(26) | 1)
+
+#define PINMUX_GPIO27__FUNC_GPIO27 (MTK_PIN_NO(27) | 0)
+#define PINMUX_GPIO27__FUNC_MSDC3_CLK (MTK_PIN_NO(27) | 1)
+
+#define PINMUX_GPIO28__FUNC_GPIO28 (MTK_PIN_NO(28) | 0)
+#define PINMUX_GPIO28__FUNC_MSDC3_CMD (MTK_PIN_NO(28) | 1)
+
+#define PINMUX_GPIO29__FUNC_GPIO29 (MTK_PIN_NO(29) | 0)
+#define PINMUX_GPIO29__FUNC_PTA_RXD (MTK_PIN_NO(29) | 1)
+#define PINMUX_GPIO29__FUNC_UCTS2 (MTK_PIN_NO(29) | 2)
+
+#define PINMUX_GPIO30__FUNC_GPIO30 (MTK_PIN_NO(30) | 0)
+#define PINMUX_GPIO30__FUNC_PTA_TXD (MTK_PIN_NO(30) | 1)
+#define PINMUX_GPIO30__FUNC_URTS2 (MTK_PIN_NO(30) | 2)
+
+#define PINMUX_GPIO31__FUNC_GPIO31 (MTK_PIN_NO(31) | 0)
+#define PINMUX_GPIO31__FUNC_URXD2 (MTK_PIN_NO(31) | 1)
+#define PINMUX_GPIO31__FUNC_UTXD2 (MTK_PIN_NO(31) | 2)
+
+#define PINMUX_GPIO32__FUNC_GPIO32 (MTK_PIN_NO(32) | 0)
+#define PINMUX_GPIO32__FUNC_UTXD2 (MTK_PIN_NO(32) | 1)
+#define PINMUX_GPIO32__FUNC_URXD2 (MTK_PIN_NO(32) | 2)
+
+#define PINMUX_GPIO33__FUNC_GPIO33 (MTK_PIN_NO(33) | 0)
+#define PINMUX_GPIO33__FUNC_MRG_CLK (MTK_PIN_NO(33) | 1)
+#define PINMUX_GPIO33__FUNC_PCM0_CLK (MTK_PIN_NO(33) | 2)
+
+#define PINMUX_GPIO34__FUNC_GPIO34 (MTK_PIN_NO(34) | 0)
+#define PINMUX_GPIO34__FUNC_MRG_DI (MTK_PIN_NO(34) | 1)
+#define PINMUX_GPIO34__FUNC_PCM0_DI (MTK_PIN_NO(34) | 2)
+
+#define PINMUX_GPIO35__FUNC_GPIO35 (MTK_PIN_NO(35) | 0)
+#define PINMUX_GPIO35__FUNC_MRG_DO (MTK_PIN_NO(35) | 1)
+#define PINMUX_GPIO35__FUNC_PCM0_DO (MTK_PIN_NO(35) | 2)
+
+#define PINMUX_GPIO36__FUNC_GPIO36 (MTK_PIN_NO(36) | 0)
+#define PINMUX_GPIO36__FUNC_MRG_SYNC (MTK_PIN_NO(36) | 1)
+#define PINMUX_GPIO36__FUNC_PCM0_SYNC (MTK_PIN_NO(36) | 2)
+
+#define PINMUX_GPIO37__FUNC_GPIO37 (MTK_PIN_NO(37) | 0)
+#define PINMUX_GPIO37__FUNC_GPS_SYNC (MTK_PIN_NO(37) | 1)
+
+#define PINMUX_GPIO38__FUNC_GPIO38 (MTK_PIN_NO(38) | 0)
+#define PINMUX_GPIO38__FUNC_DAIRSTB (MTK_PIN_NO(38) | 1)
+
+#define PINMUX_GPIO39__FUNC_GPIO39 (MTK_PIN_NO(39) | 0)
+#define PINMUX_GPIO39__FUNC_CM2MCLK (MTK_PIN_NO(39) | 1)
+
+#define PINMUX_GPIO40__FUNC_GPIO40 (MTK_PIN_NO(40) | 0)
+#define PINMUX_GPIO40__FUNC_CM3MCLK (MTK_PIN_NO(40) | 1)
+#define PINMUX_GPIO40__FUNC_IRDA_PDN (MTK_PIN_NO(40) | 2)
+#define PINMUX_GPIO40__FUNC_PWM6 (MTK_PIN_NO(40) | 3)
+#define PINMUX_GPIO40__FUNC_I2S1_WS (MTK_PIN_NO(40) | 4)
+
+#define PINMUX_GPIO41__FUNC_GPIO41 (MTK_PIN_NO(41) | 0)
+#define PINMUX_GPIO41__FUNC_CMPCLK (MTK_PIN_NO(41) | 1)
+#define PINMUX_GPIO41__FUNC_CMCSK (MTK_PIN_NO(41) | 2)
+#define PINMUX_GPIO41__FUNC_FLASH (MTK_PIN_NO(41) | 3)
+
+#define PINMUX_GPIO42__FUNC_GPIO42 (MTK_PIN_NO(42) | 0)
+#define PINMUX_GPIO42__FUNC_CMMCLK (MTK_PIN_NO(42) | 1)
+
+#define PINMUX_GPIO43__FUNC_GPIO43 (MTK_PIN_NO(43) | 0)
+#define PINMUX_GPIO43__FUNC_SDA2 (MTK_PIN_NO(43) | 1)
+
+#define PINMUX_GPIO44__FUNC_GPIO44 (MTK_PIN_NO(44) | 0)
+#define PINMUX_GPIO44__FUNC_SCL2 (MTK_PIN_NO(44) | 1)
+
+#define PINMUX_GPIO45__FUNC_GPIO45 (MTK_PIN_NO(45) | 0)
+#define PINMUX_GPIO45__FUNC_SDA0 (MTK_PIN_NO(45) | 1)
+
+#define PINMUX_GPIO46__FUNC_GPIO46 (MTK_PIN_NO(46) | 0)
+#define PINMUX_GPIO46__FUNC_SCL0 (MTK_PIN_NO(46) | 1)
+
+#define PINMUX_GPIO47__FUNC_GPIO47 (MTK_PIN_NO(47) | 0)
+#define PINMUX_GPIO47__FUNC_BPI_BUS0 (MTK_PIN_NO(47) | 1)
+
+#define PINMUX_GPIO48__FUNC_GPIO48 (MTK_PIN_NO(48) | 0)
+#define PINMUX_GPIO48__FUNC_BPI_BUS1 (MTK_PIN_NO(48) | 1)
+
+#define PINMUX_GPIO49__FUNC_GPIO49 (MTK_PIN_NO(49) | 0)
+#define PINMUX_GPIO49__FUNC_BPI_BUS2 (MTK_PIN_NO(49) | 1)
+
+#define PINMUX_GPIO50__FUNC_GPIO50 (MTK_PIN_NO(50) | 0)
+#define PINMUX_GPIO50__FUNC_BPI_BUS3 (MTK_PIN_NO(50) | 1)
+
+#define PINMUX_GPIO51__FUNC_GPIO51 (MTK_PIN_NO(51) | 0)
+#define PINMUX_GPIO51__FUNC_BPI_BUS4 (MTK_PIN_NO(51) | 1)
+
+#define PINMUX_GPIO52__FUNC_GPIO52 (MTK_PIN_NO(52) | 0)
+#define PINMUX_GPIO52__FUNC_BPI_BUS5 (MTK_PIN_NO(52) | 1)
+
+#define PINMUX_GPIO53__FUNC_GPIO53 (MTK_PIN_NO(53) | 0)
+#define PINMUX_GPIO53__FUNC_BPI_BUS6 (MTK_PIN_NO(53) | 1)
+
+#define PINMUX_GPIO54__FUNC_GPIO54 (MTK_PIN_NO(54) | 0)
+#define PINMUX_GPIO54__FUNC_BPI_BUS7 (MTK_PIN_NO(54) | 1)
+
+#define PINMUX_GPIO55__FUNC_GPIO55 (MTK_PIN_NO(55) | 0)
+#define PINMUX_GPIO55__FUNC_BPI_BUS8 (MTK_PIN_NO(55) | 1)
+
+#define PINMUX_GPIO56__FUNC_GPIO56 (MTK_PIN_NO(56) | 0)
+#define PINMUX_GPIO56__FUNC_BPI_BUS9 (MTK_PIN_NO(56) | 1)
+
+#define PINMUX_GPIO57__FUNC_GPIO57 (MTK_PIN_NO(57) | 0)
+#define PINMUX_GPIO57__FUNC_BPI_BUS10 (MTK_PIN_NO(57) | 1)
+
+#define PINMUX_GPIO58__FUNC_GPIO58 (MTK_PIN_NO(58) | 0)
+#define PINMUX_GPIO58__FUNC_BPI_BUS11 (MTK_PIN_NO(58) | 1)
+
+#define PINMUX_GPIO59__FUNC_GPIO59 (MTK_PIN_NO(59) | 0)
+#define PINMUX_GPIO59__FUNC_BPI_BUS12 (MTK_PIN_NO(59) | 1)
+
+#define PINMUX_GPIO60__FUNC_GPIO60 (MTK_PIN_NO(60) | 0)
+#define PINMUX_GPIO60__FUNC_BPI_BUS13 (MTK_PIN_NO(60) | 1)
+
+#define PINMUX_GPIO61__FUNC_GPIO61 (MTK_PIN_NO(61) | 0)
+#define PINMUX_GPIO61__FUNC_BPI_BUS14 (MTK_PIN_NO(61) | 1)
+
+#define PINMUX_GPIO62__FUNC_GPIO62 (MTK_PIN_NO(62) | 0)
+#define PINMUX_GPIO62__FUNC_RFIC1_BSI_CK (MTK_PIN_NO(62) | 1)
+
+#define PINMUX_GPIO63__FUNC_GPIO63 (MTK_PIN_NO(63) | 0)
+#define PINMUX_GPIO63__FUNC_RFIC1_BSI_D0 (MTK_PIN_NO(63) | 1)
+
+#define PINMUX_GPIO64__FUNC_GPIO64 (MTK_PIN_NO(64) | 0)
+#define PINMUX_GPIO64__FUNC_RFIC1_BSI_D1 (MTK_PIN_NO(64) | 1)
+
+#define PINMUX_GPIO65__FUNC_GPIO65 (MTK_PIN_NO(65) | 0)
+#define PINMUX_GPIO65__FUNC_RFIC1_BSI_D2 (MTK_PIN_NO(65) | 1)
+
+#define PINMUX_GPIO66__FUNC_GPIO66 (MTK_PIN_NO(66) | 0)
+#define PINMUX_GPIO66__FUNC_RFIC1_BSI_CS (MTK_PIN_NO(66) | 1)
+
+#define PINMUX_GPIO67__FUNC_GPIO67 (MTK_PIN_NO(67) | 0)
+#define PINMUX_GPIO67__FUNC_TD_TXBPI (MTK_PIN_NO(67) | 1)
+
+#define PINMUX_GPIO68__FUNC_GPIO68 (MTK_PIN_NO(68) | 0)
+#define PINMUX_GPIO68__FUNC_RFIC0_BSI_CK (MTK_PIN_NO(68) | 1)
+
+#define PINMUX_GPIO69__FUNC_GPIO69 (MTK_PIN_NO(69) | 0)
+#define PINMUX_GPIO69__FUNC_RFIC0_BSI_D0 (MTK_PIN_NO(69) | 1)
+
+#define PINMUX_GPIO70__FUNC_GPIO70 (MTK_PIN_NO(70) | 0)
+#define PINMUX_GPIO70__FUNC_RFIC0_BSI_D1 (MTK_PIN_NO(70) | 1)
+
+#define PINMUX_GPIO71__FUNC_GPIO71 (MTK_PIN_NO(71) | 0)
+#define PINMUX_GPIO71__FUNC_RFIC0_BSI_D2 (MTK_PIN_NO(71) | 1)
+
+#define PINMUX_GPIO72__FUNC_GPIO72 (MTK_PIN_NO(72) | 0)
+#define PINMUX_GPIO72__FUNC_RFIC0_BSI_CS (MTK_PIN_NO(72) | 1)
+
+#define PINMUX_GPIO73__FUNC_GPIO73 (MTK_PIN_NO(73) | 0)
+#define PINMUX_GPIO73__FUNC_MISC_BSI_DO (MTK_PIN_NO(73) | 1)
+
+#define PINMUX_GPIO74__FUNC_GPIO74 (MTK_PIN_NO(74) | 0)
+#define PINMUX_GPIO74__FUNC_MISC_BSI_CK (MTK_PIN_NO(74) | 1)
+
+#define PINMUX_GPIO75__FUNC_GPIO75 (MTK_PIN_NO(75) | 0)
+#define PINMUX_GPIO75__FUNC_MISC_BSI_CS0B (MTK_PIN_NO(75) | 1)
+#define PINMUX_GPIO75__FUNC_MIPI1_SCLK (MTK_PIN_NO(75) | 2)
+
+#define PINMUX_GPIO76__FUNC_GPIO76 (MTK_PIN_NO(76) | 0)
+#define PINMUX_GPIO76__FUNC_MISC_BSI_CS1B (MTK_PIN_NO(76) | 1)
+
+#define PINMUX_GPIO77__FUNC_GPIO77 (MTK_PIN_NO(77) | 0)
+#define PINMUX_GPIO77__FUNC_MISC_BSI_DI (MTK_PIN_NO(77) | 1)
+#define PINMUX_GPIO77__FUNC_MIPI1_SDATA (MTK_PIN_NO(77) | 2)
+
+#define PINMUX_GPIO78__FUNC_GPIO78 (MTK_PIN_NO(78) | 0)
+#define PINMUX_GPIO78__FUNC_LTE_TXBPI (MTK_PIN_NO(78) | 1)
+
+#define PINMUX_GPIO79__FUNC_GPIO79 (MTK_PIN_NO(79) | 0)
+#define PINMUX_GPIO79__FUNC_BPI_BUS15 (MTK_PIN_NO(79) | 1)
+
+#define PINMUX_GPIO80__FUNC_GPIO80 (MTK_PIN_NO(80) | 0)
+#define PINMUX_GPIO80__FUNC_BPI_BUS16 (MTK_PIN_NO(80) | 1)
+
+#define PINMUX_GPIO81__FUNC_GPIO81 (MTK_PIN_NO(81) | 0)
+#define PINMUX_GPIO81__FUNC_BPI_BUS17 (MTK_PIN_NO(81) | 1)
+
+#define PINMUX_GPIO82__FUNC_GPIO82 (MTK_PIN_NO(82) | 0)
+#define PINMUX_GPIO82__FUNC_BPI_BUS18 (MTK_PIN_NO(82) | 1)
+
+#define PINMUX_GPIO83__FUNC_GPIO83 (MTK_PIN_NO(83) | 0)
+#define PINMUX_GPIO83__FUNC_BPI_BUS19 (MTK_PIN_NO(83) | 1)
+
+#define PINMUX_GPIO84__FUNC_GPIO84 (MTK_PIN_NO(84) | 0)
+#define PINMUX_GPIO84__FUNC_BPI_BUS20 (MTK_PIN_NO(84) | 1)
+
+#define PINMUX_GPIO85__FUNC_GPIO85 (MTK_PIN_NO(85) | 0)
+#define PINMUX_GPIO85__FUNC_BPI_BUS21 (MTK_PIN_NO(85) | 1)
+
+#define PINMUX_GPIO86__FUNC_GPIO86 (MTK_PIN_NO(86) | 0)
+#define PINMUX_GPIO86__FUNC_BPI_BUS22 (MTK_PIN_NO(86) | 1)
+
+#define PINMUX_GPIO87__FUNC_GPIO87 (MTK_PIN_NO(87) | 0)
+#define PINMUX_GPIO87__FUNC_BPI_BUS23 (MTK_PIN_NO(87) | 1)
+
+#define PINMUX_GPIO88__FUNC_GPIO88 (MTK_PIN_NO(88) | 0)
+#define PINMUX_GPIO88__FUNC_BPI_BUS24 (MTK_PIN_NO(88) | 1)
+
+#define PINMUX_GPIO89__FUNC_GPIO89 (MTK_PIN_NO(89) | 0)
+#define PINMUX_GPIO89__FUNC_BPI_BUS25 (MTK_PIN_NO(89) | 1)
+
+#define PINMUX_GPIO90__FUNC_GPIO90 (MTK_PIN_NO(90) | 0)
+#define PINMUX_GPIO90__FUNC_BPI_BUS26 (MTK_PIN_NO(90) | 1)
+
+#define PINMUX_GPIO91__FUNC_GPIO91 (MTK_PIN_NO(91) | 0)
+#define PINMUX_GPIO91__FUNC_BPI_BUS27 (MTK_PIN_NO(91) | 1)
+
+#define PINMUX_GPIO92__FUNC_GPIO92 (MTK_PIN_NO(92) | 0)
+#define PINMUX_GPIO92__FUNC_PCM1_CLK (MTK_PIN_NO(92) | 1)
+#define PINMUX_GPIO92__FUNC_I2S0_BCK (MTK_PIN_NO(92) | 2)
+#define PINMUX_GPIO92__FUNC_NLD6 (MTK_PIN_NO(92) | 3)
+
+#define PINMUX_GPIO93__FUNC_GPIO93 (MTK_PIN_NO(93) | 0)
+#define PINMUX_GPIO93__FUNC_PCM1_SYNC (MTK_PIN_NO(93) | 1)
+#define PINMUX_GPIO93__FUNC_I2S0_WS (MTK_PIN_NO(93) | 2)
+#define PINMUX_GPIO93__FUNC_NLD7 (MTK_PIN_NO(93) | 3)
+
+#define PINMUX_GPIO94__FUNC_GPIO94 (MTK_PIN_NO(94) | 0)
+#define PINMUX_GPIO94__FUNC_PCM1_DI (MTK_PIN_NO(94) | 1)
+#define PINMUX_GPIO94__FUNC_I2S0_DI (MTK_PIN_NO(94) | 2)
+#define PINMUX_GPIO94__FUNC_NREB (MTK_PIN_NO(94) | 3)
+
+#define PINMUX_GPIO95__FUNC_GPIO95 (MTK_PIN_NO(95) | 0)
+#define PINMUX_GPIO95__FUNC_PCM1_DO (MTK_PIN_NO(95) | 1)
+#define PINMUX_GPIO95__FUNC_I2S0_DO (MTK_PIN_NO(95) | 2)
+#define PINMUX_GPIO95__FUNC_NRNB0 (MTK_PIN_NO(95) | 3)
+
+#define PINMUX_GPIO96__FUNC_GPIO96 (MTK_PIN_NO(96) | 0)
+#define PINMUX_GPIO96__FUNC_URXD1 (MTK_PIN_NO(96) | 1)
+#define PINMUX_GPIO96__FUNC_UTXD1 (MTK_PIN_NO(96) | 2)
+#define PINMUX_GPIO96__FUNC_NWEB (MTK_PIN_NO(96) | 3)
+
+#define PINMUX_GPIO97__FUNC_GPIO97 (MTK_PIN_NO(97) | 0)
+#define PINMUX_GPIO97__FUNC_UTXD1 (MTK_PIN_NO(97) | 1)
+#define PINMUX_GPIO97__FUNC_URXD1 (MTK_PIN_NO(97) | 2)
+#define PINMUX_GPIO97__FUNC_NCEB0 (MTK_PIN_NO(97) | 3)
+
+#define PINMUX_GPIO98__FUNC_GPIO98 (MTK_PIN_NO(98) | 0)
+#define PINMUX_GPIO98__FUNC_URTS1 (MTK_PIN_NO(98) | 1)
+#define PINMUX_GPIO98__FUNC_UCTS1 (MTK_PIN_NO(98) | 2)
+#define PINMUX_GPIO98__FUNC_NALE (MTK_PIN_NO(98) | 3)
+
+#define PINMUX_GPIO99__FUNC_GPIO99 (MTK_PIN_NO(99) | 0)
+#define PINMUX_GPIO99__FUNC_UCTS1 (MTK_PIN_NO(99) | 1)
+#define PINMUX_GPIO99__FUNC_URTS1 (MTK_PIN_NO(99) | 2)
+#define PINMUX_GPIO99__FUNC_NCLE (MTK_PIN_NO(99) | 3)
+
+#define PINMUX_GPIO100__FUNC_GPIO100 (MTK_PIN_NO(100) | 0)
+#define PINMUX_GPIO100__FUNC_MSDC2_DAT0 (MTK_PIN_NO(100) | 1)
+#define PINMUX_GPIO100__FUNC_URXD1 (MTK_PIN_NO(100) | 2)
+#define PINMUX_GPIO100__FUNC_USB_DRVVBUS (MTK_PIN_NO(100) | 3)
+#define PINMUX_GPIO100__FUNC_SDA4 (MTK_PIN_NO(100) | 4)
+
+#define PINMUX_GPIO101__FUNC_GPIO101 (MTK_PIN_NO(101) | 0)
+#define PINMUX_GPIO101__FUNC_MSDC2_DAT1 (MTK_PIN_NO(101) | 1)
+#define PINMUX_GPIO101__FUNC_UTXD1 (MTK_PIN_NO(101) | 2)
+#define PINMUX_GPIO101__FUNC_SCL4 (MTK_PIN_NO(101) | 4)
+
+#define PINMUX_GPIO102__FUNC_GPIO102 (MTK_PIN_NO(102) | 0)
+#define PINMUX_GPIO102__FUNC_MSDC2_DAT2 (MTK_PIN_NO(102) | 1)
+#define PINMUX_GPIO102__FUNC_URTS1 (MTK_PIN_NO(102) | 2)
+#define PINMUX_GPIO102__FUNC_UTXD0 (MTK_PIN_NO(102) | 3)
+#define PINMUX_GPIO102__FUNC_PWM0 (MTK_PIN_NO(102) | 5)
+#define PINMUX_GPIO102__FUNC_SPI_CK_1 (MTK_PIN_NO(102) | 6)
+
+#define PINMUX_GPIO103__FUNC_GPIO103 (MTK_PIN_NO(103) | 0)
+#define PINMUX_GPIO103__FUNC_MSDC2_DAT3 (MTK_PIN_NO(103) | 1)
+#define PINMUX_GPIO103__FUNC_UCTS1 (MTK_PIN_NO(103) | 2)
+#define PINMUX_GPIO103__FUNC_URXD0 (MTK_PIN_NO(103) | 3)
+#define PINMUX_GPIO103__FUNC_PWM1 (MTK_PIN_NO(103) | 5)
+#define PINMUX_GPIO103__FUNC_SPI_MI_1 (MTK_PIN_NO(103) | 6)
+
+#define PINMUX_GPIO104__FUNC_GPIO104 (MTK_PIN_NO(104) | 0)
+#define PINMUX_GPIO104__FUNC_MSDC2_CLK (MTK_PIN_NO(104) | 1)
+#define PINMUX_GPIO104__FUNC_NLD4 (MTK_PIN_NO(104) | 2)
+#define PINMUX_GPIO104__FUNC_UTXD3 (MTK_PIN_NO(104) | 3)
+#define PINMUX_GPIO104__FUNC_SDA3 (MTK_PIN_NO(104) | 4)
+#define PINMUX_GPIO104__FUNC_PWM2 (MTK_PIN_NO(104) | 5)
+#define PINMUX_GPIO104__FUNC_SPI_MO_1 (MTK_PIN_NO(104) | 6)
+
+#define PINMUX_GPIO105__FUNC_GPIO105 (MTK_PIN_NO(105) | 0)
+#define PINMUX_GPIO105__FUNC_MSDC2_CMD (MTK_PIN_NO(105) | 1)
+#define PINMUX_GPIO105__FUNC_NLD5 (MTK_PIN_NO(105) | 2)
+#define PINMUX_GPIO105__FUNC_URXD3 (MTK_PIN_NO(105) | 3)
+#define PINMUX_GPIO105__FUNC_SCL3 (MTK_PIN_NO(105) | 4)
+#define PINMUX_GPIO105__FUNC_PWM3 (MTK_PIN_NO(105) | 5)
+#define PINMUX_GPIO105__FUNC_SPI_CS_1 (MTK_PIN_NO(105) | 6)
+
+#define PINMUX_GPIO106__FUNC_GPIO106 (MTK_PIN_NO(106) | 0)
+#define PINMUX_GPIO106__FUNC_LCM_RST (MTK_PIN_NO(106) | 1)
+
+#define PINMUX_GPIO107__FUNC_GPIO107 (MTK_PIN_NO(107) | 0)
+#define PINMUX_GPIO107__FUNC_DSI_TE (MTK_PIN_NO(107) | 1)
+
+#define PINMUX_GPIO108__FUNC_GPIO108 (MTK_PIN_NO(108) | 0)
+#define PINMUX_GPIO108__FUNC_JTMS (MTK_PIN_NO(108) | 1)
+#define PINMUX_GPIO108__FUNC_MFG_JTAG_TMS (MTK_PIN_NO(108) | 2)
+#define PINMUX_GPIO108__FUNC_TDD_TMS (MTK_PIN_NO(108) | 3)
+#define PINMUX_GPIO108__FUNC_LTE_MD32_JTAG_TMS (MTK_PIN_NO(108) | 4)
+#define PINMUX_GPIO108__FUNC_AP_MD32_JTAG_TMS (MTK_PIN_NO(108) | 5)
+#define PINMUX_GPIO108__FUNC_DFD_TMS (MTK_PIN_NO(108) | 6)
+
+#define PINMUX_GPIO109__FUNC_GPIO109 (MTK_PIN_NO(109) | 0)
+#define PINMUX_GPIO109__FUNC_JTCK (MTK_PIN_NO(109) | 1)
+#define PINMUX_GPIO109__FUNC_MFG_JTAG_TCK (MTK_PIN_NO(109) | 2)
+#define PINMUX_GPIO109__FUNC_TDD_TCK (MTK_PIN_NO(109) | 3)
+#define PINMUX_GPIO109__FUNC_LTE_MD32_JTAG_TCK (MTK_PIN_NO(109) | 4)
+#define PINMUX_GPIO109__FUNC_AP_MD32_JTAG_TCK (MTK_PIN_NO(109) | 5)
+#define PINMUX_GPIO109__FUNC_DFD_TCK (MTK_PIN_NO(109) | 6)
+
+#define PINMUX_GPIO110__FUNC_GPIO110 (MTK_PIN_NO(110) | 0)
+#define PINMUX_GPIO110__FUNC_JTDI (MTK_PIN_NO(110) | 1)
+#define PINMUX_GPIO110__FUNC_MFG_JTAG_TDI (MTK_PIN_NO(110) | 2)
+#define PINMUX_GPIO110__FUNC_TDD_TDI (MTK_PIN_NO(110) | 3)
+#define PINMUX_GPIO110__FUNC_LTE_MD32_JTAG_TDI (MTK_PIN_NO(110) | 4)
+#define PINMUX_GPIO110__FUNC_AP_MD32_JTAG_TDI (MTK_PIN_NO(110) | 5)
+#define PINMUX_GPIO110__FUNC_DFD_TDI (MTK_PIN_NO(110) | 6)
+
+#define PINMUX_GPIO111__FUNC_GPIO111 (MTK_PIN_NO(111) | 0)
+#define PINMUX_GPIO111__FUNC_JTDO (MTK_PIN_NO(111) | 1)
+#define PINMUX_GPIO111__FUNC_MFG_JTAG_TDO (MTK_PIN_NO(111) | 2)
+#define PINMUX_GPIO111__FUNC_TDD_TDO (MTK_PIN_NO(111) | 3)
+#define PINMUX_GPIO111__FUNC_LTE_MD32_JTAG_TDO (MTK_PIN_NO(111) | 4)
+#define PINMUX_GPIO111__FUNC_AP_MD32_JTAG_TDO (MTK_PIN_NO(111) | 5)
+#define PINMUX_GPIO111__FUNC_DFD_TDO (MTK_PIN_NO(111) | 6)
+
+#define PINMUX_GPIO112__FUNC_GPIO112 (MTK_PIN_NO(112) | 0)
+#define PINMUX_GPIO112__FUNC_JTRST_B (MTK_PIN_NO(112) | 1)
+#define PINMUX_GPIO112__FUNC_MFG_JTAG_TRSTN (MTK_PIN_NO(112) | 2)
+#define PINMUX_GPIO112__FUNC_TDD_TRSTN (MTK_PIN_NO(112) | 3)
+#define PINMUX_GPIO112__FUNC_LTE_MD32_JTAG_TRST (MTK_PIN_NO(112) | 4)
+#define PINMUX_GPIO112__FUNC_AP_MD32_JTAG_TRST (MTK_PIN_NO(112) | 5)
+#define PINMUX_GPIO112__FUNC_DFD_NTRST (MTK_PIN_NO(112) | 6)
+
+#define PINMUX_GPIO113__FUNC_GPIO113 (MTK_PIN_NO(113) | 0)
+#define PINMUX_GPIO113__FUNC_URXD0 (MTK_PIN_NO(113) | 1)
+#define PINMUX_GPIO113__FUNC_UTXD0 (MTK_PIN_NO(113) | 2)
+#define PINMUX_GPIO113__FUNC_MD_URXD (MTK_PIN_NO(113) | 3)
+#define PINMUX_GPIO113__FUNC_LTE_URXD (MTK_PIN_NO(113) | 4)
+#define PINMUX_GPIO113__FUNC_TDD_TXD (MTK_PIN_NO(113) | 5)
+#define PINMUX_GPIO113__FUNC_I2S2_WS (MTK_PIN_NO(113) | 6)
+
+#define PINMUX_GPIO114__FUNC_GPIO114 (MTK_PIN_NO(114) | 0)
+#define PINMUX_GPIO114__FUNC_UTXD0 (MTK_PIN_NO(114) | 1)
+#define PINMUX_GPIO114__FUNC_URXD0 (MTK_PIN_NO(114) | 2)
+#define PINMUX_GPIO114__FUNC_MD_UTXD (MTK_PIN_NO(114) | 3)
+#define PINMUX_GPIO114__FUNC_LTE_UTXD (MTK_PIN_NO(114) | 4)
+#define PINMUX_GPIO114__FUNC_TDD_TXD (MTK_PIN_NO(114) | 5)
+#define PINMUX_GPIO114__FUNC_I2S2_BCK (MTK_PIN_NO(114) | 6)
+
+#define PINMUX_GPIO115__FUNC_GPIO115 (MTK_PIN_NO(115) | 0)
+#define PINMUX_GPIO115__FUNC_URTS0 (MTK_PIN_NO(115) | 1)
+#define PINMUX_GPIO115__FUNC_UCTS0 (MTK_PIN_NO(115) | 2)
+#define PINMUX_GPIO115__FUNC_MD_URXD (MTK_PIN_NO(115) | 3)
+#define PINMUX_GPIO115__FUNC_LTE_URXD (MTK_PIN_NO(115) | 4)
+#define PINMUX_GPIO115__FUNC_TDD_TXD (MTK_PIN_NO(115) | 5)
+#define PINMUX_GPIO115__FUNC_I2S2_MCK (MTK_PIN_NO(115) | 6)
+
+#define PINMUX_GPIO116__FUNC_GPIO116 (MTK_PIN_NO(116) | 0)
+#define PINMUX_GPIO116__FUNC_UCTS0 (MTK_PIN_NO(116) | 1)
+#define PINMUX_GPIO116__FUNC_URTS0 (MTK_PIN_NO(116) | 2)
+#define PINMUX_GPIO116__FUNC_MD_UTXD (MTK_PIN_NO(116) | 3)
+#define PINMUX_GPIO116__FUNC_LTE_UTXD (MTK_PIN_NO(116) | 4)
+#define PINMUX_GPIO116__FUNC_TDD_TXD (MTK_PIN_NO(116) | 5)
+#define PINMUX_GPIO116__FUNC_I2S2_DI_1 (MTK_PIN_NO(116) | 6)
+
+#define PINMUX_GPIO117__FUNC_GPIO117 (MTK_PIN_NO(117) | 0)
+#define PINMUX_GPIO117__FUNC_URXD3 (MTK_PIN_NO(117) | 1)
+#define PINMUX_GPIO117__FUNC_UTXD3 (MTK_PIN_NO(117) | 2)
+#define PINMUX_GPIO117__FUNC_MD_URXD (MTK_PIN_NO(117) | 3)
+#define PINMUX_GPIO117__FUNC_LTE_URXD (MTK_PIN_NO(117) | 4)
+#define PINMUX_GPIO117__FUNC_TDD_TXD (MTK_PIN_NO(117) | 5)
+
+#define PINMUX_GPIO118__FUNC_GPIO118 (MTK_PIN_NO(118) | 0)
+#define PINMUX_GPIO118__FUNC_UTXD3 (MTK_PIN_NO(118) | 1)
+#define PINMUX_GPIO118__FUNC_URXD3 (MTK_PIN_NO(118) | 2)
+#define PINMUX_GPIO118__FUNC_MD_UTXD (MTK_PIN_NO(118) | 3)
+#define PINMUX_GPIO118__FUNC_LTE_UTXD (MTK_PIN_NO(118) | 4)
+#define PINMUX_GPIO118__FUNC_TDD_TXD (MTK_PIN_NO(118) | 5)
+
+#define PINMUX_GPIO119__FUNC_GPIO119 (MTK_PIN_NO(119) | 0)
+#define PINMUX_GPIO119__FUNC_KROW0 (MTK_PIN_NO(119) | 1)
+
+#define PINMUX_GPIO120__FUNC_GPIO120 (MTK_PIN_NO(120) | 0)
+#define PINMUX_GPIO120__FUNC_KROW1 (MTK_PIN_NO(120) | 1)
+#define PINMUX_GPIO120__FUNC_PWM6 (MTK_PIN_NO(120) | 3)
+
+#define PINMUX_GPIO121__FUNC_GPIO121 (MTK_PIN_NO(121) | 0)
+#define PINMUX_GPIO121__FUNC_KROW2 (MTK_PIN_NO(121) | 1)
+#define PINMUX_GPIO121__FUNC_IRDA_PDN (MTK_PIN_NO(121) | 2)
+#define PINMUX_GPIO121__FUNC_I2S1_DO_1 (MTK_PIN_NO(121) | 3)
+#define PINMUX_GPIO121__FUNC_USB_DRVVBUS (MTK_PIN_NO(121) | 4)
+#define PINMUX_GPIO121__FUNC_SPI_CK_2 (MTK_PIN_NO(121) | 5)
+#define PINMUX_GPIO121__FUNC_PWM4 (MTK_PIN_NO(121) | 6)
+
+#define PINMUX_GPIO122__FUNC_GPIO122 (MTK_PIN_NO(122) | 0)
+#define PINMUX_GPIO122__FUNC_KCOL0 (MTK_PIN_NO(122) | 1)
+
+#define PINMUX_GPIO123__FUNC_GPIO123 (MTK_PIN_NO(123) | 0)
+#define PINMUX_GPIO123__FUNC_KCOL1 (MTK_PIN_NO(123) | 1)
+#define PINMUX_GPIO123__FUNC_IRDA_RXD (MTK_PIN_NO(123) | 2)
+#define PINMUX_GPIO123__FUNC_I2S2_DI_2 (MTK_PIN_NO(123) | 3)
+#define PINMUX_GPIO123__FUNC_PWM5 (MTK_PIN_NO(123) | 4)
+
+#define PINMUX_GPIO124__FUNC_GPIO124 (MTK_PIN_NO(124) | 0)
+#define PINMUX_GPIO124__FUNC_KCOL2 (MTK_PIN_NO(124) | 1)
+#define PINMUX_GPIO124__FUNC_IRDA_TXD (MTK_PIN_NO(124) | 2)
+#define PINMUX_GPIO124__FUNC_I2S1_DO_2 (MTK_PIN_NO(124) | 3)
+#define PINMUX_GPIO124__FUNC_USB_DRVVBUS (MTK_PIN_NO(124) | 4)
+#define PINMUX_GPIO124__FUNC_SPI_MI_2 (MTK_PIN_NO(124) | 5)
+#define PINMUX_GPIO124__FUNC_PWM3 (MTK_PIN_NO(124) | 6)
+
+#define PINMUX_GPIO125__FUNC_GPIO125 (MTK_PIN_NO(125) | 0)
+#define PINMUX_GPIO125__FUNC_SDA1 (MTK_PIN_NO(125) | 1)
+
+#define PINMUX_GPIO126__FUNC_GPIO126 (MTK_PIN_NO(126) | 0)
+#define PINMUX_GPIO126__FUNC_SCL1 (MTK_PIN_NO(126) | 1)
+
+#define PINMUX_GPIO127__FUNC_GPIO127 (MTK_PIN_NO(127) | 0)
+#define PINMUX_GPIO127__FUNC_MD_EINT1 (MTK_PIN_NO(127) | 1)
+#define PINMUX_GPIO127__FUNC_DISP_PWM1 (MTK_PIN_NO(127) | 2)
+#define PINMUX_GPIO127__FUNC_SPI_MO_2 (MTK_PIN_NO(127) | 3)
+
+#define PINMUX_GPIO128__FUNC_GPIO128 (MTK_PIN_NO(128) | 0)
+#define PINMUX_GPIO128__FUNC_MD_EINT2 (MTK_PIN_NO(128) | 1)
+#define PINMUX_GPIO128__FUNC_DSI1_TE (MTK_PIN_NO(128) | 2)
+#define PINMUX_GPIO128__FUNC_SPI_CS_2 (MTK_PIN_NO(128) | 3)
+
+#define PINMUX_GPIO129__FUNC_GPIO129 (MTK_PIN_NO(129) | 0)
+#define PINMUX_GPIO129__FUNC_I2S3_WS (MTK_PIN_NO(129) | 1)
+#define PINMUX_GPIO129__FUNC_I2S2_WS (MTK_PIN_NO(129) | 2)
+#define PINMUX_GPIO129__FUNC_PWM0 (MTK_PIN_NO(129) | 3)
+
+#define PINMUX_GPIO130__FUNC_GPIO130 (MTK_PIN_NO(130) | 0)
+#define PINMUX_GPIO130__FUNC_I2S3_BCK (MTK_PIN_NO(130) | 1)
+#define PINMUX_GPIO130__FUNC_I2S2_BCK (MTK_PIN_NO(130) | 2)
+#define PINMUX_GPIO130__FUNC_PWM1 (MTK_PIN_NO(130) | 3)
+
+#define PINMUX_GPIO131__FUNC_GPIO131 (MTK_PIN_NO(131) | 0)
+#define PINMUX_GPIO131__FUNC_I2S3_MCK (MTK_PIN_NO(131) | 1)
+#define PINMUX_GPIO131__FUNC_I2S2_MCK (MTK_PIN_NO(131) | 2)
+#define PINMUX_GPIO131__FUNC_PWM2 (MTK_PIN_NO(131) | 3)
+
+#define PINMUX_GPIO132__FUNC_GPIO132 (MTK_PIN_NO(132) | 0)
+#define PINMUX_GPIO132__FUNC_I2S3_DO_1 (MTK_PIN_NO(132) | 1)
+#define PINMUX_GPIO132__FUNC_I2S2_DI_1 (MTK_PIN_NO(132) | 2)
+#define PINMUX_GPIO132__FUNC_PWM3 (MTK_PIN_NO(132) | 3)
+
+#define PINMUX_GPIO133__FUNC_GPIO133 (MTK_PIN_NO(133) | 0)
+#define PINMUX_GPIO133__FUNC_I2S3_DO_2 (MTK_PIN_NO(133) | 1)
+#define PINMUX_GPIO133__FUNC_I2S2_DI_2 (MTK_PIN_NO(133) | 2)
+#define PINMUX_GPIO133__FUNC_PWM4 (MTK_PIN_NO(133) | 3)
+
+#define PINMUX_GPIO134__FUNC_GPIO134 (MTK_PIN_NO(134) | 0)
+#define PINMUX_GPIO134__FUNC_I2S3_DO_3 (MTK_PIN_NO(134) | 1)
+#define PINMUX_GPIO134__FUNC_DISP_PWM1 (MTK_PIN_NO(134) | 2)
+#define PINMUX_GPIO134__FUNC_I2S1_DO_1 (MTK_PIN_NO(134) | 3)
+#define PINMUX_GPIO134__FUNC_PWM5 (MTK_PIN_NO(134) | 4)
+
+#define PINMUX_GPIO135__FUNC_GPIO135 (MTK_PIN_NO(135) | 0)
+#define PINMUX_GPIO135__FUNC_I2S3_DO_4 (MTK_PIN_NO(135) | 1)
+#define PINMUX_GPIO135__FUNC_DSI1_TE (MTK_PIN_NO(135) | 2)
+#define PINMUX_GPIO135__FUNC_I2S1_DO_2 (MTK_PIN_NO(135) | 3)
+#define PINMUX_GPIO135__FUNC_PWM6 (MTK_PIN_NO(135) | 4)
+
+#define PINMUX_GPIO136__FUNC_GPIO136 (MTK_PIN_NO(136) | 0)
+#define PINMUX_GPIO136__FUNC_SDA3 (MTK_PIN_NO(136) | 1)
+
+#define PINMUX_GPIO137__FUNC_GPIO137 (MTK_PIN_NO(137) | 0)
+#define PINMUX_GPIO137__FUNC_SCL3 (MTK_PIN_NO(137) | 1)
+
+#define PINMUX_GPIO138__FUNC_GPIO138 (MTK_PIN_NO(138) | 0)
+#define PINMUX_GPIO138__FUNC_DPI_CK (MTK_PIN_NO(138) | 1)
+#define PINMUX_GPIO138__FUNC_NLD6 (MTK_PIN_NO(138) | 2)
+#define PINMUX_GPIO138__FUNC_UTXD0 (MTK_PIN_NO(138) | 3)
+#define PINMUX_GPIO138__FUNC_USB_DRVVBUS (MTK_PIN_NO(138) | 4)
+#define PINMUX_GPIO138__FUNC_IRDA_PDN (MTK_PIN_NO(138) | 5)
+
+#define PINMUX_GPIO139__FUNC_GPIO139 (MTK_PIN_NO(139) | 0)
+#define PINMUX_GPIO139__FUNC_DPI_DE (MTK_PIN_NO(139) | 1)
+#define PINMUX_GPIO139__FUNC_NLD7 (MTK_PIN_NO(139) | 2)
+#define PINMUX_GPIO139__FUNC_URXD0 (MTK_PIN_NO(139) | 3)
+#define PINMUX_GPIO139__FUNC_MD_UTXD (MTK_PIN_NO(139) | 4)
+#define PINMUX_GPIO139__FUNC_IRDA_RXD (MTK_PIN_NO(139) | 5)
+
+#define PINMUX_GPIO140__FUNC_GPIO140 (MTK_PIN_NO(140) | 0)
+#define PINMUX_GPIO140__FUNC_DPI_D0 (MTK_PIN_NO(140) | 1)
+#define PINMUX_GPIO140__FUNC_NREB (MTK_PIN_NO(140) | 2)
+#define PINMUX_GPIO140__FUNC_UCTS0 (MTK_PIN_NO(140) | 3)
+#define PINMUX_GPIO140__FUNC_MD_URXD (MTK_PIN_NO(140) | 4)
+#define PINMUX_GPIO140__FUNC_IRDA_TXD (MTK_PIN_NO(140) | 5)
+
+#define PINMUX_GPIO141__FUNC_GPIO141 (MTK_PIN_NO(141) | 0)
+#define PINMUX_GPIO141__FUNC_DPI_D1 (MTK_PIN_NO(141) | 1)
+#define PINMUX_GPIO141__FUNC_NRNB0 (MTK_PIN_NO(141) | 2)
+#define PINMUX_GPIO141__FUNC_URTS0 (MTK_PIN_NO(141) | 3)
+#define PINMUX_GPIO141__FUNC_LTE_UTXD (MTK_PIN_NO(141) | 4)
+#define PINMUX_GPIO141__FUNC_I2S2_WS (MTK_PIN_NO(141) | 5)
+
+#define PINMUX_GPIO142__FUNC_GPIO142 (MTK_PIN_NO(142) | 0)
+#define PINMUX_GPIO142__FUNC_DPI_D2 (MTK_PIN_NO(142) | 1)
+#define PINMUX_GPIO142__FUNC_NWEB (MTK_PIN_NO(142) | 2)
+#define PINMUX_GPIO142__FUNC_UTXD1 (MTK_PIN_NO(142) | 3)
+#define PINMUX_GPIO142__FUNC_LTE_URXD (MTK_PIN_NO(142) | 4)
+#define PINMUX_GPIO142__FUNC_I2S2_BCK (MTK_PIN_NO(142) | 5)
+
+#define PINMUX_GPIO143__FUNC_GPIO143 (MTK_PIN_NO(143) | 0)
+#define PINMUX_GPIO143__FUNC_DPI_D3 (MTK_PIN_NO(143) | 1)
+#define PINMUX_GPIO143__FUNC_NCEB0 (MTK_PIN_NO(143) | 2)
+#define PINMUX_GPIO143__FUNC_URXD1 (MTK_PIN_NO(143) | 3)
+#define PINMUX_GPIO143__FUNC_TDD_TXD (MTK_PIN_NO(143) | 4)
+#define PINMUX_GPIO143__FUNC_I2S2_MCK (MTK_PIN_NO(143) | 5)
+
+#define PINMUX_GPIO144__FUNC_GPIO144 (MTK_PIN_NO(144) | 0)
+#define PINMUX_GPIO144__FUNC_DPI_D4 (MTK_PIN_NO(144) | 1)
+#define PINMUX_GPIO144__FUNC_NALE (MTK_PIN_NO(144) | 2)
+#define PINMUX_GPIO144__FUNC_UCTS1 (MTK_PIN_NO(144) | 3)
+#define PINMUX_GPIO144__FUNC_TDD_TMS (MTK_PIN_NO(144) | 4)
+#define PINMUX_GPIO144__FUNC_I2S2_DI_1 (MTK_PIN_NO(144) | 5)
+
+#define PINMUX_GPIO145__FUNC_GPIO145 (MTK_PIN_NO(145) | 0)
+#define PINMUX_GPIO145__FUNC_DPI_D5 (MTK_PIN_NO(145) | 1)
+#define PINMUX_GPIO145__FUNC_NCLE (MTK_PIN_NO(145) | 2)
+#define PINMUX_GPIO145__FUNC_URTS1 (MTK_PIN_NO(145) | 3)
+#define PINMUX_GPIO145__FUNC_TDD_TCK (MTK_PIN_NO(145) | 4)
+#define PINMUX_GPIO145__FUNC_I2S2_DI_2 (MTK_PIN_NO(145) | 5)
+
+#define PINMUX_GPIO146__FUNC_GPIO146 (MTK_PIN_NO(146) | 0)
+#define PINMUX_GPIO146__FUNC_DPI_D6 (MTK_PIN_NO(146) | 1)
+#define PINMUX_GPIO146__FUNC_NLD8 (MTK_PIN_NO(146) | 2)
+#define PINMUX_GPIO146__FUNC_UTXD2 (MTK_PIN_NO(146) | 3)
+#define PINMUX_GPIO146__FUNC_TDD_TDI (MTK_PIN_NO(146) | 4)
+
+#define PINMUX_GPIO147__FUNC_GPIO147 (MTK_PIN_NO(147) | 0)
+#define PINMUX_GPIO147__FUNC_DPI_D7 (MTK_PIN_NO(147) | 1)
+#define PINMUX_GPIO147__FUNC_NLD9 (MTK_PIN_NO(147) | 2)
+#define PINMUX_GPIO147__FUNC_URXD2 (MTK_PIN_NO(147) | 3)
+#define PINMUX_GPIO147__FUNC_TDD_TDO (MTK_PIN_NO(147) | 4)
+#define PINMUX_GPIO147__FUNC_I2S1_WS (MTK_PIN_NO(147) | 5)
+
+#define PINMUX_GPIO148__FUNC_GPIO148 (MTK_PIN_NO(148) | 0)
+#define PINMUX_GPIO148__FUNC_DPI_D8 (MTK_PIN_NO(148) | 1)
+#define PINMUX_GPIO148__FUNC_NLD10 (MTK_PIN_NO(148) | 2)
+#define PINMUX_GPIO148__FUNC_UCTS2 (MTK_PIN_NO(148) | 3)
+#define PINMUX_GPIO148__FUNC_TDD_TRSTN (MTK_PIN_NO(148) | 4)
+#define PINMUX_GPIO148__FUNC_I2S1_BCK (MTK_PIN_NO(148) | 5)
+
+#define PINMUX_GPIO149__FUNC_GPIO149 (MTK_PIN_NO(149) | 0)
+#define PINMUX_GPIO149__FUNC_DPI_D9 (MTK_PIN_NO(149) | 1)
+#define PINMUX_GPIO149__FUNC_NLD11 (MTK_PIN_NO(149) | 2)
+#define PINMUX_GPIO149__FUNC_URTS2 (MTK_PIN_NO(149) | 3)
+#define PINMUX_GPIO149__FUNC_LTE_MD32_JTAG_TMS (MTK_PIN_NO(149) | 4)
+#define PINMUX_GPIO149__FUNC_I2S1_MCK (MTK_PIN_NO(149) | 5)
+
+#define PINMUX_GPIO150__FUNC_GPIO150 (MTK_PIN_NO(150) | 0)
+#define PINMUX_GPIO150__FUNC_DPI_D10 (MTK_PIN_NO(150) | 1)
+#define PINMUX_GPIO150__FUNC_NLD12 (MTK_PIN_NO(150) | 2)
+#define PINMUX_GPIO150__FUNC_UTXD3 (MTK_PIN_NO(150) | 3)
+#define PINMUX_GPIO150__FUNC_LTE_MD32_JTAG_TCK (MTK_PIN_NO(150) | 4)
+#define PINMUX_GPIO150__FUNC_I2S1_DO_1 (MTK_PIN_NO(150) | 5)
+
+#define PINMUX_GPIO151__FUNC_GPIO151 (MTK_PIN_NO(151) | 0)
+#define PINMUX_GPIO151__FUNC_DPI_D11 (MTK_PIN_NO(151) | 1)
+#define PINMUX_GPIO151__FUNC_NLD13 (MTK_PIN_NO(151) | 2)
+#define PINMUX_GPIO151__FUNC_URXD3 (MTK_PIN_NO(151) | 3)
+#define PINMUX_GPIO151__FUNC_LTE_MD32_JTAG_TDI (MTK_PIN_NO(151) | 4)
+#define PINMUX_GPIO151__FUNC_I2S1_DO_2 (MTK_PIN_NO(151) | 5)
+
+#define PINMUX_GPIO152__FUNC_GPIO152 (MTK_PIN_NO(152) | 0)
+#define PINMUX_GPIO152__FUNC_DPI_HSYNC (MTK_PIN_NO(152) | 1)
+#define PINMUX_GPIO152__FUNC_NLD14 (MTK_PIN_NO(152) | 2)
+#define PINMUX_GPIO152__FUNC_UCTS3 (MTK_PIN_NO(152) | 3)
+#define PINMUX_GPIO152__FUNC_LTE_MD32_JTAG_TDO (MTK_PIN_NO(152) | 4)
+#define PINMUX_GPIO152__FUNC_DSI1_TE (MTK_PIN_NO(152) | 5)
+
+#define PINMUX_GPIO153__FUNC_GPIO153 (MTK_PIN_NO(153) | 0)
+#define PINMUX_GPIO153__FUNC_DPI_VSYNC (MTK_PIN_NO(153) | 1)
+#define PINMUX_GPIO153__FUNC_NLD15 (MTK_PIN_NO(153) | 2)
+#define PINMUX_GPIO153__FUNC_URTS3 (MTK_PIN_NO(153) | 3)
+#define PINMUX_GPIO153__FUNC_LTE_MD32_JTAG_TRST (MTK_PIN_NO(153) | 4)
+#define PINMUX_GPIO153__FUNC_DISP_PWM1 (MTK_PIN_NO(153) | 5)
+
+#define PINMUX_GPIO154__FUNC_GPIO154 (MTK_PIN_NO(154) | 0)
+#define PINMUX_GPIO154__FUNC_MSDC0_DAT0 (MTK_PIN_NO(154) | 1)
+#define PINMUX_GPIO154__FUNC_NLD8 (MTK_PIN_NO(154) | 2)
+
+#define PINMUX_GPIO155__FUNC_GPIO155 (MTK_PIN_NO(155) | 0)
+#define PINMUX_GPIO155__FUNC_MSDC0_DAT1 (MTK_PIN_NO(155) | 1)
+#define PINMUX_GPIO155__FUNC_NLD9 (MTK_PIN_NO(155) | 2)
+
+#define PINMUX_GPIO156__FUNC_GPIO156 (MTK_PIN_NO(156) | 0)
+#define PINMUX_GPIO156__FUNC_MSDC0_DAT2 (MTK_PIN_NO(156) | 1)
+#define PINMUX_GPIO156__FUNC_NLD10 (MTK_PIN_NO(156) | 2)
+
+#define PINMUX_GPIO157__FUNC_GPIO157 (MTK_PIN_NO(157) | 0)
+#define PINMUX_GPIO157__FUNC_MSDC0_DAT3 (MTK_PIN_NO(157) | 1)
+#define PINMUX_GPIO157__FUNC_NLD11 (MTK_PIN_NO(157) | 2)
+
+#define PINMUX_GPIO158__FUNC_GPIO158 (MTK_PIN_NO(158) | 0)
+#define PINMUX_GPIO158__FUNC_MSDC0_DAT4 (MTK_PIN_NO(158) | 1)
+#define PINMUX_GPIO158__FUNC_NLD12 (MTK_PIN_NO(158) | 2)
+
+#define PINMUX_GPIO159__FUNC_GPIO159 (MTK_PIN_NO(159) | 0)
+#define PINMUX_GPIO159__FUNC_MSDC0_DAT5 (MTK_PIN_NO(159) | 1)
+#define PINMUX_GPIO159__FUNC_NLD13 (MTK_PIN_NO(159) | 2)
+
+#define PINMUX_GPIO160__FUNC_GPIO160 (MTK_PIN_NO(160) | 0)
+#define PINMUX_GPIO160__FUNC_MSDC0_DAT6 (MTK_PIN_NO(160) | 1)
+#define PINMUX_GPIO160__FUNC_NLD14 (MTK_PIN_NO(160) | 2)
+
+#define PINMUX_GPIO161__FUNC_GPIO161 (MTK_PIN_NO(161) | 0)
+#define PINMUX_GPIO161__FUNC_MSDC0_DAT7 (MTK_PIN_NO(161) | 1)
+#define PINMUX_GPIO161__FUNC_NLD15 (MTK_PIN_NO(161) | 2)
+
+#define PINMUX_GPIO162__FUNC_GPIO162 (MTK_PIN_NO(162) | 0)
+#define PINMUX_GPIO162__FUNC_MSDC0_CMD (MTK_PIN_NO(162) | 1)
+
+#define PINMUX_GPIO163__FUNC_GPIO163 (MTK_PIN_NO(163) | 0)
+#define PINMUX_GPIO163__FUNC_MSDC0_CLK (MTK_PIN_NO(163) | 1)
+
+#define PINMUX_GPIO164__FUNC_GPIO164 (MTK_PIN_NO(164) | 0)
+#define PINMUX_GPIO164__FUNC_MSDC0_DSL (MTK_PIN_NO(164) | 1)
+
+#define PINMUX_GPIO165__FUNC_GPIO165 (MTK_PIN_NO(165) | 0)
+#define PINMUX_GPIO165__FUNC_MSDC0_RSTB (MTK_PIN_NO(165) | 1)
+
+#define PINMUX_GPIO166__FUNC_GPIO166 (MTK_PIN_NO(166) | 0)
+#define PINMUX_GPIO166__FUNC_SPI_CK_0 (MTK_PIN_NO(166) | 1)
+#define PINMUX_GPIO166__FUNC_PWM0 (MTK_PIN_NO(166) | 3)
+
+#define PINMUX_GPIO167__FUNC_GPIO167 (MTK_PIN_NO(167) | 0)
+#define PINMUX_GPIO167__FUNC_SPI_MI_0 (MTK_PIN_NO(167) | 1)
+#define PINMUX_GPIO167__FUNC_PWM1 (MTK_PIN_NO(167) | 3)
+#define PINMUX_GPIO167__FUNC_SPI_MO_0 (MTK_PIN_NO(167) | 4)
+
+#define PINMUX_GPIO168__FUNC_GPIO168 (MTK_PIN_NO(168) | 0)
+#define PINMUX_GPIO168__FUNC_SPI_MO_0 (MTK_PIN_NO(168) | 1)
+#define PINMUX_GPIO168__FUNC_MD_EINT3 (MTK_PIN_NO(168) | 2)
+#define PINMUX_GPIO168__FUNC_PWM2 (MTK_PIN_NO(168) | 3)
+#define PINMUX_GPIO168__FUNC_SPI_MI_0 (MTK_PIN_NO(168) | 4)
+
+#define PINMUX_GPIO169__FUNC_GPIO169 (MTK_PIN_NO(169) | 0)
+#define PINMUX_GPIO169__FUNC_SPI_CS_0 (MTK_PIN_NO(169) | 1)
+#define PINMUX_GPIO169__FUNC_MD_EINT4 (MTK_PIN_NO(169) | 2)
+#define PINMUX_GPIO169__FUNC_PWM3 (MTK_PIN_NO(169) | 3)
+
+#define PINMUX_GPIO170__FUNC_GPIO170 (MTK_PIN_NO(170) | 0)
+#define PINMUX_GPIO170__FUNC_MSDC1_CMD (MTK_PIN_NO(170) | 1)
+
+#define PINMUX_GPIO171__FUNC_GPIO171 (MTK_PIN_NO(171) | 0)
+#define PINMUX_GPIO171__FUNC_MSDC1_DAT0 (MTK_PIN_NO(171) | 1)
+
+#define PINMUX_GPIO172__FUNC_GPIO172 (MTK_PIN_NO(172) | 0)
+#define PINMUX_GPIO172__FUNC_MSDC1_DAT1 (MTK_PIN_NO(172) | 1)
+
+#define PINMUX_GPIO173__FUNC_GPIO173 (MTK_PIN_NO(173) | 0)
+#define PINMUX_GPIO173__FUNC_MSDC1_DAT2 (MTK_PIN_NO(173) | 1)
+
+#define PINMUX_GPIO174__FUNC_GPIO174 (MTK_PIN_NO(174) | 0)
+#define PINMUX_GPIO174__FUNC_MSDC1_DAT3 (MTK_PIN_NO(174) | 1)
+
+#define PINMUX_GPIO175__FUNC_GPIO175 (MTK_PIN_NO(175) | 0)
+#define PINMUX_GPIO175__FUNC_MSDC1_CLK (MTK_PIN_NO(175) | 1)
+
+#define PINMUX_GPIO176__FUNC_GPIO176 (MTK_PIN_NO(176) | 0)
+#define PINMUX_GPIO176__FUNC_PWRAP_SPIMI (MTK_PIN_NO(176) | 1)
+#define PINMUX_GPIO176__FUNC_PWRAP_SPIMO (MTK_PIN_NO(176) | 2)
+
+#define PINMUX_GPIO177__FUNC_GPIO177 (MTK_PIN_NO(177) | 0)
+#define PINMUX_GPIO177__FUNC_PWRAP_SPIMO (MTK_PIN_NO(177) | 1)
+#define PINMUX_GPIO177__FUNC_PWRAP_SPIMI (MTK_PIN_NO(177) | 2)
+
+#define PINMUX_GPIO178__FUNC_GPIO178 (MTK_PIN_NO(178) | 0)
+#define PINMUX_GPIO178__FUNC_PWRAP_SPICK (MTK_PIN_NO(178) | 1)
+
+#define PINMUX_GPIO179__FUNC_GPIO179 (MTK_PIN_NO(179) | 0)
+#define PINMUX_GPIO179__FUNC_PWRAP_SPICS (MTK_PIN_NO(179) | 1)
+
+#define PINMUX_GPIO180__FUNC_GPIO180 (MTK_PIN_NO(180) | 0)
+#define PINMUX_GPIO180__FUNC_AUD_CLK_MOSI (MTK_PIN_NO(180) | 1)
+#define PINMUX_GPIO180__FUNC_I2S1_WS (MTK_PIN_NO(180) | 2)
+#define PINMUX_GPIO180__FUNC_I2S2_WS (MTK_PIN_NO(180) | 3)
+#define PINMUX_GPIO180__FUNC_I2S0_WS (MTK_PIN_NO(180) | 4)
+
+#define PINMUX_GPIO181__FUNC_GPIO181 (MTK_PIN_NO(181) | 0)
+#define PINMUX_GPIO181__FUNC_AUD_DAT_MISO_1 (MTK_PIN_NO(181) | 1)
+#define PINMUX_GPIO181__FUNC_I2S1_BCK (MTK_PIN_NO(181) | 2)
+#define PINMUX_GPIO181__FUNC_I2S2_BCK (MTK_PIN_NO(181) | 3)
+#define PINMUX_GPIO181__FUNC_I2S0_BCK (MTK_PIN_NO(181) | 4)
+
+#define PINMUX_GPIO182__FUNC_GPIO182 (MTK_PIN_NO(182) | 0)
+#define PINMUX_GPIO182__FUNC_AUD_DAT_MOSI_1 (MTK_PIN_NO(182) | 1)
+#define PINMUX_GPIO182__FUNC_I2S1_MCK (MTK_PIN_NO(182) | 2)
+#define PINMUX_GPIO182__FUNC_I2S2_MCK (MTK_PIN_NO(182) | 3)
+#define PINMUX_GPIO182__FUNC_I2S0_MCK (MTK_PIN_NO(182) | 4)
+
+#define PINMUX_GPIO183__FUNC_GPIO183 (MTK_PIN_NO(183) | 0)
+#define PINMUX_GPIO183__FUNC_AUD_DAT_MISO_2 (MTK_PIN_NO(183) | 1)
+#define PINMUX_GPIO183__FUNC_I2S1_DO_1 (MTK_PIN_NO(183) | 2)
+#define PINMUX_GPIO183__FUNC_I2S2_DI_1 (MTK_PIN_NO(183) | 3)
+#define PINMUX_GPIO183__FUNC_I2S0_DO (MTK_PIN_NO(183) | 4)
+
+#define PINMUX_GPIO184__FUNC_GPIO184 (MTK_PIN_NO(184) | 0)
+#define PINMUX_GPIO184__FUNC_AUD_DAT_MOSI_2 (MTK_PIN_NO(184) | 1)
+#define PINMUX_GPIO184__FUNC_I2S1_DO_2 (MTK_PIN_NO(184) | 2)
+#define PINMUX_GPIO184__FUNC_I2S2_DI_2 (MTK_PIN_NO(184) | 3)
+#define PINMUX_GPIO184__FUNC_I2S0_DI (MTK_PIN_NO(184) | 4)
+
+#define PINMUX_GPIO185__FUNC_GPIO185 (MTK_PIN_NO(185) | 0)
+#define PINMUX_GPIO185__FUNC_RTC32K_CK (MTK_PIN_NO(185) | 1)
+
+#define PINMUX_GPIO186__FUNC_GPIO186 (MTK_PIN_NO(186) | 0)
+#define PINMUX_GPIO186__FUNC_DISP_PWM0 (MTK_PIN_NO(186) | 1)
+#define PINMUX_GPIO186__FUNC_DISP_PWM1 (MTK_PIN_NO(186) | 2)
+
+#define PINMUX_GPIO187__FUNC_GPIO187 (MTK_PIN_NO(187) | 0)
+#define PINMUX_GPIO187__FUNC_SRCLKENAI (MTK_PIN_NO(187) | 1)
+
+#define PINMUX_GPIO188__FUNC_GPIO188 (MTK_PIN_NO(188) | 0)
+#define PINMUX_GPIO188__FUNC_SRCLKENAI2 (MTK_PIN_NO(188) | 1)
+
+#define PINMUX_GPIO189__FUNC_GPIO189 (MTK_PIN_NO(189) | 0)
+#define PINMUX_GPIO189__FUNC_SRCLKENA0 (MTK_PIN_NO(189) | 1)
+
+#define PINMUX_GPIO190__FUNC_GPIO190 (MTK_PIN_NO(190) | 0)
+#define PINMUX_GPIO190__FUNC_SRCLKENA1 (MTK_PIN_NO(190) | 1)
+
+#define PINMUX_GPIO191__FUNC_GPIO191 (MTK_PIN_NO(191) | 0)
+#define PINMUX_GPIO191__FUNC_WATCHDOG_AO (MTK_PIN_NO(191) | 1)
+
+#define PINMUX_GPIO192__FUNC_GPIO192 (MTK_PIN_NO(192) | 0)
+#define PINMUX_GPIO192__FUNC_I2S0_WS (MTK_PIN_NO(192) | 1)
+#define PINMUX_GPIO192__FUNC_I2S1_WS (MTK_PIN_NO(192) | 2)
+#define PINMUX_GPIO192__FUNC_I2S2_WS (MTK_PIN_NO(192) | 3)
+#define PINMUX_GPIO192__FUNC_NCEB1 (MTK_PIN_NO(192) | 4)
+
+#define PINMUX_GPIO193__FUNC_GPIO193 (MTK_PIN_NO(193) | 0)
+#define PINMUX_GPIO193__FUNC_I2S0_BCK (MTK_PIN_NO(193) | 1)
+#define PINMUX_GPIO193__FUNC_I2S1_BCK (MTK_PIN_NO(193) | 2)
+#define PINMUX_GPIO193__FUNC_I2S2_BCK (MTK_PIN_NO(193) | 3)
+#define PINMUX_GPIO193__FUNC_NRNB1 (MTK_PIN_NO(193) | 4)
+
+#define PINMUX_GPIO194__FUNC_GPIO194 (MTK_PIN_NO(194) | 0)
+#define PINMUX_GPIO194__FUNC_I2S0_MCK (MTK_PIN_NO(194) | 1)
+#define PINMUX_GPIO194__FUNC_I2S1_MCK (MTK_PIN_NO(194) | 2)
+#define PINMUX_GPIO194__FUNC_I2S2_MCK (MTK_PIN_NO(194) | 3)
+
+#define PINMUX_GPIO195__FUNC_GPIO195 (MTK_PIN_NO(195) | 0)
+#define PINMUX_GPIO195__FUNC_I2S0_DO (MTK_PIN_NO(195) | 1)
+#define PINMUX_GPIO195__FUNC_I2S1_DO_1 (MTK_PIN_NO(195) | 2)
+#define PINMUX_GPIO195__FUNC_I2S2_DI_1 (MTK_PIN_NO(195) | 3)
+
+#define PINMUX_GPIO196__FUNC_GPIO196 (MTK_PIN_NO(196) | 0)
+#define PINMUX_GPIO196__FUNC_I2S0_DI (MTK_PIN_NO(196) | 1)
+#define PINMUX_GPIO196__FUNC_I2S1_DO_2 (MTK_PIN_NO(196) | 2)
+#define PINMUX_GPIO196__FUNC_I2S2_DI_2 (MTK_PIN_NO(196) | 3)
+
+
+#endif
-- 
2.35.1

