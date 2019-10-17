Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27087DA969
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 11:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393948AbfJQJzq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 05:55:46 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34112 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727873AbfJQJzq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 05:55:46 -0400
Received: by mail-lj1-f196.google.com with SMTP id j19so1881078lja.1;
        Thu, 17 Oct 2019 02:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jX+HnufInW4hxvaQiS5z+45eckHZNv50/23oCsDsap8=;
        b=S1k7zL1kFyp95qNSZttzaUxh/AzXj3r5MYLtdaBsar1JY43XqQvex8e5Mji6tBsz3J
         +rfgY3rqY/pyuAMgJSDrCVtI/K5BphJIt7WF9Lv3slrbQMXnGmeg1l2e/cVuzsoM7I6W
         4AIh90cqds8qmS8pTw07vGF66CJDAcPZsAyhxH12RKfwPO8dIVMLwYuMUXvLhrmt32K/
         zEZLZbw7AqICtIqwYczObWknfRGgm1kRd1jCgNdzOsW3C7IHjwmPeuqX92eK7jezkjXc
         a+Hg8U09/d6zluPvYRl4S6H6WQ7zSE1Y7PUi4ckUGEY07H4pupiYB8XijYkPqCB+fSVg
         Je8w==
X-Gm-Message-State: APjAAAWRXIEAZfIKFNwPWbHK+1uNxpLDqcXfuWloTyNqZb4exWJMbGoC
        lL2bFrjhAolU7DgTGwbTZxg=
X-Google-Smtp-Source: APXvYqzxFR8CUmO7nIaPbc3K2xiOR2hD1UuMXcUoLTRIjGIPQJ3HugRb/3lQxSjLq2J4lNFoHw+nnQ==
X-Received: by 2002:a2e:b049:: with SMTP id d9mr1858035ljl.121.1571306140765;
        Thu, 17 Oct 2019 02:55:40 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id v21sm753731lfi.22.2019.10.17.02.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 02:55:40 -0700 (PDT)
Date:   Thu, 17 Oct 2019 12:55:26 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [RFC PATCH 12/13] dt-bindings: mfd: Document ROHM BD71282 bindings
Message-ID: <05841ff33ea166bc6934456a492adc3c67a90670.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

ROHM BD71828 Power management IC integrates 7 buck converters, 7 LDOs,
a real-time clock (RTC), 3 GPO/regulator control pins, HALL input pin
and a 32.768 kHz clock gate.

