Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B07F17BEEE
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2020 14:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbgCFNdD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Mar 2020 08:33:03 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:37258 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727152AbgCFNdD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2020 08:33:03 -0500
X-Greylist: delayed 475 seconds by postgrey-1.27 at vger.kernel.org; Fri, 06 Mar 2020 08:33:01 EST
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id AC2108030794;
        Fri,  6 Mar 2020 13:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jNB7u-hB2BZ4; Fri,  6 Mar 2020 16:25:09 +0300 (MSK)
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
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] dt-bindings: gpio: Replace DW APB GPIO legacy bindings with YAML-based one
Date:   Fri, 6 Mar 2020 16:24:45 +0300
In-Reply-To: <20200306132448.13917-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306132448.13917-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306132510.AC2108030794@mail.baikalelectronics.ru>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Modern device tree bindings are supposed to be created as YAML-files
in accordance with dt-schema. This commit replaces Synopsys DW GPIO
legacy bare text bindings with YAML file. As before the bindings file
states that the corresponding dts node is supposed to be compatible
with generic DW I2C controller indicated by the "snps,dw-apb-gpio"
compatible string and provide a mandatory registers memory range.
It may also have an optional clocks and resets phandle references.

There must be specified at least one subnode with
"snps,dw-apb-gpio-port" compatible string indicating the GPIO port,
which would actually export the GPIO controller functionality. Such
nodes should have traditional GPIO controller properties together
with optional interrupt-controller attributes if the corresponding
controller was synthesized to detected and report the input values
change to the parental IRQ controller.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>

---

Synopsis DesignWare APB SSI controller has a bindings property
"snps,nr-gpios" of numeric type, which means the number of GPIO pins
exported by the corresponding controller port. There is also a generic
pattern-property "*-gpios", which corresponds to a GPIOs array. As you
can see the GPIOs array property wildcard matches the vendor-specific
property "snps,nr-gpios" property while having an incompatible type.
Due to this the DW APB GPIO dts-nodes evaluation will report the
following error:

snps,nr-gpios:0:0: 8 is not valid under any of the given schemas (Possible causes of the failure):
snps,nr-gpios:0:0: missing phandle tag in 8

I didn't manage to fix the problem by redefining the property schema (this
might be impossible anyway). In my opinion the best way to solve it would be
to change the DW APB SSI Controller bindings so the driver would accept the
standard "ngpios" property for the same purpose. But in this case we would have
to alter all the dts files currently having the "snps,dw-apb-ssi" compatible
nodes (it's a lot). I know the bindings modifications aren't that much welcome
in the kernel community and there are good reasons why. So what do you think
would be the better way to fix the problem with the property types collision?
---
 .../bindings/gpio/snps,dw-apb-gpio.yaml       | 136 ++++++++++++++++++
 .../bindings/gpio/snps-dwapb-gpio.txt         |  65 ---------
 2 files changed, 136 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
new file mode 100644
index 000000000000..d9bc12e9e515
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
@@ -0,0 +1,136 @@
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
+    pattern: "^gpio@[0-9a-fA-F]+$"
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
+  "^.*@[0-9a-fA-F]+$":
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
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: The number of GPIO pins exported by the port.
+        default: 32
+        minimum: 1
+        maximum: 32
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
+      interrupts-extended:
+        description: |
+          When specifying multiple interrupts, if any are unconnected, use
+          this property to specify the interrupts and set the interrupt
+          controller handle for unused interrupts to 0.
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
+      porta: gpio@0 {
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
+      portb: gpio@1 {
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

