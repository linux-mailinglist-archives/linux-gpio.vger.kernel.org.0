Return-Path: <linux-gpio+bounces-7643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91529914703
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 12:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DB221C22459
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 10:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A880A137C2E;
	Mon, 24 Jun 2024 10:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ZqGsq+c8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8F213776F;
	Mon, 24 Jun 2024 10:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719223538; cv=none; b=OGUt5sMR4ahmj/RGxWT18jpNGmC9B0zuA0aop+UYwnwf5HfamlYv3bGFioOm3z5PutnIpD80e6fNTVC1j0y84018GJTXOCAvSkCc/Yi77Mkeenoi28IhT/I+lnaVO56YarDhScmKpKTpGkX1TXNY8YhWiDipw2lt5nusobGPSM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719223538; c=relaxed/simple;
	bh=Jy+iqPN5Zb7Kn9IXKcX6+h/JWaI/5Q1D63qOdm1UZHc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y3+LUcpbwxC0znBY6H2FsbxUYhDTP30F0AratiJ6Ch71AdL1pIwGQ02Oszcu3A9vI91fFHoPOChdVumB9ovj57x2BJLJFcu0xtksuN9UrUdPuE7kODYLdImK9IVeCMIpEnx3NULLwh2WWvSQc8+wU/Cf3UuZbsB42PMrdi0fKDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ZqGsq+c8; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719223537; x=1750759537;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jy+iqPN5Zb7Kn9IXKcX6+h/JWaI/5Q1D63qOdm1UZHc=;
  b=ZqGsq+c8qD9uA0UaiX9SjoIE/BEJoXgS74L65PEb9B5M/C0eKeGS7qM2
   DbYDWGEQKoqAYhKpR+Y6xVrqHatXQXAiBQraLjmIr3KbViSjQh1UM7q9I
   wqNXRmmYgLEFroJE9POkmdLX4mXMaG9Yy6h2UmTRidNN6NA3PlWLcd7m7
   FiNFcNqQb4lFL3ZOSWlCY2VqybSyYwa/ALN6GNBbbejfejIZedoOGV6ji
   +eXLRyTQl5OuUYZBG9jlOzWxkT7do26xlqHgF/w+MP0Q2qsuF0dTJvnBX
   R72jY37Hx+fSf853Sacelz//oYCdlt8NrxX4N+2Au4AZVQGnXS6RDG9UJ
   A==;
X-CSE-ConnectionGUID: gbDFkw3jSdy2cxhwngM2TQ==
X-CSE-MsgGUID: PziRlTldTwCKcrczNWRR1A==
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="29041039"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2024 03:05:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Jun 2024 03:05:20 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 24 Jun 2024 03:05:12 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<durai.manickamkr@microchip.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <Balamanikandan.Gunasundar@microchip.com>,
	<Durai.ManickamKR@microchip.com>, <Nayabbasha.Sayed@microchip.com>,
	<Dharma.B@microchip.com>, <Varshini.Rajendran@microchip.com>,
	<Balakrishnan.S@microchip.com>, <Charan.Pedumuru@microchip.com>, "Manikandan
 Muralidharan" <manikandan.m@microchip.com>
Subject: [PATCH 4/5] dt-bindings: gpio: convert Atmel GPIO to json-schema
Date: Mon, 24 Jun 2024 15:34:30 +0530
Message-ID: <20240624100431.191172-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240624100431.191172-1-manikandan.m@microchip.com>
References: <20240624100431.191172-1-manikandan.m@microchip.com>
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

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../bindings/gpio/atmel,at91rm9200-gpio.yaml  | 78 +++++++++++++++++++
 .../devicetree/bindings/gpio/gpio_atmel.txt   | 31 --------
 2 files changed, 78 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_atmel.txt

diff --git a/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
new file mode 100644
index 000000000000..3ace7ba687fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
@@ -0,0 +1,78 @@
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
+    pioA: gpio@fffff400 {
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


