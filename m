Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9434912AF8
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2019 11:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbfECJrx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 May 2019 05:47:53 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:46197 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726495AbfECJrw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 May 2019 05:47:52 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x439fO5V012335;
        Fri, 3 May 2019 11:47:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=SC/ZrTlyDblqvfnBv2SJs1iBlu3PJXoeUU+jz3lp7B4=;
 b=JNVuzALubGakxCqNdi+ez/3doJK8WFZ+B/DLLfpA5uYVsq5cwcBc4M5PROriZVqJTHHC
 D95kUbEnxOJz47qnW62jmrmPZG2KuTM0KzBEQ1TvuCaRPJ56u1SH2tYAGCseDOP6YCoW
 p6e6wPw3cytv7rrV/sZ88jfT0gRce9KTWDlB9EYhpJdi6rXtmg5KjL/tUJsAcR44stqK
 dVx+o5z3DrFbRdZUI0ZG4wZidgt+VI6lujnMsHoaVHZrDhNORLOqeHRFEZSlRi+LkUEP
 n7qXW1aTcir4jtw0FNRPwHgF84WoMBXGNMbnGxCh/fk6ETnbKsEFX21Y319WEKpJ+s4g ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2s6xgrw927-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Fri, 03 May 2019 11:47:37 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ADD0441;
        Fri,  3 May 2019 09:47:35 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41214169E;
        Fri,  3 May 2019 09:47:35 +0000 (GMT)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 3 May 2019 11:47:35
 +0200
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH] dt-bindings: pinctrl: Convert stm32 pinctrl bindings to jason-schema
Date:   Fri, 3 May 2019 11:47:34 +0200
Message-ID: <1556876854-32441-1-git-send-email-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-03_04:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the STM32 pinctrl binding to DT schema format using json-schema.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
---

Hi,

First pacth to convert DT bindings file (here pinctrl STM32) to jsaon-schema
in order to take advantage of devicetree validation tool for STM32.

