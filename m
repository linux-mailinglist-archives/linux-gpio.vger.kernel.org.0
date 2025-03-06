Return-Path: <linux-gpio+bounces-17212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B717A55B45
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 01:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3AA7177C28
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 00:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247EF280CEB;
	Thu,  6 Mar 2025 23:58:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458CA27E1CF;
	Thu,  6 Mar 2025 23:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741305530; cv=none; b=K2ATLBnhcZNFjICtzqbdA3+H2wQ3BDgJKnUqRokj7t7ZQtc0gQbd+ZN/onDqU6uAUYo9qhxKnSkmeOnNvuifupkPCGcqNcniAUwiucRJubFf3DlkyMSWDQfXGgejLG8h+bqPvHMXgJcF2lLiRuqzNQmxPDPV9aTkVdmkyWn2UhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741305530; c=relaxed/simple;
	bh=wnRLiYMEbY8/K9eqEbCgfskVXnEL7nqbid571UrXNbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=it4a/uJ7MBu91UytfzXXftHGrqsYjhRPCbgUFZXFiypkvu10R8K3cqkVipy54DxOmQhgGVmDEBXVFxImojJaZ2wh+Kkk386UKJXxyGfHe9srrsG/m3iZoy3UkZOF2cQk0Il8lT/yDFwiPfwEs9Q73mi3DU0w2srPNa06XR7A9U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72818169E;
	Thu,  6 Mar 2025 15:59:00 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06FC03F673;
	Thu,  6 Mar 2025 15:58:45 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/8] dt-bindings: pinctrl: add compatible for Allwinner A523/T527
Date: Thu,  6 Mar 2025 23:58:25 +0000
Message-ID: <20250306235827.4895-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250306235827.4895-1-andre.przywara@arm.com>
References: <20250306235827.4895-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 contains a pin controller similar to previous SoCs, although
using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
With this SoC we introduce a new style of binding, where the pinmux values
for each pin group are stored in the new "allwinner,pinmux" property in
the DT node, instead of requiring every driver to store a mapping between
the function names and the required pinmux.

Add a new binding file, since all the different variants of the old
binding are making the file a bit unwieldy to handle already, and the new
property would make the situation worse.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../allwinner,sun55i-a523-pinctrl.yaml        | 175 ++++++++++++++++++
 1 file changed, 175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
new file mode 100644
index 0000000000000..154e03da8ce98
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A523 Pin Controller
+
+maintainers:
+  - Andre Przywara <andre.przywara@arm.com>
+
+properties:
+  "#gpio-cells":
+    const: 3
+    description:
+      GPIO consumers must use three arguments, first the number of the
+      bank, then the pin number inside that bank, and finally the GPIO
+      flags.
+
+  "#interrupt-cells":
+    const: 3
+    description:
+      Interrupts consumers must use three arguments, first the number
+      of the bank, then the pin number inside that bank, and finally
+      the interrupts flags.
+
+  compatible:
+    enum:
+      - allwinner,sun55i-a523-pinctrl
+      - allwinner,sun55i-a523-r-pinctrl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+    maxItems: 10
+    description:
+      One interrupt per external interrupt bank supported on the
+      controller, sorted by bank number ascending order.
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: High Frequency Oscillator
+      - description: Low Frequency Oscillator
+
+  clock-names:
+    items:
+      - const: apb
+      - const: hosc
+      - const: losc
+
+  gpio-controller: true
+  interrupt-controller: true
+  gpio-line-names: true
+
+  input-debounce:
+    description:
+      Debouncing periods in microseconds, one period per interrupt
+      bank found in the controller
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 10
+
+patternProperties:
+  # It's pretty scary, but the basic idea is that:
+  #   - One node name can start with either s- or r- for PRCM nodes,
+  #   - Then, the name itself can be any repetition of <string>- (to
+  #     accommodate with nodes like uart4-rts-cts-pins), where each
+  #     string can be either starting with 'p' but in a string longer
+  #     than 3, or something that doesn't start with 'p',
+  #   - Then, the bank name is optional and will be between pa and pm.
+  #     Some pins groups that have several options will have the pin
+  #     numbers then,
+  #   - Finally, the name will end with either -pin or pins.
+
+  "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z][a-z0-9]*?)?-)+?(p[a-m][0-9]*?-)??pins?$":
+    type: object
+
+    properties:
+      pins: true
+      function: true
+      bias-disable: true
+      bias-pull-up: true
+      bias-pull-down: true
+
+      drive-strength:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [10, 20, 30, 40]
+
+      allwinner,pinmux:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Pinmux selector value, for each pin. Almost every time this value
+          is the same for all pins, so any array shorter than the number of
+          pins will repeat the last value, to allow just specifying a single
+          cell, for all cells.
+
+    required:
+      - pins
+      - allwinner,pinmux
+      - function
+
+    additionalProperties: false
+
+  "^vcc-p[a-m]-supply$":
+    description:
+      Power supplies for pin banks.
+
+required:
+  - "#gpio-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - gpio-controller
+  - "#interrupt-cells"
+  - interrupts
+  - interrupt-controller
+
+allOf:
+  - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun55i-a523-pinctrl
+
+    then:
+      properties:
+        interrupts:
+          minItems: 10
+          maxItems: 10
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun55i-a523-r-pinctrl
+
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+          maxItems: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    r_pio: pinctrl@7022000 {
+        compatible = "allwinner,sun55i-a523-r-pinctrl";
+        reg = <0x7022000 0x800>;
+        interrupts = <0 159 4>, <0 161 4>;
+        clocks = <&r_ccu 1>, <&osc24M>, <&osc32k>;
+        clock-names = "apb", "hosc", "losc";
+        gpio-controller;
+        #gpio-cells = <3>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+
+        r_i2c_pins: r-i2c-pins {
+            pins = "PL0", "PL1";
+            allwinner,pinmux = <2>;
+            function = "r_i2c0";
+            bias-pull-up;
+        };
+
+        r_spi_pins: r-spi-pins {
+            pins = "PL11" ,"PL12", "PL13";
+            allwinner,pinmux = <6>;
+            function = "r_spi";
+        };
+    };
-- 
2.46.3


