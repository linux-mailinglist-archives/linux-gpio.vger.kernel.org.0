Return-Path: <linux-gpio+bounces-8117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A3F92B3BF
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 11:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEFED1F2309A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 09:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0303015687D;
	Tue,  9 Jul 2024 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="VEJsQ/WV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0A213C687;
	Tue,  9 Jul 2024 09:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720517101; cv=none; b=JbwoiAT2hO0VSWIvZty4pmf8IL1d+uuMI+0UYyCC7KUZFscegzBLyYq6fmhfDnxz7s0m6VZSRqhg3O6wclZUdGvhWXnDK00bXjxy9U4741xAvMjIkQyezdmQGzLAzdUrBbPzCi+fs0h6opMIWfRXHP4rPLOQHP+mw3PlPomAT1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720517101; c=relaxed/simple;
	bh=bx1Zb9KM7VUeqyW8QvYuWVFWMVeXhJWWinZE1ZJNuM4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OMflOhE+AzEyv+725TnDDXdZOx/q4EmDMu8mGHyU18b4uwrky/5FC3CqFw3+jaFK1GbZWwAa/QOrZYjlN9rw6Z6b5tMkXX+cSuWh+CGBpFzM/EfHByzIfyLvL9PNkTDov6VLNhjZN06bKfN/yOILni6c8XrnF8+vL9HIkU9drTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=VEJsQ/WV; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1720517101; x=1752053101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bx1Zb9KM7VUeqyW8QvYuWVFWMVeXhJWWinZE1ZJNuM4=;
  b=VEJsQ/WVKx5dzU6+Zz/ddQc68MnLy7w2YLCrGZMov9lIxQlF06NZd0FD
   ++LzMnq64WquMq4j+jhz+ocuYah08ZdGOlAv4Carh5Z8bUiROOgOr7Pco
   d1/wDxRmDbBX5Td1fhZLGbw6ceyeUyQMDppXE5bnBHNOMRqfG414sUIeY
   85E3sJlgn2b63EZsnLCR8XSwE6AKpxtqO4e1ZtFRdJ9AWKo7JCJORKPOL
   doDUQsIMqKrZH9tZNVRFjcP/1PnS8qn/baVMUoM3IEExFalM+hcaVXuUV
   8KI2mb35ZZhDqIgJZOtdSBmsTK9KeKv6M69+7r2FWyFLp5uR6fwdBF9Gu
   A==;
X-CSE-ConnectionGUID: ll16me3gQkedAh4EH1xcvQ==
X-CSE-MsgGUID: U/Se9pJdTqiYy0REQP7PUA==
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="259885738"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jul 2024 02:25:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jul 2024 02:24:32 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jul 2024 02:24:25 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<durai.manickamkr@microchip.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 4/5] dt-bindings: gpio: convert Atmel GPIO to json-schema
Date: Tue, 9 Jul 2024 14:53:53 +0530
Message-ID: <20240709092354.191643-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240709092354.191643-1-manikandan.m@microchip.com>
References: <20240709092354.191643-1-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Convert the Atmel GPIO controller binding document to DT schema format
using json-schema.
The at91 pinctrl driver uses "atmel,at91rm9200-gpio" compatible string
to find the number of active GPIO banks and identify the pinmux nodes.
"atmel,at91sam9x5-gpio" and "microchip,sam9x60-gpio" have additional
registers to handle drive-strength, slew-rate,  pull-down to drive the
pinmux configs.
The new compatible string "microchip,sam9x7-gpio" is added.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
changes in v2:

- Fix bot errors with 'make dt_binding_check', missed to add
"atmel,at91rm9200-gpio" as separate compatible for devices that uses it
- Remove label from example
- Add default entry for #gpio-lines property
- Add new compatible string details in commit message
---
 .../bindings/gpio/atmel,at91rm9200-gpio.yaml  | 81 +++++++++++++++++++
 .../devicetree/bindings/gpio/gpio_atmel.txt   | 31 -------
 2 files changed, 81 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_atmel.txt

diff --git a/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
new file mode 100644
index 000000000000..3dd70933ed8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/atmel,at91rm9200-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip GPIO controller (PIO)
+
+maintainers:
+  - Manikandan Muralidharan <manikandan.m@microchip.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - atmel,at91sam9x5-gpio
+              - microchip,sam9x60-gpio
+          - const: atmel,at91rm9200-gpio
+      - items:
+          - enum:
+              - microchip,sam9x7-gpio
+          - const: microchip,sam9x60-gpio
+          - const: atmel,at91rm9200-gpio
+      - items:
+          - const: atmel,at91rm9200-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  gpio-controller: true
+  gpio-line-names: true
+
+  "#gpio-cells":
+    const: 2
+
+  clocks:
+    maxItems: 1
+
+  "#gpio-lines":
+    description:
+      Number of gpio, 32 by default if absent
+    maxItems: 1
+    default: 32
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - gpio-controller
+  - "#gpio-cells"
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gpio@fffff400 {
+            compatible = "atmel,at91rm9200-gpio";
+            reg = <0xfffff400 0x200>;
+            interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
+            #gpio-cells = <2>;
+            gpio-controller;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/gpio/gpio_atmel.txt b/Documentation/devicetree/bindings/gpio/gpio_atmel.txt
deleted file mode 100644
index 29416f9c3220..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio_atmel.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-* Atmel GPIO controller (PIO)
-
-Required properties:
-- compatible: "atmel,<chip>-gpio", where <chip> is at91rm9200 or at91sam9x5.
-- reg: Should contain GPIO controller registers location and length
-- interrupts: Should be the port interrupt shared by all the pins.
-- #gpio-cells: Should be two.  The first cell is the pin number and
-  the second cell is used to specify optional parameters to declare if the GPIO
-  is active high or low. See gpio.txt.
-- gpio-controller: Marks the device node as a GPIO controller.
-- interrupt-controller: Marks the device node as an interrupt controller.
-- #interrupt-cells: Should be two. The first cell is the pin number and the
-  second cell is used to specify irq type flags, see the two cell description
-  in interrupt-controller/interrupts.txt for details.
-
-optional properties:
-- #gpio-lines: Number of gpio if absent 32.
-
-
-Example:
-	pioA: gpio@fffff200 {
-		compatible = "atmel,at91rm9200-gpio";
-		reg = <0xfffff200 0x100>;
-		interrupts = <2 4>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		#gpio-lines = <19>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
-
-- 
2.25.1