regards
Alex

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
deleted file mode 100644
index 0016925..0000000
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
+++ /dev/null
@@ -1,208 +0,0 @@
-* STM32 GPIO and Pin Mux/Config controller
-
-STMicroelectronics's STM32 MCUs intregrate a GPIO and Pin mux/config hardware
-controller. It controls the input/output settings on the available pins and
-also provides ability to multiplex and configure the output of various on-chip
-controllers onto these pads.
-
-Pin controller node:
-Required properies:
- - compatible: value should be one of the following:
-   "st,stm32f429-pinctrl"
-   "st,stm32f469-pinctrl"
-   "st,stm32f746-pinctrl"
-   "st,stm32f769-pinctrl"
-   "st,stm32h743-pinctrl"
-   "st,stm32mp157-pinctrl"
-   "st,stm32mp157-z-pinctrl"
- - #address-cells: The value of this property must be 1
- - #size-cells	: The value of this property must be 1
- - ranges	: defines mapping between pin controller node (parent) to
-   gpio-bank node (children).
- - pins-are-numbered: Specify the subnodes are using numbered pinmux to
-   specify pins.
-
-GPIO controller/bank node:
-Required properties:
- - gpio-controller : Indicates this device is a GPIO controller
- - #gpio-cells	  : Should be two.
-			The first cell is the pin number
-			The second one is the polarity:
-				- 0 for active high
-				- 1 for active low
- - reg		  : The gpio address range, relative to the pinctrl range
- - clocks	  : clock that drives this bank
- - st,bank-name	  : Should be a name string for this bank as specified in
-   the datasheet
-
-Optional properties:
- - reset:	  : Reference to the reset controller
- - st,syscfg: Should be phandle/offset/mask.
-	-The phandle to the syscon node which includes IRQ mux selection register.
-	-The offset of the IRQ mux selection register
-	-The field mask of IRQ mux, needed if different of 0xf.
- - gpio-ranges: Define a dedicated mapping between a pin-controller and
-   a gpio controller. Format is <&phandle a b c> with:
-	-(phandle): phandle of pin-controller.
-	-(a): gpio base offset in range.
-	-(b): pin base offset in range.
-	-(c): gpio count in range
-   This entry has to be used either if there are holes inside a bank:
-	GPIOB0/B1/B2/B14/B15 (see example 2)
-   or if banks are not contiguous:
-	GPIOA/B/C/E...
-   NOTE: If "gpio-ranges" is used for a gpio controller, all gpio-controller
-   have to use a "gpio-ranges" entry.
-   More details in Documentation/devicetree/bindings/gpio/gpio.txt.
- - st,bank-ioport: should correspond to the EXTI IOport selection (EXTI line
-   used to select GPIOs as interrupts).
- - hwlocks: reference to a phandle of a hardware spinlock provider node.
- - st,package: Indicates the SOC package used.
-   More details in include/dt-bindings/pinctrl/stm32-pinfunc.h
-
-Example 1:
-#include <dt-bindings/pinctrl/stm32f429-pinfunc.h>
-...
-
-	pin-controller {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "st,stm32f429-pinctrl";
-		ranges = <0 0x40020000 0x3000>;
-		pins-are-numbered;
-
-		gpioa: gpio@40020000 {
-			gpio-controller;
-			#gpio-cells = <2>;
-			reg = <0x0 0x400>;
-			resets = <&reset_ahb1 0>;
-			st,bank-name = "GPIOA";
-		};
-		...
-		pin-functions nodes follow...
-	};
-
-Example 2:
-#include <dt-bindings/pinctrl/stm32f429-pinfunc.h>
-...
-
-	pinctrl: pin-controller {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "st,stm32f429-pinctrl";
-		ranges = <0 0x40020000 0x3000>;
-		pins-are-numbered;
-
-		gpioa: gpio@40020000 {
-			gpio-controller;
-			#gpio-cells = <2>;
-			reg = <0x0 0x400>;
-			resets = <&reset_ahb1 0>;
-			st,bank-name = "GPIOA";
-			gpio-ranges = <&pinctrl 0 0 16>;
-		};
-
-		gpiob: gpio@40020400 {
-			gpio-controller;
-			#gpio-cells = <2>;
-			reg = <0x0 0x400>;
-			resets = <&reset_ahb1 0>;
-			st,bank-name = "GPIOB";
-			ngpios = 4;
-			gpio-ranges = <&pinctrl 0 16 3>,
-				      <&pinctrl 14 30 2>;
-		};
-
-
-		...
-		pin-functions nodes follow...
-	};
-
-
-Contents of function subnode node:
-----------------------------------
-Subnode format
-A pinctrl node should contain at least one subnode representing the
-pinctrl group available on the machine. Each subnode will list the
-pins it needs, and how they should be configured, with regard to muxer
-configuration, pullups, drive, output high/low and output speed.
-
-    node {
-	pinmux = <PIN_NUMBER_PINMUX>;
-	GENERIC_PINCONFIG;
-    };
-
-Required properties:
-- pinmux: integer array, represents gpio pin number and mux setting.
-  Supported pin number and mux varies for different SoCs, and are defined in
-  dt-bindings/pinctrl/<soc>-pinfunc.h directly.
-  These defines are calculated as:
-    ((port * 16 + line) << 8) | function
-  With:
-    - port: The gpio port index (PA = 0, PB = 1, ..., PK = 11)
-    - line: The line offset within the port (PA0 = 0, PA1 = 1, ..., PA15 = 15)
-    - function: The function number, can be:
-      * 0 : GPIO
-      * 1 : Alternate Function 0
-      * 2 : Alternate Function 1
-      * 3 : Alternate Function 2
-      * ...
-      * 16 : Alternate Function 15
-      * 17 : Analog
-
-  To simplify the usage, macro is available to generate "pinmux" field.
-  This macro is available here:
-    - include/dt-bindings/pinctrl/stm32-pinfunc.h
-
-  Some examples of using macro:
-    /* GPIO A9 set as alernate function 2 */
-    ... {
-		pinmux = <STM32_PINMUX('A', 9, AF2)>;
-    };
-    /* GPIO A9 set as GPIO  */
-    ... {
-		pinmux = <STM32_PINMUX('A', 9, GPIO)>;
-    };
-    /* GPIO A9 set as analog */
-    ... {
-		pinmux = <STM32_PINMUX('A', 9, ANALOG)>;
-    };
-
-Optional properties:
-- GENERIC_PINCONFIG: is the generic pinconfig options to use.
-  Available options are:
-   - bias-disable,
-   - bias-pull-down,
-   - bias-pull-up,
-   - drive-push-pull,
-   - drive-open-drain,
-   - output-low
-   - output-high
-   - slew-rate = <x>, with x being:
-       < 0 > : Low speed
-       < 1 > : Medium speed
-       < 2 > : Fast speed
-       < 3 > : High speed
-
-Example:
-
-pin-controller {
-...
-	usart1_pins_a: usart1@0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('A', 9, AF7)>;
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('A', 10, AF7)>;
-			bias-disable;
-		};
-	};
-};
-
-&usart1 {
-	pinctrl-0 = <&usart1_pins_a>;
-	pinctrl-names = "default";
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
new file mode 100644
index 0000000..fcceca0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -0,0 +1,271 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) STMicroelectronics 2019.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 GPIO and Pin Mux/Config controller
+
+maintainers:
+  - Alexandre TORGUE <alexandre.torgue@st.com>
+description: |
+  STMicroelectronics's STM32 MCUs intregrate a GPIO and Pin mux/config hardware
+  controller. It controls the input/output settings on the available pins and
+  also provides ability to multiplex and configure the output of various
+  on-chip controllers onto these pads.
+
+properties:
+  compatible:
+      items:
+        - enum:
+          - st,stm32f429-pinctrl
+          - st,stm32f469-pinctrl
+          - st,stm32f746-pinctrl
+          - st,stm32f769-pinctrl
+          - st,stm32h743-pinctrl
+          - st,stm32mp157-pinctrl
+          - st,stm32mp157-z-pinctrl
+
+  '#address-cells':
+    const: 1
+  '#size-cells':
+    const: 1
+    description:
+      Defines mapping between pin controller node (parent) to
+      gpio-bank node (children).
+
+  ranges:
+    description:
+      Defines mapping between pin controller node (parent) to
+      gpio-bank node (children).
+  pins-are-numbered:
+    description:
+      Specify the subnodes are using numbered pinmux to
+      specify pins.
+  st,syscfg:
+    description: |
+      Should be phandle/offset/mask:
+        - The phandle to the syscon node which includes IRQ mux selection register.
+        - The offset of the IRQ mux selection register
+        - The field mask of IRQ mux, needed if different of 0xf.
+
+  hwlocks:
+    description: Reference to a phandle of a hardware spinlock provider node.
+  st,package:
+    description:
+     Indicates the SOC package used.
+     More details in include/dt-bindings/pinctrl/stm32-pinfunc.h
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [1, 2, 4, 8]
+
+patternProperties:
+  '^gpio@[0-9a-z]*$':
+    properties:
+      gpio-controller:
+        description:
+          Indicates this device is a GPIO controller.
+      '#gpio-cells':
+        const: 2
+        description: |
+          The first cell is the pin number.
+          The second one is the polarity
+          * 0 for active high.
+          * 1 for active low.
+
+      reg:
+        description:
+          The gpio address range, relative to the pinctrl range.
+      clocks:
+        description:
+          Clock that drives this bank.
+      st,bank-name:
+        description:
+          Should be a name string for this bank as specified in the datasheet.
+      reset:
+        description:
+          Reference to the reset controller.
+      gpio-ranges:
+        description: |
+          Define a dedicated mapping between a pin-controller and
+          a gpio controller. Format is <&phandle a b c> with:
+          -(phandle): phandle of pin-controller.
+          -(a): gpio base offset in range.
+          -(b): pin base offset in range.
+          -(c): gpio count in range.
+          This entry has to be used either if there are holes inside a bank:
+          GPIOB0/B1/B2/B14/B15 (see example 2) or if banks are not contiguous:
+          GPIOA/B/C/E...
+          NOTE: If "gpio-ranges" is used for a gpio controller, all gpio-controller
+          have to use a "gpio-ranges" entry.
+          More details in Documentation/devicetree/bindings/gpio/gpio.txt.
+
+      ngpios:
+        description:
+          Number of available gpios in a bank.
+        minimum: 1
+        maximum: 16
+
+      st,bank-ioport:
+        description:
+          Should correspond to the EXTI IOport selection (EXTI line used
+          to select GPIOs as interrupts).
+
+    required:
+      - gpio-controller
+      - '#gpio-cells'
+      - reg
+      - clocks
+      - st,bank-name
+
+  '-[0-9]*$':
+    patternProperties:
+      '^pins':
+        description: |
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl group available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive, output high/low and output speed.
+        properties:
+          pinmux:
+            allOf:
+              - $ref: "/schemas/types.yaml#/definitions/uint32-array"
+            description: |
+              Integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux varies for different SoCs, and are
+              defined in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
+              These defines are calculated as: ((port * 16 + line) << 8) | function
+              With:
+              - port: The gpio port index (PA = 0, PB = 1, ..., PK = 11)
+              - line: The line offset within the port (PA0 = 0, PA1 = 1, ..., PA15 = 15)
+              - function: The function number, can be:
+              * 0 : GPIO
+              * 1 : Alternate Function 0
+              * 2 : Alternate Function 1
+              * 3 : Alternate Function 2
+              * ...
+              * 16 : Alternate Function 15
+              * 17 : Analog
+              To simplify the usage, macro is available to generate "pinmux" field.
+              This macro is available here:
+                - include/dt-bindings/pinctrl/stm32-pinfunc.h
+              Some examples of using macro:
+               /* GPIO A9 set as alernate function 2 */
+               ... {
+                          pinmux = <STM32_PINMUX('A', 9, AF2)>;
+               };
+               /* GPIO A9 set as GPIO  */
+               ... {
+                          pinmux = <STM32_PINMUX('A', 9, GPIO)>;
+               };
+               /* GPIO A9 set as analog */
+               ... {
+                          pinmux = <STM32_PINMUX('A', 9, ANALOG)>;
+               };
+
+          bias-disable:
+            type: boolean
+          bias-pull-down:
+            type: boolean
+          bias-pull-up:
+            type: boolean
+          drive-push-pull:
+            type: boolean
+          drive-open-drain:
+            type: boolean
+          output-low:
+            type: boolean
+          output-high:
+            type: boolean
+          slew-rate:
+            description: |
+              0: Low speed
+              1: Medium speed
+              2: Fast speed
+              3: High speed
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
+              - enum: [0, 1, 2, 3]
+
+        required:
+          - pinmux
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+  - pins-are-numbered
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/stm32-pinfunc.h>
+    //Example 1
+      pin-controller@40020000 {
+              #address-cells = <1>;
+              #size-cells = <1>;
+              compatible = "st,stm32f429-pinctrl";
+              ranges = <0 0x40020000 0x3000>;
+              pins-are-numbered;
+
+              gpioa: gpio@0 {
+                      gpio-controller;
+                      #gpio-cells = <2>;
+                      reg = <0x0 0x400>;
+                      resets = <&reset_ahb1 0>;
+                      st,bank-name = "GPIOA";
+              };
+       };
+
+    //Example 2 (using gpio-ranges)
+      pin-controller@50020000 {
+              #address-cells = <1>;
+              #size-cells = <1>;
+              compatible = "st,stm32f429-pinctrl";
+              ranges = <0 0x50020000 0x3000>;
+              pins-are-numbered;
+
+              gpiob: gpio@1000 {
+                      gpio-controller;
+                      #gpio-cells = <2>;
+                      reg = <0x1000 0x400>;
+                      resets = <&reset_ahb1 0>;
+                      st,bank-name = "GPIOB";
+                      gpio-ranges = <&pinctrl 0 0 16>;
+              };
+
+              gpioc: gpio@2000 {
+                      gpio-controller;
+                      #gpio-cells = <2>;
+                      reg = <0x2000 0x400>;
+                      resets = <&reset_ahb1 0>;
+                      st,bank-name = "GPIOC";
+                      ngpios = <5>;
+                      gpio-ranges = <&pinctrl 0 16 3>,
+                                    <&pinctrl 14 30 2>;
+              };
+      };
+
+    //Example 3 pin groups
+      pin-controller@60020000 {
+        usart1_pins_a: usart1-0 {
+                pins1 {
+                        pinmux = <STM32_PINMUX('A', 9, AF7)>;
+                        bias-disable;
+                        drive-push-pull;
+                        slew-rate = <0>;
+                };
+                pins2 {
+                        pinmux = <STM32_PINMUX('A', 10, AF7)>;
+                        bias-disable;
+                };
+        };
+    };
+
+    usart1 {
+                pinctrl-0 = <&usart1_pins_a>;
+                pinctrl-names = "default";
+    };
+
+...
-- 
2.7.4

