Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897DE2F1E11
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 19:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390583AbhAKSa3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 13:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390582AbhAKSa2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 13:30:28 -0500
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F569C061786
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 10:29:33 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 86B9F1F9DB;
        Mon, 11 Jan 2021 19:29:30 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 2/2] dt-bindings: pinctrl: Add bindings for Awinic AW9523/AW9523B
Date:   Mon, 11 Jan 2021 19:29:28 +0100
Message-Id: <20210111182928.587285-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111182928.587285-1-angelogioacchino.delregno@somainline.org>
References: <20210111182928.587285-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add bindings for the Awinic AW9523/AW9523B I2C GPIO Expander driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../pinctrl/awinic,aw9523-pinctrl.yaml        | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
new file mode 100644
index 000000000000..a705c05bb5a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
@@ -0,0 +1,112 @@
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
+      $ref: "/schemas/pinctrl/pincfg-node.yaml"
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
+                interrupt-parent = <&tlmm>;
+                interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                gpio-ranges = <&tlmm 0 0 16>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+                reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+        };
+    };
-- 
2.29.2

