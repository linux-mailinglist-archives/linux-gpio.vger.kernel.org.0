Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2533A50D7
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jun 2021 23:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbhFLVPn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Jun 2021 17:15:43 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:48122 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbhFLVPk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Jun 2021 17:15:40 -0400
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:a4dd:c59:8cbd:ee0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id C491A20C9D0;
        Sat, 12 Jun 2021 23:13:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1623532417;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f5mr+MlnIy9lffstirWmm7R6i+j2XPTmdzJExTuP9HA=;
        b=YWFOokkP3Ny8wSOF+mq66dXtxsTaBmpYrOrOplgow/luS8yaURbKqwrJWDdUki3RzuFQbw
        CljUgM9O06V7C1UzImeUxT8xLt2ZOx8Q+Mh3ds+mUb840ygsgxtrNVj59giv9iOWSicuG5
        ezaHlZCjm2VgwlWCBReUbQQYylanZl6lAe//6otW7I22oF+qYygyTpHwihPAUxwKAx23Ti
        moUboIkkcym8xxXiJTaDH/PrPK94SLaYznL6ala/dHdqsuFIzkGlhj1uH1u5W9/WHytpBe
        e4MQ6Tb/Jw/CIfL//fpo0WOJNJDYxR0a0Yi698a0it6F+xdAp/6z0QhHy6tC2Q==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 4/8] dt-bindings: mfd: Binding for RTL8231
Date:   Sat, 12 Jun 2021 23:12:34 +0200
Message-Id: <2211fe04dca61d6ac806f16c3b94ab2fc998a267.1623532208.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623532208.git.sander@svanheule.net>
References: <cover.1623532208.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a binding description for the Realtek RTL8231, a GPIO and LED
expander chip commonly used in ethernet switches based on a Realtek
switch SoC. These chips can be addressed via an MDIO or SMI bus, or used
as a plain 36-bit shift register.

This binding only describes the feature set provided by the MDIO/SMI
configuration, and covers the GPIO, PWM, and pin control properties. The
LED properties are defined in a separate binding.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

---
v4:
- Add Rob's and Linus' review tags
---
 .../bindings/mfd/realtek,rtl8231.yaml         | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml

diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
new file mode 100644
index 000000000000..4e2326401560
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
@@ -0,0 +1,190 @@
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
+  pins can be configured as a GPIO output, LED matrix scan line/column, or as a
+  PWM output.
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
+    description: |
+      The first cell is the pin number and the second cell is used to specify
+      the GPIO active state.
+
+  gpio-ranges:
+    description: |
+      Must reference itself, and provide a zero-based mapping for 37 pins.
+    maxItems: 1
+
+  # Pin muxing and configuration
+  drive-strength:
+    description: |
+      Common drive strength used for all GPIO output pins, must be 4mA or 8mA.
+      On reset, this value will default to 8mA.
+    enum: [4, 8]
+
+  # LED scanning matrix
+  led-controller:
+    $ref: ../leds/realtek,rtl8231-leds.yaml#
+
+  # PWM output
+  "#pwm-cells":
+    description: |
+      Twos cells with PWM index (must be 0) and PWM frequency in Hz. To use
+      the PWM output, gpio35 must be muxed to its 'pwm' function. Valid
+      frequency values for consumers are 1200, 1600, 2000, 2400, 2800, 3200,
+      4000, and 4800.
+    const: 2
+
+patternProperties:
+  "-pins$":
+    type: object
+    $ref: ../pinctrl/pinmux-node.yaml#
+
+    properties:
+      pins:
+        items:
+          enum: ["gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6",
+                 "gpio7", "gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13",
+                 "gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20",
+                 "gpio21", "gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27",
+                 "gpio28", "gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34",
+                 "gpio35", "gpio36"]
+        minItems: 1
+        maxItems: 37
+      function:
+        description: |
+          Select which function to use. "gpio" is supported for all pins, "led" is supported
+          for pins 0-34, "pwm" is supported for pin 35.
+        enum: ["gpio", "led", "pwm"]
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
+                input-debounce = "100000";
+            };
+
+            pwm-pins {
+                pins = "gpio35";
+                function = "pwm";
+            };
+
+            led-pins {
+                pins = "gpio0", "gpio1", "gpio3", "gpio4";
+                function = "led";
+            };
+
+            led-controller {
+                compatible = "realtek,rtl8231-leds";
+                #address-cells = <2>;
+                #size-cells = <0>;
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
2.31.1

