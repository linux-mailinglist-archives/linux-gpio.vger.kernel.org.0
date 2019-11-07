Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0084AF3BA5
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 23:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbfKGWm6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 17:42:58 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33924 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfKGWm6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 17:42:58 -0500
Received: by mail-oi1-f193.google.com with SMTP id l202so3557293oig.1;
        Thu, 07 Nov 2019 14:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zJvK/6JW1krikKRy92QCVYywLVAzEehynOsXWSJxglE=;
        b=YygxF9xG3PtD/qfIIpIr9JOMyjQYNNOuI+EfWeuSnE9vvUPi5rfHR6y3gW0lpVu3xB
         4P7u+yqsmD1Wm3MYHSzB/8ZZlZ/kvD/jLDox8apCHrC19WzxOvcyoDkq6GGMlf/mRfXK
         hNFR0rn1DYTa9CBUayjoNQSBiiI2n7PLPDMwA2uoUYlm4Bm28FLgMwFbsevkgXeJuzXt
         xzTpKUEHkEpBaQ6QVT1p+l5NvhOhoV0yWNRcXeoX5j2tEULlrMeBsYpJZLfxY3ZEAZLg
         OGUeB6MQG59TsBcKzgj3Q9zX7hy9uFVbNC7E2jopWAt7rcleBab6+S8ASJy2J1EJDfKu
         eikA==
X-Gm-Message-State: APjAAAUakn7S8JRlh6hpiQMDI3kw5/t0xHblIsvg0mwutPfy1iKnN4wx
        X+37+56a8tVSRrdWHCBe62tGlrU=
X-Google-Smtp-Source: APXvYqwKuBrT1J/M9g2v20XbY+whoCvslnbX1iEPr4ZmFqyDt+iMNZK8id4kkbZXCA/cP3anKux64Q==
X-Received: by 2002:a54:4812:: with SMTP id j18mr6044989oij.53.1573166576240;
        Thu, 07 Nov 2019 14:42:56 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id t206sm413509oib.30.2019.11.07.14.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 14:42:55 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: Convert generic pin mux and config properties to schema
Date:   Thu,  7 Nov 2019 16:42:54 -0600
Message-Id: <20191107224254.15712-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As pinctrl bindings have a flexible structure and no standard child node
naming convention, creating a single pinctrl schema doesn't work. Instead,
create schemas for the pin mux and config nodes which device pinctrl schema
can reference.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---

We're starting to see pinctrl schema doing their own definitions for
generic properties, so we need to get something in place to reference.

Maybe this could be combined into a single schema? Spliting it was
easier in order to just copy over the existing documentation.

Reading thru pinctrl-bindings.txt, I'm wondering if some of it is out
of date. Do we let new bindings not use the generic muxing properties?
Do we really need to be so flexible for child node structure?

Rob

 .../bindings/pinctrl/pincfg-node.yaml         | 140 +++++++++++++
 .../bindings/pinctrl/pinctrl-bindings.txt     | 192 +-----------------
 .../bindings/pinctrl/pinmux-node.yaml         | 132 ++++++++++++
 3 files changed, 274 insertions(+), 190 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
