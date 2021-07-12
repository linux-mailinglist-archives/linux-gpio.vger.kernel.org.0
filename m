Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F5B3C63DF
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jul 2021 21:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbhGLTr2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jul 2021 15:47:28 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:53010 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236449AbhGLTr1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Jul 2021 15:47:27 -0400
X-IronPort-AV: E=Sophos;i="5.84,234,1620658800"; 
   d="scan'208";a="87419163"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jul 2021 04:44:36 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C3E9040E0116;
        Tue, 13 Jul 2021 04:44:33 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/5] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add DT bindings for RZ/G2L pinctrl
Date:   Mon, 12 Jul 2021 20:44:18 +0100
Message-Id: <20210712194422.12405-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712194422.12405-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210712194422.12405-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding documentation and header file for Renesas
RZ/G2L pinctrl.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 155 ++++++++++++++++++
 include/dt-bindings/pinctrl/rzg2l-pinctrl.h   |  23 +++
 2 files changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/rzg2l-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
new file mode 100644
index 000000000000..ef68dabcf4dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -0,0 +1,155 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L combined Pin and GPIO controller
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+description:
+  The Renesas SoCs of the RZ/G2L series feature a combined Pin and GPIO
+  controller.
+  Pin multiplexing and GPIO configuration is performed on a per-pin basis.
+  Each port features up to 8 pins, each of them configurable for GPIO function
+  (port mode) or in alternate function mode.
+  Up to 8 different alternate function modes exist for each single pin.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
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
+      RZG2L_GPIO() helper macro in <dt-bindings/pinctrl/rzg2l-pinctrl.h> and the
+      second cell represents consumer flag as mentioned in ../gpio/gpio.txt
+      E.g. "RZG2L_GPIO(39, 1)" for P39_1.
+
+  gpio-ranges:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: GPIO_RSTN signal
+      - description: GPIO_PORT_RESETN signal
+      - description: GPIO_SPARE_RESETN signal
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
+            alternate function configuration number using the RZG2L_PORT_PINMUX()
+            helper macro in <dt-bindings/pinctrl/rzg2l-pinctrl.h>.
+        pins: true
+        drive-strength:
+          enum: [ 2, 4, 8, 12 ]
+        power-source:
+          enum: [ 1800, 2500, 3300 ]
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
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+  - clocks
+  - power-domains
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+
+    pinctrl: pinctrl@11030000 {
+            compatible = "renesas,r9a07g044-pinctrl";
+            reg = <0x11030000 0x10000>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl 0 0 392>;
+            clocks = <&cpg CPG_MOD R9A07G044_GPIO_HCLK>;
+            resets = <&cpg R9A07G044_GPIO_RSTN>,
+                     <&cpg R9A07G044_GPIO_PORT_RESETN>,
+                     <&cpg R9A07G044_GPIO_SPARE_RESETN>;
+            power-domains = <&cpg>;
+
+            scif0_pins: serial0 {
+                    pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>, /* Tx */
+                             <RZG2L_PORT_PINMUX(38, 1, 1)>; /* Rx */
+            };
+
+            i2c1_pins: i2c1 {
+                    pins = "RIIC1_SDA", "RIIC1_SCL";
+                    input-enable;
+            };
+
+            sd1-pwr-en-hog {
+                    gpio-hog;
+                    gpios = <RZG2L_GPIO(39, 2) 0>;
+                    output-high;
+                    line-name = "sd1_pwr_en";
+            };
+
+            sdhi1_pins: sd1 {
+                    sd1_mux {
+                            pinmux = <RZG2L_PORT_PINMUX(19, 0, 1)>, /* CD */
+                                     <RZG2L_PORT_PINMUX(19, 1, 1)>; /* WP */
+                            power-source  = <3300>;
+                    };
+
+                    sd1_data {
+                            pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
+                            power-source  = <3300>;
+                    };
+
+                    sd1_ctrl {
+                            pins = "SD1_CLK", "SD1_CMD";
+                            power-source  = <3300>;
+                    };
+            };
+    };
diff --git a/include/dt-bindings/pinctrl/rzg2l-pinctrl.h b/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
new file mode 100644
index 000000000000..b48f8c7a5556
--- /dev/null
+++ b/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Renesas RZ/G2L family pinctrl bindings.
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __DT_BINDINGS_RZG2L_PINCTRL_H
+#define __DT_BINDINGS_RZG2L_PINCTRL_H
+
+#define RZG2L_PINS_PER_PORT	8
+
+/*
+ * Create the pin index from its bank and position numbers and store in
+ * the upper 16 bits the alternate function identifier
+ */
+#define RZG2L_PORT_PINMUX(b, p, f)	((b) * RZG2L_PINS_PER_PORT + (p) | ((f) << 16))
+
+/* Convert a port and pin label to its global pin index */
+ #define RZG2L_GPIO(port, pin)	((port) * RZG2L_PINS_PER_PORT + (pin))
+
+#endif /* __DT_BINDINGS_RZG2L_PINCTRL_H */
-- 
2.17.1

