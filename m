Return-Path: <linux-gpio+bounces-7667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B47A0915DAE
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 06:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E0D0B20D9E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 04:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4646813C9A2;
	Tue, 25 Jun 2024 04:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="KLzn8CFH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627A913C682;
	Tue, 25 Jun 2024 04:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719290196; cv=none; b=DNamKp8S8L2MtTaBii0yydfkZiAB7yvFyf4EGSTA5trtHl18+C6nw5WZktePy+rLcALA6wnNQaCywZaJokIs+BWx7MfQA9F0iZbQQx92/tGgS+yB6K5wHrRr/gqsni4BRmGqnBo12IL82+lYSCxSqCzerPcazfwvhS4N5qjiGPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719290196; c=relaxed/simple;
	bh=puFxjvjjB6a4HtmjgHqz62T3yxPAylOcUIy/Wguo/BQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BNpL/ksUBW/mSeoM+WVN2WUShqJnCR+EOxFqVi2m/TH3nBZAwxfzfbKS3k3cDcVH5q6p/6xnVQOici4BpJzD0gyG5I3tE/oHpHVglu6zegNb3e2Ze4YFNm7BRicpGkrcNCA4fgc9e2nPX/yBrGU1/RysSz+5/QiLUJAQI/OviS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=KLzn8CFH; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719290194; x=1750826194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=puFxjvjjB6a4HtmjgHqz62T3yxPAylOcUIy/Wguo/BQ=;
  b=KLzn8CFHE6EhReEYHx4WXdNbrBgq8vSeAXKPrIJiVUSoSu/aHULN/5/1
   5atO9O4AKD+rZumie4EKXxqDRJ4tafGlEAfXpiFE0Q/H9XksAs1itYvws
   hrYxAFXs+gCcLSflmohygQKB3VV/UuOgfSZmHO9LA9v5XipfFjTZBVKXz
   hZnotrCem6pctSNr8dgEs1HzTAeS/goAOawooYFLOrA/9Cmisg2PFDXTz
   V8O+TFhfYGaWVt04NTINx8EHkpNNC1tSJCLPbjYPmKpTadrbmm9VutuKr
   PmtyaYkf1VDSdB4atvK8yaBqd0LO94ny8zSBMbs31160LtKiGNRySAyAj
   g==;
X-CSE-ConnectionGUID: GBVTrIN9ThaMEpX7MY3+Kw==
X-CSE-MsgGUID: vBwZ9LkyTDaF6Shq9ND9/Q==
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="28457235"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2024 21:36:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Jun 2024 21:36:03 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 24 Jun 2024 21:35:55 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<durai.manickamkr@microchip.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v2 4/5] dt-bindings: gpio: convert Atmel GPIO to json-schema
Date: Tue, 25 Jun 2024 10:05:24 +0530
Message-ID: <20240625043525.279711-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240625043525.279711-1-manikandan.m@microchip.com>
References: <20240625043525.279711-1-manikandan.m@microchip.com>
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
The compatible string "microchip,sam9x7-gpio" is added as well.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
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


