Return-Path: <linux-gpio+bounces-25470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 823FEB41B17
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 12:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E0F63A7839
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16392E9726;
	Wed,  3 Sep 2025 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbqJid+e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF0A23D7DF;
	Wed,  3 Sep 2025 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893882; cv=none; b=Hl8OuVCVjv5aTbf1rWCYHe3+vyVG3X/KeFmY5I6aoRDpojQ6HtFoB1Dc2D277+z/ODV6qrYAmTUR+nvwhE9PHKNsb9gdL9LkbyKHhyRZewk/XpyA239A+m9tZu14v3TPTyxfbkVhdxCgO6I1UoB/iEXKYziCS3oXhO/Zo/lSWIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893882; c=relaxed/simple;
	bh=F7jiQJJ0Arj0SsCg1Sus/fH9GOdatnDmKdjnftSjOiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nf1sCEUQ5Ou3v1XKmPc+PKLfhka4/uhH1pzTe0KnZpDfd4it6F+qrjxk040KjrkUfR0pmuqZtYtwWuDNsSultxkvdGJEtUCJSPeBxGGQzWl4R6jwf9DngXR41a0HClRu1PYn8xWeeruly20FVUkiJItyKZ+xMbEFXfCVVwaNRK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbqJid+e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 103DAC4CEF1;
	Wed,  3 Sep 2025 10:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756893882;
	bh=F7jiQJJ0Arj0SsCg1Sus/fH9GOdatnDmKdjnftSjOiM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AbqJid+eCE8PdQUeZADMfvZzOLPD8t5qMmfiRzThvroZM5/mqvCiXt7xdd2Nzk8x9
	 OhKi74Mtjcp2JpFWxCvWsoEERHbSQYtAdPhe3BZaukLRijIH9CTfex4qx1+rI9Yt0z
	 n7S0NQY5eHi6m5/uIAXpaQEHtlONfs3v5sQvAGuMBJPkijeRDtlo3qo5HIX782RAa8
	 /9HbOr6hTKmd0qcMtRoIiR7IzTXf9bSSPd/ffUCKVEQfhd/OQJyyo/k5rY6tZxdxJL
	 gudHd2XaJ8uqorlzLjwhELfdcuTzFDcPGty3YlPycANUuuWlC91cjNItJBWKFYk+8l
	 0WVmwEb4C0pOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02B5CA1010;
	Wed,  3 Sep 2025 10:04:41 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 03 Sep 2025 11:04:59 +0100
Subject: [PATCH v2 1/3] dt-binbings: hwmon: Document the LTC4283 Swap
 Controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-ltc4283-support-v2-1-6bce091510bf@analog.com>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
In-Reply-To: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
To: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756893904; l=9919;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=Q8urpP5KA+O3SuQUrjmrNw6UY+zsMMUBzdKWe+DJL4g=;
 b=LmOB5Zp2+XxZth6mbPyiFanhAb56t9HtiejnGFTcwDiflgmW45rd02w1bOA/TLjPEuiVhXxM8
 jGvtWKTiUWeCE3OM/MkfmVsMCxxSPr05Rp4+zRNfZ/yzoSjQ/2uAwda
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

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     | 280 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 286 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ec7768467e66f18f06d8a5258b3b115f23ea996d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
@@ -0,0 +1,280 @@
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
+      required:
+        - adi,pgio1-func
+    then:
+      if:
+        properties:
+          adi,pgio1-func:
+            const: gpio
+      then:
+        required:
+          - gpio-controller
+          - '#gpio-cells'
+
+  - if:
+      required:
+        - adi,pgio2-func
+    then:
+      if:
+        properties:
+          adi,pgio2-func:
+            const: gpio
+      then:
+        required:
+          - gpio-controller
+          - '#gpio-cells'
+
+  - if:
+      required:
+        - adi,pgio3-func
+    then:
+      if:
+        properties:
+          adi,pgio3-func:
+            const: gpio
+      then:
+        required:
+          - gpio-controller
+          - '#gpio-cells'
+
+  - if:
+      required:
+        - adi,pgio4-func
+    then:
+      if:
+        properties:
+          adi,pgio4-func:
+            const: gpio
+      then:
+        properties:
+          adi,external-fault-retry-enable: false
+          adi,external-fault-fet-off-enable: false
+        required:
+          - gpio-controller
+          - '#gpio-cells'
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
index e90710a9b40d7b32c151472a9ac3b02efd95f346..23a337246b99060161c620388c73829d9b98729d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14500,6 +14500,12 @@ F:	Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
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



