Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C09638C10B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 09:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbhEUHzl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 03:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231728AbhEUHzk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 03:55:40 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A35C0613ED
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 00:54:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:18b5:4195:d4ed:57e1])
        by laurent.telenet-ops.be with bizsmtp
        id 7KuE2500N46MpxJ01KuECB; Fri, 21 May 2021 09:54:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljzz3-007iyi-Sq; Fri, 21 May 2021 09:54:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljzz3-00A3vE-Fw; Fri, 21 May 2021 09:54:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jan Tuerk <jan.tuerk@emtrion.com>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] dt-bindings: gpio: pcf857x: Convert to json-schema
Date:   Fri, 21 May 2021 09:54:08 +0200
Message-Id: <52df0592c81ac000d3f486a9ba5a4d84b0f42c47.1621583562.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621583562.git.geert+renesas@glider.be>
References: <cover.1621583562.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the PCF857x-compatible I/O expanders Device Tree binding
documentation to json-schema.

Document missing compatible values, properties, and gpio hogs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Perhaps the "ti,pcf8575" construct should be removed, and the few users
fixed instead?

I have listed Laurent as the maintainer, as he wrote the original
bindings.  Laurent: Please scream if this is inappropriate ;-)
---
 .../devicetree/bindings/gpio/gpio-pcf857x.txt |  69 ----------
 .../devicetree/bindings/gpio/nxp,pcf8575.yaml | 120 ++++++++++++++++++
 2 files changed, 120 insertions(+), 69 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt b/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
deleted file mode 100644
index a482455a205b0855..0000000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-* PCF857x-compatible I/O expanders
-
-The PCF857x-compatible chips have "quasi-bidirectional" I/O lines that can be
-driven high by a pull-up current source or driven low to ground. This combines
-the direction and output level into a single bit per line, which can't be read
-back. We can't actually know at initialization time whether a line is configured
-(a) as output and driving the signal low/high, or (b) as input and reporting a
-low/high value, without knowing the last value written since the chip came out
-of reset (if any). The only reliable solution for setting up line direction is
-thus to do it explicitly.
-
-Required Properties:
-
-  - compatible: should be one of the following.
-    - "maxim,max7328": For the Maxim MAX7378
-    - "maxim,max7329": For the Maxim MAX7329
-    - "nxp,pca8574": For the NXP PCA8574
-    - "nxp,pca8575": For the NXP PCA8575
-    - "nxp,pca9670": For the NXP PCA9670
-    - "nxp,pca9671": For the NXP PCA9671
-    - "nxp,pca9672": For the NXP PCA9672
-    - "nxp,pca9673": For the NXP PCA9673
-    - "nxp,pca9674": For the NXP PCA9674
-    - "nxp,pca9675": For the NXP PCA9675
-    - "nxp,pcf8574": For the NXP PCF8574
-    - "nxp,pcf8574a": For the NXP PCF8574A
-    - "nxp,pcf8575": For the NXP PCF8575
-
-  - reg: I2C slave address.
-
-  - gpio-controller: Marks the device node as a gpio controller.
-  - #gpio-cells: Should be 2. The first cell is the GPIO number and the second
-    cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>. Only the
-    GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
-
-Optional Properties:
-
-  - lines-initial-states: Bitmask that specifies the initial state of each
-  line. When a bit is set to zero, the corresponding line will be initialized to
-  the input (pulled-up) state. When the  bit is set to one, the line will be
-  initialized the low-level output state. If the property is not specified
-  all lines will be initialized to the input state.
-
-  The I/O expander can detect input state changes, and thus optionally act as
-  an interrupt controller. When the expander interrupt line is connected all the
-  following properties must be set. For more information please see the
-  interrupt controller device tree bindings documentation available at
-  Documentation/devicetree/bindings/interrupt-controller/interrupts.txt.
-
-  - interrupt-controller: Identifies the node as an interrupt controller.
-  - #interrupt-cells: Number of cells to encode an interrupt source, shall be 2.
-  - interrupts: Interrupt specifier for the controllers interrupt.
-
-
-Please refer to gpio.txt in this directory for details of the common GPIO
-bindings used by client devices.
-
-Example: PCF8575 I/O expander node
-
-	pcf8575: gpio@20 {
-		compatible = "nxp,pcf8575";
-		reg = <0x20>;
-		interrupt-parent = <&irqpin2>;
-		interrupts = <3 0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
new file mode 100644
index 0000000000000000..45034be0f8abc961
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nxp,pcf8575.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCF857x-compatible I/O expanders
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description:
+  The PCF857x-compatible chips have "quasi-bidirectional" I/O lines that can be
+  driven high by a pull-up current source or driven low to ground. This
+  combines the direction and output level into a single bit per line, which
+  can't be read back. We can't actually know at initialization time whether a
+  line is configured (a) as output and driving the signal low/high, or (b) as
+  input and reporting a low/high value, without knowing the last value written
+  since the chip came out of reset (if any). The only reliable solution for
+  setting up line direction is thus to do it explicitly.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - ti,pcf8575
+          - const: nxp,pcf8575
+
+      - enum:
+          - maxim,max7328
+          - maxim,max7329
+          - nxp,pca8574
+          - nxp,pca8575
+          - nxp,pca9670
+          - nxp,pca9671
+          - nxp,pca9672
+          - nxp,pca9673
+          - nxp,pca9674
+          - nxp,pca9675
+          - nxp,pcf8574
+          - nxp,pcf8574a
+          - nxp,pcf8575
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+    description:
+      The first cell is the GPIO number and the second cell specifies GPIO
+      flags, as defined in <dt-bindings/gpio/gpio.h>. Only the GPIO_ACTIVE_HIGH
+      and GPIO_ACTIVE_LOW flags are supported.
+
+  lines-initial-states:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Bitmask that specifies the initial state of each line.
+      When a bit is set to zero, the corresponding line will be initialized to
+      the input (pulled-up) state.
+      When the  bit is set to one, the line will be initialized to the
+      low-level output state.
+      If the property is not specified all lines will be initialized to the
+      input state.
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  wakeup-source: true
+
+patternProperties:
+  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+    type: object
+
+    properties:
+      gpio-hog: true
+      gpios: true
+      input: true
+      output-high: true
+      output-low: true
+      line-name: true
+
+    required:
+      - gpio-hog
+      - gpios
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            pcf8575: gpio@20 {
+                    compatible = "nxp,pcf8575";
+                    reg = <0x20>;
+                    interrupt-parent = <&irqpin2>;
+                    interrupts = <3 0>;
+                    gpio-controller;
+                    #gpio-cells = <2>;
+                    interrupt-controller;
+                    #interrupt-cells = <2>;
+            };
+    };
-- 
2.25.1

