Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 313A4666C6D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jan 2023 09:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239209AbjALIc0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Jan 2023 03:32:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238848AbjALIcK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Jan 2023 03:32:10 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8214CFD16;
        Thu, 12 Jan 2023 00:32:08 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4370080A6;
        Thu, 12 Jan 2023 08:32:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: Update pinctrl-single to use yaml
Date:   Thu, 12 Jan 2023 10:31:50 +0200
Message-Id: <20230112083152.10277-1-tony@atomide.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update binding for yaml. Note that we are also adding the undocumented
pinctrl-single,slew-rate property. And we only use the first example from
the old binding.

Cc: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../bindings/pinctrl/pinctrl-single.txt       | 262 ------------------
 .../bindings/pinctrl/pinctrl-single.yaml      | 155 +++++++++++
 2 files changed, 155 insertions(+), 262 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
deleted file mode 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
+++ /dev/null
@@ -1,262 +0,0 @@
-One-register-per-pin type device tree based pinctrl driver
-
-Required properties:
-- compatible : "pinctrl-single" or "pinconf-single".
-  "pinctrl-single" means that pinconf isn't supported.
-  "pinconf-single" means that generic pinconf is supported.
-
-- reg : offset and length of the register set for the mux registers
-
-- #pinctrl-cells : number of cells in addition to the index, set to 1
-  or 2 for pinctrl-single,pins and set to 2 for pinctrl-single,bits
-
-- pinctrl-single,register-width : pinmux register access width in bits
-
-- pinctrl-single,function-mask : mask of allowed pinmux function bits
-  in the pinmux register
-
-Optional properties:
-- pinctrl-single,function-off : function off mode for disabled state if
-  available and same for all registers; if not specified, disabling of
-  pin functions is ignored
-
-- pinctrl-single,bit-per-mux : boolean to indicate that one register controls
-  more than one pin, for which "pinctrl-single,function-mask" property specifies
- position mask of pin.
-
-- pinctrl-single,drive-strength : array of value that are used to configure
-  drive strength in the pinmux register. They're value of drive strength
-  current and drive strength mask.
-
-		/* drive strength current, mask */
-		pinctrl-single,power-source = <0x30 0xf0>;
-
-- pinctrl-single,bias-pullup : array of value that are used to configure the
-  input bias pullup in the pinmux register.
-
-		/* input, enabled pullup bits, disabled pullup bits, mask */
-		pinctrl-single,bias-pullup = <0 1 0 1>;
-
-- pinctrl-single,bias-pulldown : array of value that are used to configure the
-  input bias pulldown in the pinmux register.
-
-		/* input, enabled pulldown bits, disabled pulldown bits, mask */
-		pinctrl-single,bias-pulldown = <2 2 0 2>;
-
-  * Two bits to control input bias pullup and pulldown: User should use
-    pinctrl-single,bias-pullup & pinctrl-single,bias-pulldown. One bit means
-    pullup, and the other one bit means pulldown.
-  * Three bits to control input bias enable, pullup and pulldown. User should
-    use pinctrl-single,bias-pullup & pinctrl-single,bias-pulldown. Input bias
-    enable bit should be included in pullup or pulldown bits.
-  * Although driver could set PIN_CONFIG_BIAS_DISABLE, there's no property as
-    pinctrl-single,bias-disable. Because pinctrl single driver could implement
-    it by calling pulldown, pullup disabled.
-
-- pinctrl-single,input-schmitt : array of value that are used to configure
-  input schmitt in the pinmux register. In some silicons, there're two input
-  schmitt value (rising-edge & falling-edge) in the pinmux register.
-
-		/* input schmitt value, mask */
-		pinctrl-single,input-schmitt = <0x30 0x70>;
-
-- pinctrl-single,input-schmitt-enable : array of value that are used to
-  configure input schmitt enable or disable in the pinmux register.
-
-		/* input, enable bits, disable bits, mask */
-		pinctrl-single,input-schmitt-enable = <0x30 0x40 0 0x70>;
-
-- pinctrl-single,low-power-mode : array of value that are used to configure
-  low power mode of this pin. For some silicons, the low power mode will
-  control the output of the pin when the pad including the pin enter low
-  power mode.
-		/* low power mode value, mask */
-		pinctrl-single,low-power-mode = <0x288 0x388>;
-
-- pinctrl-single,gpio-range : list of value that are used to configure a GPIO
-  range. They're value of subnode phandle, pin base in pinctrl device, pin
-  number in this range, GPIO function value of this GPIO range.
-  The number of parameters is depend on #pinctrl-single,gpio-range-cells
-  property.
-
-		/* pin base, nr pins & gpio function */
-		pinctrl-single,gpio-range = <&range 0 3 0>, <&range 3 9 1>;
-
-- interrupt-controller : standard interrupt controller binding if using
-  interrupts for wake-up events for example. In this case pinctrl-single
-  is set up as a chained interrupt controller and the wake-up interrupts
-  can be requested by the drivers using request_irq().
-
-- #interrupt-cells : standard interrupt binding if using interrupts
-
-This driver assumes that there is only one register for each pin (unless the
-pinctrl-single,bit-per-mux is set), and uses the common pinctrl bindings as
-specified in the pinctrl-bindings.txt document in this directory.
-
-The pin configuration nodes for pinctrl-single are specified as pinctrl
-register offset and values using pinctrl-single,pins. Only the bits specified
-in pinctrl-single,function-mask are updated.
-
-When #pinctrl-cells = 1, then setting a pin for a device could be done with:
-
-	pinctrl-single,pins = <0xdc 0x118>;
-
-Where 0xdc is the offset from the pinctrl register base address for the device
-pinctrl register, and 0x118 contains the desired value of the pinctrl register.
-
-When #pinctrl-cells = 2, then setting a pin for a device could be done with:
-
-	pinctrl-single,pins = <0xdc 0x30 0x07>;
-
-Where 0x30 is the pin configuration value and 0x07 is the pin mux mode value.
-These two values are OR'd together to produce the value stored at offset 0xdc.
-See the device example and static board pins example below for more information.
-
-In case when one register changes more than one pin's mux the
-pinctrl-single,bits need to be used which takes three parameters:
-
-	pinctrl-single,bits = <0xdc 0x18 0xff>;
-
-Where 0xdc is the offset from the pinctrl register base address for the
-device pinctrl register, 0x18 is the desired value, and 0xff is the sub mask to
-be used when applying this change to the register.
-
-
-Optional sub-node: In case some pins could be configured as GPIO in the pinmux
-register, those pins could be defined as a GPIO range. This sub-node is required
-by pinctrl-single,gpio-range property.
-
-Required properties in sub-node:
-- #pinctrl-single,gpio-range-cells : the number of parameters after phandle in
-  pinctrl-single,gpio-range property.
-
-	range: gpio-range {
-		#pinctrl-single,gpio-range-cells = <3>;
-	};
-
-
-Example:
-
-/* SoC common file */
-
-/* first controller instance for pins in core domain */
-pmx_core: pinmux@4a100040 {
-	compatible = "pinctrl-single";
-	reg = <0x4a100040 0x0196>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	#interrupt-cells = <1>;
-	interrupt-controller;
-	pinctrl-single,register-width = <16>;
-	pinctrl-single,function-mask = <0xffff>;
-};
-
-/* second controller instance for pins in wkup domain */
-pmx_wkup: pinmux@4a31e040 {
-	compatible = "pinctrl-single";
-	reg = <0x4a31e040 0x0038>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	#interrupt-cells = <1>;
-	interrupt-controller;
-	pinctrl-single,register-width = <16>;
-	pinctrl-single,function-mask = <0xffff>;
-};
-
-control_devconf0: pinmux@48002274 {
-	compatible = "pinctrl-single";
-	reg = <0x48002274 4>;	/* Single register */
-	#address-cells = <1>;
-	#size-cells = <0>;
-	pinctrl-single,bit-per-mux;
-	pinctrl-single,register-width = <32>;
-	pinctrl-single,function-mask = <0x5F>;
-};
-
-/* third controller instance for pins in gpio domain */
-pmx_gpio: pinmux@d401e000 {
-	compatible = "pinconf-single";
-	reg = <0xd401e000 0x0330>;
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-
-	pinctrl-single,register-width = <32>;
-	pinctrl-single,function-mask = <7>;
-
-	/* sparse GPIO range could be supported */
-	pinctrl-single,gpio-range = <&range 0 3 0>, <&range 3 9 1>,
-				    <&range 12 1 0>, <&range 13 29 1>,
-				    <&range 43 1 0>, <&range 44 49 1>,
-				    <&range 94 1 1>, <&range 96 2 1>;
-
-	range: gpio-range {
-		#pinctrl-single,gpio-range-cells = <3>;
-	};
-};
-
-
-/* board specific .dts file */
-
-&pmx_core {
-
-	/*
-	 * map all board specific static pins enabled by the pinctrl driver
-	 * itself during the boot (or just set them up in the bootloader)
-	 */
-	pinctrl-names = "default";
-	pinctrl-0 = <&board_pins>;
-
-	board_pins: pinmux_board_pins {
-		pinctrl-single,pins = <
-			0x6c 0xf
-			0x6e 0xf
-			0x70 0xf
-			0x72 0xf
-		>;
-	};
-
-	uart0_pins: pinmux_uart0_pins {
-		pinctrl-single,pins = <
-			0x208 0		/* UART0_RXD (IOCFG138) */
-			0x20c 0		/* UART0_TXD (IOCFG139) */
-		>;
-		pinctrl-single,bias-pulldown = <0 2 2>;
-		pinctrl-single,bias-pullup = <0 1 1>;
-	};
-
-	/* map uart2 pins */
-	uart2_pins: pinmux_uart2_pins {
-		pinctrl-single,pins = <
-			0xd8 0x118
-			0xda 0
-			0xdc 0x118
-			0xde 0
-		>;
-	};
-};
-
-&control_devconf0 {
-	mcbsp1_pins: pinmux_mcbsp1_pins {
-		pinctrl-single,bits = <
-			0x00 0x18 0x18 /* FSR/CLKR signal from FSX/CLKX pin */
-		>;
-	};
-
-	mcbsp2_clks_pins: pinmux_mcbsp2_clks_pins {
-		pinctrl-single,bits = <
-			0x00 0x40 0x40 /* McBSP2 CLKS from McBSP_CLKS pin */
-		>;
-	};
-
-};
-
-&uart1 {
-       pinctrl-names = "default";
-       pinctrl-0 = <&uart0_pins>;
-};
-
-&uart2 {
-       pinctrl-names = "default";
-       pinctrl-0 = <&uart2_pins>;
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
new file mode 100644
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -0,0 +1,155 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: One-register-per-pin type device tree based pinctrl driver
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+description: |
+  This binding describes pinctrl devices that use one hardware register to
+  configure each pin.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - pinctrl-single
+              - pinconf-single
+      - items:
+          - enum:
+              - ti,am437-padconf
+              - ti,dra7-padconf
+              - ti,omap2420-padconf
+              - ti,omap2430-padconf
+              - ti,omap3-padconf
+              - ti,omap4-padconf
+              - ti,omap5-padconf
+          - const: pinctrl-single
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#pinctrl-cells':
+    enum: [ 1, 2 ]
+
+  '#gpio-range-cells':
+    const: 3
+    description: No longer needed, may exist in older files for gpio-ranges
+    deprecated: true
+
+  pinctrl-single,bit-per-mux:
+    description: Optional flag to indicate register controls more than one pin
+    type: boolean
+
+  pinctrl-single,function-mask:
+    description: Mask of the allowed register bits
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pinctrl-single,function-off:
+    description: Optional function off mode for disabled state
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pinctrl-single,gpio-range:
+    description: Optional list of pin base, nr pins & gpio function
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  '#pinctrl-single,gpio-range-cells':
+    const: 3
+    description: Number of gpio range cells
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pinctrl-single,register-width:
+    description: Width of the pin register in bits
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+patternProperties:
+  '-pins((.*)?)$':
+    type: object
+    $ref: pinmux-node.yaml#
+
+    patternProperties:
+      pinctrl-single,pins:
+        description:
+          Array of pins as described in pinmux-node.yaml for pinctrl-pin-array
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      pinctrl-single,bias-pullup:
+        description: Optional array of input, enabled pullup bits, disabled pullup bits, mask
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      pinctrl-single,bias-pulldown:
+        description: Optional array of input, enabled pulldown bits, disabled pulldown bits, mask
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      pinctrl-single,drive-strength:
+        description: Optional array of drive strength current and mask
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      pinctrl-single,input-schmitt:
+        description: Optional array of input, enable bits, disable bits, mask
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      pinctrl-single,low-power-mode:
+        description: Optional array of low power mode value, mask
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      pinctrl-single,slew-rate:
+        description: Optional array of slew rate and mask values
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+    additionalProperties: false
+
+allOf:
+  - $ref: 'pinctrl.yaml#'
+
+required:
+  - compatible
+  - reg
+  - pinctrl-single,register-width
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/omap.h>
+
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+        pinmux@4a100040 {
+          compatible = "pinctrl-single";
+          reg = <0x4a100040 0x0196>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+          #pinctrl-cells = <2>;
+          #interrupt-cells = <1>;
+          interrupt-controller;
+          pinctrl-single,register-width = <16>;
+          pinctrl-single,function-mask = <0xffff>;
+
+          uart2-pins {
+            pinctrl-single,pins =
+              <0xd8 0x118>,
+              <0xda 0>,
+              <0xdc 0x118>,
+              <0xde 0>;
+          };
+        };
+      };
-- 
2.39.0
