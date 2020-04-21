Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683C81B291D
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 16:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgDUOMP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 10:12:15 -0400
Received: from inva020.nxp.com ([92.121.34.13]:37844 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbgDUOMO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Apr 2020 10:12:14 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6386B1A0D78;
        Tue, 21 Apr 2020 16:12:11 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 409661A0D7F;
        Tue, 21 Apr 2020 16:12:06 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0DAAF402D9;
        Tue, 21 Apr 2020 22:11:59 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2] dt-bindings: gpio: Convert i.MX to json-schema
Date:   Tue, 21 Apr 2020 22:03:43 +0800
Message-Id: <1587477823-21036-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the i.MX GPIO binding to DT schema format using json-schema.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- improve compatible;
	- drop clocks description.
---
 .../devicetree/bindings/gpio/fsl-imx-gpio.txt      | 35 -----------
 .../devicetree/bindings/gpio/fsl-imx-gpio.yaml     | 68 ++++++++++++++++++++++
 2 files changed, 68 insertions(+), 35 deletions(-)
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
index 0000000..0b223ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -0,0 +1,68 @@
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
+    enum:
+      - fsl,imx1-gpio
+      - fsl,imx21-gpio
+      - fsl,imx31-gpio
+      - fsl,imx35-gpio
+      - fsl,imx7d-gpio
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

