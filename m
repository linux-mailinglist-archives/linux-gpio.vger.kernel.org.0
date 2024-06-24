Return-Path: <linux-gpio+bounces-7644-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A0F91470B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 12:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39710B24E2B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 10:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07EF1369A5;
	Mon, 24 Jun 2024 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="pUniw+g9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BB3134410;
	Mon, 24 Jun 2024 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719223586; cv=none; b=tBH5gv695P814ohdX5hKzzOyvNeiTkPb8Sezq8d1ITWFR7f70/gQDeCU31vBGn0JcmNIRQtuEJdt8/seAPo0uv5OHrwYDHcT//vDWg7rwSx0pjylPjf8LpBFoGkssSFnUs71Hp9tSA9/3a9QIvrdHlS3NnBP1M0Pt53NyPIapgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719223586; c=relaxed/simple;
	bh=lvbTAI0rTXEHWYPO4O7pbLFaE1pKeDFVwBFT1CU5tPk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HYyXhux8FOg9yosONyFA123/hROWWj3qzHCv6/m5GW6J7Jy5zEnDt437BvfxZ6vZKUelTsENZk+E5O2MUr/ujstJ1F8xGDtCr0Z52BNkgmnO+MNJ/MSzTpS7xH9eed3GT7muet0kVicEQWLEay4goNQxY6JHzStdVMMr/gcllas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=pUniw+g9; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719223584; x=1750759584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lvbTAI0rTXEHWYPO4O7pbLFaE1pKeDFVwBFT1CU5tPk=;
  b=pUniw+g9dteK7TnuNX5BneWA9yV2x5J0s0lH7bAOCxE0X+FEHRjroRnf
   ScomGJnN3Jh6BSzjPwK1Sq64MLnhzN7rJdeSn6Z6MgHggsaoX7HZNsMNQ
   sewXIXGsclAS2UXbxpJsC7ub65rqrwx+n51zwO++d1QDv0Ckd90OO2Ka9
   3miAX7NcJTymbqtEVOUM5/FTus/wKMMZKbo9cNW4fBb6nxhz0sf2pexfa
   OTKV/brCWS+0tvI0uQ7cxKsRLIDZP0hm4QoyzFRkW/OWZDhe2YO21ihms
   RMvMDpcgtZoFvgYFUOuV5nilYYdxVdpMYvS8AqoUts8l+9b0CIbE5dE5s
   Q==;
X-CSE-ConnectionGUID: 870JG7q4ROaAZq76WtdGwQ==
X-CSE-MsgGUID: irsglmI6REalGvhYTVqQeA==
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="30938835"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2024 03:06:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Jun 2024 03:05:29 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 24 Jun 2024 03:05:21 -0700
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
Subject: [PATCH 5/5] dt-bindings: pinctrl: Convert Atmel PIO3 pinctrl to json-schema
Date: Mon, 24 Jun 2024 15:34:31 +0530
Message-ID: <20240624100431.191172-6-manikandan.m@microchip.com>
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

Convert Atmel PIO3 pinctrl binding document to DT schema format
json-schema.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../bindings/pinctrl/atmel,at91-pinctrl.txt   | 178 ----------------
 .../pinctrl/atmel,at91rm9200-pinctrl.yaml     | 194 ++++++++++++++++++
 2 files changed, 194 insertions(+), 178 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
