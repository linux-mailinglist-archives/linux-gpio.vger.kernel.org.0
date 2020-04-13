Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1481A64CB
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2020 11:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbgDMJs5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Apr 2020 05:48:57 -0400
Received: from inva021.nxp.com ([92.121.34.21]:45488 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727793AbgDMJs4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Apr 2020 05:48:56 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4EA80200216;
        Mon, 13 Apr 2020 11:48:54 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3636B201410;
        Mon, 13 Apr 2020 11:48:49 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id F0284402B4;
        Mon, 13 Apr 2020 17:48:42 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] dt-bindings: gpio: Convert i.MX to json-schema
Date:   Mon, 13 Apr 2020 17:40:49 +0800
Message-Id: <1586770849-15693-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the i.MX GPIO binding to DT schema format using json-schema.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 .../devicetree/bindings/gpio/fsl-imx-gpio.txt      | 35 -----------
 .../devicetree/bindings/gpio/fsl-imx-gpio.yaml     | 72 ++++++++++++++++++++++
 2 files changed, 72 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt
deleted file mode 100644
index b4cd9f90..0000000
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-* Freescale i.MX/MXC GPIO controller
-
-Required properties:
-- compatible : Should be "fsl,<soc>-gpio"
-- reg : Address and length of the register set for the device
-- interrupts : Should be the port interrupt shared by all 32 pins, if
-  one number.  If two numbers, the first one is the interrupt shared
-  by low 16 pins and the second one is for high 16 pins.
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
-Optional properties:
-- clocks: the clock for clocking the GPIO silicon
-
-Example:
-
-gpio0: gpio@73f84000 {
-	compatible = "fsl,imx51-gpio", "fsl,imx35-gpio";
-	reg = <0x73f84000 0x4000>;
-	interrupts = <50 51>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
new file mode 100644
index 0000000..465104c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/fsl-imx-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX/MXC GPIO controller
+
+maintainers:
+  - Anson Huang <Anson.Huang@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx1-gpio
+              - fsl,imx21-gpio
+              - fsl,imx31-gpio
+              - fsl,imx35-gpio
+              - fsl,imx7d-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: |
+      Should be the port interrupt shared by all 32 pins, if one number.
+      If two numbers, the first one is the interrupt shared by low 16 pins
+      and the second one is for high 16 pins.
+    minItems: 1
+    maxItems: 2
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  clocks:
+    description: |
+      The clock for clocking the GPIO silicon.
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
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
+    gpio0: gpio@73f84000 {
+        compatible = "fsl,imx35-gpio";
+        reg = <0x73f84000 0x4000>;
+        interrupts = <50 51>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
+
+...
-- 
2.7.4

