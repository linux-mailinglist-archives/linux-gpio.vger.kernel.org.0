Return-Path: <linux-gpio+bounces-27118-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B13BDA72D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 17:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 05F8B547406
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E8230101D;
	Tue, 14 Oct 2025 15:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="stjGgtV3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76E03002B9;
	Tue, 14 Oct 2025 15:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455849; cv=none; b=Ub9OfkZkwvFCZwMLyNVnsWMR4GqhaYYTR8LWILKHDlGedG7M5O4BHH4q48WxpOVsFPCKvalbNQXGIA+bfx6ogRNLwtBdA+XRZOYdJ/hpAcWk8aFuFOIrggUES7t3OaEB/3LNJHAnhi5CqkJ9kPIXJ8pXqaD5XtPjuw536VeRvhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455849; c=relaxed/simple;
	bh=A5QbPcQmASszBH7eCjb9mxMsfoDfogo+3AvqiMDfHWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o76qMDtqy3tyqVcRMkwnA1BjgxkrXSuan4HHcwmgJH6mVnugS7k3jMB2RYpEp71tH5NqqctyihQKhScrPpbR1YA7QY9kTtCo9U4JKbgeUkRHceaWGzcJ5KdDZY73iD3aOdzENr9dxKL8ObrWjgaFZeaMn6I54qbT9LGk63DlGXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=stjGgtV3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13D7C4CEE7;
	Tue, 14 Oct 2025 15:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760455849;
	bh=A5QbPcQmASszBH7eCjb9mxMsfoDfogo+3AvqiMDfHWM=;
	h=From:To:Cc:Subject:Date:From;
	b=stjGgtV3EjIkrR1FlccLeyqPCBFg4cyc3VKA/I+ut0W9JBSSCBl+wVazwABDI4NRI
	 CWsaqjtYXgFdrUJysdicR5Zf5UU17ZYtbQXi8f6ZrFH2+/1mvJybGsCv0Fg52HxbuO
	 nq+TVqVNGqG970NY9UCDReT7arMQfXo8Qu30GbpQ0GYMNxmnEVdtIZfUvcwWz7zO2t
	 DnhwQGZTi1IPWd6Mi1RsFyIC7hKS7rRDcyc3zEorM2qVN0oN1L1mZ9kiW3baHxe02N
	 dfWAlyyL0oS1je3ODd/gYQ3TeIAFOXWc0ZTqLgGkD4MnigIaoI8cPPC3hdYEk1I+x0
	 /fVz1Kw0op2YQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: Convert Marvell AP80x System Controller to DT schema
Date: Tue, 14 Oct 2025 10:30:38 -0500
Message-ID: <20251014153040.3783896-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell AP80x System Controller binding to DT schema format.

There's not any specific compatible for the whole block which is a
separate problem, so just the child nodes are documented. Only the
pinctrl and clock child nodes need to be converted as the GPIO node
already has a schema.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../arm/marvell/ap80x-system-controller.txt   | 146 ------------------
 .../bindings/clock/marvell,ap80x-clock.yaml   |  54 +++++++
 .../pinctrl/marvell,ap806-pinctrl.yaml        |  61 ++++++++
 3 files changed, 115 insertions(+), 146 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt
 create mode 100644 Documentation/devicetree/bindings/clock/marvell,ap80x-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/marvell,ap806-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt
