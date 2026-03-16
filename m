Return-Path: <linux-gpio+bounces-33536-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGd4D7MPuGmIYgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33536-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 15:12:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFB929B1C3
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 15:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EB2230D340C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F5D39F181;
	Mon, 16 Mar 2026 14:05:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5037539EF02
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 14:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669944; cv=none; b=Vej/3euAkHmAbSzGrGJvn8xEb+MSM8m5tL5r4z5LlrXndzkf64BySykckhOE35QJIQnCcIfAX0a6vWy/JnpPlVVXGEl3/yd1HPzyezOf4PvngGKOPRg7D8bS7Q4GYE51oze+Zn/XGig3Y4EaNr880BMWhOLz9sh9L0lR7wfNpVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669944; c=relaxed/simple;
	bh=w2cayKhnJu8ye/lzHmS7TUqZS4iKkejdVtlhAmsyXoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BiNGbYEMt48BB1Aw23RgvtGw/RNb2YfzBggZKhebu9c1VyiaIBOIqj94Zdzx1ZDTj8Md/EaamodtIt4mz/I/IMlZO7M0XfbL9tM36KzWEkrsMQJc8yD2o4jKOPqTsFtpTHXOPMOc3u5nnAXdJN+Cxqf5dvr9P98ietV4IsHFg+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w28ZI-0002G3-E8; Mon, 16 Mar 2026 15:05:16 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w28ZH-000a8K-2O;
	Mon, 16 Mar 2026 15:05:15 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w28ZH-00000005twU-2mcV;
	Mon, 16 Mar 2026 15:05:15 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v5 1/7] dt-bindings: pinctrl: add NXP MC33978/MC34978 MSDI
Date: Mon, 16 Mar 2026 15:05:06 +0100
Message-ID: <20260316140514.1406588-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316140514.1406588-1-o.rempel@pengutronix.de>
References: <20260316140514.1406588-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33536-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.936];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email,pengutronix.de:mid,protonic.nl:email,devicetree.org:url]
X-Rspamd-Queue-Id: 9DFB929B1C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree binding documentation for the NXP MC33978 and MC34978
Multiple Switch Detection Interface (MSDI) devices.

The MC33978 and MC34978 differ primarily in their operating temperature
ranges. While not software-detectable, providing specific compatible
strings allows the hwmon subsystem to correctly interpret thermal
thresholds and hardware faults.

These ICs monitor up to 22 mechanical switch contacts in automotive and
industrial environments. They provide configurable wetting currents to
break through contact oxidation and feature extensive hardware
protection against thermal overload and voltage transients (load
dumps/brown-outs).

The device interfaces via SPI. While it provides multiple functions, its
primary hardware purpose is pin/switch control. To accurately represent
the hardware as a single physical integrated circuit without unnecessary
DT overhead, all functions are flattened into a single pinctrl node:
- pinctrl: Exposing the 22 switch inputs (SG/SP pins) as a GPIO controller
  and managing their pin configurations.
- hwmon: Exposing critical hardware faults (OT, OV, UV) and static
  voltage/temperature thresholds.
- mux: Controlling the 24-to-1 analog multiplexer to route pin voltages,
  internal temperature, or battery voltage to an external SoC ADC.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
changes v5:
- Commit Message: Added justification for distinct compatible strings
  based on temperature ranges.
- Restricted pins property to an explicit enum of valid hardware pins
changes v4:
- Drop the standalone mfd/nxp,mc33978.yaml schema entirely.
- Move the unified device binding to bindings/pinctrl/nxp,mc33978.yaml,
- Remove the dedicated child node compatible strings (nxp,mc33978-pinctrl).
- Flatten the pinctrl/gpio properties directly into the main SPI device
  node.
changes v3:
- Drop regular expression pattern from pinctrl child node and define
  it as a standard property
- Reorder required properties list in MFD binding
- Remove stray blank line from the MFD binding devicetree example
- Replace unevaluatedProperties with additionalProperties in the pinctrl
  binding
changes v2:
- Squashed MFD, pinctrl, hwmon, and mux bindings into a single patch
- Removed the empty hwmon child node
- Folded the mux-controller node into the parent MFD node
- Added vbatp-supply and vddq-supply to the required properties block
- Changed the example node name from mc33978@0 to gpio@0
- Removed unnecessary literal block scalars (|) from descriptions
- Documented SG, SP, and SB pin acronyms in the pinctrl description
- Added consumer polarity guidance (GPIO_ACTIVE_LOW/HIGH) for SG/SB
  inputs, with a note on output circuit dependency
