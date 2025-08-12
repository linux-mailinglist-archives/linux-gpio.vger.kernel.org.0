Return-Path: <linux-gpio+bounces-24321-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7D8B23A14
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 22:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B1C27B6150
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 20:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4EC2D323D;
	Tue, 12 Aug 2025 20:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9+JR9Qs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E627450;
	Tue, 12 Aug 2025 20:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755030824; cv=none; b=NYk8U03Bgjtm/PUlZwCooeQiiUzOZsZ/PztmkxQXTdNvHXtFY8QJuhlHaE/hIDCsIeGRHcVLZ0Q2piEmfY4yn4Vih4r7svAqu8i6A1Yrlw5L4v5P1/eKdE+BbuU7m6JH9qxVPCzzugU057utukUSOJPp2dJYX3dMSmjhsb0Px5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755030824; c=relaxed/simple;
	bh=zooOfB0tNT+jdYTga7tEZwavR+s9ns18YwK/qin3B8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GVEwSKUx4+BQm38Ah31ZSU0rlWyRnivwQbt6cMpjI1hDiBz27JldskpDSO4NZSgsOy/YOPD/OtGgTQaUzeBOxs0o5bC8JmXG1KAhKu1mHEVozgHfPmz5lPFLUqStai8uSJTnH70UJENjPP0UGuD/qCgMLW6hKiW2qprXyznxDNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9+JR9Qs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52336C4CEF4;
	Tue, 12 Aug 2025 20:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755030823;
	bh=zooOfB0tNT+jdYTga7tEZwavR+s9ns18YwK/qin3B8U=;
	h=From:To:Cc:Subject:Date:From;
	b=i9+JR9QshrKMHb4xOmwO+xcCnCZEviBAyaUE3Vm2MtX6Pkrisq52olA9UPMjk4/g5
	 p+PWGAgcsJG2AcdX7UmjD3TtSbSZ/r/ly++EhleRXkm3xzki2i9d56vIghjsCFFXpV
	 HIIA8DA4WRqb5KQnCi6E86BLvYmBPcVvjYEY+VoU6bFOBianacfVw6zp4ZiTLcxZp2
	 cYxvBmBfmaoAtaXmcXWSRYZsSeU6ul8v9Df6vud5iyJxsvPG8nlk2+rJkWg4FjzcF7
	 A/CrvLFHcoy/kpramWwOSA5dl6rg3plAM5IFPOgHORutnxJHXFXzXyiwuv441pacjn
	 8U1fAyN2SJ/uw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: Convert brcm,bcm2835-gpio to DT schema
Date: Tue, 12 Aug 2025 15:33:34 -0500
Message-ID: <20250812203337.731648-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the Broadcom BCM2835 GPIO (and pinmux) controller binding to DT
schema format.

The structure of the child nodes wasn't well defined. The schema is
based on the .dts users. The legacy binding is a single level of child
nodes while the standard binding is 2 levels of child nodes.

The "all banks" interrupt is treated as optional following actual users.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pinctrl/brcm,bcm2835-gpio.txt    |  99 ---------------
 .../bindings/pinctrl/brcm,bcm2835-gpio.yaml   | 120 ++++++++++++++++++
 2 files changed, 120 insertions(+), 99 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
