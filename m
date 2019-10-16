Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC12D937B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 16:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392282AbfJPOQt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 10:16:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:52750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390615AbfJPOQt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Oct 2019 10:16:49 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E5DA21848;
        Wed, 16 Oct 2019 14:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571235408;
        bh=IBl8pE4uMMQ0lkhbEM9I8IuFc8JWZ1DPZ9gay44XCMc=;
        h=From:To:Cc:Subject:Date:From;
        b=PpRI1OvdT3K5A31hQzgmvmJDtbqGcbL+Twh5q38n0sbuugyBWcIvbiwpEd6tQ+vTD
         N0II1MsIdIBeFxeoEC/5mz82zvhsvghSa/fhKM9DPiJBPy7z0R8YfX45g3Afg/6Uls
         2k8Hho1tksjppjjDgOfpfdqZiOB50cToGZPVyZ+E=
From:   Maxime Ripard <mripard@kernel.org>
To:     linus.walleij@linaro.org
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: Convert Allwinner Pin Controller to a schema
Date:   Wed, 16 Oct 2019 16:16:44 +0200
Message-Id: <20191016141644.81210-1-mripard@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Allwinner SoCs have a pin controller supported in Linux, with a
matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 239 ++++++++++++++++++
 .../pinctrl/allwinner,sunxi-pinctrl.txt       | 164 ------------
 2 files changed, 239 insertions(+), 164 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
