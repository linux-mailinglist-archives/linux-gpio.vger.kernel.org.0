Return-Path: <linux-gpio+bounces-28012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C84A6C3085F
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 11:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E23824ECB0F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 10:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0018D2D63F6;
	Tue,  4 Nov 2025 10:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gh7LKqQm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6894921B195;
	Tue,  4 Nov 2025 10:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762252318; cv=none; b=Ij2TWoClvEjRC+HdyN9B+F0z0p9sbipyqMOnkGmXm84EUcQIZbC4lYiJ0kKJETrH7wkz+UK1EHgseQRCPgpcTBLq2JHzZKoSOgNWpmlGAhsj0Kl/GOTOyPFAEMZ0M3kt3msh3AtOL2Zb8nYhNWjxYkpF9aPAaLp/LdQXcC4vfcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762252318; c=relaxed/simple;
	bh=M+JYR9bmCi7uYGRZcI3gMRJEll/2492VtyCauNZ0P/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MlpuNbycNaarLU9HWb61RQdGmVrP/sJQS97wQHV9/xfATIzG4PC550e2jwWyAwc6Yz8LuYBwRqeqjnaSku5v/drwxB99rePMK6L2tE38audEn3T9mhQZExjydLPdchjBS6ejrBqEHGjl6C+V7NvpPeToEB5vvW8urHh+xCzPjXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gh7LKqQm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3141C16AAE;
	Tue,  4 Nov 2025 10:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762252318;
	bh=M+JYR9bmCi7uYGRZcI3gMRJEll/2492VtyCauNZ0P/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gh7LKqQmY241EBN8+LFcQI5m4sFu9pjmIJIoh34hn31ChpxGnfFQXfUI9bWjScTOI
	 7m1TR/Ma+LoFPhGeCj637+7+/kK5ofhoveRlI5vnB23x9kN3KZzgka9gVx84twYlnN
	 ZlhMASTn6h/yT8K7VgENIXK0DovHCRQxJJ2FowGqtrgwSp5BE7sSpDjdtnOAtaNGP2
	 wEcW63+L8dDsPScdUiec0rttGOcDnHX7W5J7NVH8FDIy4Pgkdn4YykWwm1eWcq4T/b
	 AOc2uGnqvqib53cCDQTiNw10PfSvZuULKySElHH1s8Lo7PXNLI4OV53mO0aMPwedHR
	 3iW9iehVLyrbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D583BCCFA04;
	Tue,  4 Nov 2025 10:31:57 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Tue, 04 Nov 2025 10:32:28 +0000
Subject: [PATCH v3 1/3] dt-bindings: hwmon: Document the LTC4283 Swap
 Controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251104-ltc4283-support-v3-1-4bea496f791d@analog.com>
References: <20251104-ltc4283-support-v3-0-4bea496f791d@analog.com>
In-Reply-To: <20251104-ltc4283-support-v3-0-4bea496f791d@analog.com>
To: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762252353; l=9699;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=rrCdziHoeCW4MkgXDHChS+5SIrcoyAmECoytcxCIS+w=;
 b=2y0vA8sBqypOYDQQfpzzsWST+lGoFwq6He+AJVkTaLvgwc0UpjL9gQKm37cc/NqpwvtO8aTzF
 6ZXhlshhMBtCKhmqABSJvA2MROnjD6UkewWgH08sBIxDov6r8FFL1BU
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

The LTC4283 is a negative voltage hot swap controller that drives an
external N-channel MOSFET to allow a board to be safely inserted and
removed from a live backplane.