deleted file mode 100644
index 5682b2010e50..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
+++ /dev/null
@@ -1,99 +0,0 @@
-Broadcom BCM2835 GPIO (and pinmux) controller
-
-The BCM2835 GPIO module is a combined GPIO controller, (GPIO) interrupt
-controller, and pinmux/control device.
-
-Required properties:
-- compatible: "brcm,bcm2835-gpio"
-- compatible: should be one of:
-  "brcm,bcm2835-gpio" - BCM2835 compatible pinctrl
-  "brcm,bcm7211-gpio" - BCM7211 compatible pinctrl
-  "brcm,bcm2711-gpio" - BCM2711 compatible pinctrl
-  "brcm,bcm7211-gpio" - BCM7211 compatible pinctrl
-- reg: Should contain the physical address of the GPIO module's registers.
-- gpio-controller: Marks the device node as a GPIO controller.
-- #gpio-cells : Should be two. The first cell is the pin number and the
-  second cell is used to specify optional parameters:
-  - bit 0 specifies polarity (0 for normal, 1 for inverted)
-- interrupts : The interrupt outputs from the controller. One interrupt per
-  individual bank followed by the "all banks" interrupt. For BCM7211, an
-  additional set of per-bank interrupt line and an "all banks" wake-up
-  interrupt may be specified.
-- interrupt-controller: Marks the device node as an interrupt controller.
-- #interrupt-cells : Should be 2.
-  The first cell is the GPIO number.
-  The second cell is used to specify flags:
-    bits[3:0] trigger type and level flags:
-      1 = low-to-high edge triggered.
-      2 = high-to-low edge triggered.
-      4 = active high level-sensitive.
-      8 = active low level-sensitive.
-    Valid combinations are 1, 2, 3, 4, 8.
-
-Please refer to ../gpio/gpio.txt for a general description of GPIO bindings.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-Each pin configuration node lists the pin(s) to which it applies, and one or
-more of the mux function to select on those pin(s), and pull-up/down
-configuration. Each subnode only affects those parameters that are explicitly
-listed. In other words, a subnode that lists only a mux function implies no
-information about any pull configuration. Similarly, a subnode that lists only
-a pul parameter implies no information about the mux function.
-
-The BCM2835 pin configuration and multiplexing supports the generic bindings.
-For details on each properties, you can refer to ./pinctrl-bindings.txt.
-
-Required sub-node properties:
-  - pins
-  - function
-
-Optional sub-node properties:
-  - bias-disable
-  - bias-pull-up
-  - bias-pull-down
-  - output-high
-  - output-low
-
-Legacy pin configuration and multiplexing binding:
-*** (Its use is deprecated, use generic multiplexing and configuration
-bindings instead)
-
-Required subnode-properties:
-- brcm,pins: An array of cells. Each cell contains the ID of a pin. Valid IDs
-  are the integer GPIO IDs; 0==GPIO0, 1==GPIO1, ... 53==GPIO53.
-
-Optional subnode-properties:
-- brcm,function: Integer, containing the function to mux to the pin(s):
-  0: GPIO in
-  1: GPIO out
-  2: alt5
-  3: alt4
-  4: alt0
-  5: alt1
-  6: alt2
-  7: alt3
-- brcm,pull: Integer, representing the pull-down/up to apply to the pin(s):
-  0: none
-  1: down
-  2: up
-
-Each of brcm,function and brcm,pull may contain either a single value which
-will be applied to all pins in brcm,pins, or 1 value for each entry in
-brcm,pins.
-
-Example:
-
-	gpio: gpio {
-		compatible = "brcm,bcm2835-gpio";
-		reg = <0x2200000 0xb4>;
-		interrupts = <2 17>, <2 19>, <2 18>, <2 20>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.yaml
new file mode 100644
index 000000000000..6514f347f6bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm2835-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835 GPIO (and pinmux) controller
+
+maintainers:
+  - Florian Fainelli <f.fainelli@gmail.com>
+
+description: >
+  The BCM2835 GPIO module is a combined GPIO controller, (GPIO) interrupt
+  controller, and pinmux/control device.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2835-gpio
+      - brcm,bcm2711-gpio
+      - brcm,bcm7211-gpio
+
+  reg:
+    maxItems: 1
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+  gpio-ranges: true
+  gpio-line-names: true
+
+  interrupts:
+    description: >
+      Interrupt outputs: one per bank, then the combined “all banks” line.
+      BCM7211 may specify up to four per-bank wake-up lines and one combined
+      wake-up interrupt.
+    minItems: 4
+    maxItems: 10
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupt-controller: true
+
+additionalProperties:
+  oneOf:
+    - type: object
+      additionalProperties: false
+
+      patternProperties:
+        '^pins?-':
+          type: object
+          allOf:
+            - $ref: /schemas/pinctrl/pincfg-node.yaml#
+            - $ref: /schemas/pinctrl/pinmux-node.yaml#
+          additionalProperties: false
+
+          properties:
+            pins: true
+            function: true
+            bias-disable: true
+            bias-pull-up: true
+            bias-pull-down: true
+            output-high: true
+            output-low: true
+
+          required:
+            - pins
+            - function
+
+    - type: object
+      additionalProperties: false
+      deprecated: true
+
+      properties:
+        brcm,pins:
+          description:
+            GPIO pin numbers for legacy configuration.
+          $ref: /schemas/types.yaml#/definitions/uint32-array
+
+        brcm,function:
+          description:
+            Legacy mux function for the pins (0=input, 1=output, 2–7=alt functions).
+          $ref: /schemas/types.yaml#/definitions/uint32-array
+          maximum: 7
+
+        brcm,pull:
+          description: >
+            Legacy pull setting for the pins (0=none, 1=pull-down, 2=pull-up).
+          $ref: /schemas/types.yaml#/definitions/uint32-array
+          maximum: 2
+
+      required:
+        - brcm,pins
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,bcm2835-gpio
+              - brcm,bcm2711-gpio
+    then:
+      properties:
+        interrupts:
+          maxItems: 5
+
+examples:
+  - |
+    gpio@2200000 {
+        compatible = "brcm,bcm2835-gpio";
+        reg = <0x2200000 0xb4>;
+        interrupts = <2 17>, <2 19>, <2 18>, <2 20>, <2 21>;
+        #gpio-cells = <2>;
+        gpio-controller;
+        #interrupt-cells = <2>;
+        interrupt-controller;
+    };
-- 
2.47.2


