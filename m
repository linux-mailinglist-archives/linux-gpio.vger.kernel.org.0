Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03055352A95
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Apr 2021 14:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234628AbhDBMUI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Apr 2021 08:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhDBMUH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Apr 2021 08:20:07 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A22C061788
        for <linux-gpio@vger.kernel.org>; Fri,  2 Apr 2021 05:20:04 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7c3c:adbc:7a1a:b85f])
        by laurent.telenet-ops.be with bizsmtp
        id noL32400E4A7w6i01oL3c1; Fri, 02 Apr 2021 14:20:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lSImQ-00CS2B-O6; Fri, 02 Apr 2021 14:20:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lSImQ-004M46-BZ; Fri, 02 Apr 2021 14:20:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: gpio: fairchild,74hc595: Convert to json-schema
Date:   Fri,  2 Apr 2021 14:19:58 +0200
Message-Id: <df145e77bd124721f28cbc58fb3c58c138f13d86.1617365710.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the Generic 8-bit shift register Device Tree binding
documentation to json-schema.

Rename from gpio-74x164 to fairchild,74hc595, as the former refers to
the Linux driver, and not to a hardware name.
Add the missing hog description.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The original file did not contain license information, so I used the
most popular/recommended one for DT bindings.
I listed the original author of the bindings as maintainer.
---
 .../bindings/gpio/fairchild,74hc595.yaml      | 77 +++++++++++++++++++
 .../devicetree/bindings/gpio/gpio-74x164.txt  | 27 -------
 2 files changed, 77 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-74x164.txt

diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
new file mode 100644
index 0000000000000000..5fe19fa5f67c551f
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/fairchild,74hc595.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic 8-bit shift register
+
+maintainers:
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - fairchild,74hc595
+      - nxp,74lvc594
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      The second cell is only used to specify the GPIO polarity.
+    const: 2
+
+  registers-number:
+    description: Number of daisy-chained shift registers
+
+  enable-gpios:
+    description: GPIO connected to the OE (Output Enable) pin.
+    maxItems: 1
+
+  spi-max-frequency: true
+
+patternProperties:
+  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+    type: object
+
+    properties:
+      gpio-hog: true
+      gpios: true
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
+  - registers-number
+
+additionalProperties: false
+
+examples:
+  - |
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            gpio5: gpio5@0 {
+                    compatible = "fairchild,74hc595";
+                    reg = <0>;
+                    gpio-controller;
+                    #gpio-cells = <2>;
+                    registers-number = <4>;
+                    spi-max-frequency = <100000>;
+            };
+    };
diff --git a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
deleted file mode 100644
index 2a97553d8d76d9f5..0000000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-* Generic 8-bits shift register GPIO driver
-
-Required properties:
-- compatible: Should contain one of the following:
-    "fairchild,74hc595"
-    "nxp,74lvc594"
-- reg : chip select number
-- gpio-controller : Marks the device node as a gpio controller.
-- #gpio-cells : Should be two.  The first cell is the pin number and
-  the second cell is used to specify the gpio polarity:
-      0 = active high
-      1 = active low
-- registers-number: Number of daisy-chained shift registers
-
-Optional properties:
-- enable-gpios: GPIO connected to the OE (Output Enable) pin.
-
-Example:
-
-gpio5: gpio5@0 {
-	compatible = "fairchild,74hc595";
-	reg = <0>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	registers-number = <4>;
-	spi-max-frequency = <100000>;
-};
-- 
2.25.1

