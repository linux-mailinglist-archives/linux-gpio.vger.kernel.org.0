Return-Path: <linux-gpio+bounces-26563-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B837BB9C5DB
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 00:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7422F3B3904
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 22:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2418128FFE7;
	Wed, 24 Sep 2025 22:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoiriY6u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C221F20ED;
	Wed, 24 Sep 2025 22:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758753343; cv=none; b=aTMwrYvA1OAq6P8kpBEGyrdpYCfbuk8Cvt9QYVQqU0hWj1DgGJt4BrDEjzYPwa1g5PYlEVEUN2rW9qSsX7d61EkMxWA+a6WU/oFPvOl6Du3drqi+lNYnrW9K8OmIiLgzmtXxvJuHfSmWlPTQXDcTygRDWrtqIAd1RgbNkOmnHQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758753343; c=relaxed/simple;
	bh=3Ex+V1Ie87FN4Vvd1EZuxNFHsXQdxCqHhnJs0XOMjio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CWHTfLr12vqtn4XyYmFchf8KIG+FD4xsn1LoWRa6Gu7RwsYga3UcqJa0Y84ietiWrViIGGzkbvuLk1oMGt7vsMrvBsamP8wA4/1V6uQoKz70DljrDPND2wEMHS+gC5QNOHN2QtrnZnzTH9UUlTu7TR0ZwgfXjDckZqcQULnQFKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoiriY6u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E28C4CEE7;
	Wed, 24 Sep 2025 22:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758753343;
	bh=3Ex+V1Ie87FN4Vvd1EZuxNFHsXQdxCqHhnJs0XOMjio=;
	h=From:To:Cc:Subject:Date:From;
	b=aoiriY6ugUdTOFG9a76NmggTDcZ3X5LDPgGMVKaAfR8tXOlyn363WkDJn0vivysz2
	 KolXKUJeSCYYRB3FRZeYBbBcNKpvZBCNzRqRxaWA1w7zf6Qy2U1lNRf8dG8tXgWroT
	 cuz5KZtu05H2uS7sPuPLi13nOblU9HYCDDpUm1MDgEb/NABjFz15OT66sIiA7764eE
	 OL/UFKJe4LxDvXZy5xUPS2SYpmsY1kMhew5Ci1DW6lpvTkyWZw20XbAySQ9vE5EM6h
	 LRBJvijmg349RSVP2CLsbsC4olSRZ9KncRk6xJzrYhtS3Bdgeyty+B3VYdgYKxGimn
	 WLGRDrsw43N6Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: Convert marvell,armada-3710-(sb|nb)-pinctrl to DT schema
Date: Wed, 24 Sep 2025 17:35:24 -0500
Message-ID: <20250924223528.2956771-1-robh@kernel.org>
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

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/armada3700-xtal-clock.txt  |  29 ---
 .../marvell,armada-3710-xb-pinctrl.yaml       | 122 +++++++++++
 .../pinctrl/marvell,armada-37xx-pinctrl.txt   | 195 ------------------
 3 files changed, 122 insertions(+), 224 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/marvell,armada-3710-xb-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt

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
diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,armada-3710-xb-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/marvell,armada-3710-xb-pinctrl.yaml
new file mode 100644
index 000000000000..c4d09d8720bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,armada-3710-xb-pinctrl.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/marvell,armada-3710-xb-pinctrl.yaml#
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
+            interrupts =
+                <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+                <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
+                <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
+                <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+                <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
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
-- 
2.51.0


