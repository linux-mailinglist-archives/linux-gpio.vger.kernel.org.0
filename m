Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE4BF26CD70
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 22:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgIPU7j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 16:59:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:41296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726210AbgIPQag (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 12:30:36 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 33249208E4;
        Wed, 16 Sep 2020 15:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600271861;
        bh=mwfyYKJFeZITqcC9w7zWalo9zJ3c6qn+uP8pO8tqZTk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2XNMsAMn5xjxKI5EEvTgOkMnGgcZTQTeGswXgHaUtGSkF/gREa2oE1OUFAXJzK4rE
         6d7XD0xnuaSkXyqSp8VX8iUj6n/GQy83eH+6vobJRrXV27PaeQLUBKAzmmJHqfqvzw
         a/39TW1Cs26rKiXSMBEq5clso97LQKVAmtHL5xr0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 01/15] dt-bindings: gpio: convert bindings for NXP PCA953x family to dtschema
Date:   Wed, 16 Sep 2020 17:57:01 +0200
Message-Id: <20200916155715.21009-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916155715.21009-1-krzk@kernel.org>
References: <20200916155715.21009-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the NXP PCA953x family of GPIO expanders bindings to device tree
schema.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v2:
1. Add Rob's review tag

Changes since v1:
1. Use additionalProperties.
2. Add wakeup-source.
3. Add hogs.
4. Extend example with hogs.
---
 .../devicetree/bindings/gpio/gpio-pca953x.txt |  90 ----------
 .../bindings/gpio/gpio-pca95xx.yaml           | 166 ++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |   4 -
 3 files changed, 166 insertions(+), 94 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
