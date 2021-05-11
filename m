Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBF537A2DE
	for <lists+linux-gpio@lfdr.de>; Tue, 11 May 2021 11:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbhEKJCp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 May 2021 05:02:45 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:44096 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbhEKJCo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 May 2021 05:02:44 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14B91ZOm082184;
        Tue, 11 May 2021 04:01:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1620723695;
        bh=ui957WbpQNvrHWwm3fA1hOYlLqbcNF9iQI5haxQUVx8=;
        h=From:To:CC:Subject:Date;
        b=vZAWR5iyQ3cS+opKpUrbUEOule5D0eIAMKV8AVTyY/eJmebulHeK8bYKRHPTnMYsR
         WcQiCK+lQbIeR5IkqxC2e1ATNGNqIkNWgOFAgzNpgZ8WnKFO/uA82V3R253wAt1vC4
         l6zMWUnhn6eIs0glBwN9sMh+sgMp1cHPeEuIciwM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14B91ZYn050980
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 May 2021 04:01:35 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 11
 May 2021 04:01:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 11 May 2021 04:01:35 -0500
Received: from gsaswath-HP-ProBook-640-G5.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14B91Oqo100301;
        Tue, 11 May 2021 04:01:26 -0500
From:   Aswath Govindraju <a-govindraju@ti.com>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Keerthy <j-keerthy@ti.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] dt-bindings: gpio: gpio-davinci: Convert to json-schema
Date:   Tue, 11 May 2021 14:31:20 +0530
Message-ID: <20210511090122.6995-1-a-govindraju@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert gpio-davinci dt-binding documentation from txt to yaml format.

Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
---
 .../devicetree/bindings/gpio/gpio-davinci.txt | 167 ---------------
 .../bindings/gpio/gpio-davinci.yaml           | 193 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 194 insertions(+), 168 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
