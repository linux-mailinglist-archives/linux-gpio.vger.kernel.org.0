Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694472F0070
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jan 2021 15:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbhAIOKx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jan 2021 09:10:53 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:34321 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbhAIOKw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jan 2021 09:10:52 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C71933EEC2;
        Sat,  9 Jan 2021 15:02:08 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-gpio@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 2/2] dt-bindings: pinctrl: Add bindings for Awinic AW9523/AW9523B
Date:   Sat,  9 Jan 2021 15:02:04 +0100
Message-Id: <20210109140204.151340-3-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109140204.151340-1-angelogioacchino.delregno@somainline.org>
References: <20210109140204.151340-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add bindings for the Awinic AW9523/AW9523B I2C GPIO Expander driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../pinctrl/awinic,aw9523-pinctrl.yaml        | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
new file mode 100644
index 000000000000..1352b3adb566
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
@@ -0,0 +1,111 @@
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
+#PIN CONFIGURATION NODES
+patternProperties:
+  '^.*$':
+    if:
+      type: object
+    then:
+      properties:
+        pins:
+          description:
+            List of gpio pins affected by the properties specified in
+            this subnode.
+          items:
+            pattern: "^gpio([0-9]|1[0-5])$"
+          minItems: 1
+          maxItems: 16
+
+        function:
+          description:
+            Specify the alternative function to be configured for the
+            specified pins.
+
+          enum: [ gpio, pwm ]
+
+        bias-disable: true
+        bias-pull-down: true
+        bias-pull-up: true
+        drive-open-drain: true
+        drive-push-pull: true
+        input-enable: true
+        output-high: true
+        output-low: true
+
+      required:
+        - pins
+        - function
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
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c_node {
+        gpio-expander@58 {
+                compatible = "awinic,aw9523-pinctrl";
+                reg = <0x58>;
+	         interrupt-parent = <&tlmm>;
+                interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                gpio-ranges = <&tlmm 0 0 16>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+	         reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+        };
+    };
-- 
2.29.2

