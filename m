Return-Path: <linux-gpio+bounces-23243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE94DB0488A
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 22:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4C821893754
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 20:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70802853F8;
	Mon, 14 Jul 2025 20:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xq65nF3p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA76239E6E;
	Mon, 14 Jul 2025 20:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524942; cv=none; b=rRKnq2PzOWLVyHx+NnX6jLDIStMD0sS4qlZWeK9bDW/JPFOjoJGRNrljGvmWsjhhDiRu8Qp4OkTMxYxQiANx/nFrb9l4NpNyTyjCN746WwEq5oBqmiWcPtZNOWyAtG9+C2TX7MqbsL0/ZC7YOL+spMrBGAi207s6lt3TRFE3yeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524942; c=relaxed/simple;
	bh=dYGGMiXRHirvFlTEu3vEri1FlKbeNNTIROuB+Skkg40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r89Gc1hU7Uzb77OUec+5PAWL7V8c2/b9Qz5LXYpYtQsFpJ+4qVjpZVhFMUMLMyyYp5YV2gZKKF/saoSgqp7NwR8BksXiGhDY0qPNIOfFELqj4PQZHFRwP5qhnhs51JfgTcnrqch9m5Npad5x+OjeFCJLGXjcpfciSLnzb6N9oV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xq65nF3p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC83EC4CEED;
	Mon, 14 Jul 2025 20:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524942;
	bh=dYGGMiXRHirvFlTEu3vEri1FlKbeNNTIROuB+Skkg40=;
	h=From:To:Cc:Subject:Date:From;
	b=Xq65nF3pZhjYgZwMRDylIdqDSyPOcr+wMqsW/vWmQQdZqm6tg8gYbMYHpsdgvZUy7
	 4ODpvQWjEUeX5d/gu/f5L/zldYzMdCJ0glz0aMlbtiocrBFXF/i/liN1YfDKGP3akO
	 bPUprkfL9NdG9w3L4T1sMY1NPUrfKAXqqFyB85KgSD908Fu1UEf5oLCPGuzKspfjkT
	 p0SswmyF0Dfa8v4wJzHIU+/ZD6SOzC+xqZJyE8KSL5c4gCIDi/NplSsxZve40qKCod
	 OZPks5KVC74k8U9TtqPKt6FTkVf5i1kY7GhxRLgO3sizXFTirU84jwCc6glxZto6h5
	 fPDnZAVUkF5wQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alban Bedel <albeu@free.fr>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: Convert qca,ar7100-gpio to DT schema
Date: Mon, 14 Jul 2025 15:28:58 -0500
Message-ID: <20250714202859.3012173-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Qualcomm Atheros AR7xxx/AR9xxx GPIO binding to DT schema
format.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/gpio/gpio-ath79.txt   | 37 ------------
 .../bindings/gpio/qca,ar7100-gpio.yaml        | 60 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 61 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-ath79.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/qca,ar7100-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-ath79.txt b/Documentation/devicetree/bindings/gpio/gpio-ath79.txt
deleted file mode 100644
index cf71f3ec969d..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-ath79.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Binding for Qualcomm Atheros AR7xxx/AR9xxx GPIO controller
-
-Required properties:
-- compatible: has to be "qca,<soctype>-gpio" and one of the following
-  fallbacks:
-  - "qca,ar7100-gpio"
-  - "qca,ar9340-gpio"
-- reg: Base address and size of the controllers memory area
-- gpio-controller : Marks the device node as a GPIO controller.
-- #gpio-cells : Should be two. The first cell is the pin number and the
-  second cell is used to specify optional parameters.
-- ngpios: Should be set to the number of GPIOs available on the SoC.
-
-Optional properties:
-- interrupts: Interrupt specifier for the controllers interrupt.
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode interrupt
-		     source, should be 2
-
-Please refer to interrupts.txt in this directory for details of the common
-Interrupt Controllers bindings used by client devices.
-
-Example:
-
-	gpio@18040000 {
-		compatible = "qca,ar9132-gpio", "qca,ar7100-gpio";
-		reg = <0x18040000 0x30>;
-		interrupts = <2>;
-
-		ngpios = <22>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/qca,ar7100-gpio.yaml b/Documentation/devicetree/bindings/gpio/qca,ar7100-gpio.yaml
new file mode 100644
index 000000000000..519c4c2158f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/qca,ar7100-gpio.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/qca,ar7100-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Atheros AR7xxx/AR9xxx GPIO controller
+
+maintainers:
+  - Alban Bedel <albeu@free.fr>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: qca,ar9132-gpio
+          - const: qca,ar7100-gpio
+      - enum:
+          - qca,ar7100-gpio
+          - qca,ar9340-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  ngpios: true
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - ngpios
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@18040000 {
+        compatible = "qca,ar9132-gpio", "qca,ar7100-gpio";
+        reg = <0x18040000 0x30>;
+        interrupts = <2>;
+        ngpios = <22>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 099405ced395..1cc401432da2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3852,7 +3852,7 @@ M:	Alban Bedel <albeu@free.fr>
 S:	Maintained
 W:	https://github.com/AlbanBedel/linux
 T:	git https://github.com/AlbanBedel/linux.git
-F:	Documentation/devicetree/bindings/gpio/gpio-ath79.txt
+F:	Documentation/devicetree/bindings/gpio/qca,ar7100-gpio.yaml
 F:	drivers/gpio/gpio-ath79.c
 
 ATHEROS 71XX/9XXX USB PHY DRIVER
-- 
2.47.2


