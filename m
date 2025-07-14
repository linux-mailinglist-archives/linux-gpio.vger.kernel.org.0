Return-Path: <linux-gpio+bounces-23236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD02B04872
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 22:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C768F188D84F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 20:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED31267B7F;
	Mon, 14 Jul 2025 20:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqAMpgFZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8F223817F;
	Mon, 14 Jul 2025 20:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524891; cv=none; b=tl6Kv+JaLnS1dSolifQG/jMHUJU8kZVg/xiaIAn3rFhobb3U2cAqfGiGhP9/aDt17bgesj06Bmcp+soxiyfh7Ug46kzWZf/CvcjLFkDtzQv+FGaHB9MUPD63Oa2dcpBuvFPJq7odB0WRvZhpWAkKnzxzPpDr0HYWtX89xTYiZBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524891; c=relaxed/simple;
	bh=7tmgLZ7qPWDbvNfGMSr0/2hEpmJEbuFyqMpzTXHDGOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dfgy/7LZquhHuJoYthk9SxojafA4dBNJ7nQCQeARkCIDz6Nm4zGjxfjMI65qqLxE9fiCaLysqnXEqwIVodVblb/a8hHM2v9LJxGHHTvBqkwuC4yrUgfIDjFXOyWumX11enppnW76OrpAor28iyp5BCB0U1He6Juy8aYPBoPHauY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqAMpgFZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DEAC4CEED;
	Mon, 14 Jul 2025 20:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524890;
	bh=7tmgLZ7qPWDbvNfGMSr0/2hEpmJEbuFyqMpzTXHDGOw=;
	h=From:To:Cc:Subject:Date:From;
	b=UqAMpgFZGjF7NNO3pJG0WROlo1zg/fLFEqJX3yU4bOo4+vcFPEFsRxtIysmMDEJc+
	 e3YSfgnHeHSXKqKk0mV6JpXORKi6JZxmCkq6Nxs3s17DfwcdqxS1tHTdKOV1LtDomX
	 5xgl6HW7aYrFV0BjVYjZmsug4OkYN1aH7aObKZyOQRmTIW8gfnPYr4rYYhqDtC6mfI
	 Pgzf5ksw1oCADW7LC0u7uPav+EG21a+Fd6v4npH/d969s/XyeeRhzj48Dl5i2QSZcn
	 jL1i7KjeRMbPs+JYgViAYG8SYtAI6GMk6C359utkRF/1yCuUzLmSlcPZmgN44hkVsc
	 3eVHySHPCV0aw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joshua Henderson <joshua.henderson@microchip.com>,
	Chandra Mandal <purna.mandal@microchip.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: Convert microchip,pic32mzda-gpio to DT schema
Date: Mon, 14 Jul 2025 15:28:06 -0500
Message-ID: <20250714202807.3010652-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Microchip PIC32 GPIO binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/gpio/microchip,pic32-gpio.txt    | 49 -------------
 .../gpio/microchip,pic32mzda-gpio.yaml        | 71 +++++++++++++++++++
 2 files changed, 71 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/microchip,pic32-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/microchip,pic32mzda-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/microchip,pic32-gpio.txt b/Documentation/devicetree/bindings/gpio/microchip,pic32-gpio.txt
deleted file mode 100644
index dd031fc93b55..000000000000
--- a/Documentation/devicetree/bindings/gpio/microchip,pic32-gpio.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-* Microchip PIC32 GPIO devices (PIO).
-
-Required properties:
- - compatible: "microchip,pic32mzda-gpio"
- - reg: Base address and length for the device.
- - interrupts: The port interrupt shared by all pins.
- - gpio-controller: Marks the port as GPIO controller.
- - #gpio-cells: Two. The first cell is the pin number and
-   the second cell is used to specify the gpio polarity as defined in
-   defined in <dt-bindings/gpio/gpio.h>:
-      0 = GPIO_ACTIVE_HIGH
-      1 = GPIO_ACTIVE_LOW
-      2 = GPIO_OPEN_DRAIN
- - interrupt-controller: Marks the device node as an interrupt controller.
- - #interrupt-cells: Two. The first cell is the GPIO number and second cell
-   is used to specify the trigger type as defined in
-   <dt-bindings/interrupt-controller/irq.h>:
-      IRQ_TYPE_EDGE_RISING
-      IRQ_TYPE_EDGE_FALLING
-      IRQ_TYPE_EDGE_BOTH
- - clocks: Clock specifier (see clock bindings for details).
- - microchip,gpio-bank: Specifies which bank a controller owns.
- - gpio-ranges: Interaction with the PINCTRL subsystem.
-
-Example:
-
-/* PORTA */
-gpio0: gpio0@1f860000 {
-	compatible = "microchip,pic32mzda-gpio";
-	reg = <0x1f860000 0x100>;
-	interrupts = <118 IRQ_TYPE_LEVEL_HIGH>;
-	#gpio-cells = <2>;
-	gpio-controller;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-	clocks = <&rootclk PB4CLK>;
-	microchip,gpio-bank = <0>;
-	gpio-ranges = <&pic32_pinctrl 0 0 16>;
-};
-
-keys {
-	...
-
-	button@sw1 {
-		label = "ESC";
-		linux,code = <1>;
-		gpios = <&gpio0 12 0>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/gpio/microchip,pic32mzda-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,pic32mzda-gpio.yaml
new file mode 100644
index 000000000000..d8d932c86697
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/microchip,pic32mzda-gpio.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/microchip,pic32mzda-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32 GPIO controller
+
+maintainers:
+  - Joshua Henderson <joshua.henderson@microchip.com>
+  - Purna Chandra Mandal <purna.mandal@microchip.com>
+
+properties:
+  compatible:
+    const: microchip,pic32mzda-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  gpio-ranges: true
+
+  "#gpio-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  clocks:
+    maxItems: 1
+
+  microchip,gpio-bank:
+    description: Bank index owned by the controller
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - gpio-ranges
+  - "#gpio-cells"
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - clocks
+  - microchip,gpio-bank
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gpio@1f860000 {
+        compatible = "microchip,pic32mzda-gpio";
+        reg = <0x1f860000 0x100>;
+        interrupts = <118 IRQ_TYPE_LEVEL_HIGH>;
+        #gpio-cells = <2>;
+        gpio-controller;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        clocks = <&rootclk 11>;
+        microchip,gpio-bank = <0>;
+        gpio-ranges = <&pic32_pinctrl 0 0 16>;
+    };
-- 
2.47.2


