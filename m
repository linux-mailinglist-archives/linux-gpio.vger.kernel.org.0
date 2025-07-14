Return-Path: <linux-gpio+bounces-23247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F00C4B0489F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 22:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5045E189A565
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 20:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83450277CB3;
	Mon, 14 Jul 2025 20:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1+ILGRZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAE1230BCC;
	Mon, 14 Jul 2025 20:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524977; cv=none; b=gfi0NfgQmR9yHMsLHbMDg9oh+44kXOLkm2TvmkfPBOBSs5YRDAJYeoG/U+NP2CPGWtgo4iHN2bOFG9QHl8M1AwZRunwvyvhvY4a400YnXZrhGe3pNamDa51xCeSRc3Gai11fiE9a2FIVYPcJzx53i8W2c5Wv8attUhaSW81pByk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524977; c=relaxed/simple;
	bh=WBeX64yvuNIeIudlI6e6iSPStosccgVilemCdP7n138=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DHrO5UJsEn8E6lg7Ib62gHwPz86hsmq17f0jhKYBDBOcMyu+5pWLoXit0TfshPECXWqpTfimax+uYdAvAKZua3KPxuwESL2FJI1wZwKv2ODU33OEsk0E8m7gm34JZawMxPcmsSxjTp4tOq0qkuD1uI6/x3/XPDwYph8uSkyZEqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1+ILGRZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9F0C4CEED;
	Mon, 14 Jul 2025 20:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524976;
	bh=WBeX64yvuNIeIudlI6e6iSPStosccgVilemCdP7n138=;
	h=From:To:Cc:Subject:Date:From;
	b=g1+ILGRZ2JDtXcM1mY+5W3uliqAblmNzubPmG5i7AgRNXUgcaoIC7tvXsgORg+NGV
	 0LVuseblqDWEyTAgwLlvre9bJzYa19PNJFB1UBgejjZeZLjHfhp2ApmJd8ZXl6Zvpr
	 x7NWMEg+cDutAih89Mj43gFn+wih/TGjjHyv/4Pl86QTCq4kerIQ2JY/DfPqYhTh/Z
	 W1yOG49mWM6RP6hNQBTckS7rXtusLHFZKrkITJxJ3iZ5t1fmMKdJmUS9nn+aRdUoJx
	 2i5u7DFDS2mjVsb3J3KTfk8TzrNkkYaAoqdDc7MGWy5lmoyEIwu5IGuhudFo5Z/soU
	 hvqNpD6Gf60Mg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Ruppert <christian.ruppert@abilis.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: Convert abilis,tb10x-gpio to DT schema
Date: Mon, 14 Jul 2025 15:29:32 -0500
Message-ID: <20250714202934.3013189-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Abilis TB10x GPIO binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/gpio/abilis,tb10x-gpio.txt       | 35 -----------
 .../bindings/gpio/abilis,tb10x-gpio.yaml      | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.txt b/Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.txt
deleted file mode 100644
index ce19c5660aca..000000000000
--- a/Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-* Abilis TB10x GPIO controller
-
-Required Properties:
-- compatible: Should be "abilis,tb10x-gpio"
-- reg: Address and length of the register set for the device
-- gpio-controller: Marks the device node as a gpio controller.
-- #gpio-cells: Should be <2>. The first cell is the pin number and the
-  second cell is used to specify optional parameters:
-   - bit 0 specifies polarity (0 for normal, 1 for inverted).
-- abilis,ngpio: the number of GPIO pins this driver controls.
-
-Optional Properties:
-- interrupt-controller: Marks the device node as an interrupt controller.
-- #interrupt-cells: Should be <1>. Interrupts are triggered on both edges.
-- interrupts: Defines the interrupt line connecting this GPIO controller to
-  its parent interrupt controller.
-
-GPIO ranges are specified as described in
-Documentation/devicetree/bindings/gpio/gpio.txt
-
-Example:
-
-	gpioa: gpio@ff140000 {
-		compatible = "abilis,tb10x-gpio";
-		interrupt-controller;
-		#interrupt-cells = <1>;
-		interrupt-parent = <&tb10x_ictl>;
-		interrupts = <27 2>;
-		reg = <0xFF140000 0x1000>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		abilis,ngpio = <3>;
-		gpio-ranges = <&iomux 0 0 0>;
-		gpio-ranges-group-names = "gpioa_pins";
-	};
diff --git a/Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.yaml b/Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.yaml
new file mode 100644
index 000000000000..c93ec0f16bcd
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/abilis,tb10x-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Abilis TB10x GPIO controller
+
+maintainers:
+  - Christian Ruppert <christian.ruppert@abilis.com>
+
+properties:
+  compatible:
+    const: abilis,tb10x-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges: true
+
+  gpio-ranges-group-names: true
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description: Interrupts are triggered on both edges
+
+  interrupts:
+    maxItems: 1
+
+  abilis,ngpio:
+    description: Number of GPIO pins this driver controls
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - abilis,ngpio
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@ff140000 {
+        compatible = "abilis,tb10x-gpio";
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        interrupts = <27 2>;
+        reg = <0xff140000 0x1000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        abilis,ngpio = <3>;
+        gpio-ranges = <&iomux 0 0 0>;
+        gpio-ranges-group-names = "gpioa_pins";
+    };
-- 
2.47.2


