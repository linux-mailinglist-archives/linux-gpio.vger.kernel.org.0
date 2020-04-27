Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF1B1BADCF
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2020 21:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgD0TXE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Apr 2020 15:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgD0TXD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Apr 2020 15:23:03 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7E5C03C1A7
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2020 12:23:03 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:d03f:8af3:4e83:6587])
        by albert.telenet-ops.be with bizsmtp
        id XvP02201E27aUyk06vP0YX; Mon, 27 Apr 2020 21:23:01 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jT9LI-0007ey-Od; Mon, 27 Apr 2020 21:23:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jT9LI-0007I6-Ll; Mon, 27 Apr 2020 21:23:00 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: gpio: rcar: Convert to json-schema
Date:   Mon, 27 Apr 2020 21:22:59 +0200
Message-Id: <20200427192259.27978-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the Renesas General-Purpose Input/Output Ports (GPIO) Device
Tree binding documentation to json-schema.

Drop the deprecated "renesas,gpio-rcar" compatible value.
Document missing properties.
Drop the first example, as it doesn't add much value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/gpio/renesas,gpio-rcar.txt       |  94 ------------
 .../bindings/gpio/renesas,rcar-gpio.yaml      | 143 ++++++++++++++++++
 2 files changed, 143 insertions(+), 94 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