deleted file mode 100644
index 0aa1a53012d6..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
+++ /dev/null
@@ -1,178 +0,0 @@
-* Atmel AT91 Pinmux Controller
-
-The AT91 Pinmux Controller, enables the IC
-to share one PAD to several functional blocks. The sharing is done by
-multiplexing the PAD input/output signals. For each PAD there are up to
-8 muxing options (called periph modes). Since different modules require
-different PAD settings (like pull up, keeper, etc) the controller controls
-also the PAD settings parameters.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-Atmel AT91 pin configuration node is a node of a group of pins which can be
-used for a specific device or function. This node represents both mux and config
-of the pins in that group. The 'pins' selects the function mode(also named pin
-mode) this pin can work on and the 'config' configures various pad settings
-such as pull-up, multi drive, etc.
-
-Required properties for iomux controller:
-- compatible: "atmel,at91rm9200-pinctrl" or "atmel,at91sam9x5-pinctrl"
-		or "atmel,sama5d3-pinctrl" or "microchip,sam9x60-pinctrl"
-		or "microchip,sam9x7-pinctrl", "microchip,sam9x60-pinctrl"
-- atmel,mux-mask: array of mask (periph per bank) to describe if a pin can be
-  configured in this periph mode. All the periph and bank need to be describe.
-
-How to create such array:
-
-Each column will represent the possible peripheral of the pinctrl
-Each line will represent a pio bank
-
-Take an example on the 9260
-Peripheral: 2 ( A and B)
-Bank: 3 (A, B and C)
-=>
-
-  /*    A         B     */
-  0xffffffff 0xffc00c3b  /* pioA */
-  0xffffffff 0x7fff3ccf  /* pioB */
-  0xffffffff 0x007fffff  /* pioC */
-
-For each peripheral/bank we will describe in a u32 if a pin can be
-configured in it by putting 1 to the pin bit (1 << pin)
-
-Let's take the pioA on peripheral B
-From the datasheet Table 10-2.
-Peripheral B
-PA0	MCDB0
-PA1	MCCDB
-PA2
-PA3	MCDB3
-PA4	MCDB2
-PA5	MCDB1
-PA6
-PA7
-PA8
-PA9
-PA10	ETX2
-PA11	ETX3
-PA12
-PA13
-PA14
-PA15
-PA16
-PA17
-PA18
-PA19
-PA20
-PA21
-PA22	ETXER
-PA23	ETX2
-PA24	ETX3
-PA25	ERX2
-PA26	ERX3
-PA27	ERXCK
-PA28	ECRS
-PA29	ECOL
-PA30	RXD4
-PA31	TXD4
-
-=> 0xffc00c3b
-
-Required properties for pin configuration node:
-- atmel,pins: 4 integers array, represents a group of pins mux and config
-  setting. The format is atmel,pins = <PIN_BANK PIN_BANK_NUM PERIPH CONFIG>.
-  The PERIPH 0 means gpio, PERIPH 1 is periph A, PERIPH 2 is periph B...
-  PIN_BANK 0 is pioA, PIN_BANK 1 is pioB...
-
-Bits used for CONFIG:
-PULL_UP		(1 << 0): indicate this pin needs a pull up.
-MULTIDRIVE	(1 << 1): indicate this pin needs to be configured as multi-drive.
-			Multi-drive is equivalent to open-drain type output.
-DEGLITCH	(1 << 2): indicate this pin needs deglitch.
-PULL_DOWN	(1 << 3): indicate this pin needs a pull down.
-DIS_SCHMIT	(1 << 4): indicate this pin needs to the disable schmitt trigger.
-DRIVE_STRENGTH (3 << 5): indicate the drive strength of the pin using the
-			following values:
-				00 - No change (reset state value kept)
-				01 - Low
-				10 - Medium
-				11 - High
-OUTPUT		(1 << 7): indicate this pin need to be configured as an output.
-OUTPUT_VAL	(1 << 8): output val (1 = high, 0 = low)
-SLEWRATE	(1 << 9): slew rate of the pin: 0 = disable, 1 = enable
-DEBOUNCE	(1 << 16): indicate this pin needs debounce.
-DEBOUNCE_VAL	(0x3fff << 17): debounce value.
-
-NOTE:
-Some requirements for using atmel,at91rm9200-pinctrl binding:
-1. We have pin function node defined under at91 controller node to represent
-   what pinmux functions this SoC supports.
-2. The driver can use the function node's name and pin configuration node's
-   name describe the pin function and group hierarchy.
-   For example, Linux at91 pinctrl driver takes the function node's name
-   as the function name and pin configuration node's name as group name to
-   create the map table.
-3. Each pin configuration node should have a phandle, devices can set pins
-   configurations by referring to the phandle of that pin configuration node.
-4. The gpio controller must be describe in the pinctrl simple-bus.
-
-For each bank the required properties are:
-- compatible: "atmel,at91sam9x5-gpio" or "atmel,at91rm9200-gpio" or
-  "microchip,sam9x60-gpio"
-  or "microchip,sam9x7-gpio", "microchip,sam9x60-gpio", "atmel,at91rm9200-gpio"
-- reg: physical base address and length of the controller's registers
-- interrupts: interrupt outputs from the controller
-- interrupt-controller: marks the device node as an interrupt controller
-- #interrupt-cells: should be 2; refer to ../interrupt-controller/interrupts.txt
-  for more details.
-- gpio-controller
-- #gpio-cells: should be 2; the first cell is the GPIO number and the second
-  cell specifies GPIO flags as defined in <dt-bindings/gpio/gpio.h>.
-- clocks: bank clock
-
-Examples:
-
-pinctrl@fffff400 {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-	compatible = "atmel,at91rm9200-pinctrl", "simple-bus";
-	reg = <0xfffff400 0x600>;
-
-	pioA: gpio@fffff400 {
-		compatible = "atmel,at91sam9x5-gpio";
-		reg = <0xfffff400 0x200>;
-		interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
-	};
-
-	atmel,mux-mask = <
-	      /*    A         B     */
-	       0xffffffff 0xffc00c3b  /* pioA */
-	       0xffffffff 0x7fff3ccf  /* pioB */
-	       0xffffffff 0x007fffff  /* pioC */
-	      >;
-
-	/* shared pinctrl settings */
-	dbgu {
-		pinctrl_dbgu: dbgu-0 {
-			atmel,pins =
-				<1 14 0x1 0x0	/* PB14 periph A */
-				 1 15 0x1 0x1>;	/* PB15 periph A with pullup */
-		};
-	};
-};
-
-dbgu: serial@fffff200 {
-	compatible = "atmel,at91sam9260-usart";
-	reg = <0xfffff200 0x200>;
-	interrupts = <1 4 7>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_dbgu>;
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml
new file mode 100644
index 000000000000..12752416eb24
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml
@@ -0,0 +1,194 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/atmel,at91rm9200-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIO3 Pinmux Controller
+
+maintainers:
+  - Manikandan Muralidharan <manikandan.m@microchip.com>
+
+description:
+  The AT91 Pinmux Controller, enables the IC to share one PAD to several
+  functional blocks. The sharing is done by multiplexing the PAD input/output
+  signals. For each PAD there are up to 8 muxing options (called periph modes).
+  Since different modules require different PAD settings (like pull up, keeper,
+  etc) the controller controls also the PAD settings parameters.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - atmel,at91rm9200-pinctrl
+              - atmel,at91sam9x5-pinctrl
+              - atmel,sama5d3-pinctrl
+              - microchip,sam9x60-pinctrl
+          - const: simple-mfd
+      - items:
+          - enum:
+              - microchip,sam9x7-pinctrl
+          - const: microchip,sam9x60-pinctrl
+          - const: simple-mfd
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges: true
+
+  atmel,mux-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description: |
+      Array of mask (periph per bank) to describe if a pin can be
+      configured in this periph mode. All the periph and bank need to
+      be described.
+
+      #How to create such array:
+
+      Each column will represent the possible peripheral of the pinctrl
+      Each line will represent a pio bank
+
+      #Example:
+
+      In at91sam9260.dtsi,
+      Peripheral: 2 ( A and B)
+      Bank: 3 (A, B and C)
+
+      #    A          B
+      0xffffffff 0xffc00c3b  # pioA
+      0xffffffff 0x7fff3ccf  # pioB
+      0xffffffff 0x007fffff  # pioC
+
+      For each peripheral/bank we will describe in a u32 if a pin can be
+      configured in it by putting 1 to the pin bit (1 << pin)
+
+      Let's take the pioA on peripheral B whose value is 0xffc00c3b
+      From the datasheet Table 10-2.
+      Peripheral B
+      PA0     MCDB0
+      PA1     MCCDB
+      PA2
+      PA3     MCDB3
+      PA4     MCDB2
+      PA5     MCDB1
+      PA6
+      PA7
+      PA8
+      PA9
+      PA10    ETX2
+      PA11    ETX3
+      PA12
+      PA13
+      PA14
+      PA15
+      PA16
+      PA17
+      PA18
+      PA19
+      PA20
+      PA21
+      PA22    ETXER
+      PA23    ETX2
+      PA24    ETX3
+      PA25    ERX2
+      PA26    ERX3
+      PA27    ERXCK
+      PA28    ECRS
+      PA29    ECOL
+      PA30    RXD4
+      PA31    TXD4
+
+patternProperties:
+  '^[a-z0-9-_]+$':
+    description:
+      A pinctrl node should contain at least one subnode representing the
+      pinctrl group available on the machine.
+    additionalProperties: false
+
+    patternProperties:
+      '^[a-z0-9-_]+$':
+        type: object
+        properties:
+          atmel,pins:
+            $ref: /schemas/types.yaml#/definitions/uint32-matrix
+            description: |
+              Each entry consists of 4 integers and represents the pins
+              mux and config setting.The format is
+              atmel,pins = <PIN_BANK PIN_BANK_NUM PERIPH CONFIG>.
+              Supported pin number and mux varies for different SoCs, and
+              are defined in <include/dt-bindings/pinctrl/at91.h>.
+              items:
+                items:
+                  - description:
+                      Pin bank
+                  - description:
+                      Pin bank index
+                  - description:
+                      Peripheral function
+                  - description:
+                      Pad configuration
+
+        required:
+          - atmel,pins
+
+        additionalProperties: false
+
+  'gpio@[0-9a-f]*$':
+    $ref: "/schemas/gpio/atmel,at91rm9200-gpio.yaml"
+    unevaluatedProperties: false
+
+allOf:
+  - $ref: "pinctrl.yaml#"
+
+required:
+  - compatible
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+  - atmel,mux-mask
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/pinctrl/at91.h>
+
+    pinctrl@fffff400 {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      compatible = "atmel,at91rm9200-pinctrl", "simple-mfd";
+      ranges = <0xfffff400 0xfffff400 0x600>;
+
+      atmel,mux-mask = <
+        /*    A         B     */
+        0xffffffff 0xffc00c3b  /* pioA */
+        0xffffffff 0x7fff3ccf  /* pioB */
+        0xffffffff 0x007fffff  /* pioC */
+        >;
+
+      dbgu {
+        pinctrl_dbgu: dbgu-0 {
+                        atmel,pins =
+                          <AT91_PIOB 14 AT91_PERIPH_A AT91_PINCTRL_PULL_UP
+                           AT91_PIOB 15 AT91_PERIPH_A AT91_PINCTRL_NONE>;
+        };
+      };
+
+      pioA: gpio@fffff400 {
+              compatible = "atmel,at91rm9200-gpio";
+              reg = <0xfffff400 0x200>;
+              interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
+              #gpio-cells = <2>;
+              gpio-controller;
+              interrupt-controller;
+              #interrupt-cells = <2>;
+              clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
+      };
+    };
+...
-- 
2.25.1