new file mode 100644
index 000000000000..13b7ab9dd6d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pincfg-node.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic pin configuration node schema
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description:
+  Many data items that are represented in a pin configuration node are common
+  and generic. Pin control bindings should use the properties defined below
+  where they are applicable; not all of these properties are relevant or useful
+  for all hardware or binding structures. Each individual binding document
+  should state which of these generic properties, if any, are used, and the
+  structure of the DT nodes that contain these properties.
+
+properties:
+  bias-disable:
+    type: boolean
+    description: disable any pin bias
+
+  bias-high-impedance:
+    type: boolean
+    description: high impedance mode ("third-state", "floating")
+
+  bias-bus-hold:
+    type: boolean
+    description: latch weakly
+
+  bias-pull-up:
+    oneOf:
+      - type: boolean
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    description: pull up the pin. Takes as optional argument on hardware
+      supporting it the pull strength in Ohm.
+
+  bias-pull-down:
+    oneOf:
+      - type: boolean
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    description: pull down the pin. Takes as optional argument on hardware
+      supporting it the pull strength in Ohm.
+
+  bias-pull-pin-default:
+    oneOf:
+      - type: boolean
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    description: use pin-default pull state. Takes as optional argument on
+      hardware supporting it the pull strength in Ohm.
+
+  drive-push-pull:
+    type: boolean
+    description: drive actively high and low
+
+  drive-open-drain:
+    type: boolean
+    description: drive with open drain
+
+  drive-open-source:
+    type: boolean
+    description: drive with open source
+
+  drive-strength:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: sink or source at most X mA
+
+  drive-strength-microamp:
+    description: sink or source at most X uA
+
+  input-enable:
+    type: boolean
+    description: enable input on pin (no effect on output, such as
+      enabling an input buffer)
+
+  input-disable:
+    type: boolean
+    description: disable input on pin (no effect on output, such as
+      disabling an input buffer)
+
+  input-schmitt-enable:
+    type: boolean
+    description: enable schmitt-trigger mode
+
+  input-schmitt-disable:
+    type: boolean
+    description: disable schmitt-trigger mode
+
+  input-debounce:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Takes the debounce time in usec as argument or 0 to disable
+      debouncing
+
+  power-source:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: select between different power supplies
+
+  low-power-enable:
+    type: boolean
+    description: enable low power mode
+
+  low-power-disable:
+    type: boolean
+    description: disable low power mode
+
+  output-disable:
+    type: boolean
+    description: disable output on a pin (such as disable an output buffer)
+
+  output-enable:
+    type: boolean
+    description: enable output on a pin without actively driving it
+      (such as enabling an output buffer)
+
+  output-low:
+    type: boolean
+    description: set the pin to output mode with low level
+
+  output-high:
+    type: boolean
+    description: set the pin to output mode with high level
+
+  sleep-hardware-state:
+    type: boolean
+    description: indicate this is sleep related state which will be
+      programmed into the registers for the sleep state.
+
+  slew-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: set the slew rate
+
+  skew-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      this affects the expected clock skew on input pins
+      and the delay before latching a value to an output
+      pin. Typically indicates how many double-inverters are
+      used to delay the signal.
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index fcd37e93ed4d..4613bb17ace3 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -141,196 +141,8 @@ controller device.
 
 == Generic pin multiplexing node content ==
 
-pin multiplexing nodes:
-
-function		- the mux function to select
-groups			- the list of groups to select with this function
-			  (either this or "pins" must be specified)
-pins			- the list of pins to select with this function (either
-			  this or "groups" must be specified)
-
-Example:
-
-state_0_node_a {
-	uart0 {
-		function = "uart0";
-		groups = "u0rxtx", "u0rtscts";
-	};
-};
-state_1_node_a {
-	spi0 {
-		function = "spi0";
-		groups = "spi0pins";
-	};
-};
-state_2_node_a {
-	function = "i2c0";
-	pins = "mfio29", "mfio30";
-};
-
-Optionally an alternative binding can be used if more suitable depending on the
-pin controller hardware. For hardware where there is a large number of identical
-pin controller instances, naming each pin and function can easily become
-unmaintainable. This is especially the case if the same controller is used for
-different pins and functions depending on the SoC revision and packaging.
-
-For cases like this, the pin controller driver may use pinctrl-pin-array helper
-binding with a hardware based index and a number of pin configuration values:
-
-pincontroller {
-	... /* Standard DT properties for the device itself elided */
-	#pinctrl-cells = <2>;
-
-	state_0_node_a {
-		pinctrl-pin-array = <
-			0 A_DELAY_PS(0) G_DELAY_PS(120)
-			4 A_DELAY_PS(0) G_DELAY_PS(360)
-			...
-		>;
-	};
-	...
-};
-
-Above #pinctrl-cells specifies the number of value cells in addition to the
-index of the registers. This is similar to the interrupts-extended binding with
-one exception. There is no need to specify the phandle for each entry as that
-is already known as the defined pins are always children of the pin controller
-node. Further having the phandle pointing to another pin controller would not
-currently work as the pinctrl framework uses named modes to group pins for each
-pin control device.
-
-The index for pinctrl-pin-array must relate to the hardware for the pinctrl
-registers, and must not be a virtual index of pin instances. The reason for
-this is to avoid mapping of the index in the dts files and the pin controller
-driver as it can change.
-
-For hardware where pin multiplexing configurations have to be specified for
-each single pin the number of required sub-nodes containing "pin" and
-"function" properties can quickly escalate and become hard to write and
-maintain.
-
-For cases like this, the pin controller driver may use the pinmux helper
-property, where the pin identifier is provided with mux configuration settings
-in a pinmux group. A pinmux group consists of the pin identifier and mux
-settings represented as a single integer or an array of integers.
-
-The pinmux property accepts an array of pinmux groups, each of them describing
-a single pin multiplexing configuration.
-
-pincontroller {
-	state_0_node_a {
-		pinmux = <PINMUX_GROUP>, <PINMUX_GROUP>, ...;
-	};
-};
-
-Each individual pin controller driver bindings documentation shall specify
-how pin IDs and pin multiplexing configuration are defined and assembled
-together in a pinmux group.
+See pinmux-node.yaml
 
 == Generic pin configuration node content ==
 
