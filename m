Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC5675C181
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jul 2023 10:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjGUI1M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jul 2023 04:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjGUI1L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jul 2023 04:27:11 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0581A26A0;
        Fri, 21 Jul 2023 01:27:08 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B56C4807E;
        Fri, 21 Jul 2023 08:27:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v7 1/1] dt-bindings: pinctrl: Update pinctrl-single to use yaml
Date:   Fri, 21 Jul 2023 11:26:49 +0300
Message-ID: <20230721082654.27036-1-tony@atomide.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update binding for yaml and remove the old related txt bindings. Note that
we are also adding the undocumented pinctrl-single,slew-rate property. And
we only use the first example from the old binding.

As we are mostly using a generic compatible across various SoCs, let's not
start adding matches for random pin group node naming. Let's standardize on
pin group node name ending in -pins with an optional instance number
suffix.

As a pin group may have additional pins added to it later on, let's always
use -pins rather than -pin for the gropu name.

Most of the dts files have been updated already for the pin group node
names with a few changes still pending.

Cc: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Changes since v6:
- Avoid adding lots of matches and only accept nodes ending in -pins
  with an optional suffix for instance number

- Update title to drop driver related stuff as noted by Krzysztof

Changes since v5:
- Fix issues noted by Krzysztof

Changes since v4:
- Removed legacy matching for pin group node names, let's fix the dts
  files instead to use "pins" naming with dashes. This also fixed the
  new warnings introduced for "not of type 'object'" for anything named
  pin

Changes since v3:
- Fix issues noted by Rob for v2 version that I had missed

- Categorize patternProperties a bit to make fixing dts files easier

Changes since v2:

- Drop old ti,omap-pinctrl.txt in addition to old pinctrl-single.txt

- Replace reference to pinctrl-single.txt to point to the yaml in ctrl.txt

Changes since v1:

- The v1 version was a WIP patch posted as an example in thread
  "dt binding check error with hash and comma"

---
 .../devicetree/bindings/arm/omap/ctrl.txt     |   2 +-
 .../bindings/pinctrl/pinctrl-single.txt       | 262 ------------------
 .../bindings/pinctrl/pinctrl-single.yaml      | 206 ++++++++++++++
 .../bindings/pinctrl/ti,omap-pinctrl.txt      |  13 -
 4 files changed, 207 insertions(+), 276 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/ti,omap-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/arm/omap/ctrl.txt b/Documentation/devicetree/bindings/arm/omap/ctrl.txt
--- a/Documentation/devicetree/bindings/arm/omap/ctrl.txt
+++ b/Documentation/devicetree/bindings/arm/omap/ctrl.txt
@@ -8,7 +8,7 @@ control module driver itself.
 
 See [2] for documentation about clock/clockdomain nodes.
 
-[1] Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
+[1] Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
 [2] Documentation/devicetree/bindings/clock/ti/*
 
 Required properties:
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
@@ -0,0 +1,206 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Pin Controller with a Single Register for One or More Pins
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+description:
+  Some pin controller devices use a single register for one or more pins. The
+  range of pin control registers can vary from one to many for each controller
+  instance. Some SoCs from Altera, Broadcom, HiSilicon, Ralink, and TI have this
+  kind of pin controller instances.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - pinctrl-single
+          - pinconf-single
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
+    description:
+      Number of cells. Usually 2, consisting of register offset, pin configuration
+      value, and pinmux mode. Some controllers may use 1 for just offset and value.
+    enum: [ 1, 2 ]
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
+  pinctrl-single,register-width:
+    description: Width of pin specific bits in the register
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 8, 16, 32 ]
+
+  pinctrl-single,gpio-range:
+    description: Optional list of pin base, nr pins & gpio function
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle of a gpio-range node
+          - description: pin base
+          - description: number of pins
+          - description: gpio function
+
+  '#gpio-range-cells':
+    description: No longer needed, may exist in older files for gpio-ranges
+    deprecated: true
+    const: 3
+
+  gpio-range:
+    description: Optional node for gpio range cells
+    type: object
+    additionalProperties: false
+    properties:
+      '#pinctrl-single,gpio-range-cells':
+        description: Number of gpio range cells
+        const: 3
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+patternProperties:
+  '-pins(-[0-9]+)?$|-pin$':
+    description:
+      Pin group node name using naming ending in -pins followed by an optional
+      instance number
+    type: object
+    additionalProperties: false
+
+    properties:
+      pinctrl-single,pins:
+        description:
+          Array of pins as described in pinmux-node.yaml for pinctrl-pin-array
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      pinctrl-single,bits:
+        description: Register bit configuration for pinctrl-single,bit-per-mux
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        items:
+          - description: register offset
+          - description: value
+          - description: pin bitmask in the register
+
+      pinctrl-single,bias-pullup:
+        description: Optional bias pull up configuration
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        items:
+          - description: input
+          - description: enabled pull up bits
+          - description: disabled pull up bits
+          - description: bias pull up mask
+
+      pinctrl-single,bias-pulldown:
+        description: Optional bias pull down configuration
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        items:
+          - description: input
+          - description: enabled pull down bits
+          - description: disabled pull down bits
+          - description: bias pull down mask
+
+      pinctrl-single,drive-strength:
+        description: Optional drive strength configuration
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        items:
+          - description: drive strength current
+          - description: drive strength mask
+
+      pinctrl-single,input-schmitt:
+        description: Optional input schmitt configuration
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        items:
+          - description: input
+          - description: enable bits
+          - description: disable bits
+          - description: input schmitt mask
+
+      pinctrl-single,low-power-mode:
+        description: Optional low power mode configuration
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        items:
+          - description: low power mode value
+          - description: low power mode mask
+
+      pinctrl-single,slew-rate:
+        description: Optional slew rate configuration
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        items:
+          - description: slew rate
+          - description: slew rate mask
+
+allOf:
+  - $ref: pinctrl.yaml#
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
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      pinmux@4a100040 {
+        compatible = "pinctrl-single";
+        reg = <0x4a100040 0x0196>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #pinctrl-cells = <2>;
+        #interrupt-cells = <1>;
+        interrupt-controller;
+        pinctrl-single,register-width = <16>;
+        pinctrl-single,function-mask = <0xffff>;
+        pinctrl-single,gpio-range = <&range 0 3 0>;
+        range: gpio-range {
+          #pinctrl-single,gpio-range-cells = <3>;
+        };
+
+        uart2-pins {
+          pinctrl-single,pins =
+            <0xd8 0x118>,
+            <0xda 0>,
+            <0xdc 0x118>,
+            <0xde 0>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/ti,omap-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/ti,omap-pinctrl.txt
deleted file mode 100644
--- a/Documentation/devicetree/bindings/pinctrl/ti,omap-pinctrl.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-OMAP Pinctrl definitions
-
-Required properties:
-- compatible : Should be one of:
-  "ti,omap2420-padconf" - OMAP2420 compatible pinctrl
-  "ti,omap2430-padconf" - OMAP2430 compatible pinctrl
-  "ti,omap3-padconf" - OMAP3 compatible pinctrl
-  "ti,omap4-padconf" - OMAP4 compatible pinctrl
-  "ti,omap5-padconf" - OMAP5 compatible pinctrl
-  "ti,dra7-padconf" - DRA7 compatible pinctrl
-  "ti,am437-padconf" - AM437x compatible pinctrl
-
-See Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt for further details.
-- 
2.41.0
