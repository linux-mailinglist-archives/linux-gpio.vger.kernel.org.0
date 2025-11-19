Return-Path: <linux-gpio+bounces-28844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A8639C7100B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 21:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 482E2348AE6
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 20:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038B63431FA;
	Wed, 19 Nov 2025 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="I+r6SYXf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E997A30FC19
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 20:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763582605; cv=none; b=vA3ZVdJDiYZbirAMgCyaNDGymvqgwerxzwxzsnw/8tptAB+wGmV8jFP2WEzHNjL4fDj5PHiZ6QsfC1UtIr0f902OdOA1SAF8F4f8xTOThNflLBgeSjH5NqgcDjZ55CpPrzCjs2xOnI+65HbMzdE8Nkf7TaJLIXCJGvtXWCLgfNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763582605; c=relaxed/simple;
	bh=MH4NlN9GObGCNJMOwKNdOjfQUSg1ErAhcqXpKw1Ab8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mTeEGUL5PIGBwvsX6n97et05AskSXdzMwpPDj3psyp6ojbJ5JAniFKxmzb7cdvoU0Mu2TOOh/BkCQGBfvf804F/wp2uiA5EagthnqGzsTalD7LrAQpnOSfceQoB6+osAiZ0v3QRf818PjfoIamq1gU4IAyUxBihgx5QIUkF4ang=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=I+r6SYXf; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 8CDDD6A1E98;
	Wed, 19 Nov 2025 21:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1763582595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFP9Yxp2unkuQakaq7GpQexMflGV6h7uQKFGk9DOuxQ=;
	b=I+r6SYXfGWT13TpfWlsIM1X5zV5M0uFu0lT9Vvllw4NI4jpalZLy65l4B/lNGKJJk9YfwX
	MxzauvKLSVfsOZzcMSHm7H8g4w+E+3Zombav0tJJpEZxjEub8/3nuzk8QmLKxnP3h4TAUE
	P+LeauChdYMvPCsNGCHDXm2nrr89LNPYKN62XpvjXvHOIeZYajizjSG6tO/xhxWmTeEseB
	qXQ/vTRaQr5R1nVHoCCVlPx9LQbE+ZiGgTEizyAJdmNdl7BFWc+Nh5p3knFDBS2RTBzy+O
	0b1h4TrmfaFgEe/zxtT4Z7KtLZ3zNxOEHAhAkIFv6RcX5QXewhmQ2CAwbZbR6w==
From: Sander Vanheule <sander@svanheule.net>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v8 2/6] dt-bindings: mfd: Binding for RTL8231
Date: Wed, 19 Nov 2025 21:03:01 +0100
Message-ID: <20251119200306.60569-3-sander@svanheule.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251119200306.60569-1-sander@svanheule.net>
References: <20251119200306.60569-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding description for the Realtek RTL8231, a GPIO and LED
expander chip commonly used in ethernet switches based on a Realtek
switch SoC. These chips can be addressed via an MDIO or SMI bus, or used
as a plain 36-bit shift register.

This binding only describes the feature set provided by the MDIO/SMI
configuration, and covers the GPIO, PWM, and pin control properties. The
LED properties are defined in a separate binding.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v7:
- Add Rob's tag
- Add pincfg-node reference with no additional properties for
  input-debounce

Changes since v6:
- Relax description formatting
- Use absolute paths for schema references
- Add pinctrl properties to led-controller node in example
---
 .../bindings/mfd/realtek,rtl8231.yaml         | 199 ++++++++++++++++++
 1 file changed, 199 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml

diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
new file mode 100644
index 000000000000..e8227f15ea03
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
@@ -0,0 +1,199 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/realtek,rtl8231.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTL8231 GPIO and LED expander.
+
+maintainers:
+  - Sander Vanheule <sander@svanheule.net>
+
+description: |
+  The RTL8231 is a GPIO and LED expander chip, providing up to 37 GPIOs, up to
+  88 LEDs, and up to one PWM output. This device is frequently used alongside
+  Realtek switch SoCs, to provide additional I/O capabilities.
+
+  To manage the RTL8231's features, its strapping pins can be used to configure
+  it in one of three modes: shift register, MDIO device, or SMI device. The
+  shift register mode does not need special support. In MDIO or SMI mode, most
+  pins can be configured as a GPIO output or LED matrix scan line/column. One
+  pin can be used as PWM output.
+
+  The GPIO, PWM, and pin control are part of the main node. LED support is
+  configured as a sub-node.
+
+properties:
+  compatible:
+    const: realtek,rtl8231
+
+  reg:
+    description: MDIO or SMI device address.
+    maxItems: 1
+
+  # GPIO support
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description:
+      The first cell is the pin number and the second cell is used to specify
+      the GPIO active state.
+
+  gpio-ranges:
+    description:
+      Must reference itself, and provide a zero-based mapping for 37 pins.
+    maxItems: 1
+
+  # Pin muxing and configuration
+  drive-strength:
+    description:
+      Common drive strength used for all GPIO output pins, must be 4mA or 8mA.
+      On reset, this value will default to 8mA.
+    enum: [4, 8]
+
+  # LED scanning matrix
+  led-controller:
+    $ref: /schemas/leds/realtek,rtl8231-leds.yaml#
+
+  # PWM output
+  "#pwm-cells":
+    description:
+      Twos cells with PWM index (must be 0) and PWM frequency in Hz. To use
+      the PWM output, gpio35 must be muxed to its "pwm" function. Valid
+      frequency values for consumers are 1200, 1600, 2000, 2400, 2800, 3200,
+      4000, and 4800.
+    const: 2
+
+patternProperties:
+  "-pins$":
+    type: object
+
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml#
+      - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+    additionalProperties: false
+
+    properties:
+      pins:
+        items:
+          enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                 gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14, gpio15,
+                 gpio16, gpio17, gpio18, gpio19, gpio20, gpio21, gpio22, gpio23,
+                 gpio24, gpio25, gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
+                 gpio32, gpio33, gpio34, gpio35, gpio36]
+        minItems: 1
+        maxItems: 37
+      input-debounce: true
+
+      function:
+        description:
+          Select which function to use. "gpio" is supported for all pins, "led" is supported
+          for pins 0-34, "pwm" is supported for pin 35.
+        enum: [gpio, led, pwm]
+
+    required:
+      - pins
+      - function
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    // Minimal example
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        expander0: expander@0 {
+            compatible = "realtek,rtl8231";
+            reg = <0>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&expander0 0 0 37>;
+        };
+    };
+  - |
+    // All bells and whistles included
+    #include <dt-bindings/leds/common.h>
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        expander1: expander@1 {
+            compatible = "realtek,rtl8231";
+            reg = <1>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&expander1 0 0 37>;
+
+            #pwm-cells = <2>;
+
+            drive-strength = <4>;
+
+            button-pins {
+                pins = "gpio36";
+                function = "gpio";
+                input-debounce = <100000>;
+            };
+
+            pwm-pins {
+                pins = "gpio35";
+                function = "pwm";
+            };
+
+            led_matrix: led-pins {
+                pins = "gpio0", "gpio1", "gpio3", "gpio4";
+                function = "led";
+            };
+
+            led-controller {
+                compatible = "realtek,rtl8231-leds";
+                #address-cells = <2>;
+                #size-cells = <0>;
+
+                pinctrl-names = "default";
+                pinctrl-0 = <&led_matrix>;
+
+                realtek,led-scan-mode = "single-color";
+
+                led@0,0 {
+                    reg = <0 0>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_LAN;
+                    function-enumerator = <0>;
+                };
+
+                led@0,1 {
+                    reg = <0 1>;
+                    color = <LED_COLOR_ID_AMBER>;
+                    function = LED_FUNCTION_LAN;
+                    function-enumerator = <0>;
+                };
+
+                led@1,0 {
+                    reg = <1 0>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_LAN;
+                    function-enumerator = <1>;
+                };
+
+                led@1,1 {
+                    reg = <1 1>;
+                    color = <LED_COLOR_ID_AMBER>;
+                    function = LED_FUNCTION_LAN;
+                    function-enumerator = <1>;
+                };
+            };
+        };
+    };
-- 
2.51.1


