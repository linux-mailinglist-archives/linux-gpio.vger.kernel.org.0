Return-Path: <linux-gpio+bounces-23241-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CF5B04883
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 22:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 628637A81BA
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 20:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE57727A107;
	Mon, 14 Jul 2025 20:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVFn0NAY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B0D25A65A;
	Mon, 14 Jul 2025 20:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524926; cv=none; b=enjvl2dK+YxTKjkzZxRhOoHY5gQlZdUKCdA0gtkZK+ikCsIbm/0Zf+ib7fwu1JfQewJmhH/QXKqnQe8EoAegABHjKIqv0BVySpK0JWON2zLxcVvtALeIoFzbRMCHZNpEq/l+EfUufvprHN1Inho+SkJ1Sv+WgwpwS6G+R1lc9RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524926; c=relaxed/simple;
	bh=uo2q/5pQ1zJdZyjcJ9AxyXbq4sdhhFtUtELFQrXtiXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sDCfflpApB3AfcOO1JsqEIp8tKbzIbFO8tW6xX7gtdx2Neqx8W6HpDA1kEavOkXwRVEoX/UVpTShFQ4Kn98VxM4VCJYq8aoj+deTN/lJpJYKX2M89nDAFCGTSz4rq8JLzsaWkQq18Ts0jPs+izZWp3A8Ho0xdW03gge7taBhA1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVFn0NAY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8787C4CEED;
	Mon, 14 Jul 2025 20:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524926;
	bh=uo2q/5pQ1zJdZyjcJ9AxyXbq4sdhhFtUtELFQrXtiXE=;
	h=From:To:Cc:Subject:Date:From;
	b=fVFn0NAYFtCp0vRKW6+utJoZptb16RW3kpr30j3NbYV3XRdt2/WC6m1y+6Tz07iI+
	 GdnNOCn3UoDqUWlTZS4j5ENJ8mKIKjRM6gMlsxnjjWtlOc4hExeYnKc8fIx9qSfnFA
	 RqmarDcMcFuPQvYpxjXagdNk2H96i9Q1dQEi3fV7oB+S7TAz/N8hA0gpilxZw0LPYb
	 skqhSjV6BeQesEYqJ/g05Vp9YL0UgMyroEv720SrO2q8xr8W6+Ekx1hlDcUG5ANqGs
	 7ZEGfXWGq1LmfMOuePa9aGwWOFsCx13tsgwE5TvoGq4+G+ASux2sxDADtyKVZsTiKO
	 pQXHwLMRKA69A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lukas Wunner <lukas@wunner.de>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: Convert maxim,max3191x to DT schema
Date: Mon, 14 Jul 2025 15:28:41 -0500
Message-ID: <20250714202843.3011698-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Maxim MAX3191x and similar GPIO binding to DT schema format.
It's a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/gpio/gpio-max3191x.txt           |  59 ----------
 .../bindings/gpio/maxim,max31910.yaml         | 104 ++++++++++++++++++
 2 files changed, 104 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max3191x.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/maxim,max31910.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-max3191x.txt b/Documentation/devicetree/bindings/gpio/gpio-max3191x.txt
