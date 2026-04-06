Return-Path: <linux-gpio+bounces-34714-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOqABmbG02mqlgcAu9opvQ
	(envelope-from <linux-gpio+bounces-34714-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 16:42:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE323A44E1
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 16:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C62623010276
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 14:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E585B3845D1;
	Mon,  6 Apr 2026 14:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcbQ8F5t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D4833B969;
	Mon,  6 Apr 2026 14:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486562; cv=none; b=YJw2Yyhlf8GoTSwVhE0t1UkSgqAiy63Zys/xCpmsQDpx2UaP7ra45xdj3Ifog6vrD4xFjVNLgy46vNHs2/g3udDQCFx7Wz3xPtUiA6SW3mGqGawvVAi5D43Au6udgqCILdXHcX6XbmOcmz185vJOV32oKtr4LGpTQwG/LPSe7ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486562; c=relaxed/simple;
	bh=YRAZwpdtLFzBHDJ6JvxbTm1XlKhjW+5RrwxjYrMbb+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EfcVj7haTwmMtmZE1FlS9FEAvIObve8A94vNP/OSYex/f6xPycByquP/P7/URazozfSfYkJ46r8yT1BtsyO79mg6dViZB/IRBFsbi8x+aLV/j56a46rozPMNhjqsSq7GiU5RNIsWNvNaqB7BxZYZY89MGn+WvqBoUk1wKWP37Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcbQ8F5t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 863F3C2BCAF;
	Mon,  6 Apr 2026 14:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775486562;
	bh=YRAZwpdtLFzBHDJ6JvxbTm1XlKhjW+5RrwxjYrMbb+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KcbQ8F5tJmq84jNkHQEPWRoXbRm66VrD9HqMuHn78ysI1F3f1Qas4oWsBxv0FaThj
	 TG7zyyAqD7VXhS61Yo7uzDAt631XNM24UIJMgafqFsvo81VtdcazAJ9gjuTzD2amtb
	 ViW7wdwWABovSJbg0HcG7G8WyVbzA7gw35b25m/OAszDCGDEWXm3dgpGinvfRgFD0D
	 hwrWO1VbFUtvWXmUcRBI6n5RPW6xfmjzokKd8jGlWSFrxGLVjHwoFKr8wzgAyuPoTE
	 OPr9reDXuf5FxQ+kXIEPCudr5BJUt+yRbVvd6J3WqRzkOFMMAlOu60PwxroOxyHzMg
	 sUDWHLHKiZagg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DE2F46C47;
	Mon,  6 Apr 2026 14:42:42 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Mon, 06 Apr 2026 15:31:11 +0100
Subject: [PATCH v9 1/3] dt-bindings: hwmon: Document the LTC4283 Swap
 Controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-ltc4283-support-v9-1-b66cfc749261@analog.com>
References: <20260406-ltc4283-support-v9-0-b66cfc749261@analog.com>
In-Reply-To: <20260406-ltc4283-support-v9-0-b66cfc749261@analog.com>
To: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775486610; l=9689;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=dpLW/FJbkJTdEYKnbIi0pTDRPqeW7tODozYYmkat6BE=;
 b=af6PY1yfFLwRTEGXA9fRledfC3SBTjahvHACCV9CtCIf7vTmd6Z16n8Y1OcF7dRNUecTPv74p
 0S7r3/Zo9XLDZxYBlvpby62VwjYdUQcs4/vC+Fe/2C68Zj1mkES3QqX
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34714-lists,linux-gpio=lfdr.de,nuno.sa.analog.com];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[nuno.sa@analog.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,wiwynn.com:email,0.0.0.15:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,analog.com:email,analog.com:mid,analog.com:replyto,analog.com:url]
X-Rspamd-Queue-Id: CCE323A44E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 000000000000..05e2132ad4d8
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
+      If set, the MOSFET is not turned off when a FET fault is detected.
+    type: boolean
+
+  adi,tmr-pull-down-disable:
+    description: Disables 2uA pull-down current on the TMR pin.
+    type: boolean
+
+  adi,dvdt-inrush-control-disable:
+    description:
+      Disables dV/dt inrush control during startup. In dV/dt mode, the inrush
+      current is limited by controlling a constant output voltage ramp rate.
+      When disabled, the inrush control mechanism is active current limiting.
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
+    description: Retry to turn on the MOSFET after an external fault.
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
index e008c2bcc187..3f727d7fdfa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15161,6 +15161,12 @@ F:	Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
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
2.53.0



