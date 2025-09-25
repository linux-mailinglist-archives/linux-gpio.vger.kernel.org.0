Return-Path: <linux-gpio+bounces-26605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68351BA1C54
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 00:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75FAD1C27969
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 22:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6664E2868AC;
	Thu, 25 Sep 2025 22:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncMQ1buN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0612F2B9BA;
	Thu, 25 Sep 2025 22:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758838785; cv=none; b=lBVcNAmpW50u762fu60Uzc8+P8SAXihn8nmPmZQtQrZNPZ+vPftgQ8Bu0ilPpVjj4TUBcHUQQWHs/K7v2ZLLqDnNUl2INkuoBC6P01FgAErgItePLhpjtbcbaz8dtApYtp182LbsetdFynUhvUcKrTfr3EuW7ZM9t2DXCx5B+tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758838785; c=relaxed/simple;
	bh=KrN/Ds6ZRfYcZkC2lZJ1BbBIHdOPg/S1pElf4TvWoN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WkUIp1ipRq2QL5m9mQ5U5JGodg0XgvUIDFUaZbdNp5TK6xIBfdAhuycQKMs6KhkUfTlWj+4tCTzWUSsv4xAJIv+w+1aWabDkO8Yj9taEXp4bNUerV6hJvq+NfHAIBK9ObAmNf753TFH78D/UbRBVFIj3t/Ea93xPoZ8Vyt/O5u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncMQ1buN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE20DC4CEF0;
	Thu, 25 Sep 2025 22:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758838784;
	bh=KrN/Ds6ZRfYcZkC2lZJ1BbBIHdOPg/S1pElf4TvWoN0=;
	h=From:To:Cc:Subject:Date:From;
	b=ncMQ1buNE6EhgRLzk730zz3kuy6scX46blqf7+NwojdSeGzPOiBWu2sy0oGbWTluG
	 CYSlSOL38L5Tren8JWhEBSzuGZ+KuU28zRrHXKkln6zZMUt3YZ03k2Cf4NdipPNTl7
	 pFVBp+cq+GUx77EW8m+W7ewjyuqdVJAF8gyUFk7PLibH7p8TeIaAutPaR7YYIwcCTD
	 v1+0aQbGXqu3MrTSUaqK8o6jzy64FdskvPYcsFkN8uDtM8hTyD/TQOKSNn4HB980DU
	 5o7kRy4+UvbQnh++qep6mmweDqgoWZMegECLN0T7bFR8WWRa6ZovUdyNjrqIkBzrXr
	 YYobDbXX1c30Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2] dt-bindings: pinctrl: Convert marvell,armada-3710-(sb|nb)-pinctrl to DT schema
Date: Thu, 25 Sep 2025 17:18:50 -0500
Message-ID: <20250925221927.2610760-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the marvell,armada3710-(sb|nb)-pinctrl binding to DT schema
format. The binding includes the "marvell,armada-3700-xtal-clock"
subnode which is simple enough to include here.

Mark interrupt-controller/#interrupt-cells as required as the users have
them and the h/w is either capable of interrupts or not.

As this syscon has 2 register ranges, syscon-common.yaml needs to be
updated to drop the restriction of 1 register entry.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/armada3700-xtal-clock.txt  |  29 ---
 .../bindings/mfd/syscon-common.yaml           |   3 -
 .../pinctrl/marvell,armada-37xx-pinctrl.txt   | 195 ------------------
 .../marvell,armada3710-xb-pinctrl.yaml        | 124 +++++++++++
 4 files changed, 124 insertions(+), 227 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/marvell,armada3710-xb-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt b/Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