deleted file mode 100644
index 10dce84b1545e074..0000000000000000
--- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ /dev/null
@@ -1,94 +0,0 @@
-* Renesas R-Car GPIO Controller
-
-Required Properties:
-
-  - compatible: should contain one or more of the following:
-    - "renesas,gpio-r8a7743": for R8A7743 (RZ/G1M) compatible GPIO controller.
-    - "renesas,gpio-r8a7744": for R8A7744 (RZ/G1N) compatible GPIO controller.
-    - "renesas,gpio-r8a7745": for R8A7745 (RZ/G1E) compatible GPIO controller.
-    - "renesas,gpio-r8a77470": for R8A77470 (RZ/G1C) compatible GPIO controller.
-    - "renesas,gpio-r8a774a1": for R8A774A1 (RZ/G2M) compatible GPIO controller.
-    - "renesas,gpio-r8a774b1": for R8A774B1 (RZ/G2N) compatible GPIO controller.
-    - "renesas,gpio-r8a774c0": for R8A774C0 (RZ/G2E) compatible GPIO controller.
-    - "renesas,gpio-r8a7778": for R8A7778 (R-Car M1) compatible GPIO controller.
-    - "renesas,gpio-r8a7779": for R8A7779 (R-Car H1) compatible GPIO controller.
-    - "renesas,gpio-r8a7790": for R8A7790 (R-Car H2) compatible GPIO controller.
-    - "renesas,gpio-r8a7791": for R8A7791 (R-Car M2-W) compatible GPIO controller.
-    - "renesas,gpio-r8a7792": for R8A7792 (R-Car V2H) compatible GPIO controller.
-    - "renesas,gpio-r8a7793": for R8A7793 (R-Car M2-N) compatible GPIO controller.
-    - "renesas,gpio-r8a7794": for R8A7794 (R-Car E2) compatible GPIO controller.
-    - "renesas,gpio-r8a7795": for R8A7795 (R-Car H3) compatible GPIO controller.
-    - "renesas,gpio-r8a7796": for R8A77960 (R-Car M3-W) compatible GPIO controller.
-    - "renesas,gpio-r8a77961": for R8A77961 (R-Car M3-W+) compatible GPIO controller.
-    - "renesas,gpio-r8a77965": for R8A77965 (R-Car M3-N) compatible GPIO controller.
-    - "renesas,gpio-r8a77970": for R8A77970 (R-Car V3M) compatible GPIO controller.
-    - "renesas,gpio-r8a77980": for R8A77980 (R-Car V3H) compatible GPIO controller.
-    - "renesas,gpio-r8a77990": for R8A77990 (R-Car E3) compatible GPIO controller.
-    - "renesas,gpio-r8a77995": for R8A77995 (R-Car D3) compatible GPIO controller.
-    - "renesas,rcar-gen1-gpio": for a generic R-Car Gen1 GPIO controller.
-    - "renesas,rcar-gen2-gpio": for a generic R-Car Gen2 or RZ/G1 GPIO controller.
-    - "renesas,rcar-gen3-gpio": for a generic R-Car Gen3 or RZ/G2 GPIO controller.
-    - "renesas,gpio-rcar": deprecated.
-
-    When compatible with the generic version nodes must list the
-    SoC-specific version corresponding to the platform first followed by
-    the generic version.
-
-  - reg: Base address and length of each memory resource used by the GPIO
-    controller hardware module.
-
-  - interrupts: Interrupt specifier for the controllers interrupt.
-
-  - gpio-controller: Marks the device node as a gpio controller.
-  - #gpio-cells: Should be 2. The first cell is the GPIO number and the second
-    cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>. Only the
-    GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
-  - gpio-ranges: See gpio.txt.
-
-Optional properties:
-
-  - clocks: Must contain a reference to the functional clock.  The property is
-    mandatory if the hardware implements a controllable functional clock for
-    the GPIO instance.
-
-  - gpio-reserved-ranges: See gpio.txt.
-
-Please refer to gpio.txt in this directory for the common GPIO bindings used by
-client devices.
-
-The GPIO controller also acts as an interrupt controller. It uses the default
-two cells specifier as described in Documentation/devicetree/bindings/
-interrupt-controller/interrupts.txt.
-
-Example: R8A77470 (RZ/G1C) GPIO controller nodes
-
-       gpio0: gpio@e6050000 {
-                compatible = "renesas,gpio-r8a77470",
-                             "renesas,rcar-gen2-gpio";
-                reg = <0 0xe6050000 0 0x50>;
-                interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
-                #gpio-cells = <2>;
-                gpio-controller;
-                gpio-ranges = <&pfc 0 0 23>;
-                #interrupt-cells = <2>;
-                interrupt-controller;
-                clocks = <&cpg CPG_MOD 912>;
-                power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
-                resets = <&cpg 912>;
-        };
-	...
-       gpio3: gpio@e6053000 {
-                compatible = "renesas,gpio-r8a77470",
-                             "renesas,rcar-gen2-gpio";
-                reg = <0 0xe6053000 0 0x50>;
-                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-                #gpio-cells = <2>;
-                gpio-controller;
-                gpio-ranges = <&pfc 0 96 30>;
-                gpio-reserved-ranges = <17 10>;
-                #interrupt-cells = <2>;
-                interrupt-controller;
-                clocks = <&cpg CPG_MOD 909>;
-                power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
-                resets = <&cpg 909>;
-        };
diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
new file mode 100644
index 0000000000000000..bcece7e6f7b46721
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/renesas,rcar-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car General-Purpose Input/Output Ports (GPIO)
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+         - enum:
+             - renesas,gpio-r8a7778      # R-Car M1
+             - renesas,gpio-r8a7779      # R-Car H1
+         - const: renesas,rcar-gen1-gpio # R-Car Gen1
+
+      - items:
+         - enum:
+             - renesas,gpio-r8a7743      # RZ/G1M
+             - renesas,gpio-r8a7744      # RZ/G1N
+             - renesas,gpio-r8a7745      # RZ/G1E
+             - renesas,gpio-r8a77470     # RZ/G1C
+             - renesas,gpio-r8a7790      # R-Car H2
+             - renesas,gpio-r8a7791      # R-Car M2-W
+             - renesas,gpio-r8a7792      # R-Car V2H
+             - renesas,gpio-r8a7793      # R-Car M2-N
+             - renesas,gpio-r8a7794      # R-Car E2
+         - const: renesas,rcar-gen2-gpio # R-Car Gen2 or RZ/G1
+
+      - items:
+         - enum:
+             - renesas,gpio-r8a774a1     # RZ/G2M
+             - renesas,gpio-r8a774b1     # RZ/G2N
+             - renesas,gpio-r8a774c0     # RZ/G2E
+             - renesas,gpio-r8a7795      # R-Car H3
+             - renesas,gpio-r8a7796      # R-Car M3-W
+             - renesas,gpio-r8a77961     # R-Car M3-W+
+             - renesas,gpio-r8a77965     # R-Car M3-N
+             - renesas,gpio-r8a77970     # R-Car V3M
+             - renesas,gpio-r8a77980     # R-Car V3H
+             - renesas,gpio-r8a77990     # R-Car E3
+             - renesas,gpio-r8a77995     # R-Car D3
+         - const: renesas,rcar-gen3-gpio # R-Car Gen3 or RZ/G2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
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
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 8
+
+patternProperties:
+  "^.*$":
+    if:
+      type: object
+    then:
+      properties:
+        gpio-hog: true
+        gpios: true
+        input: true
+        output-high: true
+        output-low: true
+        line-name: true
+
+      required:
+        - gpio-hog
+        - gpios
+
+      additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+  - interrupt-controller
+  - '#interrupt-cells'
+
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          enum:
+            - renesas,rcar-gen1-gpio
+then:
+  required:
+    - clocks
+    - power-domains
+    - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a77470-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a77470-sysc.h>
+    gpio3: gpio@e6053000 {
+            compatible = "renesas,gpio-r8a77470", "renesas,rcar-gen2-gpio";
+            reg = <0xe6053000 0x50>;
+            interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 909>;
+            power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+            resets = <&cpg 909>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pfc 0 96 30>;
+            gpio-reserved-ranges = <17 10>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+     };
-- 
2.17.1