deleted file mode 100644
index 696ea46227d1..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
+++ /dev/null
@@ -1,167 +0,0 @@
-Davinci/Keystone GPIO controller bindings
-
-Required Properties:
-- compatible: should be "ti,dm6441-gpio": for Davinci da850 SoCs
-			"ti,keystone-gpio": for Keystone 2 66AK2H/K, 66AK2L,
-						66AK2E SoCs
-			"ti,k2g-gpio", "ti,keystone-gpio": for 66AK2G
-			"ti,am654-gpio", "ti,keystone-gpio": for TI K3 AM654
-			"ti,j721e-gpio", "ti,keystone-gpio": for J721E SoCs
-			"ti,am64-gpio", "ti,keystone-gpio": for AM64 SoCs
-
-- reg: Physical base address of the controller and the size of memory mapped
-       registers.
-
-- gpio-controller : Marks the device node as a gpio controller.
-
-- #gpio-cells : Should be two.
-  - first cell is the pin number
-  - second cell is used to specify optional parameters (unused)
-
-- interrupts: Array of GPIO interrupt number. Only banked or unbanked IRQs are
-	      supported at a time.
-
-- ti,ngpio: The number of GPIO pins supported.
-
-- ti,davinci-gpio-unbanked: The number of GPIOs that have an individual interrupt
-		            line to processor.
-
-- clocks: Should contain the device's input clock, and should be defined as per
-          the appropriate clock bindings consumer usage in,
-
-          Documentation/devicetree/bindings/clock/keystone-gate.txt
-                            for 66AK2HK/66AK2L/66AK2E SoCs or,
-
-          Documentation/devicetree/bindings/clock/ti,sci-clk.txt
-                            for 66AK2G SoCs
-
-- clock-names: Name should be "gpio";
-
-Currently clock-names and clocks are needed for all keystone 2 platforms
-Davinci platforms do not have DT clocks as of now.
-
-The GPIO controller also acts as an interrupt controller. It uses the default
-two cells specifier as described in Documentation/devicetree/bindings/
-interrupt-controller/interrupts.txt.
-
-Example:
-
-gpio: gpio@1e26000 {
-	compatible = "ti,dm6441-gpio";
-	gpio-controller;
-	#gpio-cells = <2>;
-	reg = <0x226000 0x1000>;
-	interrupt-parent = <&intc>;
-	interrupts = <42 IRQ_TYPE_EDGE_BOTH 43 IRQ_TYPE_EDGE_BOTH
-		44 IRQ_TYPE_EDGE_BOTH 45 IRQ_TYPE_EDGE_BOTH
-		46 IRQ_TYPE_EDGE_BOTH 47 IRQ_TYPE_EDGE_BOTH
-		48 IRQ_TYPE_EDGE_BOTH 49 IRQ_TYPE_EDGE_BOTH
-		50 IRQ_TYPE_EDGE_BOTH>;
-	ti,ngpio = <144>;
-	ti,davinci-gpio-unbanked = <0>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
-
-leds {
-	compatible = "gpio-leds";
-
-	led1 {
-		label = "davinci:green:usr1";
-		gpios = <&gpio 10 GPIO_ACTIVE_HIGH>;
-		...
-	};
-
-	led2 {
-		label = "davinci:red:debug1";
-		gpios = <&gpio 11 GPIO_ACTIVE_HIGH>;
-		...
-	};
-};
-
-Example for 66AK2G:
-
-gpio0: gpio@2603000 {
-	compatible = "ti,k2g-gpio", "ti,keystone-gpio";
-	reg = <0x02603000 0x100>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupts = <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 434 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 435 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 437 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 438 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 439 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 440 IRQ_TYPE_EDGE_RISING>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-	ti,ngpio = <144>;
-	ti,davinci-gpio-unbanked = <0>;
-	clocks = <&k2g_clks 0x001b 0x0>;
-	clock-names = "gpio";
-};
-
-Example for 66AK2HK/66AK2L/66AK2E:
-
-gpio0: gpio@260bf00 {
-	compatible = "ti,keystone-gpio";
-	reg = <0x0260bf00 0x100>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	/* HW Interrupts mapped to GPIO pins */
-	interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 121 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 124 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 125 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 126 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 128 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 129 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 130 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 131 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 132 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 133 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 135 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 136 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 137 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 138 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 139 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 140 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 141 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 142 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 143 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 144 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 145 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 146 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 147 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 148 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 150 IRQ_TYPE_EDGE_RISING>,
-			<GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
-			clocks = <&clkgpio>;
-	clock-names = "gpio";
-	ti,ngpio = <32>;
-	ti,davinci-gpio-unbanked = <32>;
-};
-
-Example for K3 AM654:
-
-wkup_gpio0: wkup_gpio0@42110000 {
-	compatible = "ti,am654-gpio", "ti,keystone-gpio";
-	reg = <0x42110000 0x100>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-parent = <&intr_wkup_gpio>;
-	interrupts = <59 128>, <59 129>, <59 130>, <59 131>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-	ti,ngpio = <56>;
-	ti,davinci-gpio-unbanked = <0>;
-	clocks = <&k3_clks 59 0>;
-	clock-names = "gpio";
-};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
new file mode 100644
index 000000000000..1e16172669c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
@@ -0,0 +1,193 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-davinci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO controller for Davinci and keystone devices
+
+maintainers:
+  - Keerthy <j-keerthy@ti.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - ti,k2g-gpio
+              - ti,am654-gpio
+              - ti,j721e-gpio
+              - ti,am64-gpio
+          - const: ti,keystone-gpio
+
+      - items:
+          - const: ti,dm6441-gpio
+      - items:
+          - const: ti,keystone-gpio
+
+  reg:
+    maxItems: 1
+    description:
+      Physical base address of the controller and the size of memory mapped registers.
+
+  gpio-controller: true
+
+  gpio-ranges: true
+
+  gpio-line-names:
+    description: strings describing the names of each gpio line.
+
+  "#gpio-cells":
+    const: 2
+    description:
+      first cell is the pin number and second cell is used to specify optional parameters (unused).
+
+  interrupts:
+    description:
+      Array of GPIO interrupt number. Only banked or unbanked IRQs are supported at a time.
+
+  ti,ngpio:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of GPIO pins supported consecutively.
+    minimum: 1
+
+  ti,davinci-gpio-unbanked:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of GPIOs that have an individual interrupt line to processor.
+    minimum: 0
+
+  clocks:
+    maxItems: 1
+    description:
+      clock-specifier to represent input to the GPIO controller.
+
+  clock-names:
+    const: gpio
+
+  interrupt-controller: true
+
+  power-domains:
+    maxItems: 1
+    description:
+      Phandle to the power domain provider node.
+
+  "#interrupt-cells":
+    const: 2
+
+patternProperties:
+  "-hog$":
+    type: object
+    properties:
+      gpios: true
+      gpio-hog: true
+      input: true
+      output-high: true
+      output-low: true
+      line-name: true
+
+    required:
+      - gpio-hog
+      - gpios
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupts
+  - ti,ngpio
+  - ti,davinci-gpio-unbanked
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include<dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpio0: gpio@2603000 {
+      compatible = "ti,k2g-gpio", "ti,keystone-gpio";
+      reg = <0x02603000 0x100>;
+      gpio-controller;
+      #gpio-cells = <2>;
+      interrupts = <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 434 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 435 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 437 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 438 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 439 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 440 IRQ_TYPE_EDGE_RISING>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      ti,ngpio = <144>;
+      ti,davinci-gpio-unbanked = <0>;
+      clocks = <&k2g_clks 0x001b 0x0>;
+      clock-names = "gpio";
+    };
+
+  - |
+    #include<dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpio1: gpio@260bf00 {
+      compatible = "ti,keystone-gpio";
+      reg = <0x0260bf00 0x100>;
+      gpio-controller;
+      #gpio-cells = <2>;
+      /* HW Interrupts mapped to GPIO pins */
+      interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 121 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 124 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 125 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 128 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 129 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 130 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 132 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 133 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 135 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 136 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 137 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 138 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 139 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 140 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 146 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 147 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 148 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
+      clocks = <&clkgpio>;
+      clock-names = "gpio";
+      ti,ngpio = <32>;
+      ti,davinci-gpio-unbanked = <32>;
+    };
+
+  - |
+    wkup_gpio0: wkup_gpio0@42110000 {
+      compatible = "ti,am654-gpio", "ti,keystone-gpio";
+      reg = <0x42110000 0x100>;
+      gpio-controller;
+      #gpio-cells = <2>;
+      interrupt-parent = <&intr_wkup_gpio>;
+      interrupts = <60>, <61>, <62>, <63>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      ti,ngpio = <56>;
+      ti,davinci-gpio-unbanked = <0>;
+      clocks = <&k3_clks 59 0>;
+      clock-names = "gpio";
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 6e183abbbd2e..6b3519db8085 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18269,7 +18269,7 @@ TI DAVINCI SERIES GPIO DRIVER
 M:	Keerthy <j-keerthy@ti.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/gpio/gpio-davinci.txt
+F:	Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
 F:	drivers/gpio/gpio-davinci.c
 
 TI DAVINCI SERIES MEDIA DRIVER
-- 
2.17.1

