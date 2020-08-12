Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C1124266F
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Aug 2020 09:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgHLH5Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Aug 2020 03:57:25 -0400
Received: from inva021.nxp.com ([92.121.34.21]:33400 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbgHLH5Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Aug 2020 03:57:25 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 86DC9201753;
        Wed, 12 Aug 2020 09:57:22 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 443E0201745;
        Wed, 12 Aug 2020 09:57:18 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8A982402F3;
        Wed, 12 Aug 2020 09:57:13 +0200 (CEST)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, stefan@agner.ch, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2] dt-bindings: gpio: Convert vf610 to json-schema
Date:   Wed, 12 Aug 2020 15:52:21 +0800
Message-Id: <1597218741-24899-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the vf610 gpio binding to DT schema format using json-schema.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
changes since V1:
	- fix reg property to pass build;
	- add "additionalProperties: false".
---
 .../devicetree/bindings/gpio/gpio-vf610.txt        | 63 -----------------
 .../devicetree/bindings/gpio/gpio-vf610.yaml       | 81 ++++++++++++++++++++++
 2 files changed, 81 insertions(+), 63 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-vf610.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.txt b/Documentation/devicetree/bindings/gpio/gpio-vf610.txt
deleted file mode 100644
index ae254aa..0000000
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-* Freescale VF610 PORT/GPIO module
-
-The Freescale PORT/GPIO modules are two adjacent modules providing GPIO
-functionality. Each pair serves 32 GPIOs. The VF610 has 5 instances of
-each, and each PORT module has its own interrupt.
-
-Required properties for GPIO node:
-- compatible : Should be "fsl,<soc>-gpio", below is supported list:
-	       "fsl,vf610-gpio"
-	       "fsl,imx7ulp-gpio"
-- reg : The first reg tuple represents the PORT module, the second tuple
-  the GPIO module.
-- interrupts : Should be the port interrupt shared by all 32 pins.
-- gpio-controller : Marks the device node as a gpio controller.
-- #gpio-cells : Should be two. The first cell is the pin number and
-  the second cell is used to specify the gpio polarity:
-      0 = active high
-      1 = active low
-- interrupt-controller: Marks the device node as an interrupt controller.
-- #interrupt-cells : Should be 2.  The first cell is the GPIO number.
-  The second cell bits[3:0] is used to specify trigger type and level flags:
-      1 = low-to-high edge triggered.
-      2 = high-to-low edge triggered.
-      4 = active high level-sensitive.
-      8 = active low level-sensitive.
-
-Optional properties:
--clocks:	Must contain an entry for each entry in clock-names.
-		See common clock-bindings.txt for details.
--clock-names:	A list of clock names. For imx7ulp, it must contain
-		"gpio", "port".
-
-Note: Each GPIO port should have an alias correctly numbered in "aliases"
-node.
-
-Examples:
-
-aliases {
-	gpio0 = &gpio1;
-	gpio1 = &gpio2;
-};
-
-gpio1: gpio@40049000 {
-	compatible = "fsl,vf610-gpio";
-	reg = <0x40049000 0x1000 0x400ff000 0x40>;
-	interrupts = <0 107 IRQ_TYPE_LEVEL_HIGH>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-	gpio-ranges = <&iomuxc 0 0 32>;
-};
-
-gpio2: gpio@4004a000 {
-	compatible = "fsl,vf610-gpio";
-	reg = <0x4004a000 0x1000 0x400ff040 0x40>;
-	interrupts = <0 108 IRQ_TYPE_LEVEL_HIGH>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-	gpio-ranges = <&iomuxc 0 32 32>;
-};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
new file mode 100644
index 0000000..6ac5a78
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale VF610 PORT/GPIO module
+
+maintainers:
+  - Stefan Agner <stefan@agner.ch>
+
+description: |
+  The Freescale PORT/GPIO modules are two adjacent modules providing GPIO
+  functionality. Each pair serves 32 GPIOs. The VF610 has 5 instances of
+  each, and each PORT module has its own interrupt.
+
+  Note: Each GPIO port should have an alias correctly numbered in "aliases"
+  node.
+
+properties:
+  compatible:
+    enum:
+      - fsl,vf610-gpio
+      - fsl,imx7ulp-gpio
+
+  reg:
+    description: The first reg tuple represents the PORT module, the second tuple
+      represents the GPIO module.
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  clocks:
+    items:
+      - description: SoC GPIO clock
+      - description: SoC PORT clock
+
+  clock-names:
+    items:
+      - const: gpio
+      - const: port
+
+  gpio-ranges:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpio1: gpio@40049000 {
+        compatible = "fsl,vf610-gpio";
+        reg = <0x40049000 0x1000>, <0x400ff000 0x40>;
+        interrupts = <0 107 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&iomuxc 0 0 32>;
+    };
-- 
2.7.4