Special note for the "adi,vpower-drns-enable" property. It allows to choose
between the attenuated MOSFET drain voltage or the attenuated input
voltage at the RTNS pin (effectively choosing between input or output
power). This is a system level decision not really intended to change at
runtime and hence is being added as a Firmware property.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     | 272 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 278 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
new file mode 100644
index 000000000000..f82fff1ec7e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
@@ -0,0 +1,272 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/adi,ltc4283.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LTC4283 Negative Voltage Hot Swap Controller
+
+maintainers:
+  - Nuno Sá <nuno.sa@analog.com>
+
+description: |
+  The LTC4283 negative voltage hot swap controller drives an external N-channel
+  MOSFET to allow a board to be safely inserted and removed from a live
+  backplane.
+
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4283.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,ltc4283
+
+  reg:
+    maxItems: 1
+
+  adi,rsense-nano-ohms:
+    description: Value of the sense resistor.
+
+  adi,current-limit-sense-microvolt:
+    description:
+      The current limit sense voltage of the chip is adjustable between
+      15mV and 30mV in 1mV steps. This effectively limits the current
+      on the load.
+    minimum: 15000
+    maximum: 30000
+    default: 15000
+
+  adi,current-limit-foldback-factor:
+    description:
+      Specifies the foldback factor for the current limit. The current limit
+      can be reduced (folded back) to one of four preset levels. The value
+      represents the percentage of the current limit sense voltage to use
+      during foldback. A value of 100 means no foldback.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [10, 20, 50, 100]
+    default: 100
+
+  adi,cooling-delay-ms:
+    description:
+      Cooling time to apply after an overcurrent fault, FET bad or
+      external fault.
+    enum: [512, 1002, 2005, 4100, 8190, 16400, 32800, 65600]
+    default: 512
+
+  adi,fet-bad-timer-delay-ms:
+    description:
+      FET bad timer delay. After a FET bad status condition is detected,
+      this timer is started. If the condition persists for the
+      specified time, the FET is turned off and a fault is logged.
+    enum: [256, 512, 1002, 2005]
+    default: 256
+
+  adi,power-good-reset-on-fet:
+    description:
+      If set, resets the power good status when the MOSFET is turned off.
+      Otherwise, it resets when a low output voltage is detected.
+    type: boolean
+
+  adi,fet-turn-off-disable:
+    description:
+      If set, the MOSFET is turned off immediately when a FET fault is detected.
+    type: boolean
+
+  adi,tmr-pull-down-disable:
+    description: Disables 2uA pull-down current on the TMR pin.
+    type: boolean
+
+  adi,dvdt-inrush-control-disable:
+    description:
+      Enables dV/dt inrush control during startup. In dV/dt mode, the inrush
+      current is limited by controlling a constant output voltage ramp rate.
+      If not set, the inrush control mechanism is active current limiting.
+    type: boolean
+
+  adi,fault-log-enable:
+    description:
+      If set, enables logging fault registers and ADC data into EEPROM upon a
+      fault.
+    type: boolean
+
+  adi,vpower-drns-enable:
+    description:
+      If set, enables the attenuated MOSFET drain voltage to be monitored. This
+      effectively means that the MOSFET power is monitored. If not set, the
+      attenuated input voltage (and hence input power) is monitored.
+    type: boolean
+
+  adi,external-fault-fet-off-enable:
+    description: Turns MOSFET off following an external fault.
+    type: boolean
+
+  adi,undervoltage-retry-disable:
+    description: Do not retry to turn on the MOSFET after an undervoltage fault.
+    type: boolean
+
+  adi,overvoltage-retry-disable:
+    description: Do not retry to turn on the MOSFET after an overvoltage fault.
+    type: boolean
+
+  adi,external-fault-retry-enable:
+    description: Retry to turn on the MOSFET retry after an external fault.
+    type: boolean
+
+  adi,overcurrent-retries:
+    description: Configures auto-retry following an Overcurrent fault.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [latch-off, "1", "7", unlimited]
+    default: latch-off
+
+  adi,fet-bad-retries:
+    description:
+      Configures auto-retry following a FET bad fault and a consequent MOSFET
+      turn off.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [latch-off, "1", "7", unlimited]
+    default: latch-off
+
+  adi,pgio1-func:
+    description: Configures the function of the PGIO1 pin.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [inverted_power_good, power_good, gpio]
+    default: inverted_power_good
+
+  adi,pgio2-func:
+    description: Configures the function of the PGIO2 pin.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [inverted_power_good, power_good, gpio, active_current_limiting]
+    default: inverted_power_good
+
+  adi,pgio3-func:
+    description: Configures the function of the PGIO3 pin.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [inverted_power_good_input, power_good_input, gpio]
+    default: inverted_power_good_input
+
+  adi,pgio4-func:
+    description: Configures the function of the PGIO4 pin.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [inverted_external_fault, external_fault, gpio]
+    default: inverted_external_fault
+
+  adi,gpio-on-adio1:
+    description: If set, the ADIO1 pin is used as a GPIO.
+    type: boolean
+
+  adi,gpio-on-adio2:
+    description: If set, the ADIO2 pin is used as a GPIO.
+    type: boolean
+
+  adi,gpio-on-adio3:
+    description: If set, the ADIO3 pin is used as a GPIO.
+    type: boolean
+
+  adi,gpio-on-adio4:
+    description: If set, the ADIO4 pin is used as a GPIO.
+    type: boolean
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+dependencies:
+  adi,gpio-on-adio1:
+    - gpio-controller
+    - '#gpio-cells'
+  adi,gpio-on-adio2:
+    - gpio-controller
+    - '#gpio-cells'
+  adi,gpio-on-adio3:
+    - gpio-controller
+    - '#gpio-cells'
+  adi,gpio-on-adio4:
+    - gpio-controller
+    - '#gpio-cells'
+  adi,external-fault-retry-enable:
+    - adi,pgio4-func
+  adi,external-fault-fet-off-enable:
+    - adi,pgio4-func
+
+required:
+  - compatible
+  - reg
+  - adi,rsense-nano-ohms
+
+allOf:
+  - if:
+      properties:
+        adi,pgio1-func:
+          const: gpio
+      required:
+        - adi,pgio1-func
+    then:
+      required:
+        - gpio-controller
+        - '#gpio-cells'
+
+  - if:
+      properties:
+        adi,pgio2-func:
+          const: gpio
+      required:
+        - adi,pgio2-func
+    then:
+      required:
+        - gpio-controller
+        - '#gpio-cells'
+
+  - if:
+      properties:
+        adi,pgio3-func:
+          const: gpio
+      required:
+        - adi,pgio3-func
+    then:
+      required:
+        - gpio-controller
+        - '#gpio-cells'
+
+  - if:
+      properties:
+        adi,pgio4-func:
+          const: gpio
+      required:
+        - adi,pgio4-func
+    then:
+      properties:
+        adi,external-fault-retry-enable: false
+        adi,external-fault-fet-off-enable: false
+      required:
+        - gpio-controller
+        - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        swap-controller@15 {
+            compatible = "adi,ltc4283";
+            reg = <0x15>;
+
+            adi,rsense-nano-ohms = <500>;
+            adi,current-limit-sense-microvolt = <25000>;
+            adi,current-limit-foldback-factor = <10>;
+            adi,cooling-delay-ms = <8190>;
+            adi,fet-bad-timer-delay-ms = <512>;
+
+            adi,external-fault-fet-off-enable;
+            adi,pgio4-func = "external_fault";
+
+            adi,gpio-on-adio1;
+            adi,pgio1-func = "gpio";
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 4a6e00df8a38..352d3cc06809 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14755,6 +14755,12 @@ F:	Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
 F:	Documentation/hwmon/ltc4282.rst
 F:	drivers/hwmon/ltc4282.c
 
+LTC4283 HARDWARE MONITOR AND GPIO DRIVER
+M:	Nuno Sá <nuno.sa@analog.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
+
 LTC4286 HARDWARE MONITOR DRIVER
 M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.51.0



