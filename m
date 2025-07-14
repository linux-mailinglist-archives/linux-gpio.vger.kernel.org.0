Return-Path: <linux-gpio+bounces-23244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E71CFB04899
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 22:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E9977B374D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 20:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DD6287519;
	Mon, 14 Jul 2025 20:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIOoFoxL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC9A287245;
	Mon, 14 Jul 2025 20:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524949; cv=none; b=Uf/j6/0V+YcGL9RRyxp3WYMhuKMCJm0YlBczQUddfPa2K5EddbPZRVgf4++owMS3GN5nj7q8QRXvY/wyAiGTCzgXLMAnbiWbsb0PI1FkbA/VfUYN8pRWyN5oRzJVVtsFl8YLHKn66Zg+CWZ5FpXjHETWkf3IUxS6RFCQOpzWyQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524949; c=relaxed/simple;
	bh=i7K7Fw+SPkvOzC4raudAEe+HDuQjbWlcBkDw1aS46iM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YlvQ1JTdEFtmZJbEmQzHQ+kMUfijqqjB9h6JdI6ydrhElFVoIO//HzpJussBxx2Tl8ectDQKqjelOmfcg89VKIVM+wDkT+RFRFs+WOMvTt5lxj/B1rmXv3PFsLebM9Ao04mitKWLIbVdu2eam2ZeGyO6vszdug1USDacICvliYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIOoFoxL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3416C4CEED;
	Mon, 14 Jul 2025 20:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524948;
	bh=i7K7Fw+SPkvOzC4raudAEe+HDuQjbWlcBkDw1aS46iM=;
	h=From:To:Cc:Subject:Date:From;
	b=FIOoFoxLeS6wRgR/yP/IeDpbsiugIFNSfHEtn/WkqY96zcf6Bhxj6fJxuyPTzP8hi
	 NAtoteeqRUA1Xp/CN+xKDWmtzyH7SojnU+cVq45TDC+5e0C6pZJUV7mfjBgWsmsJVQ
	 9dzOFuuIWF/d+F+/QowqgfwXWec1v8fkvailnjpE40Mm0t3BPn4fWWn6jcF8YtrDGp
	 uvZKdBOiX5wHvVUCy7heYG42ESOTmpqDMfshTI9QLMYnUC1FgEKdY06q/GZpv4l9WH
	 U3uiYpcjcOaEx23o4cxWpodAksUXPjoeQCatNBQkcI/8Q4/qqiVYn6aKuukTKgBGDx
	 r4rmUP8uWDaNg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Mathieu Malaterre <malat@debian.org>,
	Hock Loh <thloh@altera.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: Convert altr,pio-1.0 to DT schema
Date: Mon, 14 Jul 2025 15:29:04 -0500
Message-ID: <20250714202905.3012386-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the altr,pio-1.0 binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/gpio/altr-pio-1.0.yaml           | 75 +++++++++++++++++++
 .../devicetree/bindings/gpio/gpio-altera.txt  | 44 -----------
 2 files changed, 75 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/altr-pio-1.0.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera.txt

diff --git a/Documentation/devicetree/bindings/gpio/altr-pio-1.0.yaml b/Documentation/devicetree/bindings/gpio/altr-pio-1.0.yaml
new file mode 100644
index 000000000000..18afed324198
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/altr-pio-1.0.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/altr-pio-1.0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera GPIO controller
+
+maintainers:
+  - Dinh Nguyen <dinguyen@kernel.org>
+  - Marek Vasut <marex@denx.de>
+  - Mathieu Malaterre <malat@debian.org>
+  - Tien Hock Loh <thloh@altera.com>
+
+properties:
+  compatible:
+    const: altr,pio-1.0
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description:
+      First cell is the GPIO offset number. Second cell is reserved and
+      currently unused.
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  altr,ngpio:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Width of the GPIO bank.
+    default: 32
+
+  altr,interrupt-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      Specifies the interrupt trigger type synthesized by hardware.
+      Values defined in <dt-bindings/interrupt-controller/irq.h>.
+    enum: [1, 2, 3, 4]
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gpio@ff200000 {
+        compatible = "altr,pio-1.0";
+        reg = <0xff200000 0x10>;
+        interrupts = <45 4>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        altr,ngpio = <32>;
+        altr,interrupt-type = <IRQ_TYPE_EDGE_RISING>;
+    };
diff --git a/Documentation/devicetree/bindings/gpio/gpio-altera.txt b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
deleted file mode 100644
index 2a80e272cd66..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-altera.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-Altera GPIO controller bindings
-
-Required properties:
-- compatible:
-  - "altr,pio-1.0"
-- reg: Physical base address and length of the controller's registers.
-- #gpio-cells : Should be 2
-  - The first cell is the gpio offset number.
-  - The second cell is reserved and is currently unused.
-- gpio-controller : Marks the device node as a GPIO controller.
-- interrupt-controller: Mark the device node as an interrupt controller
-- #interrupt-cells : Should be 2. The interrupt type is fixed in the hardware.
-  - The first cell is the GPIO offset number within the GPIO controller.
-  - The second cell is the interrupt trigger type and level flags.
-- interrupts: Specify the interrupt.
-- altr,interrupt-type: Specifies the interrupt trigger type the GPIO
-  hardware is synthesized. This field is required if the Altera GPIO controller
-  used has IRQ enabled as the interrupt type is not software controlled,
-  but hardware synthesized. Required if GPIO is used as an interrupt
-  controller. The value is defined in <dt-bindings/interrupt-controller/irq.h>
-  Only the following flags are supported:
-    IRQ_TYPE_EDGE_RISING
-    IRQ_TYPE_EDGE_FALLING
-    IRQ_TYPE_EDGE_BOTH
-    IRQ_TYPE_LEVEL_HIGH
-
-Optional properties:
-- altr,ngpio: Width of the GPIO bank. This defines how many pins the
-  GPIO device has. Ranges between 1-32. Optional and defaults to 32 if not
-  specified.
-
-Example:
-
-gpio_altr: gpio@ff200000 {
-	compatible = "altr,pio-1.0";
-	reg = <0xff200000 0x10>;
-	interrupts = <0 45 4>;
-	altr,ngpio = <32>;
-	altr,interrupt-type = <IRQ_TYPE_EDGE_RISING>;
-	#gpio-cells = <2>;
-	gpio-controller;
-	#interrupt-cells = <2>;
-	interrupt-controller;
-};
-- 
2.47.2