deleted file mode 100644
index 3126c3817e2a..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ /dev/null
@@ -1,90 +0,0 @@
-* NXP PCA953x I2C GPIO multiplexer
-
-Required properties:
- - compatible: Has to contain one of the following:
-	nxp,pca6416
-	nxp,pca9505
-	nxp,pca9534
-	nxp,pca9535
-	nxp,pca9536
-	nxp,pca9537
-	nxp,pca9538
-	nxp,pca9539
-	nxp,pca9554
-	nxp,pca9555
-	nxp,pca9556
-	nxp,pca9557
-	nxp,pca9574
-	nxp,pca9575
-	nxp,pca9698
-	nxp,pcal6416
-	nxp,pcal6524
-	nxp,pcal9535
-	nxp,pcal9555a
-	maxim,max7310
-	maxim,max7312
-	maxim,max7313
-	maxim,max7315
-	ti,pca6107
-	ti,pca9536
-	ti,tca6408
-	ti,tca6416
-	ti,tca6424
-	ti,tca9539
-	ti,tca9554
-	onnn,cat9554
-	onnn,pca9654
-	exar,xra1202
- - gpio-controller: if used as gpio expander.
- - #gpio-cells: if used as gpio expander.
- - interrupt-controller: if to be used as interrupt expander.
- - #interrupt-cells: if to be used as interrupt expander.
-
-Optional properties:
- - interrupts: interrupt specifier for the device's interrupt output.
- - reset-gpios: GPIO specification for the RESET input. This is an
-		active low signal to the PCA953x.
- - vcc-supply:	power supply regulator.
-
-Example:
-
-
-	gpio@20 {
-		compatible = "nxp,pca9505";
-		reg = <0x20>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_pca9505>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
-	};
-
-
-Example with Interrupts:
-
-
-	gpio99: gpio@22 {
-		compatible = "nxp,pcal6524";
-		reg = <0x22>;
-		interrupt-parent = <&gpio6>;
-		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;	/* gpio6_161 */
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		vcc-supply = <&vdds_1v8_main>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-line-names =
-			"hdmi-ct-hpd", "hdmi.ls-oe", "p02", "p03", "vibra", "fault2", "p06", "p07",
-			"en-usb", "en-host1", "en-host2", "chg-int", "p14", "p15", "mic-int", "en-modem",
-			"shdn-hs-amp", "chg-status+red", "green", "blue", "en-esata", "fault1", "p26", "p27";
-	};
-
-	ts3a227@3b {
-		compatible = "ti,ts3a227e";
-		reg = <0x3b>;
-		interrupt-parent = <&gpio99>;
-		interrupts = <14 IRQ_TYPE_EDGE_RISING>;
-		ti,micbias = <0>;	/* 2.1V */
-	};
-
diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
new file mode 100644
index 000000000000..7ff6efadf797
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCA95xx I2C GPIO multiplexer
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - exar,xra1202
+      - maxim,max7310
+      - maxim,max7312
+      - maxim,max7313
+      - maxim,max7315
+      - nxp,pca6416
+      - nxp,pca9505
+      - nxp,pca9534
+      - nxp,pca9535
+      - nxp,pca9536
+      - nxp,pca9537
+      - nxp,pca9538
+      - nxp,pca9539
+      - nxp,pca9554
+      - nxp,pca9555
+      - nxp,pca9556
+      - nxp,pca9557
+      - nxp,pca9574
+      - nxp,pca9575
+      - nxp,pca9698
+      - nxp,pcal6416
+      - nxp,pcal6524
+      - nxp,pcal9535
+      - nxp,pcal9555a
+      - onnn,cat9554
+      - onnn,pca9654
+      - ti,pca6107
+      - ti,pca9536
+      - ti,tca6408
+      - ti,tca6416
+      - ti,tca6424
+      - ti,tca9539
+      - ti,tca9554
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 32
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  reset-gpios:
+    description:
+      GPIO specification for the RESET input. This is an active low signal to
+      the PCA953x.
+
+  vcc-supply:
+    description:
+      Optional power supply
+
+  wakeup-source:
+    $ref: /schemas/types.yaml#/definitions/flag
+
+patternProperties:
+  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+    type: object
+    properties:
+      gpio-hog: true
+      gpios: true
+      input: true
+      output-high: true
+      output-low: true
+      line-name: true
+
+    required:
+      - gpio-hog
+      - gpios
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@20 {
+            compatible = "nxp,pca9505";
+            reg = <0x20>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_pca9505>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-parent = <&gpio3>;
+            interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+
+            usb3-sata-sel-hog {
+                gpio-hog;
+                gpios = <4 GPIO_ACTIVE_HIGH>;
+                output-low;
+                line-name = "usb3_sata_sel";
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio99: gpio@22 {
+            compatible = "nxp,pcal6524";
+            reg = <0x22>;
+            interrupt-parent = <&gpio6>;
+            interrupts = <1 IRQ_TYPE_EDGE_FALLING>; /* gpio6_161 */
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            vcc-supply = <&vdds_1v8_main>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-line-names = "hdmi-ct-hpd", "hdmi.ls-oe", "p02", "p03",
+                              "vibra", "fault2", "p06", "p07", "en-usb",
+                              "en-host1", "en-host2", "chg-int", "p14", "p15",
+                              "mic-int", "en-modem", "shdn-hs-amp",
+                              "chg-status+red", "green", "blue", "en-esata",
+                              "fault1", "p26", "p27";
+        };
+
+        ts3a227@3b {
+            compatible = "ti,ts3a227e";
+            reg = <0x3b>;
+            interrupt-parent = <&gpio99>;
+            interrupts = <14 IRQ_TYPE_EDGE_RISING>;
+            ti,micbias = <0>; /* 2.1V */
+        };
+    };
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 25cfcc904240..442a1f537651 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -322,10 +322,6 @@ properties:
           - nuvoton,npct601
             # Nuvoton Temperature Sensor
           - nuvoton,w83773g
-            # Octal SMBus and I2C registered interface
-          - nxp,pca9556
-            # 8-bit I2C-bus and SMBus I/O port with reset
-          - nxp,pca9557
             # OKI ML86V7667 video decoder
           - oki,ml86v7667
             # OV5642: Color CMOS QSXGA (5-megapixel) Image Sensor with OmniBSI and Embedded TrueFocus
-- 
2.17.1