deleted file mode 100644
index 72de11bd2ef0..000000000000
--- a/Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt
+++ /dev/null
@@ -1,146 +0,0 @@
-Marvell Armada AP80x System Controller
-======================================
-
-The AP806/AP807 is one of the two core HW blocks of the Marvell Armada
-7K/8K/931x SoCs. It contains system controllers, which provide several
-registers giving access to numerous features: clocks, pin-muxing and
-many other SoC configuration items. This DT binding allows to describe
-these system controllers.
-
-For the top level node:
- - compatible: must be: "syscon", "simple-mfd";
- - reg: register area of the AP80x system controller
-
-SYSTEM CONTROLLER 0
-===================
-
-Clocks:
--------
-
-
-The Device Tree node representing the AP806/AP807 system controller
-provides a number of clocks:
-
- - 0: reference clock of CPU cluster 0
- - 1: reference clock of CPU cluster 1
- - 2: fixed PLL at 1200 Mhz
- - 3: MSS clock, derived from the fixed PLL
-
-Required properties:
-
- - compatible: must be one of:
-   * "marvell,ap806-clock"
-   * "marvell,ap807-clock"
- - #clock-cells: must be set to 1
-
-Pinctrl:
---------
-
-For common binding part and usage, refer to
-Documentation/devicetree/bindings/pinctrl/marvell,mvebu-pinctrl.txt.
-
-Required properties:
-- compatible must be "marvell,ap806-pinctrl",
-
-Available mpp pins/groups and functions:
-Note: brackets (x) are not part of the mpp name for marvell,function and given
-only for more detailed description in this document.
-
-name	pins	functions
-================================================================================
-mpp0	0	gpio, sdio(clk), spi0(clk)
-mpp1	1	gpio, sdio(cmd), spi0(miso)
-mpp2	2	gpio, sdio(d0), spi0(mosi)
-mpp3	3	gpio, sdio(d1), spi0(cs0n)
-mpp4	4	gpio, sdio(d2), i2c0(sda)
-mpp5	5	gpio, sdio(d3), i2c0(sdk)
-mpp6	6	gpio, sdio(ds)
-mpp7	7	gpio, sdio(d4), uart1(rxd)
-mpp8	8	gpio, sdio(d5), uart1(txd)
-mpp9	9	gpio, sdio(d6), spi0(cs1n)
-mpp10	10	gpio, sdio(d7)
-mpp11	11	gpio, uart0(txd)
-mpp12	12	gpio, sdio(pw_off), sdio(hw_rst)
-mpp13	13	gpio
-mpp14	14	gpio
-mpp15	15	gpio
-mpp16	16	gpio
-mpp17	17	gpio
-mpp18	18	gpio
-mpp19	19	gpio, uart0(rxd), sdio(pw_off)
-
-GPIO:
------
-For common binding part and usage, refer to
-Documentation/devicetree/bindings/gpio/gpio-mvebu.yaml.
-
-Required properties:
-
-- compatible: "marvell,armada-8k-gpio"
-
-- offset: offset address inside the syscon block
-
-Optional properties:
-
-- marvell,pwm-offset: offset address of PWM duration control registers inside
-  the syscon block
-
-Example:
-ap_syscon: system-controller@6f4000 {
-	compatible = "syscon", "simple-mfd";
-	reg = <0x6f4000 0x1000>;
-
-	ap_clk: clock {
-		compatible = "marvell,ap806-clock";
-		#clock-cells = <1>;
-	};
-
-	ap_pinctrl: pinctrl {
-		compatible = "marvell,ap806-pinctrl";
-	};
-
-	ap_gpio: gpio {
-		compatible = "marvell,armada-8k-gpio";
-		offset = <0x1040>;
-		ngpios = <19>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-ranges = <&ap_pinctrl 0 0 19>;
-		marvell,pwm-offset = <0x10c0>;
-		#pwm-cells = <2>;
-		clocks = <&ap_clk 3>;
-	};
-};
-
-SYSTEM CONTROLLER 1
-===================
-
-Cluster clocks:
----------------
-
-Device Tree Clock bindings for cluster clock of Marvell
-AP806/AP807. Each cluster contain up to 2 CPUs running at the same
-frequency.
-
-Required properties:
- - compatible: must be one of:
-   * "marvell,ap806-cpu-clock"
-   * "marvell,ap807-cpu-clock"
-- #clock-cells : should be set to 1.
-
-- clocks : shall be the input parent clock(s) phandle for the clock
-           (one per cluster)
-
-- reg: register range associated with the cluster clocks
-
-ap_syscon1: system-controller@6f8000 {
-	compatible = "marvell,armada-ap806-syscon1", "syscon", "simple-mfd";
-	reg = <0x6f8000 0x1000>;
-
-	cpu_clk: clock-cpu@278 {
-		compatible = "marvell,ap806-cpu-clock";
-		clocks = <&ap_clk 0>, <&ap_clk 1>;
-		#clock-cells = <1>;
-		reg = <0x278 0xa30>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/marvell,ap80x-clock.yaml b/Documentation/devicetree/bindings/clock/marvell,ap80x-clock.yaml
new file mode 100644
index 000000000000..43b0631ba167
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/marvell,ap80x-clock.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/marvell,ap80x-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada AP80x System Controller Clocks
+
+maintainers:
+  - Gregory Clement <gregory.clement@bootlin.com>
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+description: >
+  The AP806/AP807 is one of the two core HW blocks of the Marvell Armada
+  7K/8K/931x SoCs. It contains system controllers, which provide several
+  registers giving access to numerous features: clocks, pin-muxing and many
+  other SoC configuration items.
+
+properties:
+  compatible:
+    enum:
+      - marvell,ap806-clock
+      - marvell,ap806-cpu-clock
+      - marvell,ap807-clock
+      - marvell,ap807-cpu-clock
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    items:
+      - description: cluster 0 parent clock phandle
+      - description: cluster 1 parent clock phandle
+
+required:
+  - compatible
+  - "#clock-cells"
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - marvell,ap806-cpu-clock
+              - marvell,ap807-cpu-clock
+    then:
+      required:
+        - clocks
diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,ap806-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/marvell,ap806-pinctrl.yaml
new file mode 100644
index 000000000000..00a7e358a8c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,ap806-pinctrl.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/marvell,ap806-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell AP806 pin controller
+
+maintainers:
+  - Gregory Clement <gregory.clement@bootlin.com>
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+properties:
+  compatible:
+    const: marvell,ap806-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    properties:
+      marvell,function:
+        $ref: /schemas/types.yaml#/definitions/string
+        description:
+          Indicates the function to select.
+        enum: [ gpio, i2c0, sdio, spi0, uart0, uart1 ]
+
+      marvell,pins:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description:
+          Array of MPP pins to be used for the given function.
+        minItems: 1
+        maxItems: 20
+        items:
+          enum: [
+            mpp0, mpp1, mpp2, mpp3, mpp4, mpp5, mpp6, mpp7, mpp8, mpp9, mpp10,
+            mpp11, mpp12, mpp13, mpp14, mpp15, mpp16, mpp17, mpp18, mpp19
+          ]
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl {
+        compatible = "marvell,ap806-pinctrl";
+
+        uart0_pins: uart0-pins {
+            marvell,pins = "mpp11", "mpp19";
+            marvell,function = "uart0";
+        };
+    };
-- 
2.51.0


