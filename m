Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1239A18FC5B
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 19:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727878AbgCWSHr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 14:07:47 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37528 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbgCWSHr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2020 14:07:47 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 97583803087C;
        Mon, 23 Mar 2020 18:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FBzU4X8Q-446; Mon, 23 Mar 2020 21:07:41 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Hoan Tran <hoan@os.amperecomputing.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/6] dt-bindings: gpio: Convert snps,dw-apb-gpio to DT schema
Date:   Mon, 23 Mar 2020 21:06:27 +0300
Message-ID: <20200323180632.14119-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306132505.8D3B88030795@mail.baikalelectronics.ru>
 <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Modern device tree bindings are supposed to be created as YAML-files
in accordance with DT schema. This commit replaces Synopsys DW GPIO
legacy bare text binding with YAML file. As before the binding file
states that the corresponding dts node is supposed to be compatible
with generic DW I2C controller indicated by the "snps,dw-apb-gpio"
compatible string and to provide a mandatory registers memory range.
It may also have an optional clock and reset phandle references.

There must be specified at least one subnode with
"snps,dw-apb-gpio-port" compatible string indicating the GPIO port,
which would actually export the GPIO controller functionality. Such
nodes should have traditional GPIO controller properties together
with optional interrupt-controller attributes if the corresponding
controller was synthesized to detect and report the input values
change to the parental IRQ controller.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>

---

Changelog v2:
- Use lowercase hex numbers in the main node name and in the sub-node names.
- Use "allOf:" statement to apply uint32 and "minimum/maximum" limitations
  on the "snps,nr-gpios" property.
- Discard "interrupts-extended" property.
- Make sure the sub-nodes have names with either 'gpio-port' or
  'gpio-controller' prefixes.

The DT scheme provided by this patch will pass the dt_binding_check
command after the next patches are merged to the dt-schema repo:

--- a/schemas/gpio/gpio.yaml
+++ b/schemas/gpio/gpio.yaml
@@ -34,7 +34,7 @@ properties:
       - $ref: "/schemas/types.yaml#/definitions/phandle-array"

 patternProperties:
-  ".*-gpios?$":
+  "(?<!,nr)-gpios?$":
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
   "^gpios$":
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
--- a/meta-schemas/gpios.yaml	2020-03-13 20:20:10.072900019 +0300
+++ b/meta-schemas/gpios.yaml	2020-03-13 20:20:16.000953216 +0300
@@ -19,9 +19,7 @@
     $ref: "cell.yaml#array"

 patternProperties:
-  '.*-gpio$':
-    $ref: "cell.yaml#array"
-  '.*-gpios$':
+  '(?<!,nr)-gpios?$':
     $ref: "cell.yaml#array"

 dependencies:
---
 .../bindings/gpio/snps,dw-apb-gpio.yaml       | 129 ++++++++++++++++++
 .../bindings/gpio/snps-dwapb-gpio.txt         |  65 ---------
 2 files changed, 129 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
new file mode 100644
index 000000000000..f84f92c4dd53
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare APB GPIO controller
+
+description: |
+  Synopsys DesignWare GPIO controllers have a configurable number of ports,
+  each of which are intended to be represented as child nodes with the generic
+  GPIO-controller properties as desribed in this bindings file.
+
+maintainers:
+  - Hoan Tran <hoan@os.amperecomputing.com>
+
+properties:
+  $nodename:
+    pattern: "^gpio@[0-9a-f]+$"
+
+  compatible:
+    const: snps,dw-apb-gpio
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB interface clock source
+
+  clock-names:
+    items:
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+patternProperties:
+  "^gpio-(port|controller)@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: snps,dw-apb-gpio-port
+
+      reg:
+        maxItems: 1
+
+      gpio-controller: true
+
+      '#gpio-cells':
+        const: 2
+
+      snps,nr-gpios:
+        description: The number of GPIO pins exported by the port.
+        default: 32
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - minimum: 1
+            maximum: 32
+
+      interrupts:
+        description: |
+          The interrupts to the parent controller raised when GPIOs generate
+          the interrupts. If the controller provides one combined interrupt
+          for all GPIOs, specify a single interrupt. If the controller provides
+          one interrupt for each GPIO, provide a list of interrupts that
+          correspond to each of the GPIO pins.
+        minItems: 1
+        maxItems: 32
+
+      interrupt-controller: true
+
+      '#interrupt-cells':
+        const: 2
+
+    required:
+      - compatible
+      - reg
+      - gpio-controller
+      - '#gpio-cells'
+
+    dependencies:
+      interrupt-controller: [ interrupts ]
+
+    additionalProperties: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    gpio: gpio@20000 {
+      compatible = "snps,dw-apb-gpio";
+      reg = <0x20000 0x1000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      porta: gpio-port@0 {
+        compatible = "snps,dw-apb-gpio-port";
+        reg = <0>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        snps,nr-gpios = <8>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&vic1>;
+        interrupts = <0>;
+      };
+
+      portb: gpio-port@1 {
+        compatible = "snps,dw-apb-gpio-port";
+        reg = <1>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        snps,nr-gpios = <8>;
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
deleted file mode 100644
index 839dd32ffe11..000000000000
--- a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-* Synopsys DesignWare APB GPIO controller
-
-Required properties:
-- compatible : Should contain "snps,dw-apb-gpio"
-- reg : Address and length of the register set for the device.
-- #address-cells : should be 1 (for addressing port subnodes).
-- #size-cells : should be 0 (port subnodes).
-
-The GPIO controller has a configurable number of ports, each of which are
-represented as child nodes with the following properties:
-
-Required properties:
-- compatible : "snps,dw-apb-gpio-port"
-- gpio-controller : Marks the device node as a gpio controller.
-- #gpio-cells : Should be two.  The first cell is the pin number and
-  the second cell is used to specify the gpio polarity:
-      0 = active high
-      1 = active low
-- reg : The integer port index of the port, a single cell.
-
-Optional properties:
-- interrupt-controller : The first port may be configured to be an interrupt
-controller.
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt.  Shall be set to 2.  The first cell defines the interrupt number,
-  the second encodes the triger flags encoded as described in
-  Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-- interrupts : The interrupts to the parent controller raised when GPIOs
-  generate the interrupts. If the controller provides one combined interrupt
-  for all GPIOs, specify a single interrupt. If the controller provides one
-  interrupt for each GPIO, provide a list of interrupts that correspond to each
-  of the GPIO pins. When specifying multiple interrupts, if any are unconnected,
-  use the interrupts-extended property to specify the interrupts and set the
-  interrupt controller handle for unused interrupts to 0.
-- snps,nr-gpios : The number of pins in the port, a single cell.
-- resets : Reset line for the controller.
-
-Example:
-
-gpio: gpio@20000 {
-	compatible = "snps,dw-apb-gpio";
-	reg = <0x20000 0x1000>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	porta: gpio@0 {
-		compatible = "snps,dw-apb-gpio-port";
-		gpio-controller;
-		#gpio-cells = <2>;
-		snps,nr-gpios = <8>;
-		reg = <0>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		interrupt-parent = <&vic1>;
-		interrupts = <0>;
-	};
-
-	portb: gpio@1 {
-		compatible = "snps,dw-apb-gpio-port";
-		gpio-controller;
-		#gpio-cells = <2>;
-		snps,nr-gpios = <8>;
-		reg = <1>;
-	};
-};
-- 
2.25.1

