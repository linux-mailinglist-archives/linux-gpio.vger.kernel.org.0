Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB51B24D3DF
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Aug 2020 13:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgHULZZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Aug 2020 07:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727770AbgHULVB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Aug 2020 07:21:01 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D64C061385
        for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2020 04:21:00 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id JBM0230044C55Sk06BM0lC; Fri, 21 Aug 2020 13:21:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k956S-0002rx-0a; Fri, 21 Aug 2020 13:21:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k956R-0001LW-VM; Fri, 21 Aug 2020 13:20:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: pinctrl: rzn1: Convert to json-schema
Date:   Fri, 21 Aug 2020 13:20:59 +0200
Message-Id: <20200821112059.5133-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the Renesas RZ/N1 Pin controller Device Tree binding
documentation to json-schema.

Use "pinctrl" generic node name.
Drop generic and consumer examples, as they do not belong here.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Note: "phandle: true" is needed because dt-schema does not add it
      automatically to subnodes.

To be queued in sh-pfc for v5.10.
---
 .../bindings/pinctrl/renesas,rzn1-pinctrl.txt | 153 ------------------
 .../pinctrl/renesas,rzn1-pinctrl.yaml         | 129 +++++++++++++++
 2 files changed, 129 insertions(+), 153 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.txt
deleted file mode 100644
index 25e53acd523e2bea..0000000000000000
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.txt
+++ /dev/null
@@ -1,153 +0,0 @@
-Renesas RZ/N1 SoC Pinctrl node description.
-
-Pin controller node
--------------------
-Required properties:
-- compatible: SoC-specific compatible string "renesas,<soc-specific>-pinctrl"
-  followed by "renesas,rzn1-pinctrl" as fallback. The SoC-specific compatible
-  strings must be one of:
-	"renesas,r9a06g032-pinctrl" for RZ/N1D
-	"renesas,r9a06g033-pinctrl" for RZ/N1S
-- reg: Address base and length of the memory area where the pin controller
-  hardware is mapped to.
-- clocks: phandle for the clock, see the description of clock-names below.
-- clock-names: Contains the name of the clock:
-    "bus", the bus clock, sometimes described as pclk, for register accesses.
-
-Example:
-	pinctrl: pin-controller@40067000 {
-	    compatible = "renesas,r9a06g032-pinctrl", "renesas,rzn1-pinctrl";
-	    reg = <0x40067000 0x1000>, <0x51000000 0x480>;
-	    clocks = <&sysctrl R9A06G032_HCLK_PINCONFIG>;
-	    clock-names = "bus";
-	};
-
-Sub-nodes
----------
-
-The child nodes of the pin controller node describe a pin multiplexing
-function.
-
-- Pin multiplexing sub-nodes:
-  A pin multiplexing sub-node describes how to configure a set of
-  (or a single) pin in some desired alternate function mode.
-  A single sub-node may define several pin configurations.
-  Please refer to pinctrl-bindings.txt to get to know more on generic
-  pin properties usage.
-
-  The allowed generic formats for a pin multiplexing sub-node are the
-  following ones:
-
-  node-1 {
-      pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
-      GENERIC_PINCONFIG;
-  };
-
-  node-2 {
-      sub-node-1 {
-          pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
-          GENERIC_PINCONFIG;
-      };
-
-      sub-node-2 {
-          pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
-          GENERIC_PINCONFIG;
-      };
-
-      ...
-
-      sub-node-n {
-          pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
-          GENERIC_PINCONFIG;
-      };
-  };
-
-  node-3 {
-      pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
-      GENERIC_PINCONFIG;
-
-      sub-node-1 {
-          pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
-          GENERIC_PINCONFIG;
-      };
-
-      ...
-
-      sub-node-n {
-          pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
-          GENERIC_PINCONFIG;
-      };
-  };
-
-  Use the latter two formats when pins part of the same logical group need to
-  have different generic pin configuration flags applied. Note that the generic
-  pinconfig in node-3 does not apply to the sub-nodes.
-
-  Client sub-nodes shall refer to pin multiplexing sub-nodes using the phandle
-  of the most external one.
-
-  Eg.
-
-  client-1 {
-      ...
-      pinctrl-0 = <&node-1>;
-      ...
-  };
-
-  client-2 {
-      ...
-      pinctrl-0 = <&node-2>;
-      ...
-  };
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
-      Integers values in the "pinmux" argument list are assembled as:
-      (PIN | MUX_FUNC << 8)
-      where PIN directly corresponds to the pl_gpio pin number and MUX_FUNC is
-      one of the alternate function identifiers defined in:
-      <include/dt-bindings/pinctrl/rzn1-pinctrl.h>
-      These identifiers collapse the IO Multiplex Configuration Level 1 and
-      Level 2 numbers that are detailed in the hardware reference manual into a
-      single number. The identifiers for Level 2 are simply offset by 10.
-      Additional identifiers are provided to specify the MDIO source peripheral.
-
-  Optional generic pinconf properties:
-    - bias-disable		- disable any pin bias
-    - bias-pull-up		- pull up the pin with 50 KOhm
-    - bias-pull-down		- pull down the pin with 50 KOhm
-    - bias-high-impedance	- high impedance mode
-    - drive-strength		- sink or source at most 4, 6, 8 or 12 mA
-
-  Example:
-  A serial communication interface with a TX output pin and an RX input pin.
-
-  &pinctrl {
-	pins_uart0: pins_uart0 {
-		pinmux = <
-			RZN1_PINMUX(103, RZN1_FUNC_UART0_I)	/* UART0_TXD */
-			RZN1_PINMUX(104, RZN1_FUNC_UART0_I)	/* UART0_RXD */
-		>;
-	};
-  };
-
-  Example 2:
-  Here we set the pull up on the RXD pin of the UART.
-
-  &pinctrl {
-	pins_uart0: pins_uart0 {
-		pinmux = <RZN1_PINMUX(103, RZN1_FUNC_UART0_I)>;	/* TXD */
-
-		pins_uart6_rx {
-			pinmux = <RZN1_PINMUX(104, RZN1_FUNC_UART0_I)>; /* RXD */
-			bias-pull-up;
-		};
-	};
-  };
diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.yaml
new file mode 100644
index 0000000000000000..4a43af0d6e02a68b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/renesas,rzn1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/N1 Pin Controller
+
+maintainers:
+  - Gareth Williams <gareth.williams.jx@renesas.com>
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a06g032-pinctrl # RZ/N1D
+          - renesas,r9a06g033-pinctrl # RZ/N1S
+      - const: renesas,rzn1-pinctrl   # Generic RZ/N1
+
+  reg:
+    items:
+      - description: GPIO Multiplexing Level1 Register Block
+      - description: GPIO Multiplexing Level2 Register Block
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: bus
+    description:
+      The bus clock, sometimes described as pclk, for register accesses.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties:
+  anyOf:
+    - type: object
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+
+      description:
+        A pin multiplexing sub-node describes how to configure a set of (or a
+        single) pin in some desired alternate function mode.
+        A single sub-node may define several pin configurations.
+
+      properties:
+        pinmux:
+          description: |
+            Integer array representing pin number and pin multiplexing
+            configuration.
+            When a pin has to be configured in alternate function mode, use
+            this property to identify the pin by its global index, and provide
+            its alternate function configuration number along with it.
+            When multiple pins are required to be configured as part of the
+            same alternate function they shall be specified as members of the
+            same argument list of a single "pinmux" property.
+            Integers values in the "pinmux" argument list are assembled as:
+            (PIN | MUX_FUNC << 8)
+            where PIN directly corresponds to the pl_gpio pin number and
+            MUX_FUNC is one of the alternate function identifiers defined in:
+            <include/dt-bindings/pinctrl/rzn1-pinctrl.h>
+            These identifiers collapse the IO Multiplex Configuration Level 1
+            and Level 2 numbers that are detailed in the hardware reference
+            manual into a single number. The identifiers for Level 2 are simply
+            offset by 10.  Additional identifiers are provided to specify the
+            MDIO source peripheral.
+
+        phandle: true
+        bias-disable: true
+        bias-pull-up:
+          description: Pull up the pin with 50 kOhm
+        bias-pull-down:
+          description: Pull down the pin with 50 kOhm
+        bias-high-impedance: true
+        drive-strength:
+          enum: [ 4, 6, 8, 12 ]
+
+      required:
+        - pinmux
+
+      additionalProperties:
+        $ref: "#/additionalProperties/anyOf/0"
+
+    - type: object
+      properties:
+        phandle: true
+
+      additionalProperties:
+        $ref: "#/additionalProperties/anyOf/0"
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
+    #include <dt-bindings/pinctrl/rzn1-pinctrl.h>
+    pinctrl: pinctrl@40067000 {
+            compatible = "renesas,r9a06g032-pinctrl", "renesas,rzn1-pinctrl";
+            reg = <0x40067000 0x1000>, <0x51000000 0x480>;
+            clocks = <&sysctrl R9A06G032_HCLK_PINCONFIG>;
+            clock-names = "bus";
+
+            /*
+             * A serial communication interface with a TX output pin and an RX
+             * input pin.
+             */
+            pins_uart0: pins_uart0 {
+                    pinmux = <
+                            RZN1_PINMUX(103, RZN1_FUNC_UART0_I) /* UART0_TXD */
+                            RZN1_PINMUX(104, RZN1_FUNC_UART0_I) /* UART0_RXD */
+                    >;
+            };
+
+            /*
+             * Set the pull-up on the RXD pin of the UART.
+             */
+            pins_uart0_alt: pins_uart0_alt {
+                    pinmux = <RZN1_PINMUX(103, RZN1_FUNC_UART0_I)>;
+
+                    pins_uart6_rx {
+                            pinmux = <RZN1_PINMUX(104, RZN1_FUNC_UART0_I)>;
+                            bias-pull-up;
+                    };
+            };
+    };
-- 
2.17.1

