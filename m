Return-Path: <linux-gpio+bounces-23246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C35A9B0489B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 22:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED38E16ED88
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 20:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D4F28935A;
	Mon, 14 Jul 2025 20:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="um8yhp0p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6179239E6F;
	Mon, 14 Jul 2025 20:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524970; cv=none; b=cZuSBIXjrXoU/QHZF0ldX7bipmJVzAjELWA6fzk91B96WTxU1HSAk17Le905NV9zRwtmYzaImNT4OdSCq/ZivdjTctwvyM9jJ/JYCoOQy79DJLt4yFBwTieTbrEw0FuSMuyvyDqCnkTSj2y6MAD/elh6qt7F4CI2HyBjLDH6GoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524970; c=relaxed/simple;
	bh=4lMI/eqkvyH3FDWiPXYx4L5rnSlB6JTnPsN8/oeg0gM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=umu3C1jlMprqf/+hbVKomjKMXJW2zbThNZUKfAB5xZf/PdPcqZx4yegRqLC1hc8mUtP2hkPwWIb0usov6eVLDcPjD9JZaPRZGerEYyAVIHQEaOkugrfh1V30IMYdqa7Z2xeLy43MzRxtyS1svgHhXLZvvFizLWCg6BYdDQd+Q24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=um8yhp0p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2BAC4CEED;
	Mon, 14 Jul 2025 20:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524970;
	bh=4lMI/eqkvyH3FDWiPXYx4L5rnSlB6JTnPsN8/oeg0gM=;
	h=From:To:Cc:Subject:Date:From;
	b=um8yhp0pGw033Vd1GgMjD2JYpf6KVH7sNovjilKlSRWT2C3R2UJL9nYWjMn1LS7CU
	 Yyo/n78V23eoIN0kDRvaNsuo/qzeBwsmqvMKKjkIQyhecFVmA963F/yyZAggbCMrri
	 Mt2E6xhw2vcg//xcrRJMT5vJmhDUaHtGgh/Ztntw9Z4jXArAI9rCwEsmNgUAh3AF35
	 vj430bGHWAjh7/msJcNmn1siaLtkiDZD3uznX5dRzE83X5Et2Cp6Ns/p6otwJjeRZD
	 uHXCSiXARr2qzucg4IRIGURHMARo4Dg+x0nPBALQKPKPHTVY65z7JRzbnttiSLmw4Z
	 8UbmylVOJ8DJw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: Convert cavium,octeon-3860-gpio to DT schema
Date: Mon, 14 Jul 2025 15:29:25 -0500
Message-ID: <20250714202927.3012974-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Cavium Octeon 3860 GPIO binding to DT schema format. It's a
straight forward conversion.

Looks like Octeon has no maintainers, so Bartosz is listed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../gpio/cavium,octeon-3860-gpio.yaml         | 62 +++++++++++++++++++
 .../bindings/gpio/cavium-octeon-gpio.txt      | 49 ---------------
 2 files changed, 62 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/cavium,octeon-3860-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/cavium-octeon-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/cavium,octeon-3860-gpio.yaml b/Documentation/devicetree/bindings/gpio/cavium,octeon-3860-gpio.yaml
new file mode 100644
index 000000000000..35155b900655
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/cavium,octeon-3860-gpio.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cavium,octeon-3860-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cavium Octeon 3860 GPIO controller
+
+maintainers:
+  - Bartosz Golaszewski <brgl@bgdev.pl>
+
+properties:
+  compatible:
+    const: cavium,octeon-3860-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 16
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - interrupt-controller
+  - '#interrupt-cells'
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        gpio@1070000000800 {
+            compatible = "cavium,octeon-3860-gpio";
+            reg = <0x10700 0x00000800 0x0 0x100>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            /* The GPIO pin connect to 16 consecutive CUI bits */
+            interrupts = <0 16>, <0 17>, <0 18>, <0 19>,
+                        <0 20>, <0 21>, <0 22>, <0 23>,
+                        <0 24>, <0 25>, <0 26>, <0 27>,
+                        <0 28>, <0 29>, <0 30>, <0 31>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/gpio/cavium-octeon-gpio.txt b/Documentation/devicetree/bindings/gpio/cavium-octeon-gpio.txt
deleted file mode 100644
index 9d6dcd3fe7f9..000000000000
--- a/Documentation/devicetree/bindings/gpio/cavium-octeon-gpio.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-* General Purpose Input Output (GPIO) bus.
-
-Properties:
-- compatible: "cavium,octeon-3860-gpio"
-
-  Compatibility with all cn3XXX, cn5XXX and cn6XXX SOCs.
-
-- reg: The base address of the GPIO unit's register bank.
-
-- gpio-controller: This is a GPIO controller.
-
-- #gpio-cells: Must be <2>.  The first cell is the GPIO pin.
-
-- interrupt-controller: The GPIO controller is also an interrupt
-  controller, many of its pins may be configured as an interrupt
-  source.
-
-- #interrupt-cells: Must be <2>.  The first cell is the GPIO pin
-   connected to the interrupt source.  The second cell is the interrupt
-   triggering protocol and may have one of four values:
-   1 - edge triggered on the rising edge.
-   2 - edge triggered on the falling edge
-   4 - level triggered active high.
-   8 - level triggered active low.
-
-- interrupts: Interrupt routing for each pin.
-
-Example:
-
-	gpio-controller@1070000000800 {
-		#gpio-cells = <2>;
-		compatible = "cavium,octeon-3860-gpio";
-		reg = <0x10700 0x00000800 0x0 0x100>;
-		gpio-controller;
-		/* Interrupts are specified by two parts:
-		 * 1) GPIO pin number (0..15)
-		 * 2) Triggering (1 - edge rising
-		 *		  2 - edge falling
-		 *		  4 - level active high
-		 *		  8 - level active low)
-		 */
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		/* The GPIO pin connect to 16 consecutive CUI bits */
-		interrupts = <0 16>, <0 17>, <0 18>, <0 19>,
-			     <0 20>, <0 21>, <0 22>, <0 23>,
-			     <0 24>, <0 25>, <0 26>, <0 27>,
-			     <0 28>, <0 29>, <0 30>, <0 31>;
-	};
-- 
2.47.2