-Many data items that are represented in a pin configuration node are common
-and generic. Pin control bindings should use the properties defined below
-where they are applicable; not all of these properties are relevant or useful
-for all hardware or binding structures. Each individual binding document
-should state which of these generic properties, if any, are used, and the
-structure of the DT nodes that contain these properties.
-
-Supported generic properties are:
-
-pins			- the list of pins that properties in the node
-			  apply to (either this, "group" or "pinmux" has to be
-			  specified)
-group			- the group to apply the properties to, if the driver
-			  supports configuration of whole groups rather than
-			  individual pins (either this, "pins" or "pinmux" has
-			  to be specified)
-pinmux			- the list of numeric pin ids and their mux settings
-			  that properties in the node apply to (either this,
-			  "pins" or "groups" have to be specified)
-bias-disable		- disable any pin bias
-bias-high-impedance	- high impedance mode ("third-state", "floating")
-bias-bus-hold		- latch weakly
-bias-pull-up		- pull up the pin
-bias-pull-down		- pull down the pin
-bias-pull-pin-default	- use pin-default pull state
-drive-push-pull		- drive actively high and low
-drive-open-drain	- drive with open drain
-drive-open-source	- drive with open source
-drive-strength		- sink or source at most X mA
-drive-strength-microamp	- sink or source at most X uA
-input-enable		- enable input on pin (no effect on output, such as
-			  enabling an input buffer)
-input-disable		- disable input on pin (no effect on output, such as
-			  disabling an input buffer)
-input-schmitt-enable	- enable schmitt-trigger mode
-input-schmitt-disable	- disable schmitt-trigger mode
-input-debounce		- debounce mode with debound time X
-power-source		- select between different power supplies
-low-power-enable	- enable low power mode
-low-power-disable	- disable low power mode
-output-disable		- disable output on a pin (such as disable an output
-			  buffer)
-output-enable		- enable output on a pin without actively driving it
-			  (such as enabling an output buffer)
-output-low		- set the pin to output mode with low level
-output-high		- set the pin to output mode with high level
-sleep-hardware-state	- indicate this is sleep related state which will be programmed
-			  into the registers for the sleep state.
-slew-rate		- set the slew rate
-skew-delay		- this affects the expected clock skew on input pins
-			  and the delay before latching a value to an output
-			  pin. Typically indicates how many double-inverters are
-			  used to delay the signal.
-
-For example:
-
-state_0_node_a {
-	cts_rxd {
-		pins = "GPIO0_AJ5", "GPIO2_AH4"; /* CTS+RXD */
-		bias-pull-up;
-	};
-};
-state_1_node_a {
-	rts_txd {
-		pins = "GPIO1_AJ3", "GPIO3_AH3"; /* RTS+TXD */
-		output-high;
-	};
-};
-state_2_node_a {
-	foo {
-		group = "foo-group";
-		bias-pull-up;
-	};
-};
-state_3_node_a {
-	mux {
-		pinmux = <GPIOx_PINm_MUXn>, <GPIOx_PINj_MUXk)>;
-		input-enable;
-	};
-};
-
-Some of the generic properties take arguments. For those that do, the
-arguments are described below.
-
-- pins takes a list of pin names or IDs as a required argument. The specific
-  binding for the hardware defines:
-  - Whether the entries are integers or strings, and their meaning.
-
-- pinmux takes a list of pin IDs and mux settings as required argument. The
-  specific bindings for the hardware defines:
-  - How pin IDs and mux settings are defined and assembled together in a single
-    integer or an array of integers.
-
-- bias-pull-up, -down and -pin-default take as optional argument on hardware
-  supporting it the pull strength in Ohm. bias-disable will disable the pull.
-
-- drive-strength takes as argument the target strength in mA.
-
-- drive-strength-microamp takes as argument the target strength in uA.
-
-- input-debounce takes the debounce time in usec as argument
-  or 0 to disable debouncing
-
-More in-depth documentation on these parameters can be found in
-<include/linux/pinctrl/pinconf-generic.h>
+See pincfg-node.yaml
diff --git a/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml b/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
new file mode 100644
index 000000000000..777623a57fd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinmux-node.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic pin multiplexing node schema
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  The contents of the pin configuration child nodes are defined by the binding
+  for the individual pin controller device. The pin configuration nodes need not
+  be direct children of the pin controller device; they may be grandchildren,
+  for example. Whether this is legal, and whether there is any interaction
+  between the child and intermediate parent nodes, is again defined entirely by
+  the binding for the individual pin controller device.
+
+  While not required to be used, there are 3 generic forms of pin muxing nodes
+  which pin controller devices can use.
+
+  pin multiplexing nodes:
+
+  Example:
+
+  state_0_node_a {
+    uart0 {
+      function = "uart0";
+      groups = "u0rxtx", "u0rtscts";
+    };
+  };
+  state_1_node_a {
+    spi0 {
+      function = "spi0";
+      groups = "spi0pins";
+    };
+  };
+  state_2_node_a {
+    function = "i2c0";
+    pins = "mfio29", "mfio30";
+  };
+
+  Optionally an alternative binding can be used if more suitable depending on the
+  pin controller hardware. For hardware where there is a large number of identical
+  pin controller instances, naming each pin and function can easily become
+  unmaintainable. This is especially the case if the same controller is used for
+  different pins and functions depending on the SoC revision and packaging.
+
+  For cases like this, the pin controller driver may use pinctrl-pin-array helper
+  binding with a hardware based index and a number of pin configuration values:
+
+  pincontroller {
+    ... /* Standard DT properties for the device itself elided */
+    #pinctrl-cells = <2>;
+
+    state_0_node_a {
+      pinctrl-pin-array = <
+        0 A_DELAY_PS(0) G_DELAY_PS(120)
+        4 A_DELAY_PS(0) G_DELAY_PS(360)
+        ...
+        >;
+    };
+    ...
+  };
+
+  Above #pinctrl-cells specifies the number of value cells in addition to the
+  index of the registers. This is similar to the interrupts-extended binding with
+  one exception. There is no need to specify the phandle for each entry as that
+  is already known as the defined pins are always children of the pin controller
+  node. Further having the phandle pointing to another pin controller would not
+  currently work as the pinctrl framework uses named modes to group pins for each
+  pin control device.
+
+  The index for pinctrl-pin-array must relate to the hardware for the pinctrl
+  registers, and must not be a virtual index of pin instances. The reason for
+  this is to avoid mapping of the index in the dts files and the pin controller
+  driver as it can change.
+
+  For hardware where pin multiplexing configurations have to be specified for
+  each single pin the number of required sub-nodes containing "pin" and
+  "function" properties can quickly escalate and become hard to write and
+  maintain.
+
+  For cases like this, the pin controller driver may use the pinmux helper
+  property, where the pin identifier is provided with mux configuration settings
+  in a pinmux group. A pinmux group consists of the pin identifier and mux
+  settings represented as a single integer or an array of integers.
+
+  The pinmux property accepts an array of pinmux groups, each of them describing
+  a single pin multiplexing configuration.
+
+  pincontroller {
+    state_0_node_a {
+      pinmux = <PINMUX_GROUP>, <PINMUX_GROUP>, ...;
+    };
+  };
+
+  Each individual pin controller driver bindings documentation shall specify
+  how pin IDs and pin multiplexing configuration are defined and assembled
+  together in a pinmux group.
+
+properties:
+  function:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The mux function to select
+
+  pins:
+    oneOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      The list of pin identifiers that properties in the node apply to. The
+      specific binding for the hardware defines whether the entries are integers
+      or strings, and their meaning.
+
+  group:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      the group to apply the properties to, if the driver supports
+      configuration of whole groups rather than individual pins (either
+      this, "pins" or "pinmux" has to be specified)
+
+  pinmux:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      The list of numeric pin ids and their mux settings that properties in the
+      node apply to (either this, "pins" or "groups" have to be specified)
+
+  pinctrl-pin-array:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
-- 
2.20.1

