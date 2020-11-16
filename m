Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA572B4B00
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 17:27:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730954AbgKPQ0G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 11:26:06 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:45801 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732090AbgKPQ0G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 11:26:06 -0500
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 87496200005;
        Mon, 16 Nov 2020 16:26:03 +0000 (UTC)
Received: from spool.mail.gandi.net (spool4.mail.gandi.net [217.70.178.213])
        by nmboxes159.sd4.0x35.net (Postfix) with ESMTP id AAE3B418E3;
        Fri, 13 Nov 2020 12:12:57 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by spool.mail.gandi.net (Postfix) with ESMTPS id 74B00780658;
        Fri, 13 Nov 2020 12:12:57 +0000 (UTC)
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 967F140004;
        Fri, 13 Nov 2020 12:12:56 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        <Steen.Hegelund@microchip.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH] dt-bindings: pinctrl: ocelot: convert pinctrl bindings to json-schema
Date:   Fri, 13 Nov 2020 13:12:46 +0100
Message-Id: <20201113121252.1433354-1-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass (spool4: domain of bootlin.com designates 217.70.183.194 as permitted sender) client-ip=217.70.183.194; envelope-from=gregory.clement@bootlin.com; helo=relay2-d.mail.gandi.net;
X-TUID: jDuGHs7lsU/L
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert device tree bindings for Microsemi SoC (Ocelot, Luton, Serval,
Jguar2, Sarx5) Pin Controller to YAML format

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../bindings/pinctrl/mscc,ocelot-pinctrl.txt  | 41 ------------
 .../bindings/pinctrl/mscc,ocelot-pinctrl.yaml | 64 +++++++++++++++++++
 2 files changed, 64 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
deleted file mode 100644
index db99bd95d423..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Microsemi Ocelot pin controller Device Tree Bindings
-----------------------------------------------------
-
-Required properties:
- - compatible		: Should be "mscc,ocelot-pinctrl",
-			  "mscc,jaguar2-pinctrl", "microchip,sparx5-pinctrl",
-			  "mscc,luton-pinctrl" or "mscc,serval-pinctrl"
- - reg			: Address and length of the register set for the device
- - gpio-controller	: Indicates this device is a GPIO controller
- - #gpio-cells		: Must be 2.
-			  The first cell is the pin number and the
-			  second cell specifies GPIO flags, as defined in
-			  <dt-bindings/gpio/gpio.h>.
- - gpio-ranges		: Range of pins managed by the GPIO controller.
-
-
-The ocelot-pinctrl driver uses the generic pin multiplexing and generic pin
-configuration documented in pinctrl-bindings.txt.
-
-The following generic properties are supported:
- - function
- - pins
-
-Example:
-	gpio: pinctrl@71070034 {
-		compatible = "mscc,ocelot-pinctrl";
-		reg = <0x71070034 0x28>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-ranges = <&gpio 0 0 22>;
-
-		uart_pins: uart-pins {
-				pins = "GPIO_6", "GPIO_7";
-				function = "uart";
-		};
-
-		uart2_pins: uart2-pins {
-				pins = "GPIO_12", "GPIO_13";
-				function = "uart2";
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
new file mode 100644
index 000000000000..b774b92becc8
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mscc,ocelot-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microsemi Ocelot pin controller Device Tree Bindings
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,sparx5-pinctrl
+      - mscc,jaguar2-pinctrl
+      - mscc,luton-pinctrl
+      - mscc,ocelot-pinctrl
+      - mscc,serval-pinctrl
+
+  "#gpio-cells":
+    const: 2
+    description:
+      The first cell is the pin number and the second cell specifies
+      GPIO flags, as defined in <dt-bindings/gpio/gpio.h>.
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  gpio-ranges:
+    maxItems: 1
+
+required:
+  - "#gpio-cells"
+  - compatible
+  - reg
+  - gpio-controller
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio: pinctrl@71070034 {
+        compatible = "mscc,ocelot-pinctrl";
+        reg = <0x71070034 0x28>;
+        gpio-controller;
+        #gpio-cells = <2>;
+                gpio-ranges = <&gpio 0 0 22>;
+
+        uart_pins: uart-pins {
+        		pins = "GPIO_6", "GPIO_7";
+        		function = "uart";
+        };
+
+        uart2_pins: uart2-pins {
+        		pins = "GPIO_12", "GPIO_13";
+        		function = "uart2";
+        };
+    };
+
+...
\ No newline at end of file
-- 
2.28.0

