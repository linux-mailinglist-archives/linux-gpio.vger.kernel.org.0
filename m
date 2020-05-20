Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D6E1DA692
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2020 02:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgETAa0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 May 2020 20:30:26 -0400
Received: from inva020.nxp.com ([92.121.34.13]:56780 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726178AbgETAa0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 May 2020 20:30:26 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 948661A0210;
        Wed, 20 May 2020 02:30:23 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7BF0F1A0237;
        Wed, 20 May 2020 02:30:18 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 2401F402BB;
        Wed, 20 May 2020 08:30:12 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] dt-bindings: gpio: Convert mxs to json-schema
Date:   Wed, 20 May 2020 08:20:35 +0800
Message-Id: <1589934035-5309-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the MXS GPIO binding to DT schema format using json-schema.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 .../devicetree/bindings/gpio/gpio-mxs.txt          |  88 -------------
 .../devicetree/bindings/gpio/gpio-mxs.yaml         | 136 +++++++++++++++++++++
 2 files changed, 136 insertions(+), 88 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-mxs.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mxs.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.txt b/Documentation/devicetree/bindings/gpio/gpio-mxs.txt
deleted file mode 100644
index 1e677a4..0000000
--- a/Documentation/devicetree/bindings/gpio/gpio-mxs.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-* Freescale MXS GPIO controller
-
-The Freescale MXS GPIO controller is part of MXS PIN controller.  The
-GPIOs are organized in port/bank.  Each port consists of 32 GPIOs.
-
-As the GPIO controller is embedded in the PIN controller and all the
-GPIO ports share the same IO space with PIN controller, the GPIO node
-will be represented as sub-nodes of MXS pinctrl node.
-
-Required properties for GPIO node:
-- compatible : Should be "fsl,<soc>-gpio".  The supported SoCs include
-  imx23 and imx28.
-- interrupts : Should be the port interrupt shared by all 32 pins.
-- gpio-controller : Marks the device node as a gpio controller.
-- #gpio-cells : Should be two.  The first cell is the pin number and
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
-Note: Each GPIO port should have an alias correctly numbered in "aliases"
-node.
-
-Examples:
-
-aliases {
-	gpio0 = &gpio0;
-	gpio1 = &gpio1;
-	gpio2 = &gpio2;
-	gpio3 = &gpio3;
-	gpio4 = &gpio4;
-};
-
-pinctrl@80018000 {
-	compatible = "fsl,imx28-pinctrl", "simple-bus";
-	reg = <0x80018000 2000>;
-
-	gpio0: gpio@0 {
-		compatible = "fsl,imx28-gpio";
-		interrupts = <127>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
-
-	gpio1: gpio@1 {
-		compatible = "fsl,imx28-gpio";
-		interrupts = <126>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
-
-	gpio2: gpio@2 {
-		compatible = "fsl,imx28-gpio";
-		interrupts = <125>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
-
-	gpio3: gpio@3 {
-		compatible = "fsl,imx28-gpio";
-		interrupts = <124>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
-
-	gpio4: gpio@4 {
-		compatible = "fsl,imx28-gpio";
-		interrupts = <123>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
new file mode 100644
index 0000000..ccf5b50
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MXS GPIO controller
+
+maintainers:
+  - Shawn Guo <shawn.guo@linaro.org>
+  - Anson Huang <Anson.Huang@nxp.com>
+
+description: |
+  The Freescale MXS GPIO controller is part of MXS PIN controller.
+  The GPIOs are organized in port/bank, each port consists of 32 GPIOs.
+  As the GPIO controller is embedded in the PIN controller and all the
+  GPIO ports share the same IO space with PIN controller, the GPIO node
+  will be represented as sub-nodes of MXS pinctrl node.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx23-pinctrl
+      - fsl,imx28-pinctrl
+
+  '#address-cells':
+    const: 1
+  '#size-cells':
+    const: 0
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "gpio@[0-9]+$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - fsl,imx23-gpio
+          - fsl,imx28-gpio
+
+      reg:
+        maxItems: 1
+
+      interrupts:
+        description: Should be the port interrupt shared by all 32 pins.
+        maxItems: 1
+
+      interrupt-controller: true
+
+      "#interrupt-cells":
+        const: 2
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-controller: true
+
+    required:
+      - compatible
+      - reg
+      - interrupts
+      - interrupt-controller
+      - "#interrupt-cells"
+      - "#gpio-cells"
+      - gpio-controller
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl@80018000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "fsl,imx28-pinctrl";
+        reg = <0x80018000 0x2000>;
+
+        gpio@0 {
+                compatible = "fsl,imx28-gpio";
+                reg = <0>;
+                interrupts = <127>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+        };
+
+        gpio@1 {
+                compatible = "fsl,imx28-gpio";
+                reg = <1>;
+                interrupts = <126>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+        };
+
+        gpio@2 {
+                compatible = "fsl,imx28-gpio";
+                reg = <2>;
+                interrupts = <125>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+        };
+
+        gpio@3 {
+                compatible = "fsl,imx28-gpio";
+                reg = <3>;
+                interrupts = <124>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+        };
+
+        gpio@4 {
+                compatible = "fsl,imx28-gpio";
+                reg = <4>;
+                interrupts = <123>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+        };
+    };
-- 
2.7.4

