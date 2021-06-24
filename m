Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40BC03B38F1
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 23:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbhFXVyA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 17:54:00 -0400
Received: from perseus.uberspace.de ([95.143.172.134]:41290 "EHLO
        perseus.uberspace.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbhFXVx7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 17:53:59 -0400
Received: (qmail 6749 invoked from network); 24 Jun 2021 21:44:56 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
  by perseus.uberspace.de with SMTP; 24 Jun 2021 21:44:56 -0000
From:   David Bauer <mail@david-bauer.net>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/2] dt-bindings: pinctrl: Add bindings for Awinic AW9523/AW9523B
Date:   Thu, 24 Jun 2021 23:44:57 +0200
Message-Id: <20210624214458.68716-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Add bindings for the Awinic AW9523/AW9523B I2C GPIO Expander driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/awinic,aw9523-pinctrl.yaml        | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
new file mode 100644
index 000000000000..640d4d7e4cab
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/awinic,aw9523-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic AW9523/AW9523B I2C GPIO Expander
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+
+description: |
+  The Awinic AW9523/AW9523B I2C GPIO Expander featuring 16 multi-function
+  I/O, 256 steps PWM mode and interrupt support.
+
+properties:
+  compatible:
+    const: awinic,aw9523-pinctrl
+
+  reg:
+    maxItems: 1
+
+  '#gpio-cells':
+    description: |
+      Specifying the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  gpio-controller: true
+
+  gpio-ranges:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+    description: Specifies the INTN pin IRQ.
+
+  '#interrupt-cells':
+    description:
+      Specifies the PIN numbers and Flags, as defined in defined in
+      include/dt-bindings/interrupt-controller/irq.h
+    const: 2
+
+  reset-gpios:
+    maxItems: 1
+
+#PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in
+          this subnode.
+        items:
+          pattern: "^gpio([0-9]|1[0-5])$"
+        minItems: 1
+        maxItems: 16
+
+      function:
+        description:
+          Specify the alternative function to be configured for the
+          specified pins.
+
+        enum: [ gpio, pwm ]
+
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+      drive-open-drain: true
+      drive-push-pull: true
+      input-enable: true
+      input-disable: true
+      output-high: true
+      output-low: true
+
+    required:
+      - pins
+      - function
+
+    additionalProperties: false
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
+  # Example configuration to drive pins for a keyboard matrix
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        aw9523: gpio-expander@58 {
+                compatible = "awinic,aw9523-pinctrl";
+                reg = <0x58>;
+                interrupt-parent = <&tlmm>;
+                interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                gpio-ranges = <&tlmm 0 0 16>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+                reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+
+                keyboard-matrix-col-pins {
+                        pins = "gpio8", "gpio9", "gpio10", "gpio11",
+                               "gpio12", "gpio13", "gpio14", "gpio15";
+                        function = "gpio";
+                        input-disable;
+                        output-low;
+                };
+
+                keyboard-matrix-row-pins {
+                        pins = "gpio0", "gpio1", "gpio2", "gpio3",
+                               "gpio4", "gpio5", "gpio6", "gpio7";
+                        function = "gpio";
+                        bias-pull-up;
+                        drive-open-drain;
+                        input-enable;
+                };
+        };
+    };
-- 
2.32.0

