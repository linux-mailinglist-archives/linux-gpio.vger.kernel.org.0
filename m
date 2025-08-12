Return-Path: <linux-gpio+bounces-24322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E7EB23A11
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 22:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFB743B4924
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 20:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D244D2D738C;
	Tue, 12 Aug 2025 20:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbnzfOGA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3BE2C21E2;
	Tue, 12 Aug 2025 20:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755030832; cv=none; b=ZxHFjo2/nW4q5h3PSN8edO+lY/K4OpKjGt5yb0ZQP2gA/churGrURG5ywc+LUmveu+jNVpPWAdHIWMxmDoopLOMfdj5zx3HwDOYcVYA9UywpBmiqrEz4HZYtpdyYagzlkTY6P6IzKtb41o/FxFN1OMAezsQfA3DYK/4CyyXwQPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755030832; c=relaxed/simple;
	bh=mWhbbcbduLWHpW3yyWfH8Gm+wrKvibaa+3ueYfo3yAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bkd3sugaZ2QDtBIDSddRFkIkXxWENoPl/SfftdKumGT/REQMm5TAa0DiXFXrsHVtyUCMgqVLbWsgrzpRlwX+rBuGO9o9NS8BU5Iah2K07UURz26UgUaWR7g1fYJsCarljxGX6v1DL08vkXOOYuHUn/0WvhBNpqdP1BHtVNsPot4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbnzfOGA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD36C4CEF1;
	Tue, 12 Aug 2025 20:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755030832;
	bh=mWhbbcbduLWHpW3yyWfH8Gm+wrKvibaa+3ueYfo3yAE=;
	h=From:To:Cc:Subject:Date:From;
	b=LbnzfOGAz5/fsL/OZLsczEK36ca7W3f9wRPBcMeQPBzjyrOjZB8Yo+zO58AcrBRJG
	 JdCwruN1IMlLggsci/6cMvkzmWXGhw+n77p8SEGr6NNkYa1lgNSZwulr2MOuTjTcJQ
	 fl3yYPWsuOqglY1ivfH5H7PokOH0/dbx2fs7dtMom/t1o1kwiv3MC+wSpkPPO8UM/o
	 q7i+HZbMflfDL8NJds/ugLVZrArnavQeAv9iMqARw3Vfcctyr6NRZCO4y2nkDbhjk/
	 h3862VtxwnLF9e8eQLCweQpcWTWVdq94Z3uOjU/UxLAOcyxYDE+wnRb8uih6m/LDqF
	 CZZSwcuUKOtnA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: Convert brcm,iproc-gpio to DT schema
Date: Tue, 12 Aug 2025 15:33:47 -0500
Message-ID: <20250812203348.733749-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Broadcom iProc/Cygnus GPIO/Pinconf binding to DT schema
format.

The child node structure is based on the example as there's not any
actual .dts files with child nodes.

The binding wasn't clear that "reg" can be 1 or 2 entries. The number of
"reg" entries doesn't appear to be based on compatible, so no per
compatible constraints for it

The "brcm,iproc-stingray-gpio" could possibly be dropped. There are no
.dts files using it, but the driver uses it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pinctrl/brcm,iproc-gpio.txt      | 123 ------------------
 .../bindings/pinctrl/brcm,iproc-gpio.yaml     | 111 ++++++++++++++++
 2 files changed, 111 insertions(+), 123 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
