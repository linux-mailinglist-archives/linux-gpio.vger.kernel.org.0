Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11E78166287
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 17:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgBTQZy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 11:25:54 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:6730 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728484AbgBTQZx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 Feb 2020 11:25:53 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01KGCSmP001645;
        Thu, 20 Feb 2020 17:22:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=nTDlVJH/Y3ujsg5OIDFpnBgY6+HvDT4YZaEntj70+n8=;
 b=UqPUQmDklrDwskJiqXMiQcq8Z/Y0byQSCsp5IXd+E4qHXr2m7kxsaQZeE9O3HzWZKVaI
 Scmuf4iwlb1lNsK5fQLc+TdK9DiJCaZNqd6RrpB6jdQhld3F1Ahf4vR3Oqi0lJqwph9Y
 Hbbg6SgJWF9Nc2OBw6bJUFeXfbbdDtTj15JbDrJVrsfP0Wej3rbVQMR6g+iwoPdwUxW3
 iCXGp7lYFgKjg0X1526H1GQzYN8+X/fPDeoa5xYbHEZARHPXp0d+Fyz2PlsjsuyMDiyY
 INWDVBgIIbwj6ZFTCujjtp7s1ZYIrfATurVnYDwz1MmmEdPkxJt4a6EzTo8s5Xltl7A8 Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y8ub5t6b1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Feb 2020 17:22:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE07610003B;
        Thu, 20 Feb 2020 17:22:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D1A12C1597;
        Thu, 20 Feb 2020 17:22:48 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 20 Feb 2020 17:22:47
 +0100
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <lee.jones@linaro.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.co>, <alexandre.torgue@st.com>,
        <linus.walleij@linaro.org>, <amelie.delaunay@st.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v3] dt-bindings: mfd: Convert stmfx bindings to json-schema
Date:   Thu, 20 Feb 2020 17:22:46 +0100
Message-ID: <20200220162246.8334-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-20_04:2020-02-19,2020-02-20 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert stmfx bindings to json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../devicetree/bindings/mfd/st,stmfx.yaml          | 124 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 -----
 .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 -------------------
 3 files changed, 124 insertions(+), 144 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/st,stmfx.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt

