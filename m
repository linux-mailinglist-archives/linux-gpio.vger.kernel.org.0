Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C262FB2E3
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 08:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730678AbhASHWg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 02:22:36 -0500
Received: from mail-lf1-f47.google.com ([209.85.167.47]:33451 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730597AbhASHWV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 02:22:21 -0500
Received: by mail-lf1-f47.google.com with SMTP id v67so27666645lfa.0;
        Mon, 18 Jan 2021 23:21:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yuol3XCJ+uJshcSsbfW6MAHHBCYuOW9vHmPszs5r2uE=;
        b=rGxBxQ7LXXkK8lzItN3KOdLaPLNCUc/T78n1VJ7bZo3pNILl8DA9muWiMvrKc7Kicu
         XfMX1qEMUhdH6S83aNQq4gzUmjeT6xV7+d+LHkEqhWQbRxH7EA/HvjcmUOJoG9E+HIK1
         +IIDbwqgiJajqGrSNGgbQ5r3rOlnQYKV049gTzG1g0tb3Tc0SMIHU1Aeq/6gqVDcPxzv
         tCUHmQDaw/cEab17SLz11qTCjktGR2wNlLKG9ls788Xp3eDwvcdUE0/4v8NN0zS08xuy
         STUkFNjfCur2CzRLvR/SPuikZnsY892/acViTvOFnsl3eeljozLR1bGkjozNoVnpVpoK
         HfOg==
X-Gm-Message-State: AOAM533h3oF8jae9t4ZSngtv8NvMS/iBlvoQitCSS8YUG39lQaRHiZ4M
        74JiSweFaicrKkQJZqzBXs8=
X-Google-Smtp-Source: ABdhPJwDDsr2dFWaDyEIXAFjRUepvFCDCV637htUh0CXr7GctVRcWaGSH+/U4uu3MEBdAj75hHalFA==
X-Received: by 2002:ac2:5234:: with SMTP id i20mr1240210lfl.71.1611040891700;
        Mon, 18 Jan 2021 23:21:31 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id o14sm2186188lfi.92.2021.01.18.23.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 23:21:31 -0800 (PST)
Date:   Tue, 19 Jan 2021 09:21:23 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v2 07/17] dt_bindings: mfd: Add ROHM BD71815 PMIC
Message-ID: <5e58cc041572d8540b4f1fbeea7bde955d6b2ea6.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document DT bindings for ROHM BD71815.

BD71815 is a single-chip power management IC mainly for battery-powered
portable devices. The IC integrates 5 bucks, 7 LDOs, a boost driver for
LED, a battery charger with a Coulomb counter, a real-time clock, a 32kHz
clock and two general-purpose outputs although only one is documented by
the data-sheet.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Changes since v1:
  - fixed patch ordering to meet ref dependencies
  - added missing blank lines
  - clkout-mode changed from string to tristated (uint)
  - added default for rsense resistor

 .../bindings/mfd/rohm,bd71815-pmic.yaml       | 202 ++++++++++++++++++
 1 file changed, 202 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml
new file mode 100644
index 000000000000..b52b8585d48d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/rohm,bd71815-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD71815 Power Management Integrated Circuit bindings
+
+maintainers:
+  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+
+description: |
+  BD71815AGW is a single-chip power management ICs for battery-powered
+  portable devices. It integrates 5 buck converters, 8 LDOs, a boost driver
+  for LED and a 500 mA single-cell linear charger. Also included is a Coulomb
+  counter, a real-time clock (RTC), and a 32.768 kHz clock gate and two GPOs.
+
+properties:
+  compatible:
+    const: rohm,bd71815
+
+  reg:
+    description:
+      I2C slave address.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      The first cell is the pin number and the second cell is used to specify
+      flags. See ../gpio/gpio.txt for more information.
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    const: bd71815-32k-out
+
+  rohm,clkout-open-drain:
+    description: clk32kout mode. Set to 1 for "open-drain" or 0 for "cmos".
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 1
+
+  rohm,charger-sense-resistor-ohms:
+    minimum: 10000000
+    maximum: 50000000
+    description: |
+      BD71827 and BD71828 have SAR ADC for measuring charging currents.
+      External sense resistor (RSENSE in data sheet) should be used. If
+      something other but 30MOhm resistor is used the resistance value
+      should be given
+      here in Ohms.
+    default: 30000000
+
+  regulators:
+    $ref: ../regulator/rohm,bd71815-regulator.yaml
+    description:
+      List of child nodes that specify the regulators.
+
+  gpio-reserved-ranges:
+    description: |
+      Usage of BD71828 GPIO pins can be changed via OTP. This property can be
+      used to mark the pins which should not be configured for GPIO. Please see
+      the ../gpio/gpio.txt for more information.
+
+  rohm,enable-hidden-gpo:
+    description: |
+      The BD71815 has undocumented GPO at pin E5. Pin is marked as GND at the
+      data-sheet as it's location in the middle of GND pins makes it hard to
+      use on PCB. If your board has managed to use this pin you can enable the
+      second GPO by defining this property. Dont enable this if you are unsure
+      about how the E5 pin is connected on your board.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - "#clock-cells"
+  - regulators
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pmic: pmic@4b {
+            compatible = "rohm,bd71815";
+            reg = <0x4b>;
+
+            interrupt-parent = <&gpio1>;
+            interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+
+            clocks = <&osc 0>;
+            #clock-cells = <0>;
+            clock-output-names = "bd71815-32k-out";
+
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            rohm,charger-sense-resistor-ohms = <10000000>;
+
+            regulators {
+                buck1: buck1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <2000000>;
+                    regulator-always-on;
+                    regulator-ramp-delay = <1250>;
+                    rohm,dvs-run-voltage = <1150000>;
+                    rohm,dvs-suspend-voltage = <950000>;
+                };
+                buck2: buck2 {
+                    regulator-name = "buck2";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <2000000>;
+                    regulator-always-on;
+                    regulator-ramp-delay = <1250>;
+                    rohm,dvs-run-voltage = <1150000>;
+                    rohm,dvs-suspend-voltage = <950000>;
+                };
+                buck3: buck3 {
+                    regulator-name = "buck3";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <2700000>;
+                    regulator-always-on;
+                };
+                buck4: buck4 {
+                    regulator-name = "buck4";
+                    regulator-min-microvolt = <1100000>;
+                    regulator-max-microvolt = <1850000>;
+                    regulator-always-on;
+                };
+                buck5: buck5 {
+                    regulator-name = "buck5";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                };
+                ldo1: ldo1 {
+                    regulator-name = "ldo1";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                };
+                ldo2: ldo2 {
+                    regulator-name = "ldo2";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                };
+                ldo3: ldo3 {
+                    regulator-name = "ldo3";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                };
+                ldo4: ldo4 {
+                    regulator-name = "ldo4";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                };
+                ldo5: ldo5 {
+                    regulator-name = "ldo5";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                };
+                ldo6: ldodvref {
+                    regulator-name = "ldodvref";
+                    regulator-always-on;
+                };
+                ldo7: ldolpsr {
+                    regulator-name = "ldolpsr";
+                    regulator-always-on;
+                };
+
+                boost: wled {
+                    regulator-name = "wled";
+                    regulator-min-microamp = <10>;
+                    regulator-max-microamp = <25000>;
+                };
+            };
+        };
+    };
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
