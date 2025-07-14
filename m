Return-Path: <linux-gpio+bounces-23237-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A73DB04876
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 22:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 582FC188F71B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 20:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29A026FDBD;
	Mon, 14 Jul 2025 20:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C92qlRri"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16302367C0;
	Mon, 14 Jul 2025 20:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524898; cv=none; b=YU/o/HVw4BPyKEscUblt1ifKi2kBpeH5g3ATjrQnZBCvwy1u5EHzOmCFe0QQj0D4kIJWsant+ft1B1El2/j1Y4Nromkau/zkBxyUtxUgfHzVyVGESlzPqprTyv4CTGDS+6uTCNY/V9C80MP9ayM7w6up3KfqA0oyO/gH2Cijt9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524898; c=relaxed/simple;
	bh=kJUOxHmYp7Zh7G3iny+wcn74ETTuvm81Hn27lsWnV5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lRleTlJxoZ5y+ttCf1ABy0hM7AALuHwazts8a13VShQ8ZnQLhqjaeiPp/z7n0WjckuHdue6XilPf9C3eiTVbvCuAeD6djk7cq9TEx1DE2riHbddS5pkJjrMxHv1IghzXfhXCrnQCiQFc+4eIWMn+b5Duly4o3EebrIXQp7fYvLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C92qlRri; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A42C4CEF0;
	Mon, 14 Jul 2025 20:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524898;
	bh=kJUOxHmYp7Zh7G3iny+wcn74ETTuvm81Hn27lsWnV5k=;
	h=From:To:Cc:Subject:Date:From;
	b=C92qlRrixtP0OwbFA+FpPBw50bCp5ABxAQefzfgAmsS8m1g7D2Ox94t/zqHZGxNVs
	 b/ZN31Wo3RmhunaUOtlt9tn/a+2ddlMAp1zuuoE9r7ey6nDoSb3bW/zy4ja+2SgEtu
	 Nm0zgf2UFivfMkYit/wX3LW52OpEplpUKciHJLhc0xEXo1UvsUpY9TD/LEbMW9FOR2
	 kdDCY2ZzdFQjhzQS/2zirrSJwF1qRDl7IKBTqGw4BQRnHVbdcs5xeAPWkvfDusVsG+
	 XpcUXWFspDZnuvydF24H75mJuFEb26syFbHx1ldIaHKbFPFCzloqFh5rhRE88jdXw+
	 T6+lp1+FI4p1Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: Convert exar,xra1403 to DT schema
Date: Mon, 14 Jul 2025 15:28:12 -0500
Message-ID: <20250714202813.3010879-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert XRA1403 16-bit GPIO Expander binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/gpio/exar,xra1403.yaml           | 75 +++++++++++++++++++
 .../devicetree/bindings/gpio/gpio-xra1403.txt | 46 ------------
 2 files changed, 75 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/exar,xra1403.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-xra1403.txt

diff --git a/Documentation/devicetree/bindings/gpio/exar,xra1403.yaml b/Documentation/devicetree/bindings/gpio/exar,xra1403.yaml
new file mode 100644
index 000000000000..053134faf475
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/exar,xra1403.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/exar,xra1403.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: XRA1403 16-bit GPIO Expander with Reset Input
+
+maintainers:
+  - Nandor Han <nandor.han@ge.com>
+
+description: >
+  The XRA1403 is an 16-bit GPIO expander with an SPI interface. Features
+  available:
+
+    - Individually programmable inputs:
+        - Internal pull-up resistors
+        - Polarity inversion
+        - Individual interrupt enable
+        - Rising edge and/or Falling edge interrupt
+        - Input filter
+    - Individually programmable outputs:
+        - Output Level Control
+        - Output Three-State Control
+
+properties:
+  compatible:
+    const: exar,xra1403
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
+  reset-gpios:
+    description: Control line for the device reset.
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
+        gpio@2 {
+            compatible = "exar,xra1403";
+            reg = <2>;
+            spi-max-frequency = <1000000>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            reset-gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/gpio/gpio-xra1403.txt b/Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
deleted file mode 100644
index e13cc399b363..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-GPIO Driver for XRA1403 16-BIT GPIO Expander With Reset Input from EXAR
-
-The XRA1403 is an 16-bit GPIO expander with an SPI interface. Features available:
-	- Individually programmable inputs:
-		- Internal pull-up resistors
-		- Polarity inversion
-		- Individual interrupt enable
-		- Rising edge and/or Falling edge interrupt
-		- Input filter
-	- Individually programmable outputs
-		- Output Level Control
-		- Output Three-State Control
-
-Properties
-----------
-Check documentation for SPI and GPIO controllers regarding properties needed to configure the node.
-
-	- compatible = "exar,xra1403".
-	- reg - SPI id of the device.
-	- gpio-controller - marks the node as gpio.
-	- #gpio-cells - should be two where the first cell is the pin number
-		and the second one is used for optional parameters.
-
-Optional properties:
--------------------
-	- reset-gpios: in case available used to control the device reset line.
-	- interrupt-controller - marks the node as interrupt controller.
-	- #interrupt-cells - should be two and represents the number of cells
-		needed to encode interrupt source.
-
-Example
---------
-
-	gpioxra0: gpio@2 {
-		compatible = "exar,xra1403";
-		reg = <2>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		interrupt-controller;
-		#interrupt-cells = <2>;
-
-		reset-gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
-		spi-max-frequency = <1000000>;
-	};
-- 
2.47.2


