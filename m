Return-Path: <linux-gpio+bounces-32822-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CNcHmLQrmnEIwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32822-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 14:51:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD1223A0E3
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 14:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 729B93017AA3
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 13:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02803B4EB0;
	Mon,  9 Mar 2026 13:49:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AFE3D3492
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 13:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773064194; cv=none; b=HBkMpQDgdQ6UQXdZRJkegRzAhUXcgCHyBUxr/EeF8w5tZSYxn82xIPV+XR6/kGCwDOY2A4bsu54zwC9z8YN1aM8/JGkeSlafXWDbW0NjpOo0kZugk1gbGLGUeuek+yauIZT1NTYyRAsuKBZPHDv/uXqHNxwz/SjHYfXTF/3O77I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773064194; c=relaxed/simple;
	bh=9d3h03P42Cdvda2XkFTeus4f1oyw8dBft79tJ70bjRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXAvF4iPeYk0frvP2LJy86RRUqQKwrmmsiv8TYCnQE1GcC45GqXZPQ6JkWQqQGHm3QM8KIFjy+77dhV/oo+QcFkb37uADQAO5nEdF3GVd9W8X3wMtXk2aRoBtOqK5odSd/daUcfTtCfg5xxLLdolKTBx9k4lGTbzKrO2GxZSjZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vzaz5-0006ff-Ed; Mon, 09 Mar 2026 14:49:23 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vzaz2-004XYc-1Y;
	Mon, 09 Mar 2026 14:49:21 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vzaz3-0000000833g-3AFj;
	Mon, 09 Mar 2026 14:49:21 +0100
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
Subject: [PATCH v3 1/7] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
Date: Mon,  9 Mar 2026 14:49:12 +0100
Message-ID: <20260309134920.1918294-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309134920.1918294-1-o.rempel@pengutronix.de>
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
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
X-Rspamd-Queue-Id: 7BD1223A0E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32822-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.678];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,protonic.nl:email,pengutronix.de:mid,pengutronix.de:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add device tree binding documentation for the NXP MC33978 and MC34978
Multiple Switch Detection Interface (MSDI) devices.

These ICs monitor up to 22 mechanical switch contacts in automotive and
industrial environments. They provide configurable wetting currents to
break through contact oxidation and feature extensive hardware
protection against thermal overload and voltage transients (load
dumps/brown-outs).

The device interfaces via SPI and provides multiple functions. To
accurately represent the hardware without unnecessary DT overhead, the
binding is structured as follows:
- pinctrl: A dedicated child node managing the 22 switch inputs (SG/SP
  pins) and their GPIO configurations.
- hwmon: Integrated into the parent node, exposing critical hardware
  faults (OT, OV, UV) and static voltage/temperature thresholds.
- mux: Integrated into the parent node, controlling the 24-to-1 analog
  multiplexer to route pin voltages, internal temperature, or battery
  voltage to an external SoC ADC.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
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
 .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 112 ++++++++++++++++++
 .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  82 +++++++++++++
 2 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml b/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
new file mode 100644
index 000000000000..23520315d484
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/nxp,mc33978.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP MC33978/MC34978 Multiple Switch Detection Interface
+
+maintainers:
+  - David Jander <david@protonic.nl>
+  - Oleksij Rempel <o.rempel@pengutronix.de>
+
+description:
+  The MC33978 and MC34978 are Multiple Switch Detection Interface (MSDI)
+  devices with 22 switch inputs, integrated fault detection, and analog
+  multiplexer (AMUX) for voltage/temperature monitoring.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  $nodename:
+    pattern: "^gpio(@.*)?$"
+
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
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/nxp,mc33978-pinctrl.yaml#
+    description:
+      Pinctrl and GPIO controller child node for the 22 switch inputs.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - vddq-supply
+  - vbatp-supply
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
+            pinctrl {
+                compatible = "nxp,mc33978-pinctrl";
+                gpio-controller;
+                #gpio-cells = <2>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
new file mode 100644
index 000000000000..ba946906557c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nxp,mc33978-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP MC33978/MC34978 Pinctrl/GPIO Driver
+
+maintainers:
+  - David Jander <david@protonic.nl>
+  - Oleksij Rempel <o.rempel@pengutronix.de>
+
+description: |
+  Pin control and GPIO driver for the MC33978/MC34978 MSDI device.
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
+  by toggling the programmable wetting current sources (acting as pull-ups or
+  pull-downs) and the hardware tri-state registers. Because of this physical
+  constraint:
+  - Consumers using pins as outputs MUST flag them with GPIO_OPEN_DRAIN or
+    GPIO_OPEN_SOURCE in the device tree.
+  - Push-pull configurations are physically unsupported.
+  - The active polarity depends entirely on the external circuit (e.g., how an
+    LED is wired) and must be flagged accordingly by the consumer.
+
+properties:
+  compatible:
+    enum:
+      - nxp,mc33978-pinctrl
+      - nxp,mc34978-pinctrl
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
+  "^.*-grp$":
+    type: object
+    $ref: pincfg-node.yaml#
+    additionalProperties: false
+    description:
+      Pin configuration subnodes.
+    properties:
+      pins: true
+      bias-pull-up: true
+      bias-pull-down: true
+      bias-high-impedance: true
+
+required:
+  - compatible
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl {
+        compatible = "nxp,mc33978-pinctrl";
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <22>;
+
+        door-grp {
+            pins = "sg0";
+            bias-high-impedance;
+        };
+    };
-- 
2.47.3