- Updated commit message
---
 .../bindings/pinctrl/nxp,mc33978.yaml         | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml
new file mode 100644
index 000000000000..e6227e95fee4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nxp,mc33978.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP MC33978/MC34978 Multiple Switch Detection Interface
+
+maintainers:
+  - David Jander <david@protonic.nl>
+  - Oleksij Rempel <o.rempel@pengutronix.de>
+
+description: |
+  The MC33978 and MC34978 are Multiple Switch Detection Interface (MSDI)
+  devices with 22 switch inputs, integrated fault detection, and analog
+  multiplexer (AMUX) for voltage/temperature monitoring.
+
+  Pin numbering:
+  - Pins 0-13: SG0-SG13 (Switch-to-Ground inputs). These pins monitor
+    contacts closed to ground and typically require GPIO_ACTIVE_LOW
+    flags when used as digital inputs.
+  - Pins 14-21: SP0-SP7 (Programmable inputs). These can be configured
+    as SG (Switch-to-Ground) or SB (Switch-to-Battery) inputs. SB
+    inputs monitor contacts closed to the battery voltage and typically
+    require GPIO_ACTIVE_HIGH flags when used as digital inputs.
+
+  Output Emulation:
+  The hardware lacks standard push-pull output drivers. Outputs are emulated
+  by toggling the programmable wetting current sources (acting as pull-ups
+  or pull-downs) and the hardware tri-state registers. Because of this
+  physical constraint:
+  - Consumers using pins as outputs MUST flag them with GPIO_OPEN_DRAIN or
+    GPIO_OPEN_SOURCE in the device tree.
+  - Push-pull configurations are physically unsupported.
+  - The active polarity depends entirely on the external circuit (e.g., how
+    an LED is wired) and must be flagged accordingly by the consumer.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nxp,mc33978
+      - nxp,mc34978
+
+  reg:
+    maxItems: 1
+    description: SPI chip select number
+
+  spi-max-frequency:
+    maximum: 8000000
+    description: Maximum SPI clock frequency (up to 8 MHz)
+
+  interrupts:
+    maxItems: 1
+    description:
+      INT_B pin interrupt. Active-low, indicates pin state changes or
+      fault conditions.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      First cell is the IRQ number (0-21 for pins, 22 for faults).
+      Second cell is the trigger type (IRQ_TYPE_* from interrupt-controller.h).
+
+  '#mux-control-cells':
+    const: 0
+    description:
+      Present if the device AMUX selector is used as a mux provider.
+      Consumers (e.g. io-channel-mux) must provide settle-time-us for the
+      external ADC sampling path.
+
+  vddq-supply:
+    description: Digital supply voltage
+
+  vbatp-supply:
+    description: Battery/power supply
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  ngpios:
+    const: 22
+
+patternProperties:
+  '^.*-grp$':
+    type: object
+    $ref: /schemas/pinctrl/pincfg-node.yaml#
+    additionalProperties: false
+    description: Pin configuration subnodes.
+    properties:
+      pins:
+        items:
+          enum: [sg0, sg1, sg2, sg3, sg4, sg5, sg6, sg7, sg8, sg9,
+                 sg10, sg11, sg12, sg13, sp0, sp1, sp2, sp3,
+                 sp4, sp5, sp6, sp7]
+
+      bias-pull-up: true
+      bias-pull-down: true
+      bias-high-impedance: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - vddq-supply
+  - vbatp-supply
+  - gpio-controller
+  - '#gpio-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        msdi: gpio@0 {
+            compatible = "nxp,mc33978";
+            reg = <0>;
+            spi-max-frequency = <4000000>;
+
+            interrupt-parent = <&gpiog>;
+            interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            vddq-supply = <&reg_3v3>;
+            vbatp-supply = <&reg_12v>;
+
+            #mux-control-cells = <0>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+            ngpios = <22>;
+
+            door-grp {
+                pins = "sg0";
+                bias-high-impedance;
+            };
+        };
+    };
-- 
2.47.3


