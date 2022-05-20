Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 023E552EF71
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 17:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236319AbiETPlV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 11:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350998AbiETPlO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 11:41:14 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 149564A3D5;
        Fri, 20 May 2022 08:41:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,239,1647270000"; 
   d="scan'208";a="121664226"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 May 2022 00:41:12 +0900
Received: from localhost.localdomain (unknown [10.226.93.97])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CA43640121CF;
        Sat, 21 May 2022 00:41:09 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add DT bindings for RZ/V2M pinctrl
Date:   Fri, 20 May 2022 16:40:50 +0100
Message-Id: <20220520154051.29088-2-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220520154051.29088-1-phil.edworthy@renesas.com>
References: <20220520154051.29088-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding documentation and header file for Renesas
RZ/V2M pinctrl.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../pinctrl/renesas,rzv2m-pinctrl.yaml        | 174 ++++++++++++++++++
 include/dt-bindings/pinctrl/rzv2m-pinctrl.h   |  23 +++
 2 files changed, 197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/rzv2m-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
new file mode 100644
index 000000000000..305e836cf0a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/renesas,rzv2m-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2M combined Pin and GPIO controller
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Phil Edworthy <phil.edworthy@renesas.com>
+
+description:
+  The Renesas RZ/V2M SoC features a combined Pin and GPIO controller.
+  Pin multiplexing and GPIO configuration is performed on a per-pin basis.
+  Each port features up to 16 pins, each of them configurable for GPIO function
+  (port mode) or in alternate function mode.
+  Up to 8 different alternate function modes exist for each single pin.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: renesas,r9a09g011-pinctrl # RZ/V2M
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+    description:
+      The first cell contains the global GPIO port index, constructed using the
+      RZV2M_GPIO() helper macro in <dt-bindings/pinctrl/rzv2m-pinctrl.h> and the
+      second cell represents consumer flag as mentioned in ../gpio/gpio.txt
+      E.g. "RZV2M_GPIO(8, 1)" for P8_1.
+
+  gpio-ranges:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 39
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+additionalProperties:
+  anyOf:
+    - type: object
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+
+      description:
+        Pin controller client devices use pin configuration subnodes (children
+        and grandchildren) for desired pin configuration.
+        Client device subnodes use below standard properties.
+
+      properties:
+        phandle: true
+        pinmux:
+          description:
+            Values are constructed from GPIO port number, pin number, and
+            alternate function configuration number using the RZV2M_PORT_PINMUX()
+            helper macro in <dt-bindings/pinctrl/rzv2m-pinctrl.h>.
+        pins: true
+        bias-disable: true
+        bias-pull-down: true
+        bias-pull-up: true
+        drive-strength-microamp:
+          # Superset of supported values
+          enum: [ 1600, 1800, 2000, 3200, 3800, 4000, 6400, 7800, 8000,
+                  9000, 9600, 11000, 12000, 13000, 18000 ]
+
+        power-source:
+          description: I/O voltage in millivolt.
+          enum: [ 1800, 3300 ]
+        slew-rate: true
+        gpio-hog: true
+        gpios: true
+        input-enable: true
+        output-high: true
+        output-low: true
+        line-name: true
+
+    - type: object
+      properties:
+        phandle: true
+
+      additionalProperties:
+        $ref: "#/additionalProperties/anyOf/0"
+
+allOf:
+  - $ref: "pinctrl.yaml#"
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+  - interrupts
+  - clocks
+  - power-domains
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/rzv2m-pinctrl.h>
+    #include <dt-bindings/clock/r9a09g011-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl: pinctrl@b6250000 {
+            compatible = "renesas,r9a09g011-pinctrl";
+            reg = <0xb6250000 0x800>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl 0 0 352>;
+            interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD R9A09G011_PFC_PCLK>;
+            resets = <&cpg R9A09G011_PFC_PRESETN>;
+            power-domains = <&cpg>;
+
+            i2c2_pins: i2c2 {
+                    pinmux = <RZV2M_PORT_PINMUX(3, 8, 2)>, /* SDA */
+                             <RZV2M_PORT_PINMUX(3, 9, 2)>; /* SCL */
+            };
+    };
diff --git a/include/dt-bindings/pinctrl/rzv2m-pinctrl.h b/include/dt-bindings/pinctrl/rzv2m-pinctrl.h
new file mode 100644
index 000000000000..525532cd15da
--- /dev/null
+++ b/include/dt-bindings/pinctrl/rzv2m-pinctrl.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Renesas RZ/V2M pinctrl bindings.
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __DT_BINDINGS_RZV2M_PINCTRL_H
+#define __DT_BINDINGS_RZV2M_PINCTRL_H
+
+#define RZV2M_PINS_PER_PORT	16
+
+/*
+ * Create the pin index from its bank and position numbers and store in
+ * the upper 16 bits the alternate function identifier
+ */
+#define RZV2M_PORT_PINMUX(b, p, f)	((b) * RZV2M_PINS_PER_PORT + (p) | ((f) << 16))
+
+/* Convert a port and pin label to its global pin index */
+#define RZV2M_GPIO(port, pin)	((port) * RZV2M_PINS_PER_PORT + (pin))
+
+#endif /* __DT_BINDINGS_RZV2M_PINCTRL_H */
-- 
2.34.1

