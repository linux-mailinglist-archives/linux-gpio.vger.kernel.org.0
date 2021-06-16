Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 222C53A9BF0
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 15:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232942AbhFPN3a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 09:29:30 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:44216 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233051AbhFPN33 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Jun 2021 09:29:29 -0400
X-IronPort-AV: E=Sophos;i="5.83,278,1616425200"; 
   d="scan'208";a="84411406"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Jun 2021 22:27:22 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F31FA423A668;
        Wed, 16 Jun 2021 22:27:19 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add DT bindings for RZ/G2L pinctrl
Date:   Wed, 16 Jun 2021 14:26:39 +0100
Message-Id: <20210616132641.29087-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616132641.29087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210616132641.29087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding documentation and header file for Renesas
RZ/G2L pinctrl.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 121 ++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-rzg2l.h   |  16 +++
 2 files changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-rzg2l.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
new file mode 100644
index 000000000000..e8ab5a0a46b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -0,0 +1,121 @@
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
+      RZG2L_GPIO() helper macro in <dt-bindings/pinctrl/pinctrl-rzg2l.h> and the
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
+        function: true
+        groups: true
+        pins: true
+        bias-disable: true
+        bias-pull-down: true
+        bias-pull-up: true
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
+      additionalProperties: false
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
+    #include <dt-bindings/pinctrl/pinctrl-rzg2l.h>
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+
+    pinctrl: pinctrl@11030000 {
+            compatible = "renesas,r9a07g044l-pinctrl";
+            reg = <0x11030000 0x10000>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl 0 0 392>;
+            clocks = <&cpg CPG_MOD R9A07G044_CLK_GPIO>;
+            resets = <&cpg R9A07G044_CLK_GPIO>;
+            power-domains = <&cpg>;
+
+            scif0_pins: scif0 {
+                    groups = "scif0_data";
+                    function = "scif0";
+            };
+
+            sd1-pwr-en-hog {
+                    gpio-hog;
+                    gpios = <RZG2L_GPIO(39, 2) 0>;
+                    output-high;
+                    line-name = "sd1_pwr_en";
+            };
+    };
diff --git a/include/dt-bindings/pinctrl/pinctrl-rzg2l.h b/include/dt-bindings/pinctrl/pinctrl-rzg2l.h
new file mode 100644
index 000000000000..d285d9e8c60a
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-rzg2l.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Renesas RZ/G2{L,LC} pinctrl bindings.
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_RZG2L_H
+#define __DT_BINDINGS_PINCTRL_RZG2L_H
+
+#define RZG2L_PINS_PER_PORT	8
+
+#define RZG2L_GPIO(port, pos)	((port) * RZG2L_PINS_PER_PORT + (pos))
+
+#endif /* __DT_BINDINGS_PINCTRL_RZG2L_H */
-- 
2.17.1

