Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559CF302A1C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jan 2021 19:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbhAYSXU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jan 2021 13:23:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbhAYSXP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 13:23:15 -0500
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4F6C06178C
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 10:22:23 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8ACD71F914;
        Mon, 25 Jan 2021 19:22:21 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v5 2/2] dt-bindings: pinctrl: Add bindings for Awinic AW9523/AW9523B
Date:   Mon, 25 Jan 2021 19:22:19 +0100
Message-Id: <20210125182219.213214-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210125182219.213214-1-angelogioacchino.delregno@somainline.org>
References: <20210125182219.213214-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add bindings for the Awinic AW9523/AW9523B I2C GPIO Expander driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
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
2.30.0