deleted file mode 100644
index b3a6444b8f45..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-max3191x.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-GPIO driver for Maxim MAX3191x industrial serializer
-
-Required properties:
- - compatible:		Must be one of:
-			"maxim,max31910"
-			"maxim,max31911"
-			"maxim,max31912"
-			"maxim,max31913"
-			"maxim,max31953"
-			"maxim,max31963"
- - reg: 		Chip select number.
- - gpio-controller:	Marks the device node as a GPIO controller.
- - #gpio-cells: 	Should be two. For consumer use see gpio.txt.
-
-Optional properties:
- - #daisy-chained-devices:
-			Number of chips in the daisy-chain (default is 1).
- - maxim,modesel-gpios: GPIO pins to configure modesel of each chip.
-			The number of GPIOs must equal "#daisy-chained-devices"
-			(if each chip is driven by a separate pin) or 1
-			(if all chips are wired to the same pin).
- - maxim,fault-gpios: 	GPIO pins to read fault of each chip.
-			The number of GPIOs must equal "#daisy-chained-devices"
-			or 1.
- - maxim,db0-gpios:	GPIO pins to configure debounce of each chip.
-			The number of GPIOs must equal "#daisy-chained-devices"
-			or 1.
- - maxim,db1-gpios:	GPIO pins to configure debounce of each chip.
-			The number of GPIOs must equal "maxim,db0-gpios".
- - maxim,modesel-8bit:	Boolean whether the modesel pin of the chips is
-			pulled high (8-bit mode).  Use this if the modesel pin
-			is hardwired and consequently "maxim,modesel-gpios"
-			cannot be specified.  By default if neither this nor
-			"maxim,modesel-gpios" is given, the driver assumes
-			that modesel is pulled low (16-bit mode).
- - maxim,ignore-undervoltage:
-			Boolean whether to ignore undervoltage alarms signaled
-			by the "maxim,fault-gpios" or by the status byte
-			(in 16-bit mode).  Use this if the chips are powered
-			through 5VOUT instead of VCC24V, in which case they
-			will constantly signal undervoltage.
-
-For other required and optional properties of SPI slave nodes please refer to
-../spi/spi-bus.txt.
-
-Example:
-	gpio@0 {
-		compatible = "maxim,max31913";
-		reg = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		maxim,modesel-gpios = <&gpio2 23>;
-		maxim,fault-gpios   = <&gpio2 24 GPIO_ACTIVE_LOW>;
-		maxim,db0-gpios     = <&gpio2 25>;
-		maxim,db1-gpios     = <&gpio2 26>;
-
-		spi-max-frequency = <25000000>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/maxim,max31910.yaml b/Documentation/devicetree/bindings/gpio/maxim,max31910.yaml
new file mode 100644
index 000000000000..82a190a715f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/maxim,max31910.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/maxim,max31910.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX3191x GPIO serializer
+
+maintainers:
+  - Lukas Wunner <lukas@wunner.de>
+
+properties:
+  compatible:
+    enum:
+      - maxim,max31910
+      - maxim,max31911
+      - maxim,max31912
+      - maxim,max31913
+      - maxim,max31953
+      - maxim,max31963
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  '#daisy-chained-devices':
+    description: Number of chips in the daisy-chain.
+    default: 1
+
+  maxim,modesel-gpios:
+    description:
+      GPIO pins to configure modesel of each chip. The number of GPIOs must
+      equal "#daisy-chained-devices" (if each chip is driven by a separate pin)
+      or 1 (if all chips are wired to the same pin).
+
+  maxim,fault-gpios:
+    description:
+      GPIO pins to read fault of each chip. The number of GPIOs must equal
+      "#daisy-chained-devices" or 1.
+
+  maxim,db0-gpios:
+    description:
+      GPIO pins to configure debounce of each chip. The number of GPIOs must
+      equal "#daisy-chained-devices" or 1.
+
+  maxim,db1-gpios:
+    description:
+      GPIO pins to configure debounce of each chip. The number of GPIOs must
+      equal "maxim,db0-gpios".
+
+  maxim,modesel-8bit:
+    description:
+      Boolean whether the modesel pin of the chips is pulled high (8-bit mode).
+      Use this if the modesel pin is hardwired and consequently
+      "maxim,modesel-gpios" cannot be specified. By default if neither this nor
+      "maxim,modesel-gpios" is given, the driver assumes that modesel is pulled
+      low (16-bit mode).
+    type: boolean
+
+  maxim,ignore-undervoltage:
+    description:
+      Boolean whether to ignore undervoltage alarms signaled by the
+      "maxim,fault-gpios" or by the status byte (in 16-bit mode). Use this if
+      the chips are powered through 5VOUT instead of VCC24V, in which case they
+      will constantly signal undervoltage.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@0 {
+            compatible = "maxim,max31913";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            maxim,modesel-gpios = <&gpio2 23>;
+            maxim,fault-gpios   = <&gpio2 24 GPIO_ACTIVE_LOW>;
+            maxim,db0-gpios     = <&gpio2 25>;
+            maxim,db1-gpios     = <&gpio2 26>;
+
+            spi-max-frequency = <25000000>;
+        };
+    };
-- 
2.47.2


