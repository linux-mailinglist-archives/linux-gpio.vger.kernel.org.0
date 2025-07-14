Return-Path: <linux-gpio+bounces-23238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C25B04878
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 22:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 051517A76DD
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 20:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120F4239E6F;
	Mon, 14 Jul 2025 20:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKUUf+vT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD43F239E6B;
	Mon, 14 Jul 2025 20:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524904; cv=none; b=DF27bM3Dx0MWLLBMLZagf9lAIY70K6cfnlicUf8/opyeYrb9E/197T40SSoqd7JqNrZXc59bAKJVpmcH9fURZR6H/b+WeU3PzKGk/jVMnbEpkHVhgFqRCGYeB7hrE1w0aCirRvwRAnHupRcAwepVLcBGp8WguCWAjItWA0oEx9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524904; c=relaxed/simple;
	bh=Q9zeR0eQrRBDfDQ8+DjlW+VvbGusEsvHSobPmji9dUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l3CJXsAyF0CqXEqRHb2/Iyg+dHNO6kvZQkLcuERIO0GG8bkztbd+MzTDf1wRZYybJ87Bl9h0Ij+H3Lxw97VnFS/ZF7LuOTkstCH9x0RlMpeLyiACHtrgppGhkQxECJ9O4HPDq8mHZFwdnhSS+TPt2lungE4cQszRyN/u/nLT0AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKUUf+vT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C856C4CEF0;
	Mon, 14 Jul 2025 20:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524904;
	bh=Q9zeR0eQrRBDfDQ8+DjlW+VvbGusEsvHSobPmji9dUo=;
	h=From:To:Cc:Subject:Date:From;
	b=XKUUf+vTC1c8un9TkWj1kdKXRp4Svqk6UIHCi9HYqhxDjf2icANcaf0fqkNSd6I/G
	 V8/kWzC5nASWkpy5hscWJhPZ6xLaNnT31yvoowvSD4lUBdJ9vat1lU/oeRmaOs23mr
	 7QDP7/rotdO2eDMjop0u2dnXVu3ef4ebUBklS3ZZs65Oq5ilRA6Uc3HgmveOYJZai/
	 nRqb0e1RoiI/mYgPYskhO4Bc+YeUnmYkl9yFcmrOdPKopJHsXsqIXvN5mfJ0GctbxL
	 CttjzXm2OXp0A8ebrZihqQteTdsZ5tHiugTU3KaUdx2GrWJGeyQRCkaXLRlvxqEkiV
	 tNG/6acMR6z1A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: Convert apm,xgene-gpio-sb to DT schema
Date: Mon, 14 Jul 2025 15:28:20 -0500
Message-ID: <20250714202821.3011099-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert APM X-Gene Standby GPIO binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/gpio/apm,xgene-gpio-sb.yaml      | 94 +++++++++++++++++++
 .../bindings/gpio/gpio-xgene-sb.txt           | 64 -------------
 2 files changed, 94 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/apm,xgene-gpio-sb.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt

diff --git a/Documentation/devicetree/bindings/gpio/apm,xgene-gpio-sb.yaml b/Documentation/devicetree/bindings/gpio/apm,xgene-gpio-sb.yaml
new file mode 100644
index 000000000000..d205dd7b492c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/apm,xgene-gpio-sb.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/apm,xgene-gpio-sb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: APM X-Gene Standby GPIO controller
+
+maintainers:
+  - Khuong Dinh <khuong@os.amperecomputing.com>
+
+description: |
+  This is a gpio controller in the standby domain. It also supports interrupt in
+  some particular pins which are sourced to its parent interrupt controller
+  as diagram below:
+                                +-----------------+
+                                | X-Gene standby  |
+                                | GPIO controller +------ GPIO_0
+    +------------+              |                 | ...
+    | Parent IRQ | EXT_INT_0    |                 +------ GPIO_8/EXT_INT_0
+    | controller | (SPI40)      |                 | ...
+    | (GICv2)    +--------------+                 +------ GPIO_[N+8]/EXT_INT_N
+    |            |   ...        |                 |
+    |            | EXT_INT_N    |                 +------ GPIO_[N+9]
+    |            | (SPI[40 + N])|                 | ...
+    |            +--------------+                 +------ GPIO_MAX
+    +------------+              +-----------------+
+
+properties:
+  compatible:
+    const: apm,xgene-gpio-sb
+
+  reg:
+    maxItems: 1
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+
+  interrupts:
+    description:
+      List of interrupt specifiers for EXT_INT_0 through EXT_INT_N. The first
+      entry must correspond to EXT_INT_0.
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      First cell selects EXT_INT_N (0-N), second cell specifies flags
+
+  interrupt-controller: true
+
+  apm,nr-gpios:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of GPIO pins
+
+  apm,nr-irqs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of interrupt pins
+
+  apm,irq-start:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Lowest GPIO pin supporting interrupts
+
+required:
+  - compatible
+  - reg
+  - '#gpio-cells'
+  - gpio-controller
+  - interrupts
+  - '#interrupt-cells'
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@17001000 {
+        compatible = "apm,xgene-gpio-sb";
+        reg = <0x17001000 0x400>;
+        #gpio-cells = <2>;
+        gpio-controller;
+        interrupts = <0x0 0x28 0x1>,
+                     <0x0 0x29 0x1>,
+                     <0x0 0x2a 0x1>,
+                     <0x0 0x2b 0x1>,
+                     <0x0 0x2c 0x1>,
+                     <0x0 0x2d 0x1>;
+        #interrupt-cells = <2>;
+        interrupt-controller;
+        apm,nr-gpios = <22>;
+        apm,nr-irqs = <6>;
+        apm,irq-start = <8>;
+    };
diff --git a/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt b/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
deleted file mode 100644
index 7ddf292db144..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-APM X-Gene Standby GPIO controller bindings
-
-This is a gpio controller in the standby domain. It also supports interrupt in
-some particular pins which are sourced to its parent interrupt controller
-as diagram below:
-                            +-----------------+
-                            | X-Gene standby  |
-                            | GPIO controller +------ GPIO_0
-+------------+              |                 | ...
-| Parent IRQ | EXT_INT_0    |                 +------ GPIO_8/EXT_INT_0
-| controller | (SPI40)      |                 | ...
-| (GICv2)    +--------------+                 +------ GPIO_[N+8]/EXT_INT_N
-|            |   ...        |                 |
-|            | EXT_INT_N    |                 +------ GPIO_[N+9]
-|            | (SPI[40 + N])|                 | ...
-|            +--------------+                 +------ GPIO_MAX
-+------------+              +-----------------+
-
-Required properties:
-- compatible: "apm,xgene-gpio-sb" for the X-Gene Standby GPIO controller
-- reg: Physical base address and size of the controller's registers
-- #gpio-cells: Should be two.
-	- first cell is the pin number
-	- second cell is used to specify the gpio polarity:
-		0 = active high
-		1 = active low
-- gpio-controller: Marks the device node as a GPIO controller.
-- interrupts: The EXT_INT_0 parent interrupt resource must be listed first.
-- interrupt-cells: Should be two.
-       - first cell is 0-N corresponding for EXT_INT_0 to EXT_INT_N.
-       - second cell is used to specify flags.
-- interrupt-controller: Marks the device node as an interrupt controller.
-- apm,nr-gpios: Optional, specify number of gpios pin.
-- apm,nr-irqs: Optional, specify number of interrupt pins.
-- apm,irq-start: Optional, specify lowest gpio pin support interrupt.
-
-Example:
-	sbgpio: gpio@17001000{
-		compatible = "apm,xgene-gpio-sb";
-		reg = <0x0 0x17001000 0x0 0x400>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		interrupts = 	<0x0 0x28 0x1>,
-				<0x0 0x29 0x1>,
-				<0x0 0x2a 0x1>,
-				<0x0 0x2b 0x1>,
-				<0x0 0x2c 0x1>,
-				<0x0 0x2d 0x1>;
-		interrupt-parent = <&gic>;
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		apm,nr-gpios = <22>;
-		apm,nr-irqs = <6>;
-		apm,irq-start = <8>;
-	};
-
-	testuser {
-		compatible = "example,testuser";
-		/* Use the GPIO_13/EXT_INT_5 line as an active high triggered
-		 * level interrupt
-		 */
-		interrupts = <5 4>;
-		interrupt-parent = <&sbgpio>;
-	};
-- 
2.47.2


