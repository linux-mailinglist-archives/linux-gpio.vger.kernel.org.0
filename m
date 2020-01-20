Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 583FB1426C7
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 10:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgATJNR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 04:13:17 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41224 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgATJNQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 04:13:16 -0500
Received: by mail-lf1-f67.google.com with SMTP id m30so23402625lfp.8;
        Mon, 20 Jan 2020 01:13:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c42gdyir9Zl1+AkdVvJbVr/Al7E8TdUa69C2tRQqLxU=;
        b=Ob06Vw/Mss8xeS24q5EH+6TK3zwk9eOVOcNTf2zxqnEY3Ev2RYK+7Oa+mThjyPEgjo
         RQNQDkIdS4Ge6Nw/2hlZlaesZvSFvNHDu9ragO0TPjelCWT2HwYks1Yxkci/9ctI5Yhw
         O5oNFCrkcTeMufnZP3jovf1P1Uj0rqnfoJB8O7A0TGpc6Q+naAOQ/9VMTJbWy7tpEBDf
         SFDldvVpobzIggSfIlZy7HdwzNt7z3m6mRuUws2n3R9f4LEJQt5LZV06sF0b83ERmLPL
         RJ8+sOarT3C2WemI+72D2drYeZUoHbm5WXghkhYdhXtIoTAmm3Bkdq5KpWJt8q3LGFyG
         wX3g==
X-Gm-Message-State: APjAAAUd1/46tePcslbrqIWipkyVvsxb/q6VciXaPAV8f3jkUR+fVmqi
        AwLC6q2mWXls8V+/4j4WztM=
X-Google-Smtp-Source: APXvYqzWTti5QrsBdHzYyBtbiu38NNhMzhXz7qScTFc9D2q75NNkwzrGaJjWRVQLAJDGog/UUOU6rQ==
X-Received: by 2002:ac2:5f49:: with SMTP id 9mr12604726lfz.151.1579511592692;
        Mon, 20 Jan 2020 01:13:12 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id b4sm761196lfo.48.2020.01.20.01.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 01:13:12 -0800 (PST)
Date:   Mon, 20 Jan 2020 11:13:00 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v12 02/10] dt-bindings: mfd: Document ROHM BD71828 bindings
Message-ID: <7b6aded7b8d2b956e16a9647563544d7ec775961.1579511114.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1579511114.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1579511114.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

ROHM BD71828 Power management IC integrates 7 buck converters, 7 LDOs,
a real-time clock (RTC), 3 GPO/regulator control pins, HALL input
and a 32.768 kHz clock gate.

Document the dt bindings drivers are using.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mfd/rohm,bd71828-pmic.yaml       | 193 ++++++++++++++++++
 1 file changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
new file mode 100644
index 000000000000..4fbb9e734284
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
@@ -0,0 +1,193 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/rohm,bd71828-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD71828 Power Management Integrated Circuit bindings
+
+maintainers:
+  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+
+description: |
+  BD71828GW is a single-chip power management IC for battery-powered portable
+  devices. The IC integrates 7 buck converters, 7 LDOs, and a 1500 mA
+  single-cell linear charger. Also included is a Coulomb counter, a real-time
+  clock (RTC), and a 32.768 kHz clock gate.
+
+properties:
+  compatible:
+    const: rohm,bd71828
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
+  rohm,charger-sense-resistor-ohms:
+    minimum: 10000000
+    maximum: 50000000
+    description: |
+      BD71827 and BD71828 have SAR ADC for measuring charging currents.
+      External sense resistor (RSENSE in data sheet) should be used. If some
+      other but 30MOhm resistor is used the resistance value should be given
+      here in Ohms.
+
+  regulators:
+    $ref: ../regulator/rohm,bd71828-regulator.yaml
+    description:
+      List of child nodes that specify the regulators.
+
+  leds:
+    $ref: ../leds/rohm,bd71828-leds.yaml
+
+  gpio-reserved-ranges:
+    description: |
+      Usage of BD71828 GPIO pins can be changed via OTP. This property can be
+      used to mark the pins which should not be configured for GPIO. Please see
+      the ../gpio/gpio.txt for more information.
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
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pmic: pmic@4b {
+            compatible = "rohm,bd71828";
+            reg = <0x4b>;
+
+            interrupt-parent = <&gpio1>;
+            interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+
+            clocks = <&osc 0>;
+            #clock-cells = <0>;
+            clock-output-names = "bd71828-32k-out";
+
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-reserved-ranges = <0 1>, <2 1>;
+
+            rohm,charger-sense-resistor-ohms = <10000000>;
+
+            regulators {
+                buck1: BUCK1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <2000000>;
+                    regulator-ramp-delay = <2500>;
+                };
+                buck2: BUCK2 {
+                    regulator-name = "buck2";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <2000000>;
+                    regulator-ramp-delay = <2500>;
+                };
+                buck3: BUCK3 {
+                    regulator-name = "buck3";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <2000000>;
+                };
+                buck4: BUCK4 {
+                    regulator-name = "buck4";
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+                buck5: BUCK5 {
+                    regulator-name = "buck5";
+                    regulator-min-microvolt = <2500000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+                buck6: BUCK6 {
+                    regulator-name = "buck6";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <2000000>;
+                    regulator-ramp-delay = <2500>;
+                };
+                buck7: BUCK7 {
+                    regulator-name = "buck7";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <2000000>;
+                    regulator-ramp-delay = <2500>;
+                };
+                ldo1: LDO1 {
+                    regulator-name = "ldo1";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+                ldo2: LDO2 {
+                    regulator-name = "ldo2";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+                ldo3: LDO3 {
+                    regulator-name = "ldo3";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+                ldo4: LDO4 {
+                    regulator-name = "ldo4";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+                ldo5: LDO5 {
+                    regulator-name = "ldo5";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+                ldo6: LDO6 {
+                    regulator-name = "ldo6";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+                ldo7_reg: LDO7 {
+                    regulator-name = "ldo7";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+            };
+
+            leds {
+                compatible = "rohm,bd71828-leds";
+
+                led-1 {
+                    rohm,led-compatible = "bd71828-grnled";
+                    function = LED_FUNCTION_INDICATOR;
+                    color = <LED_COLOR_ID_GREEN>;
+                };
+                led-2 {
+                    rohm,led-compatible = "bd71828-ambled";
+                    function = LED_FUNCTION_CHARGING;
+                    color = <LED_COLOR_ID_AMBER>;
+                };
+            };
+        };
+    };
-- 
2.21.0


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