Document the dt bindings drivers are using.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 .../bindings/mfd/rohm,bd71828-pmic.txt        | 180 ++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt
new file mode 100644
index 000000000000..125efa9f3de0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt
@@ -0,0 +1,180 @@
+* ROHM BD71828 Power Management Integrated Circuit bindings
+
+BD71828GW is a single-chip power management IC for battery-powered portable
+devices. The IC integrates 7 buck converters, 7 LDOs, and a 1500 mA single-cell
+linear charger. Also included is a Coulomb counter, a real-time clock (RTC),
+and a 32.768 kHz clock gate.
+
+Required properties:
+ - compatible			: Should be "rohm,bd71828".
+ - reg				: I2C slave address.
+ - interrupt-parent		: Phandle to the parent interrupt controller.
+ - interrupts			: The interrupt line the device is connected to.
+ - clocks			: The parent clock connected to PMIC.
+ - #clock-cells			: Should be 0.
+ - regulators			: List of child nodes that specify the
+				  regulators. Please see
+				  ../regulator/rohm,bd71828-regulator.txt
+ - gpio-controller		: To indicate BD71828 acts as a GPIO controller.
+ - #gpio-cells			: Should be 2. The first cell is the pin number
+				  and the second cell is used to specify flags.
+				  See ../gpio/gpio.txt for more information.
+
+The BD71828 RUN state is divided into 4 configurable run-levels named RUN0,
+RUN1, RUN2 and RUN3. Bucks 1, 2, 6 and 7 can be either controlled individually
+via I2C, or some/all of them can be bound to run-levels and controlled as a
+group. If bucks are controlled individually these run-levels are ignored. See
+../regulator/rohm,bd71828-regulator.txt for how to define regulator voltages
+for run-levels. Run-levels can be changed by I2C or GPIO depending on PMIC's OTP
+configuration.
+
+Optional properties:
+- clock-output-names		: Should contain name for output clock.
+- rohm,dvs-vsel-gpios		: GPIOs used to control PMIC run-levels. Should
+				  describe two GPIOs. (See run-level control in
+				  data-sheet). If this property is omitted but
+				  some bucks are marked to be controlled by
+				  run-levels - then OTP option allowing
+				  run-level control via I2C is assumed.
+- gpio-reserved-ranges		: Usage of GPIO pins can be changed via OTP.
+				  This property can be used to mark the pins
+				  which should not be configured for GPIO.
+				  Please see the ../gpio/gpio.txt for more
+				  information.
+
+Example:
+
+        /* external oscillator node */
+        osc: oscillator {
+                compatible = "fixed-clock";
+                #clock-cells = <1>;
+                clock-frequency  = <32768>;
+                clock-output-names = "osc";
+        };
+
+	pmic: pmic@4b {
+		compatible = "rohm,bd71828";
+		reg = <0x4b>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <29 GPIO_ACTIVE_LOW>;
+		clocks = <&osc 0>;
+		#clock-cells = <0>;
+		clock-output-names = "bd71828-32k-out";
+		gpio-controller;
+		#gpio-cells = <2>;
+		ngpios = <4>;
+		gpio-reserved-ranges = <0 1 2 1>;
+		gpio-line-names = "EPDEN";
+		rohm,dvs-vsel-gpios = <&gpio1 12 0>,
+				      <&gpio1 13 0>;
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "buck1";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-ramp-delay = <2500>;
+				rohm,dvs-runlvl-ctrl;
+				rohm,dvs-runlevel0-voltage = <500000>;
+				rohm,dvs-runlevel1-voltage = <506250>;
+				rohm,dvs-runlevel2-voltage = <512500>;
+				rohm,dvs-runlevel3-voltage = <518750>;
+				regulator-boot-on;
+			};
+			buck2: BUCK2 {
+				regulator-name = "buck2";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-ramp-delay = <2500>;
+				rohm,dvs-runlvl-ctrl;
+				rohm,dvs-runlevel0-voltage = <500000>;
+				rohm,dvs-runlevel1-voltage = <506250>;
+				rohm,dvs-runlevel2-voltage = <512500>;
+				rohm,dvs-runlevel3-voltage = <518750>;
+				regulator-boot-on;
+			};
+			buck3: BUCK3 {
+				regulator-name = "buck3";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-boot-on;
+			};
+			buck4: BUCK4 {
+				regulator-name = "buck4";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+			};
+			buck5: BUCK5 {
+				regulator-name = "buck5";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+			};
+			buck6: BUCK6 {
+				regulator-name = "buck6";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-ramp-delay = <2500>;
+				rohm,dvs-runlvl-ctrl;
+				rohm,dvs-runlevel0-voltage = <500000>;
+				rohm,dvs-runlevel1-voltage = <506250>;
+				rohm,dvs-runlevel2-voltage = <512500>;
+				rohm,dvs-runlevel3-voltage = <518750>;
+				regulator-boot-on;
+			};
+			buck7: BUCK7 {
+				regulator-name = "buck7";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-ramp-delay = <2500>;
+				rohm,dvs-runlvl-ctrl;
+				rohm,dvs-runlevel0-voltage = <500000>;
+				rohm,dvs-runlevel1-voltage = <506250>;
+				rohm,dvs-runlevel2-voltage = <512500>;
+				rohm,dvs-runlevel3-voltage = <518750>;
+				regulator-boot-on;
+			};
+			ldo1: LDO1 {
+				regulator-name = "ldo1";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+			};
+			ldo2: LDO2 {
+				regulator-name = "ldo2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+			};
+			ldo3: LDO3 {
+				regulator-name = "ldo3";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+			};
+			ldo4: LDO4 {
+				regulator-name = "ldo4";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+			};
+			ldo5: LDO5 {
+				regulator-name = "ldo5";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+			};
+			ldo6: LDO6 {
+				regulator-name = "ldo6";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+			};
+			ldo7_reg: LDO7 {
+				regulator-name = "ldo7";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+			};
+		};
+	};
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