deleted file mode 100644
index 4c0807f28cfa..000000000000
--- a/Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-* Xtal Clock bindings for Marvell Armada 37xx SoCs
-
-Marvell Armada 37xx SoCs allow to determine the xtal clock frequencies by
-reading the gpio latch register.
-
-This node must be a subnode of the node exposing the register address
-of the GPIO block where the gpio latch is located.
-See Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt
-
-Required properties:
-- compatible : shall be one of the following:
-	"marvell,armada-3700-xtal-clock"
-- #clock-cells : from common clock binding; shall be set to 0
-
-Optional properties:
-- clock-output-names : from common clock binding; allows overwrite default clock
-	output names ("xtal")
-
-Example:
-pinctrl_nb: pinctrl-nb@13800 {
-	compatible = "armada3710-nb-pinctrl", "syscon", "simple-mfd";
-	reg = <0x13800 0x100>, <0x13C00 0x20>;
-
-	xtalclk: xtal-clk {
-		compatible = "marvell,armada-3700-xtal-clock";
-		clock-output-names = "xtal";
-		#clock-cells = <0>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
index 451cbad467a3..14a08e7bc8bd 100644
--- a/Documentation/devicetree/bindings/mfd/syscon-common.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
@@ -35,9 +35,6 @@ properties:
     minItems: 2
     maxItems: 5  # Should be enough
 
-  reg:
-    maxItems: 1
-
   reg-io-width:
     description:
       The size (in bytes) of the IO accesses that should be performed
diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt
deleted file mode 100644
index ecec514b3155..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt
+++ /dev/null
@@ -1,195 +0,0 @@
-* Marvell Armada 37xx SoC pin and gpio controller
-
-Each Armada 37xx SoC come with two pin and gpio controller one for the
-south bridge and the other for the north bridge.
-
-Inside this set of register the gpio latch allows exposing some
-configuration of the SoC and especially the clock frequency of the
-xtal. Hence, this node is a represent as syscon allowing sharing the
-register between multiple hardware block.
-
-GPIO and pin controller:
-------------------------
-
-Main node:
-
-Refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning
-of the phrase "pin configuration node".
-
-Required properties for pinctrl driver:
-
-- compatible:	"marvell,armada3710-sb-pinctrl", "syscon, "simple-mfd"
-		for the south bridge
-		"marvell,armada3710-nb-pinctrl", "syscon, "simple-mfd"
-		for the north bridge
-- reg: The first set of register are for pinctrl/gpio and the second
-  set for the interrupt controller
-- interrupts: list of the interrupt use by the gpio
-
-Available groups and functions for the North bridge:
-
-group: jtag
- - pins 20-24
- - functions jtag, gpio
-
-group sdio0
- - pins 8-10
- - functions sdio, gpio
-
-group emmc_nb
- - pins 27-35
- - functions emmc, gpio
-
-group pwm0
- - pin 11 (GPIO1-11)
- - functions pwm, led, gpio
-
-group pwm1
- - pin 12
- - functions pwm, led, gpio
-
-group pwm2
- - pin 13
- - functions pwm, led, gpio
-
-group pwm3
- - pin 14
- - functions pwm, led, gpio
-
-group pmic1
- - pin 7
- - functions pmic, gpio
-
-group pmic0
- - pin 6
- - functions pmic, gpio
-
-group i2c2
- - pins 2-3
- - functions i2c, gpio
-
-group i2c1
- - pins 0-1
- - functions i2c, gpio
-
-group spi_cs1
- - pin 17
- - functions spi, gpio
-
-group spi_cs2
- - pin 18
- - functions spi, gpio
-
-group spi_cs3
- - pin 19
- - functions spi, gpio
-
-group onewire
- - pin 4
- - functions onewire, gpio
-
-group uart1
- - pins 25-26
- - functions uart, gpio
-
-group spi_quad
- - pins 15-16
- - functions spi, gpio
-
-group uart2
- - pins 9-10 and 18-19
- - functions uart, gpio
-
-Available groups and functions for the South bridge:
-
-group usb32_drvvbus0
- - pin 36
- - functions drvbus, gpio
-
-group usb2_drvvbus1
- - pin 37
- - functions drvbus, gpio
-
-group sdio_sb
- - pins 60-65
- - functions sdio, gpio
-
-group rgmii
- - pins 42-53
- - functions mii, gpio
-
-group pcie1
- - pins 39
- - functions pcie, gpio
-
-group pcie1_clkreq
- - pins 40
- - functions pcie, gpio
-
-group pcie1_wakeup
- - pins 41
- - functions pcie, gpio
-
-group smi
- - pins 54-55
- - functions smi, gpio
-
-group ptp
- - pins 56
- - functions ptp, gpio
-
-group ptp_clk
- - pin 57
- - functions ptp, mii
-
-group ptp_trig
- - pin 58
- - functions ptp, mii
-
-group mii_col
- - pin 59
- - functions mii, mii_err
-
-GPIO subnode:
-
-Please refer to gpio.txt in this directory for details of gpio-ranges property
-and the common GPIO bindings used by client devices.
-
-Required properties for gpio driver under the gpio subnode:
-- interrupts: List of interrupt specifier for the controllers interrupt.
-- gpio-controller: Marks the device node as a gpio controller.
-- #gpio-cells: Should be 2. The first cell is the GPIO number and the
-   second cell specifies GPIO flags, as defined in
-   <dt-bindings/gpio/gpio.h>. Only the GPIO_ACTIVE_HIGH and
-   GPIO_ACTIVE_LOW flags are supported.
-- gpio-ranges: Range of pins managed by the GPIO controller.
-
-Xtal Clock bindings for Marvell Armada 37xx SoCs
-------------------------------------------------
-
-see Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
-
-
-Example:
-pinctrl_sb: pinctrl-sb@18800 {
-	compatible = "marvell,armada3710-sb-pinctrl", "syscon", "simple-mfd";
-	reg = <0x18800 0x100>, <0x18C00 0x20>;
-	gpio {
-		#gpio-cells = <2>;
-		gpio-ranges = <&pinctrl_sb 0 0 29>;
-		gpio-controller;
-		interrupts =
-		<GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
-		<GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
-		<GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
-		<GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
-		<GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
-	};
-
-	rgmii_pins: mii-pins {
-		groups = "rgmii";
-		function = "mii";
-	};
-
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,armada3710-xb-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/marvell,armada3710-xb-pinctrl.yaml
new file mode 100644
index 000000000000..51bad2e8d6f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,armada3710-xb-pinctrl.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/marvell,armada3710-xb-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 37xx SoC pin and gpio controller
+
+maintainers:
+  - Gregory CLEMENT <gregory.clement@bootlin.com>
+  - Marek Behún <kabel@kernel.org>
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+description: >
+  Each Armada 37xx SoC come with two pin and gpio controller one for the south
+  bridge and the other for the north bridge.
+
+  Inside this set of register the gpio latch allows exposing some configuration
+  of the SoC and especially the clock frequency of the xtal. Hence, this node is
+  a represent as syscon allowing sharing the register between multiple hardware
+  block.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - marvell,armada3710-sb-pinctrl
+          - marvell,armada3710-nb-pinctrl
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    items:
+      - description: pinctrl and GPIO controller registers
+      - description: interrupt controller registers
+
+  gpio:
+    description: GPIO controller subnode
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#gpio-cells':
+        const: 2
+
+      gpio-controller: true
+
+      gpio-ranges:
+        description: Range of pins managed by the GPIO controller
+
+      '#interrupt-cells':
+        const: 2
+
+      interrupt-controller: true
+
+      interrupts:
+        description: List of interrupt specifiers for the GPIO controller
+
+    required:
+      - '#gpio-cells'
+      - gpio-ranges
+      - gpio-controller
+      - '#interrupt-cells'
+      - interrupt-controller
+      - interrupts
+
+  xtal-clk:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: marvell,armada-3700-xtal-clock
+
+      '#clock-cells':
+        const: 0
+
+      clock-output-names: true
+
+patternProperties:
+  '-pins$':
+    $ref: pinmux-node.yaml#
+    additionalProperties: false
+
+    properties:
+      groups:
+        enum: [ emmc_nb, i2c1, i2c2, jtag, mii_col, onewire, pcie1,
+                pcie1_clkreq, pcie1_wakeup, pmic0, pmic1, ptp, ptp_clk,
+                ptp_trig, pwm0, pwm1, pwm2, pwm3, rgmii, sdio0, sdio_sb, smi,
+                spi_cs1, spi_cs2, spi_cs3, spi_quad, uart1, uart2,
+                usb2_drvvbus1, usb32_drvvbus ]
+
+      function:
+        enum: [ drvbus, emmc, gpio, i2c, jtag, led, mii, mii_err, onewire,
+                pcie, pmic, ptp, pwm, sdio, smi, spi, uart ]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl_sb: pinctrl@18800 {
+        compatible = "marvell,armada3710-sb-pinctrl", "syscon", "simple-mfd";
+        reg = <0x18800 0x100>, <0x18C00 0x20>;
+
+        gpio {
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_sb 0 0 29>;
+            gpio-controller;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+            interrupts =
+                <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+                <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
+                <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
+                <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+                <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
-- 
2.51.0


