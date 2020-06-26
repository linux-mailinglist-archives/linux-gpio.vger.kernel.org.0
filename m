Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3137720B3AF
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2020 16:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgFZOgp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jun 2020 10:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgFZOgo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jun 2020 10:36:44 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45791C03E979
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2020 07:36:44 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:a816:a2b4:ac1d:77b4])
        by albert.telenet-ops.be with bizsmtp
        id vqcf2200k0dCmYp06qcfFh; Fri, 26 Jun 2020 16:36:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jopT6-0007rh-42; Fri, 26 Jun 2020 16:36:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jopT6-0004J3-1o; Fri, 26 Jun 2020 16:36:40 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: pinctrl: renesas,rza2-pinctrl: Convert to json-schema
Date:   Fri, 26 Jun 2020 16:36:38 +0200
Message-Id: <20200626143638.16512-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the Renesas RZ/A2 combined Pin and GPIO controller Device Tree
binding documentation to json-schema.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/pinctrl/renesas,rza2-pinctrl.txt |  87 ---------------
 .../pinctrl/renesas,rza2-pinctrl.yaml         | 100 ++++++++++++++++++
 2 files changed, 100 insertions(+), 87 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
deleted file mode 100644
index a63ccd476cdaf919..0000000000000000
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
+++ /dev/null
@@ -1,87 +0,0 @@
-Renesas RZ/A2 combined Pin and GPIO controller
-
-The Renesas SoCs of the RZ/A2 series feature a combined Pin and GPIO controller.
-Pin multiplexing and GPIO configuration is performed on a per-pin basis.
-Each port features up to 8 pins, each of them configurable for GPIO
-function (port mode) or in alternate function mode.
-Up to 8 different alternate function modes exist for each single pin.
-
-Pin controller node
--------------------
-
-Required properties:
-  - compatible: shall be:
-    - "renesas,r7s9210-pinctrl": for RZ/A2M
-  - reg
-    Address base and length of the memory area where the pin controller
-    hardware is mapped to.
-  - gpio-controller
-    This pin controller also controls pins as GPIO
-  - #gpio-cells
-    Must be 2
-  - gpio-ranges
-    Expresses the total number of GPIO ports/pins in this SoC
-
-Example: Pin controller node for RZ/A2M SoC (r7s9210)
-
-	pinctrl: pin-controller@fcffe000 {
-		compatible = "renesas,r7s9210-pinctrl";
-		reg = <0xfcffe000 0x1000>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-ranges = <&pinctrl 0 0 176>;
-	};
-
-Sub-nodes
----------
-
-The child nodes of the pin controller designate pins to be used for
-specific peripheral functions or as GPIO.
-
-- Pin multiplexing sub-nodes:
-  A pin multiplexing sub-node describes how to configure a set of
-  (or a single) pin in some desired alternate function mode.
-  The values for the pinmux properties are a combination of port name, pin
-  number and the desired function index. Use the RZA2_PINMUX macro located
-  in include/dt-bindings/pinctrl/r7s9210-pinctrl.h to easily define these.
-  For assigning GPIO pins, use the macro RZA2_PIN also in r7s9210-pinctrl.h
-  to express the desired port pin.
-
-  Required properties:
-    - pinmux:
-      integer array representing pin number and pin multiplexing configuration.
-      When a pin has to be configured in alternate function mode, use this
-      property to identify the pin by its global index, and provide its
-      alternate function configuration number along with it.
-      When multiple pins are required to be configured as part of the same
-      alternate function they shall be specified as members of the same
-      argument list of a single "pinmux" property.
-      Helper macros to ease assembling the pin index from its position
-      (port where it sits on and pin number) and alternate function identifier
-      are provided by the pin controller header file at:
-      <dt-bindings/pinctrl/r7s9210-pinctrl.h>
-      Integers values in "pinmux" argument list are assembled as:
-      ((PORT * 8 + PIN) | MUX_FUNC << 16)
-
-  Example: Board specific pins configuration
-
-	&pinctrl {
-		/* Serial Console */
-		scif4_pins: serial4 {
-			pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
-				 <RZA2_PINMUX(PORT9, 1, 4)>;	/* RxD4 */
-		};
-	};
-
-  Example: Assigning a GPIO:
-
-	leds {
-		status = "okay";
-		compatible = "gpio-leds";
-
-		led0 {
-			/* P6_0 */
-			gpios = <&pinctrl RZA2_PIN(PORT6, 0) GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
new file mode 100644
index 0000000000000000..b7911a994f3a9f12
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/renesas,rza2-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/A2 combined Pin and GPIO controller
+
+maintainers:
+  - Chris Brandt <chris.brandt@renesas.com>
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  The Renesas SoCs of the RZ/A2 series feature a combined Pin and GPIO
+  controller.
+  Pin multiplexing and GPIO configuration is performed on a per-pin basis.
+  Each port features up to 8 pins, each of them configurable for GPIO function
+  (port mode) or in alternate function mode.
+  Up to 8 different alternate function modes exist for each single pin.
+
+properties:
+  compatible:
+    const: "renesas,r7s9210-pinctrl" # RZ/A2M
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
+      RZA2_PIN() helper macro in r7s9210-pinctrl.h.
+      E.g. "RZA2_PIN(PORT6, 0)" for P6_0.
+
+  gpio-ranges:
+    maxItems: 1
+
+patternProperties:
+  "^.*$":
+    if:
+      type: object
+    then:
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+      description:
+        The child nodes of the pin controller designate pins to be used for
+        specific peripheral functions or as GPIO.
+
+        A pin multiplexing sub-node describes how to configure a set of
+        (or a single) pin in some desired alternate function mode.
+        The values for the pinmux properties are a combination of port name,
+        pin number and the desired function index. Use the RZA2_PINMUX macro
+        located in include/dt-bindings/pinctrl/r7s9210-pinctrl.h to easily
+        define these.
+        For assigning GPIO pins, use the macro RZA2_PIN also in
+        to express the desired port pin.
+
+      properties:
+        phandle: true
+
+        pinmux:
+          description:
+            Values are constructed from GPIO port number, pin number, and
+            alternate function configuration number using the RZA2_PINMUX()
+            helper macro in r7s9210-pinctrl.h.
+
+      required:
+        - pinmux
+
+      additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/r7s9210-pinctrl.h>
+    pinctrl: pin-controller@fcffe000 {
+            compatible = "renesas,r7s9210-pinctrl";
+            reg = <0xfcffe000 0x1000>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl 0 0 176>;
+
+            /* Serial Console */
+            scif4_pins: serial4 {
+                    pinmux = <RZA2_PINMUX(PORT9, 0, 4)>, /* TxD4 */
+                             <RZA2_PINMUX(PORT9, 1, 4)>; /* RxD4 */
+            };
+    };
-- 
2.17.1