diff --git a/Documentation/devicetree/bindings/mfd/st,stmfx.yaml b/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
new file mode 100644
index 000000000000..0ce56a0da553
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/st,stmfx.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/st,stmfx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectonics Multi-Function eXpander (STMFX) bindings
+
+description: ST Multi-Function eXpander (STMFX) is a slave controller using I2C for
+               communication with the main MCU. Its main features are GPIO expansion,
+               main MCU IDD measurement (IDD is the amount of current that flows
+               through VDD) and resistive touchscreen controller.
+
+maintainers:
+  - Amelie Delaunay <amelie.delaunay@st.com>
+
+properties:
+  compatible:
+    const: st,stmfx-0300
+
+  reg:
+    enum: [ 0x42, 0x43 ]
+
+  interrupts:
+    maxItems: 1
+
+  drive-open-drain: true
+
+  vdd-supply:
+    maxItems: 1
+
+  pinctrl:
+    type: object
+
+    properties:
+      compatible:
+        const: st,stmfx-0300-pinctrl
+
+      "#gpio-cells":
+        const: 2
+
+      "#interrupt-cells":
+        const: 2
+
+      gpio-controller: true
+
+      interrupt-controller: true
+
+      gpio-ranges:
+        description: if all STMFX pins[24:0] are available (no other STMFX function in use),
+                     you should use gpio-ranges = <&stmfx_pinctrl 0 0 24>;
+                     if agpio[3:0] are not available (STMFX Touchscreen function in use),
+                     you should use gpio-ranges = <&stmfx_pinctrl 0 0 16>, <&stmfx_pinctrl 20 20 4>;
+                     if agpio[7:4] are not available (STMFX IDD function in use),
+                     you should use gpio-ranges = <&stmfx_pinctrl 0 0 20>;
+        maxItems: 1
+
+    patternProperties:
+      "^[a-zA-Z]*-pins$":
+        type: object
+
+        allOf:
+          - $ref: ../pinctrl/pinmux-node.yaml
+
+        properties:
+          pins: true
+          bias-disable: true
+          bias-pull-up: true
+          bias-pull-pin-default: true
+          bias-pull-down: true
+          drive-open-drain: true
+          drive-push-pull: true
+          output-high: true
+          output-low: true
+
+      additionalProperties: false
+
+    additionalProperties: false
+
+    required:
+      - compatible
+      - "#gpio-cells"
+      - "#interrupt-cells"
+      - gpio-controller
+      - interrupt-controller
+      - gpio-ranges
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c@0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      stmfx@42 {
+        compatible = "st,stmfx-0300";
+        reg = <0x42>;
+        interrupts = <8 IRQ_TYPE_EDGE_RISING>;
+        interrupt-parent = <&gpioi>;
+        vdd-supply = <&v3v3>;
+
+        stmfx_pinctrl: pinctrl {
+          compatible = "st,stmfx-0300-pinctrl";
+          #gpio-cells = <2>;
+          #interrupt-cells = <2>;
+          gpio-controller;
+          interrupt-controller;
+          gpio-ranges = <&stmfx_pinctrl 0 0 24>;
+
+          joystick_pins: joystick-pins {
+            pins = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4";
+            drive-push-pull;
+            bias-pull-up;
+          };
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/mfd/stmfx.txt b/Documentation/devicetree/bindings/mfd/stmfx.txt
deleted file mode 100644
index f0c2f7fcf5c7..000000000000
--- a/Documentation/devicetree/bindings/mfd/stmfx.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-STMicroelectonics Multi-Function eXpander (STMFX) Core bindings
-
-ST Multi-Function eXpander (STMFX) is a slave controller using I2C for
-communication with the main MCU. Its main features are GPIO expansion, main
-MCU IDD measurement (IDD is the amount of current that flows through VDD) and
-resistive touchscreen controller.
-
-Required properties:
-- compatible: should be "st,stmfx-0300".
-- reg: I2C slave address of the device.
-- interrupts: interrupt specifier triggered by MFX_IRQ_OUT signal.
-  Please refer to ../interrupt-controller/interrupt.txt
-
-Optional properties:
-- drive-open-drain: configure MFX_IRQ_OUT as open drain.
-- vdd-supply: phandle of the regulator supplying STMFX.
-
-Example:
-
-	stmfx: stmfx@42 {
-		compatible = "st,stmfx-0300";
-		reg = <0x42>;
-		interrupts = <8 IRQ_TYPE_EDGE_RISING>;
-		interrupt-parent = <&gpioi>;
-		vdd-supply = <&v3v3>;
-	};
-
-Please refer to ../pinctrl/pinctrl-stmfx.txt for STMFX GPIO expander function bindings.
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
deleted file mode 100644
index c1b4c1819b84..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
+++ /dev/null
@@ -1,116 +0,0 @@
-STMicroelectronics Multi-Function eXpander (STMFX) GPIO expander bindings
-
-ST Multi-Function eXpander (STMFX) offers up to 24 GPIOs expansion.
-Please refer to ../mfd/stmfx.txt for STMFX Core bindings.
-
-Required properties:
-- compatible: should be "st,stmfx-0300-pinctrl".
-- #gpio-cells: should be <2>, the first cell is the GPIO number and the second
-  cell is the gpio flags in accordance with <dt-bindings/gpio/gpio.h>.
-- gpio-controller: marks the device as a GPIO controller.
-- #interrupt-cells: should be <2>, the first cell is the GPIO number and the
-  second cell is the interrupt flags in accordance with
-  <dt-bindings/interrupt-controller/irq.h>.
-- interrupt-controller: marks the device as an interrupt controller.
-- gpio-ranges: specifies the mapping between gpio controller and pin
-  controller pins. Check "Concerning gpio-ranges property" below.
-Please refer to ../gpio/gpio.txt.
-
-Please refer to pinctrl-bindings.txt for pin configuration.
-
-Required properties for pin configuration sub-nodes:
-- pins: list of pins to which the configuration applies.
-
-Optional properties for pin configuration sub-nodes (pinconf-generic ones):
-- bias-disable: disable any bias on the pin.
-- bias-pull-up: the pin will be pulled up.
-- bias-pull-pin-default: use the pin-default pull state.
-- bias-pull-down: the pin will be pulled down.
-- drive-open-drain: the pin will be driven with open drain.
-- drive-push-pull: the pin will be driven actively high and low.
-- output-high: the pin will be configured as an output driving high level.
-- output-low: the pin will be configured as an output driving low level.
-
-Note that STMFX pins[15:0] are called "gpio[15:0]", and STMFX pins[23:16] are
-called "agpio[7:0]". Example, to refer to pin 18 of STMFX, use "agpio2".
-
-Concerning gpio-ranges property:
-- if all STMFX pins[24:0] are available (no other STMFX function in use), you
-  should use gpio-ranges = <&stmfx_pinctrl 0 0 24>;
-- if agpio[3:0] are not available (STMFX Touchscreen function in use), you
-  should use gpio-ranges = <&stmfx_pinctrl 0 0 16>, <&stmfx_pinctrl 20 20 4>;
-- if agpio[7:4] are not available (STMFX IDD function in use), you
-  should use gpio-ranges = <&stmfx_pinctrl 0 0 20>;
-
-
-Example:
-
-	stmfx: stmfx@42 {
-		...
-
-		stmfx_pinctrl: stmfx-pin-controller {
-			compatible = "st,stmfx-0300-pinctrl";
-			#gpio-cells = <2>;
-			#interrupt-cells = <2>;
-			gpio-controller;
-			interrupt-controller;
-			gpio-ranges = <&stmfx_pinctrl 0 0 24>;
-
-			joystick_pins: joystick {
-				pins = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4";
-				drive-push-pull;
-				bias-pull-up;
-			};
-		};
-	};
-
-Example of STMFX GPIO consumers:
-
-	joystick {
-		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		pinctrl-0 = <&joystick_pins>;
-		pinctrl-names = "default";
-		button-0 {
-			label = "JoySel";
-			linux,code = <KEY_ENTER>;
-			interrupt-parent = <&stmfx_pinctrl>;
-			interrupts = <0 IRQ_TYPE_EDGE_RISING>;
-		};
-		button-1 {
-			label = "JoyDown";
-			linux,code = <KEY_DOWN>;
-			interrupt-parent = <&stmfx_pinctrl>;
-			interrupts = <1 IRQ_TYPE_EDGE_RISING>;
-		};
-		button-2 {
-			label = "JoyLeft";
-			linux,code = <KEY_LEFT>;
-			interrupt-parent = <&stmfx_pinctrl>;
-			interrupts = <2 IRQ_TYPE_EDGE_RISING>;
-		};
-		button-3 {
-			label = "JoyRight";
-			linux,code = <KEY_RIGHT>;
-			interrupt-parent = <&stmfx_pinctrl>;
-			interrupts = <3 IRQ_TYPE_EDGE_RISING>;
-		};
-		button-4 {
-			label = "JoyUp";
-			linux,code = <KEY_UP>;
-			interrupt-parent = <&stmfx_pinctrl>;
-			interrupts = <4 IRQ_TYPE_EDGE_RISING>;
-		};
-	};
-
-	leds {
-		compatible = "gpio-leds";
-		orange {
-			gpios = <&stmfx_pinctrl 17 1>;
-		};
-
-		blue {
-			gpios = <&stmfx_pinctrl 19 1>;
-		};
-	}
-- 
2.15.0