new file mode 100644
index 000000000000..11edbbc5c1d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -0,0 +1,239 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/allwinner,sun4i-a10-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 Pin Controller Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  "#gpio-cells":
+    const: 3
+    description:
+      GPIO consumers must use three arguments, first the number of the
+      bank, then the pin number inside that bank, and finally the GPIO
+      flags.
+
+  "#interrupt-cells":
+    const: 3
+    description:
+      Interrupts consumers must use three arguments, first the number
+      of the bank, then the pin number inside that bank, and finally
+      the interrupts flags.
+
+  compatible:
+    enum:
+      - allwinner,sun4i-a10-pinctrl
+      - allwinner,sun5i-a10s-pinctrl
+      - allwinner,sun5i-a13-pinctrl
+      - allwinner,sun6i-a31-pinctrl
+      - allwinner,sun6i-a31-r-pinctrl
+      - allwinner,sun6i-a31s-pinctrl
+      - allwinner,sun7i-a20-pinctrl
+      - allwinner,sun8i-a23-pinctrl
+      - allwinner,sun8i-a23-r-pinctrl
+      - allwinner,sun8i-a33-pinctrl
+      - allwinner,sun8i-a83t-pinctrl
+      - allwinner,sun8i-a83t-r-pinctrl
+      - allwinner,sun8i-h3-pinctrl
+      - allwinner,sun8i-h3-r-pinctrl
+      - allwinner,sun8i-r40-pinctrl
+      - allwinner,sun8i-v3-pinctrl
+      - allwinner,sun8i-v3s-pinctrl
+      - allwinner,sun9i-a80-pinctrl
+      - allwinner,sun9i-a80-r-pinctrl
+      - allwinner,sun50i-a64-pinctrl
+      - allwinner,sun50i-a64-r-pinctrl
+      - allwinner,sun50i-h5-pinctrl
+      - allwinner,sun50i-h6-pinctrl
+      - allwinner,sun50i-h6-r-pinctrl
+      - allwinner,suniv-f1c100s-pinctrl
+      - nextthing,gr8-pinctrl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 5
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: High Frequency Oscillator
+      - description: Low Frequency Oscillator
+
+  clock-names:
+    items:
+      - const: apb
+      - const: hosc
+      - const: losc
+
+  resets:
+    maxItems: 1
+
+  gpio-controller: true
+  interrupt-controller: true
+  gpio-line-names: true
+
+  input-debounce:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Debouncing periods in microseconds, one period per interrupt
+      bank found in the controller
+
+patternProperties:
+  # It's pretty scary, but the basic idea is that:
+  #   - One node name can start with either s- or r- for PRCM nodes,
+  #   - Then, the name itself can be any repetition of <string>- (to
+  #     accomodate with nodes like uart4-rts-cts-pins), where each
+  #     string can be either starting with 'p' but in a string longer
+  #     than 3, or something that doesn't start with 'p',
+  #   - Then, the bank name is optional and will be between pa and pg,
+  #     pl or pm. Some pins groups that have several options will have
+  #     the pin numbers then,
+  #   - Finally, the name will end with either -pin or pins.
+
+  "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
+    type: object
+
+    properties:
+      pins: true
+      function: true
+      bias-disable: true
+      bias-pull-up: true
+      bias-pull-down: true
+
+      drive-strength:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [ 10, 20, 30, 40 ]
+
+    required:
+      - pins
+      - function
+
+    additionalProperties: false
+
+  "^vcc-p[a-hlm]-supply$":
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Regulators used by the framebuffer. These should be named
+      according to the names in the device design.
+
+required:
+  - "#gpio-cells"
+  - "#interrupt-cells"
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - gpio-controller
+  - interrupt-controller
+
+allOf:
+  # FIXME: We should have the pin bank supplies here, but not a lot of
+  # boards are defining it at the moment so it would generate a lot of
+  # warnings.
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun9i-a80-pinctrl
+
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+          maxItems: 5
+
+    else:
+      if:
+        properties:
+          compatible:
+            enum:
+              - allwinner,sun6i-a31-pinctrl
+              - allwinner,sun6i-a31s-pinctrl
+              - allwinner,sun50i-h6-pinctrl
+
+      then:
+        properties:
+          interrupts:
+            minItems: 4
+            maxItems: 4
+
+      else:
+        if:
+          properties:
+            compatible:
+              enum:
+                - allwinner,sun8i-a23-pinctrl
+                - allwinner,sun8i-a83t-pinctrl
+                - allwinner,sun50i-a64-pinctrl
+                - allwinner,sun50i-h5-pinctrl
+                - allwinner,suniv-f1c100s-pinctrl
+
+        then:
+          properties:
+            interrupts:
+              minItems: 3
+              maxItems: 3
+
+        else:
+          if:
+            properties:
+              compatible:
+                enum:
+                  - allwinner,sun6i-a31-r-pinctrl
+                  - allwinner,sun8i-a33-pinctrl
+                  - allwinner,sun8i-h3-pinctrl
+                  - allwinner,sun8i-v3-pinctrl
+                  - allwinner,sun8i-v3s-pinctrl
+                  - allwinner,sun9i-a80-r-pinctrl
+                  - allwinner,sun50i-h6-r-pinctrl
+
+          then:
+            properties:
+              interrupts:
+                minItems: 2
+                maxItems: 2
+
+          else:
+            properties:
+              interrupts:
+                minItems: 1
+                maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun5i-ccu.h>
+
+    pio: pinctrl@1c20800 {
+        compatible = "allwinner,sun5i-a13-pinctrl";
+        reg = <0x01c20800 0x400>;
+        interrupts = <28>;
+        clocks = <&ccu CLK_APB0_PIO>, <&osc24M>, <&osc32k>;
+        clock-names = "apb", "hosc", "losc";
+        gpio-controller;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+        #gpio-cells = <3>;
+
+        uart1_pe_pins: uart1-pe-pins {
+            pins = "PE10", "PE11";
+            function = "uart1";
+        };
+
+        uart1_pg_pins: uart1-pg-pins {
+            pins = "PG3", "PG4";
+            function = "uart1";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
deleted file mode 100644
index 328585c6da58..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
+++ /dev/null
@@ -1,164 +0,0 @@
-* Allwinner A1X Pin Controller
-
-The pins controlled by sunXi pin controller are organized in banks,
-each bank has 32 pins.  Each pin has 7 multiplexing functions, with
-the first two functions being GPIO in and out. The configuration on
-the pins includes drive strength and pull-up.
-
-Required properties:
-- compatible: Should be one of the following (depending on your SoC):
-  "allwinner,sun4i-a10-pinctrl"
-  "allwinner,sun5i-a10s-pinctrl"
-  "allwinner,sun5i-a13-pinctrl"
-  "allwinner,sun6i-a31-pinctrl"
-  "allwinner,sun6i-a31s-pinctrl"
-  "allwinner,sun6i-a31-r-pinctrl"
-  "allwinner,sun7i-a20-pinctrl"
-  "allwinner,sun8i-a23-pinctrl"
-  "allwinner,sun8i-a23-r-pinctrl"
-  "allwinner,sun8i-a33-pinctrl"
-  "allwinner,sun9i-a80-pinctrl"
-  "allwinner,sun9i-a80-r-pinctrl"
-  "allwinner,sun8i-a83t-pinctrl"
-  "allwinner,sun8i-a83t-r-pinctrl"
-  "allwinner,sun8i-h3-pinctrl"
-  "allwinner,sun8i-h3-r-pinctrl"
-  "allwinner,sun8i-r40-pinctrl"
-  "allwinner,sun8i-v3-pinctrl"
-  "allwinner,sun8i-v3s-pinctrl"
-  "allwinner,sun50i-a64-pinctrl"
-  "allwinner,sun50i-a64-r-pinctrl"
-  "allwinner,sun50i-h5-pinctrl"
-  "allwinner,sun50i-h6-pinctrl"
-  "allwinner,sun50i-h6-r-pinctrl"
-  "allwinner,suniv-f1c100s-pinctrl"
-  "nextthing,gr8-pinctrl"
-
-- reg: Should contain the register physical address and length for the
-  pin controller.
-
-- clocks: phandle to the clocks feeding the pin controller:
-  - "apb": the gated APB parent clock
-  - "hosc": the high frequency oscillator in the system
-  - "losc": the low frequency oscillator in the system
-
-Note: For backward compatibility reasons, the hosc and losc clocks are only
-required if you need to use the optional input-debounce property. Any new
-device tree should set them.
-
-Each pin bank, depending on the SoC, can have an associated regulator:
-
-- vcc-pa-supply: for the A10, A20, A31, A31s, A80 and R40 SoCs
-- vcc-pb-supply: for the A31, A31s, A80 and V3s SoCs
-- vcc-pc-supply: for the A10, A20, A31, A31s, A64, A80, H5, R40 and V3s SoCs
-- vcc-pd-supply: for the A23, A31, A31s, A64, A80, A83t, H3, H5 and R40 SoCs
-- vcc-pe-supply: for the A10, A20, A31, A31s, A64, A80, R40 and V3s SoCs
-- vcc-pf-supply: for the A10, A20, A31, A31s, A80, R40 and V3s SoCs
-- vcc-pg-supply: for the A10, A20, A31, A31s, A64, A80, H3, H5, R40 and V3s SoCs
-- vcc-ph-supply: for the A31, A31s and A80 SoCs
-- vcc-pl-supply: for the r-pinctrl of the A64, A80 and A83t SoCs
-- vcc-pm-supply: for the r-pinctrl of the A31, A31s and A80 SoCs
-
-Optional properties:
-  - input-debounce: Array of debouncing periods in microseconds. One period per
-    irq bank found in the controller. 0 if no setup required.
-
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices.
-
-A pinctrl node should contain at least one subnodes representing the
-pinctrl groups available on the machine. Each subnode will list the
-pins it needs, and how they should be configured, with regard to muxer
-configuration, drive strength and pullups. If one of these options is
-not set, its actual value will be unspecified.
-
-Allwinner A1X Pin Controller supports the generic pin multiplexing and
-configuration bindings. For details on each properties, you can refer to
- ./pinctrl-bindings.txt.
-
-Required sub-node properties:
-  - pins
-  - function
-
-Optional sub-node properties:
-  - bias-disable
-  - bias-pull-up
-  - bias-pull-down
-  - drive-strength
-
-*** Deprecated pin configuration and multiplexing binding
-
-Required subnode-properties:
-
-- allwinner,pins: List of strings containing the pin name.
-- allwinner,function: Function to mux the pins listed above to.
-
-Optional subnode-properties:
-- allwinner,drive: Integer. Represents the current sent to the pin
-    0: 10 mA
-    1: 20 mA
-    2: 30 mA
-    3: 40 mA
-- allwinner,pull: Integer.
-    0: No resistor
-    1: Pull-up resistor
-    2: Pull-down resistor
-
-Examples:
-
-pio: pinctrl@1c20800 {
-	compatible = "allwinner,sun5i-a13-pinctrl";
-	reg = <0x01c20800 0x400>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	uart1_pins_a: uart1@0 {
-		allwinner,pins = "PE10", "PE11";
-		allwinner,function = "uart1";
-		allwinner,drive = <0>;
-		allwinner,pull = <0>;
-	};
-
-	uart1_pins_b: uart1@1 {
-		allwinner,pins = "PG3", "PG4";
-		allwinner,function = "uart1";
-		allwinner,drive = <0>;
-		allwinner,pull = <0>;
-	};
-};
-
-
-GPIO and interrupt controller
------------------------------
-
-This hardware also acts as a GPIO controller and an interrupt
-controller.
-
-Consumers that would want to refer to one or the other (or both)
-should provide through the usual *-gpios and interrupts properties a
-cell with 3 arguments, first the number of the bank, then the pin
-inside that bank, and finally the flags for the GPIO/interrupts.
-
-Example:
-
-xio: gpio@38 {
-	compatible = "nxp,pcf8574a";
-	reg = <0x38>;
-
-	gpio-controller;
-	#gpio-cells = <2>;
-
-	interrupt-parent = <&pio>;
-	interrupts = <6 0 IRQ_TYPE_EDGE_FALLING>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
-
-reg_usb1_vbus: usb1-vbus {
-	compatible = "regulator-fixed";
-	regulator-name = "usb1-vbus";
-	regulator-min-microvolt = <5000000>;
-	regulator-max-microvolt = <5000000>;
-	gpio = <&pio 7 6 GPIO_ACTIVE_HIGH>;
-};
-- 
2.23.0

