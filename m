Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3018D35B2B1
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Apr 2021 11:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235296AbhDKJ1i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Apr 2021 05:27:38 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:52206 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235304AbhDKJ1h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Apr 2021 05:27:37 -0400
X-UUID: d0fe0a5c7c0945d386ed31b0197cdb5b-20210411
X-UUID: d0fe0a5c7c0945d386ed31b0197cdb5b-20210411
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1157955887; Sun, 11 Apr 2021 17:27:17 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Apr 2021 17:27:09 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 11 Apr 2021 17:27:07 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>,
        <jg_poxu@mediatek.com>, <biao.huang@mediatek.com>,
        <hongzhou.yang@mediatek.com>, <erin.lo@mediatek.com>,
        <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        <sj.huang@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v3 1/5] dt-bindings: pinctrl: mt8195: add pinctrl file and binding document
Date:   Sun, 11 Apr 2021 17:26:55 +0800
Message-ID: <20210411092659.22838-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210411092659.22838-1-zhiyong.tao@mediatek.com>
References: <20210411092659.22838-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 0EF0A65A93FB822262681B49BEFF23F5501A2EBE9CB55CCF807A5F9DDB3B31682000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

1. This patch adds pinctrl file for mt8195.
2. This patch adds mt8195 compatible node in binding document.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 .../bindings/pinctrl/pinctrl-mt8195.yaml      | 152 +++
 include/dt-bindings/pinctrl/mt8195-pinfunc.h  | 962 ++++++++++++++++++
 2 files changed, 1114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
 create mode 100644 include/dt-bindings/pinctrl/mt8195-pinfunc.h

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
new file mode 100644
index 000000000000..b4b4bfa701ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8195.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8195 Pin Controller
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+description: |
+  The Mediatek's Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt8195-pinctrl
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
+    description: gpio valid number range.
+    maxItems: 1
+
+  reg:
+    description: |
+      Physical address base for gpio base registers. There are 8 GPIO
+      physical address base in mt8195.
+    maxItems: 8
+
+  reg-names:
+    description: |
+      Gpio base register names.
+    maxItems: 8
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
+#PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    description: |
+      A pinctrl node should contain at least one subnodes representing the
+      pinctrl groups available on the machine. Each subnode will list the
+      pins it needs, and how they should be configured, with regard to muxer
+      configuration, pullups, drive strength, input enable/disable and
+      input schmitt.
+      An example of using macro:
+      pincontroller {
+        /* GPIO0 set as multifunction GPIO0 */
+        gpio_pin {
+          pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+        };
+        /* GPIO8 set as multifunction SDA0 */
+        i2c0_pin {
+          pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
+        };
+      };
+    $ref: "pinmux-node.yaml"
+
+    properties:
+      pinmux:
+        description: |
+          Integer array, represents gpio pin number and mux setting.
+          Supported pin number and mux varies for different SoCs, and are defined
+          as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
+
+      drive-strength:
+        description: |
+          It can support some arguments which is from 0 to 7. It can only support
+          2/4/6/8/10/12/14/16mA in mt8195.
+        enum: [0, 1, 2, 3, 4, 5, 6, 7]
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
+      input-enable: true
+
+      input-disable: true
+
+      input-schmitt-enable: true
+
+      input-schmitt-disable: true
+
+    required:
+      - pinmux
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
+            #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
+            #include <dt-bindings/interrupt-controller/arm-gic.h>
+            pio: pinctrl@10005000 {
+                    compatible = "mediatek,mt8195-pinctrl";
+                    reg = <0x10005000 0x1000>,
+                          <0x11d10000 0x1000>,
+                          <0x11d30000 0x1000>,
+                          <0x11d40000 0x1000>,
+                          <0x11e20000 0x1000>,
+                          <0x11e20000 0x1000>,
+                          <0x11eb0000 0x1000>,
+                          <0x11f40000 0x1000>,
+                          <0x1000b000 0x1000>;
+                    reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
+                          "iocfg_br", "iocfg_lm", "iocfg_rb",
+                          "iocfg_tl", "eint";
+                    gpio-controller;
+                    #gpio-cells = <2>;
+                    gpio-ranges = <&pio 0 0 144>;
+                    interrupt-controller;
+                    interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
+                    #interrupt-cells = <2>;
+
+                    pio-pins {
+                      pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+                      output-low;
+                    };
+            };
diff --git a/include/dt-bindings/pinctrl/mt8195-pinfunc.h b/include/dt-bindings/pinctrl/mt8195-pinfunc.h
new file mode 100644
index 000000000000..666331bb9b40
--- /dev/null
+++ b/include/dt-bindings/pinctrl/mt8195-pinfunc.h
@@ -0,0 +1,962 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ * Author: Zhiyong Tao <zhiyong.tao@mediatek.com>
+ */
+
+#ifndef __MT8195_PINFUNC_H
+#define __MT8195_PINFUNC_H
+
+#include "mt65xx.h"
+
+#define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
+#define PINMUX_GPIO0__FUNC_TP_GPIO0_AO (MTK_PIN_NO(0) | 1)
+#define PINMUX_GPIO0__FUNC_MSDC2_CMD (MTK_PIN_NO(0) | 2)
+#define PINMUX_GPIO0__FUNC_TDMIN_MCK (MTK_PIN_NO(0) | 3)
+#define PINMUX_GPIO0__FUNC_CLKM0 (MTK_PIN_NO(0) | 4)
+#define PINMUX_GPIO0__FUNC_PERSTN_1 (MTK_PIN_NO(0) | 5)
+#define PINMUX_GPIO0__FUNC_IDDIG_1P (MTK_PIN_NO(0) | 6)
+#define PINMUX_GPIO0__FUNC_DMIC4_CLK (MTK_PIN_NO(0) | 7)
+
+#define PINMUX_GPIO1__FUNC_GPIO1 (MTK_PIN_NO(1) | 0)
+#define PINMUX_GPIO1__FUNC_TP_GPIO1_AO (MTK_PIN_NO(1) | 1)
+#define PINMUX_GPIO1__FUNC_MSDC2_CLK (MTK_PIN_NO(1) | 2)
+#define PINMUX_GPIO1__FUNC_TDMIN_DI (MTK_PIN_NO(1) | 3)
+#define PINMUX_GPIO1__FUNC_CLKM1 (MTK_PIN_NO(1) | 4)
+#define PINMUX_GPIO1__FUNC_CLKREQN_1 (MTK_PIN_NO(1) | 5)
+#define PINMUX_GPIO1__FUNC_USB_DRVVBUS_1P (MTK_PIN_NO(1) | 6)
+#define PINMUX_GPIO1__FUNC_DMIC4_DAT (MTK_PIN_NO(1) | 7)
+
+#define PINMUX_GPIO2__FUNC_GPIO2 (MTK_PIN_NO(2) | 0)
+#define PINMUX_GPIO2__FUNC_TP_GPIO2_AO (MTK_PIN_NO(2) | 1)
+#define PINMUX_GPIO2__FUNC_MSDC2_DAT3 (MTK_PIN_NO(2) | 2)
+#define PINMUX_GPIO2__FUNC_TDMIN_LRCK (MTK_PIN_NO(2) | 3)
+#define PINMUX_GPIO2__FUNC_CLKM2 (MTK_PIN_NO(2) | 4)
+#define PINMUX_GPIO2__FUNC_WAKEN_1 (MTK_PIN_NO(2) | 5)
+#define PINMUX_GPIO2__FUNC_DMIC2_CLK (MTK_PIN_NO(2) | 7)
+
+#define PINMUX_GPIO3__FUNC_GPIO3 (MTK_PIN_NO(3) | 0)
+#define PINMUX_GPIO3__FUNC_TP_GPIO3_AO (MTK_PIN_NO(3) | 1)
+#define PINMUX_GPIO3__FUNC_MSDC2_DAT0 (MTK_PIN_NO(3) | 2)
+#define PINMUX_GPIO3__FUNC_TDMIN_BCK (MTK_PIN_NO(3) | 3)
+#define PINMUX_GPIO3__FUNC_CLKM3 (MTK_PIN_NO(3) | 4)
+#define PINMUX_GPIO3__FUNC_DMIC2_DAT (MTK_PIN_NO(3) | 7)
+
+#define PINMUX_GPIO4__FUNC_GPIO4 (MTK_PIN_NO(4) | 0)
+#define PINMUX_GPIO4__FUNC_TP_GPIO4_AO (MTK_PIN_NO(4) | 1)
+#define PINMUX_GPIO4__FUNC_MSDC2_DAT2 (MTK_PIN_NO(4) | 2)
+#define PINMUX_GPIO4__FUNC_SPDIF_IN1 (MTK_PIN_NO(4) | 3)
+#define PINMUX_GPIO4__FUNC_UTXD3 (MTK_PIN_NO(4) | 4)
+#define PINMUX_GPIO4__FUNC_SDA2 (MTK_PIN_NO(4) | 5)
+#define PINMUX_GPIO4__FUNC_IDDIG_2P (MTK_PIN_NO(4) | 7)
+
+#define PINMUX_GPIO5__FUNC_GPIO5 (MTK_PIN_NO(5) | 0)
+#define PINMUX_GPIO5__FUNC_TP_GPIO5_AO (MTK_PIN_NO(5) | 1)
+#define PINMUX_GPIO5__FUNC_MSDC2_DAT1 (MTK_PIN_NO(5) | 2)
+#define PINMUX_GPIO5__FUNC_SPDIF_IN0 (MTK_PIN_NO(5) | 3)
+#define PINMUX_GPIO5__FUNC_URXD3 (MTK_PIN_NO(5) | 4)
+#define PINMUX_GPIO5__FUNC_SCL2 (MTK_PIN_NO(5) | 5)
+#define PINMUX_GPIO5__FUNC_USB_DRVVBUS_2P (MTK_PIN_NO(5) | 7)
+
+#define PINMUX_GPIO6__FUNC_GPIO6 (MTK_PIN_NO(6) | 0)
+#define PINMUX_GPIO6__FUNC_TP_GPIO6_AO (MTK_PIN_NO(6) | 1)
+#define PINMUX_GPIO6__FUNC_DP_TX_HPD (MTK_PIN_NO(6) | 2)
+#define PINMUX_GPIO6__FUNC_I2SO1_D4 (MTK_PIN_NO(6) | 3)
+#define PINMUX_GPIO6__FUNC_UTXD4 (MTK_PIN_NO(6) | 4)
+#define PINMUX_GPIO6__FUNC_CMVREF3 (MTK_PIN_NO(6) | 5)
+#define PINMUX_GPIO6__FUNC_DMIC3_CLK (MTK_PIN_NO(6) | 7)
+
+#define PINMUX_GPIO7__FUNC_GPIO7 (MTK_PIN_NO(7) | 0)
+#define PINMUX_GPIO7__FUNC_TP_GPIO7_AO (MTK_PIN_NO(7) | 1)
+#define PINMUX_GPIO7__FUNC_EDP_TX_HPD (MTK_PIN_NO(7) | 2)
+#define PINMUX_GPIO7__FUNC_I2SO1_D5 (MTK_PIN_NO(7) | 3)
+#define PINMUX_GPIO7__FUNC_URXD4 (MTK_PIN_NO(7) | 4)
+#define PINMUX_GPIO7__FUNC_CMVREF4 (MTK_PIN_NO(7) | 5)
+#define PINMUX_GPIO7__FUNC_DMIC3_DAT (MTK_PIN_NO(7) | 7)
+
+#define PINMUX_GPIO8__FUNC_GPIO8 (MTK_PIN_NO(8) | 0)
+#define PINMUX_GPIO8__FUNC_SDA0 (MTK_PIN_NO(8) | 1)
+#define PINMUX_GPIO8__FUNC_PWM_0 (MTK_PIN_NO(8) | 2)
+#define PINMUX_GPIO8__FUNC_SPDIF_OUT (MTK_PIN_NO(8) | 4)
+#define PINMUX_GPIO8__FUNC_LVTS_FOUT (MTK_PIN_NO(8) | 6)
+#define PINMUX_GPIO8__FUNC_DBG_MON_A0 (MTK_PIN_NO(8) | 7)
+
+#define PINMUX_GPIO9__FUNC_GPIO9 (MTK_PIN_NO(9) | 0)
+#define PINMUX_GPIO9__FUNC_SCL0 (MTK_PIN_NO(9) | 1)
+#define PINMUX_GPIO9__FUNC_PWM_1 (MTK_PIN_NO(9) | 2)
+#define PINMUX_GPIO9__FUNC_IR_IN (MTK_PIN_NO(9) | 4)
+#define PINMUX_GPIO9__FUNC_LVTS_SDO (MTK_PIN_NO(9) | 6)
+#define PINMUX_GPIO9__FUNC_DBG_MON_A1 (MTK_PIN_NO(9) | 7)
+
+#define PINMUX_GPIO10__FUNC_GPIO10 (MTK_PIN_NO(10) | 0)
+#define PINMUX_GPIO10__FUNC_SDA1 (MTK_PIN_NO(10) | 1)
+#define PINMUX_GPIO10__FUNC_PWM_2 (MTK_PIN_NO(10) | 2)
+#define PINMUX_GPIO10__FUNC_ADSP_URXD0 (MTK_PIN_NO(10) | 3)
+#define PINMUX_GPIO10__FUNC_SPDIF_IN1 (MTK_PIN_NO(10) | 4)
+#define PINMUX_GPIO10__FUNC_LVTS_SCF (MTK_PIN_NO(10) | 6)
+#define PINMUX_GPIO10__FUNC_DBG_MON_A2 (MTK_PIN_NO(10) | 7)
+
+#define PINMUX_GPIO11__FUNC_GPIO11 (MTK_PIN_NO(11) | 0)
+#define PINMUX_GPIO11__FUNC_SCL1 (MTK_PIN_NO(11) | 1)
+#define PINMUX_GPIO11__FUNC_PWM_3 (MTK_PIN_NO(11) | 2)
+#define PINMUX_GPIO11__FUNC_ADSP_UTXD0 (MTK_PIN_NO(11) | 3)
+#define PINMUX_GPIO11__FUNC_SPDIF_IN0 (MTK_PIN_NO(11) | 4)
+#define PINMUX_GPIO11__FUNC_LVTS_SCK (MTK_PIN_NO(11) | 6)
+#define PINMUX_GPIO11__FUNC_DBG_MON_A3 (MTK_PIN_NO(11) | 7)
+
+#define PINMUX_GPIO12__FUNC_GPIO12 (MTK_PIN_NO(12) | 0)
+#define PINMUX_GPIO12__FUNC_SDA2 (MTK_PIN_NO(12) | 1)
+#define PINMUX_GPIO12__FUNC_DMIC3_DAT_R (MTK_PIN_NO(12) | 2)
+#define PINMUX_GPIO12__FUNC_I2SO1_D6 (MTK_PIN_NO(12) | 3)
+#define PINMUX_GPIO12__FUNC_LVTS_SDI (MTK_PIN_NO(12) | 6)
+#define PINMUX_GPIO12__FUNC_DBG_MON_A4 (MTK_PIN_NO(12) | 7)
+
+#define PINMUX_GPIO13__FUNC_GPIO13 (MTK_PIN_NO(13) | 0)
+#define PINMUX_GPIO13__FUNC_SCL2 (MTK_PIN_NO(13) | 1)
+#define PINMUX_GPIO13__FUNC_DMIC4_DAT_R (MTK_PIN_NO(13) | 2)
+#define PINMUX_GPIO13__FUNC_I2SO1_D7 (MTK_PIN_NO(13) | 3)
+#define PINMUX_GPIO13__FUNC_DBG_MON_A5 (MTK_PIN_NO(13) | 7)
+
+#define PINMUX_GPIO14__FUNC_GPIO14 (MTK_PIN_NO(14) | 0)
+#define PINMUX_GPIO14__FUNC_SDA3 (MTK_PIN_NO(14) | 1)
+#define PINMUX_GPIO14__FUNC_DMIC3_DAT (MTK_PIN_NO(14) | 2)
+#define PINMUX_GPIO14__FUNC_TDMIN_MCK (MTK_PIN_NO(14) | 3)
+#define PINMUX_GPIO14__FUNC_DBG_MON_A6 (MTK_PIN_NO(14) | 7)
+
+#define PINMUX_GPIO15__FUNC_GPIO15 (MTK_PIN_NO(15) | 0)
+#define PINMUX_GPIO15__FUNC_SCL3 (MTK_PIN_NO(15) | 1)
+#define PINMUX_GPIO15__FUNC_DMIC3_CLK (MTK_PIN_NO(15) | 2)
+#define PINMUX_GPIO15__FUNC_TDMIN_DI (MTK_PIN_NO(15) | 3)
+#define PINMUX_GPIO15__FUNC_DBG_MON_A7 (MTK_PIN_NO(15) | 7)
+
+#define PINMUX_GPIO16__FUNC_GPIO16 (MTK_PIN_NO(16) | 0)
+#define PINMUX_GPIO16__FUNC_SDA4 (MTK_PIN_NO(16) | 1)
+#define PINMUX_GPIO16__FUNC_DMIC4_DAT (MTK_PIN_NO(16) | 2)
+#define PINMUX_GPIO16__FUNC_TDMIN_LRCK (MTK_PIN_NO(16) | 3)
+#define PINMUX_GPIO16__FUNC_DBG_MON_A8 (MTK_PIN_NO(16) | 7)
+
+#define PINMUX_GPIO17__FUNC_GPIO17 (MTK_PIN_NO(17) | 0)
+#define PINMUX_GPIO17__FUNC_SCL4 (MTK_PIN_NO(17) | 1)
+#define PINMUX_GPIO17__FUNC_DMIC4_CLK (MTK_PIN_NO(17) | 2)
+#define PINMUX_GPIO17__FUNC_TDMIN_BCK (MTK_PIN_NO(17) | 3)
+#define PINMUX_GPIO17__FUNC_DBG_MON_A9 (MTK_PIN_NO(17) | 7)
+
+#define PINMUX_GPIO18__FUNC_GPIO18 (MTK_PIN_NO(18) | 0)
+#define PINMUX_GPIO18__FUNC_DP_TX_HPD (MTK_PIN_NO(18) | 1)
+
+#define PINMUX_GPIO19__FUNC_GPIO19 (MTK_PIN_NO(19) | 0)
+#define PINMUX_GPIO19__FUNC_WAKEN (MTK_PIN_NO(19) | 1)
+#define PINMUX_GPIO19__FUNC_SCP_SDA1 (MTK_PIN_NO(19) | 2)
+#define PINMUX_GPIO19__FUNC_MD32_0_JTAG_TCK (MTK_PIN_NO(19) | 3)
+#define PINMUX_GPIO19__FUNC_ADSP_JTAG0_TCK (MTK_PIN_NO(19) | 4)
+#define PINMUX_GPIO19__FUNC_SDA6 (MTK_PIN_NO(19) | 5)
+
+#define PINMUX_GPIO20__FUNC_GPIO20 (MTK_PIN_NO(20) | 0)
+#define PINMUX_GPIO20__FUNC_PERSTN (MTK_PIN_NO(20) | 1)
+#define PINMUX_GPIO20__FUNC_SCP_SCL1 (MTK_PIN_NO(20) | 2)
+#define PINMUX_GPIO20__FUNC_MD32_0_JTAG_TMS (MTK_PIN_NO(20) | 3)
+#define PINMUX_GPIO20__FUNC_ADSP_JTAG0_TMS (MTK_PIN_NO(20) | 4)
+#define PINMUX_GPIO20__FUNC_SCL6 (MTK_PIN_NO(20) | 5)
+
+#define PINMUX_GPIO21__FUNC_GPIO21 (MTK_PIN_NO(21) | 0)
+#define PINMUX_GPIO21__FUNC_CLKREQN (MTK_PIN_NO(21) | 1)
+#define PINMUX_GPIO21__FUNC_MD32_0_JTAG_TDI (MTK_PIN_NO(21) | 3)
+#define PINMUX_GPIO21__FUNC_ADSP_JTAG0_TDI (MTK_PIN_NO(21) | 4)
+#define PINMUX_GPIO21__FUNC_SCP_SDA1 (MTK_PIN_NO(21) | 5)
+
+#define PINMUX_GPIO22__FUNC_GPIO22 (MTK_PIN_NO(22) | 0)
+#define PINMUX_GPIO22__FUNC_CMMCLK0 (MTK_PIN_NO(22) | 1)
+#define PINMUX_GPIO22__FUNC_PERSTN_1 (MTK_PIN_NO(22) | 2)
+#define PINMUX_GPIO22__FUNC_SCP_SCL1 (MTK_PIN_NO(22) | 5)
+#define PINMUX_GPIO22__FUNC_MD32_0_GPIO0 (MTK_PIN_NO(22) | 7)
+
+#define PINMUX_GPIO23__FUNC_GPIO23 (MTK_PIN_NO(23) | 0)
+#define PINMUX_GPIO23__FUNC_CMMCLK1 (MTK_PIN_NO(23) | 1)
+#define PINMUX_GPIO23__FUNC_CLKREQN_1 (MTK_PIN_NO(23) | 2)
+#define PINMUX_GPIO23__FUNC_SDA4 (MTK_PIN_NO(23) | 3)
+#define PINMUX_GPIO23__FUNC_DMIC1_CLK (MTK_PIN_NO(23) | 4)
+#define PINMUX_GPIO23__FUNC_SCP_SDA0 (MTK_PIN_NO(23) | 5)
+#define PINMUX_GPIO23__FUNC_MD32_0_GPIO1 (MTK_PIN_NO(23) | 7)
+
+#define PINMUX_GPIO24__FUNC_GPIO24 (MTK_PIN_NO(24) | 0)
+#define PINMUX_GPIO24__FUNC_CMMCLK2 (MTK_PIN_NO(24) | 1)
+#define PINMUX_GPIO24__FUNC_WAKEN_1 (MTK_PIN_NO(24) | 2)
+#define PINMUX_GPIO24__FUNC_SCL4 (MTK_PIN_NO(24) | 3)
+#define PINMUX_GPIO24__FUNC_DMIC1_DAT (MTK_PIN_NO(24) | 4)
+#define PINMUX_GPIO24__FUNC_SCP_SCL0 (MTK_PIN_NO(24) | 5)
+#define PINMUX_GPIO24__FUNC_LVTS_26M (MTK_PIN_NO(24) | 6)
+#define PINMUX_GPIO24__FUNC_MD32_0_GPIO2 (MTK_PIN_NO(24) | 7)
+
+#define PINMUX_GPIO25__FUNC_GPIO25 (MTK_PIN_NO(25) | 0)
+#define PINMUX_GPIO25__FUNC_CMMRST (MTK_PIN_NO(25) | 1)
+#define PINMUX_GPIO25__FUNC_CMMCLK3 (MTK_PIN_NO(25) | 2)
+#define PINMUX_GPIO25__FUNC_SPDIF_OUT (MTK_PIN_NO(25) | 3)
+#define PINMUX_GPIO25__FUNC_SDA6 (MTK_PIN_NO(25) | 4)
+#define PINMUX_GPIO25__FUNC_ADSP_JTAG0_TRSTN (MTK_PIN_NO(25) | 5)
+#define PINMUX_GPIO25__FUNC_MD32_0_JTAG_TRST (MTK_PIN_NO(25) | 6)
+
+#define PINMUX_GPIO26__FUNC_GPIO26 (MTK_PIN_NO(26) | 0)
+#define PINMUX_GPIO26__FUNC_CMMPDN (MTK_PIN_NO(26) | 1)
+#define PINMUX_GPIO26__FUNC_CMMCLK4 (MTK_PIN_NO(26) | 2)
+#define PINMUX_GPIO26__FUNC_IR_IN (MTK_PIN_NO(26) | 3)
+#define PINMUX_GPIO26__FUNC_SCL6 (MTK_PIN_NO(26) | 4)
+#define PINMUX_GPIO26__FUNC_ADSP_JTAG0_TDO (MTK_PIN_NO(26) | 5)
+#define PINMUX_GPIO26__FUNC_MD32_0_JTAG_TDO (MTK_PIN_NO(26) | 6)
+
+#define PINMUX_GPIO27__FUNC_GPIO27 (MTK_PIN_NO(27) | 0)
+#define PINMUX_GPIO27__FUNC_HDMIRX20_HTPLG (MTK_PIN_NO(27) | 1)
+#define PINMUX_GPIO27__FUNC_CMFLASH0 (MTK_PIN_NO(27) | 2)
+#define PINMUX_GPIO27__FUNC_MD32_0_TXD (MTK_PIN_NO(27) | 3)
+#define PINMUX_GPIO27__FUNC_TP_UTXD2_AO (MTK_PIN_NO(27) | 4)
+#define PINMUX_GPIO27__FUNC_SCL7 (MTK_PIN_NO(27) | 5)
+#define PINMUX_GPIO27__FUNC_UCTS2 (MTK_PIN_NO(27) | 6)
+#define PINMUX_GPIO27__FUNC_DBG_MON_A18 (MTK_PIN_NO(27) | 7)
+
+#define PINMUX_GPIO28__FUNC_GPIO28 (MTK_PIN_NO(28) | 0)
+#define PINMUX_GPIO28__FUNC_HDMIRX20_PWR5V (MTK_PIN_NO(28) | 1)
+#define PINMUX_GPIO28__FUNC_CMFLASH1 (MTK_PIN_NO(28) | 2)
+#define PINMUX_GPIO28__FUNC_MD32_0_RXD (MTK_PIN_NO(28) | 3)
+#define PINMUX_GPIO28__FUNC_TP_URXD2_AO (MTK_PIN_NO(28) | 4)
+#define PINMUX_GPIO28__FUNC_SDA7 (MTK_PIN_NO(28) | 5)
+#define PINMUX_GPIO28__FUNC_URTS2 (MTK_PIN_NO(28) | 6)
+#define PINMUX_GPIO28__FUNC_DBG_MON_A19 (MTK_PIN_NO(28) | 7)
+
+#define PINMUX_GPIO29__FUNC_GPIO29 (MTK_PIN_NO(29) | 0)
+#define PINMUX_GPIO29__FUNC_HDMIRX20_SCL (MTK_PIN_NO(29) | 1)
+#define PINMUX_GPIO29__FUNC_CMFLASH2 (MTK_PIN_NO(29) | 2)
+#define PINMUX_GPIO29__FUNC_SCL5 (MTK_PIN_NO(29) | 3)
+#define PINMUX_GPIO29__FUNC_TP_URTS2_AO (MTK_PIN_NO(29) | 4)
+#define PINMUX_GPIO29__FUNC_UTXD2 (MTK_PIN_NO(29) | 6)
+#define PINMUX_GPIO29__FUNC_DBG_MON_A20 (MTK_PIN_NO(29) | 7)
+
+#define PINMUX_GPIO30__FUNC_GPIO30 (MTK_PIN_NO(30) | 0)
+#define PINMUX_GPIO30__FUNC_HDMIRX20_SDA (MTK_PIN_NO(30) | 1)
+#define PINMUX_GPIO30__FUNC_CMFLASH3 (MTK_PIN_NO(30) | 2)
+#define PINMUX_GPIO30__FUNC_SDA5 (MTK_PIN_NO(30) | 3)
+#define PINMUX_GPIO30__FUNC_TP_UCTS2_AO (MTK_PIN_NO(30) | 4)
+#define PINMUX_GPIO30__FUNC_URXD2 (MTK_PIN_NO(30) | 6)
+#define PINMUX_GPIO30__FUNC_DBG_MON_A21 (MTK_PIN_NO(30) | 7)
+
+#define PINMUX_GPIO31__FUNC_GPIO31 (MTK_PIN_NO(31) | 0)
+#define PINMUX_GPIO31__FUNC_HDMITX20_PWR5V (MTK_PIN_NO(31) | 1)
+#define PINMUX_GPIO31__FUNC_DMIC1_DAT_R (MTK_PIN_NO(31) | 2)
+#define PINMUX_GPIO31__FUNC_PERSTN (MTK_PIN_NO(31) | 3)
+#define PINMUX_GPIO31__FUNC_DBG_MON_A22 (MTK_PIN_NO(31) | 7)
+
+#define PINMUX_GPIO32__FUNC_GPIO32 (MTK_PIN_NO(32) | 0)
+#define PINMUX_GPIO32__FUNC_HDMITX20_HTPLG (MTK_PIN_NO(32) | 1)
+#define PINMUX_GPIO32__FUNC_CLKREQN (MTK_PIN_NO(32) | 3)
+#define PINMUX_GPIO32__FUNC_DBG_MON_A23 (MTK_PIN_NO(32) | 7)
+
+#define PINMUX_GPIO33__FUNC_GPIO33 (MTK_PIN_NO(33) | 0)
+#define PINMUX_GPIO33__FUNC_HDMITX20_CEC (MTK_PIN_NO(33) | 1)
+#define PINMUX_GPIO33__FUNC_CMVREF0 (MTK_PIN_NO(33) | 2)
+#define PINMUX_GPIO33__FUNC_WAKEN (MTK_PIN_NO(33) | 3)
+
+#define PINMUX_GPIO34__FUNC_GPIO34 (MTK_PIN_NO(34) | 0)
+#define PINMUX_GPIO34__FUNC_HDMITX20_SCL (MTK_PIN_NO(34) | 1)
+#define PINMUX_GPIO34__FUNC_CMVREF1 (MTK_PIN_NO(34) | 2)
+#define PINMUX_GPIO34__FUNC_SCL7 (MTK_PIN_NO(34) | 3)
+#define PINMUX_GPIO34__FUNC_SCL6 (MTK_PIN_NO(34) | 4)
+#define PINMUX_GPIO34__FUNC_DBG_MON_A24 (MTK_PIN_NO(34) | 7)
+
+#define PINMUX_GPIO35__FUNC_GPIO35 (MTK_PIN_NO(35) | 0)
+#define PINMUX_GPIO35__FUNC_HDMITX20_SDA (MTK_PIN_NO(35) | 1)
+#define PINMUX_GPIO35__FUNC_CMVREF2 (MTK_PIN_NO(35) | 2)
+#define PINMUX_GPIO35__FUNC_SDA7 (MTK_PIN_NO(35) | 3)
+#define PINMUX_GPIO35__FUNC_SDA6 (MTK_PIN_NO(35) | 4)
+#define PINMUX_GPIO35__FUNC_DBG_MON_A25 (MTK_PIN_NO(35) | 7)
+
+#define PINMUX_GPIO36__FUNC_GPIO36 (MTK_PIN_NO(36) | 0)
+#define PINMUX_GPIO36__FUNC_RTC32K_CK (MTK_PIN_NO(36) | 1)
+#define PINMUX_GPIO36__FUNC_DBG_MON_A27 (MTK_PIN_NO(36) | 7)
+
+#define PINMUX_GPIO37__FUNC_GPIO37 (MTK_PIN_NO(37) | 0)
+#define PINMUX_GPIO37__FUNC_WATCHDOG (MTK_PIN_NO(37) | 1)
+#define PINMUX_GPIO37__FUNC_DBG_MON_A28 (MTK_PIN_NO(37) | 7)
+
+#define PINMUX_GPIO38__FUNC_GPIO38 (MTK_PIN_NO(38) | 0)
+#define PINMUX_GPIO38__FUNC_SRCLKENA0 (MTK_PIN_NO(38) | 1)
+#define PINMUX_GPIO38__FUNC_DBG_MON_A29 (MTK_PIN_NO(38) | 7)
+
+#define PINMUX_GPIO39__FUNC_GPIO39 (MTK_PIN_NO(39) | 0)
+#define PINMUX_GPIO39__FUNC_SRCLKENA1 (MTK_PIN_NO(39) | 1)
+#define PINMUX_GPIO39__FUNC_DMIC2_DAT_R (MTK_PIN_NO(39) | 2)
+#define PINMUX_GPIO39__FUNC_DBG_MON_A30 (MTK_PIN_NO(39) | 7)
+
+#define PINMUX_GPIO40__FUNC_GPIO40 (MTK_PIN_NO(40) | 0)
+#define PINMUX_GPIO40__FUNC_PWRAP_SPI0_CSN (MTK_PIN_NO(40) | 1)
+#define PINMUX_GPIO40__FUNC_SPIM3_CSB (MTK_PIN_NO(40) | 3)
+#define PINMUX_GPIO40__FUNC_DBG_MON_A31 (MTK_PIN_NO(40) | 7)
+
+#define PINMUX_GPIO41__FUNC_GPIO41 (MTK_PIN_NO(41) | 0)
+#define PINMUX_GPIO41__FUNC_PWRAP_SPI0_CK (MTK_PIN_NO(41) | 1)
+#define PINMUX_GPIO41__FUNC_SPIM3_CLK (MTK_PIN_NO(41) | 3)
+#define PINMUX_GPIO41__FUNC_DBG_MON_A32 (MTK_PIN_NO(41) | 7)
+
+#define PINMUX_GPIO42__FUNC_GPIO42 (MTK_PIN_NO(42) | 0)
+#define PINMUX_GPIO42__FUNC_PWRAP_SPI0_MO (MTK_PIN_NO(42) | 1)
+#define PINMUX_GPIO42__FUNC_PWRAP_SPI0_MI (MTK_PIN_NO(42) | 2)
+#define PINMUX_GPIO42__FUNC_SPIM3_MO (MTK_PIN_NO(42) | 3)
+#define PINMUX_GPIO42__FUNC_DBG_MON_B0 (MTK_PIN_NO(42) | 7)
+
+#define PINMUX_GPIO43__FUNC_GPIO43 (MTK_PIN_NO(43) | 0)
+#define PINMUX_GPIO43__FUNC_PWRAP_SPI0_MI (MTK_PIN_NO(43) | 1)
+#define PINMUX_GPIO43__FUNC_PWRAP_SPI0_MO (MTK_PIN_NO(43) | 2)
+#define PINMUX_GPIO43__FUNC_SPIM3_MI (MTK_PIN_NO(43) | 3)
+#define PINMUX_GPIO43__FUNC_DBG_MON_B1 (MTK_PIN_NO(43) | 7)
+
+#define PINMUX_GPIO44__FUNC_GPIO44 (MTK_PIN_NO(44) | 0)
+#define PINMUX_GPIO44__FUNC_SPMI_M_SCL (MTK_PIN_NO(44) | 1)
+#define PINMUX_GPIO44__FUNC_I2SI00_DATA1 (MTK_PIN_NO(44) | 2)
+#define PINMUX_GPIO44__FUNC_SCL5 (MTK_PIN_NO(44) | 3)
+#define PINMUX_GPIO44__FUNC_UTXD5 (MTK_PIN_NO(44) | 4)
+#define PINMUX_GPIO44__FUNC_DBG_MON_B2 (MTK_PIN_NO(44) | 7)
+
+#define PINMUX_GPIO45__FUNC_GPIO45 (MTK_PIN_NO(45) | 0)
+#define PINMUX_GPIO45__FUNC_SPMI_M_SDA (MTK_PIN_NO(45) | 1)
+#define PINMUX_GPIO45__FUNC_I2SI00_DATA2 (MTK_PIN_NO(45) | 2)
+#define PINMUX_GPIO45__FUNC_SDA5 (MTK_PIN_NO(45) | 3)
+#define PINMUX_GPIO45__FUNC_URXD5 (MTK_PIN_NO(45) | 4)
+#define PINMUX_GPIO45__FUNC_DBG_MON_B3 (MTK_PIN_NO(45) | 7)
+
+#define PINMUX_GPIO46__FUNC_GPIO46 (MTK_PIN_NO(46) | 0)
+#define PINMUX_GPIO46__FUNC_I2SIN_MCK (MTK_PIN_NO(46) | 1)
+#define PINMUX_GPIO46__FUNC_I2SI00_DATA3 (MTK_PIN_NO(46) | 2)
+#define PINMUX_GPIO46__FUNC_SPLIN_MCK (MTK_PIN_NO(46) | 3)
+#define PINMUX_GPIO46__FUNC_DBG_MON_B4 (MTK_PIN_NO(46) | 7)
+
+#define PINMUX_GPIO47__FUNC_GPIO47 (MTK_PIN_NO(47) | 0)
+#define PINMUX_GPIO47__FUNC_I2SIN_BCK (MTK_PIN_NO(47) | 1)
+#define PINMUX_GPIO47__FUNC_I2SIN0_BCK (MTK_PIN_NO(47) | 2)
+#define PINMUX_GPIO47__FUNC_SPLIN_LRCK (MTK_PIN_NO(47) | 3)
+#define PINMUX_GPIO47__FUNC_DBG_MON_B5 (MTK_PIN_NO(47) | 7)
+
+#define PINMUX_GPIO48__FUNC_GPIO48 (MTK_PIN_NO(48) | 0)
+#define PINMUX_GPIO48__FUNC_I2SIN_WS (MTK_PIN_NO(48) | 1)
+#define PINMUX_GPIO48__FUNC_I2SIN0_LRCK (MTK_PIN_NO(48) | 2)
+#define PINMUX_GPIO48__FUNC_SPLIN_BCK (MTK_PIN_NO(48) | 3)
+#define PINMUX_GPIO48__FUNC_DBG_MON_B6 (MTK_PIN_NO(48) | 7)
+
+#define PINMUX_GPIO49__FUNC_GPIO49 (MTK_PIN_NO(49) | 0)
+#define PINMUX_GPIO49__FUNC_I2SIN_D0 (MTK_PIN_NO(49) | 1)
+#define PINMUX_GPIO49__FUNC_I2SI00_DATA0 (MTK_PIN_NO(49) | 2)
+#define PINMUX_GPIO49__FUNC_SPLIN_D0 (MTK_PIN_NO(49) | 3)
+#define PINMUX_GPIO49__FUNC_DBG_MON_B7 (MTK_PIN_NO(49) | 7)
+
+#define PINMUX_GPIO50__FUNC_GPIO50 (MTK_PIN_NO(50) | 0)
+#define PINMUX_GPIO50__FUNC_I2SO1_MCK (MTK_PIN_NO(50) | 1)
+#define PINMUX_GPIO50__FUNC_I2SI5_D0 (MTK_PIN_NO(50) | 2)
+#define PINMUX_GPIO50__FUNC_I2SO4_MCK (MTK_PIN_NO(50) | 4)
+#define PINMUX_GPIO50__FUNC_DBG_MON_B8 (MTK_PIN_NO(50) | 7)
+
+#define PINMUX_GPIO51__FUNC_GPIO51 (MTK_PIN_NO(51) | 0)
+#define PINMUX_GPIO51__FUNC_I2SO1_BCK (MTK_PIN_NO(51) | 1)
+#define PINMUX_GPIO51__FUNC_I2SI5_BCK (MTK_PIN_NO(51) | 2)
+#define PINMUX_GPIO51__FUNC_DBG_MON_B9 (MTK_PIN_NO(51) | 7)
+
+#define PINMUX_GPIO52__FUNC_GPIO52 (MTK_PIN_NO(52) | 0)
+#define PINMUX_GPIO52__FUNC_I2SO1_WS (MTK_PIN_NO(52) | 1)
+#define PINMUX_GPIO52__FUNC_I2SI5_WS (MTK_PIN_NO(52) | 2)
+#define PINMUX_GPIO52__FUNC_DBG_MON_B10 (MTK_PIN_NO(52) | 7)
+
+#define PINMUX_GPIO53__FUNC_GPIO53 (MTK_PIN_NO(53) | 0)
+#define PINMUX_GPIO53__FUNC_I2SO1_D0 (MTK_PIN_NO(53) | 1)
+#define PINMUX_GPIO53__FUNC_I2SI5_MCK (MTK_PIN_NO(53) | 2)
+#define PINMUX_GPIO53__FUNC_DBG_MON_B11 (MTK_PIN_NO(53) | 7)
+
+#define PINMUX_GPIO54__FUNC_GPIO54 (MTK_PIN_NO(54) | 0)
+#define PINMUX_GPIO54__FUNC_I2SO1_D1 (MTK_PIN_NO(54) | 1)
+#define PINMUX_GPIO54__FUNC_I2SI01_DATA1 (MTK_PIN_NO(54) | 2)
+#define PINMUX_GPIO54__FUNC_SPLIN_D1 (MTK_PIN_NO(54) | 3)
+#define PINMUX_GPIO54__FUNC_I2SO4_BCK (MTK_PIN_NO(54) | 4)
+#define PINMUX_GPIO54__FUNC_DBG_MON_B12 (MTK_PIN_NO(54) | 7)
+
+#define PINMUX_GPIO55__FUNC_GPIO55 (MTK_PIN_NO(55) | 0)
+#define PINMUX_GPIO55__FUNC_I2SO1_D2 (MTK_PIN_NO(55) | 1)
+#define PINMUX_GPIO55__FUNC_I2SI01_DATA2 (MTK_PIN_NO(55) | 2)
+#define PINMUX_GPIO55__FUNC_SPLIN_D2 (MTK_PIN_NO(55) | 3)
+#define PINMUX_GPIO55__FUNC_I2SO4_WS (MTK_PIN_NO(55) | 4)
+#define PINMUX_GPIO55__FUNC_DBG_MON_B13 (MTK_PIN_NO(55) | 7)
+
+#define PINMUX_GPIO56__FUNC_GPIO56 (MTK_PIN_NO(56) | 0)
+#define PINMUX_GPIO56__FUNC_I2SO1_D3 (MTK_PIN_NO(56) | 1)
+#define PINMUX_GPIO56__FUNC_I2SI01_DATA3 (MTK_PIN_NO(56) | 2)
+#define PINMUX_GPIO56__FUNC_SPLIN_D3 (MTK_PIN_NO(56) | 3)
+#define PINMUX_GPIO56__FUNC_I2SO4_D0 (MTK_PIN_NO(56) | 4)
+#define PINMUX_GPIO56__FUNC_DBG_MON_B14 (MTK_PIN_NO(56) | 7)
+
+#define PINMUX_GPIO57__FUNC_GPIO57 (MTK_PIN_NO(57) | 0)
+#define PINMUX_GPIO57__FUNC_I2SO2_MCK (MTK_PIN_NO(57) | 1)
+#define PINMUX_GPIO57__FUNC_I2SO1_D12 (MTK_PIN_NO(57) | 2)
+#define PINMUX_GPIO57__FUNC_LCM1_RST (MTK_PIN_NO(57) | 3)
+#define PINMUX_GPIO57__FUNC_DBG_MON_B15 (MTK_PIN_NO(57) | 7)
+
+#define PINMUX_GPIO58__FUNC_GPIO58 (MTK_PIN_NO(58) | 0)
+#define PINMUX_GPIO58__FUNC_I2SO2_BCK (MTK_PIN_NO(58) | 1)
+#define PINMUX_GPIO58__FUNC_I2SO1_D13 (MTK_PIN_NO(58) | 2)
+#define PINMUX_GPIO58__FUNC_I2SIN1_BCK (MTK_PIN_NO(58) | 3)
+#define PINMUX_GPIO58__FUNC_DBG_MON_B16 (MTK_PIN_NO(58) | 7)
+
+#define PINMUX_GPIO59__FUNC_GPIO59 (MTK_PIN_NO(59) | 0)
+#define PINMUX_GPIO59__FUNC_I2SO2_WS (MTK_PIN_NO(59) | 1)
+#define PINMUX_GPIO59__FUNC_I2SO1_D14 (MTK_PIN_NO(59) | 2)
+#define PINMUX_GPIO59__FUNC_I2SIN1_LRCK (MTK_PIN_NO(59) | 3)
+#define PINMUX_GPIO59__FUNC_DBG_MON_B17 (MTK_PIN_NO(59) | 7)
+
+#define PINMUX_GPIO60__FUNC_GPIO60 (MTK_PIN_NO(60) | 0)
+#define PINMUX_GPIO60__FUNC_I2SO2_D0 (MTK_PIN_NO(60) | 1)
+#define PINMUX_GPIO60__FUNC_I2SO1_D15 (MTK_PIN_NO(60) | 2)
+#define PINMUX_GPIO60__FUNC_I2SI01_DATA0 (MTK_PIN_NO(60) | 3)
+#define PINMUX_GPIO60__FUNC_DBG_MON_B18 (MTK_PIN_NO(60) | 7)
+
+#define PINMUX_GPIO61__FUNC_GPIO61 (MTK_PIN_NO(61) | 0)
+#define PINMUX_GPIO61__FUNC_DMIC1_CLK (MTK_PIN_NO(61) | 1)
+#define PINMUX_GPIO61__FUNC_I2SO2_BCK (MTK_PIN_NO(61) | 2)
+#define PINMUX_GPIO61__FUNC_SCP_SPI2_CK (MTK_PIN_NO(61) | 3)
+#define PINMUX_GPIO61__FUNC_DBG_MON_B19 (MTK_PIN_NO(61) | 7)
+
+#define PINMUX_GPIO62__FUNC_GPIO62 (MTK_PIN_NO(62) | 0)
+#define PINMUX_GPIO62__FUNC_DMIC1_DAT (MTK_PIN_NO(62) | 1)
+#define PINMUX_GPIO62__FUNC_I2SO2_WS (MTK_PIN_NO(62) | 2)
+#define PINMUX_GPIO62__FUNC_SCP_SPI2_MI (MTK_PIN_NO(62) | 3)
+#define PINMUX_GPIO62__FUNC_DBG_MON_B20 (MTK_PIN_NO(62) | 7)
+
+#define PINMUX_GPIO63__FUNC_GPIO63 (MTK_PIN_NO(63) | 0)
+#define PINMUX_GPIO63__FUNC_DMIC2_CLK (MTK_PIN_NO(63) | 1)
+#define PINMUX_GPIO63__FUNC_VBUSVALID (MTK_PIN_NO(63) | 2)
+#define PINMUX_GPIO63__FUNC_SCP_SPI2_MO (MTK_PIN_NO(63) | 3)
+#define PINMUX_GPIO63__FUNC_SCP_SCL2 (MTK_PIN_NO(63) | 4)
+#define PINMUX_GPIO63__FUNC_SCP_JTAG1_TDO (MTK_PIN_NO(63) | 5)
+#define PINMUX_GPIO63__FUNC_JTDO_SEL1 (MTK_PIN_NO(63) | 6)
+#define PINMUX_GPIO63__FUNC_DBG_MON_B21 (MTK_PIN_NO(63) | 7)
+
+#define PINMUX_GPIO64__FUNC_GPIO64 (MTK_PIN_NO(64) | 0)
+#define PINMUX_GPIO64__FUNC_DMIC2_DAT (MTK_PIN_NO(64) | 1)
+#define PINMUX_GPIO64__FUNC_VBUSVALID_1P (MTK_PIN_NO(64) | 2)
+#define PINMUX_GPIO64__FUNC_SCP_SPI2_CS (MTK_PIN_NO(64) | 3)
+#define PINMUX_GPIO64__FUNC_SCP_SDA2 (MTK_PIN_NO(64) | 4)
+#define PINMUX_GPIO64__FUNC_DBG_MON_B22 (MTK_PIN_NO(64) | 7)
+
+#define PINMUX_GPIO65__FUNC_GPIO65 (MTK_PIN_NO(65) | 0)
+#define PINMUX_GPIO65__FUNC_PCM_DO (MTK_PIN_NO(65) | 1)
+#define PINMUX_GPIO65__FUNC_AUXIF_ST0 (MTK_PIN_NO(65) | 2)
+#define PINMUX_GPIO65__FUNC_UCTS2 (MTK_PIN_NO(65) | 3)
+#define PINMUX_GPIO65__FUNC_SCP_JTAG1_TMS (MTK_PIN_NO(65) | 5)
+#define PINMUX_GPIO65__FUNC_JTMS_SEL1 (MTK_PIN_NO(65) | 6)
+#define PINMUX_GPIO65__FUNC_DBG_MON_B23 (MTK_PIN_NO(65) | 7)
+
+#define PINMUX_GPIO66__FUNC_GPIO66 (MTK_PIN_NO(66) | 0)
+#define PINMUX_GPIO66__FUNC_PCM_CLK (MTK_PIN_NO(66) | 1)
+#define PINMUX_GPIO66__FUNC_AUXIF_CLK0 (MTK_PIN_NO(66) | 2)
+#define PINMUX_GPIO66__FUNC_URTS2 (MTK_PIN_NO(66) | 3)
+#define PINMUX_GPIO66__FUNC_SCP_JTAG1_TCK (MTK_PIN_NO(66) | 5)
+#define PINMUX_GPIO66__FUNC_JTCK_SEL1 (MTK_PIN_NO(66) | 6)
+#define PINMUX_GPIO66__FUNC_DBG_MON_B24 (MTK_PIN_NO(66) | 7)
+
+#define PINMUX_GPIO67__FUNC_GPIO67 (MTK_PIN_NO(67) | 0)
+#define PINMUX_GPIO67__FUNC_PCM_DI (MTK_PIN_NO(67) | 1)
+#define PINMUX_GPIO67__FUNC_AUXIF_ST1 (MTK_PIN_NO(67) | 2)
+#define PINMUX_GPIO67__FUNC_UTXD2 (MTK_PIN_NO(67) | 3)
+#define PINMUX_GPIO67__FUNC_SCP_JTAG1_TRSTN (MTK_PIN_NO(67) | 5)
+#define PINMUX_GPIO67__FUNC_JTRSTn_SEL1 (MTK_PIN_NO(67) | 6)
+#define PINMUX_GPIO67__FUNC_DBG_MON_B25 (MTK_PIN_NO(67) | 7)
+
+#define PINMUX_GPIO68__FUNC_GPIO68 (MTK_PIN_NO(68) | 0)
+#define PINMUX_GPIO68__FUNC_PCM_SYNC (MTK_PIN_NO(68) | 1)
+#define PINMUX_GPIO68__FUNC_AUXIF_CLK1 (MTK_PIN_NO(68) | 2)
+#define PINMUX_GPIO68__FUNC_URXD2 (MTK_PIN_NO(68) | 3)
+#define PINMUX_GPIO68__FUNC_SCP_JTAG1_TDI (MTK_PIN_NO(68) | 5)
+#define PINMUX_GPIO68__FUNC_JTDI_SEL1 (MTK_PIN_NO(68) | 6)
+#define PINMUX_GPIO68__FUNC_DBG_MON_B26 (MTK_PIN_NO(68) | 7)
+
+#define PINMUX_GPIO69__FUNC_GPIO69 (MTK_PIN_NO(69) | 0)
+#define PINMUX_GPIO69__FUNC_AUD_CLK_MOSI (MTK_PIN_NO(69) | 1)
+#define PINMUX_GPIO69__FUNC_I2SIN2_BCK (MTK_PIN_NO(69) | 2)
+#define PINMUX_GPIO69__FUNC_PWM_0 (MTK_PIN_NO(69) | 3)
+#define PINMUX_GPIO69__FUNC_WAKEN (MTK_PIN_NO(69) | 4)
+#define PINMUX_GPIO69__FUNC_DBG_MON_B27 (MTK_PIN_NO(69) | 7)
+
+#define PINMUX_GPIO70__FUNC_GPIO70 (MTK_PIN_NO(70) | 0)
+#define PINMUX_GPIO70__FUNC_AUD_SYNC_MOSI (MTK_PIN_NO(70) | 1)
+#define PINMUX_GPIO70__FUNC_I2SIN2_LRCK (MTK_PIN_NO(70) | 2)
+#define PINMUX_GPIO70__FUNC_PWM_1 (MTK_PIN_NO(70) | 3)
+#define PINMUX_GPIO70__FUNC_PERSTN (MTK_PIN_NO(70) | 4)
+#define PINMUX_GPIO70__FUNC_DBG_MON_B28 (MTK_PIN_NO(70) | 7)
+
+#define PINMUX_GPIO71__FUNC_GPIO71 (MTK_PIN_NO(71) | 0)
+#define PINMUX_GPIO71__FUNC_AUD_DAT_MOSI0 (MTK_PIN_NO(71) | 1)
+#define PINMUX_GPIO71__FUNC_IDDIG_2P (MTK_PIN_NO(71) | 2)
+#define PINMUX_GPIO71__FUNC_PWM_2 (MTK_PIN_NO(71) | 3)
+#define PINMUX_GPIO71__FUNC_CLKREQN (MTK_PIN_NO(71) | 4)
+#define PINMUX_GPIO71__FUNC_DBG_MON_B29 (MTK_PIN_NO(71) | 7)
+
+#define PINMUX_GPIO72__FUNC_GPIO72 (MTK_PIN_NO(72) | 0)
+#define PINMUX_GPIO72__FUNC_AUD_DAT_MOSI1 (MTK_PIN_NO(72) | 1)
+#define PINMUX_GPIO72__FUNC_USB_DRVVBUS_2P (MTK_PIN_NO(72) | 2)
+#define PINMUX_GPIO72__FUNC_PWM_3 (MTK_PIN_NO(72) | 3)
+#define PINMUX_GPIO72__FUNC_PERSTN_1 (MTK_PIN_NO(72) | 4)
+#define PINMUX_GPIO72__FUNC_DBG_MON_B30 (MTK_PIN_NO(72) | 7)
+
+#define PINMUX_GPIO73__FUNC_GPIO73 (MTK_PIN_NO(73) | 0)
+#define PINMUX_GPIO73__FUNC_AUD_DAT_MISO0 (MTK_PIN_NO(73) | 1)
+#define PINMUX_GPIO73__FUNC_I2SI02_DATA0 (MTK_PIN_NO(73) | 2)
+#define PINMUX_GPIO73__FUNC_CLKREQN_1 (MTK_PIN_NO(73) | 4)
+#define PINMUX_GPIO73__FUNC_VOW_DAT_MISO (MTK_PIN_NO(73) | 5)
+#define PINMUX_GPIO73__FUNC_DBG_MON_B31 (MTK_PIN_NO(73) | 7)
+
+#define PINMUX_GPIO74__FUNC_GPIO74 (MTK_PIN_NO(74) | 0)
+#define PINMUX_GPIO74__FUNC_AUD_DAT_MISO1 (MTK_PIN_NO(74) | 1)
+#define PINMUX_GPIO74__FUNC_I2SI02_DATA1 (MTK_PIN_NO(74) | 2)
+#define PINMUX_GPIO74__FUNC_WAKEN_1 (MTK_PIN_NO(74) | 4)
+#define PINMUX_GPIO74__FUNC_VOW_CLK_MISO (MTK_PIN_NO(74) | 5)
+#define PINMUX_GPIO74__FUNC_DBG_MON_B32 (MTK_PIN_NO(74) | 7)
+
+#define PINMUX_GPIO75__FUNC_GPIO75 (MTK_PIN_NO(75) | 0)
+#define PINMUX_GPIO75__FUNC_AUD_DAT_MISO2 (MTK_PIN_NO(75) | 1)
+#define PINMUX_GPIO75__FUNC_I2SI02_DATA2 (MTK_PIN_NO(75) | 2)
+
+#define PINMUX_GPIO76__FUNC_GPIO76 (MTK_PIN_NO(76) | 0)
+#define PINMUX_GPIO76__FUNC_SCP_VREQ_VAO (MTK_PIN_NO(76) | 1)
+#define PINMUX_GPIO76__FUNC_I2SI02_DATA3 (MTK_PIN_NO(76) | 2)
+#define PINMUX_GPIO76__FUNC_DBG_MON_A26 (MTK_PIN_NO(76) | 7)
+
+#define PINMUX_GPIO77__FUNC_GPIO77 (MTK_PIN_NO(77) | 0)
+#define PINMUX_GPIO77__FUNC_DGI_D0 (MTK_PIN_NO(77) | 1)
+#define PINMUX_GPIO77__FUNC_DPI_D0 (MTK_PIN_NO(77) | 2)
+#define PINMUX_GPIO77__FUNC_I2SI4_MCK (MTK_PIN_NO(77) | 3)
+#define PINMUX_GPIO77__FUNC_SPIM4_CLK (MTK_PIN_NO(77) | 4)
+#define PINMUX_GPIO77__FUNC_GBE_TXD3 (MTK_PIN_NO(77) | 5)
+#define PINMUX_GPIO77__FUNC_SPM_JTAG_TCK (MTK_PIN_NO(77) | 6)
+
+#define PINMUX_GPIO78__FUNC_GPIO78 (MTK_PIN_NO(78) | 0)
+#define PINMUX_GPIO78__FUNC_DGI_D1 (MTK_PIN_NO(78) | 1)
+#define PINMUX_GPIO78__FUNC_DPI_D1 (MTK_PIN_NO(78) | 2)
+#define PINMUX_GPIO78__FUNC_I2SI4_BCK (MTK_PIN_NO(78) | 3)
+#define PINMUX_GPIO78__FUNC_SPIM4_MO (MTK_PIN_NO(78) | 4)
+#define PINMUX_GPIO78__FUNC_GBE_TXD2 (MTK_PIN_NO(78) | 5)
+#define PINMUX_GPIO78__FUNC_SPM_JTAG_TMS (MTK_PIN_NO(78) | 6)
+
+#define PINMUX_GPIO79__FUNC_GPIO79 (MTK_PIN_NO(79) | 0)
+#define PINMUX_GPIO79__FUNC_DGI_D2 (MTK_PIN_NO(79) | 1)
+#define PINMUX_GPIO79__FUNC_DPI_D2 (MTK_PIN_NO(79) | 2)
+#define PINMUX_GPIO79__FUNC_I2SI4_WS (MTK_PIN_NO(79) | 3)
+#define PINMUX_GPIO79__FUNC_SPIM4_CSB (MTK_PIN_NO(79) | 4)
+#define PINMUX_GPIO79__FUNC_GBE_TXD1 (MTK_PIN_NO(79) | 5)
+#define PINMUX_GPIO79__FUNC_SPM_JTAG_TDI (MTK_PIN_NO(79) | 6)
+
+#define PINMUX_GPIO80__FUNC_GPIO80 (MTK_PIN_NO(80) | 0)
+#define PINMUX_GPIO80__FUNC_DGI_D3 (MTK_PIN_NO(80) | 1)
+#define PINMUX_GPIO80__FUNC_DPI_D3 (MTK_PIN_NO(80) | 2)
+#define PINMUX_GPIO80__FUNC_I2SI4_D0 (MTK_PIN_NO(80) | 3)
+#define PINMUX_GPIO80__FUNC_SPIM4_MI (MTK_PIN_NO(80) | 4)
+#define PINMUX_GPIO80__FUNC_GBE_TXD0 (MTK_PIN_NO(80) | 5)
+#define PINMUX_GPIO80__FUNC_SPM_JTAG_TDO (MTK_PIN_NO(80) | 6)
+
+#define PINMUX_GPIO81__FUNC_GPIO81 (MTK_PIN_NO(81) | 0)
+#define PINMUX_GPIO81__FUNC_DGI_D4 (MTK_PIN_NO(81) | 1)
+#define PINMUX_GPIO81__FUNC_DPI_D4 (MTK_PIN_NO(81) | 2)
+#define PINMUX_GPIO81__FUNC_I2SI5_MCK (MTK_PIN_NO(81) | 3)
+#define PINMUX_GPIO81__FUNC_SPIM5_CLK (MTK_PIN_NO(81) | 4)
+#define PINMUX_GPIO81__FUNC_GBE_RXD3 (MTK_PIN_NO(81) | 5)
+#define PINMUX_GPIO81__FUNC_SPM_JTAG_TRSTN (MTK_PIN_NO(81) | 6)
+
+#define PINMUX_GPIO82__FUNC_GPIO82 (MTK_PIN_NO(82) | 0)
+#define PINMUX_GPIO82__FUNC_DGI_D5 (MTK_PIN_NO(82) | 1)
+#define PINMUX_GPIO82__FUNC_DPI_D5 (MTK_PIN_NO(82) | 2)
+#define PINMUX_GPIO82__FUNC_I2SI5_BCK (MTK_PIN_NO(82) | 3)
+#define PINMUX_GPIO82__FUNC_SPIM5_MO (MTK_PIN_NO(82) | 4)
+#define PINMUX_GPIO82__FUNC_GBE_RXD2 (MTK_PIN_NO(82) | 5)
+#define PINMUX_GPIO82__FUNC_MCUPM_JTAG_TDO (MTK_PIN_NO(82) | 6)
+
+#define PINMUX_GPIO83__FUNC_GPIO83 (MTK_PIN_NO(83) | 0)
+#define PINMUX_GPIO83__FUNC_DGI_D6 (MTK_PIN_NO(83) | 1)
+#define PINMUX_GPIO83__FUNC_DPI_D6 (MTK_PIN_NO(83) | 2)
+#define PINMUX_GPIO83__FUNC_I2SI5_WS (MTK_PIN_NO(83) | 3)
+#define PINMUX_GPIO83__FUNC_SPIM5_CSB (MTK_PIN_NO(83) | 4)
+#define PINMUX_GPIO83__FUNC_GBE_RXD1 (MTK_PIN_NO(83) | 5)
+#define PINMUX_GPIO83__FUNC_MCUPM_JTAG_TMS (MTK_PIN_NO(83) | 6)
+
+#define PINMUX_GPIO84__FUNC_GPIO84 (MTK_PIN_NO(84) | 0)
+#define PINMUX_GPIO84__FUNC_DGI_D7 (MTK_PIN_NO(84) | 1)
+#define PINMUX_GPIO84__FUNC_DPI_D7 (MTK_PIN_NO(84) | 2)
+#define PINMUX_GPIO84__FUNC_I2SI5_D0 (MTK_PIN_NO(84) | 3)
+#define PINMUX_GPIO84__FUNC_SPIM5_MI (MTK_PIN_NO(84) | 4)
+#define PINMUX_GPIO84__FUNC_GBE_RXD0 (MTK_PIN_NO(84) | 5)
+#define PINMUX_GPIO84__FUNC_MCUPM_JTAG_TCK (MTK_PIN_NO(84) | 6)
+
+#define PINMUX_GPIO85__FUNC_GPIO85 (MTK_PIN_NO(85) | 0)
+#define PINMUX_GPIO85__FUNC_DGI_D8 (MTK_PIN_NO(85) | 1)
+#define PINMUX_GPIO85__FUNC_DPI_D8 (MTK_PIN_NO(85) | 2)
+#define PINMUX_GPIO85__FUNC_I2SO4_MCK (MTK_PIN_NO(85) | 3)
+#define PINMUX_GPIO85__FUNC_SCP_SPI1_B_CK (MTK_PIN_NO(85) | 4)
+#define PINMUX_GPIO85__FUNC_GBE_TXC (MTK_PIN_NO(85) | 5)
+#define PINMUX_GPIO85__FUNC_MCUPM_JTAG_TDI (MTK_PIN_NO(85) | 6)
+
+#define PINMUX_GPIO86__FUNC_GPIO86 (MTK_PIN_NO(86) | 0)
+#define PINMUX_GPIO86__FUNC_DGI_D9 (MTK_PIN_NO(86) | 1)
+#define PINMUX_GPIO86__FUNC_DPI_D9 (MTK_PIN_NO(86) | 2)
+#define PINMUX_GPIO86__FUNC_I2SO4_BCK (MTK_PIN_NO(86) | 3)
+#define PINMUX_GPIO86__FUNC_SCP_SPI1_B_MI (MTK_PIN_NO(86) | 4)
+#define PINMUX_GPIO86__FUNC_GBE_RXC (MTK_PIN_NO(86) | 5)
+#define PINMUX_GPIO86__FUNC_MCUPM_JTAG_TRSTN (MTK_PIN_NO(86) | 6)
+
+#define PINMUX_GPIO87__FUNC_GPIO87 (MTK_PIN_NO(87) | 0)
+#define PINMUX_GPIO87__FUNC_DGI_D10 (MTK_PIN_NO(87) | 1)
+#define PINMUX_GPIO87__FUNC_DPI_D10 (MTK_PIN_NO(87) | 2)
+#define PINMUX_GPIO87__FUNC_I2SO4_WS (MTK_PIN_NO(87) | 3)
+#define PINMUX_GPIO87__FUNC_SCP_SPI1_B_CS (MTK_PIN_NO(87) | 4)
+#define PINMUX_GPIO87__FUNC_GBE_RXDV (MTK_PIN_NO(87) | 5)
+#define PINMUX_GPIO87__FUNC_SSPM_JTAG_TDO (MTK_PIN_NO(87) | 6)
+
+#define PINMUX_GPIO88__FUNC_GPIO88 (MTK_PIN_NO(88) | 0)
+#define PINMUX_GPIO88__FUNC_DGI_D11 (MTK_PIN_NO(88) | 1)
+#define PINMUX_GPIO88__FUNC_DPI_D11 (MTK_PIN_NO(88) | 2)
+#define PINMUX_GPIO88__FUNC_I2SO4_D0 (MTK_PIN_NO(88) | 3)
+#define PINMUX_GPIO88__FUNC_SCP_SPI1_B_MO (MTK_PIN_NO(88) | 4)
+#define PINMUX_GPIO88__FUNC_GBE_TXEN (MTK_PIN_NO(88) | 5)
+#define PINMUX_GPIO88__FUNC_SSPM_JTAG_TMS (MTK_PIN_NO(88) | 6)
+
+#define PINMUX_GPIO89__FUNC_GPIO89 (MTK_PIN_NO(89) | 0)
+#define PINMUX_GPIO89__FUNC_DGI_D12 (MTK_PIN_NO(89) | 1)
+#define PINMUX_GPIO89__FUNC_DPI_D12 (MTK_PIN_NO(89) | 2)
+#define PINMUX_GPIO89__FUNC_MSDC2_CMD_A (MTK_PIN_NO(89) | 3)
+#define PINMUX_GPIO89__FUNC_I2SO5_BCK (MTK_PIN_NO(89) | 4)
+#define PINMUX_GPIO89__FUNC_GBE_MDC (MTK_PIN_NO(89) | 5)
+#define PINMUX_GPIO89__FUNC_SSPM_JTAG_TCK (MTK_PIN_NO(89) | 6)
+
+#define PINMUX_GPIO90__FUNC_GPIO90 (MTK_PIN_NO(90) | 0)
+#define PINMUX_GPIO90__FUNC_DGI_D13 (MTK_PIN_NO(90) | 1)
+#define PINMUX_GPIO90__FUNC_DPI_D13 (MTK_PIN_NO(90) | 2)
+#define PINMUX_GPIO90__FUNC_MSDC2_CLK_A (MTK_PIN_NO(90) | 3)
+#define PINMUX_GPIO90__FUNC_I2SO5_WS (MTK_PIN_NO(90) | 4)
+#define PINMUX_GPIO90__FUNC_GBE_MDIO (MTK_PIN_NO(90) | 5)
+#define PINMUX_GPIO90__FUNC_SSPM_JTAG_TDI (MTK_PIN_NO(90) | 6)
+
+#define PINMUX_GPIO91__FUNC_GPIO91 (MTK_PIN_NO(91) | 0)
+#define PINMUX_GPIO91__FUNC_DGI_D14 (MTK_PIN_NO(91) | 1)
+#define PINMUX_GPIO91__FUNC_DPI_D14 (MTK_PIN_NO(91) | 2)
+#define PINMUX_GPIO91__FUNC_MSDC2_DAT3_A (MTK_PIN_NO(91) | 3)
+#define PINMUX_GPIO91__FUNC_I2SO5_D0 (MTK_PIN_NO(91) | 4)
+#define PINMUX_GPIO91__FUNC_GBE_TXER (MTK_PIN_NO(91) | 5)
+#define PINMUX_GPIO91__FUNC_SSPM_JTAG_TRSTN (MTK_PIN_NO(91) | 6)
+
+#define PINMUX_GPIO92__FUNC_GPIO92 (MTK_PIN_NO(92) | 0)
+#define PINMUX_GPIO92__FUNC_DGI_D15 (MTK_PIN_NO(92) | 1)
+#define PINMUX_GPIO92__FUNC_DPI_D15 (MTK_PIN_NO(92) | 2)
+#define PINMUX_GPIO92__FUNC_MSDC2_DAT0_A (MTK_PIN_NO(92) | 3)
+#define PINMUX_GPIO92__FUNC_I2SO2_D1 (MTK_PIN_NO(92) | 4)
+#define PINMUX_GPIO92__FUNC_GBE_RXER (MTK_PIN_NO(92) | 5)
+#define PINMUX_GPIO92__FUNC_CCU0_JTAG_TDO (MTK_PIN_NO(92) | 6)
+
+#define PINMUX_GPIO93__FUNC_GPIO93 (MTK_PIN_NO(93) | 0)
+#define PINMUX_GPIO93__FUNC_DGI_HSYNC (MTK_PIN_NO(93) | 1)
+#define PINMUX_GPIO93__FUNC_DPI_HSYNC (MTK_PIN_NO(93) | 2)
+#define PINMUX_GPIO93__FUNC_MSDC2_DAT2_A (MTK_PIN_NO(93) | 3)
+#define PINMUX_GPIO93__FUNC_I2SO2_D2 (MTK_PIN_NO(93) | 4)
+#define PINMUX_GPIO93__FUNC_GBE_COL (MTK_PIN_NO(93) | 5)
+#define PINMUX_GPIO93__FUNC_CCU0_JTAG_TMS (MTK_PIN_NO(93) | 6)
+
+#define PINMUX_GPIO94__FUNC_GPIO94 (MTK_PIN_NO(94) | 0)
+#define PINMUX_GPIO94__FUNC_DGI_VSYNC (MTK_PIN_NO(94) | 1)
+#define PINMUX_GPIO94__FUNC_DPI_VSYNC (MTK_PIN_NO(94) | 2)
+#define PINMUX_GPIO94__FUNC_MSDC2_DAT1_A (MTK_PIN_NO(94) | 3)
+#define PINMUX_GPIO94__FUNC_I2SO2_D3 (MTK_PIN_NO(94) | 4)
+#define PINMUX_GPIO94__FUNC_GBE_INTR (MTK_PIN_NO(94) | 5)
+#define PINMUX_GPIO94__FUNC_CCU0_JTAG_TDI (MTK_PIN_NO(94) | 6)
+
+#define PINMUX_GPIO95__FUNC_GPIO95 (MTK_PIN_NO(95) | 0)
+#define PINMUX_GPIO95__FUNC_DGI_DE (MTK_PIN_NO(95) | 1)
+#define PINMUX_GPIO95__FUNC_DPI_DE (MTK_PIN_NO(95) | 2)
+#define PINMUX_GPIO95__FUNC_UTXD2 (MTK_PIN_NO(95) | 3)
+#define PINMUX_GPIO95__FUNC_I2SIN_D1 (MTK_PIN_NO(95) | 5)
+#define PINMUX_GPIO95__FUNC_CCU0_JTAG_TCK (MTK_PIN_NO(95) | 6)
+
+#define PINMUX_GPIO96__FUNC_GPIO96 (MTK_PIN_NO(96) | 0)
+#define PINMUX_GPIO96__FUNC_DGI_CK (MTK_PIN_NO(96) | 1)
+#define PINMUX_GPIO96__FUNC_DPI_CK (MTK_PIN_NO(96) | 2)
+#define PINMUX_GPIO96__FUNC_URXD2 (MTK_PIN_NO(96) | 3)
+#define PINMUX_GPIO96__FUNC_I2SO5_MCK (MTK_PIN_NO(96) | 4)
+#define PINMUX_GPIO96__FUNC_I2SIN_D2 (MTK_PIN_NO(96) | 5)
+#define PINMUX_GPIO96__FUNC_CCU0_JTAG_TRST (MTK_PIN_NO(96) | 6)
+
+#define PINMUX_GPIO97__FUNC_GPIO97 (MTK_PIN_NO(97) | 0)
+#define PINMUX_GPIO97__FUNC_DISP_PWM0 (MTK_PIN_NO(97) | 1)
+#define PINMUX_GPIO97__FUNC_DVFSRC_EXT_REQ (MTK_PIN_NO(97) | 2)
+
+#define PINMUX_GPIO98__FUNC_GPIO98 (MTK_PIN_NO(98) | 0)
+#define PINMUX_GPIO98__FUNC_UTXD0 (MTK_PIN_NO(98) | 1)
+
+#define PINMUX_GPIO99__FUNC_GPIO99 (MTK_PIN_NO(99) | 0)
+#define PINMUX_GPIO99__FUNC_URXD0 (MTK_PIN_NO(99) | 1)
+
+#define PINMUX_GPIO100__FUNC_GPIO100 (MTK_PIN_NO(100) | 0)
+#define PINMUX_GPIO100__FUNC_URTS1 (MTK_PIN_NO(100) | 1)
+#define PINMUX_GPIO100__FUNC_DSI_TE (MTK_PIN_NO(100) | 2)
+#define PINMUX_GPIO100__FUNC_I2SO1_D8 (MTK_PIN_NO(100) | 3)
+#define PINMUX_GPIO100__FUNC_KPROW2 (MTK_PIN_NO(100) | 4)
+#define PINMUX_GPIO100__FUNC_PWM_0 (MTK_PIN_NO(100) | 5)
+#define PINMUX_GPIO100__FUNC_TP_URTS1_AO (MTK_PIN_NO(100) | 6)
+#define PINMUX_GPIO100__FUNC_I2SIN_D0 (MTK_PIN_NO(100) | 7)
+
+#define PINMUX_GPIO101__FUNC_GPIO101 (MTK_PIN_NO(101) | 0)
+#define PINMUX_GPIO101__FUNC_UCTS1 (MTK_PIN_NO(101) | 1)
+#define PINMUX_GPIO101__FUNC_DSI1_TE (MTK_PIN_NO(101) | 2)
+#define PINMUX_GPIO101__FUNC_I2SO1_D9 (MTK_PIN_NO(101) | 3)
+#define PINMUX_GPIO101__FUNC_KPCOL2 (MTK_PIN_NO(101) | 4)
+#define PINMUX_GPIO101__FUNC_PWM_1 (MTK_PIN_NO(101) | 5)
+#define PINMUX_GPIO101__FUNC_TP_UCTS1_AO (MTK_PIN_NO(101) | 6)
+#define PINMUX_GPIO101__FUNC_I2SIN_D1 (MTK_PIN_NO(101) | 7)
+
+#define PINMUX_GPIO102__FUNC_GPIO102 (MTK_PIN_NO(102) | 0)
+#define PINMUX_GPIO102__FUNC_UTXD1 (MTK_PIN_NO(102) | 1)
+#define PINMUX_GPIO102__FUNC_VBUSVALID_2P (MTK_PIN_NO(102) | 2)
+#define PINMUX_GPIO102__FUNC_I2SO1_D10 (MTK_PIN_NO(102) | 3)
+#define PINMUX_GPIO102__FUNC_SSPM_UTXD_AO (MTK_PIN_NO(102) | 4)
+#define PINMUX_GPIO102__FUNC_TP_UTXD1_AO (MTK_PIN_NO(102) | 5)
+#define PINMUX_GPIO102__FUNC_MD32_1_TXD (MTK_PIN_NO(102) | 6)
+#define PINMUX_GPIO102__FUNC_I2SIN_D2 (MTK_PIN_NO(102) | 7)
+
+#define PINMUX_GPIO103__FUNC_GPIO103 (MTK_PIN_NO(103) | 0)
+#define PINMUX_GPIO103__FUNC_URXD1 (MTK_PIN_NO(103) | 1)
+#define PINMUX_GPIO103__FUNC_VBUSVALID_3P (MTK_PIN_NO(103) | 2)
+#define PINMUX_GPIO103__FUNC_I2SO1_D11 (MTK_PIN_NO(103) | 3)
+#define PINMUX_GPIO103__FUNC_SSPM_URXD_AO (MTK_PIN_NO(103) | 4)
+#define PINMUX_GPIO103__FUNC_TP_URXD1_AO (MTK_PIN_NO(103) | 5)
+#define PINMUX_GPIO103__FUNC_MD32_1_RXD (MTK_PIN_NO(103) | 6)
+#define PINMUX_GPIO103__FUNC_I2SIN_D3 (MTK_PIN_NO(103) | 7)
+
+#define PINMUX_GPIO104__FUNC_GPIO104 (MTK_PIN_NO(104) | 0)
+#define PINMUX_GPIO104__FUNC_KPROW0 (MTK_PIN_NO(104) | 1)
+#define PINMUX_GPIO104__FUNC_DISP_PWM1 (MTK_PIN_NO(104) | 2)
+
+#define PINMUX_GPIO105__FUNC_GPIO105 (MTK_PIN_NO(105) | 0)
+#define PINMUX_GPIO105__FUNC_KPROW1 (MTK_PIN_NO(105) | 1)
+#define PINMUX_GPIO105__FUNC_EDP_TX_HPD (MTK_PIN_NO(105) | 2)
+#define PINMUX_GPIO105__FUNC_PWM_2 (MTK_PIN_NO(105) | 3)
+
+#define PINMUX_GPIO106__FUNC_GPIO106 (MTK_PIN_NO(106) | 0)
+#define PINMUX_GPIO106__FUNC_KPCOL0 (MTK_PIN_NO(106) | 1)
+
+#define PINMUX_GPIO107__FUNC_GPIO107 (MTK_PIN_NO(107) | 0)
+#define PINMUX_GPIO107__FUNC_KPCOL1 (MTK_PIN_NO(107) | 1)
+#define PINMUX_GPIO107__FUNC_DSI1_TE (MTK_PIN_NO(107) | 2)
+#define PINMUX_GPIO107__FUNC_PWM_3 (MTK_PIN_NO(107) | 3)
+#define PINMUX_GPIO107__FUNC_SCP_SCL3 (MTK_PIN_NO(107) | 4)
+#define PINMUX_GPIO107__FUNC_I2SIN_MCK (MTK_PIN_NO(107) | 5)
+
+#define PINMUX_GPIO108__FUNC_GPIO108 (MTK_PIN_NO(108) | 0)
+#define PINMUX_GPIO108__FUNC_LCM_RST (MTK_PIN_NO(108) | 1)
+#define PINMUX_GPIO108__FUNC_KPCOL1 (MTK_PIN_NO(108) | 2)
+#define PINMUX_GPIO108__FUNC_SCP_SDA3 (MTK_PIN_NO(108) | 4)
+#define PINMUX_GPIO108__FUNC_I2SIN_BCK (MTK_PIN_NO(108) | 5)
+
+#define PINMUX_GPIO109__FUNC_GPIO109 (MTK_PIN_NO(109) | 0)
+#define PINMUX_GPIO109__FUNC_DSI_TE (MTK_PIN_NO(109) | 1)
+#define PINMUX_GPIO109__FUNC_I2SIN_D3 (MTK_PIN_NO(109) | 2)
+#define PINMUX_GPIO109__FUNC_I2SIN_WS (MTK_PIN_NO(109) | 5)
+
+#define PINMUX_GPIO110__FUNC_GPIO110 (MTK_PIN_NO(110) | 0)
+#define PINMUX_GPIO110__FUNC_MSDC1_CMD (MTK_PIN_NO(110) | 1)
+#define PINMUX_GPIO110__FUNC_JTMS_SEL3 (MTK_PIN_NO(110) | 2)
+#define PINMUX_GPIO110__FUNC_UDI_TMS (MTK_PIN_NO(110) | 3)
+#define PINMUX_GPIO110__FUNC_CCU1_JTAG_TMS (MTK_PIN_NO(110) | 5)
+#define PINMUX_GPIO110__FUNC_IPU_JTAG_TMS (MTK_PIN_NO(110) | 6)
+
+#define PINMUX_GPIO111__FUNC_GPIO111 (MTK_PIN_NO(111) | 0)
+#define PINMUX_GPIO111__FUNC_MSDC1_CLK (MTK_PIN_NO(111) | 1)
+#define PINMUX_GPIO111__FUNC_JTCK_SEL3 (MTK_PIN_NO(111) | 2)
+#define PINMUX_GPIO111__FUNC_UDI_TCK (MTK_PIN_NO(111) | 3)
+#define PINMUX_GPIO111__FUNC_CCU1_JTAG_TCK (MTK_PIN_NO(111) | 5)
+#define PINMUX_GPIO111__FUNC_IPU_JTAG_TCK (MTK_PIN_NO(111) | 6)
+
+#define PINMUX_GPIO112__FUNC_GPIO112 (MTK_PIN_NO(112) | 0)
+#define PINMUX_GPIO112__FUNC_MSDC1_DAT0 (MTK_PIN_NO(112) | 1)
+#define PINMUX_GPIO112__FUNC_JTDI_SEL3 (MTK_PIN_NO(112) | 2)
+#define PINMUX_GPIO112__FUNC_UDI_TDI (MTK_PIN_NO(112) | 3)
+#define PINMUX_GPIO112__FUNC_I2SO2_D0 (MTK_PIN_NO(112) | 4)
+#define PINMUX_GPIO112__FUNC_CCU1_JTAG_TDI (MTK_PIN_NO(112) | 5)
+#define PINMUX_GPIO112__FUNC_IPU_JTAG_TDI (MTK_PIN_NO(112) | 6)
+
+#define PINMUX_GPIO113__FUNC_GPIO113 (MTK_PIN_NO(113) | 0)
+#define PINMUX_GPIO113__FUNC_MSDC1_DAT1 (MTK_PIN_NO(113) | 1)
+#define PINMUX_GPIO113__FUNC_JTDO_SEL3 (MTK_PIN_NO(113) | 2)
+#define PINMUX_GPIO113__FUNC_UDI_TDO (MTK_PIN_NO(113) | 3)
+#define PINMUX_GPIO113__FUNC_I2SO2_D1 (MTK_PIN_NO(113) | 4)
+#define PINMUX_GPIO113__FUNC_CCU1_JTAG_TDO (MTK_PIN_NO(113) | 5)
+#define PINMUX_GPIO113__FUNC_IPU_JTAG_TDO (MTK_PIN_NO(113) | 6)
+
+#define PINMUX_GPIO114__FUNC_GPIO114 (MTK_PIN_NO(114) | 0)
+#define PINMUX_GPIO114__FUNC_MSDC1_DAT2 (MTK_PIN_NO(114) | 1)
+#define PINMUX_GPIO114__FUNC_JTRSTn_SEL3 (MTK_PIN_NO(114) | 2)
+#define PINMUX_GPIO114__FUNC_UDI_NTRST (MTK_PIN_NO(114) | 3)
+#define PINMUX_GPIO114__FUNC_I2SO2_D2 (MTK_PIN_NO(114) | 4)
+#define PINMUX_GPIO114__FUNC_CCU1_JTAG_TRST (MTK_PIN_NO(114) | 5)
+#define PINMUX_GPIO114__FUNC_IPU_JTAG_TRST (MTK_PIN_NO(114) | 6)
+
+#define PINMUX_GPIO115__FUNC_GPIO115 (MTK_PIN_NO(115) | 0)
+#define PINMUX_GPIO115__FUNC_MSDC1_DAT3 (MTK_PIN_NO(115) | 1)
+#define PINMUX_GPIO115__FUNC_I2SO2_D3 (MTK_PIN_NO(115) | 4)
+#define PINMUX_GPIO115__FUNC_MD32_1_GPIO2 (MTK_PIN_NO(115) | 6)
+
+#define PINMUX_GPIO116__FUNC_GPIO116 (MTK_PIN_NO(116) | 0)
+#define PINMUX_GPIO116__FUNC_MSDC0_DAT7 (MTK_PIN_NO(116) | 1)
+
+#define PINMUX_GPIO117__FUNC_GPIO117 (MTK_PIN_NO(117) | 0)
+#define PINMUX_GPIO117__FUNC_MSDC0_DAT6 (MTK_PIN_NO(117) | 1)
+
+#define PINMUX_GPIO118__FUNC_GPIO118 (MTK_PIN_NO(118) | 0)
+#define PINMUX_GPIO118__FUNC_MSDC0_DAT5 (MTK_PIN_NO(118) | 1)
+
+#define PINMUX_GPIO119__FUNC_GPIO119 (MTK_PIN_NO(119) | 0)
+#define PINMUX_GPIO119__FUNC_MSDC0_DAT4 (MTK_PIN_NO(119) | 1)
+
+#define PINMUX_GPIO120__FUNC_GPIO120 (MTK_PIN_NO(120) | 0)
+#define PINMUX_GPIO120__FUNC_MSDC0_RSTB (MTK_PIN_NO(120) | 1)
+
+#define PINMUX_GPIO121__FUNC_GPIO121 (MTK_PIN_NO(121) | 0)
+#define PINMUX_GPIO121__FUNC_MSDC0_CMD (MTK_PIN_NO(121) | 1)
+
+#define PINMUX_GPIO122__FUNC_GPIO122 (MTK_PIN_NO(122) | 0)
+#define PINMUX_GPIO122__FUNC_MSDC0_CLK (MTK_PIN_NO(122) | 1)
+
+#define PINMUX_GPIO123__FUNC_GPIO123 (MTK_PIN_NO(123) | 0)
+#define PINMUX_GPIO123__FUNC_MSDC0_DAT3 (MTK_PIN_NO(123) | 1)
+
+#define PINMUX_GPIO124__FUNC_GPIO124 (MTK_PIN_NO(124) | 0)
+#define PINMUX_GPIO124__FUNC_MSDC0_DAT2 (MTK_PIN_NO(124) | 1)
+
+#define PINMUX_GPIO125__FUNC_GPIO125 (MTK_PIN_NO(125) | 0)
+#define PINMUX_GPIO125__FUNC_MSDC0_DAT1 (MTK_PIN_NO(125) | 1)
+
+#define PINMUX_GPIO126__FUNC_GPIO126 (MTK_PIN_NO(126) | 0)
+#define PINMUX_GPIO126__FUNC_MSDC0_DAT0 (MTK_PIN_NO(126) | 1)
+
+#define PINMUX_GPIO127__FUNC_GPIO127 (MTK_PIN_NO(127) | 0)
+#define PINMUX_GPIO127__FUNC_MSDC0_DSL (MTK_PIN_NO(127) | 1)
+
+#define PINMUX_GPIO128__FUNC_GPIO128 (MTK_PIN_NO(128) | 0)
+#define PINMUX_GPIO128__FUNC_IDDIG (MTK_PIN_NO(128) | 1)
+#define PINMUX_GPIO128__FUNC_UCTS2 (MTK_PIN_NO(128) | 2)
+#define PINMUX_GPIO128__FUNC_UTXD5 (MTK_PIN_NO(128) | 3)
+#define PINMUX_GPIO128__FUNC_UFS_MPHY_SCL (MTK_PIN_NO(128) | 4)
+#define PINMUX_GPIO128__FUNC_mbistreaden_trigger (MTK_PIN_NO(128) | 5)
+#define PINMUX_GPIO128__FUNC_MD32_1_GPIO0 (MTK_PIN_NO(128) | 6)
+#define PINMUX_GPIO128__FUNC_SCP_SCL2 (MTK_PIN_NO(128) | 7)
+
+#define PINMUX_GPIO129__FUNC_GPIO129 (MTK_PIN_NO(129) | 0)
+#define PINMUX_GPIO129__FUNC_USB_DRVVBUS (MTK_PIN_NO(129) | 1)
+#define PINMUX_GPIO129__FUNC_URTS2 (MTK_PIN_NO(129) | 2)
+#define PINMUX_GPIO129__FUNC_URXD5 (MTK_PIN_NO(129) | 3)
+#define PINMUX_GPIO129__FUNC_UFS_MPHY_SDA (MTK_PIN_NO(129) | 4)
+#define PINMUX_GPIO129__FUNC_mbistwriteen_trigger (MTK_PIN_NO(129) | 5)
+#define PINMUX_GPIO129__FUNC_MD32_1_GPIO1 (MTK_PIN_NO(129) | 6)
+#define PINMUX_GPIO129__FUNC_SCP_SDA2 (MTK_PIN_NO(129) | 7)
+
+#define PINMUX_GPIO130__FUNC_GPIO130 (MTK_PIN_NO(130) | 0)
+#define PINMUX_GPIO130__FUNC_IDDIG_1P (MTK_PIN_NO(130) | 1)
+#define PINMUX_GPIO130__FUNC_SPINOR_IO2 (MTK_PIN_NO(130) | 2)
+#define PINMUX_GPIO130__FUNC_SNFI_WP (MTK_PIN_NO(130) | 3)
+#define PINMUX_GPIO130__FUNC_VPU_UDI_NTRST (MTK_PIN_NO(130) | 4)
+
+#define PINMUX_GPIO131__FUNC_GPIO131 (MTK_PIN_NO(131) | 0)
+#define PINMUX_GPIO131__FUNC_USB_DRVVBUS_1P (MTK_PIN_NO(131) | 1)
+#define PINMUX_GPIO131__FUNC_SPINOR_IO3 (MTK_PIN_NO(131) | 2)
+#define PINMUX_GPIO131__FUNC_SNFI_HOLD (MTK_PIN_NO(131) | 3)
+#define PINMUX_GPIO131__FUNC_MD32_1_JTAG_TRST (MTK_PIN_NO(131) | 4)
+#define PINMUX_GPIO131__FUNC_SCP_JTAG0_TRSTN (MTK_PIN_NO(131) | 5)
+#define PINMUX_GPIO131__FUNC_APU_JTAG_TRST (MTK_PIN_NO(131) | 6)
+
+#define PINMUX_GPIO132__FUNC_GPIO132 (MTK_PIN_NO(132) | 0)
+#define PINMUX_GPIO132__FUNC_SPIM0_CSB (MTK_PIN_NO(132) | 1)
+#define PINMUX_GPIO132__FUNC_SCP_SPI0_CS (MTK_PIN_NO(132) | 2)
+#define PINMUX_GPIO132__FUNC_SPIS0_CSB (MTK_PIN_NO(132) | 3)
+#define PINMUX_GPIO132__FUNC_VPU_UDI_TMS (MTK_PIN_NO(132) | 4)
+#define PINMUX_GPIO132__FUNC_I2SO5_D0 (MTK_PIN_NO(132) | 6)
+
+#define PINMUX_GPIO133__FUNC_GPIO133 (MTK_PIN_NO(133) | 0)
+#define PINMUX_GPIO133__FUNC_SPIM0_CLK (MTK_PIN_NO(133) | 1)
+#define PINMUX_GPIO133__FUNC_SCP_SPI0_CK (MTK_PIN_NO(133) | 2)
+#define PINMUX_GPIO133__FUNC_SPIS0_CLK (MTK_PIN_NO(133) | 3)
+#define PINMUX_GPIO133__FUNC_VPU_UDI_TCK (MTK_PIN_NO(133) | 4)
+#define PINMUX_GPIO133__FUNC_I2SO5_BCK (MTK_PIN_NO(133) | 6)
+
+#define PINMUX_GPIO134__FUNC_GPIO134 (MTK_PIN_NO(134) | 0)
+#define PINMUX_GPIO134__FUNC_SPIM0_MO (MTK_PIN_NO(134) | 1)
+#define PINMUX_GPIO134__FUNC_SCP_SPI0_MO (MTK_PIN_NO(134) | 2)
+#define PINMUX_GPIO134__FUNC_SPIS0_SI (MTK_PIN_NO(134) | 3)
+#define PINMUX_GPIO134__FUNC_VPU_UDI_TDO (MTK_PIN_NO(134) | 4)
+#define PINMUX_GPIO134__FUNC_I2SO5_WS (MTK_PIN_NO(134) | 6)
+
+#define PINMUX_GPIO135__FUNC_GPIO135 (MTK_PIN_NO(135) | 0)
+#define PINMUX_GPIO135__FUNC_SPIM0_MI (MTK_PIN_NO(135) | 1)
+#define PINMUX_GPIO135__FUNC_SCP_SPI0_MI (MTK_PIN_NO(135) | 2)
+#define PINMUX_GPIO135__FUNC_SPIS0_SO (MTK_PIN_NO(135) | 3)
+#define PINMUX_GPIO135__FUNC_VPU_UDI_TDI (MTK_PIN_NO(135) | 4)
+#define PINMUX_GPIO135__FUNC_I2SO5_MCK (MTK_PIN_NO(135) | 6)
+
+#define PINMUX_GPIO136__FUNC_GPIO136 (MTK_PIN_NO(136) | 0)
+#define PINMUX_GPIO136__FUNC_SPIM1_CSB (MTK_PIN_NO(136) | 1)
+#define PINMUX_GPIO136__FUNC_SCP_SPI1_A_CS (MTK_PIN_NO(136) | 2)
+#define PINMUX_GPIO136__FUNC_SPIS1_CSB (MTK_PIN_NO(136) | 3)
+#define PINMUX_GPIO136__FUNC_MD32_1_JTAG_TMS (MTK_PIN_NO(136) | 4)
+#define PINMUX_GPIO136__FUNC_SCP_JTAG0_TMS (MTK_PIN_NO(136) | 5)
+#define PINMUX_GPIO136__FUNC_APU_JTAG_TMS (MTK_PIN_NO(136) | 6)
+#define PINMUX_GPIO136__FUNC_DBG_MON_A15 (MTK_PIN_NO(136) | 7)
+
+#define PINMUX_GPIO137__FUNC_GPIO137 (MTK_PIN_NO(137) | 0)
+#define PINMUX_GPIO137__FUNC_SPIM1_CLK (MTK_PIN_NO(137) | 1)
+#define PINMUX_GPIO137__FUNC_SCP_SPI1_A_CK (MTK_PIN_NO(137) | 2)
+#define PINMUX_GPIO137__FUNC_SPIS1_CLK (MTK_PIN_NO(137) | 3)
+#define PINMUX_GPIO137__FUNC_MD32_1_JTAG_TCK (MTK_PIN_NO(137) | 4)
+#define PINMUX_GPIO137__FUNC_SCP_JTAG0_TCK (MTK_PIN_NO(137) | 5)
+#define PINMUX_GPIO137__FUNC_APU_JTAG_TCK (MTK_PIN_NO(137) | 6)
+#define PINMUX_GPIO137__FUNC_DBG_MON_A14 (MTK_PIN_NO(137) | 7)
+
+#define PINMUX_GPIO138__FUNC_GPIO138 (MTK_PIN_NO(138) | 0)
+#define PINMUX_GPIO138__FUNC_SPIM1_MO (MTK_PIN_NO(138) | 1)
+#define PINMUX_GPIO138__FUNC_SCP_SPI1_A_MO (MTK_PIN_NO(138) | 2)
+#define PINMUX_GPIO138__FUNC_SPIS1_SI (MTK_PIN_NO(138) | 3)
+#define PINMUX_GPIO138__FUNC_MD32_1_JTAG_TDO (MTK_PIN_NO(138) | 4)
+#define PINMUX_GPIO138__FUNC_SCP_JTAG0_TDO (MTK_PIN_NO(138) | 5)
+#define PINMUX_GPIO138__FUNC_APU_JTAG_TDO (MTK_PIN_NO(138) | 6)
+#define PINMUX_GPIO138__FUNC_DBG_MON_A16 (MTK_PIN_NO(138) | 7)
+
+#define PINMUX_GPIO139__FUNC_GPIO139 (MTK_PIN_NO(139) | 0)
+#define PINMUX_GPIO139__FUNC_SPIM1_MI (MTK_PIN_NO(139) | 1)
+#define PINMUX_GPIO139__FUNC_SCP_SPI1_A_MI (MTK_PIN_NO(139) | 2)
+#define PINMUX_GPIO139__FUNC_SPIS1_SO (MTK_PIN_NO(139) | 3)
+#define PINMUX_GPIO139__FUNC_MD32_1_JTAG_TDI (MTK_PIN_NO(139) | 4)
+#define PINMUX_GPIO139__FUNC_SCP_JTAG0_TDI (MTK_PIN_NO(139) | 5)
+#define PINMUX_GPIO139__FUNC_APU_JTAG_TDI (MTK_PIN_NO(139) | 6)
+#define PINMUX_GPIO139__FUNC_DBG_MON_A17 (MTK_PIN_NO(139) | 7)
+
+#define PINMUX_GPIO140__FUNC_GPIO140 (MTK_PIN_NO(140) | 0)
+#define PINMUX_GPIO140__FUNC_SPIM2_CSB (MTK_PIN_NO(140) | 1)
+#define PINMUX_GPIO140__FUNC_SPINOR_CS (MTK_PIN_NO(140) | 2)
+#define PINMUX_GPIO140__FUNC_SNFI_CS (MTK_PIN_NO(140) | 3)
+#define PINMUX_GPIO140__FUNC_DMIC3_DAT (MTK_PIN_NO(140) | 4)
+#define PINMUX_GPIO140__FUNC_DBG_MON_A11 (MTK_PIN_NO(140) | 7)
+
+#define PINMUX_GPIO141__FUNC_GPIO141 (MTK_PIN_NO(141) | 0)
+#define PINMUX_GPIO141__FUNC_SPIM2_CLK (MTK_PIN_NO(141) | 1)
+#define PINMUX_GPIO141__FUNC_SPINOR_CK (MTK_PIN_NO(141) | 2)
+#define PINMUX_GPIO141__FUNC_SNFI_CLK (MTK_PIN_NO(141) | 3)
+#define PINMUX_GPIO141__FUNC_DMIC3_CLK (MTK_PIN_NO(141) | 4)
+#define PINMUX_GPIO141__FUNC_DBG_MON_A10 (MTK_PIN_NO(141) | 7)
+
+#define PINMUX_GPIO142__FUNC_GPIO142 (MTK_PIN_NO(142) | 0)
+#define PINMUX_GPIO142__FUNC_SPIM2_MO (MTK_PIN_NO(142) | 1)
+#define PINMUX_GPIO142__FUNC_SPINOR_IO0 (MTK_PIN_NO(142) | 2)
+#define PINMUX_GPIO142__FUNC_SNFI_MOSI (MTK_PIN_NO(142) | 3)
+#define PINMUX_GPIO142__FUNC_DMIC4_DAT (MTK_PIN_NO(142) | 4)
+#define PINMUX_GPIO142__FUNC_DBG_MON_A12 (MTK_PIN_NO(142) | 7)
+
+#define PINMUX_GPIO143__FUNC_GPIO143 (MTK_PIN_NO(143) | 0)
+#define PINMUX_GPIO143__FUNC_SPIM2_MI (MTK_PIN_NO(143) | 1)
+#define PINMUX_GPIO143__FUNC_SPINOR_IO1 (MTK_PIN_NO(143) | 2)
+#define PINMUX_GPIO143__FUNC_SNFI_MISO (MTK_PIN_NO(143) | 3)
+#define PINMUX_GPIO143__FUNC_DMIC4_CLK (MTK_PIN_NO(143) | 4)
+#define PINMUX_GPIO143__FUNC_DBG_MON_A13 (MTK_PIN_NO(143) | 7)
+
+#endif /* __MT8195-PINFUNC_H */
-- 
2.18.0