deleted file mode 100644
index a73cbeb0f309..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
+++ /dev/null
@@ -1,123 +0,0 @@
-Broadcom iProc GPIO/PINCONF Controller
-
-Required properties:
-
-- compatible:
-    "brcm,iproc-gpio" for the generic iProc based GPIO controller IP that
-    supports full-featured pinctrl and GPIO functions used in various iProc
-    based SoCs
-
-    May contain an SoC-specific compatibility string to accommodate any
-    SoC-specific features
-
-    "brcm,cygnus-ccm-gpio", "brcm,cygnus-asiu-gpio", or
-    "brcm,cygnus-crmu-gpio" for Cygnus SoCs
-
-    "brcm,iproc-nsp-gpio" for the iProc NSP SoC that has drive strength support
-    disabled
-
-    "brcm,iproc-stingray-gpio" for the iProc Stingray SoC that has the general
-    pinctrl support completely disabled in this IP block. In Stingray, a
-    different IP block is used to handle pinctrl related functions
-
-- reg:
-    Define the base and range of the I/O address space that contains SoC
-GPIO/PINCONF controller registers
-
-- ngpios:
-    Total number of in-use slots in GPIO controller
-
-- #gpio-cells:
-    Must be two. The first cell is the GPIO pin number (within the
-controller's pin space) and the second cell is used for the following:
-    bit[0]: polarity (0 for active high and 1 for active low)
-
-- gpio-controller:
-    Specifies that the node is a GPIO controller
-
-Optional properties:
-
-- interrupts:
-    Interrupt ID
-
-- interrupt-controller:
-    Specifies that the node is an interrupt controller
-
-- gpio-ranges:
-    Specifies the mapping between gpio controller and pin-controllers pins.
-    This requires 4 fields in cells defined as -
-    1. Phandle of pin-controller.
-    2. GPIO base pin offset.
-    3  Pin-control base pin offset.
-    4. number of gpio pins which are linearly mapped from pin base.
-
-Supported generic PINCONF properties in child nodes:
-
-- pins:
-    The list of pins (within the controller's own pin space) that properties
-in the node apply to. Pin names are "gpio-<pin>"
-
-- bias-disable:
-    Disable pin bias
-
-- bias-pull-up:
-    Enable internal pull up resistor
-
-- bias-pull-down:
-    Enable internal pull down resistor
-
-- drive-strength:
-    Valid drive strength values include 2, 4, 6, 8, 10, 12, 14, 16 (mA)
-
-Example:
-	gpio_ccm: gpio@1800a000 {
-		compatible = "brcm,cygnus-ccm-gpio";
-		reg = <0x1800a000 0x50>,
-		      <0x0301d164 0x20>;
-		ngpios = <24>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-controller;
-
-		touch_pins: touch_pins {
-			pwr: pwr {
-				pins = "gpio-0";
-				drive-strength = <16>;
-			};
-
-			event: event {
-				pins = "gpio-1";
-				bias-pull-up;
-			};
-		};
-	};
-
-	gpio_asiu: gpio@180a5000 {
-		compatible = "brcm,cygnus-asiu-gpio";
-		reg = <0x180a5000 0x668>;
-		ngpios = <146>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-controller;
-		gpio-ranges = <&pinctrl 0 42 1>,
-				<&pinctrl 1 44 3>;
-	};
-
-	/*
-	 * Touchscreen that uses the CCM GPIO 0 and 1
-	 */
-	tsc {
-		...
-		...
-		gpio-pwr = <&gpio_ccm 0 0>;
-		gpio-event = <&gpio_ccm 1 0>;
-	};
-
-	/* Bluetooth that uses the ASIU GPIO 5, with polarity inverted */
-	bluetooth {
-		...
-		...
-		bcm,rfkill-bank-sel = <&gpio_asiu 5 1>
-	}
diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.yaml
new file mode 100644
index 000000000000..a0ed308b7fc8
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,iproc-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom iProc GPIO/PINCONF Controller
+
+maintainers:
+  - Ray Jui <rjui@broadcom.com>
+  - Scott Branden <sbranden@broadcom.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - brcm,cygnus-asiu-gpio
+          - brcm,cygnus-ccm-gpio
+          - brcm,cygnus-crmu-gpio
+          - brcm,iproc-gpio
+          - brcm,iproc-stingray-gpio
+      - items:
+          - enum:
+              - brcm,iproc-hr2-gpio
+              - brcm,iproc-nsp-gpio
+          - const: brcm,iproc-gpio
+
+  reg:
+    minItems: 1
+    items:
+      - description: GPIO Bank registers
+      - description: IO Ctrl registers
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  gpio-ranges: true
+
+  ngpios: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+  - ngpios
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties:
+      description: Pin configuration child nodes.
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+      additionalProperties: false
+
+      properties:
+        pins:
+          items:
+            pattern: '^gpio-'
+
+        bias-disable: true
+        bias-pull-up: true
+        bias-pull-down: true
+
+        drive-strength:
+          enum: [ 2, 4, 6, 8, 10, 12, 14, 16 ]
+
+      required:
+        - pins
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpio@1800a000 {
+        compatible = "brcm,cygnus-ccm-gpio";
+        reg = <0x1800a000 0x50>,
+              <0x0301d164 0x20>;
+        ngpios = <24>;
+        #gpio-cells = <2>;
+        gpio-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+
+        touch-pins {
+            pwr {
+                pins = "gpio-0";
+                drive-strength = <16>;
+            };
+
+            event {
+                pins = "gpio-1";
+                bias-pull-up;
+            };
+        };
+    };
-- 
2.47.2


