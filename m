Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1A434C677
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 10:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbhC2IIB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 04:08:01 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:60130 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232305AbhC2IGU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 04:06:20 -0400
X-UUID: b8a487797dee4062bda1e69037d8ccb6-20210329
X-UUID: b8a487797dee4062bda1e69037d8ccb6-20210329
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 360314009; Mon, 29 Mar 2021 16:06:17 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 16:06:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Mar 2021 16:06:15 +0800
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
Subject: [PATCH 2/6] dt-bindings: pinctrl: mt8195: add binding document
Date:   Mon, 29 Mar 2021 16:06:06 +0800
Message-ID: <20210329080611.9312-3-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210329080611.9312-1-zhiyong.tao@mediatek.com>
References: <20210329080611.9312-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The commit adds mt8195 compatible node in binding document.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 .../bindings/pinctrl/pinctrl-mt8195.yaml      | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
new file mode 100644
index 000000000000..7915b9568c29
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
+  '^pins':
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
+        state_0_node_a {
+          pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+        };
+        /* GPIO1 set as multifunction CLKM1 */
+        state_0_node_b {
+          pinmux = <PINMUX_GPIO1__FUNC_CLKM1>;
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
+          It can support some arguments, such as MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See
+          dt-bindings/pinctrl/mt65xx.h. It can only support 2/4/6/8/10/12/14/16mA in mt8195.
+        enum: [2, 4, 6, 8, 10, 12, 14, 16]
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
+                    pins {
+                      pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+                      output-low;
+                    };
+            };
-- 
2.18.0

